Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A68FC559CCA
	for <lists+linux-media@lfdr.de>; Fri, 24 Jun 2022 17:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232455AbiFXO7i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jun 2022 10:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232422AbiFXO7X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jun 2022 10:59:23 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D05818895F
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 07:54:43 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 023EA320092C;
        Fri, 24 Jun 2022 10:54:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 24 Jun 2022 10:54:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1656082450; x=1656168850; bh=Ml5chXcEtp
        d3vIAq0Nma+cRU2IG4EQ2Zp6B4TN8cAfc=; b=e+E+4upHP3iylXTsyA8uCq2Ktp
        sFBIhySzOqlQ5255+RsQ5XxmAhJi7ixHxTfCv8jc5tuCp3pHBWYCX4g19nAJwcWW
        io00RybF6QceCfQkUq05zY7y1UmSVctU5S+UeAAJ8CFxIbOb2uPCkD7pVtMd6myz
        +6wY1f6Dy97lFWTz5dYMp1lBEC2oBzvb2571NmKaxjHluilo4IG9w0AXf8fj/Vkb
        7+6ZiderywxnGfS2Gh95vkqbBmQfD23zo6uW8lDl79DNFmhATMOkG4GZgRhzoSt7
        HhnklEaZn0Nbv2//Uo/jbMSK3ZTR3Cuut5eplVRqo9U16I28Z87ZY6dNScRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656082450; x=1656168850; bh=Ml5chXcEtpd3vIAq0Nma+cRU2IG4
        EQ2Zp6B4TN8cAfc=; b=WCbn8IDnsE21tZpe4D0GHPYEFE2SxGWegzcDx7P0IUtV
        BAyWk5Pqw/fbiUdWGHB8zFm4foiI3Yhg4EKIciOmWm/rWECEeQqCJV8E7OersvgU
        1J1KJmUBBpHlHSm7lnMh8B0eC/VGqwzLe6Xa4iN/gWPen+Hnsewfa+JKNFvHokBq
        KNkCjTbl4cPy4VNE6gW/tmS/Y9n58d+B9M5vXu3HP557EFDBfVy/TyYZeumt4OV0
        8Dj4OZl0W33hRzVSwyN1Khcl34sxAaO5B0/eNZcv4VWYK475SJ8SFQOHlxrkzgUh
        dyGQdsO7GX2DiJno0PpWp3YzK8V1bAmt5IO+aP15Eg==
X-ME-Sender: <xms:EtC1YrIuFCPKrR2LSnC1ixDFqiEUADT6mnJS8SRxGIumpmC1kdq65A>
    <xme:EtC1YvLpmcH3rVg8qNf3mwJk7qNQGa7dOuWco9bktrUo80NzeBi0lIZxMcnPTb3t9
    2pAsgxRJ6L5D-b7LnU>
X-ME-Received: <xmr:EtC1YjtgMDX9Cr5FOK-Mgedkc04Kh6vw_2W2xSyorL90SyMtiPnBBQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefledgkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:EtC1YkZnVUEflSOviWDysvj_wNRnV03AWTN7MmNOGRaByt--FTBuGA>
    <xmx:EtC1Yiah8bDBq_xHYjTF23ssvJQaom_qxj6lsnuTgiZZ70I4Y7kxcQ>
    <xmx:EtC1YoBdmHGxdEIc6LmZXX-xwZYfVcxChig4easMD5Mx0pDg9Y03Pw>
    <xmx:EtC1Yq7U-Q-SI8Ui5USn6SiQKyi1kbpxvAyBIxMXfVW4Bj9Ad5sPYQ>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Jun 2022 10:54:06 -0400 (EDT)
Date:   Fri, 24 Jun 2022 17:54:03 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, heiko@sntech.de,
        laurent.pinchart@ideasonboard.com,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 09/55] media: rkisp1: Make rkisp1_isp_mbus_info common
