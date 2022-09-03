Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 381DB5ABD15
	for <lists+linux-media@lfdr.de>; Sat,  3 Sep 2022 06:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231434AbiICEp7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Sep 2022 00:45:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbiICEp6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Sep 2022 00:45:58 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17925D2929
        for <linux-media@vger.kernel.org>; Fri,  2 Sep 2022 21:45:57 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 684A5320027A;
        Sat,  3 Sep 2022 00:45:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sat, 03 Sep 2022 00:45:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1662180352; x=1662266752; bh=n5K/X15uCA
        IusP+ofYYh04A/n3YRLWCXHGZN4DQ92Vg=; b=NlNLUzHbIikB1pk9hNMW13/EcT
        f59AbiQvOjUkny//NErlyo7luRc29Gm3hpDJN7i+9tEKovmMuDoBzeOJQyac0aiB
        ToHrVDfUv6dhr3/C6dV/XnoTDEkMtoWRRSeC6OUvUoF8deMc5GJNRIpodbNUgSnQ
        fxj3HiHT01TuVW3S2PrrC/C+hNChy6V31HMW8hjKR/ja1p7PZ+U2IOp4TLm3gPw8
        hv7Sim2vDooOV1vaNit5b2FtAlq6j/0wuKiNvpojKLV2ODUT98XDtf0e2ndJz2so
        a21oWhH29iV08Je59bKAGiFpfr1DB+5/nFmHk6jnJbv+wJFc1rSh9GaTZe8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1662180352; x=1662266752; bh=n5K/X15uCAIusP+ofYYh04A/n3YR
        LWCXHGZN4DQ92Vg=; b=nuFbQ/IsnbeenTvRc70WZjEIeQWyx+8FKGcJ7kesrxrw
        umH/3JWG2pMvBXrvkeUcVwORkQPmGcxUdkYOezKuohU8QXGErsVPI7lKvN9fDdCE
        CDJFGCmQQ0CX4/qsI39lRhkGZFDhSHxulqy2qb1ICvLW5+L1YkAWkpR7OLWRa1dy
        LmlHD9rzbDxLRYAVjzFkEt/W9Bu4MX0lZq4d14t5IIMxVp+NTeukEInWMwT9Pm1U
        aDFKx4dgo4lyLka0C8a1cSiAPAkOGlj7YNmsoMDva+lE+G0+YyN0G14DNoVDZH97
        D2kOl6Clabp+2lleb3UihhOUsSDmyrYMJJQMxL0qGw==
X-ME-Sender: <xms:ANwSYwUMK-vu_Cv4e6XxFGLA9kEywNPtNC43g195q_HImsPiwm9mfQ>
    <xme:ANwSY0m4soCTh1hLZ0D29PuLVpNSfpaA86brqgsYEn4mLxms46mTMY4iRZC0iRDl6
    ytEA1G28Vg4qwhXRvU>
X-ME-Received: <xmr:ANwSY0ZlVoar6FKjRsBHemW1FFFVp4BnXSap2kF2es_bhjuzAO0FGQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeluddgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:ANwSY_VuMSfqBSoGuoFVlmo9wHtF52gfE1hgxH4FtIn0CqwviGmJwA>
    <xmx:ANwSY6kg3BX9pKgWOV257mVVGXUoSzS1IhnMU7vW58h0O3i2eA3Y8g>
    <xmx:ANwSY0daxD5yyEAWGefL4DBmLjsfTSBf6NSAazKtO92XP8DG4gFaUQ>
    <xmx:ANwSY8ghTRbCTM0wIdF4i0hjJ0zngyuSu3xvg2FMYWDmR49_6lNM9g>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 3 Sep 2022 00:45:50 -0400 (EDT)
Date:   Sat, 3 Sep 2022 07:45:47 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Florian Sylvestre <fsylvestre@baylibre.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v2 9/9] media: rkisp1: Allow setting color space on
 resizer sink pad
