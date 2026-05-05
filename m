Return-Path: <linux-media+bounces-60441-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFGdE1H++WkqFwMAu9opvQ
	(envelope-from <linux-media+bounces-60441-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:27:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E8F4CF600
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 56BB8307EC72
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 14:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6A45480DCC;
	Tue,  5 May 2026 14:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QrfgPQcw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED0848033A
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 14:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777991124; cv=none; b=c+xN1SM/6B+l6HBFSRBdWlIE2gGT8ld5+YM3tujG0osOTKU6vV2MKs+YIiswhDj7mT4i3JHJuMsMmO5nhfO+h2QE9HvX8DeVKZrEcyZ/+nWxyCtFC3/3eBOc6igx6dhNl0q9+Lgogc3ctIxmHGxlOhg2m4QpGv0nC/BJzJ37q2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777991124; c=relaxed/simple;
	bh=79Mr++4ywq5EgtUZ9PejVwzSpLuYUxCPpfWZYzB0SmE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=auNDFMzJ+9qN4yzb7pXwF+mdg5fX06oKCZeW+MBvzeLvP91IIFfwB9bZdsT8Z71KHNmBiBVyHOE3BDRsxjAJlUuoG+aAJe06nF1bzJWljbD17UaMzLvXDBFdCdvCUJAC2U99YTna9d3b1p/MGOT3+m6QekDUwgI6TlhEfnHFYak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QrfgPQcw; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-670ab084a39so2550000a12.3
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 07:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777991121; x=1778595921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pzlkHf4YEky1pO/hXCEL+6vJR7HxhQpNLg8+R2TR7cU=;
        b=QrfgPQcwHXvngsxz2H/Dk3lY09K9lWDc9EE8xVtirSNxHGi7MG7sJEHe+3f0lMJ2xr
         6vliTYMvL3ACFLoo8bkfg+ehAZP2Ya55gGky5GqNyWG4sdJ8Bwo/FMjfDBtcyQ83lLc/
         Oa8VftE6sVqiwUcGHlgyPy2LdteQikGceS5GWVW7I6vtccL9YCQf/9SA/N67cYjgN3Pk
         ncer8Bxbfk2N3ShJ/xWUBXehLCMjmcpFypmK2ruOEdobpg+M0U6EcgQr0MYhosXVj8jY
         1JqLqjBs9mlGpwAfFOdBK4WPUAAJnet/GzItUQg2njQ7GxRnMQU0Ab+I6ku3nOWoJHAr
         m8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777991121; x=1778595921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzlkHf4YEky1pO/hXCEL+6vJR7HxhQpNLg8+R2TR7cU=;
        b=O0g69JMEU4cJKUp81Poj7xPe9MR7JeX5WLlMUBIqFvZl0YG3coTnvA52FJP37g3aXf
         QKNH7rXiNljPdgnK4Nz25JeSKrMBVi/hvy5tyVq4Dp+bdh1f2kziLJAQz3OVBszVFero
         Zf79opmochUZKqBb/cnW+YvReCohlqqSbn5CMuJq5ox3pw7P/EPBPlgPqp/YWdsEVucf
         FPZEU8wbSOSo+X8mWFrCuGRyZzYLY7rw2Oggj2bsN5co1CsQOjaPMw+chUcMeJ0b4w95
         9yHrCtLHmq2HlhQcWyWI3jJWzN4y5eZMZzF3XLPIqN4yhr189v3Lb4noNIG2QnEs405J
         HBFQ==
X-Forwarded-Encrypted: i=1; AFNElJ/HWQYHcSy30Fi97y9HsRDkQgQ2edh8ah9jSKg4ORpAonRFZ1WYbOUOgMEoj3ma+jEjx7vfnQ7npdftkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjS1ZtlH4gXJTwXMEWS8Tx5pgrgi8+CUdmZTAbPCwU4lU8uouL
	GK+QZ2UnpYgJCItFJ2/fJJpP5pp4p/UsmZszU83rJYN9p4xPl4pWAaSN
X-Gm-Gg: AeBDieup1Hx31Y5Wqpc2Ep1TvYg6Ax8GKtS+vmBsBdxM1jrEm0b/d2B3/1kyFzDE+Kc
	FLCgyN9eVpWWe4xK+PP22xarxlN/HV2Ezaev3JSIp5VRJq8X+u8wLdhGeAce1DGUQpOwdAMgS8Q
	67iP8kJxPWbtMgzQsnmBEddFe9dMu362ruhyyhqSTEJpuPeN5aUWBQMGqaOEm1BJWfUDp4wJtvR
	tAoHwzOW3G0LH80uVsjnv+sFYoLbCJJ6bkKzX60lspjr3LYaS+E7a7P5P/0lQwVr7irp4vltcLQ
	SiEGi2jFgz5swfLc1KlM8gEeTgOvkd4UYtU/SHznNwsqLduU5b8rFMIA/g7IADWlfdx+f9iZCL+
	Y994lkyiyrqHIpWmkDIWJg0kVMA1IfjPKc8ufxxArQaD7OW0F+f++wEaFPqqct06H5+GL3Mr3wI
	gyN4PVcrKLtZnMjom1/Y4IEKrP+7BBEQ9S
X-Received: by 2002:a17:906:eeca:b0:ba5:dfa6:1e8e with SMTP id a640c23a62f3a-bc40f438b2fmr185301166b.5.1777991120735;
        Tue, 05 May 2026 07:25:20 -0700 (PDT)
Received: from avt74j0.. ([2a02:8109:8617:d700:a1d:902c:85c8:d272])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6a64d990sm511134366b.22.2026.05.05.07.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 07:25:20 -0700 (PDT)
From: Martin Hecht <mhecht73@gmail.com>
To: 
Cc: sakari.ailus@linux.intel.com,
	martin.hecht@avnet.eu,
	michael.roeder@avnet.eu,
	stable@vger.kernel.org,
	Martin Hecht <mhecht73@gmail.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] media: i2c: alvium: Fix controls for WB/AWB
