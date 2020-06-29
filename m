Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2678D20D45E
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2020 21:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729428AbgF2THz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 15:07:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730591AbgF2THo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 15:07:44 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B18FEC031C69
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2020 10:48:21 -0700 (PDT)
Received: from [IPv6:2003:cb:8737:cf00:84c7:ee07:61e9:a21f] (p200300cb8737cf0084c7ee0761e9a21f.dip0.t-ipconnect.de [IPv6:2003:cb:8737:cf00:84c7:ee07:61e9:a21f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 95EBD2A212B;
        Mon, 29 Jun 2020 18:48:19 +0100 (BST)
Subject: Re: [PATCH 20/25] media: ov5647: Program mode only if it has changed
To:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dave.stevenson@raspberrypi.org,
        naush@raspberrypi.com
Cc:     mrodin@de.adit-jv.com, hugues.fruchet@st.com, mripard@kernel.org,
        aford173@gmail.com, sudipi@jp.adit-jv.com,
        andrew_gabbasov@mentor.com, erosca@de.adit-jv.com,
        linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        dafna Hirschfeld <dafna3@gmail.com>
References: <20200623100815.10674-1-jacopo@jmondi.org>
 <20200623165550.45835-1-jacopo@jmondi.org>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <80139e40-914f-c547-922f-91fe3f611202@collabora.com>
Date:   Mon, 29 Jun 2020 19:48:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200623165550.45835-1-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 23.06.20 18:55, Jacopo Mondi wrote:
> Store in the driver structure a pointer to the currently applied mode
> and program a new one at s_stream(1) time only if it has changed.

Hi,
I think this can be more readably implemented with a 'is_streaming' boolean
field.

Thanks,
Dafna

> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>   drivers/media/i2c/ov5647.c | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 39e320f321bd8..ac114269e1c73 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -96,6 +96,7 @@ struct ov5647 {
>   	bool				clock_ncont;
>   	struct v4l2_ctrl_handler	ctrls;
>   	struct ov5647_mode		*mode;
> +	struct ov5647_mode		*current_mode;
>   };
>   
>   static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
> @@ -750,9 +751,13 @@ static int ov5647_set_virtual_channel(struct v4l2_subdev *sd, int channel)
>   static int ov5647_set_mode(struct v4l2_subdev *sd)
>   {
>   	struct i2c_client *client = v4l2_get_subdevdata(sd);
> +	struct ov5647 *sensor = to_sensor(sd);
>   	u8 resetval, rdval;
>   	int ret;
>   
> +	if (sensor->mode == sensor->current_mode)
> +		return 0;
> +
>   	ret = ov5647_read(sd, OV5647_SW_STANDBY, &rdval);
>   	if (ret < 0)
>   		return ret;
> @@ -778,6 +783,8 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)
>   			return ret;
>   	}
>   
> +	sensor->current_mode = sensor->mode;
> +
>   	return 0;
>   }
>   
> @@ -816,6 +823,7 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
>   
>   static int ov5647_stream_off(struct v4l2_subdev *sd)
>   {
> +	struct ov5647 *sensor = to_sensor(sd);
>   	int ret;
>   
>   	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00, MIPI_CTRL00_CLOCK_LANE_GATE |
> @@ -827,7 +835,13 @@ static int ov5647_stream_off(struct v4l2_subdev *sd)
>   	if (ret < 0)
>   		return ret;
>   
> -	return ov5647_write(sd, OV5640_REG_PAD_OUT, 0x01);
> +	ret = ov5647_write(sd, OV5640_REG_PAD_OUT, 0x01);
> +	if (ret < 0)
> +		return ret;
> +
> +	sensor->current_mode = NULL;
> +
> +	return 0;
>   }
>   
>   static int set_sw_standby(struct v4l2_subdev *sd, bool standby)
> 
