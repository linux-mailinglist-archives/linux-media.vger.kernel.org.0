Return-Path: <linux-media+bounces-60888-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPcEEMFs/Wm+dwAAu9opvQ
	(envelope-from <linux-media+bounces-60888-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 06:55:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB244F1C7B
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 06:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9040B30598C4
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 04:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66C333064A;
	Fri,  8 May 2026 04:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MmTxVs2y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E50931352A
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 04:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778216019; cv=none; b=uSWOpyZS2MkFZNerJ+oq/wZ1J7DtQ8Zohd/C+xFEVsYVtXYit29jNabv8fpGtRU0zsoysI0dKDUheVgbRpF2lbzYHHI6UkZrJxyz++VV1JXavPQHQWrOfb6ZpwanwEuWG6xUSSFffM0r5dWx6PS24W9ewPsKYi1rqALlKwPb6Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778216019; c=relaxed/simple;
	bh=iwMVIutDdnDY2VlIdGAfHBAMEdmf3NNOAqSKgNJVqmA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s2evaT9rLMoNkVD+x2d0LbA00Ho5lmMWdzZmnMNioSlzGZz02ZjB5hErdvAti5A6hkB1aEyYydrqW0WmaD9hKRddOJNV7Fb4XzaKrb7zj8n7AfbJ1LN9Hgjme3vcyyNpg4OmqJECQ/d0aIEUacGJUDqKbcrApvvaDKCGIfVfi98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MmTxVs2y; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso2222440a12.1
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 21:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778216016; x=1778820816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qPdNBnuNDaZZUCAN8oqndatEOhhJRZbEt+zuRV2X6ME=;
        b=MmTxVs2ygz544e2D6xj34DLwdi6vEvMEnYXhP+JFclJhE+4RA+chel299KRK2mIcsU
         /J6WTd4/1FFLvrgIHv2jCGLCH2wLt7sMQrPa/1IU+bxn0FpDmprmgoPv/4JoVvRzQOZH
         NH7kEs3+KYmVJmQOMqbR2jZ1oBEc5u1wQ1rA042L8qqMKmQ3FzL407AUF+3qLWD8e+Ej
         EPxqmm2L29hXXROPJkPrhSwdRuZeHI9lzaKXx3+RgDqkFACBadJD88ClMurrxc9Eedvw
         QFmuI84fN18DBztGvwWMjk01C4+pVOoYrKRo1yHUdaCxUxfbgyHx/QP/4QIclnHhQL3D
         HHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778216016; x=1778820816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPdNBnuNDaZZUCAN8oqndatEOhhJRZbEt+zuRV2X6ME=;
        b=jRKJxI30/Ik5axP5etReKE6APMYuVJUdMRdyIORFIYgjj0oRRBZJBvgwYfCAh3pk3w
         CyuADwOwB5NPXTCjnzDteLal7dn7EH/OIpzBdRtyU0PMFYIb2MbBCc1vxxvgeKHy37RN
         nGqYmaDYKFA/Tp7m2B1WooIAU7xJ7IY0W/6xgSaPnxX5dIsh2UQgJHd/izAo3i6V+qEQ
         7RETX8tSiiGZRDbDYAkczFzHM+8aHG+tBHIwVDDf8pMeQAsJrbgMPvneG3ed+zkW/PUK
         SCOm1UY61wJPMHTOAl7u3HQC9AEMnEwisUA/w4Jqt4eYEj4YE9Da1Du2w8XI8z36vo3w
         u4hw==
X-Forwarded-Encrypted: i=1; AFNElJ+6GK4JeksIATCrSFpdm5ZyT/e2h9T3Wcf0AEPqYoiMD9prDrvDmaevXY5AXWzJXychc6klxHHwX1D8KQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk6TI3aDD7AjiPE71Cina/yH+/8u3a0dTbPxKUmjapQMdhZphH
	10M0x68L9VeiABWTeh9ujWSxzUWudVGzLdDeTblBWSkk0ohRRPPBQ4uk
X-Gm-Gg: Acq92OFL6QhPa1/sxZlWupEI1+OxZ7glPGMjCvT7waZ5iz6Pv0hdFej4uTGqakip7Xf
	SFD19V4oSzL0pF2stSNI/0yQxYKqClAYJyFZP0SQtz0kPqufurOZT512KBuFvtnLbvT1Xq4gz+c
	CJMTY4SfKNEoJjmwQO22+vhlv2VFRWGWtoRj3GOoijOE8Hb6dM4imRLmDbe1rnOXfAySWcCGTEd
	yS0iNDIxUyEPmXVquF4jcp4mwrqNVwd+1pO9FBjuj61FjB9x/Z7swq/d0+0pKkiCMi2+RWWS7xX
	MgvCUy/4HpGRCqF+WUHf6TMjsAq5sMxOzbMDV6ehYX8ExPOwO+FkekwopwPDiBAwdKnrg0ypmNb
	gKK8kf5SxglGexcsRrgSh393ag28T1FG25VyNl4fmXAMcQ8cG5a63M0LndmWFjY02qrszt+yWuj
	R+EPVhI0sQ7r6XwyjfGuU4ybE=
X-Received: by 2002:a05:6402:5414:b0:672:7109:61a0 with SMTP id 4fb4d7f45d1cf-67ef0687822mr450598a12.9.1778216015715;
        Thu, 07 May 2026 21:53:35 -0700 (PDT)
Received: from avt74j0.. ([2a02:8109:8617:d700:d9bb:cdec:69e5:2f8e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0e1a221sm163332a12.24.2026.05.07.21.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 21:53:35 -0700 (PDT)
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
Subject: [PATCH v2] media: i2c: alvium: fix critical pointer access in alvium_ctrl_init
Date: Fri,  8 May 2026 06:53:28 +0200
Message-ID: <20260508045332.360004-1-mhecht73@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: ACB244F1C7B
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
	TAGGED_FROM(0.00)[bounces-60888-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhecht73@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The current implementation of alvium_ctrl_init creates several controls
in function alvium_ctrl_init and uses the returned pointer without
check. That can cause write access over NULL-pointer for several
controls.
The reworked code checks the pointers before adding flags and also it
creates controls for V4L2_CID_BLUE_BALANCE and V4L2_CID_RED_BALANCE only
if supported by the particular camera model.

Fixes: 0a7af872915e ("media: i2c: Add support for alvium camera")
Cc: stable@vger.kernel.org
Signed-off-by: Martin Hecht <mhecht73@gmail.com>
---
 drivers/media/i2c/alvium-csi2.c | 72 +++++++++++++++++++--------------
 1 file changed, 42 insertions(+), 30 deletions(-)

diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
index b62b45a4f2fc..43535ba7a264 100644
--- a/drivers/media/i2c/alvium-csi2.c
+++ b/drivers/media/i2c/alvium-csi2.c
@@ -2100,34 +2100,41 @@ static int alvium_ctrl_init(struct alvium_dev *alvium)
 					      V4L2_CID_PIXEL_RATE, 0,
 					      ALVIUM_DEFAULT_PIXEL_RATE_MHZ, 1,
 					      ALVIUM_DEFAULT_PIXEL_RATE_MHZ);
-	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	if (ctrls->pixel_rate)
+		ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	/* Link freq is fixed */
 	ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops,
 						  V4L2_CID_LINK_FREQ,
 						  0, 0, &alvium->link_freq);
-	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
-
-	/* Auto/manual white balance */
+	if (ctrls->link_freq)
+		ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	/* manual white balance */
+	if (alvium->avail_ft.whiteb) {
+		ctrls->blue_balance = v4l2_ctrl_new_std(hdl, ops,
+							V4L2_CID_BLUE_BALANCE,
+							alvium->min_bbalance,
+							alvium->max_bbalance,
+							alvium->inc_bbalance,
+							alvium->dft_bbalance);
+
+		ctrls->red_balance = v4l2_ctrl_new_std(hdl, ops,
+						       V4L2_CID_RED_BALANCE,
+						       alvium->min_rbalance,
+						       alvium->max_rbalance,
+						       alvium->inc_rbalance,
+						       alvium->dft_rbalance);
+	}
+
+	/* Auto white balance */
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
+		if (ctrls->auto_wb)
+			v4l2_ctrl_auto_cluster(3, &ctrls->auto_wb, 0, false);
+	}
 
 	/* Auto/manual exposure */
 	if (alvium->avail_ft.auto_exp) {
@@ -2136,7 +2143,9 @@ static int alvium_ctrl_init(struct alvium_dev *alvium)
 					       V4L2_CID_EXPOSURE_AUTO,
 					       V4L2_EXPOSURE_MANUAL, 0,
 					       V4L2_EXPOSURE_AUTO);
-		v4l2_ctrl_auto_cluster(2, &ctrls->auto_exp, 1, true);
+		if (ctrls->auto_exp)
+			v4l2_ctrl_auto_cluster(2, &ctrls->auto_exp,
+					       V4L2_EXPOSURE_MANUAL, true);
 	}
 
 	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops,
