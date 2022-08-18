Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF93597CA2
	for <lists+linux-media@lfdr.de>; Thu, 18 Aug 2022 06:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243161AbiHREAg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Aug 2022 00:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243111AbiHREAd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Aug 2022 00:00:33 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91A2F9E134
        for <linux-media@vger.kernel.org>; Wed, 17 Aug 2022 21:00:32 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id F01745C0125;
        Thu, 18 Aug 2022 00:00:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 18 Aug 2022 00:00:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1660795231; x=1660881631; bh=0nJRbd5Jsv
        p2N+V9SUVN05zSAkrVJmhpCc9BLWme2Ww=; b=ItB9DQYVcfpBawx9G08qt97vOm
        SgeGceq7yeZ47zec3CtaPbYi/u0naPS5QIZ8JqdyGhqMFjjt0nDYbemuPKs066G2
        qRUDdBUn80v8tIbxjaG6u3lmmaYjA4K6e8+4pVjiHfgBlC+bUzG1I9By7uQ9nXii
        GUcFeqviIXXdLjYZKh3mhtOYCfJR5BHVaj5PmF26mJONVoEmEf8IJolCdEfD5PQY
        kF2kD+qPoqOz2NXdYoBtYpWIZH82yjtDjLGqN4Sf/3GwOZsxfWQpNDDtgNnlBEVv
        xFqfbbW8QmO8iCf37eYNPozCsZ6e7zp1maRpqaOuyrZhNip6ja6VAEa/99yw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1660795231; x=1660881631; bh=0nJRbd5Jsvp2N+V9SUVN05zSAkrV
        JmhpCc9BLWme2Ww=; b=RMZlrqCQsqZFsdpDv74OGMXPg+T5cq3BGyr3sQJ8PvHz
        x7jwUHKWYK50ZTXoD/1DZVwEExvWQ03b5sMQ2pSrBGe7mJP9h4TTbTv0JeddSbHT
        PgMbxoibDozYwHd6kK0fhWvGUlQsYP7rr/ruHyqH1Bkf35JUGoo5BXcP9YYQ+EC/
        VtkAcIOGgegZ6+G1A6HOUc5QbQHq46EkQY/MF67M1xrNfy5K2Je5d6n0d/wvhfdo
        NvftrFAdfRSEMw3IiVyamC8egVw4JyJbsFW6f9cRLKUfdGnZrBZSXLBrpUroEkpb
        OEJLpe8+840ZhWT+SeGXpUPil5XYxqqhN8vqH1kDTw==
X-ME-Sender: <xms:X7n9Yv3OVsS9g9dG7VP2qzFioVSy1wIQZK_ja4febCa6Y7NpJ1PU0w>
    <xme:X7n9YuGLHxZVuCmycozP63uJHt5HbBmVxh8sa8NRIyIj7Ms0YpRpPownH4T-wheHi
    N_9LP2eg-j5ysexDig>
X-ME-Received: <xmr:X7n9Yv4M58tLKjNAKp54-Rkp0fhZrIXJuc7Wh2rOaoUJ9M8Dyx3ESA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehjedgjeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:X7n9Yk0oGOoYjngXCS36fL-AM3eANGcvBjFco3sbfSEi0vESKHjekA>
    <xmx:X7n9YiEbvolVFJZTQ8Z2DyuZCIvVX3ufZ_G2n45wmobNKyS8IPsaCw>
    <xmx:X7n9Yl_Po5NtGHPnLdCmFXpm7VFGNZ2T224Xd688WrGesql7sHWM_Q>
    <xmx:X7n9YnQL6_uFoS83AELR7NYv1Yh14jOJwbVS0jg21aT7-1bmlFMvoQ>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Aug 2022 00:00:30 -0400 (EDT)
Date:   Thu, 18 Aug 2022 07:00:27 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Florian Sylvestre <fsylvestre@baylibre.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH 2/7] media: rkisp1: Allow setting color space on ISP sink
 pad
Message-ID: <20220818040027.mqqrimh4pyxpb4qq@guri>
References: <20220815065235.23797-1-laurent.pinchart@ideasonboard.com>
 <20220815065235.23797-3-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220815065235.23797-3-laurent.pinchart@ideasonboard.com>
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
>The ISP accepts different color spaces on its input: for YUV input, it
>doesn't set any restrictions, and for Bayer inputs, any color primaries
>or transfer function can be accepted (YCbCr encoding isn't applicable
>there, and quantization range can only be full).
>
>Allow setting a color space on the ISP sink pad, with the aforementioned
>restrictions. The settings don't influence hardware yet (only the YUV
>quantization range will, anything else has no direct effect on the ISP
>configuration), but can already be set to allow color space information
>to be coherent across the ISP sink link.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>---
> .../platform/rockchip/rkisp1/rkisp1-isp.c     | 31 +++++++++++++++++++
> 1 file changed, 31 insertions(+)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>index a52b22824739..32114d1e8ad1 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>@@ -705,6 +705,7 @@ static void rkisp1_isp_set_sink_fmt(struct rkisp1_isp *isp,
> 	const struct rkisp1_mbus_info *mbus_info;
> 	struct v4l2_mbus_framefmt *sink_fmt;
> 	struct v4l2_rect *sink_crop;
>+	bool is_yuv;
>
> 	sink_fmt = rkisp1_isp_get_pad_fmt(isp, sd_state,
> 					  RKISP1_ISP_PAD_SINK_VIDEO,
>@@ -725,6 +726,36 @@ static void rkisp1_isp_set_sink_fmt(struct rkisp1_isp *isp,
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
>+	sink_fmt->colorspace = format->colorspace ? format->colorspace :
>+			       (is_yuv ? V4L2_COLORSPACE_RAW :

I don't understand enough of the different colorspaces, why is 'raw' chosen for yuv input?

Thanks,
Dafna

>+				V4L2_COLORSPACE_SRGB);
>+	sink_fmt->xfer_func = format->xfer_func ? format->xfer_func :
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
> 	/* Propagate to in crop */
>-- 
>Regards,
>
>Laurent Pinchart
>
