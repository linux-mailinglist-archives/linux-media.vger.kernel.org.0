Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7AF55A710
	for <lists+linux-media@lfdr.de>; Sat, 25 Jun 2022 06:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbiFYEcW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Jun 2022 00:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbiFYEcW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Jun 2022 00:32:22 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 551D44DF69
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 21:32:21 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 130F632005CA;
        Sat, 25 Jun 2022 00:32:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sat, 25 Jun 2022 00:32:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1656131539; x=1656217939; bh=S/Osy+xSbB
        CcyPwg12+Fy610Zxh/48cjCpJlFMCxrFU=; b=CBpYSbBAxenE5Q8+IGd4O6QRvZ
        v+rGFQJYfCct5KQd19PeBCsdtreKsNPSCCLRm4s4cg3gGPUJDCiGTbND4N/sFFyi
        /PRMg6SOXpW8SJiKNFiUdvq49K1EcOL6Sc0oWlzEBm4QOIuF1wRzPoWporl5686M
        G96wE9mr6ot3Bbls+mCkUZ/jhVDh6+5DF041UKs9aqh4aA02aJC86w16TZOS9b96
        pYO6igo3Sn9sxqDQx4VdMHJKl3FFUzXshSKmDE8feFpSByosJ8xLnCsYsdEqV8hF
        Hd2dnQpPVgIENU02yC21uSl2OOYm6oHLV9/hR+Rd4LsXED/xjibagJlaWlig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656131539; x=1656217939; bh=S/Osy+xSbBCcyPwg12+Fy610Zxh/
        48cjCpJlFMCxrFU=; b=hS4Y+m7XRlXpPdkEaig8ST72Aiqg3ujQBkOXg7GLHrMs
        e7E85TuewNuR3UnoSQCNJUeonr6uuBxmsVEaNA9Mwz0iAE8CuYLhghFtZjdnloA5
        LFFKAbiBvNIPj6Xkmn2npfpN4HZxvkWmamDxKaeATxSgT5c0RGnbjBou1E8TeGKQ
        nQHJ4afLeSFPnMOUSIMGp7eZ6+0HvIX4vfBF3mCEKR9ZCfQ8JnHMLqovKqBzPQIG
        BhZ64vkpu2+rsyBK4lPEaT3LXFDmVxtlC2GbSN8ngiRNW/zRxsqEFmjT20G+cHSM
        SVYjn5ZwRnt1vEw9JpCYE/SxYY/HNPNKx+o4QWNoGg==
X-ME-Sender: <xms:04-2YqbIpMWJ8zfHZL4tOq8Zc3qsTfbKH4Lw6NBM3gykUvmLSL8yhw>
    <xme:04-2YtaubGigca1f5xWd5EXrhNFabsDFlBp50cMPsuyzraj0SZTxrMfevYHOwEwS7
    Pl9j481jbwZUDzqbJ0>
X-ME-Received: <xmr:04-2Yk8NA9Q3w8CTR20c1ImRlRvudiGdC6MEyuSBNsrYFATNZr_Hmw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegtddgkeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:04-2YsoQ-Q64meZTmb-qj6dzpmYDCKU8Hf44qlSqNRk5MrpnG8Uzkw>
    <xmx:04-2YlpmnQeEJhP1ElvoEISn5HpZgEeRlFXnzwG8FzFJErQdQzQiUQ>
    <xmx:04-2YqQM2I9Q5-8ykyGfSAh8WHZbal4ELHEu1iQ-BBTW1JVLmX3c8A>
    <xmx:04-2YpKaV8jISAqhygSSTmgpRlyQcZyWgrq0n40PEMD1QGUYesFKIA>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Jun 2022 00:32:16 -0400 (EDT)
Date:   Sat, 25 Jun 2022 07:32:13 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        heiko@sntech.de, jeanmichel.hautbois@ideasonboard.com,
        jacopo@jmondi.org, djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 26/55] media: rkisp1: isp: Pass mbus type and flags to
 rkisp1_config_cif()
Message-ID: <20220625043213.j7m2f7kaf7xxhgvr@guri>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-27-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-27-paul.elder@ideasonboard.com>
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
>From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
>To prepare for the removal of the active_sensor field from the
>rkisp1_device structure, pass the media bus type of flag to the
>rkisp1_config_cif() function instead of accessing them through
>active_sensor.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by Dafna Hirschfeld <dafna@fastmail.com>

