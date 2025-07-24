Return-Path: <linux-media+bounces-38407-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE872B10CFE
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 16:16:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F217B1C857F1
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 14:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78DEC2EBDD4;
	Thu, 24 Jul 2025 14:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VRnt5rjt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E702EB5CA;
	Thu, 24 Jul 2025 14:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753366270; cv=none; b=gtxA1fvxGYVG47DEJ9mSljaRqVsrmwiKYaqkU9/HAFF/F1uw5GfV5PPdYqoxqR5WwtYMhN2uQwl1dgl8xNcob3Z35HI79o+FCjiWOYVx23KmxS+fcHn1E/mg3DN/IaNXQ2DVxwhWXFgqe3vJ5IKa1Mi3yRZBacvdCkB+ID/3Fa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753366270; c=relaxed/simple;
	bh=9aZhUEi8nzk0nQ1lg/OYG7ZJZJnqA3OQHgxh4Ti+sSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P+s2Yz0xuQPr9bVtDTWpdiG/ASNWrANvkjU32rpPxmC6/ycLu2bYNysCzEWsnqD3oyBIgSSYvPBN+nxGnPt3M8rSfd9dii1t7zxIAkxdRVn+zFA2MBDN6McHhOfPeSE8SKxEg22WF2JDWrlcVGndglNIn96Vf98/Au6kqyHbTcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VRnt5rjt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7131A1D4F;
	Thu, 24 Jul 2025 16:10:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366216;
	bh=9aZhUEi8nzk0nQ1lg/OYG7ZJZJnqA3OQHgxh4Ti+sSs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VRnt5rjtqSYNmPTP6tyBO9oGp/Borz7nHI+YpvDhvjT4GLS3/8WaSftJ2uUDR4J1I
	 t/c2y5ZkTBolKfu8KtGPnsKpJUefza5a/IEMqhL9lXtWRs/75yTgbkRGaq0doWW9Q6
	 /OClRfTTNWRe05cZ0f8t0rzsaugKE1ngi2M48MHs=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:30 +0200
Subject: [PATCH DNI v2 23/27] media: pisp_be: Add support for subdev state
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-23-c9b316773486@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2271;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=9aZhUEi8nzk0nQ1lg/OYG7ZJZJnqA3OQHgxh4Ti+sSs=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7RY0e4xaDYYLJ3qoVCAQxIeUre2V57aqbY6
 Ls6WAj3FueJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+0QAKCRByNAaPFqFW
 PF4+EACO24TyFJ/23FdbJxiNhAcLd20SEuDeKlrG+PosKaIqqq1hcGdVXYWhUNWcCGOC8F4/Oqr
 PCxSqmosJcV4j55zUC5d7cEQaM0P4JiKYchzFJXlFAwxEBUhL3sSjwZrx81jFKP74993ZfdqGoI
 9dsxHGiZ/0x+9fegBWuz6uMBY8dbuj4egcNInF6lW9CCtGv0/iqQznT9At45k0Ao08m/5BIki/+
 5Qvc+f0n49QjTw/oI1LyWUtsJJCXwowwHF8nTxke9QEhx5M5Q23aXMzbj71vpkLUxTmaBL1C5b5
 FCtYXCrIvMjtyoMM70ACunHxbg02N5Mm3nREVE1SlMJgMa8VWFmradb+f58+PGIm1/YdIxCVpbc
 XbBOKfmAztgAWQIwkXhJ3QyOf8P3Ms7CTMNqOHSzkcalh1VvwsUdEsAiFbW9mic8chNQSAGb+t5
 ZvGO9uDao0xbxkoCB9mmbVdwDjjHoa0uzTSdGvrSCPaS6WYC8wDWcPpRXXW47W8HfkABA6+HDsV
 1y8RoiJaQEP14+RJZ2UwzTNzZPic96dgzB0ZhpGs7BU5FDw6Sf7/ChtKvFXJDZlVvlyqCAojdun
 nw5BJkda5UQ5i6n4e+BJmVVUsm3JmNzP3d4KkhaldiggZrwjkDEkowYqsdt15JZvDPUsYYTZHk2
 YisWCLbWiAtUaNQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add support for subdev state in the ISP subdevice by providing an
init_state() callback and by calling init_finalize() before registering
the subdev.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/platform/raspberrypi/pisp_be/pisp_be.c   | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 423cb21298309c2ba51214b129fbf6e875370c98..5aec4f8979053500c870e71ce7171bbd1cac9606 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -1496,12 +1496,49 @@ static const struct v4l2_subdev_ops pispbe_sd_ops = {
 	.pad = &pispbe_pad_ops,
 };
 
+static int pispbe_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_framefmt *fmt;
+
+	for (unsigned int i = 0; i < PISPBE_NUM_NODES; i++) {
+		fmt = v4l2_subdev_state_get_format(state, i);
+
+		switch (i) {
+		case MAIN_INPUT_NODE:
+			fallthrough;
+		case OUTPUT0_NODE:
+			fallthrough;
+		case OUTPUT1_NODE:
+			fmt->width = 1920;
+			fmt->height = 1080;
+			fmt->code = MEDIA_BUS_FMT_FIXED;
+			break;
+		case CONFIG_NODE:
+			fmt->width =  sizeof(struct pisp_be_tiles_config);
+			fmt->height = 1;
+			fmt->code = MEDIA_BUS_FMT_METADATA_FIXED;
+			break;
+		default:
+			/* No need to configure other nodes. */
+			continue;
+		}
+	}
+
+	return 0;
+}
+
+static const struct v4l2_subdev_internal_ops pispbe_subdev_internal_ops = {
+	.init_state = pispbe_init_state,
+};
+
 static int pispbe_init_subdev(struct pispbe_dev *pispbe)
 {
 	struct v4l2_subdev *sd = &pispbe->sd;
 	int ret;
 
 	v4l2_subdev_init(sd, &pispbe_sd_ops);
+	sd->internal_ops = &pispbe_subdev_internal_ops;
 	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
 	sd->owner = THIS_MODULE;
 	sd->dev = pispbe->dev;
@@ -1517,6 +1554,10 @@ static int pispbe_init_subdev(struct pispbe_dev *pispbe)
 	if (ret)
 		goto error;
 
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		goto error;
+
 	ret = v4l2_device_register_subdev(&pispbe->v4l2_dev, sd);
 	if (ret)
 		goto error;

-- 
2.49.0


