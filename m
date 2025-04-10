Return-Path: <linux-media+bounces-29862-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4681A839CA
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 441BC165E69
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 06:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81896204697;
	Thu, 10 Apr 2025 06:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FJA3QV5c"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4275220409D;
	Thu, 10 Apr 2025 06:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267784; cv=none; b=uPSvAbltfRbD7QKdyI26x21z5PH4pfB21ks+AXImeE//r30QZYjBXvd3PjMOKaFlqvf4Jitpyrpa1EjJT2nZROzi4P7ypb0NbC63WaVARvtjxbtA3k4i3E+CuCzbdg+WBslHekraJ2RTgA1Nyl2jgRZRlBLSp5yGvLjNHM/hEtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267784; c=relaxed/simple;
	bh=8yoaM0B8HudLZSm5REmErvky9Qnf6koLsVNTwqxtdAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I6WlHaDPZlyc7EPDPZ6sXWzIJwM4b0wycGfx5rveMrPVWKHZRfZZon1PdGcVkooT5XzjgveAefsDZ7jZkSrlKHgAd2MQxsalN6Wu2lbr/Jj0DcNnhtqaJPeQrTnm8TXnLIEgyjWj5OkWmclBAWN49icZBRpj2VyzChsrisSDRX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FJA3QV5c; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:389d:1fcb:c0f8:ff7c:208d])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D2D42EE4;
	Thu, 10 Apr 2025 08:47:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744267663;
	bh=8yoaM0B8HudLZSm5REmErvky9Qnf6koLsVNTwqxtdAU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FJA3QV5cx6YwyEnPYiyeMks19B74sSXjCpURwLWzSTOQZbPcQNbK5fnzQNDym+Ws1
	 xe3n4+WMp1BpPdF1575qXz/aIK7C0pvvlxQdBMRZ4rAdW0eAKgqx48XkzfXgWbQ2hm
	 TXL22QMYjBoMSbReW9AHMPL3DPZSerT9nFtx1lg8=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 10 Apr 2025 12:18:59 +0530
Subject: [PATCH v2 1/6] media: ti: j721e-csi2rx: Use
 devm_of_platform_populate
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-probe_fixes-v2-1-801bc6eebdea@ideasonboard.com>
References: <20250410-probe_fixes-v2-0-801bc6eebdea@ideasonboard.com>
In-Reply-To: <20250410-probe_fixes-v2-0-801bc6eebdea@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1185;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=8yoaM0B8HudLZSm5REmErvky9Qnf6koLsVNTwqxtdAU=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBn92n3jv68vljTAj1EhTrtlmn3r7QTgOANT87QT
 gGqrR59Su+JAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ/dp9wAKCRBD3pH5JJpx
 RZ1zD/9fk1tfKH+RW1s1FBMIoybn6usRjSo2LUdbM0hraZUxeremvfZiGF4mMa0KCwcz5bssNtK
 8JggxNfrds9yH12+/rSJVW49iAPpJCMx/NJJyFEVBrNP784JJKk3HmjF3DiY9WMZVpS1yH8HwzC
 e814Zah7RRkYaIDvnfRbma1/pMCCVvfFOvm1iSEuQgaK4HMEzvMd7BQghuRFefYtYMmsnnEwSas
 Wco4Fm3T9z8UJmtrP4Eh2yK7g6zPekp1kTNKXs43qkZUdZg+KRe9wL5KbeHk926b/84yixc54IE
 Mw3QgnOtltkothxHykMJ76kS1sHuqe6bOwrWXRSDbjYLW1gpLTZ0ZfTsobRjsqqkKPhl8XdTtTY
 Qz/MHCQQ05/81NkKhC5IEAA5iQTxQFWIqonT/Rpz1kGW8LIi3WcE3JyAcHccC8Sk5QrDEnBiyHP
 EHoov/xHj6pcEQWjTp5piKBMgVFqhe+zAw6OsQ4IopRLcA85bYpc7d1OLwB0DsS6FqoehlR7atL
 69O/ntsS1/8PESqVqPs9xkn0YntcSyC11uZl7AeaKSmvLaHvy1MQ116a9jbuUZHy4U99603QLVG
 +j8aJAmu8JZDyHv2hRjSG4RbnIpOER7fbBFr4xUdPpqDHtbLXVXAMc/M4yi7aH/r8fKceOvmvBS
 15ge6Wq2eBY89Sg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Ensure that we clean up the platform bus when we remove this driver.

This fixes a crash seen when reloading the module for the child device
with the parent not yet reloaded.

Fixes: b4a3d877dc92 ("media: ti: Add CSI2RX support for J721E")
Cc: stable@vger.kernel.org
Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
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
2.49.0


