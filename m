Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3058B68B6FC
	for <lists+linux-media@lfdr.de>; Mon,  6 Feb 2023 08:59:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbjBFH7b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Feb 2023 02:59:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbjBFH7a (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Feb 2023 02:59:30 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC6ABD531
        for <linux-media@vger.kernel.org>; Sun,  5 Feb 2023 23:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675670368; x=1707206368;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KWZzXhBSV5t1WotVMaGs+t6JfikcMhg18QzQSvViOjk=;
  b=EignBnJwJvMOL/FPtsIRVmU9GYZcO5JDooPrdAGW06ltffDXWs0gxhB8
   ijsc9tIeW/9o8adGdzFXus7k/CUC8kXOkoSmTmONqFQnMB4V6oXANw3P2
   g0qYklQKsPMBwKBK8T18+IcMJGFi7aSUrVSal1xi0rPTHxFsVxa4JbQgO
   BiJzLMuoZTxlWQZrGP5+Cg5HBdyl2TkUHOv3pzlYwpBAwZ7wEeaVo+UxU
   yT/S1Xr7j2qC29OeIA02jtyAY7BLjVIDwm2PxiwVance9n9PLQtrnQpRE
   sJ/K+wHtFcfW8OTTo2Qi2gvQW8vKZRtYzpv0ViOeW4WYhnUIawrhBZvBU
   w==;
X-IronPort-AV: E=Sophos;i="5.97,276,1669071600"; 
   d="scan'208";a="28878551"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 06 Feb 2023 08:59:27 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 06 Feb 2023 08:59:27 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 06 Feb 2023 08:59:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675670367; x=1707206367;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KWZzXhBSV5t1WotVMaGs+t6JfikcMhg18QzQSvViOjk=;
  b=XobgU8dVweU5roG3xwl/uphW/x5aKJm9hLmhA/Fm8QW7CPcSdF4mlZ4m
   4q11x6hTRjeLrHBxnJvLRitcKiMos2M0LiPHeS35aR7CF1C8ReekUvcj1
   raoZHQHI5H3eIfLkgkk4xfEjBs28tO1mRrLMZsZBlYM3y+88rshLa0GID
   3M0W0BofqAms9c/t2X9A7ypGOb8trWa1zJ2lc06+wXi9Ef8DfWShMHoc+
   fqJlk7frnnNeDBtvldROrc5BcRucemWqBIL/uBXt4Bqsd6vHAKYVkiOxq
   5gOHpVgUJ4Ra0SmC9gPkayOgT3fl9u1lWDUtuc5tUOyYZXxoyHcOeqnVH
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,276,1669071600"; 
   d="scan'208";a="28878550"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 06 Feb 2023 08:59:27 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id AC778280056;
        Mon,  6 Feb 2023 08:59:26 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 07/13] media: i2c: imx290: Convert V4L2_CID_HBLANK to read/write
Date:   Mon, 06 Feb 2023 08:59:24 +0100
Message-ID: <5906057.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230203191811.947697-8-dave.stevenson@raspberrypi.com>
References: <20230203191811.947697-1-dave.stevenson@raspberrypi.com> <20230203191811.947697-8-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

