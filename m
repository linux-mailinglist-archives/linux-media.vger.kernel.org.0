Return-Path: <linux-media+bounces-65539-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BWt3NL/CO2qWcQgAu9opvQ
	(envelope-from <linux-media+bounces-65539-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 13:42:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B2D6BDBF3
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 13:42:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mess.org header.s=2020 header.b=I6hW5hkF;
	dkim=pass header.d=mess.org header.s=2020 header.b=dAfzTAhr;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65539-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65539-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=mess.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E93C330F8B10
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 11:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC2A388E7D;
	Wed, 24 Jun 2026 11:39:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2624D3A6F19;
	Wed, 24 Jun 2026 11:39:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782301194; cv=none; b=ZYgq0RULKubmWNL3/acqnxPimL9v1lUYIeNJdIFY4dittG4KIb7wuOqpTc7GDmtpnugwthTaLztLBh/wXlaZRz8zI7w0OmPYS6xg/n+Dqo28z5BMe/KbwyEbi6pkKj1Lzu5kG0t09KQZ/HuKiP0b7skrv3YzWgYzb7wrd5xKyUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782301194; c=relaxed/simple;
	bh=g2CR3r4NXr+AjKM25exRdY5Qi6Hi8V8HBc5jxDlx1BA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lnzOTmiTBpndNxKfG0m+lz6pr3YNpVpLJl0I9xfeJ6B5yhcBo854ry1izFG72Tdh/2wZ03HWwQbwY72095AgxFBX4kRWpiLmu7B3Sv4Wnr/r+RgY9OxjjjqwAoGS0DxMxrEBnskoaEendurLDOFn+qMLu7SVdaxCgCrDgsufzRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=I6hW5hkF; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=dAfzTAhr; arc=none smtp.client-ip=92.243.27.206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1782301182; bh=g2CR3r4NXr+AjKM25exRdY5Qi6Hi8V8HBc5jxDlx1BA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I6hW5hkFpeyGUZQrNiiZh1VMq7tni8K8HNxK8xQqWgOaXtX4GyONLI28kCXDj8+bN
	 SqS6SDC3KKJ95C5ncy+HFYIrYSuHWYesh98NTVEOkYXA89CJxNqnLYxmAlrdKREvW9
	 3knJjE77fZCeGDkdOzewaLYvPtyPoBQdoOXrtppyf6nf8cX+l9/p1cd0unRq5EVce/
	 G3UCS2ccUlrEuvvFYJno0L0GZKvPUku21xBenPGGxutza3sxM7pnrOTHeWdi8y1VxM
	 NXe5L5Ijn0FzBldc5G7YWDB/rA7Pirz3ULHs2onD0LC/thfV5lyNM2bNIsSbEzAAUU
	 akVWEdeQrK+IQ==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 4E02942528; Wed, 24 Jun 2026 12:39:42 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1782301181; bh=g2CR3r4NXr+AjKM25exRdY5Qi6Hi8V8HBc5jxDlx1BA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dAfzTAhr0p3OQNBBxuvOgjRu+Sj8iPsbrPhvxwPJD65HjOHTNoZG36Oc9QGHkjkzy
	 VBK48MNJ6Rba3U4IM8N6JTFe0ZDLIQa9+RTg4H1PEVy2PB/4orVChBJVOxkG2DTexh
	 4ppUZj//cNeeGVZZ+dQTpakmeuMZpXV76uHNcYm/6gmsfU8Rq27PFwM59H9a8L5I39
	 S4LCPoHQCmiV3TcUIAPFaYuvHV34TV50LeebkIraPo3XbMSnuNLMioTsWO/7T7uDCR
	 i9xuh0rco0zgT9qa8kEWENQYHK/pIgD+26r7G5ihzHaOnPrtIkgZDqfet2cfClooaD
	 x5gewge42em0w==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 2D20142530;
	Wed, 24 Jun 2026 12:39:41 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] media: keymaps: Ensure module name matches RC_MAP_VIDEOMATE_K100
Date: Wed, 24 Jun 2026 12:39:20 +0100
Message-ID: <0a532ba0bdbe73275937fe4b118ae5d937c588d5.1782300922.git.sean@mess.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782300922.git.sean@mess.org>
References: <cover.1782300922.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mess.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mess.org:s=2020];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65539-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:sean@mess.org,m:mchehab@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[mess.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mess.org:dkim,mess.org:email,mess.org:mid,mess.org:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 41B2D6BDBF3

When loading a rc keymap, rc_map_get() attempts to load the kernel module
using the keymap name.

The rc_map RC_MAP_VIDEOMATE_K100 is defined to "rc-videomate-k100"
but the module is called rc-videomate-m1f.ko, so therefore automagic
loading the keymap will fail.

Rename the module to match.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/keymaps/Makefile                               | 2 +-
 .../rc/keymaps/{rc-videomate-m1f.c => rc-videomate-k100.c}      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename drivers/media/rc/keymaps/{rc-videomate-m1f.c => rc-videomate-k100.c} (97%)

diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
index d04572627cdd..38b84e34b225 100644
--- a/drivers/media/rc/keymaps/Makefile
+++ b/drivers/media/rc/keymaps/Makefile
@@ -129,7 +129,7 @@ obj-$(CONFIG_RC_MAP) += \
 			rc-twinhan1027.o \
 			rc-twinhan-dtv-cab-ci.o \
 			rc-vega-s9x.o \
-			rc-videomate-m1f.o \
+			rc-videomate-k100.o \
 			rc-videomate-s350.o \
 			rc-videomate-tv-pvr.o \
 			rc-videostrong-kii-pro.o \
diff --git a/drivers/media/rc/keymaps/rc-videomate-m1f.c b/drivers/media/rc/keymaps/rc-videomate-k100.c
similarity index 97%
rename from drivers/media/rc/keymaps/rc-videomate-m1f.c
rename to drivers/media/rc/keymaps/rc-videomate-k100.c
index 1f9be84ff27b..6664cfd0b7f3 100644
--- a/drivers/media/rc/keymaps/rc-videomate-m1f.c
+++ b/drivers/media/rc/keymaps/rc-videomate-k100.c
@@ -87,4 +87,4 @@ module_exit(exit_rc_map_videomate_k100)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Pavel Osnova <pvosnova@gmail.com>");
-MODULE_DESCRIPTION("videomate-m1f remote controller keytable");
+MODULE_DESCRIPTION("videomate-k100 remote controller keytable");
-- 
2.54.0


