Return-Path: <linux-media+bounces-12596-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3DD8FD339
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 18:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D26C8B2345F
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 16:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 358EE18F2F4;
	Wed,  5 Jun 2024 16:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="huIaSsQS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01732188CA8
	for <linux-media@vger.kernel.org>; Wed,  5 Jun 2024 16:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717606518; cv=none; b=QnBcthdChz3VP1LsBrI4q9ecG1yl4c3Y+Kkn472PShfS+O0F4qhB6EndQEIVp/TGfJTYQIeljpy+92Qt6Ml4lCNLur1e102Zc5rTQS3AdGZGTMJ4QgGxOrxMbDf3Vx/vKSoEe5gLifA8yDVTSSWUNRsJQbikRfK72B+9hi/eS5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717606518; c=relaxed/simple;
	bh=3UFN83ixbTHSRCJ4lLIcB6Ls9TqzRWiqCGTVYxYyqJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qx3Nbc0qyQl2aUWqr+AwhIaUFz4UROirX/7TiMqqYZ72sQGU9L1KF1GnKjJiGaQZi1rGQyHNKR2x9uJKkESi1G2B7GbQzpVPrDj7a2pCVe2OxItwHwgt3/Y+YKoybnERn5HM+epC5cgtI0dfJXLe5zlMx/wiXoNxbDRqtOqWqV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=huIaSsQS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BA967047;
	Wed,  5 Jun 2024 18:54:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717606493;
	bh=3UFN83ixbTHSRCJ4lLIcB6Ls9TqzRWiqCGTVYxYyqJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=huIaSsQSNFi34Soh1GRIww4HJ2Cw7dWHWpKqUMllOi4GlHwizrvY11Zcc8Z4nGTeo
	 tsNhxcp7BoPYKMLWrUqK1MIJfkEOP6V0xHCgmrLb8a/fQ7uEKCO7xrUV10mrmvxKyc
	 c9XIbTVvPCAhz+d/RUjO78XNj3hOTwxyscOcjd/4=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 6/8] media: rkisp1: Propagate pre/post-config errors
Date: Wed,  5 Jun 2024 18:54:25 +0200
Message-ID: <20240605165434.432230-7-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240605165434.432230-1-jacopo.mondi@ideasonboard.com>
References: <20240605165434.432230-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The support for the extensible parameters format introduces the
possibility of failures in handling the parameters buffer.

Errors in parsing the configuration parameters are not propagated
to the rkisp1_config_isp() and the rkisp1_isp_start() functions.

Propagate any possible errors to the callers to report it to userspace.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/platform/rockchip/rkisp1/rkisp1-common.h | 10 +++++-----
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c    | 14 +++++++++-----
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 14 +++++++++-----
 3 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 0bddae8dbdb1..f9df5ed96c98 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -591,10 +591,10 @@ const struct rkisp1_mbus_info *rkisp1_mbus_info_get_by_code(u32 mbus_code);
  * It applies the initial ISP parameters from the first params buffer, but
  * skips LSC as it needs to be configured after the ISP is started.
  */
-void rkisp1_params_pre_configure(struct rkisp1_params *params,
-				 enum rkisp1_fmt_raw_pat_type bayer_pat,
-				 enum v4l2_quantization quantization,
-				 enum v4l2_ycbcr_encoding ycbcr_encoding);
+int rkisp1_params_pre_configure(struct rkisp1_params *params,
+				enum rkisp1_fmt_raw_pat_type bayer_pat,
+				enum v4l2_quantization quantization,
+				enum v4l2_ycbcr_encoding ycbcr_encoding);
 
 /*
  * rkisp1_params_post_configure - Configure the params after stream start
@@ -604,7 +604,7 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
  * This function is called by the ISP entity just after the ISP gets started.
  * It applies the initial ISP LSC parameters from the first params buffer.
  */
-void rkisp1_params_post_configure(struct rkisp1_params *params);
+int rkisp1_params_post_configure(struct rkisp1_params *params);
 
 /* rkisp1_params_disable - disable all parameters.
  *			   This function is called by the isp entity upon stream start
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 91301d17d356..05227c6a16fe 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -310,12 +310,16 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
 		rkisp1_params_disable(&rkisp1->params);
 	} else {
 		const struct v4l2_mbus_framefmt *src_frm;
+		int ret;
 
 		src_frm = v4l2_subdev_state_get_format(sd_state,
 						       RKISP1_ISP_PAD_SOURCE_VIDEO);
-		rkisp1_params_pre_configure(&rkisp1->params, sink_fmt->bayer_pat,
-					    src_frm->quantization,
-					    src_frm->ycbcr_enc);
+		ret = rkisp1_params_pre_configure(&rkisp1->params,
+						  sink_fmt->bayer_pat,
+						  src_frm->quantization,
+						  src_frm->ycbcr_enc);
+		if (ret)
+			return ret;
 	}
 
 	isp->sink_fmt = sink_fmt;
@@ -458,9 +462,9 @@ static int rkisp1_isp_start(struct rkisp1_isp *isp,
 	src_info = rkisp1_mbus_info_get_by_code(src_fmt->code);
 
 	if (src_info->pixel_enc != V4L2_PIXEL_ENC_BAYER)
-		rkisp1_params_post_configure(&rkisp1->params);
+		ret = rkisp1_params_post_configure(&rkisp1->params);
 
-	return 0;
+	return ret;
 }
 
 /* ----------------------------------------------------------------------------
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index 3d78e643d0b8..c081fd490b2b 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -2123,10 +2123,10 @@ static const struct rkisp1_cif_isp_afc_config rkisp1_afc_params_default_config =
 	14
 };
 
-void rkisp1_params_pre_configure(struct rkisp1_params *params,
-				 enum rkisp1_fmt_raw_pat_type bayer_pat,
-				 enum v4l2_quantization quantization,
-				 enum v4l2_ycbcr_encoding ycbcr_encoding)
+int rkisp1_params_pre_configure(struct rkisp1_params *params,
+				enum rkisp1_fmt_raw_pat_type bayer_pat,
+				enum v4l2_quantization quantization,
+				enum v4l2_ycbcr_encoding ycbcr_encoding)
 {
 	struct rkisp1_cif_isp_hst_config hst = rkisp1_hst_params_default_config;
 	struct rkisp1_buffer *buf;
@@ -2187,9 +2187,11 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
 
 unlock:
 	spin_unlock_irq(&params->config_lock);
+
+	return ret;
 }
 
-void rkisp1_params_post_configure(struct rkisp1_params *params)
+int rkisp1_params_post_configure(struct rkisp1_params *params)
 {
 	struct rkisp1_buffer *buf;
 	int ret = 0;
@@ -2227,6 +2229,8 @@ void rkisp1_params_post_configure(struct rkisp1_params *params)
 
 unlock:
 	spin_unlock_irq(&params->config_lock);
+
+	return ret;
 }
 
 /*
-- 
2.45.1