>---
> .../platform/rockchip/rkisp1/rkisp1-isp.c     | 44 +++++++++----------
> 1 file changed, 22 insertions(+), 22 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>index a234cf29ec67..f6d1c93dd99d 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>@@ -136,15 +136,14 @@ static void rkisp1_config_ism(struct rkisp1_device *rkisp1)
> /*
>  * configure ISP blocks with input format, size......
>  */
>-static int rkisp1_config_isp(struct rkisp1_device *rkisp1)
>+static int rkisp1_config_isp(struct rkisp1_device *rkisp1,
>+			     enum v4l2_mbus_type mbus_type, u32 mbus_flags)
> {
> 	u32 isp_ctrl = 0, irq_mask = 0, acq_mult = 0, signal = 0;
> 	const struct rkisp1_mbus_info *src_fmt, *sink_fmt;
>-	struct rkisp1_sensor_async *sensor;
> 	struct v4l2_mbus_framefmt *sink_frm;
> 	struct v4l2_rect *sink_crop;
>
>-	sensor = rkisp1->active_sensor;
> 	sink_fmt = rkisp1->isp.sink_fmt;
> 	src_fmt = rkisp1->isp.src_fmt;
> 	sink_frm = rkisp1_isp_get_pad_fmt(&rkisp1->isp, NULL,
>@@ -157,7 +156,7 @@ static int rkisp1_config_isp(struct rkisp1_device *rkisp1)
> 	if (sink_fmt->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
> 		acq_mult = 1;
> 		if (src_fmt->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
>-			if (sensor->mbus_type == V4L2_MBUS_BT656)
>+			if (mbus_type == V4L2_MBUS_BT656)
> 				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_RAW_PICT_ITU656;
> 			else
> 				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_RAW_PICT;
>@@ -165,17 +164,17 @@ static int rkisp1_config_isp(struct rkisp1_device *rkisp1)
> 			rkisp1_write(rkisp1, RKISP1_CIF_ISP_DEMOSAIC,
> 				     RKISP1_CIF_ISP_DEMOSAIC_TH(0xc));
>
>-			if (sensor->mbus_type == V4L2_MBUS_BT656)
>+			if (mbus_type == V4L2_MBUS_BT656)
> 				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_BAYER_ITU656;
> 			else
> 				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_BAYER_ITU601;
> 		}
> 	} else if (sink_fmt->pixel_enc == V4L2_PIXEL_ENC_YUV) {
> 		acq_mult = 2;
>-		if (sensor->mbus_type == V4L2_MBUS_CSI2_DPHY) {
>+		if (mbus_type == V4L2_MBUS_CSI2_DPHY) {
> 			isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU601;
> 		} else {
>-			if (sensor->mbus_type == V4L2_MBUS_BT656)
>+			if (mbus_type == V4L2_MBUS_BT656)
> 				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU656;
> 			else
> 				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU601;
>@@ -185,17 +184,16 @@ static int rkisp1_config_isp(struct rkisp1_device *rkisp1)
> 	}
>
> 	/* Set up input acquisition properties */
>-	if (sensor->mbus_type == V4L2_MBUS_BT656 ||
>-	    sensor->mbus_type == V4L2_MBUS_PARALLEL) {
>-		if (sensor->mbus_flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
>+	if (mbus_type == V4L2_MBUS_BT656 || mbus_type == V4L2_MBUS_PARALLEL) {
>+		if (mbus_flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
> 			signal = RKISP1_CIF_ISP_ACQ_PROP_POS_EDGE;
> 	}
>
>-	if (sensor->mbus_type == V4L2_MBUS_PARALLEL) {
>-		if (sensor->mbus_flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
>+	if (mbus_type == V4L2_MBUS_PARALLEL) {
>+		if (mbus_flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
> 			signal |= RKISP1_CIF_ISP_ACQ_PROP_VSYNC_LOW;
>
>-		if (sensor->mbus_flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
>+		if (mbus_flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
> 			signal |= RKISP1_CIF_ISP_ACQ_PROP_HSYNC_LOW;
> 	}
>
>@@ -265,17 +263,17 @@ static int rkisp1_config_dvp(struct rkisp1_device *rkisp1)
> }
>
> /* Configure MUX */
>-static int rkisp1_config_path(struct rkisp1_device *rkisp1)
>+static int rkisp1_config_path(struct rkisp1_device *rkisp1,
>+			      enum v4l2_mbus_type mbus_type)
> {
>-	struct rkisp1_sensor_async *sensor = rkisp1->active_sensor;
> 	u32 dpcl = rkisp1_read(rkisp1, RKISP1_CIF_VI_DPCL);
> 	int ret = 0;
>
>-	if (sensor->mbus_type == V4L2_MBUS_BT656 ||
>-	    sensor->mbus_type == V4L2_MBUS_PARALLEL) {
>+	if (mbus_type == V4L2_MBUS_BT656 ||
>+	    mbus_type == V4L2_MBUS_PARALLEL) {
> 		ret = rkisp1_config_dvp(rkisp1);
> 		dpcl |= RKISP1_CIF_VI_DPCL_IF_SEL_PARALLEL;
>-	} else if (sensor->mbus_type == V4L2_MBUS_CSI2_DPHY) {
>+	} else if (mbus_type == V4L2_MBUS_CSI2_DPHY) {
> 		dpcl |= RKISP1_CIF_VI_DPCL_IF_SEL_MIPI;
> 	}
>
>@@ -285,14 +283,15 @@ static int rkisp1_config_path(struct rkisp1_device *rkisp1)
> }
>
> /* Hardware configure Entry */
>-static int rkisp1_config_cif(struct rkisp1_device *rkisp1)
>+static int rkisp1_config_cif(struct rkisp1_device *rkisp1,
>+			     enum v4l2_mbus_type mbus_type, u32 mbus_flags)
> {
> 	int ret;
>
>-	ret = rkisp1_config_isp(rkisp1);
>+	ret = rkisp1_config_isp(rkisp1, mbus_type, mbus_flags);
> 	if (ret)
> 		return ret;
>-	ret = rkisp1_config_path(rkisp1);
>+	ret = rkisp1_config_path(rkisp1, mbus_type);
> 	if (ret)
> 		return ret;
> 	rkisp1_config_ism(rkisp1);
>@@ -777,7 +776,8 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
>
> 	rkisp1->isp.frame_sequence = -1;
> 	mutex_lock(&isp->ops_lock);
>-	ret = rkisp1_config_cif(rkisp1);
>+	ret = rkisp1_config_cif(rkisp1, rkisp1->active_sensor->mbus_type,
>+				rkisp1->active_sensor->mbus_flags);
> 	if (ret)
> 		goto mutex_unlock;
>
>-- 
>2.30.2
>
