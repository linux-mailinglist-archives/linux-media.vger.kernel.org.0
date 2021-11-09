Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D61BA44AF52
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 15:19:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235048AbhKIOW3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Nov 2021 09:22:29 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:41980 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229568AbhKIOWX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Nov 2021 09:22:23 -0500
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A9D30bt004720;
        Tue, 9 Nov 2021 15:19:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to :
 references : cc : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=pObiHK5TKPRRKiV3HmVFL+C7RxHF51IpPh9HQK8MKac=;
 b=dlcWvimfYkcgPfkZLEtAMdMXia7A52ITLRmkeKmmom4MXXNty2jSY+TvSCiQIUtWPoeO
 KK+z38QjV0ktz9e9N+L2k8nUDZwdnhGDF16VYWeKbjAtoz13aUovo6ABleuKy3+1WRk9
 iAMgBYKoizkA7GKZAUG4VtU7MYGPgL+YbHNGmk/CvVI+QUAChfCRL74nV5qy4dmOWg9f
 +TvhXVd9tVkraUKX5ZxJG8TsqGmSJF12XFnhR1AGQttQrRJBFomSFioAvW/dcigSOmNX
 wtMl0fCMCD5z3iKSzBU+3qiBAkDHulyPlaYcEPTj8DLGJfUFRqdZpZq7I7qKq8sMJKjQ Uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c7er8d52q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 Nov 2021 15:19:29 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9BEBB10002A;
        Tue,  9 Nov 2021 15:19:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 92088231DC6;
        Tue,  9 Nov 2021 15:19:27 +0100 (CET)
Received: from [10.201.23.19] (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 9 Nov
 2021 15:19:26 +0100
Subject: Re: [PATCH] media: ov5640: Fix set format, v4l2_mbus_pixelcode not
 updated
To:     "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>,
        <mchehab@kernel.org>, Steve Longerbeam <slongerbeam@gmail.com>,
        <jacopo+renesas@jmondi.org>
References: <20211101195251.700674-1-mirela.rabulea@oss.nxp.com>
 <PAXPR10MB4734B68AC186DCDA40A97CDFFE919@PAXPR10MB4734.EURPRD10.PROD.OUTLOOK.COM>
CC:     <guoniu.zhou@nxp.com>, <manish.bajaj@nxp.com>,
        <robert.chiras@nxp.com>, <xavier.roumegue@oss.nxp.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-imx@nxp.com>, Mirela Rabulea <mirela.rabulea@nxp.com>
From:   Hugues FRUCHET - FOSS <hugues.fruchet@foss.st.com>
Message-ID: <7f74b844-809b-6255-fe4a-e4cef55cbae7@foss.st.com>
Date:   Tue, 9 Nov 2021 15:19:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <PAXPR10MB4734B68AC186DCDA40A97CDFFE919@PAXPR10MB4734.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-09_03,2021-11-08_02,2020-04-07_01
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mirela,

Thanks for patch, tested OK on my side:

Acked-by: Hugues Fruchet <hugues.fruchet@st.com>
Tested-by: Hugues Fruchet <hugues.fruchet@st.com>

BR,
Hugues.
> 
> 
> -----Original Message-----
> From: Mirela Rabulea (OSS) <mirela.rabulea@oss.nxp.com>
> Sent: lundi 1 novembre 2021 20:53
> To: slongerbeam@gmail.com; mchehab@kernel.org; Hugues FRUCHET <hugues.fruchet@st.com>; jacopo+renesas@jmondi.org
> Cc: guoniu.zhou@nxp.com; manish.bajaj@nxp.com; robert.chiras@nxp.com; xavier.roumegue@oss.nxp.com; linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; linux-imx@nxp.com; Mirela Rabulea <mirela.rabulea@nxp.com>
> Subject: [PATCH] media: ov5640: Fix set format, v4l2_mbus_pixelcode not updated
> 
> From: Mirela Rabulea <mirela.rabulea@nxp.com>
> 
> In ov5640_set_fmt, pending_fmt_change will always be false, because the sensor format is saved before comparing it with the previous format:
> 	fmt = &sensor->fmt;...
> 	*fmt = *mbus_fmt;...
> 	if (mbus_fmt->code != sensor->fmt.code)
> 		sensor->pending_fmt_change = true;
> This causes the sensor to capture with the previous pixelcode.
> 
> Also, changes might happen even for V4L2_SUBDEV_FORMAT_TRY, so fix that.
> 
> Basically, revert back to the state before commit 071154499193 ("media: ov5640: Fix set format regression") as it was more clear, and then update format even when pixelcode does not change, as resolution might change.
> 
> Fixes: 071154499193 ("media: ov5640: Fix set format regression")
> Fixes: 6949d864776e ("media: ov5640: do not change mode if format or frame interval is unchanged")
> Fixes: fb98e29ff1ea5 ("media: ov5640: fix mode change regression")
> 
> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
>   drivers/media/i2c/ov5640.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c index ddbd71394db3..db5a19babe67 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -2293,7 +2293,6 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
>   	struct ov5640_dev *sensor = to_ov5640_dev(sd);
>   	const struct ov5640_mode_info *new_mode;
>   	struct v4l2_mbus_framefmt *mbus_fmt = &format->format;
> -	struct v4l2_mbus_framefmt *fmt;
>   	int ret;
>   
>   	if (format->pad != 0)
> @@ -2311,12 +2310,10 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
>   	if (ret)
>   		goto out;
>   
> -	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
> -		fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
> -	else
> -		fmt = &sensor->fmt;
> -
> -	*fmt = *mbus_fmt;
> +	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> +		*v4l2_subdev_get_try_format(sd, sd_state, 0) = *mbus_fmt;
> +		goto out;
> +	}
>   
>   	if (new_mode != sensor->current_mode) {
>   		sensor->current_mode = new_mode;
> @@ -2325,6 +2322,9 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
>   	if (mbus_fmt->code != sensor->fmt.code)
>   		sensor->pending_fmt_change = true;
>   
> +	/* update format even if code is unchanged, resolution might change */
> +	sensor->fmt = *mbus_fmt;
> +
>   	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
>   				 ov5640_calc_pixel_rate(sensor));
>   out:
> --
> 2.25.1
> 
