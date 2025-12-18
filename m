Return-Path: <linux-media+bounces-49063-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F591CCB2B4
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 10:28:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3334C3084D92
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 09:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3D8830F7EF;
	Thu, 18 Dec 2025 09:24:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FDE2FE598
	for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 09:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766049852; cv=none; b=JRmhJYTUoK5EveaQYQoBgMGG9ZK1hapUnzF/0N+7cK45QlZBJaSM8B2pdnaER76i34QfwQoUkguznYGYX+Am1JzjqukyPzlL2yg+9eA0zSzQn8l3C4QP7p75EUD/LboP//hEbJxwGK26hF9xyr19mGu6ccKQo5cD0g/L0/XKWv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766049852; c=relaxed/simple;
	bh=ylpK3wyUvjcqr6kllfEsH1JpN3jMSVN9qqrfj3PJtg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NuVSJLLZXSTxlUgzobn23vz1meHKZOJ9CSMxU7xLY9rvCbqm4BZ4FvvPeyXn6Ode4unig/dMVLVZZNAxieRXl/9BHLKzufKrv1P6oYQoNs720pvBBTKhG50MXKv/dYjAdLPP+IzYaNp68K5owoEWce/QC/jjoqM9nlB4NqZqsQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vWAEo-0002J4-KB; Thu, 18 Dec 2025 10:23:58 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Thu, 18 Dec 2025 10:23:51 +0100
Subject: [PATCH v2 3/3] media: imx-csi: use media_pad_is_streaming helper
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-media-imx-cleanup-v2-3-9e3e3c269f7f@pengutronix.de>
References: <20251218-media-imx-cleanup-v2-0-9e3e3c269f7f@pengutronix.de>
In-Reply-To: <20251218-media-imx-cleanup-v2-0-9e3e3c269f7f@pengutronix.de>
To: Steve Longerbeam <slongerbeam@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-staging@lists.linux.dev, Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

The media_pad_is_streaming() helper is explicitly intended to check
whether a pad has been started with media_pipeline_start(). Use it
instead of relying on the implicit assumption that a pad with a
pipeline is streaming.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changes in v2:
- Update commit message as suggested by Frank Li
---
 drivers/staging/media/imx/imx-media-utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index bd9af147a801..1a2e5e40c99c 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -774,7 +774,7 @@ int imx_media_pipeline_set_stream(struct imx_media_dev *imxmd,
 			__media_pipeline_stop(pad);
 	} else {
 		v4l2_subdev_call(sd, video, s_stream, 0);
-		if (media_pad_pipeline(pad))
+		if (media_pad_is_streaming(pad))
 			__media_pipeline_stop(pad);
 	}
 

-- 
2.47.3


