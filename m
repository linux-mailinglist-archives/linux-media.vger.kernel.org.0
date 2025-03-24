Return-Path: <linux-media+bounces-28631-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CEDA6D9C2
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 13:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DAC93B29BF
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 12:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC73225EF92;
	Mon, 24 Mar 2025 12:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DaKRHjUI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD9F25DD13;
	Mon, 24 Mar 2025 12:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742817739; cv=none; b=tK2q5/aMnbWPn+AQCgu47Ntuy5cQcdubvPSlzddw9Ms8i62xb4cj2KxwiEaDIWPs49jnLqb8bmMpUqoe9gsjfPZO2TiQ4OKHDcnzADIJRMCiATvIOmKQkX67S/S914L6f1rV3kQRfBJS8a65sDv07/GsjJ8Wcu5b30acfaaw8nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742817739; c=relaxed/simple;
	bh=YypAVVW6YBJ7nwW19idHFNuCugtcZMvk68FdLDHBdWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W0lWdSqICnm+QZfJn526ItI5OcU5Dr7VH/Kx0gfq/ruuOwYa29V9VEGBGbYVQeWEhvhH2JnLc06iEtt2DJWcVy70XcWio7sVfXmUNMLMD/PZaEcJyBKhSY87VFemd+e574ng3fAnUulM3OGvUW5DJuAVzxvxtY2B+6xdh7YIO68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DaKRHjUI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:904a:b2d:8d57:4705:738e])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C5E10455;
	Mon, 24 Mar 2025 13:00:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742817630;
	bh=YypAVVW6YBJ7nwW19idHFNuCugtcZMvk68FdLDHBdWM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DaKRHjUIUvKj8eG5tU7ILNomDtoE7HxwDDvpMxYjMyFMp8mK7lRZCoZFQd7pCLa3Y
	 B7EbxHkuDdF0/o2vxn0ac2Xjkzs3M6UFrMyYw4eFPpC8vbr7zyi8ThLc+YmLtB9jYH
	 QSFm0GBn7Os3a+YMjYuvPokezh5TtQd2pOXow6E0=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 24 Mar 2025 17:31:39 +0530
Subject: [PATCH 3/6] media: ti: j721e-csi2rx: Fix source subdev link
 creation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-probe_fixes-v1-3-5cd5b9e1cfac@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1914;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=YypAVVW6YBJ7nwW19idHFNuCugtcZMvk68FdLDHBdWM=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBn4UmxK4p3Ls6bnuTmxQTWIQBXpRGstNVIocoYg
 MhN4BHJEj2JAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ+FJsQAKCRBD3pH5JJpx
 RYW/D/4shzWtuZUTr08jRxVpc6d+/2lV4e390QUCM8L/o+MkOQ6Zg555mtdqXkzPNJLMHMqiTgM
 68D/CWziiALWcr6cRK1G4ebEukMTV3rQBmNx+pAohuKk/6OOPYYLtbNVfac8LmuUVHsTRnBs86Q
 kw7i34gr99+0y5nCF0kywNSoTZ8yuTBkMNtca6V/iargKhCNCp5wgkH1lzcmq7ip8C3igFbyW5x
 WLCzBqtGYoPKlaGYiw6pXJAAOc3zRuffeTUVnJkX4GaW4fO3byaZN689NxvPn1aZsUXNQw1+dlN
 hJAS6aiGatLOUHf0bmpZX4rI/LD0PTZkP2lv9i499L64RHBxynsqOi+oNTT4fv3zvvG9SHtN2so
 +H/5EkdflbUcy6VQUkPnG3p6luwXLYNPFgGfovJqvlNNfhwZ+Wvdjnb4HnwTLMIrVOAYUVQzX6x
 W7yjF3S6p8U/aMYkqLuCbTHrAbNypnhH7o75Ya9sTF3S2Zx4dM0LD0S987kocOKbZpSXqtt+AR+
 iN5/fv2WtOZ+9+87dmaMy5WXdEk65l0k8ciE0NbA8/ujB+gHuktLY69LLsJk31z0vTYcecm9tBC
 2TYw9ymgrD6ls17R3BEb445f8sJHF//onQ/g3uqxvS3iK+j8yQ6vyu134P1nUIAg1hWy9LydfVR
 7aUkKUy8tylu/pA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

We don't use OF ports and remote-endpoints to connect the CSI2RX bridge
and this device in the device tree, thus it is wrong to use
v4l2_create_fwnode_links_to_pad() to create the media graph link between
the two.

It works out on accident, as neither the source nor the sink implement
the .get_fwnode_pad() callback, and the framework helper falls back on
using the first source and sink pads to create the link between them.

Instead, manually create the media link from the first source pad of the
bridge to the first sink pad of the J721E CSI2RX.

Fixes: b4a3d877dc92 ("media: ti: Add CSI2RX support for J721E")
Cc: stable@vger.kernel.org
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 6d406925e092660cb67c04cc2a7e1e10c14e295e..ad51d033b6725426550578bdac1bae8443458f13 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -53,6 +53,8 @@
 #define DRAIN_TIMEOUT_MS		50
 #define DRAIN_BUFFER_SIZE		SZ_32K
 
+#define CSI2RX_BRIDGE_SOURCE_PAD	1
+
 struct ti_csi2rx_fmt {
 	u32				fourcc;	/* Four character code. */
 	u32				code;	/* Mbus code. */
@@ -427,8 +429,9 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
 	if (ret)
 		return ret;
 
-	ret = v4l2_create_fwnode_links_to_pad(csi->source, &csi->pad,
-					      MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
+	ret = media_create_pad_link(&csi->source->entity, CSI2RX_BRIDGE_SOURCE_PAD,
+				    &vdev->entity, csi->pad.index,
+				    MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
 
 	if (ret) {
 		video_unregister_device(vdev);

-- 
2.48.1