Date: Tue,  5 May 2026 16:25:10 +0200
Message-ID: <20260505142513.1551721-1-mhecht73@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C3E8F4CF600
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,avnet.eu,vger.kernel.org,gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-60441-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhecht73@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.998];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

With that patch the controls for red-balance and blue-balance were created
only if the particular camera supports that. Otherwise the pointers on
the control variable are initialized with NULL to prevent side effects for
clustering with AWB control.

Fixes: 0a7af872915e ("media: i2c: Add support for alvium camera")
Signed-off-by: Martin Hecht <mhecht73@gmail.com>
---
 drivers/media/i2c/alvium-csi2.c | 37 ++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
index b62b45a4f2fc..4c6934e9e177 100644
--- a/drivers/media/i2c/alvium-csi2.c
+++ b/drivers/media/i2c/alvium-csi2.c
@@ -2108,26 +2108,33 @@ static int alvium_ctrl_init(struct alvium_dev *alvium)
 						  0, 0, &alvium->link_freq);
 	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
+	if (alvium->avail_ft.whiteb) {
+		ctrls->blue_balance = v4l2_ctrl_new_std(hdl, ops,
+							V4L2_CID_BLUE_BALANCE,
+							alvium->min_bbalance,
+							alvium->max_bbalance,
+							alvium->inc_bbalance,
+							alvium->dft_bbalance);
+		ctrls->red_balance = v4l2_ctrl_new_std(hdl, ops,
+						       V4L2_CID_RED_BALANCE,
+						       alvium->min_rbalance,
+						       alvium->max_rbalance,
+						       alvium->inc_rbalance,
+						       alvium->dft_rbalance);
+	} else {
+		/* set to NULL for v4l2_ctrl_auto_cluster if not existing */
+		ctrls->blue_balance	= NULL;
+		ctrls->red_balance = NULL;
+	}
+
 	/* Auto/manual white balance */
 	if (alvium->avail_ft.auto_whiteb) {
 		ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
 						   V4L2_CID_AUTO_WHITE_BALANCE,
 						   0, 1, 1, 1);
-		v4l2_ctrl_auto_cluster(3, &ctrls->auto_wb, 0, false);
-	}
-
-	ctrls->blue_balance = v4l2_ctrl_new_std(hdl, ops,
-						V4L2_CID_BLUE_BALANCE,
-						alvium->min_bbalance,
-						alvium->max_bbalance,
-						alvium->inc_bbalance,
-						alvium->dft_bbalance);
-	ctrls->red_balance = v4l2_ctrl_new_std(hdl, ops,
-					       V4L2_CID_RED_BALANCE,
-					       alvium->min_rbalance,
-					       alvium->max_rbalance,
-					       alvium->inc_rbalance,
-					       alvium->dft_rbalance);
+
+		v4l2_ctrl_auto_cluster(3, &ctrls->auto_wb, 0, true);
+	}
 
 	/* Auto/manual exposure */
 	if (alvium->avail_ft.auto_exp) {
-- 
2.43.0


