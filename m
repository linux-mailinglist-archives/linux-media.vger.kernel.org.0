Return-Path: <linux-media+bounces-1789-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BF7808238
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 08:58:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A08601F219B5
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 07:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9971E490;
	Thu,  7 Dec 2023 07:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="j3GkNDvn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 469EA110;
	Wed,  6 Dec 2023 23:58:12 -0800 (PST)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi [91.158.149.209])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F4A0552;
	Thu,  7 Dec 2023 08:57:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701935848;
	bh=9cT3QykxbLD1RZuf2nNkMCEwJrLc3YlDClLIwsiNFTs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=j3GkNDvnDs4SE1QMwdf9ygZitOHgt5Rx/8QsYtt5hLwIdfrwjORM9DWOsPwKwq/Oa
	 iKtEwPxFZ2CKYIt1XhU8cnifEolOcqGZ2YkDG5zLz97pwjcEy5dD6Au6daIpGnhUsy
	 cXTp6zqwXGmqe2xxNcIWos+Ft2Cj9WFkwTMHcZqM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 07 Dec 2023 09:57:45 +0200
Subject: [PATCH v3 1/4] media: rkisp1: Drop IRQF_SHARED
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231207-rkisp-irq-fix-v3-1-358a2c871a3c@ideasonboard.com>
References: <20231207-rkisp-irq-fix-v3-0-358a2c871a3c@ideasonboard.com>
In-Reply-To: <20231207-rkisp-irq-fix-v3-0-358a2c871a3c@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Paul Elder <paul.elder@ideasonboard.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, 
 kieran.bingham@ideasonboard.com, umang.jain@ideasonboard.com, 
 aford173@gmail.com, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1349;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=9cT3QykxbLD1RZuf2nNkMCEwJrLc3YlDClLIwsiNFTs=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlcXsN831kbcdE+KzyUv6idKjXKrqIhnG6TNS1D
 OTpfHssHDmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZXF7DQAKCRD6PaqMvJYe
 9RJCD/0ehqDlNFFaELNarL2vM7x+1JDvPK940PRigpoqjF2QKjOYRqtQE2+KtuyqkTzMYh6dh6x
 73/UNRxj4VTTUZWMttanlO9OkrF2Bi7tfxMCnvhovRpfjUtt4t8bgS9H6TW/qVUB1qgy0PIvD8a
 DYWpz2riAHiTZwIw0dZNxh0VEs/PeW84E9dClamt4Zkf6ZD3Oaw96XcUEujE34bg6aLAmvqmRPl
 4+NYGRZX+/cYJoqBhhCky7OVRCnsL7nIEGIfvwC0bcKatPHe9xzsJ+W0OGXTOxfcTAADt4dqxGL
 oe/eHs3Y725841gfpaUPSc4G9R44FvACgUFOawiYFHbX5cbvoaQt7uwc1EvkDCqb83e4PzyKQvV
 eyu5IsSbpEKsneN9mHqUawBnPh6fF4oQ5hW91/2qMHcRR84VUZ1Ykmcn+4pI3LAQ3ZSkg0S9t1D
 RGhLRy12mDNnAZ/gGq9bxQYq2RPC6VpQIvKpAvyc/UXb0A+poiQvE5RHqCZbmfNbgIf2ZTk/WH9
 k+o3dYfDBDpt5C7mFRk8dnIu5k0oYeBf5xxkhoxEhYZP9UbU0pblq54+qXqXLGYmekuqc0KZ0v/
 r4gWwLZ4gje1giJTB6Ch7nOWfaCxMPWsDB9HivLxrYwNN3ZXhzbZ5KhEuEepwY5xfBSX6977/fn
 5bq3I8XDLdOXqxw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

In all known platforms the ISP has dedicated IRQ lines, but for some
reason the driver uses IRQF_SHARED.

Supporting IRQF_SHARED properly requires handling interrupts even when
our device is disabled, and the driver does not handle this. To avoid
adding such code, and to be sure the driver won't accidentally be used
in a platform with shared interrupts, let's drop the IRQF_SHARED flag.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Adam Ford <aford173@gmail.com>  #imx8mp-beacon
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index c41abd2833f1..4c4514e20673 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -542,7 +542,7 @@ static int rkisp1_probe(struct platform_device *pdev)
 		if (irq < 0)
 			return irq;
 
-		ret = devm_request_irq(dev, irq, info->isrs[i].isr, IRQF_SHARED,
+		ret = devm_request_irq(dev, irq, info->isrs[i].isr, 0,
 				       dev_driver_string(dev), dev);
 		if (ret) {
 			dev_err(dev, "request irq failed: %d\n", ret);

-- 
2.34.1


