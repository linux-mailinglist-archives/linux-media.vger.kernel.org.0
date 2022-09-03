Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED6C5ABC84
	for <lists+linux-media@lfdr.de>; Sat,  3 Sep 2022 05:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231611AbiICDOz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Sep 2022 23:14:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbiICDOw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Sep 2022 23:14:52 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B233D27FC6
        for <linux-media@vger.kernel.org>; Fri,  2 Sep 2022 20:14:48 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id B4C5A32006F5;
        Fri,  2 Sep 2022 23:14:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 02 Sep 2022 23:14:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1662174887; x=1662261287; bh=EfUhSwZTPw
        XH4RacCvVtqxP174E0C83f6rTvJozv6Ng=; b=RnsARrr1V90LgEGrcUCo2aIqx1
        Z6uB9BKFcmKtcU2kQ1+F+dvH7Dx5lyubJubV6x8sknZZidE4WUah0ksvwMTsWoOJ
        7VqWFjVUTH4Ix1ejOLLE4lRgesZL7N4aI7T+iGjdxIA2NlrMTZ7scjMvr0243GXH
        EkmvmSZaeSs7DRzyEMs0iJxHTxccEN3PGMp1sHisvCr5UqMUJRpVzjitLuPUvCwm
        xh7kDS/iBDoLDJit/NThNM2N1Q80gFRYZIZDD13CSOQ6gwLz4xGYEuugN4BrQjf+
        uhJ72d/8HKoVH+FYKvuLrLjLXLEG1nWPwNCKwrG9ynKLFc4Nhr+5wHY4+4Qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1662174887; x=1662261287; bh=EfUhSwZTPwXH4RacCvVtqxP174E0
        C83f6rTvJozv6Ng=; b=BCFLnZ3kW3mno/kAbnhTsaaY9k1Rf9aYTGs6XeoA4Y9g
        ZfW4cH9L41zFyoiGdF1k72iadEEEN4KxfaC9KUwoklgAKRLHOAt3iVmpQdPTHQsO
        gyaQ2RZvbWZj5oK22CEqoWrboERs41/iKorUDOo3rw7t6oMyyNkSuTTPnTg4dq4w
        qkLZjprvfIkCViC24UoY0qpRURnmzOII09lzSyeb2pEoMytPRneBLfUKxliG3/04
        Fs8Yg9CXfNTFzAqa/5slwImm+ZJi+UGfwWahcX5HCiP8i7gvdgysTa2A2N8SxxXD
        OIyqVZxcCK44DP3jTTqsCvHbBamdeOW/Zsz3EZmWiA==
X-ME-Sender: <xms:psYSY5EpKgxj9Vq0MjZiIsQQ5IO4sNk5V_n_qvaexRSXH_XEdwVoAg>
    <xme:psYSY-UU7mY-QMYwL7A2KKeEiOxoNL3cMmMsTpOJ5RQD86nSudcX0FIeMjIH2xYqt
    WOK1QoVpxFIctmEMDw>
X-ME-Received: <xmr:psYSY7L7oIovUOqcVSFI_hVxwHvn2-O07d_IoSGtCLokXAvthFbxeA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeluddgjeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:psYSY_GCqFEJ0OSP1mCHCszYNaJ90daFuJVzM-MLbDPt8N1XVrN8cQ>
    <xmx:psYSY_UK1Bo9n-YlejXbOpMPNZHosPN-N83rSNsnnffMzPP1cnCPWA>
    <xmx:psYSY6Nk4_4fcqrAbjzzl2lGQSRLIS0YcJemai_nFzO6JUjaF1Lwgw>
    <xmx:p8YSY6SbCMXN9-CzVTZW_mIJU0q5bb4CKJH_DXVXoVZ2L7QIs3cLAA>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Sep 2022 23:14:45 -0400 (EDT)
Date:   Sat, 3 Sep 2022 06:14:42 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Florian Sylvestre <fsylvestre@baylibre.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v2 2/9] media: rkisp1: Allow setting color space on ISP
 sink pad
Message-ID: <20220903031442.4a3wtaloxfskdmll@guri>
References: <20220823171840.8958-1-laurent.pinchart@ideasonboard.com>
 <20220823171840.8958-3-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220823171840.8958-3-laurent.pinchart@ideasonboard.com>
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

Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

>---
>Changes since v1:
>
>- Fix swapped default color spaces for YUV and Bayer
>- Improve coherency in usage of ternary operator ? :
>---
> .../platform/rockchip/rkisp1/rkisp1-isp.c     | 31 +++++++++++++++++++
> 1 file changed, 31 insertions(+)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>index a52b22824739..b5bdf427c7e1 100644
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
> 	/* Propagate to in crop */
>-- 
>Regards,
>
>Laurent Pinchart
>
