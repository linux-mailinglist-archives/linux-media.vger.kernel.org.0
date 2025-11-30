Return-Path: <linux-media+bounces-47900-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD41C95255
	for <lists+linux-media@lfdr.de>; Sun, 30 Nov 2025 17:21:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0E18F4E07E9
	for <lists+linux-media@lfdr.de>; Sun, 30 Nov 2025 16:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871352BE625;
	Sun, 30 Nov 2025 16:21:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B713011CAF
	for <linux-media@vger.kernel.org>; Sun, 30 Nov 2025 16:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764519712; cv=none; b=k5F+ImrhaqY2aJwB2nHHZdI9RWMAKD57jN8J/Yj0ys0ZAr/GkGvte7IvJEVAiNij6AIOOkBpv8SQzH8pspV4ZkxiYvgNZ8pF3f1DvmGeKS1PezFAdBfoPihEvnakr3YxrUyZTgPHutuzCxfwqCsAoIq0dlSyNubMQopI/5j/77k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764519712; c=relaxed/simple;
	bh=n1nHu/cu6PiWaP0RryVL6Q08fB2qIVclHOL6ETqvCDs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VH8rFp876/i/hzFSEaOHN4KIfIZi7jTSOUZQNIzGHRlHOMxCXQld7XSLi0MkX8fl8ucw8GfGVfpa5mFWysUpIMs83HrA4rT0d/+bFJALLttbOHMEDvkM95m+zHd6kbONqQBZKIg14shEZ6EtSpcKYdOET8pv6qGGBssej6YsGHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from symphony.aura.home.arpa (1.6.f.8.d.6.4.c.c.6.b.d.4.0.8.d.c.6.e.0.c.6.2.0.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:26c:e6c:d804:db6c:c46d:8f61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: chewi)
	by smtp.gentoo.org (Postfix) with ESMTPSA id A6545340EA8;
	Sun, 30 Nov 2025 16:21:49 +0000 (UTC)
From: James Le Cuirot <chewi@gentoo.org>
To: linux-media@vger.kernel.org
Cc: James Le Cuirot <chewi@gentoo.org>
Subject: [PATCH v4l-utils] bpf: Use C locale when determining Linux headers
Date: Sun, 30 Nov 2025 16:21:23 +0000
Message-ID: <20251130162122.9594-2-chewi@gentoo.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Otherwise the sed pattern may not match.

Signed-off-by: James Le Cuirot <chewi@gentoo.org>
---
 utils/keytable/bpf_protocols/cc_sys_includes.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/keytable/bpf_protocols/cc_sys_includes.sh b/utils/keytable/bpf_protocols/cc_sys_includes.sh
index 0a8fa277..902b704e 100755
--- a/utils/keytable/bpf_protocols/cc_sys_includes.sh
+++ b/utils/keytable/bpf_protocols/cc_sys_includes.sh
@@ -6,5 +6,5 @@
 #
 # Use '-idirafter': Don't interfere with include mechanics except where the
 # build would have failed anyways.
-"$@" -v -E - </dev/null 2>&1 \
+LC_ALL=C "$@" -v -E - </dev/null 2>&1 \
 	| sed -n '/<...> search starts here:/,/End of search list./{ s| \(/.*\)|-idirafter \1|p }'
--
2.52.0

