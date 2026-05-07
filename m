Return-Path: <linux-media+bounces-60842-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YD9JA5K//GnSTAAAu9opvQ
	(envelope-from <linux-media+bounces-60842-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 18:36:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 622A84EC50D
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 18:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC2EB30528AA
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 16:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0FD93EFD15;
	Thu,  7 May 2026 16:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CLmlj65e"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BE6428833
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 16:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778171695; cv=none; b=kJ3SK8gl83DIeUu6EiVwUchrS0HHTNOM70xDG4+ehLzukLtYEwuH3v33vlRAsP2hmVSE9wIKQPiqmr8iKIVtCubGmSdAS6rMwULLCps9WLGNB2KxTlEsjmZuad+s9Riv0MELcBQW8LcS/9njpvTb1DDQi5cft5noUs8FherGqLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778171695; c=relaxed/simple;
	bh=67jMIhxSZ6IpyO4o5D89+eoatcvd8leasbTpm1BcyGI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GdcZld9C7OYKwzh4C15cb9Wt+tdG1kxXgWdf+sKtaCqZKl82iqUyU6KONTUiHy8uiHBV3ItSOpxmrKzfu+nUF3MFvQruRK1g+jnw7DkvHfLwZ3VFxJBk/znCfrvwyxmysO968tzkaN1TvCQl1+9SUsiwdfugXex4fF+9c2Qp09E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CLmlj65e; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-67389cf78b0so2044548a12.2
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 09:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778171691; x=1778776491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gG5C6gXZ/LiIqxaLiBv5dvLMMivS9UIn2zta7LN39yI=;
        b=CLmlj65ewinVQn5Sg45tMrPfXYD+5JiXKJuvYgKSk7rag090lkITNnWveSfUK/1Moi
         3R6jvEalAQtptfJ/apDs0ywpPB5diEg6xim+XqZ0XCY1iv0uOizS+d8++QFa+amLFtRp
         ZUcvSORoT6Qd0lYUHcdQl0rrwOAvy5qgiw3SKYakAuwAavRFq49NCk59Ub+tWBaGC46K
         cMOhK1GchPUlgDB7QYeKJHCTsNbdSCnYJ8rd+XLECK/aKXU2hqk69HFPWpmfW6e6ZYvJ
         RaozdZe0myr1gIWVR3C9VHPRPcZPUG1T6TlX2jV4wdi2YPXiqocgHdIkozDbz/8JcRvs
         gUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778171691; x=1778776491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gG5C6gXZ/LiIqxaLiBv5dvLMMivS9UIn2zta7LN39yI=;
        b=Zp/uY/P3oK+tXBwbvB/tIiXFJI5ET3+bEwSTzLpoDJcrdM1n3Xy3dw4dSt79k9AQZE
         eLrmz4LPXY9DFUeNCs+St+Xl29N75D4rn7FyEn2RwTn/cyLylIy9PhaVoibSHwVUCuE3
         nX3ln/MXkND79NikHfCkO+F+P49XzLh3ixBcyjx4nBSeIA/PdFx3bzNrXgwfWUFaK24Q
         03HpM/iHyHEeMRdSfgj8i23eEAyIlKOAJZ1xNiqLtpoTRONGKF7cIh157a7+eazFLmA0
         lF+EiKiEDb/0+RYgnTEZ9csE07Est01ynVox1Yjf0hv7rPNgIEo+JWGx1AlDzGd1Ere/
         6mGA==
X-Forwarded-Encrypted: i=1; AFNElJ8Hynbqb/igJLJTW+PI1kira5meJ09sDV/JmD3RbSDLLBK7N/gidBoPIgXhu2eimUYzm/e8FHnAb0OFcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YybsbpQdBIjJTq7nBYMk/rGD2h+FRv/ePSTo5Weo/kjtKTe0QLN
	uHMUJNZXZ8fkYFTrnnK7AshM3Z8Exnnp08/Qn0UbdwJ3Au7AjhZmH0C5NRPrDOX4
X-Gm-Gg: AeBDiesjlmK06NrBi+c4h3vzBuRWroQK1jZCDLVzRqgGjbUfeUfKLZUbFbto8e71JV/
	K0xbZuBmQ1yqFQfV++TACkInLXqdMsvknjmqSTZttXhdhgQ7XKAjgHRlU4PsB701vjVh+JYZnN7
	EAilNg0zqKVrrt4BSemAmebALSBsOt+3JCjeDJQjRS+hX9q1npv3NkO2qud7gl/mY65wSOh3C78
	iWoT2ifTwLW7y9iU+PMHBE4r09MouxZmQn7akC12o4ioVyzhGhHWU+D/IO2B/Wc6JIJ/B99y+Tr
	obn+hmeQjptMv4zs4V8jYzdhym8mK2m36uM/JiYpnmlyc0sHMTsT36Y99Z8bS2iuQ5azUisEUKq
	Ap8N4MQgOz1dPOzKQJfacjCOZh74YeJUYmlmWrRR8ZhuLea+DXRV7xB20mfTeQK4c8FXfCdnddM
	79Qe5pTupcdtmXEMFYQqZqQF941xXA2PMUMQ==
X-Received: by 2002:a17:907:3f24:b0:bc6:2bd3:8176 with SMTP id a640c23a62f3a-bc62bd388e2mr413967366b.35.1778171691229;
        Thu, 07 May 2026 09:34:51 -0700 (PDT)
Received: from avt74j0.. ([2a02:8109:8617:d700:d9bb:cdec:69e5:2f8e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67eb34dd33fsm8765a12.31.2026.05.07.09.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 09:34:50 -0700 (PDT)
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
Subject: [PATCH v1] media: i2c: alvium: fix critical pointer access in alvium_ctrl_init
Date: Thu,  7 May 2026 18:34:30 +0200
Message-ID: <20260507163443.39794-1-mhecht73@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 622A84EC50D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,avnet.eu,vger.kernel.org,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60842-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhecht73@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
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
index b62b45a4f2fc..947b32950efa 100644
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


