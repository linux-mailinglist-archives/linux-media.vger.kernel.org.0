Return-Path: <linux-media+bounces-38730-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A24FAB188A3
	for <lists+linux-media@lfdr.de>; Fri,  1 Aug 2025 23:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 978AF4E02CD
	for <lists+linux-media@lfdr.de>; Fri,  1 Aug 2025 21:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B599028F51B;
	Fri,  1 Aug 2025 21:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LrcA0E9p"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AD728D831
	for <linux-media@vger.kernel.org>; Fri,  1 Aug 2025 21:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754083197; cv=none; b=OTyjczGF1f3lNlGz5CfbR+T+XV3UQiK3VMnF4OM+P6LDeHSWNy3riMpNC083F4oXwC5qe1KjQy8USM00h7KSw6eEhJDzyM2ZeX1IAYOqCuR/iDJzKvoKNdzcCTlCloqypxzyRZG9nK+hCKxfNAecunbpFuTZ+LoS5Kd+RfMKnko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754083197; c=relaxed/simple;
	bh=8xw7cGLijXWvrYfmGpfsDi7zMKEQj4LqPV53B5tvN5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hUcyAsyEPCDFxyDIOZvPABmAcDw1SYqgUXtEPD+7KYHhyzFfEWICqprCo2TCl9OLoJxS4KMkATnZcFPN5f3X+x6BXnuHDsahFqV7sSk0uRjaTE8/vr1O0473bNMZYktFiHlw5N2xrZOtWd0IaYvv2iE+J+Ao8QU/O3pGaqir9po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LrcA0E9p; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3E3F263B;
	Fri,  1 Aug 2025 23:19:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754083143;
	bh=8xw7cGLijXWvrYfmGpfsDi7zMKEQj4LqPV53B5tvN5M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LrcA0E9pxsqjRLIdupCuNFgQx+YafqzSMNg+Y06CCKBCKRVXujePBkAOblC2bO/mg
	 Y/YC5SffaGb2f0HIiN+9byxVCU9mtBNcKLxMH2rLv7VzCVZ9Lq7tHL9l/NamDb9dk1
	 /1piCsPzIyotiW72gSO8iWhP5HePdZaS40V5K3bk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev
Subject: [PATCH 2/3] media: staging: atomisp: Drop custom .unsubscribe_event() handler
Date: Sat,  2 Aug 2025 00:19:32 +0300
Message-ID: <20250801211933.22553-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250801211933.22553-1-laurent.pinchart@ideasonboard.com>
References: <20250801211933.22553-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The isp_subdev_unsubscribe_event() function simply calls
v4l2_event_unsubscribe(), forwarding its arguments. Replace it with the
v4l2_event_subdev_unsubscribe() helper that performs exactly the same
operation.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/atomisp/pci/atomisp_subdev.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 22c0ae0b1b7b..3d56ca83ecb7 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -161,13 +161,6 @@ static int isp_subdev_subscribe_event(struct v4l2_subdev *sd,
 	return v4l2_event_subscribe(fh, sub, 16, NULL);
 }
 
-static int isp_subdev_unsubscribe_event(struct v4l2_subdev *sd,
-					struct v4l2_fh *fh,
-					struct v4l2_event_subscription *sub)
-{
-	return v4l2_event_unsubscribe(fh, sub);
-}
-
 /*
  * isp_subdev_enum_mbus_code - Handle pixel format enumeration
  * @sd: pointer to v4l2 subdev structure
@@ -575,7 +568,7 @@ static int isp_subdev_set_format(struct v4l2_subdev *sd,
 static const struct v4l2_subdev_core_ops isp_subdev_v4l2_core_ops = {
 	.ioctl = isp_subdev_ioctl,
 	.subscribe_event = isp_subdev_subscribe_event,
-	.unsubscribe_event = isp_subdev_unsubscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
 };
 
 /* V4L2 subdev pad operations */
-- 
Regards,

Laurent Pinchart


