Return-Path: <linux-media+bounces-57902-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPb9FMpuzWnvdQYAu9opvQ
	(envelope-from <linux-media+bounces-57902-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 21:15:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1302B37FBA6
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 21:15:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DCF813046402
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 19:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B0633F385;
	Wed,  1 Apr 2026 19:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dny7CnpC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3818F2DCC08
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 19:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775070916; cv=none; b=rgPe/oC7bEikp3Qdu3ecaVlNd4tp4az5zjO5LnJkLbwtYOgCiRooSXFnYVSCoWesnx6+7QFIip6hdftLVwHcyg/ar1X3fjdv8Cp5rPth4W5hyYLHAhyNqO3WHYXojWWk1G5tLWq35ACHDcMAbyYcw+s4PJ8W8S4lpyHPU866u0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775070916; c=relaxed/simple;
	bh=OJ8d86r1cv2Dz9K0VOKzDX9IeSSniN4yMPUR9rzI5RM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rQ9pGqCX06sT8LiVjU0xsvmGmW206O6Gm0VLuOdqg62fkaWH4mWyW1RRr7OPPayP6AGRr/DNU+ricyFxM2YhsreTOBYTa8NZwDemUBAhzr1yXXfF7Er6878jP5vc6YB2g1a5LV3lY2GfJAIDn+jcPdq5R+fXe82dVPHvgvBWfew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dny7CnpC; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a0fc5e2c59so149188e87.1
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 12:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775070912; x=1775675712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8KcYzflmFoH6kQuwH+mgkFuRmADtPPTvOe6lcVTKSM=;
        b=Dny7CnpCNdlmv3iC6DadIPaxvVN9/2eIvGIRRAm7mZOFh4HdnoaGtAdUG/hlmRrVNN
         u4jQN1lfVL+mvFD65dcVVdqY/1yGj2QGbdsW0abfsfEmJ7QjyCQn5A9k9XqzSOjXLx7d
         crvVhhIKuGbBHiIFplj+nqw1ukvhpLSP/3Hcq5HH8uEl6otDu9u9hdF7jOVoyiqyvm1v
         SJRnoKEW5hjWm6ZFoYbI/y+eTUPImevBcX+/Yhscx7S3Ut8QWL97/upzeg1kx/D5HVyu
         xUUed8oqHFzhEZTn2zKtgKXrJ1MKCOGvn4TrE//VQjBRxO8g8TVseVS1q8uBC3Io+O7B
         DP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775070912; x=1775675712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r8KcYzflmFoH6kQuwH+mgkFuRmADtPPTvOe6lcVTKSM=;
        b=LCxbQxNDUoBfS3E1Y5/+dR1lgbcmILN0xl6nzH4M4qJDSI2r2I0OIx/aO4pL9NaFQO
         /KfrkEQC4ivdh/WpkZK8QJwk9Dde5mPWDJLwTxoBgRlJTXPK0+IwdDkQQW1BmNkNCikr
         ENeX2U70IXrEng9rOtYF6RlluKHrcUnzjCTZvNNTGDo5rYojodvYVvU3/f0JbQK0gfVa
         yoNm3Ox2kuhiFphCzhNUIcltw2H5AJNmFqUoJqovpfsWAxzG3vSzO5Muo9nJ2+Nn0tmy
         QwjepJFlBZIRDsE1oBZoPLQyt5OIl5bBS8bDn2s2mliy9adDGBqT774IWtyFnpBScD88
         H+Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUZaydFtYiBShV+zPcBZnc/O5YSJS5lHUuxTubIonI7FQnW4ODsplx6+CiA4IaNy2WYfWGlEcz3vguJBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHHf1GNDxK4GVTSSyjKVFROeX/tfzhdjK9H6rJWjGmaIghF+hZ
	NnBZhewcnvQaLnSaibVa7Ja1ipFqUlewHmPhOsPp0/RHMYg729tkvODo
X-Gm-Gg: ATEYQzwaStnaUqSFnb7PUI2soGt/vN0PNwop3UD0Kx+keqgFjHrR6SqDQkNvm5lMMTo
	ZsujVSWXa2TI1N032LWCExhR6AEr3053WlUx5Sv0cFq7iVmJbTTfCMLpOOV1ZXV/YLSadSpkDm7
	VaRVYPj59MALKW0DWmIeQDLqtYefDy/E9/qCJKo49V3h4coSWD1geiCgyTaqpt13Mh2xsxgpNVi
	lFzzITiKlKAp3w/8lVA+yg/nKeFSyTenaNesy0Yji+K2QVyNB7MuKIhkuIxgXITUFKkHsLLpZJy
	LYIpv4U5/eUVVpFFy8cJu74JdxvMdt6X1rdQiM6ClfGv5yZ0Uv6xZIfTvuI5KM5fGzAvlh7JsHR
	xwSfTv4CfO0PPCmYcUUPA7bHUzdX4EuCfX/1x8ImbA9uRfMTbFjXNd1/VcidKlNs0twLKuxbBNq
	bFOI0z/FYpMvp1gjU5dKO3ZJEPIvhLlg2ox4tu
X-Received: by 2002:a05:6512:318e:b0:5a2:961a:f7c7 with SMTP id 2adb3069b0e04-5a2c7676402mr92043e87.21.1775070912245;
        Wed, 01 Apr 2026 12:15:12 -0700 (PDT)
Received: from new-nest ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ccca2dsm141855e87.60.2026.04.01.12.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 12:15:11 -0700 (PDT)
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: [PATCH 2/2] media: cedrus: Fix failure to clean up hardware on probe failure
Date: Wed,  1 Apr 2026 22:14:41 +0300
Message-ID: <20260401191441.1217646-2-andrej.skvortzov@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260401191441.1217646-1-andrej.skvortzov@gmail.com>
References: <20260401191441.1217646-1-andrej.skvortzov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-57902-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,sys-base.io,linuxfoundation.org,gmail.com,sholland.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[andrejskvortzov@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1302B37FBA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Samuel Holland <samuel@sholland.org>

From: Samuel Holland <samuel@sholland.org>

cedrus_hw_remove undoes, that was done by cedrus_hw_probe previously,
like disabling runtime power management, releasing claimed sram.

Signed-off-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 1d2130f35fffc..ee0e286add67d 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -477,7 +477,7 @@ static int cedrus_probe(struct platform_device *pdev)
 	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register V4L2 device\n");
-		return ret;
+		goto err_hw;
 	}
 
 	vfd = &dev->vfd;
@@ -538,6 +538,8 @@ static int cedrus_probe(struct platform_device *pdev)
 	v4l2_m2m_release(dev->m2m_dev);
 err_v4l2:
 	v4l2_device_unregister(&dev->v4l2_dev);
+err_hw:
+	cedrus_hw_remove(dev);
 
 	return ret;
 }
-- 
2.51.0


