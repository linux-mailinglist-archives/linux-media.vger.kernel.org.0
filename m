Return-Path: <linux-media+bounces-2818-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAC981A3DC
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 17:09:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DA011C2295B
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 16:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9663C40C1E;
	Wed, 20 Dec 2023 16:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=horus.com header.i=@horus.com header.b="Mmid/PRd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.horus.com (mail.horus.com [78.46.148.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CE841766
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 16:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=horus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=horus.com
Received: from [192.168.1.22] (193-81-119-54.adsl.highway.telekom.at [193.81.119.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.horus.com (Postfix) with ESMTPSA id 4C282640EE;
	Wed, 20 Dec 2023 17:00:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=horus.com;
	s=20180324; t=1703088013;
	bh=KUIbYAFwkitNWUqPTRfctVGGi8+KP1yy0fMR4+kR+Yw=;
	h=From:To:Cc:Subject:Date:From;
	b=Mmid/PRdE/Z4KVjJ367WRShk2eXAO/71lGN9/lyuV1ZMdFZVUNdhc1Od4F06JZNth
	 4PXAUUQMV7AGFVLPOFH8IuQ29ucccPfiXXHtLmIqxb/t78xtALYvF4CTBCkYJphW03
	 3iF74rQbquVZU6/MmYOAO5YcLAMCL0Pqql1zZra0=
Received: by camel3.lan (Postfix, from userid 1000)
	id D0EA3541814; Wed, 20 Dec 2023 17:00:12 +0100 (CET)
From: Matthias Reichl <hias@horus.com>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>
Cc: Matthias Reichl <hias@horus.com>
Subject: [PATCH v4l-utils] keytable: fix segfault when reading legacy keymaps
Date: Wed, 20 Dec 2023 17:00:03 +0100
Message-Id: <20231220160003.84042-1-hias@horus.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit ae1492611432 ("keytable: remove line length limits")
ir-keytable crashes when reading keymaps in legacy (non-toml) format
and valgrind reports an UMR:

valgrind ir-keytable -w /etc/rc_keymaps/hiastest
...
==83788== Conditional jump or move depends on uninitialised value(s)
==83788==    at 0x48E8B8C: getdelim (iogetdelim.c:59)
==83788==    by 0x1105C6: getline (stdio.h:120)
==83788==    by 0x1105C6: parse_plain_keymap (keymap.c:98)
==83788==    by 0x1105C6: parse_keymap (keymap.c:533)
==83788==    by 0x112798: parse_opt (keytable.c:569)
==83788==    by 0x4986E50: group_parse (argp-parse.c:257)
==83788==    by 0x4986E50: parser_parse_opt (argp-parse.c:747)
==83788==    by 0x4986E50: parser_parse_next (argp-parse.c:867)
==83788==    by 0x4986E50: argp_parse (argp-parse.c:921)
==83788==    by 0x10E470: main (keytable.c:2071)

Fix this by properly initializing line to NULL so getline will allocate
a buffer instead of using some random memory locations.

Signed-off-by: Matthias Reichl <hias@horus.com>
---
 utils/common/keymap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/common/keymap.c b/utils/common/keymap.c
index 04c5ef54723c..21c1c0b5d581 100644
--- a/utils/common/keymap.c
+++ b/utils/common/keymap.c
@@ -75,7 +75,7 @@ static error_t parse_plain_keymap(char *fname, struct keymap **keymap, bool verb
 {
 	FILE *fin;
 	int line_no = 0;
-	char *scancode, *keycode, *line;
+	char *scancode, *keycode, *line = NULL;
 	size_t line_size;
 	struct scancode_entry *se;
 	struct keymap *map;
-- 
2.39.2


