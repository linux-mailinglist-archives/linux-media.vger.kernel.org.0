Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21B5F4F84F2
	for <lists+linux-media@lfdr.de>; Thu,  7 Apr 2022 18:26:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235597AbiDGQ2F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Apr 2022 12:28:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345825AbiDGQ2A (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Apr 2022 12:28:00 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B601BC9C
        for <linux-media@vger.kernel.org>; Thu,  7 Apr 2022 09:25:56 -0700 (PDT)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 237AqGOv030800;
        Thu, 7 Apr 2022 18:25:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=LcPst2A1idiyljSEAjrHVtwI1Cbe4isvDa5Ib2ZTX4o=;
 b=no1xasfyIMpTO/G+KTEEHXCLHLjml2WQAzaoZGN2cM+M1hZEtTDd56rrudHz5zTzXjS3
 5K2yYPYeIcLsIFzL4Q3bYic/PlVqmrIL07jbiWIzEIlKHgCH5+e5ShxT7TLml087IiqU
 Gm8Rzgy9e0qMpuJ/zFk1JPGhaYGJ4FUUwpbkwc0NZhr92nTZLZvudfYp5zwRcE6FnFaL
 NFHhqv7lzKSzQZKoz/xqaoob4bCerBiRc9bGdJ/pMfFYeVJorIo8M1z4k3iQ2CfhYHTC
 tErsHIXm7hooXcP8WaCj2vzuY/7IaVz2Hy6YQWCclVvKQFYItg48jAlKLsBdDK4B9n64 gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f6du16act-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 07 Apr 2022 18:25:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CAD4510002A;
        Thu,  7 Apr 2022 18:25:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C2511222226;
        Thu,  7 Apr 2022 18:25:34 +0200 (CEST)
Received: from [10.201.23.19] (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 7 Apr
 2022 18:25:33 +0200
Subject: Re: [PATCH v5 16/27] media: ov5640: Add VBLANK control
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>
CC:     <laurent.pinchart@ideasonboard.com>, <sakari.ailus@iki.fi>,
        <hverkuil-cisco@xs4all.nl>, <mirela.rabulea@nxp.com>,
        <xavier.roumegue@oss.nxp.com>, <tomi.valkeinen@ideasonboard.com>,
        <hugues.fruchet@st.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <aford173@gmail.com>, <festevam@gmail.com>,
        <Eugen.Hristev@microchip.com>, <jbrunet@baylibre.com>,
        <paul.elder@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>
References: <20220224094313.233347-1-jacopo@jmondi.org>
 <20220224094313.233347-17-jacopo@jmondi.org>
From:   Hugues FRUCHET - FOSS <hugues.fruchet@foss.st.com>
Message-ID: <3b2e09d0-8524-3b3e-0ace-47fdbd36bec7@foss.st.com>
Date:   Thu, 7 Apr 2022 18:25:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220224094313.233347-17-jacopo@jmondi.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-07_03,2022-04-07_01,2022-02-23_01
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Patch proposed below to support framerate change both with frame 
interval setting and vblank control.

On 2/24/22 10:43 AM, Jacopo Mondi wrote:
> Add the VBLANK control which allows to select the duration of the
> frame vertical blankings and allows to control the framerate.
> 
> The VBLANK control also modifies the exposure time range, which cannot
> exceed the maximum frame length.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/media/i2c/ov5640.c | 52 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 52 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 5419c7236348..665a8bcebf09 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -36,6 +36,10 @@
>   #define OV5640_PIXEL_ARRAY_WIDTH	2592
>   #define OV5640_PIXEL_ARRAY_HEIGHT	1944
>   
> +/* FIXME: not documented. */
> +#define OV5640_MIN_VBLANK	24
> +#define OV5640_MAX_VTS		1968

Not enough to support 1024x768@15fps (vblank=2607):
+#define OV5640_MAX_VTS		3375 /* 1024x768@15fps, vblank=2607 */


> +
>   #define OV5640_DEFAULT_SLAVE_ID 0x3c
>   
>   #define OV5640_LINK_RATE_MAX		490000000U
> @@ -321,6 +325,7 @@ struct ov5640_ctrls {
>   	struct v4l2_ctrl *pixel_rate;
>   	struct v4l2_ctrl *link_freq;
>   	struct v4l2_ctrl *hblank;
> +	struct v4l2_ctrl *vblank;
>   	struct {
>   		struct v4l2_ctrl *auto_exp;
>   		struct v4l2_ctrl *exposure;
> @@ -2697,6 +2702,7 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
>   	struct v4l2_mbus_framefmt *fmt = &sensor->fmt;
>   	enum ov5640_pixel_rate_id pixel_rate_id = mode->pixel_rate;
>   	const struct ov5640_timings *timings;
> +	s32 exposure_val, exposure_max;
>   	unsigned int hblank;
>   	unsigned int i = 0;
>   	u32 pixel_rate;
> @@ -2755,6 +2761,19 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
>   	__v4l2_ctrl_modify_range(sensor->ctrls.hblank,
>   				 hblank, hblank, 1, hblank);
>   
> +	__v4l2_ctrl_modify_range(sensor->ctrls.vblank, OV5640_MIN_VBLANK,
> +				 OV5640_MAX_VTS - mode->height, 1,
> +				 timings->vblank_def);
> +	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, timings->vblank_def);
> +
> +	exposure_max = timings->crop.height + timings->vblank_def - 4;
> +	exposure_val = clamp_t(s32, sensor->ctrls.exposure->val,
> +			       sensor->ctrls.exposure->minimum,
> +			       exposure_max);
> +	__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
> +				 sensor->ctrls.exposure->minimum,
> +				 exposure_max, 1, exposure_val);
> +

+	vblank = timings->vblank_def;
+
+	if (sensor->current_fr != timings->def_fps) {
+		/* Compute the blanking according to the required framerate */
+
+		int fie_num = sensor->frame_interval.numerator;
+		int fie_denom = sensor->frame_interval.denominator;
+
+		vblank = ((fie_num * pixel_rate / fie_denom) / timings->htot) -
+			 mode->height;
+	}
+
  	__v4l2_ctrl_modify_range(sensor->ctrls.vblank, OV5640_MIN_VBLANK,
  				 OV5640_MAX_VTS - mode->height, 1,
-				 timings->vblank_def);
-	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, timings->vblank_def);
+				 vblank);
+	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, vblank);