Am Freitag, 3. Februar 2023, 20:18:05 CET schrieb Dave Stevenson:
> The driver exposed V4L2_CID_HBLANK as a read only control to allow
> for exposure calculations and determination of the frame rate.
> 
> Convert to a read/write control so that the frame rate can be
> controlled.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  drivers/media/i2c/imx290.c | 33 +++++++++++++++++++--------------
>  1 file changed, 19 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 2abe4cdab819..74eafed15613 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -47,6 +47,7 @@
>  #define IMX290_GAIN					
IMX290_REG_8BIT(0x3014)
>  #define IMX290_VMAX					
IMX290_REG_24BIT(0x3018)
>  #define IMX290_HMAX					
IMX290_REG_16BIT(0x301c)
> +#define IMX290_HMAX_MAX					0xffff
>  #define IMX290_SHS1					
IMX290_REG_24BIT(0x3020)
>  #define IMX290_WINWV_OB					
IMX290_REG_8BIT(0x303a)
>  #define IMX290_WINPV					
IMX290_REG_16BIT(0x303c)
> @@ -183,7 +184,7 @@ struct imx290_regval {
>  struct imx290_mode {
>  	u32 width;
>  	u32 height;
> -	u32 hmax;
> +	u32 hmax_min;
>  	u8 link_freq_index;
> 
>  	const struct imx290_regval *data;
> @@ -426,7 +427,7 @@ static const struct imx290_mode imx290_modes_2lanes[] =
> { {
>  		.width = 1920,
>  		.height = 1080,
> -		.hmax = 2200,
> +		.hmax_min = 2200,
>  		.link_freq_index = FREQ_INDEX_1080P,
>  		.data = imx290_1080p_settings,
>  		.data_size = ARRAY_SIZE(imx290_1080p_settings),
> @@ -434,7 +435,7 @@ static const struct imx290_mode imx290_modes_2lanes[] =
> { {
>  		.width = 1280,
>  		.height = 720,
> -		.hmax = 3300,
> +		.hmax_min = 3300,
>  		.link_freq_index = FREQ_INDEX_720P,
>  		.data = imx290_720p_settings,
>  		.data_size = ARRAY_SIZE(imx290_720p_settings),
> @@ -445,7 +446,7 @@ static const struct imx290_mode imx290_modes_4lanes[] =
> { {
>  		.width = 1920,
>  		.height = 1080,
> -		.hmax = 2200,
> +		.hmax_min = 2200,
>  		.link_freq_index = FREQ_INDEX_1080P,
>  		.data = imx290_1080p_settings,
>  		.data_size = ARRAY_SIZE(imx290_1080p_settings),
> @@ -453,7 +454,7 @@ static const struct imx290_mode imx290_modes_4lanes[] =
> { {
>  		.width = 1280,
>  		.height = 720,
> -		.hmax = 3300,
> +		.hmax_min = 3300,
>  		.link_freq_index = FREQ_INDEX_720P,
>  		.data = imx290_720p_settings,
>  		.data_size = ARRAY_SIZE(imx290_720p_settings),
> @@ -707,6 +708,12 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
>  		}
>  		break;
> 
> +	case V4L2_CID_HBLANK:
> +		ret = imx290_write(imx290, IMX290_HMAX,
> +				   ctrl->val + imx290->current_mode-
>width,
> +				   NULL);
> +		break;
> +
>  	default:
>  		ret = -EINVAL;
>  		break;
> @@ -737,12 +744,14 @@ static void imx290_ctrl_update(struct imx290 *imx290,
>  			       const struct v4l2_mbus_framefmt *format,
>  			       const struct imx290_mode *mode)
>  {
> -	unsigned int hblank = mode->hmax - mode->width;
> +	unsigned int hblank_min = mode->hmax_min - mode->width;
> +	unsigned int hblank_max = IMX290_HMAX_MAX - mode->width;
>  	unsigned int vblank = IMX290_VMAX_DEFAULT - mode->height;
> 
>  	__v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
> 
> -	__v4l2_ctrl_modify_range(imx290->hblank, hblank, hblank, 1, hblank);
> +	__v4l2_ctrl_modify_range(imx290->hblank, hblank_min, hblank_max, 1,
> +				 hblank_min);
>  	__v4l2_ctrl_modify_range(imx290->vblank, vblank, vblank, 1, vblank);
>  }
> 
> @@ -799,10 +808,11 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>  				     
ARRAY_SIZE(imx290_test_pattern_menu) - 1,
>  				     0, 0, imx290_test_pattern_menu);
> 
> +	/*
> +	 * Actual range will be set from imx290_ctrl_update later in the 
probe.
> +	 */
>  	imx290->hblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
>  					   V4L2_CID_HBLANK, 1, 1, 1, 
1);
> -	if (imx290->hblank)
> -		imx290->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> 
>  	imx290->vblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
>  					   V4L2_CID_VBLANK, 1, 1, 1, 
1);
> @@ -871,11 +881,6 @@ static int imx290_start_streaming(struct imx290
> *imx290, return ret;
>  	}
> 
> -	ret = imx290_write(imx290, IMX290_HMAX, imx290->current_mode->hmax,
> -			   NULL);
> -	if (ret)
> -		return ret;
> -
>  	/* Apply customized values from user */
>  	ret = __v4l2_ctrl_handler_setup(imx290->sd.ctrl_handler);
>  	if (ret) {




