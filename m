Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D61356D246
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 02:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbiGKAs0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Jul 2022 20:48:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbiGKAsZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Jul 2022 20:48:25 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64D35B4BB
        for <linux-media@vger.kernel.org>; Sun, 10 Jul 2022 17:48:23 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 634073200B5B;
        Sun, 10 Jul 2022 20:48:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sun, 10 Jul 2022 20:48:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1657500501; x=1657586901; bh=fEZrRqeYHw
        8dVs8sMbc39mTMlp5PL6QASSQUhwWIfzc=; b=r8acnQSE5EHG7tCsaW1jrUf4vy
        el9v/PqiCTR1ZJ1jxHsmnEcNPfM70nYN6dB9r7IV2cWUlRHlyUFfF64P0xqjem1c
        Szeq6QzQe4Yd5Z2zR8y+PLrCTY9W/2j1oAPF0f3GzgwVL22YGkYKQ7U0dBHdnNhb
        A8ftPxeW8i5bg/Lf0V8PTapO51FlXml7glx3IFK1Vf1tOsCtSR8qX/LKpjRekKEN
        qwfDcYlazCfAvUM7yCpIcfy+jTF52AFkpgjmbd/R5R4LggQEYdy3KRdYa3Kx9FbK
        1gPW2MOMY+o0/6w2gZsC4WrJE6/GMUsD9jL8qW0Jx2BDrehOYj05L3S/T8tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1657500501; x=1657586901; bh=fEZrRqeYHw8dVs8sMbc39mTMlp5P
        L6QASSQUhwWIfzc=; b=ckcrqX51sOVjEr5yMp6L9BHKyCsbjAZou4NwuhICz+ud
        tK7Ami1Xvk7aZnqX6Rvx2E/YbOG+E7p1mvp9mF+sVNX6Iw86oGygT1DUCoZuCqOo
        DCkmR7v05WauSjZGKxW0Uht+2rytFxQXAK1nr/br0sJbxBvwgiQyMT5ka0OvenUV
        tLc4S/lh++dmO9B1eE/zyvGKorCKN/g63AsA6vCK+bwFimcl3DjK1KeFuxeyXiM6
        VTLT2u7m+VzE0AgO7pK+KHcWlpgN5FRgIFZckGVDAgZyECSGty0+KUcHQaKO2rKW
        uAa7pAqEd6XgiAgW1NmTp2LA6tDe3tSpiOlziu6neQ==
X-ME-Sender: <xms:VXPLYhne50mOzI4vQXigLpl-fTM5KtnhVBEoAVBDTRif0HbHrSkZZg>
    <xme:VXPLYs0iRn7UxnAQs1i4WjR4d7VW4lYfws2PnSLjZisdBVg5e5tXaRm3p2kdaizZG
    xk_0txiGmRFTWaF6_0>
X-ME-Received: <xmr:VXPLYnpXfZmpwKk06Ll6Lt0-SK2S51I3bJMdZgeFxC4X8idx6soxOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejvddgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeehiedvjeehvdffleekffdvjedvieehhedttefhvddtueefueek
    lefhteduudfgjeenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghfnhgrsehfrghs
    thhmrghilhdrtghomh
X-ME-Proxy: <xmx:VXPLYhlHUaxx79R-E-n-_4GTfjMKooRdOPCce1Wo4Qn-YEevytxPcw>
    <xmx:VXPLYv1_y9nmBeiLD7vu-k7YryJwOCckToxn8dUfgB8UdneGLKowLw>
    <xmx:VXPLYgtpxXS2kO5iVnv1nFv2QPOhojFZ_6EaFpXxw8XHZQ_PmIfTRg>
    <xmx:VXPLYqRNw-KDFeulTaDQzyQv6cWExwC5s2ODZmL2WU7iHqNn1P5yaQ>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 10 Jul 2022 20:48:19 -0400 (EDT)
Date:   Mon, 11 Jul 2022 03:48:15 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v2 32/55] media: rkisp1: isp: Move input configuration to
 rkisp1_config_isp()
Message-ID: <20220711004815.hpp2zlenj6hf72ea@guri>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
 <20220630230713.10580-33-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220630230713.10580-33-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01.07.2022 02:06, Laurent Pinchart wrote:
>The ISP_ACQ_PROP register is set twice, once in rkisp1_config_isp() for
>most of its fields, and once in rkisp1_config_dvp() (called from
>rkisp1_config_path()) to configure the input selection field. Move the
>latter to rkisp1_config_isp() to write the register once only, and drop
>the now empty rkisp1_config_dvp() function.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by Dafna Hirschfeld <dafna@fastmail.com>

