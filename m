Return-Path: <linux-media+bounces-35084-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD26ADCE52
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 15:54:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12890174B29
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 13:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54792E06EE;
	Tue, 17 Jun 2025 13:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lCg8jExe"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1D0C2D1;
	Tue, 17 Jun 2025 13:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750168458; cv=none; b=d2iQV0DfCRRNv1FW+PjvZPrt7MZYfLnFn37R2wo8VKcYsYWUOyhfZ683euA5f2iOTJRjFfZl5pkM2SNtoBsHavpd2RP/ZR2eSrt5/agAEWHFo7DNqtguc2BL0DRhy4kphFq942VTEbHq+mlFqneS7eumTDyE+vAeZbGjv31Vbm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750168458; c=relaxed/simple;
	bh=t3v2gCfs3hvB2F8i2l+4fa99QiR0O16IHlX1eprudQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZO/FAqodSDSdZX6x6hsi+QSQpYtc1WN6RkTFa3gSVb9VWVjJ9hBM7ua5FGLsMDRXyklLtlKz+IuwR7gtSPi9PKkk1VtyljfnkRtcbTz5IVQbKidTjwb8QUjWaxkBl/qYhofx8cs2tBejN4oE0xxXYoGi4pZ0Je/GB95ng7s8m6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lCg8jExe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECB242A4B;
	Tue, 17 Jun 2025 15:54:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750168442;
	bh=t3v2gCfs3hvB2F8i2l+4fa99QiR0O16IHlX1eprudQU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lCg8jExe+FK/U16zxToF1FnP0JTKhF+iLvsMrizss/kNRPN23uu82u3bMMXPaLzzT
	 DPpgXcMWz/wZ13HRQTSd+N42g3jGhhipq0NTW7HFxNESlyhVdTFoQ6511XRu2WNhtD
	 JF5JXhGxH5SzqXDHmCsE2auVMcsAu0GyL24FVO5g=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 17 Jun 2025 15:53:59 +0200
Subject: [PATCH v8 1/4] media: pisp_be: Drop reference to non-existing
 function
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-pispbe-mainline-split-jobs-handling-v6-v8-1-e58ae199c17d@ideasonboard.com>
References: <20250617-pispbe-mainline-split-jobs-handling-v6-v8-0-e58ae199c17d@ideasonboard.com>
In-Reply-To: <20250617-pispbe-mainline-split-jobs-handling-v6-v8-0-e58ae199c17d@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>, 
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1264;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=t3v2gCfs3hvB2F8i2l+4fa99QiR0O16IHlX1eprudQU=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoUXOEefIqfHkyLanL11HSFQZXFl3/OcOSvD9DF
 T3Ct5kBOIeJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaFFzhAAKCRByNAaPFqFW
 PEmED/9uRRqnVk6h3i9fAs+SnLvMZo8sFhDHTiVIKnpcyGfIyCzHejwz0wG1eS8lqRiz94QKMQ0
 xiLnF//2R+KUAHgqTMz0Mfht6fB3c3L5Pdo7EcmdMjmRjCTN53brl37Dze5L4bRf6CslTtcPW5D
 osQRCWnJ5T/c8XxTtQpYme3D6dJVavnMgFz3eOuHgrT1z/zhJh2H3d97PunPoPwlsjYi40QDBoF
 VpAFXexzgjnBL81EI1RyiGOASCN8t2hc+BliiI6/vIWsMV2ZLtWFi6jVAaflUViTHhWaeR57qvw
 vqKb1EwqR+Cfs/ZYLaQH9uCaGiyTR12ydW1nxqm84PsFHgdnJpr2e9c4noqLiQEnVLigYnAXtF3
 1vZW6nU9qHRRfFNXl2heLCUwo5lIhRy27zE2OBF2zaYvr7tTm7nhaCSvzYXwXilJzSj27EvQ+Xn
 Ryh30xEQ/66UBaN5wwzArI9uEBE0uXZyJJQ8FiNT8r57CiBTdc4CSuwrKV4SC8yA2Y22h5EcGYM
 bInVn3ZsT7fx5XxNN44eQfERkoWD/MaxKsisU2msoFuZLHuoBYYyyLo4wSBpNcoKDM+e/J6A038
 pg3g4sMnnxr8ovUtuG/BAg0vA+AxI2lk1/zdvKF905ZWs6vE2dFBIpBtvSxVEGPAgJCH9w2fcQ6
 gkqxcfDT9x8cIdA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

A comment in the pisp_be driver references the
pispbe_schedule_internal() function which doesn't exist.

Drop it.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Naushir Patuck <naush@raspberrypi.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 7596ae1f7de6671484d4d351015b234829f642d4..b1449245f39436d02c9c710916e2d0605606a327 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -368,10 +368,7 @@ static void pispbe_xlate_addrs(struct pispbe_dev *pispbe,
 	ret = pispbe_get_planes_addr(addrs, buf[MAIN_INPUT_NODE],
 				     &pispbe->node[MAIN_INPUT_NODE]);
 	if (ret <= 0) {
-		/*
-		 * This shouldn't happen; pispbe_schedule_internal should insist
-		 * on an input.
-		 */
+		/* Shouldn't happen, we have validated an input is available. */
 		dev_warn(pispbe->dev, "ISP-BE missing input\n");
 		hw_en->bayer_enables = 0;
 		hw_en->rgb_enables = 0;

-- 
2.49.0


