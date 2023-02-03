Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8B846890F1
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 08:35:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232075AbjBCHfM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 02:35:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230180AbjBCHfK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 02:35:10 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3C8B92C26
        for <linux-media@vger.kernel.org>; Thu,  2 Feb 2023 23:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675409709; x=1706945709;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4DSkOsUPHdWFsD7lD8I0SyWP0vegFdEYgSq0GkVNTeY=;
  b=jYmQXkboipjAi32op4sXoGpsCPh6WIJRtXGhp7VYWXDli4kwHR6iq1qc
   hZVkHe+Ja2bWa/CsPDuyrUy7MMnGOju/dKVjD+sSXFElw8Nr0BP9plM7u
   VaN/zvVCT2gsAfjNn0DcLkWR/GuzHpr65SWXjshRF73+AGSwNIFVnME/z
   SgKFlDxYovL/GJ4Fn3VClRzEtU20vhAjmje0eaMRxQoQ7MzoDXqMyo/sc
   eWgYf71ZNxcMSVlvoYAZDdnJ+apqbQFShviro7yid5SZO4fGSEX6BnIql
   7ZkIUOdKS9WG1ZGDHlTZMxE0ArMsVSHUxZTzSngayA14U5f3b10l9p+U1
   A==;
X-IronPort-AV: E=Sophos;i="5.97,269,1669071600"; 
   d="scan'208";a="28844832"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 03 Feb 2023 08:35:07 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 03 Feb 2023 08:35:07 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 03 Feb 2023 08:35:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675409707; x=1706945707;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4DSkOsUPHdWFsD7lD8I0SyWP0vegFdEYgSq0GkVNTeY=;
  b=PDNvWCSQpAxkYcwzrUvdrRxnIf7HoFS20zMsM7VC4pHNXRHW5zz5oIsz
   aSNbkutsVO84rKLLYhwuJT8qwpRnAxm8A9zUEBKcFZdiIbyV52YNcG7kk
   Whk/BWW9ecxBs8CKW0QLEQ5a4gdop7F+ifJeEl0SK/vl/jUoZQQbIY/mk
   Lr8paUDSuhB/BK8yjZC9hK9OjAs+8CWAwZzo2TY8enlr0IYM/6pXmsOVE
   XG3q26YsqQMXrcN8u4PZDAxtgzx/NI3VXzlL2zM8DLz79Csq7OdquvJtp
   PW3KYlh6kQHh0qmgqmpTxFHv9jZagdH1o+oACNbpUuQSQnUgFIJZGL/uR
   A==;
X-IronPort-AV: E=Sophos;i="5.97,269,1669071600"; 
   d="scan'208";a="28844831"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 03 Feb 2023 08:35:06 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 8C5CC280056;
        Fri,  3 Feb 2023 08:35:06 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 11/11] media: i2c: imx290: Add support for H & V Flips
Date:   Fri, 03 Feb 2023 08:35:06 +0100
Message-ID: <2548223.Lt9SDvczpP@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230131192016.3476937-12-dave.stevenson@raspberrypi.com>
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com> <20230131192016.3476937-12-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

thanks for the patch.

