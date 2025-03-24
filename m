Return-Path: <linux-media+bounces-28629-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3DCA6D9B4
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 13:02:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B6E216C563
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 12:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 847D025E821;
	Mon, 24 Mar 2025 12:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="abWSJ5wE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F24225E815;
	Mon, 24 Mar 2025 12:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742817729; cv=none; b=O4rDEuhjtqedkkw8KgsrlHonwW7TYjaBnPoJ4srOjeHdqsyzMvpnUK4hHfgvSrcUYfjDKYeLw+s1e6IpP7GrEAX0LR/Y0J3nvZMMVhpp6DseQjqf8ldFzNTXa66oycKMv0kgXJ7fWSR5jiq7duzQdhioZR/gWv2NIdy7j4EBFdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742817729; c=relaxed/simple;
	bh=c1QKgHwFnBo8MkQGY3HKlL/xP5qYB9h5Ux7/Tnezgd8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BBYC//CgZSHbVNjGpfxEAnjLSIqM0YvXT1uTldN4jcV7+Rf5yWeP5mrg0nVAiqxladUNalj1diJ6HJaCpTzaHMzXWzUd0q7In61/TIqt9uICXAXlaGsp8Llv2oQKZm6c999+V8lmonY5H/8qMMPKNDyghLstLjSB4UxOGTdqlco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=abWSJ5wE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:904a:b2d:8d57:4705:738e])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E5BF1059;
	Mon, 24 Mar 2025 13:00:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742817619;
	bh=c1QKgHwFnBo8MkQGY3HKlL/xP5qYB9h5Ux7/Tnezgd8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=abWSJ5wEfldymHHfhS77fhHzcLRWKEsqpdmZVc511F5xO08o0LROi4AhTSs+t7emY
	 EgYwtXJXoI7n24Yp+RqmGRSOo+nOFRBxbCBRoYPICAF2EM0E/HfE3fEt7yWbExDWNw
	 y4CeyohhbpcxkSPw9QrenDYEAmBFKUDJrkL3YLAA=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 24 Mar 2025 17:31:37 +0530
Subject: [PATCH 1/6] media: ti: j721e-csi2rx: Use devm_of_platform_populate
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-probe_fixes-v1-1-5cd5b9e1cfac@ideasonboard.com>
References: <20250324-probe_fixes-v1-0-5cd5b9e1cfac@ideasonboard.com>
In-Reply-To: <20250324-probe_fixes-v1-0-5cd5b9e1cfac@ideasonboard.com>
To: Jai Luthra <jai.luthra@linux.dev>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: Devarsh Thakkar <devarsht@ti.com>, 
 Rishikesh Donadkar <r-donadkar@ti.com>, Vaishnav Achath <vaishnav.a@ti.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=c1QKgHwFnBo8MkQGY3HKlL/xP5qYB9h5Ux7/Tnezgd8=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBn4Umx3Noe1q1GohrG4WiYr1ekT+uM4NvZVdaD9
 q/IRiI1MeiJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ+FJsQAKCRBD3pH5JJpx
 RdDOEACezuJCpc3Q41wTfl7wqC5d1GP2NCB0qUp8TRTttr9fsgRmCVPDb+RzmM3mNIQoKKKT7cm
 Y9SHLXRt/1eMQS33i0jm0+G7DpAsGVqVIFUxQqRwhK/sdsY2Ns8HJm+idKbPJikx3SeYDTVPlCi
 9tnNoBkUsYhEMX9fFEGazA2SUDPXQZVbWtjl3u9Akc/XnVPXLPJ/B6+xnNBU7926lVSjNKo/CX6
 /BreUNMrxmAz2TqOebgTT5mvTikjOLvayv24ZQVBrEWVj5OL4Wu7SXey1rEwDFFLBRwe9DnAuJe
 a2OOmVHf78WwjRNE5XTFkE0cikPSkkElTPln7DzjegXUCQmWbDy7xUcz5vHl4fNMKagpIE5IrMt
 Z6L3mtN9hZFysqjALs3YyR9sCxjAaF2W9VTTgEn6BDvyRggldRolH1aUajSCqbWOOSfhaDDmRuL
 cM75qLJNgmp7AIbqnm4FaH1JV56OPuHI7Znty8UhOmd8XD8YGcjRbQOnl26Ji93m8NkUI9gslhp
 KMrVPf7QsIJ//uTFeXXrsjt/UslpdQNVnZmkGMnuP01NQS04KymSu8hwMYfPFt0v8YryMpzyPl+
 SF0UQHlKwwfIIUkr59bDNP4Wfm8WBZJPuIuRa00nCZcroEeCyt14WMICEQp6/eHPjAdtGXBd/wH
 HIQNljvXGiuKU+A==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Ensure that we clean up the platform bus when we remove this driver.

This fixes a crash seen when reloading the module for the child device
with the parent not yet reloaded.

Fixes: b4a3d877dc92 ("media: ti: Add CSI2RX support for J721E")
Cc: stable@vger.kernel.org
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 6412a00be8eab89548950dd21b3b3ec02dafa5b4..a066024bf745450e2ba01d06c0fec4e6bdbfa97e 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -1118,7 +1118,7 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_vb2q;
 
-	ret = of_platform_populate(csi->dev->of_node, NULL, NULL, csi->dev);
+	ret = devm_of_platform_populate(csi->dev);
 	if (ret) {
 		dev_err(csi->dev, "Failed to create children: %d\n", ret);
 		goto err_subdev;

-- 
2.48.1


