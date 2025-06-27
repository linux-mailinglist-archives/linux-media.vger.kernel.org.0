Return-Path: <linux-media+bounces-36056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA709AEAC2C
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 03:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA75F5657E1
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 01:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A412D14EC5B;
	Fri, 27 Jun 2025 01:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XK3Uf5id"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936BC13CF9C;
	Fri, 27 Jun 2025 01:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750986420; cv=none; b=KbtDvDBzU5RdUIA3zxMVYckBvQT/NaH5VGcRKorIz4+bxKsItb6rAWi1adrtyyizrt6hnR5DI9B7qPiiQTU3re5MPmvQ2RSwMNRfIseMaAyaV4Q8raADFeGzKrzsYCVL5jTAW5yzVX2NpgzCi+4sduTKuxI2EMewl5ioN5wleLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750986420; c=relaxed/simple;
	bh=Zq7v0gOeQXkQkde+V7LMQ81ffBA100iMe4A2PEOeEwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XVFh6MhFoDFgJSKyKlWL8n3nsNpCdEkdQ78djjjyBjwb0B64bHGs9U2J30BE+46LBtfNWP+d/Ut0+NKvSUGtEzqCJEQOY4hKF2ellFv064ak9P+4M9KypZ4kHO0ZG2uDr8xjVrYZr7LiTrPVDt5P4PYaNtkp8iO9GPwcTj4OyTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XK3Uf5id; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2601:602:8100:c320::cf66])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 869F7819;
	Fri, 27 Jun 2025 03:06:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750986397;
	bh=Zq7v0gOeQXkQkde+V7LMQ81ffBA100iMe4A2PEOeEwk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XK3Uf5idArEWhABvGLbM6eTYKIJc51z93QzGx1GtUBmD5m0Cze4QklQCYeZQYzWwA
	 Ze46fzqGUP5glsZhflA2nlTCExoyGjsnYiu377ozSjKVv16n/1eOSIJS30Zh/bZs1c
	 iZg0kKLl7+XnjqAbS8TeCW1bH4Xx+/dVvKGY71yg=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 26 Jun 2025 18:06:06 -0700
Subject: [PATCH v3 1/6] media: ti: j721e-csi2rx: Use
 devm_of_platform_populate
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-probe_fixes-v3-1-83e735ae466e@ideasonboard.com>
References: <20250626-probe_fixes-v3-0-83e735ae466e@ideasonboard.com>
In-Reply-To: <20250626-probe_fixes-v3-0-83e735ae466e@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: Devarsh Thakkar <devarsht@ti.com>, 
 Rishikesh Donadkar <r-donadkar@ti.com>, Vaishnav Achath <vaishnav.a@ti.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, stable@vger.kernel.org, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1261;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=Zq7v0gOeQXkQkde+V7LMQ81ffBA100iMe4A2PEOeEwk=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBoXe6i3eBfV9htvJJmPj7KXwDePE15oiiMykWW4
 JO70cbSwamJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaF3uogAKCRBD3pH5JJpx
 RdJwD/9z1rTJBlcbsqs7y/ph5e6mapggVbhuQaDn7CT5U5zo3k0GgsJbY8U3c4bICfJZ4aIRgoa
 dcfe0cJgoAr/h76HLyplUzqEm0HvnxXJ0ne/2R6a7lAu6yibe9TkXTpCQ1+3Tvv08JpH2gx6sxT
 tN1s34CwEa30aCZY1hl86Xi9XijsH05vtgytbMAk7zIKX4wlZlkJ6GTH2OGFViW5R5cohOLoX5t
 3OhkKheXqdsFQLE8pMKo6QIPPjFr00nD6aX4tM0k+pcFthig9gZkyatZI+fGUMkqZoccvq4f4GC
 Hf5Fqr6MsMhQj5Se8mbGL2gebNy6yyiu1sSpbYituDdoolEOvoHIkV0MRleMdSnBYJZCRsn3Xby
 3k9OZYJ5kqmnhIx8iFJGLu/qTCu8ANJGtzjcQSJIFcIXeRrgzXwg0yvaogatZVJyxae7co8O6SF
 /TXvG3uLI4lGVwukzsbPf3hScTl/lgadBUHNhz7Qe7atf7ajbp2zctJr9uDIijMp04pzYl1uDGV
 3deFhI9ARlu2rXIChBwUPQTlqKX31YmSL9Z2sBHmmWL0G75+57uctsw6ZirI04abHtJT6CKry/t
 DBuBFdQTD2vIM7QwVrSqh0iE8zLcbUQTsP3bIj43Wij7c3QePvfvnhb5CnpFtygHcrEbuQzcAiq
 jhuPte6CAr//S3A==
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


