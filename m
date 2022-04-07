Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1D794F84F3
	for <lists+linux-media@lfdr.de>; Thu,  7 Apr 2022 18:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbiDGQ2E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Apr 2022 12:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345758AbiDGQ1u (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Apr 2022 12:27:50 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D69A0BC9C
        for <linux-media@vger.kernel.org>; Thu,  7 Apr 2022 09:25:47 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 237Apv66022030;
        Thu, 7 Apr 2022 18:25:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=bs54wxVlDtAWRCYTScu+zZKcWnoLuvX76Qt87BJl8Mk=;
 b=Fz3Ai74fnHNJW7K9FrIZSjKlwN3W7YCL5c+5rxtH2EzYfiWvGjSo+nUIVHdZho789pvj
 vwFNPRNoVcDlqlJtoeaIdWx4wLKjfr9ec/H/MAV0OKtZuNgL+3dPCA066T2hQETi5FyK
 fTYMEwbuUfVx4aSmVZlMhgFf/QES2ry+LWRf8w41/bnsvdHHkTjpek3j6KDR7u/5ftyp
 ET5IQq+iHor2fr/bhAZJSIZ6cINhKuhV+ka2TnkHbBQlYazQwRf41JO3hdUVLoT1wPei
 9/ISS/TuqZAJPzrhRSunyqs0Rdd/uk+3cW17Uq2Hg+C4liRTaVXQjt4oHyijYVgXx/ax OA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f8x9gndn6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 07 Apr 2022 18:25:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 651CF10002A;
        Thu,  7 Apr 2022 18:25:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5B8CB222226;
        Thu,  7 Apr 2022 18:25:27 +0200 (CEST)
Received: from [10.201.23.19] (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 7 Apr
 2022 18:25:26 +0200
Subject: Re: [PATCH v5 20/27] media: ov5640: Limit frame_interval to DVP mode
 only
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
 <20220224094313.233347-21-jacopo@jmondi.org>
From:   Hugues FRUCHET - FOSS <hugues.fruchet@foss.st.com>
Message-ID: <586cf4f0-0579-4b7b-df3b-fd0c6d117e8e@foss.st.com>
Date:   Thu, 7 Apr 2022 18:25:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220224094313.233347-21-jacopo@jmondi.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
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

On 2/24/22 10:43 AM, Jacopo Mondi wrote:
> In MIPI mode the frame rate control is performed by adjusting the
> frame blankings and the s_frame_interval function is not used anymore.
> 
> Only check for the per-mode supported frame rate in DVP mode and do not
> restrict MIPI mode.
> 
> Disallow enum/s/g_frame_interval if the chip is used in MIPI mode.

This is breaking userspace which set framerate through media-ctl:
media-ctl -d /dev/media0 --set-v4l2 "'ov5640 
1-003c':0[fmt:JPEG_1X8/640x480@1/15 field:none]"
because of unsupported framerate, all the rest is ignored (resolution 
and format).

I can understand use of vblank to tune framerate but I would expect that 
compatibility with frame interval setting is kept, it's far more simple 
for an application to set the frame interval versus finding the right 
vblank to apply (not straightforward...)

On my side I have reverted this patch and added support of both, see 
patch proposal in reply to [PATCH v5 16/27] media: ov5640: Add VBLANK 
control.


> 
> While at it re-indent one function which whose parameters were wrongly
> aligned.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/media/i2c/ov5640.c | 18 ++++++++++++++++--
>   1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index baf368a39e0f..6b955163eb4d 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -2005,9 +2005,14 @@ ov5640_find_mode(struct ov5640_dev *sensor, enum ov5640_frame_rate fr,
>   	     (mode->width != width || mode->height != height)))
>   		return NULL;
>   
> -	/* Check to see if the current mode exceeds the max frame rate */
> +	/*
> +	 * Check to see if the current mode exceeds the max frame rate.
> +	 * Only DVP mode uses the frame rate set by s_frame_interval, MIPI
> +	 * mode controls framerate by setting blankings.
> +	 */
>   	timings = &mode->dvp_timings;
> -	if (ov5640_framerates[fr] > ov5640_framerates[timings->max_fps])
> +	if (!ov5640_is_csi2(sensor) &&
> +	    ov5640_framerates[fr] > ov5640_framerates[timings->max_fps])
>   		return NULL;
>   
>   	return mode;
> @@ -3439,6 +3444,9 @@ static int ov5640_enum_frame_interval(
>   	struct v4l2_fract tpf;
>   	int ret;
>   
> +	if (ov5640_is_csi2(sensor))
> +		return -EINVAL;
> +
>   	if (fie->pad != 0)
>   		return -EINVAL;
>   	if (fie->index >= OV5640_NUM_FRAMERATES)
> @@ -3461,6 +3469,9 @@ static int ov5640_g_frame_interval(struct v4l2_subdev *sd,
>   {
>   	struct ov5640_dev *sensor = to_ov5640_dev(sd);
>   
> +	if (ov5640_is_csi2(sensor))
> +		return -EINVAL;
> +
>   	mutex_lock(&sensor->lock);
>   	fi->interval = sensor->frame_interval;
>   	mutex_unlock(&sensor->lock);
> @@ -3475,6 +3486,9 @@ static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
>   	const struct ov5640_mode_info *mode;
>   	int frame_rate, ret = 0;
>   
> +	if (ov5640_is_csi2(sensor))
> +		return -EINVAL;
> +
>   	if (fi->pad != 0)
>   		return -EINVAL;
>   
> 
