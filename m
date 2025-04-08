Return-Path: <linux-media+bounces-29657-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7B3A811EA
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 18:18:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80CC5171BA0
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 16:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D86230993;
	Tue,  8 Apr 2025 16:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fV3fwDSS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB15422ACF1
	for <linux-media@vger.kernel.org>; Tue,  8 Apr 2025 16:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744128682; cv=none; b=GjCgeUPHbAdxwW1/IJ2WAHM1H2J0ppunSunTFT6pQFKPh94NUytAdBOa4oANuh3YomUO8t9xtZjOoBDR1oAsLX1BgB0sT5jOeve+uP8dM9FXlJ43vU1OkJzmfegHIdCNjFSXYy1lZjmQ7EO15IP7BinAw9yCQhyz0GMVaE6XUp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744128682; c=relaxed/simple;
	bh=6GP/FJCRa7nqRDOLBCw29Z/yGIvhjr9WVwM6mn3hiaE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kmZeY9JprImE/NOg5bN2pdmYqYqkuKlyVubM24z2cWMElq66jNPeKmRM9yMAMufLK4WPFnsiW7xoTD91gYD5h74ltnFF8HPuvfNl0rcxhC7NsMrKLdKmbcTsCPL6TTIP6yKiHg9oPZOR6lexBOc/XYAJkkBex3HzBk7wQ+Cidng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fV3fwDSS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74BDE129;
	Tue,  8 Apr 2025 18:09:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744128559;
	bh=6GP/FJCRa7nqRDOLBCw29Z/yGIvhjr9WVwM6mn3hiaE=;
	h=From:To:Cc:Subject:Date:From;
	b=fV3fwDSSCqzFcEgigHsFXYS9S8Nr06twKKpuvhYyYi1dx3aNaz30uqNe7930iUnJZ
	 WZXHDyF64BjV5YnVEOgDDxpLoATIT8s1jeAEbfbC2umWYl2sIvk+yczDayDHE/bPFd
	 42gBr0HatWiuqrA+0MP6OIEpRiqdBvZ4GNFClVq8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH] utils: media-ctl: Set V4L2_MBUS_FRAMEFMT_SET_CSC flag to set colorspace
Date: Tue,  8 Apr 2025 19:10:51 +0300
Message-ID: <20250408161051.10472-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

When setting colorspace fields on a source pad, the V4L2 subdev API
requires setting the V4L2_MBUS_FRAMEFMT_SET_CSC flag. This is missing
in libv4l2subdev, resulting in colorspace fields being ignored for
source pad. Fix it by setting the flag.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 utils/media-ctl/libv4l2subdev.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/utils/media-ctl/libv4l2subdev.c b/utils/media-ctl/libv4l2subdev.c
index 2f6b1c948a07..f8f2bdecf910 100644
--- a/utils/media-ctl/libv4l2subdev.c
+++ b/utils/media-ctl/libv4l2subdev.c
@@ -829,6 +829,8 @@ static struct media_pad *v4l2_subdev_parse_pad_format(
 			}
 
 			format->colorspace = colorspace;
+			if (pad->flags & MEDIA_PAD_FL_SOURCE)
+				format->flags |= V4L2_MBUS_FRAMEFMT_SET_CSC;
 
 			p = end;
 			continue;
@@ -857,6 +859,8 @@ static struct media_pad *v4l2_subdev_parse_pad_format(
 			}
 
 			format->xfer_func = xfer_func;
+			if (pad->flags & MEDIA_PAD_FL_SOURCE)
+				format->flags |= V4L2_MBUS_FRAMEFMT_SET_CSC;
 
 			p = end;
 			continue;
@@ -885,6 +889,8 @@ static struct media_pad *v4l2_subdev_parse_pad_format(
 			}
 
 			format->ycbcr_enc = ycbcr_enc;
+			if (pad->flags & MEDIA_PAD_FL_SOURCE)
+				format->flags |= V4L2_MBUS_FRAMEFMT_SET_CSC;
 
 			p = end;
 			continue;
@@ -913,6 +919,8 @@ static struct media_pad *v4l2_subdev_parse_pad_format(
 			}
 
 			format->quantization = quantization;
+			if (pad->flags & MEDIA_PAD_FL_SOURCE)
+				format->flags |= V4L2_MBUS_FRAMEFMT_SET_CSC;
 
 			p = end;
 			continue;

base-commit: 4f4815bd2f4c97ef6b293d1b7b306f14caebf2ef
-- 
Regards,

Laurent Pinchart