Message-ID: <20220903044547.6eetyeyr4bhzrvxd@guri>
References: <20220823171840.8958-1-laurent.pinchart@ideasonboard.com>
 <20220823171840.8958-10-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220823171840.8958-10-laurent.pinchart@ideasonboard.com>
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
>The resizer doesn't deal with color spaces, so it can accept any color
>space on its input, and propagates it unchanged to its output. When
>operating with a Bayer input format (in pass-through mode) further
>restrict the YCbCr encoding and quantization to Rec 601 and full range
>respectively, as for raw data the former ought to be ignored and the
>latter is always full range.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>


Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

>---
> .../platform/rockchip/rkisp1/rkisp1-resizer.c | 41 +++++++++++++++++--
> 1 file changed, 38 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
>index 6f6ec00b63b8..891a622124e2 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
>@@ -526,6 +526,7 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
> 	const struct rkisp1_mbus_info *mbus_info;
> 	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
> 	struct v4l2_rect *sink_crop;
>+	bool is_yuv;
>
> 	sink_fmt = rkisp1_rsz_get_pad_fmt(rsz, sd_state, RKISP1_RSZ_PAD_SINK,
> 					  which);
>@@ -547,9 +548,6 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
> 	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
> 		rsz->pixel_enc = mbus_info->pixel_enc;
>
>-	/* Propagete to source pad */
>-	src_fmt->code = sink_fmt->code;
>-
> 	sink_fmt->width = clamp_t(u32, format->width,
> 				  RKISP1_ISP_MIN_WIDTH,
> 				  RKISP1_ISP_MAX_WIDTH);
>@@ -557,8 +555,45 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
> 				   RKISP1_ISP_MIN_HEIGHT,
> 				   RKISP1_ISP_MAX_HEIGHT);
>
>+	/*
>+	 * Adjust the color space fields. Accept any color primaries and
>+	 * transfer function for both YUV and Bayer. For YUV any YCbCr encoding
>+	 * and quantization range is also accepted. For Bayer formats, the YCbCr
>+	 * encoding isn't applicable, and the quantization range can only be
>+	 * full.
>+	 */
>+	is_yuv = mbus_info->pixel_enc == V4L2_PIXEL_ENC_YUV;
>+
>+	sink_fmt->colorspace = format->colorspace ? :
>+			       (is_yuv ? V4L2_COLORSPACE_SRGB :
>+				V4L2_COLORSPACE_RAW);
>+	sink_fmt->xfer_func = format->xfer_func ? :
>+			      V4L2_MAP_XFER_FUNC_DEFAULT(sink_fmt->colorspace);
>+	if (is_yuv) {
>+		sink_fmt->ycbcr_enc = format->ycbcr_enc ? :
>+			V4L2_MAP_YCBCR_ENC_DEFAULT(sink_fmt->colorspace);
>+		sink_fmt->quantization = format->quantization ? :
>+			V4L2_MAP_QUANTIZATION_DEFAULT(false, sink_fmt->colorspace,
>+						      sink_fmt->ycbcr_enc);
>+	} else {
>+		/*
>+		 * The YCbCr encoding isn't applicable for non-YUV formats, but
>+		 * V4L2 has no "no encoding" value. Hardcode it to Rec. 601, it
>+		 * should be ignored by userspace.
>+		 */
>+		sink_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
>+		sink_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>+	}
>+
> 	*format = *sink_fmt;
>
>+	/* Propagate the media bus code and color space to the source pad. */
>+	src_fmt->code = sink_fmt->code;
>+	src_fmt->colorspace = sink_fmt->colorspace;
>+	src_fmt->xfer_func = sink_fmt->xfer_func;
>+	src_fmt->ycbcr_enc = sink_fmt->ycbcr_enc;
>+	src_fmt->quantization = sink_fmt->quantization;
>+
> 	/* Update sink crop */
> 	rkisp1_rsz_set_sink_crop(rsz, sd_state, sink_crop, which);
> }
>-- 
>Regards,
>
>Laurent Pinchart
>