-	exposure_max = timings->crop.height + timings->vblank_def - 4;
+	exposure_max = timings->crop.height + vblank - 4;
  	exposure_val = clamp_t(s32, sensor->ctrls.exposure->val,
  			       sensor->ctrls.exposure->minimum,
  			       exposure_max);



@@ -3606,8 +3636,7 @@ static int ov5640_s_frame_interval(struct 
v4l2_subdev *sd,
  		sensor->current_mode = mode;
  		sensor->pending_mode_change = true;

-		__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
-					 ov5640_calc_pixel_rate(sensor));
+		ov5640_update_pixel_rate(sensor);
  	}
  out:
  	mutex_unlock(&sensor->lock);


Added def_fps (default framerate) in order to known when using 
vblank_def and when computing it from frame interval:


@@ -383,6 +383,8 @@ struct ov5640_timings {
  	u32 vblank_def;
  	/* DVP only; ignored in MIPI mode. */
  	u32 max_fps;
+	/* CSI-2 only; default fps for default blanking */
+	u32 def_fps;
  };

@@ -719,6 +722,7 @@ static const struct ov5640_mode_info 
ov5640_mode_data[OV5640_NUM_MODES] = {
  			},
  			.htot		= 1600,
  			.vblank_def	= 878,
+			.def_fps	= OV5640_30_FPS
[...]
@@ -1108,6 +1120,7 @@ static const struct ov5640_mode_info 
ov5640_mode_data[OV5640_NUM_MODES] = {
  			},
  			.htot		= 2844,
  			.vblank_def	= 24,
+			.def_fps	= OV5640_15_FPS
  		},


>   	return 0;
>   }
>   
> @@ -3127,6 +3146,15 @@ static int ov5640_set_ctrl_vflip(struct ov5640_dev *sensor, int value)
>   			      (BIT(2) | BIT(1)) : 0);
>   }
>   
> +static int ov5640_set_ctrl_vblank(struct ov5640_dev *sensor, int value)
> +{
> +	const struct ov5640_mode_info *mode = sensor->current_mode;
> +
> +	/* Update the VTOT timing register value. */
> +	return ov5640_write_reg16(sensor, OV5640_REG_TIMING_VTS,
> +				  mode->height + value);
> +}
> +
>   static int ov5640_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
>   {
>   	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
> @@ -3157,10 +3185,25 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
>   {
>   	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
>   	struct ov5640_dev *sensor = to_ov5640_dev(sd);
> +	const struct ov5640_mode_info *mode = sensor->current_mode;
> +	const struct ov5640_timings *timings;
> +	unsigned int exp_max;
>   	int ret;
>   
>   	/* v4l2_ctrl_lock() locks our own mutex */
>   
> +	switch (ctrl->id) {
> +	case V4L2_CID_VBLANK:
> +		/* Update the exposure range to the newly programmed vblank. */
> +		timings = ov5640_timings(sensor, mode);
> +		exp_max = mode->height + ctrl->val - 4;
> +		__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
> +					 sensor->ctrls.exposure->minimum,
> +					 exp_max, sensor->ctrls.exposure->step,
> +					 timings->vblank_def);
> +		break;
> +	}
> +
>   	/*
>   	 * If the device is not powered up by the host driver do
>   	 * not apply any controls to H/W at this time. Instead
> @@ -3200,6 +3243,9 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
>   	case V4L2_CID_VFLIP:
>   		ret = ov5640_set_ctrl_vflip(sensor, ctrl->val);
>   		break;
> +	case V4L2_CID_VBLANK:
> +		ret = ov5640_set_ctrl_vblank(sensor, ctrl->val);
> +		break;
>   	default:
>   		ret = -EINVAL;
>   		break;
> @@ -3220,6 +3266,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
>   	struct ov5640_ctrls *ctrls = &sensor->ctrls;
>   	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
>   	const struct ov5640_timings *timings;
> +	unsigned int max_vblank;
>   	unsigned int hblank;
>   	int ret;
>   
> @@ -3245,6 +3292,11 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
>   	ctrls->hblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK, hblank,
>   					  hblank, 1, hblank);
>   
> +	max_vblank = OV5640_MAX_VTS - mode->height;
> +	ctrls->vblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK,
> +					  OV5640_MIN_VBLANK, max_vblank,
> +					  1, timings->vblank_def);
> +
>   	/* Auto/manual white balance */
>   	ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
>   					   V4L2_CID_AUTO_WHITE_BALANCE,
> 

Hugues.
