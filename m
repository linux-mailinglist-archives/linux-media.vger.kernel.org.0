Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0048614427E
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2020 17:52:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729085AbgAUQwO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jan 2020 11:52:14 -0500
Received: from gofer.mess.org ([88.97.38.141]:51785 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726555AbgAUQwN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jan 2020 11:52:13 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id BA174C635E; Tue, 21 Jan 2020 16:52:12 +0000 (GMT)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Camden Lindsay <camden.lindsay+kernel@gmail.com>
Subject: [PATCH v4l-utils] keytable: keymap without protocol is invalid
Date:   Tue, 21 Jan 2020 16:52:12 +0000
Message-Id: <20200121165212.441-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Without a protocol, keymap cannot be loaded and causes a segfault.

Reported-by: Camden Lindsay <camden.lindsay+kernel@gmail.com>
Signed-off-by: Sean Young <sean@mess.org>
---
 utils/common/keymap.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/utils/common/keymap.c b/utils/common/keymap.c
index d06deb59..6ca33745 100644
--- a/utils/common/keymap.c
+++ b/utils/common/keymap.c
@@ -169,6 +169,11 @@ static error_t parse_plain_keymap(char *fname, struct keymap **keymap, bool verb
 	}
 	fclose(fin);
 
+	if (!map->protocol) {
+		fprintf(stderr, _("Missing protocol in %s\n"), fname);
+		return EINVAL;
+	}
+
 	*keymap = map;
 
 	return 0;
-- 
2.24.1

