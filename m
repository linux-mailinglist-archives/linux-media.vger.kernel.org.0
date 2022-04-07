Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84F954F84F5
	for <lists+linux-media@lfdr.de>; Thu,  7 Apr 2022 18:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242943AbiDGQ2Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Apr 2022 12:28:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243815AbiDGQ2T (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Apr 2022 12:28:19 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 070483525A
        for <linux-media@vger.kernel.org>; Thu,  7 Apr 2022 09:26:18 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 237Aq1Ha000624;
        Thu, 7 Apr 2022 18:25:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=tKb04zVDa28mwf80QoxouAT4mgf6FsoZvFaYT3R20ro=;
 b=6VkJGMFYHqScbfeotOGNBZci7S1DmE1NzW9yJ0qo1UIXZ+y/o77+8hQBBN85JE4/nEMe
 EsiH4IYwfulnIuqEBIBD4WddcBi8BEkOiNPWnjizwuc7gZ6MRJ8TOi7QEW0VZUKwXcNC
 /pIbYy3IwBughQpc+cfUvalwlyi8ZwwMOBUPDH+AMBvyRto2KxNCVWlr+lUez3ReRjw7
 3DIgQIyN6sATqUsxolER7qpPzgUxXcSvJSeGR0Z1SEbVjb9JPL2G1/67yOB/pbXQUvdf
 M5kd0UYk72Hv1AYB5Z59n637NLGTmMo2cCjbRAgHoxGVDgOb9+2lbwzGKJEB8Nva+AXr QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f9wr7jbgf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 07 Apr 2022 18:25:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D567410002A;
        Thu,  7 Apr 2022 18:25:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CC274222229;
        Thu,  7 Apr 2022 18:25:58 +0200 (CEST)
Received: from [10.201.23.19] (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 7 Apr
 2022 18:25:58 +0200
Subject: Re: [PATCH v5 06/27] media: ov5640: Update pixel_rate and link_freq
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
 <20220224094313.233347-7-jacopo@jmondi.org>
From:   Hugues FRUCHET - FOSS <hugues.fruchet@foss.st.com>
Message-ID: <1d891351-3bb5-1c31-9303-1330f28a45ec@foss.st.com>
Date:   Thu, 7 Apr 2022 18:25:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220224094313.233347-7-jacopo@jmondi.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
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

Issue with link frequency value reported, see below.

On 2/24/22 10:42 AM, Jacopo Mondi wrote:
> After having set a new format re-calculate the pixel_rate and link_freq
> control values and update them when in MIPI mode.
> 
> Take into account the limitation of the link frequency having to be
> strictly smaller than 1GHz when computing the desired link_freq, and
> adjust the resulting pixel_rate acounting for the clock tree
> configuration.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/media/i2c/ov5640.c | 66 ++++++++++++++++++++++++++++++++++++--
>   1 file changed, 64 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index f9763edf2422..791694bfed41 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -31,6 +31,8 @@
>   
>   #define OV5640_DEFAULT_SLAVE_ID 0x3c
>   
> +#define OV5640_LINK_RATE_MAX		490000000U
> +
>   #define OV5640_REG_SYS_RESET02		0x3002
>   #define OV5640_REG_SYS_CLOCK_ENABLE02	0x3006
>   #define OV5640_REG_SYS_CTRL0		0x3008
> @@ -2412,6 +2414,66 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
>   	return 0;
>   }
>   
> +static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
> +{
> +	const struct ov5640_mode_info *mode = sensor->current_mode;
> +	struct v4l2_mbus_framefmt *fmt = &sensor->fmt;
> +	enum ov5640_pixel_rate_id pixel_rate_id = mode->pixel_rate;
> +	unsigned int i = 0;
> +	u32 pixel_rate;
> +	s64 link_freq;
> +	u32 num_lanes;
> +	u32 bpp;
> +
> +	/*
> +	 * Update the pixel rate control value.
> +	 *
> +	 * For DVP mode, maintain the pixel rate calculation using fixed FPS.
> +	 */
> +	if (!ov5640_is_csi2(sensor)) {
> +		__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
> +					 ov5640_calc_pixel_rate(sensor));
> +
> +		return 0;
> +	}
> +
> +	/*
> +	 * The MIPI CSI-2 link frequency should comply with the CSI-2
> +	 * specification and be lower than 1GHz.
> +	 *
> +	 * Start from the suggested pixel_rate for the current mode and
> +	 * progressively slow it down if it exceeds 1GHz.
> +	 */
> +	num_lanes = sensor->ep.bus.mipi_csi2.num_data_lanes;
> +	bpp = ov5640_code_to_bpp(fmt->code);
> +	do {
> +		pixel_rate = ov5640_pixel_rates[pixel_rate_id];
> +		link_freq = pixel_rate * bpp / (2 * num_lanes);
> +	} while (link_freq >= 1000000000U &&
> +		 ++pixel_rate_id < OV5640_NUM_PIXEL_RATES);
> +
> +	/*
> +	 * Higher link rates require the clock tree to be programmed with
> +	 * 'mipi_div' = 1; this has the effect of halving the actual output
> +	 * pixel rate in the MIPI domain.
> +	 *
> +	 * Adjust the pixel rate control value to report it correctly to
> +	 * userspace.
> +	 */
> +	if (link_freq > OV5640_LINK_RATE_MAX)
> +		pixel_rate /= 2;

Need to divide also the link_frequency (st-mipid02 bridge interfacing is 
broken here). Patch proposal below:

+	sensor->current_link_freq = link_freq;
+
+	 * Adjust the pixel rate & link frequency control value to report it
+	 * correctly to userspace.
  	 */
-	if (link_freq > OV5640_LINK_RATE_MAX)
+	if (link_freq > OV5640_LINK_RATE_MAX) {
  		pixel_rate /= 2;
+		link_freq /= 2;
+	}


Doing so we cannot relay anymore on link_frequency control reading in 
ov5640_set_mipi_pclk(), use current_link_freq variable instead

@@ -1440,7 +1453,7 @@ static int ov5640_set_mipi_pclk(struct ov5640_dev 
*sensor)
  	int ret;

  	/* Use the link freq computed at ov5640_update_pixel_rate() time. */
-	link_freq = ov5640_csi2_link_freqs[sensor->ctrls.link_freq->cur.val];
+	link_freq = sensor->current_link_freq;

@@ -3782,6 +3811,7 @@ static int ov5640_probe(struct i2c_client *client)
  	sensor->current_mode =
  		&ov5640_mode_data[OV5640_MODE_VGA_640_480];
  	sensor->last_mode = sensor->current_mode;
+	sensor->current_link_freq = OV5640_DEFAULT_LINK_FREQ;




> +
> +	for (i = 0; i < ARRAY_SIZE(ov5640_csi2_link_freqs); ++i) {
> +		if (ov5640_csi2_link_freqs[i] == link_freq)
> +			break;
> +	}
> +
> +	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate, pixel_rate);
> +	__v4l2_ctrl_s_ctrl(sensor->ctrls.link_freq, i);
> +
> +	return 0;
> +}
> +
>   static int ov5640_set_fmt(struct v4l2_subdev *sd,
>   			  struct v4l2_subdev_state *sd_state,
>   			  struct v4l2_subdev_format *format)
> @@ -2451,8 +2513,8 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
>   	/* update format even if code is unchanged, resolution might change */
>   	sensor->fmt = *mbus_fmt;
>   
> -	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
> -				 ov5640_calc_pixel_rate(sensor));
> +	ov5640_update_pixel_rate(sensor);
> +
>   out:
>   	mutex_unlock(&sensor->lock);
>   	return ret;
> 

Hugues.