Am Dienstag, 31. Januar 2023, 20:20:16 CET schrieb Dave Stevenson:
> The sensor supports H & V flips, so add the relevant hooks for
> V4L2_CID_HFLIP and V4L2_CID_VFLIP to configure them.
> 
> Note that the Bayer order is maintained as the readout area
> shifts by 1 pixel in the appropriate direction (note the
> comment about the top margin being 8 pixels whilst the bottom
> margin is 9). The V4L2_SEL_TGT_CROP region is therefore
> adjusted appropriately.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx290.c | 37 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 34 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 7f6746f74040..d2b7534f2c51 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -227,6 +227,8 @@ struct imx290 {
>  	struct v4l2_ctrl *hblank;
>  	struct v4l2_ctrl *vblank;
>  	struct v4l2_ctrl *exposure;
> +	struct v4l2_ctrl *hflip;
> +	struct v4l2_ctrl *vflip;
>  };
> 
>  static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
> @@ -801,6 +803,24 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
>  				   NULL);
>  		break;
> 
> +	case V4L2_CID_HFLIP:
> +	case V4L2_CID_VFLIP:
> +	{
> +		u32 reg;
> +
> +		/* WINMODE is in bits [6:4], so need to read-modify-write 
*/
> +		ret = imx290_read(imx290, IMX290_CTRL_07, &reg);
> +		if (ret)
> +			break;
> +		reg &= ~(IMX290_HREVERSE | IMX290_VREVERSE);
> +		if (imx290->hflip->val)
> +			reg |= IMX290_HREVERSE;
> +		if (imx290->vflip->val)
> +			reg |= IMX290_VREVERSE;
> +		ret = imx290_write(imx290, IMX290_CTRL_07, reg, NULL);
> +		break;
> +	}

Given the grab while streaming is on, it can't be changed while streaming. But 
then again the pm_runtime check above will prevent setting the registers while 
streaming is off.

> +
>  	default:
>  		ret = -EINVAL;
>  		break;
> @@ -853,7 +873,7 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>  	if (ret < 0)
>  		return ret;
> 
> -	v4l2_ctrl_handler_init(&imx290->ctrls, 9);
> +	v4l2_ctrl_handler_init(&imx290->ctrls, 11);
> 
>  	/*
>  	 * The sensor has an analog gain and a digital gain, both controlled
> @@ -909,6 +929,11 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>  	imx290->vblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
>  					   V4L2_CID_VBLANK, 1, 1, 1, 
1);
> 
> +	imx290->hflip = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> +					  V4L2_CID_HFLIP, 0, 1, 1, 
0);
> +	imx290->vflip = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> +					  V4L2_CID_VFLIP, 0, 1, 1, 
0);
> +
>  	v4l2_ctrl_new_fwnode_properties(&imx290->ctrls, &imx290_ctrl_ops,
>  					&props);
> 
> @@ -1030,6 +1055,9 @@ static int imx290_set_stream(struct v4l2_subdev *sd,
> int enable) pm_runtime_put_autosuspend(imx290->dev);
>  	}
> 
> +	/* vflip and hflip cannot change during streaming */
> +	__v4l2_ctrl_grab(imx290->vflip, enable);
> +	__v4l2_ctrl_grab(imx290->hflip, enable);

Why is this grab necessary? While trying to remove these lines, I can flip the 
image while streaming.

Best regards,
Alexander

>  unlock:
>  	v4l2_subdev_unlock_state(state);
>  	return ret;
> @@ -1115,6 +1143,7 @@ static int imx290_get_selection(struct v4l2_subdev
> *sd, struct v4l2_subdev_state *sd_state,
>  				struct v4l2_subdev_selection *sel)
>  {
> +	struct imx290 *imx290 = to_imx290(sd);
>  	struct v4l2_mbus_framefmt *format;
> 
>  	switch (sel->target) {
> @@ -1122,9 +1151,11 @@ static int imx290_get_selection(struct v4l2_subdev
> *sd, format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
> 
>  		sel->r.top = IMX920_PIXEL_ARRAY_MARGIN_TOP
> -			   + (IMX290_PIXEL_ARRAY_RECORDING_HEIGHT - 
format->height) / 2;
> +			   + (IMX290_PIXEL_ARRAY_RECORDING_HEIGHT - 
format->height) / 2
> +			   + imx290->vflip->val;
>  		sel->r.left = IMX920_PIXEL_ARRAY_MARGIN_LEFT
> -			    + (IMX290_PIXEL_ARRAY_RECORDING_WIDTH - 
format->width) / 2;
> +			    + (IMX290_PIXEL_ARRAY_RECORDING_WIDTH - 
format->width) / 2
> +			    + imx290->hflip->val;
>  		sel->r.width = format->width;
>  		sel->r.height = format->height;




