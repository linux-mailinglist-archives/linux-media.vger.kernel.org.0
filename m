Return-Path: <linux-media+bounces-48165-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A3EC9FB4C
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 16:54:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9CE823009948
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 15:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED75C31D75E;
	Wed,  3 Dec 2025 15:53:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095C0338593
	for <linux-media@vger.kernel.org>; Wed,  3 Dec 2025 15:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764777237; cv=none; b=lYr5mE/MYSHk+P61O0VQrWRhlpgkeL2Iv98jsMJDwCP4dorGwhnXR+ZUwmvIPQsmTPwS5n3qFmHjOGdCHbsmE/UvQqPCZIMnOMO2j86/QDp1EEYZ/nmEMB+CODzSUGTiwGfLdNRYPlaMLq9v5PXgFbxfd+UstqWeH7vjNp303VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764777237; c=relaxed/simple;
	bh=m3WXOlKOqAZcD7TuLqkO3TR27/awhMrA3k+6cS9jndo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TgaNFjUwSQAfYPnS+fxY6OfrzGH2uOWfd+b931YfoeghJjUJhVc1A+iwzAW3+FBdVeMh5W4EjEW4aS/qUi4WBHJ+d/QoXbPjLII3jBeEERXM9OYth7/pHWTXusRQ8Atwc1UpJom++X3Ewd1LXLJeZlEVuckqRIO7gAHl4UJoVOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1vQpAe-0007dW-5W; Wed, 03 Dec 2025 16:53:36 +0100
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 03 Dec 2025 16:52:37 +0100
Subject: [PATCH v2 15/22] media: rockchip: rga: share the interrupt when an
 external iommu is used
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251203-spu-rga3-v2-15-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
In-Reply-To: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Michael Olbrich <m.olbrich@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

From: Michael Olbrich <m.olbrich@pengutronix.de>

The RGA3 and the corresponding iommu share the interrupt. So in that
case, request a shared interrupt so that the iommu driver can request
it as well.

Signed-off-by: Michael Olbrich <m.olbrich@pengutronix.de>
Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index f28ec88c186fa..1bfc4021f4a7b 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -718,7 +718,8 @@ static int rga_probe(struct platform_device *pdev)
 		goto err_put_clk;
 	}
 
-	ret = devm_request_irq(rga->dev, irq, rga_isr, 0,
+	ret = devm_request_irq(rga->dev, irq, rga_isr,
+			       rga_has_internal_iommu(rga) ? 0 : IRQF_SHARED,
 			       dev_name(rga->dev), rga);
 	if (ret < 0) {
 		dev_err(rga->dev, "failed to request irq\n");

-- 
2.52.0


