Return-Path: <linux-media+bounces-36058-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17395AEAC33
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 03:08:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 181A6189C035
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 01:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71CEB191F6A;
	Fri, 27 Jun 2025 01:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="H5vdS7SM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3141632C8;
	Fri, 27 Jun 2025 01:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750986428; cv=none; b=LTjm2Kt/6WN23JcDG8QlEFCf2cHwBEP6z5QrbHDBIEDUitGnbY3GkB8w36CuxnqF8z1m0cSB9jSrYlcgxl5s72UHvxk2CeLlgMLWxg3xqsNdt60bESxWg9/Lj3fetaIoLcc0n4B1bpJK7MTnrTPspi94i8rkHdsZKYrwmifUTYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750986428; c=relaxed/simple;
	bh=uIQBuDztOh0KbG5p5tRdVxlHuwJDscliEGyVXWCao5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=taggMfJCeHu+ZF46kuUp2FtNR7Nhe+L9QyYxqjcmhquDoOimwofBmU2c8z/haMqFb4dTlCVmq4T2Z125eT0nW0YkvY1Exoer5mlXgH26SsKZFRK8lgs4TjoNNLmocvAS6ecb2hNQG9EsaFWvM1pVcPwxtqYdQ22C2xn0w7+zgLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=H5vdS7SM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2601:602:8100:c320::cf66])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B88B819;
	Fri, 27 Jun 2025 03:06:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750986406;
	bh=uIQBuDztOh0KbG5p5tRdVxlHuwJDscliEGyVXWCao5U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H5vdS7SMyFIeRgwY7yElpVlD+Hurk6FBJr7/fvIDrfxUX9KI58qpN30+H28tJ+j4x
	 DtMbtuU8+3wHXyABDeudusxysPEB915VPkVurdctdj21Gn6hKzmbSL/ckb/T2kdPIX
	 iS+JWCfGAdMfXCfewC+wzgB+XVPaeiVhgVK9GYhA=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 26 Jun 2025 18:06:08 -0700
Subject: [PATCH v3 3/6] media: ti: j721e-csi2rx: Fix source subdev link
 creation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-probe_fixes-v3-3-83e735ae466e@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2038;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=uIQBuDztOh0KbG5p5tRdVxlHuwJDscliEGyVXWCao5U=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBoXe6k5GUDpmaVP5y6jVnavf4FTrqWgHNw6iU+c
 AHBbfxF9lqJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaF3upAAKCRBD3pH5JJpx
 RSSSD/44ZBfFl4TvHgDmJnVdlWv7Ys4W4HgmXm+7JEYDNGo8Kzw5NVNmY7oYJlL3ZWZeXFP1Ma5
 Ia+Bh6njY8hh9s/2Ev2IcSOkPSBWzaw6GVmX2ix7ioygDoVaIh6f0YRrlFuiDV+RbUgzyqfbf85
 sjr+Wiu3e8EoK0WtqeJmIq+jGvpCFVam8q68FhiJTJ4XzHoOMgFpIottXfJipVwKQ6u2fQXWbaw
 wN6V+WZ4w/RyRfzgGRvtwW+oOyn9bkYN1PbpqBmZAK7Zw9Euh6XlT7t4o98X0fj1FBbrP6XO+ar
 3hVAJ2vAZAA/maoGd4sHHDYVvQcyNvabzo4sbCjGtjp2T2O4oKwu2GspNjfjsxTzX1B8dmjJXo5
 aMjusopIhzKOgdwcJmpxuV4aNaPAo8o9o7QT1d/1v/gXHvu+FAdxe1RoSH7k/mnhx4khJFWGyGG
 zLEYQVzCS5tsvKSCF3bb/9vYV5iAPH2sXYNlGz6zSPuL5gED1H/DAUD69WipfSzfgzF681AzrJs
 kN2jNXUc2Iyh21GIeu2bZp+bXWDlLaoNpkcTrzfF/DdgNDtRyBpMUM7TxwKJu0n3GMRMYk1Gufd
 atkRRDLHZSIMKpyviEG8mPIM7KlSNV8QDvxw6RCi3KhVKH1zuvxUtCKew1ST7QXwCa/y5smxWTd
 IOda6twekkVzvmQ==
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
Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
Tested-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com> (on SK-AM68)
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
2.49.0


