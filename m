Return-Path: <linux-media+bounces-16608-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 506FA95BAD9
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 17:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F9AA1C23737
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 15:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BE241CCB53;
	Thu, 22 Aug 2024 15:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="j29S5XzV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059671CCB2B;
	Thu, 22 Aug 2024 15:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724341539; cv=none; b=QUi2XjZdrvTDTxw6tzoRALILwSr8QUgjPQKPClzSTlwLyuKYyGliwvIGmXXysJE6gyoHub68T83UGgpdQIkPw9IXphA01f5lkIg8WnDctA7aIkVjmFBGCirRqnZ0bH72MJxa/6rMbz7C9Odp+WOzrF16YWoP12viblC+l9/XtA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724341539; c=relaxed/simple;
	bh=g4UzTpjAkmH1/8Mi3biEb/L7TovlNwHywY7DzG7f2wA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VL60jFTBS9Vh9F6RGzNaVDlL89hLreBLMI7KEFse61cMJqjMbDX2JdmNnlFkIeNfiVfXFvRRGbZYwT+wpPEUHWUIJ1oOtmqdpe92m9IvZuht7FQl1frWBTxjIzEl3vqi91iyYvcv3DOl6r/5KIN4+vZ8UIjU8VCVy6lVh1IaEV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=j29S5XzV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31D388A9;
	Thu, 22 Aug 2024 17:44:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724341473;
	bh=g4UzTpjAkmH1/8Mi3biEb/L7TovlNwHywY7DzG7f2wA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j29S5XzVK/J/DD64nbA79mgBNYDpOFugrBoQi9FE56kMepausoYrCKc1/FqdMm5rb
	 1qUpEQh+6/A67zTDfC5AnlWzMD7nRE8Iw+xWmY18Tch4vbHKlBj9NFdNoxLQOjmQ1l
	 8vvNtc8SqiY4yF5gaZkYVBql+e9FZyCfcvRmPgmU=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v2 2/7] media: sun4i_csi: Implement link validate for sun4i_csi subdev
Date: Thu, 22 Aug 2024 18:45:26 +0300
Message-ID: <20240822154531.25912-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240822154531.25912-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240822154531.25912-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sun4i_csi driver doesn't implement link validation for the subdev it
registers, leaving the link between the subdev and its source
unvalidated. Fix it, using the v4l2_subdev_link_validate() helper.

Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index 097a3a08ef7d..dbb26c7b2f8d 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -39,6 +39,10 @@ static const struct media_entity_operations sun4i_csi_video_entity_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
 
+static const struct media_entity_operations sun4i_csi_subdev_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
 static int sun4i_csi_notify_bound(struct v4l2_async_notifier *notifier,
 				  struct v4l2_subdev *subdev,
 				  struct v4l2_async_connection *asd)
@@ -214,6 +218,7 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	subdev->internal_ops = &sun4i_csi_subdev_internal_ops;
 	subdev->flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
 	subdev->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	subdev->entity.ops = &sun4i_csi_subdev_entity_ops;
 	subdev->owner = THIS_MODULE;
 	snprintf(subdev->name, sizeof(subdev->name), "sun4i-csi-0");
 	v4l2_set_subdevdata(subdev, csi);
-- 
Regards,

Laurent Pinchart


