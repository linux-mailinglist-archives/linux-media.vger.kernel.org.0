Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E9495ABC99
	for <lists+linux-media@lfdr.de>; Sat,  3 Sep 2022 05:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231575AbiICDfY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Sep 2022 23:35:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231696AbiICDfW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Sep 2022 23:35:22 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A8E752FD8
        for <linux-media@vger.kernel.org>; Fri,  2 Sep 2022 20:35:19 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 857BA32003D3;
        Fri,  2 Sep 2022 23:35:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 02 Sep 2022 23:35:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1662176117; x=1662262517; bh=Mw4Cx7HUXc
        lHY7TIRh8AKpgpCbjuuNwGC0o7BbQtS+M=; b=U2waOlJt6cINA1GXtOUBw6SfOz
        /daEE/3YEwjp3HrToEvn6WB8+UM/78T2DR5IoUPzdSmx21vF/raTEn9u4MAWYJJO
        x3taiE+mOnTd9rIsySaJmtEEqz6BgxV8vizUAJhk3pPQxmruc409aUh9cwyqAG/8
        vt5f73g0XV4PnxiYNdTt5vt9jVPlJhArbyagpFuknj08iLZ/+WVbiXHNv2dpSWQL
        Shet1dHVMhGqKpcYIz2HtfMPflmG05PfgucBagkUGnqFToKJxCfHEQjreCBzW5f5
        dUZtnHcG3knMC/Zk+SS2ErSmzD7607uNwCAl5B7emXe1B0NGue7kHj6NUF+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1662176117; x=1662262517; bh=Mw4Cx7HUXclHY7TIRh8AKpgpCbju
        uNwGC0o7BbQtS+M=; b=OXYF10qMnlwMrJIu5zv2SDgzjSNKZYG74H/APJRiYlzz
        PT7HjikCHpwJpJ+Hh0kMp4jWh9B61ulfA+AKzdkC666zN8b4EtyokXSdgcQcmzHS
        usW2rEV6IdZeB/4WLtvjGuQhScfB1gUSloGMC9fXotJKjaZcZQULoVXsrxgUJ2s6
        Dn4w5QtkVI75JOJ81QaE4foXDXb1Cn11mVBFYyq3e8kaPpR1PRsYQzkAxDDefVwf
        XfcrY58K1lx9mp2RSs0tIiUkkMKyyZUhjdXUe+o74m0XTVea2Q1P54cQMYuKUOvl
        GnuVCP8h0J1bTJg9xa3r/Qx1BwIu7GvicrZaPKffoQ==
X-ME-Sender: <xms:dcsSY_KMCRKGwtqOzUqrlATd2sdjyDCKAH3K907nnKu13iREk2T2Ng>
    <xme:dcsSYzKLwFUUeb7fF5vjxcSkykrzPh0EU7Y_nXsuh1DHq3zim4LllQf-GNMUqQ8Fx
    oQplJ8Ai-OFkVqr-18>
X-ME-Received: <xmr:dcsSY3uIgiWAh86RjFG8isD0vMIgpXIJWaZvtEbN6Rwqf8I_jFmG9w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeluddgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:dcsSY4YKev-Xe28tKFgcyv7lnU8I7Dk8yIKO11crkngiRU7_QkRSrA>
    <xmx:dcsSY2ajNpBLHHNpEY03dobJoHn1OrPs4iJ1L-_ajZ_KvvPrbNFZ1g>
    <xmx:dcsSY8DS_xQIZD24Y-X-jXzIxLsdVpFVc_Rf1lOo2bY19KvEcQwGzg>
    <xmx:dcsSY2HQRzSQNoOadu7Doj7j86_ZnjjBD-p2Q-tgEdWhQlnHemXMdQ>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Sep 2022 23:35:15 -0400 (EDT)
Date:   Sat, 3 Sep 2022 06:35:13 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Florian Sylvestre <fsylvestre@baylibre.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v2 4/9] media: rkisp1: Allow setting all color space
 fields on ISP source pad
Message-ID: <20220903033513.6aikuprgp5ay6mmy@guri>
References: <20220823171840.8958-1-laurent.pinchart@ideasonboard.com>
 <20220823171840.8958-5-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220823171840.8958-5-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23.08.2022 20:18, Laurent Pinchart wrote:
>The ISP output color space is configured through the ISP source pad. At
>the moment, only the quantization can be set. Extend it to the three
>other color space fields:
>
>- The ycbcr_enc field will be used to configure the RGB to YUV matrix
>  (currently hardcoded to Rec. 601).
>
>- The colorspace (which controls the color primaries) and xfer_func
>  fields will not be used to configure the ISP, as the corresponding
>  hardware blocks (the cross-talk RGB to RGB matrix and the tone mapping
>  curve) are programmed directly by applications through ISP parameters.
>  Nonetheless, those two fields should be set by applications to match
>  the ISP configuration, in order to propagate the correct color space
>  down the pipeline up to the capture video nodes.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>---
>Changes since v1:
>
>- Fix quantization setting that was set on sink pad by mistake
>---
> .../platform/rockchip/rkisp1/rkisp1-isp.c     | 55 ++++++++++++++++---
> 1 file changed, 48 insertions(+), 7 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>index d34f32271d74..7869f0cced62 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>@@ -609,6 +609,7 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
> 	struct v4l2_mbus_framefmt *sink_fmt;
> 	struct v4l2_mbus_framefmt *src_fmt;
> 	const struct v4l2_rect *src_crop;
>+	bool set_csc;
>
> 	sink_fmt = rkisp1_isp_get_pad_fmt(isp, sd_state,
> 					  RKISP1_ISP_PAD_SINK_VIDEO, which);
>@@ -645,20 +646,60 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
> 	src_fmt->height = src_crop->height;
>
> 	/*
>-	 * The CSC API is used to allow userspace to force full
>-	 * quantization on YUV formats.
>+	 * Copy the color space for the sink pad. When converting from Bayer to
>+	 * YUV, default to a limited quantization range.
> 	 */
>-	if (format->flags & V4L2_MBUS_FRAMEFMT_SET_CSC &&
>-	    format->quantization == V4L2_QUANTIZATION_FULL_RANGE &&
>+	src_fmt->colorspace = sink_fmt->colorspace;
>+	src_fmt->xfer_func = sink_fmt->xfer_func;
>+	src_fmt->ycbcr_enc = sink_fmt->ycbcr_enc;
>+
>+	if (sink_info->pixel_enc == V4L2_PIXEL_ENC_BAYER &&
> 	    src_info->pixel_enc == V4L2_PIXEL_ENC_YUV)
>-		src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>-	else if (src_info->pixel_enc == V4L2_PIXEL_ENC_YUV)
> 		src_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
> 	else
>-		src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>+		src_fmt->quantization = sink_fmt->quantization;
>+
>+	/*
>+	 * Allow setting the source color space fields when the SET_CSC flag is
>+	 * set and the source format is YUV. If the sink format is YUV, don't
>+	 * set the color primaries, transfer function or YCbCr encoding as the
>+	 * ISP is bypassed in that case and passes YUV data through without
>+	 * modifications.
>+	 *
>+	 * The color primaries and transfer function are configured through the
>+	 * cross-talk matrix and tone curve respectively. Settings for those
>+	 * hardware blocks are conveyed through the ISP parameters buffer, as
>+	 * they need to combine color space information with other image tuning
>+	 * characteristics and can't thus be computed by the kernel based on the
>+	 * color space. The source pad colorspace and xfer_func fields are thus
>+	 * ignored by the driver, but can be set by userspace to propagate
>+	 * accurate color space information down the pipeline.
>+	 */
>+	set_csc = !!(format->flags & V4L2_MBUS_FRAMEFMT_SET_CSC);

the (!!) operator is used to convert boolean to interger rigth?
I think it it not needed here, since 'set_csc' is only used in 'if' conditions

anyway

Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

Thanks,
Danfa

>+
>+	if (set_csc && src_info->pixel_enc == V4L2_PIXEL_ENC_YUV) {
>+		if (sink_info->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
>+			if (format->colorspace != V4L2_COLORSPACE_DEFAULT)
>+				src_fmt->colorspace = format->colorspace;
>+			if (format->xfer_func != V4L2_XFER_FUNC_DEFAULT)
>+				src_fmt->xfer_func = format->xfer_func;
>+			if (format->ycbcr_enc != V4L2_YCBCR_ENC_DEFAULT)
>+				src_fmt->ycbcr_enc = format->ycbcr_enc;
>+		}
>+
>+		if (format->quantization != V4L2_QUANTIZATION_DEFAULT)
>+			src_fmt->quantization = format->quantization;
>+	}
>
> 	*format = *src_fmt;
>
>+	/*
>+	 * Restore the SET_CSC flag if it was set to indicate support for the
>+	 * CSC setting API.
>+	 */
>+	if (set_csc)
>+		format->flags |= V4L2_MBUS_FRAMEFMT_SET_CSC;
>+
> 	/* Store the source format info when setting the active format. */
> 	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
> 		isp->src_fmt = src_info;
>-- 
>Regards,
>
>Laurent Pinchart
>