@@ -2145,15 +2154,8 @@ static int alvium_ctrl_init(struct alvium_dev *alvium)
 					    alvium->max_exp,
 					    alvium->inc_exp,
 					    alvium->dft_exp);
-	ctrls->exposure->flags |= V4L2_CTRL_FLAG_VOLATILE;
-
-	/* Auto/manual gain */
-	if (alvium->avail_ft.auto_gain) {
-		ctrls->auto_gain = v4l2_ctrl_new_std(hdl, ops,
-						     V4L2_CID_AUTOGAIN,
-						     0, 1, 1, 1);
-		v4l2_ctrl_auto_cluster(2, &ctrls->auto_gain, 0, true);
-	}
+	if (ctrls->exposure)
+		ctrls->exposure->flags |= V4L2_CTRL_FLAG_VOLATILE;
 
 	if (alvium->avail_ft.gain) {
 		ctrls->gain = v4l2_ctrl_new_std(hdl, ops,
@@ -2162,7 +2164,17 @@ static int alvium_ctrl_init(struct alvium_dev *alvium)
 						alvium->max_gain,
 						alvium->inc_gain,
 						alvium->dft_gain);
-		ctrls->gain->flags |= V4L2_CTRL_FLAG_VOLATILE;
+		if (ctrls->gain)
+			ctrls->gain->flags |= V4L2_CTRL_FLAG_VOLATILE;
+	}
+
+	/* Auto/manual gain */
+	if (alvium->avail_ft.auto_gain) {
+		ctrls->auto_gain = v4l2_ctrl_new_std(hdl, ops,
+						     V4L2_CID_AUTOGAIN,
+						     0, 1, 1, 1);
+		if (ctrls->auto_gain)
+			v4l2_ctrl_auto_cluster(2, &ctrls->auto_gain, 0, true);
 	}
 
 	if (alvium->avail_ft.sat)
-- 
2.43.0


