Return-Path: <linux-media+bounces-37990-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F4FB08B31
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0486C1C24BE8
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 10:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 078162DBF5D;
	Thu, 17 Jul 2025 10:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BrD1IhGT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E566B2D9EE7;
	Thu, 17 Jul 2025 10:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752749187; cv=none; b=OML+bDUMlOaZ4FAQxxUPx+2WVSQdSYt1rJvGcUtj6PH3ZbFBDdX1TgqSvrj1AtYGO4T0tENzjk6mdcZqRjLynEPFMGvQdehXQHI907EOYAJFc/Oct67jlAQyHJiXBnUqrca0U7KelPWpF7crKUSearvjuuamzixdDNju8ZNokYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752749187; c=relaxed/simple;
	bh=veD5bCafCFdh1GJ2SEAikts/NXjEHZdIvuKFJ7cMJ+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TxQpnWYhriAwn4Kh5VWWO7T1AdPZacQwkP6JZTfbwVenB7XCG67cb7PES8CnuEBrNVEV2fDtpBW4Oadg5u/fhTyQxfHrsW7FpDYjLuBnMiI8R0p4jnwEmkBaE3CuF44aG/zihGP6Wo0zVhD+9ZfCpbC1Lxg4SKWXpB1Yk3Hgt70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BrD1IhGT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-140-254.net.vodafone.it [5.90.140.254])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD40E21F2;
	Thu, 17 Jul 2025 12:45:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752749147;
	bh=veD5bCafCFdh1GJ2SEAikts/NXjEHZdIvuKFJ7cMJ+I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BrD1IhGTWABRNCLptFDK6B2BG+aNtn5V2O8P7iT8TFlXY2TVKXZ3oVX2NvecRkAtG
	 A10+98QdZn1Y70fvBsT4sEXHihkJpX2Bsvp0LgjcoV+YMXlhUszsRS54d8aFTkdOIv
	 reVy7OIWUATev7qnUsj+4hviUokkock5b2Gvxj9A=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 17 Jul 2025 12:45:51 +0200
Subject: [PATCH DNI 25/26] media: pisp_be: Register devnode to userspace
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-multicontext-mainline-2025-v1-25-81ac18979c03@ideasonboard.com>
References: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
In-Reply-To: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1240;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=veD5bCafCFdh1GJ2SEAikts/NXjEHZdIvuKFJ7cMJ+I=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoeNRREpXqgCve0J6ofHIN6a1A+7ldn/yTcHDdL
 1B9xdg25KWJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaHjUUQAKCRByNAaPFqFW
 PEQ1D/90/rpes/8rJaL1PpQbGCrRfT1XMHhyFHUNb/dkqPzOtYdBmhVzf8FhN5C+4sH1ONE38mv
 IfRq218bZFaln6qGAB45EMK3euim6tJb3Lw+vMCmgpSnNQjd/J9yBnGb49ZGoCXUscsAIZprBCE
 qzKjmZOE+S+fQDxoxlILFlNzrIVRITViA3YGtXK1Avzc5fIQw9TE4SOHX5GoBBGKlYIhiB8vWZK
 Xys0e+BQ9BTDn9TE2J7HAaDkQHkGuFGB+bdIj6TydwKMzisjENEFdubINbDO7RbrZljuxs9br91
 n84gh+ojvCebu1Pu6kHyFQdZQF0LlHL+FoWq/TScV4MajMB9XE67rp02fCO0PkNl6UdOuN9QuJT
 5O8R8j3UynCIOrhvpD9d3lkIfZg2zL2A0C4J8ddK80a5luABOqH4gFS9Oqbk84IZcc58AHwvtZB
 FzQjK14Jx5y+o/ZKMdCX3mtMJdjebdaQD2fgV9/kzwgzFwFYcj9HZcf6zvdP9PTKQpkgch7RC63
 EPgXlh/8bkNbwr+zEnJzhDXMnaKufVwth8sZAxy3QR/06GrDSQARuRhuIMC95XLXLtD7idEIsma
 Vdztnoki6OCWrCAQpBcADWs2uxiRo6d8j+xtFQJwSVLyEwQaPWafrdiEUWH0KAp53nSHnRPuXG5
 b2+er40/ZWwL2vw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

To set formats on the subdev, we need to have the devnode registered to
userspace.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 2a8c09a9c70952c9f99e542271e994d62392c617..df3cdd81843376abf98bb184cde74d4d66b0ecfe 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -1635,6 +1635,7 @@ static int pispbe_init_subdev(struct pispbe_dev *pispbe)
 	v4l2_subdev_init(sd, &pispbe_sd_ops);
 	sd->internal_ops = &pispbe_subdev_internal_ops;
 	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
+	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
 	sd->entity.ops = &pispbe_subdev_entity_ops;
 	sd->owner = THIS_MODULE;
 	sd->dev = pispbe->dev;
@@ -1658,7 +1659,7 @@ static int pispbe_init_subdev(struct pispbe_dev *pispbe)
 	if (ret)
 		goto error;
 
-	return 0;
+	return v4l2_device_register_subdev_nodes(&pispbe->v4l2_dev);
 
 error:
 	media_entity_cleanup(&sd->entity);

-- 
2.49.0


