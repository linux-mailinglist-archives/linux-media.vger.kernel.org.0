Return-Path: <linux-media+bounces-39408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D45B201A1
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 10:21:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85317189BF9D
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 08:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4EFD2DAFD9;
	Mon, 11 Aug 2025 08:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="seF3dSQo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B462DAFA4;
	Mon, 11 Aug 2025 08:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754900470; cv=none; b=uMFC7vE1As1mHxuYylA/vybwn0gSdvTpBufd/y9aQiFkHaJxg3XIHjAFqOsQHbfWR9PT9PoPtnYUmFdc1ktelVCuSbRmwtm9qlaxMT0FXKI9zoF6IXxSCZyv8Om6v0YipdWzSY/0rLKEWTTdz0ui1IFVWZkP4W/9Adb5lhn5cX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754900470; c=relaxed/simple;
	bh=lSS0pVF3EOA0nBZI3FcDMTVEXoMTYUKovgqydt6TVsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p8Ux6ifUaSPLnJOSO55h48tHPCfNGETDUEkKkp0sokIqGNOyMSHoGv1aJg0gnQ5oJDQ0M6GMHvy8pGEk5YThrZnBLLS0HBhscUoF+3qNbz0YblUSh00/XgvEmooZYDz7OVBaATRPoNosQz+/ssK+VaIA4no0HJVeO1jySL8Qwgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=seF3dSQo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.81.143])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7FABA82A;
	Mon, 11 Aug 2025 10:20:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754900414;
	bh=lSS0pVF3EOA0nBZI3FcDMTVEXoMTYUKovgqydt6TVsI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=seF3dSQoBjX74vy5mVKNoLvyrTTHsNrwH8baVzg5n1KbrciSRA0EJW7/06ure09vl
	 5UEVKFClT/kyPSwpqKxvsIBD/7dPY/+uhPwPPBLr6KL1Klvev/0guKAzzIE35W4t7z
	 eyZTXZ9Gd9kND2pVWu4CHmJZVzCmf7URSV4Z89zQ=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 11 Aug 2025 13:50:13 +0530
Subject: [PATCH v4 1/6] media: ti: j721e-csi2rx: Use
 devm_of_platform_populate
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-probe_fixes-v4-1-aae22290f1d0@ideasonboard.com>
References: <20250811-probe_fixes-v4-0-aae22290f1d0@ideasonboard.com>
In-Reply-To: <20250811-probe_fixes-v4-0-aae22290f1d0@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Devarsh Thakkar <devarsht@ti.com>, 
 Rishikesh Donadkar <r-donadkar@ti.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1261;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=lSS0pVF3EOA0nBZI3FcDMTVEXoMTYUKovgqydt6TVsI=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBomafR5kZMz2l1bibxR7ZCJc3WSGz4jeaAjPKYw
 hEv81mtcIeJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaJmn0QAKCRBD3pH5JJpx
 Re3UD/95lkZpTM0yyJyxS4R63XtIQgq7aTl1uuqpYLqo8zDP6OOU1qfyelyqYS3qwNGPxcuUd5u
 Bqc4AJrmRewTHOxlz2tez9bbxrGmsXPmjrI4wMB8SHWmye9ldR1kReSUc0hL1zUKTJvFMUxJOXd
 Unid4/gxXuCBCWuNso/Nyk+HhT6UI9qYAjxoKAQ2kE8z/FcSzah4vLpHb1uKxAyznKNHZD3p0tk
 gk3+ZW8rfdP3r/AbskOGfRmYKy1db4bzVurRFcatojAp2wtfn/oZ496jPI1lHbB/uV3GLOthio8
 6BFJEooLLnlw4caSbYa+Zm8ZdS4m0kuDPfPCOpigtNqIh7EN0wAipOYlKq7NpXtsvqnrf25d0kc
 uDrmFOBJVK1SLHFogGU/FEuYkruBT+LkXiMKsyDkjBpl9tOHlyHZxevXTxwtpMycIXc2z3MFqDu
 MKuO79sJ3Iscq9qGQ43wlVTLg1acAHVpzGPcO5n/+h6/kCNoHqktFoYgJvTsEyV0TBGiyoLVe+0
 e8o3SYObOE5ccCZDIPApAGnyae+oCgYh8nBx38y2ZCRxaFly9mODznRM3HCepUM7bQ+N+uzcu1m
 4+W2bstNzvAmZFFVtxX1KSr7hOzOHup2tPOg5+pnfKbayc4JqNBZTYDx9P+2INQYbOf0bCi8DZ2
 PSpYm7KWc4L4WmQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Ensure that we clean up the platform bus when we remove this driver.

This fixes a crash seen when reloading the module for the child device
with the parent not yet reloaded.

Fixes: b4a3d877dc92 ("media: ti: Add CSI2RX support for J721E")
Cc: stable@vger.kernel.org
Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
Tested-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com> (on SK-AM68)
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index b628d6e081dbcb4dae06a236455228c168945660..6d4cccbe1fdea11f6aefd63a985a9a3c16a7a9fe 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -1120,7 +1120,7 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_vb2q;
 
-	ret = of_platform_populate(csi->dev->of_node, NULL, NULL, csi->dev);
+	ret = devm_of_platform_populate(csi->dev);
 	if (ret) {
 		dev_err(csi->dev, "Failed to create children: %d\n", ret);
 		goto err_subdev;

-- 
2.50.1


