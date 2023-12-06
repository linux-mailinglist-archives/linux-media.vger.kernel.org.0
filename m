Return-Path: <linux-media+bounces-1730-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F85806B8A
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 11:13:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D77E2281DEC
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 10:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB692D052;
	Wed,  6 Dec 2023 10:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LwVWe7fY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 847F9D46;
	Wed,  6 Dec 2023 02:12:54 -0800 (PST)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi [91.158.149.209])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D3FFB14DC;
	Wed,  6 Dec 2023 11:12:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701857531;
	bh=FsHDUhUOSdmxO1qno4l01PDWe1nNLgupoeHmIzcStq0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LwVWe7fYRMeptio1qhiK7QyUSytVlcl8HZexC+03MTX0Ai/LY/NOYTIgzk4IKyDCF
	 W7ZO/hV36GBLi7DOq4B09njNrCAS8B4U+YWNJTTixxl9lakF1PDaLopc0ycamnzhUg
	 nvvPYthYsZEirxkRwvlYA1LW5091IxL7VHuTIQQk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 06 Dec 2023 12:12:28 +0200
Subject: [PATCH v2 1/4] media: rkisp1: Drop IRQF_SHARED
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231206-rkisp-irq-fix-v2-1-6ba4185eeb1f@ideasonboard.com>
References: <20231206-rkisp-irq-fix-v2-0-6ba4185eeb1f@ideasonboard.com>
In-Reply-To: <20231206-rkisp-irq-fix-v2-0-6ba4185eeb1f@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1223;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=FsHDUhUOSdmxO1qno4l01PDWe1nNLgupoeHmIzcStq0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlcEkg4oQWDIpxgRjng5riAxA98dypRcWlQusOt
 gHRf/zsXYaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZXBJIAAKCRD6PaqMvJYe
 9Qt2D/9VM6a4+9d6s6OGE5LzaUWHgDu2WoXfUkyZ+cD9Zb65uEiK6uQxQJRa7OEfRqn7Us0XlG9
 O56i09/y211GvZiwC4Q/CJlN7slXeGor51/DQsMvaEjmdeTwupE8XJ4Kp5Xb8IfkigKd8DcD6Ok
 oH/GFRJ6YA95YwQDnd7s3fVxawUE9t/z6jYCtF56e7cRJ9Tpzf/dXM5ebb8Ymiku0K4RCZpjuUr
 K8mTjmTacegvUqPofVSc6DJyoaqUucYfEpbTdYAilz7fqpLaLL0djdjytER7y4RGkv7CiuB46Dx
 lZdu9KXd1YHMrYJ02un7ETntsbO6Y9lg1lf4tFsyw2rU+lGtZlqBjeEFUbfFn1KkcXKkn3ubv5A
 7SCe1udyuRXV3tinIZ+oAGG9p1hLrBn1OwwHNLhxvYx0eDcKLMrwleRG7EhWe9WL1TNe6V/Ir9V
 iaJkQv919QYja1YKjjM7gnIZUZXM8qclZYVAb7P7XFfvPKOUTU8NH1Pa7Z0cahSvXmKdx3ZoK/A
 2WU0EK8+c4IVeJskD0I/oFzL/BUJMEl8LmyH4UpItj15RKAFzX5kjALNkC4fEm8bnskkmpVojT7
 J6zMWDC8ZpYY23v8iqK3Qv6JpJY8z89dKvPDVGpSA+aIyOqUZfm8AJMPLZYujbVVAombu0D4zQl
 qFV4XmjbLpJIIoQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

In all known platforms the ISP has dedicated IRQ lines, but for some
reason the driver uses IRQF_SHARED.

Supporting IRQF_SHARED properly requires handling interrupts even when
our device is disabled, and the driver does not handle this. To avoid
adding such code, and to be sure the driver won't accidentally be used
in a platform with shared interrupts, let's drop the IRQF_SHARED flag.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 2b9886fd0800..d4950294b7b9 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -573,7 +573,7 @@ static int rkisp1_probe(struct platform_device *pdev)
 		if (irq < 0)
 			return irq;
 
-		ret = devm_request_irq(dev, irq, info->isrs[i].isr, IRQF_SHARED,
+		ret = devm_request_irq(dev, irq, info->isrs[i].isr, 0,
 				       dev_driver_string(dev), dev);
 		if (ret) {
 			dev_err(dev, "request irq failed: %d\n", ret);

-- 
2.34.1


