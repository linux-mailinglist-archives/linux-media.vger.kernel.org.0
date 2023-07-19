Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEE8F759491
	for <lists+linux-media@lfdr.de>; Wed, 19 Jul 2023 13:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbjGSLqJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jul 2023 07:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjGSLqI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jul 2023 07:46:08 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58BEFC7
        for <linux-media@vger.kernel.org>; Wed, 19 Jul 2023 04:46:07 -0700 (PDT)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36JAqtqV023945;
        Wed, 19 Jul 2023 13:45:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=3hts5cW3pdZOp4wz4IkpsSbdrLCbo4KfA0OlalM6D2I=;
 b=OrShLQMI8j+UloY97kN8wdnWWreHodptMcpokS/fxPx6mkdD1Rc8jK4BXx0s1ZhTbyHp
 honW2QcH4QakCeoZ/QNIy/GnlLR/nYthhFdM/y0zwfzGhSCmx8DFx+SPRDCXT+dJu82w
 MrwrOBgVyJGQOWKhBNuN5ionLRdIWQLLMlD0Hc52Bqsz3KgevjenpXYs5fnDAsolWkgJ
 UJSN0LA3kY72j8Ybz5MwanBtP3TzKmZoWsWgJOHg+i+zalkSSGsREreZT6rjsStVi5GZ
 o3K98z4E8YV1BwGWbGV1/zIhLoGZQuec4xstgEH4iky456HfBfphbqIOBAuVrERgtYFD 1g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rx62r410n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Jul 2023 13:45:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E258B10002A;
        Wed, 19 Jul 2023 13:45:46 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DA8CF222C80;
        Wed, 19 Jul 2023 13:45:46 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 19 Jul
 2023 13:45:46 +0200
Date:   Wed, 19 Jul 2023 13:45:30 +0200
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     <guoniu.zhou@oss.nxp.com>
CC:     <linux-media@vger.kernel.org>, <mchehab@kernel.org>,
        <slongerbeam@gmail.com>, <sakari.ailus@linux.intel.com>,
        <jacopo.mondi@ideasonboard.com>,
        <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] media: ov5640: fix vblank unchange issue when work at
 dvp mode
Message-ID: <20230719114530.GA1066391@gnbcxd0016.gnb.st.com>
Mail-Followup-To: guoniu.zhou@oss.nxp.com, linux-media@vger.kernel.org,
        mchehab@kernel.org, slongerbeam@gmail.com,
        sakari.ailus@linux.intel.com, jacopo.mondi@ideasonboard.com,
        laurent.pinchart@ideasonboard.com
References: <20230719073012.3739998-1-guoniu.zhou@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230719073012.3739998-1-guoniu.zhou@oss.nxp.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-19_08,2023-07-19_01,2023-05-22_02
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Guoniu,

I came up to the same conclusion about wrong vblank when trying to make
the OV5640 work in DVP mode so I agree about this modification.

However I think other ctrls also have the same issue, at least
exposure.  I am wondering if we should keep the splitted code as
currently and add back the missing ctrl in the DVP mode path or
rework code to apply ctrl in both modes ?
Basically link_freq / pixelrate handling differ between DVP and MIPI
but it should be same handling for other ctrls I think.

Regards,
Alain

On Wed, Jul 19, 2023 at 03:30:12PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> 
> The value of V4L2_CID_VBLANK control is initialized to default vblank
> value of 640x480 when driver probe. When OV5640 work at DVP mode, the
> control value won't update and lead to sensor can't output data if the
> resolution remain the same as last time since incorrect total vertical
> size. So update it when there is a new value applied.
> 
> Fixes: bce93b827de6 ("media: ov5640: Add VBLANK control")
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/i2c/ov5640.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 36b509714c8c..2f742f5f95fd 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -2854,12 +2854,22 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static void __v4l2_ctrl_vblank_update(struct ov5640_dev *sensor, u32 vblank)
> +{
> +	const struct ov5640_mode_info *mode = sensor->current_mode;
> +
> +	__v4l2_ctrl_modify_range(sensor->ctrls.vblank, OV5640_MIN_VBLANK,
> +				 OV5640_MAX_VTS - mode->height, 1, vblank);
> +
> +	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, vblank);
> +}
> +
>  static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
>  {
>  	const struct ov5640_mode_info *mode = sensor->current_mode;
>  	enum ov5640_pixel_rate_id pixel_rate_id = mode->pixel_rate;
>  	struct v4l2_mbus_framefmt *fmt = &sensor->fmt;
> -	const struct ov5640_timings *timings;
> +	const struct ov5640_timings *timings = ov5640_timings(sensor, mode);
>  	s32 exposure_val, exposure_max;
>  	unsigned int hblank;
>  	unsigned int i = 0;
> @@ -2878,6 +2888,8 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
>  		__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
>  					 ov5640_calc_pixel_rate(sensor));
>  
> +		__v4l2_ctrl_vblank_update(sensor, timings->vblank_def);
> +
>  		return 0;
>  	}
>  
> @@ -2920,15 +2932,12 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
>  	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate, pixel_rate);
>  	__v4l2_ctrl_s_ctrl(sensor->ctrls.link_freq, i);
>  
> -	timings = ov5640_timings(sensor, mode);
>  	hblank = timings->htot - mode->width;
>  	__v4l2_ctrl_modify_range(sensor->ctrls.hblank,
>  				 hblank, hblank, 1, hblank);
>  
>  	vblank = timings->vblank_def;
> -	__v4l2_ctrl_modify_range(sensor->ctrls.vblank, OV5640_MIN_VBLANK,
> -				 OV5640_MAX_VTS - mode->height, 1, vblank);
> -	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, vblank);
> +	__v4l2_ctrl_vblank_update(sensor, vblank);
>  
>  	exposure_max = timings->crop.height + vblank - 4;
>  	exposure_val = clamp_t(s32, sensor->ctrls.exposure->val,
> -- 
> 2.37.1
> 
