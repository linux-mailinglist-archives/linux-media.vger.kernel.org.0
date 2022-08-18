Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C235597C6F
	for <lists+linux-media@lfdr.de>; Thu, 18 Aug 2022 05:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243191AbiHRDtU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Aug 2022 23:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243198AbiHRDsn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Aug 2022 23:48:43 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 590B25E336
        for <linux-media@vger.kernel.org>; Wed, 17 Aug 2022 20:48:41 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id BBA4F5C0070;
        Wed, 17 Aug 2022 23:48:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 17 Aug 2022 23:48:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1660794520; x=1660880920; bh=uCFWkcf5aa
        r3NA7j/VNhGFJhNCWMCuG1CjdQ+sHEMxI=; b=Qf1BE2OviVC7GkUnL0aGXjR/J1
        mDBMtjGlTSJZKW+4mSP6vdwPyO8A4fff0jqVkATAJpPHhqznHup3NXNgIs7XAUFb
        mp5AU4iqFJO22+SVQdBTzBAvghHo8AnrQu095JdPF32Bne+eBaG15ddlCSqFNoQC
        VFmTbbgPXepPNj4A0CEcPaGQT48Lq+/CJ0O2fuM+/S8WNo0EXSEg8aTASJvUGAd7
        01A/0LxWbz7wasCcil8lZ0QeFJbQdlcx+kqB9ZptQ9OSWgNjiHx9t+Wh+kshbwJe
        AH8SlJU3tZtVHLS0oq81WofToY4wbbwVQHi0tn9dBOvUSLxSQzZ++96nF0JQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1660794520; x=1660880920; bh=uCFWkcf5aar3NA7j/VNhGFJhNCWM
        CuG1CjdQ+sHEMxI=; b=0ubFzNg0UVhm8CA8Yr4CowShl1WHKzH+8gQzmZXSUqRT
        uDXmqeKB1XSNbM56Oq7GV2JRe/c0CrbsK1wV6D4+cRvMmpTvXQaxwEyan6ZrIZYj
        l5ntcIk+X4x7E3iOPcgHho/Wg8Op07cotG3DG8QMNso22v42YOS+sRYYCqPkv5C4
        1eIy4QEpb9NMXFTVREOGH1VUrf40uFs05ffp6IMAPz/XcawxbR5ALapm/p6hHC8D
        Q44DnwstR7xmIiFg2nFMHvVaEDc6ATbsGytd8ctJkKhqbNdMQ/LepWSazn+j7XB9
        RTKUGzxR4yKA8BKtmZ7HnDC6jIicNqqENZu3UCKuqA==
X-ME-Sender: <xms:l7b9YnHtFN90lOHTlQEC9eVAgypeMzHXYWXGTkZyRbc8vqGHm1lTeQ>
    <xme:l7b9YkW7XvMl1kTDVoB1ueN68PkA_8be7NVxgOdSuPaHt-c0Uqp6DvKQhht0n8Gzp
    VFxaVmgpY1ODfMPYvo>
X-ME-Received: <xmr:l7b9YpISkiy2LaRFagiyTRycaDF5V5C9vY2MG0Ytq9yOF53GmRXo6A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehjedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:l7b9YlGAXDbeogD5nfR-KFg5ilJjiqUF82lDX4GPp6y-gmW_x-eFCQ>
    <xmx:l7b9YtUsmwX04aIiT98CEaXefj0lcAR3bF9eehhEmqm31PscMx7J8w>
    <xmx:l7b9YgMRnFiefs7_5LAb3q71vlnXdhPdMwScmAtiBZz_eP0DhCLhXg>
    <xmx:mLb9YqgfbZzEncNXE4kXc-jEiCDS7ffZAXdcFpfyNt3cxSeGd5HQbQ>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Aug 2022 23:48:38 -0400 (EDT)
Date:   Thu, 18 Aug 2022 06:48:35 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Florian Sylvestre <fsylvestre@baylibre.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH 1/7] media: rkisp1: Initialize color space on sink and
 source pads
Message-ID: <20220818034835.sa5mzgcloyjh2reh@guri>
References: <20220815065235.23797-1-laurent.pinchart@ideasonboard.com>
 <20220815065235.23797-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220815065235.23797-2-laurent.pinchart@ideasonboard.com>
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
>Initialize the four color space fields on the sink and source
>video pads in the .init_cfg() operation. As the main use case for the
>ISP is to convert Bayer data to YUV, select a raw color space on the
>sink pad and a limited range quantization of SYCC on the source pad by
>default.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

>---
> drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 10 ++++++++++
> 1 file changed, 10 insertions(+)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>index a3c7d4d88387..a52b22824739 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>@@ -553,12 +553,17 @@ static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
> 	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
> 	struct v4l2_rect *sink_crop, *src_crop;
>
>+	/* Video. */
> 	sink_fmt = v4l2_subdev_get_try_format(sd, sd_state,
> 					      RKISP1_ISP_PAD_SINK_VIDEO);
> 	sink_fmt->width = RKISP1_DEFAULT_WIDTH;
> 	sink_fmt->height = RKISP1_DEFAULT_HEIGHT;
> 	sink_fmt->field = V4L2_FIELD_NONE;
> 	sink_fmt->code = RKISP1_DEF_SINK_PAD_FMT;
>+	sink_fmt->colorspace = V4L2_COLORSPACE_RAW;
>+	sink_fmt->xfer_func = V4L2_XFER_FUNC_NONE;
>+	sink_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
>+	sink_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>
> 	sink_crop = v4l2_subdev_get_try_crop(sd, sd_state,
> 					     RKISP1_ISP_PAD_SINK_VIDEO);
>@@ -571,11 +576,16 @@ static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
> 					     RKISP1_ISP_PAD_SOURCE_VIDEO);
> 	*src_fmt = *sink_fmt;
> 	src_fmt->code = RKISP1_DEF_SRC_PAD_FMT;
>+	src_fmt->colorspace = V4L2_COLORSPACE_SRGB;
>+	src_fmt->xfer_func = V4L2_XFER_FUNC_SRGB;
>+	src_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
>+	src_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
>
> 	src_crop = v4l2_subdev_get_try_crop(sd, sd_state,
> 					    RKISP1_ISP_PAD_SOURCE_VIDEO);
> 	*src_crop = *sink_crop;
>
>+	/* Parameters and statistics. */
> 	sink_fmt = v4l2_subdev_get_try_format(sd, sd_state,
> 					      RKISP1_ISP_PAD_SINK_PARAMS);
> 	src_fmt = v4l2_subdev_get_try_format(sd, sd_state,
>-- 
>Regards,
>
>Laurent Pinchart
>
