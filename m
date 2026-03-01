Return-Path: <linux-media+bounces-53943-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNE4AuGXo2lIHwUAu9opvQ
	(envelope-from <linux-media+bounces-53943-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:35:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B0C1CB0C2
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:35:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CC1213019806
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F001A2DEA74;
	Sun,  1 Mar 2026 01:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JhGkm+A3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CA42C033C;
	Sun,  1 Mar 2026 01:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328770; cv=none; b=eBGpXKdDQXRfqDWCXDWIHz+io4qGHSsCrNn9uB3T+SISeGkjouTGVmBI1MpszZvT6cezIdb9jxWwxm98bwUJsI+Xx3SEhOmFk2Pt453xPhRyi9B4wHBZbx9LRYfxwpVEBCBvbXUskunxbXoT6UQDt52yKnv50dTBjXw6+MLiToI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328770; c=relaxed/simple;
	bh=5nLNgNVtMzks8jb7vnpIYtG8JI1sZKNiG/e8cI5yKt8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KnC5PpfvE5g/YORB9AAW5vaI4nSIndE/w+7WWJv5ViHoOLHjZ6iEUn5HY+X2GD6UiWccGtIBQM7G1+M4fx13y3+osnZcYp+/bKfSfhDz1PkWDx7Xoo8VgyEOYh2xjagHLtajnuvxl6zKHkyi+raPnmVGeJm5hE0Ofs2+LEKIEH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JhGkm+A3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A43C0C19424;
	Sun,  1 Mar 2026 01:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328770;
	bh=5nLNgNVtMzks8jb7vnpIYtG8JI1sZKNiG/e8cI5yKt8=;
	h=From:To:Cc:Subject:Date:From;
	b=JhGkm+A3XE0MCLNNAb4El2ye912rApEIk44ei0iKMlPkvWNlWmFcb8LMdrlRRctYF
	 fX5mWa2KSI4PBHRrrh8KWYj7JJwE8rGw1PFWxQg9bBfcljMFmiEndAxL6ArbWe0IWV
	 yYNF8GEFjOQE6uhtAMJDnwQldcTh3ejMesAzjRLbhHSBgZZSU9AlRI39xih+IWmj7W
	 IkF8f3FsynB494SgrPV6RrvP+PqpHCERovrsK62mYXfE/3jrDRs1zTuumwBFBVKWr5
	 8wV7iRAFyIriPHlsXf7g7m9L0gh69uHTiNBwORl8La7KOllfx66Bg6J3wtVyX0FyeH
	 TLSO1GAGSo6eA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	mehdi.djait@linux.intel.com
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c: ov01a10: Fix digital gain range" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:32:48 -0500
Message-ID: <20260301013248.1691913-1-sashal@kernel.org>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53943-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: A6B0C1CB0C2
X-Rspamd-Action: no action

The patch below does not apply to the 6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 91848c99ed6a98daf77f4cb7d44cf3f13bc6998f Mon Sep 17 00:00:00 2001
From: Mehdi Djait <mehdi.djait@linux.intel.com>
Date: Thu, 8 Jan 2026 14:57:38 +0100
Subject: [PATCH] media: i2c: ov01a10: Fix digital gain range

Digital gain wraps-around at the maximum of 16838 / 0x3fff.
Fix the maximum digital gain by setting it to 0x3fff.

Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/ov01a10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 1aeba3df4cbfc..8a29e5b4b6ba0 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -63,7 +63,7 @@
 #define OV01A10_REG_DIGITAL_GAIN_GR	CCI_REG24(0x3513)
 #define OV01A10_REG_DIGITAL_GAIN_R	CCI_REG24(0x3516)
 #define OV01A10_DGTL_GAIN_MIN		0
-#define OV01A10_DGTL_GAIN_MAX		0x3ffff
+#define OV01A10_DGTL_GAIN_MAX		0x3fff
 #define OV01A10_DGTL_GAIN_STEP		1
 #define OV01A10_DGTL_GAIN_DEFAULT	1024
 
-- 
2.51.0