Message-ID: <20220624145403.ejp52oix5k35xjaf@guri>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-10-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-10-paul.elder@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15.06.2022 04:10, Paul Elder wrote:
>The upcoming CSI receiver split from the ISP to a separate source file
>will need to be able to access the list of formats supported by the
>driver. Move it out of the ISP's header and into the common header, and
>add helper functions for accessing it so that the format list doesn't
>need to be stored in the header.
>
>Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

Reviewed-by Dafna Hirschfeld <dafna@fastmail.com>

>---
> .../platform/rockchip/rkisp1/rkisp1-common.c  | 148 +++++++++++++++
> .../platform/rockchip/rkisp1/rkisp1-common.h  |  28 ++-
> .../platform/rockchip/rkisp1/rkisp1-isp.c     | 168 ++----------------
> .../platform/rockchip/rkisp1/rkisp1-resizer.c |  14 +-
> .../platform/rockchip/rkisp1/rkisp1-stats.c   |   2 +-
> 5 files changed, 193 insertions(+), 167 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.c
>index cf889666e166..bb0ea20118e1 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.c
>@@ -5,10 +5,158 @@
>  * Copyright (C) 2019 Collabora, Ltd.
>  */
>
>+#include <media/mipi-csi2.h>
> #include <media/v4l2-rect.h>
>
> #include "rkisp1-common.h"
>
>+static const struct rkisp1_mbus_info rkisp1_formats[] = {
>+	{
>+		.mbus_code	= MEDIA_BUS_FMT_YUYV8_2X8,
>+		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
>+		.direction	= RKISP1_ISP_SD_SRC,
>+	}, {
>+		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
>+		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>+		.mipi_dt	= MIPI_CSI2_DT_RAW10,
>+		.bayer_pat	= RKISP1_RAW_RGGB,
>+		.bus_width	= 10,
>+		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>+	}, {
>+		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
>+		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>+		.mipi_dt	= MIPI_CSI2_DT_RAW10,
>+		.bayer_pat	= RKISP1_RAW_BGGR,
>+		.bus_width	= 10,
>+		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>+	}, {
>+		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
>+		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>+		.mipi_dt	= MIPI_CSI2_DT_RAW10,
>+		.bayer_pat	= RKISP1_RAW_GBRG,
>+		.bus_width	= 10,
>+		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>+	}, {
>+		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
>+		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>+		.mipi_dt	= MIPI_CSI2_DT_RAW10,
>+		.bayer_pat	= RKISP1_RAW_GRBG,
>+		.bus_width	= 10,
>+		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>+	}, {
>+		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
>+		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>+		.mipi_dt	= MIPI_CSI2_DT_RAW12,
>+		.bayer_pat	= RKISP1_RAW_RGGB,
>+		.bus_width	= 12,
>+		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>+	}, {
>+		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
>+		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>+		.mipi_dt	= MIPI_CSI2_DT_RAW12,
>+		.bayer_pat	= RKISP1_RAW_BGGR,
>+		.bus_width	= 12,
>+		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>+	}, {
>+		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
>+		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>+		.mipi_dt	= MIPI_CSI2_DT_RAW12,
>+		.bayer_pat	= RKISP1_RAW_GBRG,
>+		.bus_width	= 12,
>+		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>+	}, {
>+		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
>+		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>+		.mipi_dt	= MIPI_CSI2_DT_RAW12,
>+		.bayer_pat	= RKISP1_RAW_GRBG,
>+		.bus_width	= 12,
>+		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>+	}, {
>+		.mbus_code	= MEDIA_BUS_FMT_SRGGB8_1X8,
>+		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>+		.mipi_dt	= MIPI_CSI2_DT_RAW8,
>+		.bayer_pat	= RKISP1_RAW_RGGB,
>+		.bus_width	= 8,
>+		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>+	}, {
>+		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
>+		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>+		.mipi_dt	= MIPI_CSI2_DT_RAW8,
>+		.bayer_pat	= RKISP1_RAW_BGGR,
>+		.bus_width	= 8,
>+		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>+	}, {
>+		.mbus_code	= MEDIA_BUS_FMT_SGBRG8_1X8,
>+		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>+		.mipi_dt	= MIPI_CSI2_DT_RAW8,
>+		.bayer_pat	= RKISP1_RAW_GBRG,
>+		.bus_width	= 8,
>+		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>+	}, {
>+		.mbus_code	= MEDIA_BUS_FMT_SGRBG8_1X8,
>+		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>+		.mipi_dt	= MIPI_CSI2_DT_RAW8,
>+		.bayer_pat	= RKISP1_RAW_GRBG,
>+		.bus_width	= 8,
>+		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>+	}, {
>+		.mbus_code	= MEDIA_BUS_FMT_YUYV8_1X16,
>+		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
>+		.mipi_dt	= MIPI_CSI2_DT_YUV422_8B,
>+		.yuv_seq	= RKISP1_CIF_ISP_ACQ_PROP_YCBYCR,
>+		.bus_width	= 16,
>+		.direction	= RKISP1_ISP_SD_SINK,
>+	}, {
>+		.mbus_code	= MEDIA_BUS_FMT_YVYU8_1X16,
>+		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
>+		.mipi_dt	= MIPI_CSI2_DT_YUV422_8B,
>+		.yuv_seq	= RKISP1_CIF_ISP_ACQ_PROP_YCRYCB,
>+		.bus_width	= 16,
>+		.direction	= RKISP1_ISP_SD_SINK,
>+	}, {
>+		.mbus_code	= MEDIA_BUS_FMT_UYVY8_1X16,
>+		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
>+		.mipi_dt	= MIPI_CSI2_DT_YUV422_8B,
>+		.yuv_seq	= RKISP1_CIF_ISP_ACQ_PROP_CBYCRY,
>+		.bus_width	= 16,
>+		.direction	= RKISP1_ISP_SD_SINK,
>+	}, {
>+		.mbus_code	= MEDIA_BUS_FMT_VYUY8_1X16,
>+		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
>+		.mipi_dt	= MIPI_CSI2_DT_YUV422_8B,
>+		.yuv_seq	= RKISP1_CIF_ISP_ACQ_PROP_CRYCBY,
>+		.bus_width	= 16,
>+		.direction	= RKISP1_ISP_SD_SINK,
>+	},
>+};
>+
>+unsigned int rkisp1_mbus_info_length(void)
>+{
>+	return ARRAY_SIZE(rkisp1_formats);
>+}
>+
>+const struct rkisp1_mbus_info *rkisp1_mbus_info_get_by_index(unsigned int index)
>+{
>+	if (index >= rkisp1_mbus_info_length())
>+		return NULL;
>+
>+	return &rkisp1_formats[index];
>+}
>+
>+const struct rkisp1_mbus_info *rkisp1_mbus_info_get_by_code(u32 mbus_code)
>+{
>+	unsigned int i;
>+
>+	for (i = 0; i < ARRAY_SIZE(rkisp1_formats); i++) {
>+		const struct rkisp1_mbus_info *fmt = &rkisp1_formats[i];
>+
>+		if (fmt->mbus_code == mbus_code)
>+			return fmt;
>+	}
>+
>+	return NULL;
>+}
>+
> static const struct v4l2_rect rkisp1_sd_min_crop = {
> 	.width = RKISP1_ISP_MIN_WIDTH,
> 	.height = RKISP1_ISP_MIN_HEIGHT,
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>index 50d31a254b03..c7d5c57607bd 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>@@ -26,7 +26,7 @@
> struct dentry;
>
> /*
>- * flags on the 'direction' field in struct 'rkisp1_isp_mbus_info' that indicate
>+ * flags on the 'direction' field in struct rkisp1_mbus_info' that indicate
>  * on which pad the media bus format is supported
>  */
> #define RKISP1_ISP_SD_SRC			BIT(0)
>@@ -150,8 +150,8 @@ struct rkisp1_isp {
> 	struct v4l2_subdev sd;
> 	struct media_pad pads[RKISP1_ISP_PAD_MAX];
> 	struct v4l2_subdev_pad_config pad_cfg[RKISP1_ISP_PAD_MAX];
>-	const struct rkisp1_isp_mbus_info *sink_fmt;
>-	const struct rkisp1_isp_mbus_info *src_fmt;
>+	const struct rkisp1_mbus_info *sink_fmt;
>+	const struct rkisp1_mbus_info *src_fmt;
> 	struct mutex ops_lock; /* serialize the subdevice ops */
> 	bool is_dphy_errctrl_disabled;
> 	__u32 frame_sequence;
>@@ -438,8 +438,8 @@ struct rkisp1_device {
> };
>
> /*
>- * struct rkisp1_isp_mbus_info - ISP media bus info, Translates media bus code to hardware
>- *				 format values
>+ * struct rkisp1_mbus_info - ISP media bus info, Translates media bus code to hardware
>+ *			     format values
>  *
>  * @mbus_code: media bus code
>  * @pixel_enc: pixel encoding
>@@ -449,7 +449,7 @@ struct rkisp1_device {
>  * @bayer_pat: bayer pattern
>  * @direction: a bitmask of the flags indicating on which pad the format is supported on
>  */
>-struct rkisp1_isp_mbus_info {
>+struct rkisp1_mbus_info {
> 	u32 mbus_code;
> 	enum v4l2_pixel_encoding pixel_enc;
> 	u32 mipi_dt;
>@@ -481,6 +481,18 @@ static inline u32 rkisp1_read(struct rkisp1_device *rkisp1, unsigned int addr)
> int rkisp1_cap_enum_mbus_codes(struct rkisp1_capture *cap,
> 			       struct v4l2_subdev_mbus_code_enum *code);
>
>+/*
>+ * rkisp1_mbus_info_length - Return the number of supported mbus codes
>+ */
>+unsigned int rkisp1_mbus_info_length(void);
>+
>+/*
>+ * rkisp1_mbus_info_get_by_index - Retrieve the ith supported mbus info
>+ *
>+ * @index: index of the mbus info to fetch
>+ */
>+const struct rkisp1_mbus_info *rkisp1_mbus_info_get_by_index(unsigned int index);
>+
> /*
>  * rkisp1_sd_adjust_crop_rect - adjust a rectangle to fit into another rectangle.
>  *
>@@ -500,11 +512,11 @@ void rkisp1_sd_adjust_crop(struct v4l2_rect *crop,
> 			   const struct v4l2_mbus_framefmt *bounds);
>
> /*
>- * rkisp1_isp_mbus_info - get the isp info of the media bus code
>+ * rkisp1_mbus_info_get_by_code - get the isp info of the media bus code
>  *
>  * @mbus_code: the media bus code
>  */
>-const struct rkisp1_isp_mbus_info *rkisp1_isp_mbus_info_get(u32 mbus_code);
>+const struct rkisp1_mbus_info *rkisp1_mbus_info_get_by_code(u32 mbus_code);
>
> /* rkisp1_params_configure - configure the params when stream starts.
>  *			     This function is called by the isp entity upon stream starts.
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>index 328e8fec14e9..89577119b571 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>@@ -15,7 +15,6 @@
> #include <linux/videodev2.h>
> #include <linux/vmalloc.h>
>
>-#include <media/mipi-csi2.h>
> #include <media/v4l2-event.h>
>
> #include "rkisp1-common.h"
>@@ -56,144 +55,10 @@
>  * +---------------------------------------------------------+
>  */
>
>-static const struct rkisp1_isp_mbus_info rkisp1_isp_formats[] = {
>-	{
>-		.mbus_code	= MEDIA_BUS_FMT_YUYV8_2X8,
>-		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
>-		.direction	= RKISP1_ISP_SD_SRC,
>-	}, {
>-		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
>-		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>-		.mipi_dt	= MIPI_CSI2_DT_RAW10,
>-		.bayer_pat	= RKISP1_RAW_RGGB,
>-		.bus_width	= 10,
>-		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>-	}, {
>-		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
>-		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>-		.mipi_dt	= MIPI_CSI2_DT_RAW10,
>-		.bayer_pat	= RKISP1_RAW_BGGR,
>-		.bus_width	= 10,
>-		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>-	}, {
>-		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
>-		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>-		.mipi_dt	= MIPI_CSI2_DT_RAW10,
>-		.bayer_pat	= RKISP1_RAW_GBRG,
>-		.bus_width	= 10,
>-		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>-	}, {
>-		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
>-		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>-		.mipi_dt	= MIPI_CSI2_DT_RAW10,
>-		.bayer_pat	= RKISP1_RAW_GRBG,
>-		.bus_width	= 10,
>-		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>-	}, {
>-		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
>-		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>-		.mipi_dt	= MIPI_CSI2_DT_RAW12,
>-		.bayer_pat	= RKISP1_RAW_RGGB,
>-		.bus_width	= 12,
>-		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>-	}, {
>-		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
>-		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>-		.mipi_dt	= MIPI_CSI2_DT_RAW12,
>-		.bayer_pat	= RKISP1_RAW_BGGR,
>-		.bus_width	= 12,
>-		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>-	}, {
>-		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
>-		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>-		.mipi_dt	= MIPI_CSI2_DT_RAW12,
>-		.bayer_pat	= RKISP1_RAW_GBRG,
>-		.bus_width	= 12,
>-		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>-	}, {
>-		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
>-		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>-		.mipi_dt	= MIPI_CSI2_DT_RAW12,
>-		.bayer_pat	= RKISP1_RAW_GRBG,
>-		.bus_width	= 12,
>-		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>-	}, {
>-		.mbus_code	= MEDIA_BUS_FMT_SRGGB8_1X8,
>-		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>-		.mipi_dt	= MIPI_CSI2_DT_RAW8,
>-		.bayer_pat	= RKISP1_RAW_RGGB,
>-		.bus_width	= 8,
>-		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>-	}, {
>-		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
>-		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>-		.mipi_dt	= MIPI_CSI2_DT_RAW8,
>-		.bayer_pat	= RKISP1_RAW_BGGR,
>-		.bus_width	= 8,
>-		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>-	}, {
>-		.mbus_code	= MEDIA_BUS_FMT_SGBRG8_1X8,
>-		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>-		.mipi_dt	= MIPI_CSI2_DT_RAW8,
>-		.bayer_pat	= RKISP1_RAW_GBRG,
>-		.bus_width	= 8,
>-		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>-	}, {
>-		.mbus_code	= MEDIA_BUS_FMT_SGRBG8_1X8,
>-		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>-		.mipi_dt	= MIPI_CSI2_DT_RAW8,
>-		.bayer_pat	= RKISP1_RAW_GRBG,
>-		.bus_width	= 8,
>-		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>-	}, {
>-		.mbus_code	= MEDIA_BUS_FMT_YUYV8_1X16,
>-		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
>-		.mipi_dt	= MIPI_CSI2_DT_YUV422_8B,
>-		.yuv_seq	= RKISP1_CIF_ISP_ACQ_PROP_YCBYCR,
>-		.bus_width	= 16,
>-		.direction	= RKISP1_ISP_SD_SINK,
>-	}, {
>-		.mbus_code	= MEDIA_BUS_FMT_YVYU8_1X16,
>-		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
>-		.mipi_dt	= MIPI_CSI2_DT_YUV422_8B,
>-		.yuv_seq	= RKISP1_CIF_ISP_ACQ_PROP_YCRYCB,
>-		.bus_width	= 16,
>-		.direction	= RKISP1_ISP_SD_SINK,
>-	}, {
>-		.mbus_code	= MEDIA_BUS_FMT_UYVY8_1X16,
>-		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
>-		.mipi_dt	= MIPI_CSI2_DT_YUV422_8B,
>-		.yuv_seq	= RKISP1_CIF_ISP_ACQ_PROP_CBYCRY,
>-		.bus_width	= 16,
>-		.direction	= RKISP1_ISP_SD_SINK,
>-	}, {
>-		.mbus_code	= MEDIA_BUS_FMT_VYUY8_1X16,
>-		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
>-		.mipi_dt	= MIPI_CSI2_DT_YUV422_8B,
>-		.yuv_seq	= RKISP1_CIF_ISP_ACQ_PROP_CRYCBY,
>-		.bus_width	= 16,
>-		.direction	= RKISP1_ISP_SD_SINK,
>-	},
>-};
>-
> /* ----------------------------------------------------------------------------
>  * Helpers
>  */
>
>-const struct rkisp1_isp_mbus_info *rkisp1_isp_mbus_info_get(u32 mbus_code)
>-{
>-	unsigned int i;
>-
>-	for (i = 0; i < ARRAY_SIZE(rkisp1_isp_formats); i++) {
>-		const struct rkisp1_isp_mbus_info *fmt = &rkisp1_isp_formats[i];
>-
>-		if (fmt->mbus_code == mbus_code)
>-			return fmt;
>-	}
>-
>-	return NULL;
>-}
>-
> static struct v4l2_subdev *rkisp1_get_remote_sensor(struct v4l2_subdev *sd)
> {
> 	struct media_pad *local, *remote;
>@@ -275,7 +140,7 @@ static void rkisp1_config_ism(struct rkisp1_device *rkisp1)
> static int rkisp1_config_isp(struct rkisp1_device *rkisp1)
> {
> 	u32 isp_ctrl = 0, irq_mask = 0, acq_mult = 0, signal = 0;
>-	const struct rkisp1_isp_mbus_info *src_fmt, *sink_fmt;
>+	const struct rkisp1_mbus_info *src_fmt, *sink_fmt;
> 	struct rkisp1_sensor_async *sensor;
> 	struct v4l2_mbus_framefmt *sink_frm;
> 	struct v4l2_rect *sink_crop;
>@@ -376,7 +241,7 @@ static int rkisp1_config_isp(struct rkisp1_device *rkisp1)
>
> static int rkisp1_config_dvp(struct rkisp1_device *rkisp1)
> {
>-	const struct rkisp1_isp_mbus_info *sink_fmt = rkisp1->isp.sink_fmt;
>+	const struct rkisp1_mbus_info *sink_fmt = rkisp1->isp.sink_fmt;
> 	u32 val, input_sel;
>
> 	switch (sink_fmt->bus_width) {
>@@ -402,7 +267,7 @@ static int rkisp1_config_dvp(struct rkisp1_device *rkisp1)
>
> static int rkisp1_config_mipi(struct rkisp1_device *rkisp1)
> {
>-	const struct rkisp1_isp_mbus_info *sink_fmt = rkisp1->isp.sink_fmt;
>+	const struct rkisp1_mbus_info *sink_fmt = rkisp1->isp.sink_fmt;
> 	unsigned int lanes = rkisp1->active_sensor->lanes;
> 	u32 mipi_ctrl;
>
>@@ -593,11 +458,12 @@ static int rkisp1_isp_enum_mbus_code(struct v4l2_subdev *sd,
> 		return 0;
> 	}
>
>-	if (code->index >= ARRAY_SIZE(rkisp1_isp_formats))
>+	if (code->index >= rkisp1_mbus_info_length())
> 		return -EINVAL;
>
>-	for (i = 0; i < ARRAY_SIZE(rkisp1_isp_formats); i++) {
>-		const struct rkisp1_isp_mbus_info *fmt = &rkisp1_isp_formats[i];
>+	for (i = 0; i < rkisp1_mbus_info_length(); i++) {
>+		const struct rkisp1_mbus_info *fmt =
>+			rkisp1_mbus_info_get_by_index(i);
>
> 		if (fmt->direction & dir)
> 			pos++;
>@@ -619,7 +485,7 @@ static int rkisp1_isp_enum_frame_size(struct v4l2_subdev *sd,
> 				      struct v4l2_subdev_state *sd_state,
> 				      struct v4l2_subdev_frame_size_enum *fse)
> {
>-	const struct rkisp1_isp_mbus_info *mbus_info;
>+	const struct rkisp1_mbus_info *mbus_info;
>
> 	if (fse->pad == RKISP1_ISP_PAD_SINK_PARAMS ||
> 	    fse->pad == RKISP1_ISP_PAD_SOURCE_STATS)
>@@ -628,7 +494,7 @@ static int rkisp1_isp_enum_frame_size(struct v4l2_subdev *sd,
> 	if (fse->index > 0)
> 		return -EINVAL;
>
>-	mbus_info = rkisp1_isp_mbus_info_get(fse->code);
>+	mbus_info = rkisp1_mbus_info_get_by_code(fse->code);
> 	if (!mbus_info)
> 		return -EINVAL;
>
>@@ -695,7 +561,7 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
> 				   struct v4l2_mbus_framefmt *format,
> 				   unsigned int which)
> {
>-	const struct rkisp1_isp_mbus_info *mbus_info;
>+	const struct rkisp1_mbus_info *mbus_info;
> 	struct v4l2_mbus_framefmt *src_fmt;
> 	const struct v4l2_rect *src_crop;
>
>@@ -705,10 +571,10 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
> 					   RKISP1_ISP_PAD_SOURCE_VIDEO, which);
>
> 	src_fmt->code = format->code;
>-	mbus_info = rkisp1_isp_mbus_info_get(src_fmt->code);
>+	mbus_info = rkisp1_mbus_info_get_by_code(src_fmt->code);
> 	if (!mbus_info || !(mbus_info->direction & RKISP1_ISP_SD_SRC)) {
> 		src_fmt->code = RKISP1_DEF_SRC_PAD_FMT;
>-		mbus_info = rkisp1_isp_mbus_info_get(src_fmt->code);
>+		mbus_info = rkisp1_mbus_info_get_by_code(src_fmt->code);
> 	}
> 	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
> 		isp->src_fmt = mbus_info;
>@@ -793,7 +659,7 @@ static void rkisp1_isp_set_sink_fmt(struct rkisp1_isp *isp,
> 				    struct v4l2_mbus_framefmt *format,
> 				    unsigned int which)
> {
>-	const struct rkisp1_isp_mbus_info *mbus_info;
>+	const struct rkisp1_mbus_info *mbus_info;
> 	struct v4l2_mbus_framefmt *sink_fmt;
> 	struct v4l2_rect *sink_crop;
>
>@@ -801,10 +667,10 @@ static void rkisp1_isp_set_sink_fmt(struct rkisp1_isp *isp,
> 					  RKISP1_ISP_PAD_SINK_VIDEO,
> 					  which);
> 	sink_fmt->code = format->code;
>-	mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
>+	mbus_info = rkisp1_mbus_info_get_by_code(sink_fmt->code);
> 	if (!mbus_info || !(mbus_info->direction & RKISP1_ISP_SD_SINK)) {
> 		sink_fmt->code = RKISP1_DEF_SINK_PAD_FMT;
>-		mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
>+		mbus_info = rkisp1_mbus_info_get_by_code(sink_fmt->code);
> 	}
> 	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
> 		isp->sink_fmt = mbus_info;
>@@ -1080,8 +946,8 @@ int rkisp1_isp_register(struct rkisp1_device *rkisp1)
> 	pads[RKISP1_ISP_PAD_SOURCE_VIDEO].flags = MEDIA_PAD_FL_SOURCE;
> 	pads[RKISP1_ISP_PAD_SOURCE_STATS].flags = MEDIA_PAD_FL_SOURCE;
>
>-	isp->sink_fmt = rkisp1_isp_mbus_info_get(RKISP1_DEF_SINK_PAD_FMT);
>-	isp->src_fmt = rkisp1_isp_mbus_info_get(RKISP1_DEF_SRC_PAD_FMT);
>+	isp->sink_fmt = rkisp1_mbus_info_get_by_code(RKISP1_DEF_SINK_PAD_FMT);
>+	isp->src_fmt = rkisp1_mbus_info_get_by_code(RKISP1_DEF_SRC_PAD_FMT);
>
> 	mutex_init(&isp->ops_lock);
> 	ret = media_entity_pads_init(&sd->entity, RKISP1_ISP_PAD_MAX, pads);
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
>index 1c07985c810d..f4caa8f684aa 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
>@@ -433,14 +433,14 @@ static void rkisp1_rsz_set_src_fmt(struct rkisp1_resizer *rsz,
> 				   struct v4l2_mbus_framefmt *format,
> 				   unsigned int which)
> {
>-	const struct rkisp1_isp_mbus_info *sink_mbus_info;
>+	const struct rkisp1_mbus_info *sink_mbus_info;
> 	struct v4l2_mbus_framefmt *src_fmt, *sink_fmt;
>
> 	sink_fmt = rkisp1_rsz_get_pad_fmt(rsz, sd_state, RKISP1_RSZ_PAD_SINK,
> 					  which);
> 	src_fmt = rkisp1_rsz_get_pad_fmt(rsz, sd_state, RKISP1_RSZ_PAD_SRC,
> 					 which);
>-	sink_mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
>+	sink_mbus_info = rkisp1_mbus_info_get_by_code(sink_fmt->code);
>
> 	/* for YUV formats, userspace can change the mbus code on the src pad if it is supported */
> 	if (sink_mbus_info->pixel_enc == V4L2_PIXEL_ENC_YUV &&
>@@ -462,7 +462,7 @@ static void rkisp1_rsz_set_sink_crop(struct rkisp1_resizer *rsz,
> 				     struct v4l2_rect *r,
> 				     unsigned int which)
> {
>-	const struct rkisp1_isp_mbus_info *mbus_info;
>+	const struct rkisp1_mbus_info *mbus_info;
> 	struct v4l2_mbus_framefmt *sink_fmt;
> 	struct v4l2_rect *sink_crop;
>
>@@ -473,7 +473,7 @@ static void rkisp1_rsz_set_sink_crop(struct rkisp1_resizer *rsz,
> 					    which);
>
> 	/* Not crop for MP bayer raw data */
>-	mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
>+	mbus_info = rkisp1_mbus_info_get_by_code(sink_fmt->code);
>
> 	if (rsz->id == RKISP1_MAINPATH &&
> 	    mbus_info->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
>@@ -500,7 +500,7 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
> 				    struct v4l2_mbus_framefmt *format,
> 				    unsigned int which)
> {
>-	const struct rkisp1_isp_mbus_info *mbus_info;
>+	const struct rkisp1_mbus_info *mbus_info;
> 	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
> 	struct v4l2_rect *sink_crop;
>
>@@ -516,10 +516,10 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
> 	else
> 		sink_fmt->code = format->code;
>
>-	mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
>+	mbus_info = rkisp1_mbus_info_get_by_code(sink_fmt->code);
> 	if (!mbus_info || !(mbus_info->direction & RKISP1_ISP_SD_SRC)) {
> 		sink_fmt->code = RKISP1_DEF_FMT;
>-		mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
>+		mbus_info = rkisp1_mbus_info_get_by_code(sink_fmt->code);
> 	}
> 	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
> 		rsz->pixel_enc = mbus_info->pixel_enc;
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
>index 7d82356b5345..2795eef91bdd 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
>@@ -305,7 +305,7 @@ static void rkisp1_stats_get_bls_meas(struct rkisp1_stats *stats,
> 				      struct rkisp1_stat_buffer *pbuf)
> {
> 	struct rkisp1_device *rkisp1 = stats->rkisp1;
>-	const struct rkisp1_isp_mbus_info *in_fmt = rkisp1->isp.sink_fmt;
>+	const struct rkisp1_mbus_info *in_fmt = rkisp1->isp.sink_fmt;
> 	struct rkisp1_cif_isp_bls_meas_val *bls_val;
>
> 	bls_val = &pbuf->params.ae.bls_val;
>-- 
>2.30.2
>
