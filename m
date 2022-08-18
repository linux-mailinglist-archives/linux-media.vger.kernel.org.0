Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C17F1597D54
	for <lists+linux-media@lfdr.de>; Thu, 18 Aug 2022 06:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243286AbiHREWD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Aug 2022 00:22:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243235AbiHREVm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Aug 2022 00:21:42 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70CA240BDD
        for <linux-media@vger.kernel.org>; Wed, 17 Aug 2022 21:21:27 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id D39175C017E;
        Thu, 18 Aug 2022 00:21:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 18 Aug 2022 00:21:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1660796486; x=1660882886; bh=hTu7b4HCFK
        OATlSYUx8gl9lXAgj9f7r6wDvO4XVwMAw=; b=cdc2CsBVoClaBfH1Q9AcrQu6dq
        enITIsQGGnmVcvrHQh1y5PMl2cxQ6yXEasKF5sof2+taPDey3/SatJ6BgdG+QK2+
        389vvuAEefHpiKVxC+tv+RO/kYrDan+Wao5rDFkSpBuSJnmI3h2nfb8W14fgqFzO
        7g2Hq0VbAO/3ooMdjoURFySspERLREBT7iO1ucAwEEueRRbCkS+7nDn7MsVnRVio
        1JDlVI+2hdAs2oV9XJqlX8gc/FyyimSG/dYkXLooJM/OcspZYZ6KQMuuJFCAOPgI
        /VhqjWkpQvnwxAPm8AOsDKtx0DG3/xG3AhpkqW4Pd36Pjr8PpUpdlQG/THWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1660796486; x=1660882886; bh=hTu7b4HCFKOATlSYUx8gl9lXAgj9
        f7r6wDvO4XVwMAw=; b=Is+8bwU7zOdcLC7AcWXzU/c5DqzJq+o8rL2Pvx89RTsk
        g4q7fSJcOB0am5WRts6Gnjup5VvHZS5GS75EJ426Jc2Dms7wB5i3AYSCC6Zte5G4
        +XXJ/xI9ZlCixEoIUSfLy4c1dq5huTVKA20ASQpILuWjyUzaL+R/z0ri5wSaD78V
        5Bt1OvbyrSHNNQTntN1AryZlu20JVYT5u96kfiId/xc4KMMLgptS+rhBhTd3LC1r
        3+GB9UDSUPCjOuDkLRF+2AISolJCv7gZ6NBXf5QfFX5WpTzpLXgvmSR2+kCpmg+J
        nrn8qFQvOdF+NP009Dw2xO1l8G3WKNDROlIYQch7Vg==
X-ME-Sender: <xms:Rr79Yl0Ut6vUxWiUhQPsbSlXQPhdWkVTzUpOUe6RXlQtbvKKWtwnlw>
    <xme:Rr79YsFV8UwfpW6WuCxUFdqPS3BD9G904UiTEbnUPPG8Yy-RFBEnD_osE97feGmww
    eOagEniX6kPf4Yzzlc>
X-ME-Received: <xmr:Rr79Yl5BGfn79kEWtqnLEGxA3JciJ7XCAc7GyWtdw7lvEshanpdKkw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehjedgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:Rr79Yi21BsyVWNhd2oggwbkSty7MNU0qqRuNs_kYvecsPQGAjfqCCQ>
    <xmx:Rr79YoFWYS3twSb1u2tAs-5b__sMi-l_O2sLKbohCEUpxlKxJeo18Q>
    <xmx:Rr79Yj9X_OOo9H7-91MmvCY61LS2tcJrAPReCCqNzMBX5dNn4urjZQ>
    <xmx:Rr79YtRStqpolkmsOPT2zNFK_TGzVTa8d4qyUiBa3NqWYhXS5Vzc9Q>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Aug 2022 00:21:25 -0400 (EDT)
Date:   Thu, 18 Aug 2022 07:21:19 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Florian Sylvestre <fsylvestre@baylibre.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH 3/7] media: rkisp1: Fix source pad format configuration
Message-ID: <20220818042119.z43u3huzys7jk73k@guri>
References: <20220815065235.23797-1-laurent.pinchart@ideasonboard.com>
 <20220815065235.23797-4-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220815065235.23797-4-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15.08.2022 09:52, Laurent Pinchart wrote:
>The ISP converts Bayer data to YUV when operating normally, and can also
>operate in pass-through mode where the input and output formats must
>match. Converting from YUV to Bayer isn't possible. If such an invalid
>configuration is attempted, adjust it by copying the sink pad media bus
>code to the source pad.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

>---
> .../platform/rockchip/rkisp1/rkisp1-isp.c     | 40 +++++++++++++++----
> 1 file changed, 32 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>index 32114d1e8ad1..0441ccbc01a9 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>@@ -604,23 +604,43 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
> 				   struct v4l2_mbus_framefmt *format,
> 				   unsigned int which)
> {
>-	const struct rkisp1_mbus_info *mbus_info;
>+	const struct rkisp1_mbus_info *sink_info;
>+	const struct rkisp1_mbus_info *src_info;
>+	struct v4l2_mbus_framefmt *sink_fmt;
> 	struct v4l2_mbus_framefmt *src_fmt;
> 	const struct v4l2_rect *src_crop;
>
>+	sink_fmt = rkisp1_isp_get_pad_fmt(isp, sd_state,
>+					  RKISP1_ISP_PAD_SINK_VIDEO, which);
> 	src_fmt = rkisp1_isp_get_pad_fmt(isp, sd_state,
> 					 RKISP1_ISP_PAD_SOURCE_VIDEO, which);
> 	src_crop = rkisp1_isp_get_pad_crop(isp, sd_state,
> 					   RKISP1_ISP_PAD_SOURCE_VIDEO, which);
>
>+	/*
>+	 * Media bus code. The ISP can operate in pass-through mode (Bayer in,
>+	 * Bayer out or YUV in, YUV out) or process Bayer data to YUV, but
>+	 * can't convert from YUV to Bayer.
>+	 */
>+	sink_info = rkisp1_mbus_info_get_by_code(sink_fmt->code);
>+
> 	src_fmt->code = format->code;
>-	mbus_info = rkisp1_mbus_info_get_by_code(src_fmt->code);
>-	if (!mbus_info || !(mbus_info->direction & RKISP1_ISP_SD_SRC)) {
>+	src_info = rkisp1_mbus_info_get_by_code(src_fmt->code);
>+	if (!src_info || !(src_info->direction & RKISP1_ISP_SD_SRC)) {
> 		src_fmt->code = RKISP1_DEF_SRC_PAD_FMT;
>-		mbus_info = rkisp1_mbus_info_get_by_code(src_fmt->code);
>+		src_info = rkisp1_mbus_info_get_by_code(src_fmt->code);
> 	}
>-	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
>-		isp->src_fmt = mbus_info;
>+
>+	if (sink_info->pixel_enc == V4L2_PIXEL_ENC_YUV &&
>+	    src_info->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
>+		src_fmt->code = sink_fmt->code;
>+		src_info = sink_info;
>+	}
>+
>+	/*
>+	 * The source width and height must be identical to the source crop
>+	 * size.
>+	 */
> 	src_fmt->width  = src_crop->width;
> 	src_fmt->height = src_crop->height;
>
>@@ -630,14 +650,18 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
> 	 */
> 	if (format->flags & V4L2_MBUS_FRAMEFMT_SET_CSC &&
> 	    format->quantization == V4L2_QUANTIZATION_FULL_RANGE &&
>-	    mbus_info->pixel_enc == V4L2_PIXEL_ENC_YUV)
>+	    src_info->pixel_enc == V4L2_PIXEL_ENC_YUV)
> 		src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>-	else if (mbus_info->pixel_enc == V4L2_PIXEL_ENC_YUV)
>+	else if (src_info->pixel_enc == V4L2_PIXEL_ENC_YUV)
> 		src_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
> 	else
> 		src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>
> 	*format = *src_fmt;
>+
>+	/* Store the source format info when setting the active format. */
>+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
>+		isp->src_fmt = src_info;
> }
>
> static void rkisp1_isp_set_src_crop(struct rkisp1_isp *isp,
>-- 
>Regards,
>
>Laurent Pinchart
>
