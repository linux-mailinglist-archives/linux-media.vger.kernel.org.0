Return-Path: <linux-media+bounces-27095-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE49A46AF9
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 20:27:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37DCB7A839B
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 19:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D14323957D;
	Wed, 26 Feb 2025 19:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NW8lxxvD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E18236A66;
	Wed, 26 Feb 2025 19:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740598060; cv=none; b=RPU1P+/mSslNim7f8yG5chKp9RcE+KDOFN9bL9pgWCV0f/332ckieWR3l59nbq2U0SMYIGGOluJW+rRKJK31yFb7tGs1bAaFSn1ONXu/6xlbo98SEQ3Fd65VECFeG3MPNuodv4+y8NZFKhrBMkBKIsKzm0WkZx818U0gTtVzZa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740598060; c=relaxed/simple;
	bh=TR7F1RtqVngJgjrbPnHgmwGaX8T2VMKYSMSpMKAAPlE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AN5HQ8d9xboEaH5Zlkow3NBuJu+6aFV29gRHNgDIQG5EAFxj/CaLvIaAgPyG14IIpwiTdADrmhvfHsfxWeIZ6kO9C5L/EsQbY5mLPe7m3+mB3PmL6SQ/NDV/o+nCkfdgfw8AA5YIkEOGg2EaWB/FUTqcb6hSzWTyto5pAH+n1/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NW8lxxvD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:2b29:76dc:a5a9:647c])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92A9C49E;
	Wed, 26 Feb 2025 20:26:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740597968;
	bh=TR7F1RtqVngJgjrbPnHgmwGaX8T2VMKYSMSpMKAAPlE=;
	h=From:To:Cc:Subject:Date:From;
	b=NW8lxxvDmzfPYMXpgDSCd6IHHfUuXIIuesoKkEjM/CbPFSewuNBLXD2Ac6G4j/+ew
	 Hg/pFr74tx67Rjt5r7WVNu3NLh/jjThLjdQ/lqtCRYThnm5hfSExf/UFMyKHXBAHNY
	 RlF/Q/CmwML/jQGYJLlZPFuU7l/PlcwhAfIYdI9Q=
From: Stefan Klug <stefan.klug@ideasonboard.com>
To: libcamera-devel@lists.libcamera.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH] media: rkisp1: Apply full quantization when color space JPEG is requested
Date: Wed, 26 Feb 2025 20:23:53 +0100
Message-ID: <20250226192413.2903243-1-stefan.klug@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When color space V4L2_COLORSPACE_JPEG is requested the ISP incorrectly
sets the output quantization to V4L2_QUANTIZATION_LIM_RANGE. Fix that by
applying the default quantization for the requested color space.

Fixes: c1ec5efba080 ("media: rkisp1: Allow setting all color space fields on ISP source pad")
Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index d94917211828..98635d875ac4 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -646,7 +646,7 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
 
 	/*
 	 * Copy the color space for the sink pad. When converting from Bayer to
-	 * YUV, default to a limited quantization range.
+	 * YUV, default to the default quantization range of the color space.
 	 */
 	src_fmt->colorspace = sink_fmt->colorspace;
 	src_fmt->xfer_func = sink_fmt->xfer_func;
@@ -654,7 +654,8 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
 
 	if (sink_info->pixel_enc == V4L2_PIXEL_ENC_BAYER &&
 	    src_info->pixel_enc == V4L2_PIXEL_ENC_YUV)
-		src_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
+		src_fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(
+			false, sink_fmt->colorspace, sink_fmt->ycbcr_enc);
 	else
 		src_fmt->quantization = sink_fmt->quantization;
 
-- 
2.43.0


