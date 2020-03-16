Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D066F18738A
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 20:41:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732446AbgCPTlC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 15:41:02 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51930 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732413AbgCPTlC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 15:41:02 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 00F2D28CFC6
Subject: Re: [PATCH 1/3] vimc: Add usage count to subdevices
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org
Cc:     libcamera-devel@lists.libcamera.org,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
References: <20190518010744.15195-1-niklas.soderlund+renesas@ragnatech.se>
 <20190518010744.15195-2-niklas.soderlund+renesas@ragnatech.se>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <69c63e0a-d46a-d553-5308-9feb16e49353@collabora.com>
Date:   Mon, 16 Mar 2020 16:40:54 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20190518010744.15195-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On 5/17/19 10:07 PM, Niklas Söderlund wrote:
> Prepare for multiple video streams from the same sensor by adding a use
> counter to each subdevice. The counter is increase for every s_stream(1)
> and decremented for every s_stream(0) call.
> 
> The subdevice stream is not started or stopped unless the usage count go
> from 0 to 1 (started) or from 1 to 0 (stopped). This allow for multiple
> s_stream() calls to try to either start or stop the device while only
> the first/last call will actually effect the state of the device.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>

This patch won't be required if the following series gets accepted
https://patchwork.linuxtv.org/cover/62233/

Since helpers takes care that s_stream(true) won't be called twice without
s_stream(false) (and the opposite is also true).

Regards,
Helen

> ---
>  drivers/media/platform/vimc/vimc-debayer.c | 8 ++++++++
>  drivers/media/platform/vimc/vimc-scaler.c  | 8 ++++++++
>  drivers/media/platform/vimc/vimc-sensor.c  | 7 +++++++
>  3 files changed, 23 insertions(+)
> 
> diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
> index 281f9c1a7249ad1d..624fc23ce3077d40 100644
> --- a/drivers/media/platform/vimc/vimc-debayer.c
> +++ b/drivers/media/platform/vimc/vimc-debayer.c
> @@ -56,6 +56,7 @@ struct vimc_deb_device {
>  	struct vimc_ent_device ved;
>  	struct v4l2_subdev sd;
>  	struct device *dev;
> +	atomic_t use_count;
>  	/* The active format */
>  	struct v4l2_mbus_framefmt sink_fmt;
>  	u32 src_code;
> @@ -337,6 +338,9 @@ static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
>  		const struct v4l2_format_info *pix_info;
>  		unsigned int frame_size;
>  
> +		if (atomic_inc_return(&vdeb->use_count) != 1)
> +			return 0;
> +
>  		if (vdeb->src_frame)
>  			return 0;
>  
> @@ -374,6 +378,9 @@ static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
>  			return -ENOMEM;
>  
>  	} else {
> +		if (atomic_dec_return(&vdeb->use_count) != 0)
> +			return 0;
> +
>  		if (!vdeb->src_frame)
>  			return 0;
>  
> @@ -562,6 +569,7 @@ static int vimc_deb_comp_bind(struct device *comp, struct device *master,
>  	vdeb->ved.process_frame = vimc_deb_process_frame;
>  	dev_set_drvdata(comp, &vdeb->ved);
>  	vdeb->dev = comp;
> +	atomic_set(&vdeb->use_count, 0);
>  
>  	/* Initialize the frame format */
>  	vdeb->sink_fmt = sink_fmt_default;
> diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
> index 8aecf8e920310608..37d2020d987a7d80 100644
> --- a/drivers/media/platform/vimc/vimc-scaler.c
> +++ b/drivers/media/platform/vimc/vimc-scaler.c
> @@ -45,6 +45,7 @@ struct vimc_sca_device {
>  	struct vimc_ent_device ved;
>  	struct v4l2_subdev sd;
>  	struct device *dev;
> +	atomic_t use_count;
>  	/* NOTE: the source fmt is the same as the sink
>  	 * with the width and hight multiplied by mult
>  	 */
> @@ -213,6 +214,9 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
>  		const struct v4l2_format_info *pix_info;
>  		unsigned int frame_size;
>  
> +		if (atomic_inc_return(&vsca->use_count) != 1)
> +			return 0;
> +
>  		if (vsca->src_frame)
>  			return 0;
>  
> @@ -242,6 +246,9 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
>  			return -ENOMEM;
>  
>  	} else {
> +		if (atomic_dec_return(&vsca->use_count) != 0)
> +			return 0;
> +
>  		if (!vsca->src_frame)
>  			return 0;
>  
> @@ -396,6 +403,7 @@ static int vimc_sca_comp_bind(struct device *comp, struct device *master,
>  	vsca->ved.process_frame = vimc_sca_process_frame;
>  	dev_set_drvdata(comp, &vsca->ved);
>  	vsca->dev = comp;
> +	atomic_set(&vsca->use_count, 0);
>  
>  	/* Initialize the frame format */
>  	vsca->sink_fmt = sink_fmt_default;
> diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
> index baca9ca67ce0af0b..36c3cea85a185f4b 100644
> --- a/drivers/media/platform/vimc/vimc-sensor.c
> +++ b/drivers/media/platform/vimc/vimc-sensor.c
> @@ -34,6 +34,7 @@ struct vimc_sen_device {
>  	struct vimc_ent_device ved;
>  	struct v4l2_subdev sd;
>  	struct device *dev;
> +	atomic_t use_count;
>  	struct tpg_data tpg;
>  	struct task_struct *kthread_sen;
>  	u8 *frame;
> @@ -197,6 +198,9 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
>  		const struct v4l2_format_info *pix_info;
>  		unsigned int frame_size;
>  
> +		if (atomic_inc_return(&vsen->use_count) != 1)
> +			return 0;
> +
>  		if (vsen->kthread_sen)
>  			/* tpg is already executing */
>  			return 0;
> @@ -218,6 +222,8 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
>  		vimc_sen_tpg_s_format(vsen);
>  
>  	} else {
> +		if (atomic_dec_return(&vsen->use_count) != 0)
> +			return 0;
>  
>  		vfree(vsen->frame);
>  		vsen->frame = NULL;
> @@ -367,6 +373,7 @@ static int vimc_sen_comp_bind(struct device *comp, struct device *master,
>  	vsen->ved.process_frame = vimc_sen_process_frame;
>  	dev_set_drvdata(comp, &vsen->ved);
>  	vsen->dev = comp;
> +	atomic_set(&vsen->use_count, 0);
>  
>  	/* Initialize the frame format */
>  	vsen->mbus_format = fmt_default;
> 