>---
>Changes since v1:
>
>- Print the value of unsupported bus width
>- Remove unneeded curly braces
>---
> .../platform/rockchip/rkisp1/rkisp1-isp.c     | 66 +++++++------------
> 1 file changed, 24 insertions(+), 42 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>index 9b32ae585de8..85c1995bb5c2 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>@@ -141,7 +141,7 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
> 			     enum v4l2_mbus_type mbus_type, u32 mbus_flags)
> {
> 	struct rkisp1_device *rkisp1 = isp->rkisp1;
>-	u32 isp_ctrl = 0, irq_mask = 0, acq_mult = 0, signal = 0;
>+	u32 isp_ctrl = 0, irq_mask = 0, acq_mult = 0, signal = 0, input_sel = 0;
> 	const struct rkisp1_mbus_info *src_fmt, *sink_fmt;
> 	struct v4l2_mbus_framefmt *sink_frm;
> 	struct v4l2_rect *sink_crop;
>@@ -189,6 +189,22 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
> 	if (mbus_type == V4L2_MBUS_BT656 || mbus_type == V4L2_MBUS_PARALLEL) {
> 		if (mbus_flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
> 			signal = RKISP1_CIF_ISP_ACQ_PROP_POS_EDGE;
>+
>+		switch (sink_fmt->bus_width) {
>+		case 8:
>+			input_sel = RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_8B_ZERO;
>+			break;
>+		case 10:
>+			input_sel = RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_10B_ZERO;
>+			break;
>+		case 12:
>+			input_sel = RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_12B;
>+			break;
>+		default:
>+			dev_err(rkisp1->dev, "Invalid bus width %u\n",
>+				sink_fmt->bus_width);
>+			return -EINVAL;
>+		}
> 	}
>
> 	if (mbus_type == V4L2_MBUS_PARALLEL) {
>@@ -201,7 +217,7 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
>
> 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_CTRL, isp_ctrl);
> 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ACQ_PROP,
>-		     signal | sink_fmt->yuv_seq |
>+		     signal | sink_fmt->yuv_seq | input_sel |
> 		     RKISP1_CIF_ISP_ACQ_PROP_BAYER_PAT(sink_fmt->bayer_pat) |
> 		     RKISP1_CIF_ISP_ACQ_PROP_FIELD_SEL_ALL);
> 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ACQ_NR_FRAMES, 0);
>@@ -238,52 +254,19 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
> 	return 0;
> }
>
>-static int rkisp1_config_dvp(struct rkisp1_isp *isp)
>-{
>-	struct rkisp1_device *rkisp1 = isp->rkisp1;
>-	const struct rkisp1_mbus_info *sink_fmt = isp->sink_fmt;
>-	u32 val, input_sel;
>-
>-	switch (sink_fmt->bus_width) {
>-	case 8:
>-		input_sel = RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_8B_ZERO;
>-		break;
>-	case 10:
>-		input_sel = RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_10B_ZERO;
>-		break;
>-	case 12:
>-		input_sel = RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_12B;
>-		break;
>-	default:
>-		dev_err(rkisp1->dev, "Invalid bus width\n");
>-		return -EINVAL;
>-	}
>-
>-	val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_ACQ_PROP);
>-	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ACQ_PROP, val | input_sel);
>-
>-	return 0;
>-}
>-
> /* Configure MUX */
>-static int rkisp1_config_path(struct rkisp1_isp *isp,
>-			      enum v4l2_mbus_type mbus_type)
>+static void rkisp1_config_path(struct rkisp1_isp *isp,
>+			       enum v4l2_mbus_type mbus_type)
> {
> 	struct rkisp1_device *rkisp1 = isp->rkisp1;
> 	u32 dpcl = rkisp1_read(rkisp1, RKISP1_CIF_VI_DPCL);
>-	int ret = 0;
>
>-	if (mbus_type == V4L2_MBUS_BT656 ||
>-	    mbus_type == V4L2_MBUS_PARALLEL) {
>-		ret = rkisp1_config_dvp(isp);
>+	if (mbus_type == V4L2_MBUS_BT656 || mbus_type == V4L2_MBUS_PARALLEL)
> 		dpcl |= RKISP1_CIF_VI_DPCL_IF_SEL_PARALLEL;
>-	} else if (mbus_type == V4L2_MBUS_CSI2_DPHY) {
>+	else if (mbus_type == V4L2_MBUS_CSI2_DPHY)
> 		dpcl |= RKISP1_CIF_VI_DPCL_IF_SEL_MIPI;
>-	}
>
> 	rkisp1_write(rkisp1, RKISP1_CIF_VI_DPCL, dpcl);
>-
>-	return ret;
> }
>
> /* Hardware configure Entry */
>@@ -295,9 +278,8 @@ static int rkisp1_config_cif(struct rkisp1_isp *isp,
> 	ret = rkisp1_config_isp(isp, mbus_type, mbus_flags);
> 	if (ret)
> 		return ret;
>-	ret = rkisp1_config_path(isp, mbus_type);
>-	if (ret)
>-		return ret;
>+
>+	rkisp1_config_path(isp, mbus_type);
> 	rkisp1_config_ism(isp);
>
> 	return 0;
>-- 
>Regards,
>
>Laurent Pinchart
>
>
>_______________________________________________
>Linux-rockchip mailing list
>Linux-rockchip@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-rockchip
