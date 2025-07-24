Return-Path: <linux-media+bounces-38410-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB9AB10D06
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 16:17:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A82B1D0097B
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 14:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1D482ED14E;
	Thu, 24 Jul 2025 14:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qpJsR4Eq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4C62E1738;
	Thu, 24 Jul 2025 14:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753366276; cv=none; b=HJOwu08G9vFzT4J8pct3uXnfWBXs7kEOK5SPM60A5q0AIoO+08psj5YX/cnBUwSje3xlgO2Oz+gIwf9PqOVGaLPf69wOaKUKzYHHYhz6ZmXRQfCVaJRQOwN+014KHjpzUwxwz9G8SGVLuXkN1gZmrDHOw2JsBc9IuirivqrhpWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753366276; c=relaxed/simple;
	bh=veD5bCafCFdh1GJ2SEAikts/NXjEHZdIvuKFJ7cMJ+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K/OtJFTa63uYu7htwU6zo0n65ND/RdbtlN8CJf4w74YTX+hzdmZRvp8PhD3Zp0pJRrVyHCaqFIA/59I5/TWu4561vLEWNwIC33QmLzVOg3NoniMrXoaIKiQhxMlRjgoFwfuuS8QEU5TW0DxWfdyAiIdKzktLIT1IGzYNVFYnX7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qpJsR4Eq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01E38190D;
	Thu, 24 Jul 2025 16:10:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366219;
	bh=veD5bCafCFdh1GJ2SEAikts/NXjEHZdIvuKFJ7cMJ+I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qpJsR4Eq1CYBfrwX4+EEF4wZye0yZPR0NiKQyRDv6d2Npq65JgUZg+MGO9BW/505M
	 Qpw/rKtLIDtxIUvveNkpoNnfsLmbnOh5Wcwrs67ARdRkmSxnYpOOFT52H+nh7+226l
	 m/65qY24S9anJ0ztB3E6f4pREDr6O3jGGsPDm7ZM=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:33 +0200
Subject: [PATCH DNI v2 26/27] media: pisp_be: Register devnode to userspace
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-26-c9b316773486@ideasonboard.com>
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7RK2B7rlcZ6phF6WyDjWYLWReVmALIB47qD
 sLD5LQyjAGJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+0QAKCRByNAaPFqFW
 PCgJEACHE03JmXOSbqh81a4WUrMGcAq/5CVVYdSIVk1PaAkQ21odSIEGu7iNLoHQ1b5toGTNfLt
 kFnAY94A6HhJNosfjvGUgKaaN24nc9NczLrJnbyqMRZ+rJAE7DM3qg2iWUsdGPBgutPJEJbT4c7
 rjfALg5/+0RLq3DbD5cGLyppvcmTA7l3HQLLT1WWNhWDXWy/wdptQqD6Y3EszYKBxtYKkvWrlf3
 BtuOZ3Bg26O0Yvrq7cpxaIhmTc/EpC6EPhMk1PkQV9yOMG13Hckt3zwPtJ5u3TFqMACeKnhQUNG
 vvWbyhkBFN9CKUrIJFr5OPcPWN20IQMalkw7R+ofp0fygP9O8U0WZzikXlCOARghMffTXFUuLFL
 SEx/6vDRyQagfEZf9JHHAnfBtIO0BxwYToOzMspMaXev4f/ao6xEAVsr1Aonp3CGojVNobVe53+
 jy0fYVDxncPEOyw7TGMJbho4FG/tvi7HLJFkIuixU0pu1PY2rZ1+dvQiMc5xpwdAi/rQZeC53/t
 dqnSBc4YA7CMiNf1FafTk0vbqEuQU7RrKT7hCC+YyPJPbwPsMPDtRwMo7RyXZUg/OELfs8NBVYC
 lt+iWcig19nDTsYCW3q0ZhtwkuR5L2RGmzaPhUDHU5UiPtDBTduTnlRX1GQE7DRnPE/r3kGBH6l
 QaXOUYMWgWhyeDw==
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


