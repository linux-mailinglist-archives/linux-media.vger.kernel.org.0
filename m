Return-Path: <linux-media+bounces-53926-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iETFBP2mo2mWJAUAu9opvQ
	(envelope-from <linux-media+bounces-53926-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 03:39:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 627181CDC80
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 03:39:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 570D9310B937
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3524C2D948D;
	Sun,  1 Mar 2026 01:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hRlf//l0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB632C11DE;
	Sun,  1 Mar 2026 01:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328703; cv=none; b=XwenleRZ5dZZFeedsKTlr3fzw7GDjdXWKg1yY0gnW/RVYEd+qUT3e5y5DYp52Dx+Wyvm5JmHEnWMApzPw1J2q5Peb3dmWJtl/V5mjTTK5fS0baLfpmDccWrta5HDYQIq7FPfX5Q4HJ2hFz7tc76UvfuVJuQLuv9JfwiPfLhZA8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328703; c=relaxed/simple;
	bh=7g9lzUxypCuTookbM91sAsodfr5vNad/W+9B2lZ7jQE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cqu4hGz5fstFtNxevgb3aOVqE8deDGiBjEVY+DpUt2ulcjMtFM5TlkQpem9ZkWK6OPOjJ4b2txJmBtE3NBTSaxBRN2Bly7+EhgWL6XCfbK+kkHq3b/4iS1caYNkIP1wQuNaSHWfXB73otRoMamtT/H2uK98C7XMFhGqQk5yapDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hRlf//l0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4EB1C19421;
	Sun,  1 Mar 2026 01:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328703;
	bh=7g9lzUxypCuTookbM91sAsodfr5vNad/W+9B2lZ7jQE=;
	h=From:To:Cc:Subject:Date:From;
	b=hRlf//l0/Qi8nbzN3QQiQDejGAKuI6M9WQSxp1yU0EmxRNSBPZXubNaXDaCt6E9mJ
	 BZAUIPLT4Xs3Xs50Fgz+e07y0uNEBPurEWd66lFcFsdKza56hM1qm0PejaFtNdl1OO
	 F9qsO8uI8JryO5W8JgomAGgdtQDTSZIqqQWY/iMTWdePd78740jPcv4uPuhuzE+EAO
	 sJjev2CPzQAzLyljUNbRsDL0iSQLymNGDAdXCAVECerm6pZ4Kupp/r29TIBxWdzb4g
	 1EbQ5gjD75Hw5DELlgTHxCWMTCNXJ2A2HrLJXwGlrfz+MKGMPBs0jjbkNn5E2XpnI8
	 cz0C049eddk0Q==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	hansg@kernel.org
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c: ov01a10: Fix reported pixel-rate value" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:31:41 -0500
Message-ID: <20260301013141.1690352-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53926-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 627181CDC80
X-Rspamd-Action: no action

The patch below does not apply to the 6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 9c632eebf6af4cb7b0f85503fe1ebc5176ff0db1 Mon Sep 17 00:00:00 2001
From: Hans de Goede <hansg@kernel.org>
Date: Tue, 14 Oct 2025 19:40:10 +0200
Subject: [PATCH] media: i2c: ov01a10: Fix reported pixel-rate value

CSI lanes are double-clocked so with a single lane at 400MHZ the resulting
pixel-rate for 10-bits pixels is 400 MHz * 2 / 10 = 80 MHz, not 40 MHz.

This also matches with the observed frame-rate of 60 fps with the default
vblank setting: 80000000 / (1488 * 896) = 60.

Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hansg@kernel.org>
Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/ov01a10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index e5df01f979781..0b1a1ecfffd0e 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -16,7 +16,7 @@
 #include <media/v4l2-fwnode.h>
 
 #define OV01A10_LINK_FREQ_400MHZ	400000000ULL
-#define OV01A10_SCLK			40000000LL
+#define OV01A10_SCLK			80000000LL
 #define OV01A10_DATA_LANES		1
 
 #define OV01A10_REG_CHIP_ID		0x300a
-- 
2.51.0





