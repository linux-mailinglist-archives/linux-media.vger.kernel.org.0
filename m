Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B51D2D344F
	for <lists+linux-media@lfdr.de>; Tue,  8 Dec 2020 21:51:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731081AbgLHUgQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Dec 2020 15:36:16 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41912 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbgLHUgQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Dec 2020 15:36:16 -0500
Received: from [IPv6:2003:c7:cf34:9800:3135:c558:a9f:2abf] (p200300c7cf3498003135c5580a9f2abf.dip0.t-ipconnect.de [IPv6:2003:c7:cf34:9800:3135:c558:a9f:2abf])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 75FF41F44BB1;
        Tue,  8 Dec 2020 18:59:31 +0000 (GMT)
Subject: Re: [PATCH v2] media: rkisp1: Add the enum_frame_size ioctl
To:     Sebastian Fricke <sebastian.fricke.linux@gmail.com>,
        linux-media@vger.kernel.org
Cc:     helen.koike@collabora.com
References: <20201207184358.3793-1-sebastian.fricke.linux@gmail.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <241437d9-520b-1806-8231-09d6377768a5@collabora.com>
Date:   Tue, 8 Dec 2020 19:59:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201207184358.3793-1-sebastian.fricke.linux@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

Am 07.12.20 um 19:43 schrieb Sebastian Fricke:
> Implement the VIDIOC_SUBDEV_ENUM_FRAME_SIZE ioctl, check if the mbus

I would add a to the description the entity to which you add the ioctl:
"Implement the VIDIOC_SUBDEV_ENUM_FRAME_SIZE ioctl for the isp entity"

Also, the the commit subject cab be prefixed with the isp:
media: rkisp1: isp: ..

> code is valid for the given pad. This call is not available for the
> parameter or metadata pads of the RkISP1.
> 
> Signed-off-by: Sebastian Fricke <sebastian.fricke.linux@gmail.com>
> ---
> 
> Changes since v1:
> 
> - Replace the custom bus code check with the `rkisp1_isp_mbus_info_get`
>    function
> - Add a missing line break above the function
> 
> I have tested this patch with the following script:
> https://github.com/initBasti/Linux_kernel_media_tree_fork/commit/efc4b399cff53fb36fadde999594961a3d84073e
> 
> The results on my NanoPC-T4 (Linux nanopct4 5.10.0-rc6-rockchip64):
> 
> pad 0 = RKISP1_ISP_PAD_SINK_VIDEO
> pad 1 = RKISP1_ISP_PAD_SINK_PARAMS
> pad 2 = RKISP1_ISP_PAD_SOURCE_VIDEO
> pad 3 = RKISP1_ISP_PAD_SOURCE_STATS
> 
> basti@nanopct4:~$ python3 rkisp1_enum_frame_size_test.py
> TEST  0: pad 0 - code 0x300f - size 32x32 - 4032x3024
> TEST  1: pad 0 - code 0x3007 - size 32x32 - 4032x3024
> TEST  2: pad 0 - code 0x300e - size 32x32 - 4032x3024
> TEST  3: pad 0 - code 0x300a - size 32x32 - 4032x3024
> TEST  4: pad 0 - code 0x3012 - size 32x32 - 4032x3024
> TEST  5: pad 0 - code 0x3008 - size 32x32 - 4032x3024
> TEST  6: pad 0 - code 0x3010 - size 32x32 - 4032x3024
> TEST  7: pad 0 - code 0x3011 - size 32x32 - 4032x3024
> TEST  8: pad 0 - code 0x3014 - size 32x32 - 4032x3024
> TEST  9: pad 0 - code 0x3001 - size 32x32 - 4032x3024
> TEST 10: pad 0 - code 0x3013 - size 32x32 - 4032x3024
> TEST 11: pad 0 - code 0x3002 - size 32x32 - 4032x3024
> TEST 12: pad 0 - code 0x2011 - size 32x32 - 4032x3024
> TEST 13: pad 0 - code 0x2012 - size 32x32 - 4032x3024
> TEST 14: pad 0 - code 0x200f - size 32x32 - 4032x3024
> TEST 15: pad 0 - code 0x2010 - size 32x32 - 4032x3024
> TEST 16: pad 1 - code 0x7001 - size /
> TEST 17: pad 2 - code 0x2008 - size 32x32 - 4032x3024
> TEST 18: pad 2 - code 0x300f - size 32x32 - 4032x3024
> TEST 19: pad 2 - code 0x3007 - size 32x32 - 4032x3024
> TEST 20: pad 2 - code 0x300e - size 32x32 - 4032x3024
> TEST 21: pad 2 - code 0x300a - size 32x32 - 4032x3024
> TEST 22: pad 2 - code 0x3012 - size 32x32 - 4032x3024
> TEST 23: pad 2 - code 0x3008 - size 32x32 - 4032x3024
> TEST 24: pad 2 - code 0x3010 - size 32x32 - 4032x3024
> TEST 25: pad 2 - code 0x3011 - size 32x32 - 4032x3024
> TEST 26: pad 2 - code 0x3014 - size 32x32 - 4032x3024
> TEST 27: pad 2 - code 0x3001 - size 32x32 - 4032x3024
> TEST 28: pad 2 - code 0x3013 - size 32x32 - 4032x3024
> TEST 29: pad 2 - code 0x3002 - size 32x32 - 4032x3024
> TEST 30: pad 3 - code 0x7001 - size /
> TEST 31: pad 0 - code 0xdead - size / (test with an invalid media bus code)
> TEST 32: pad 6 - code 0x300f - size / (test with an invalid pad)
> TEST 33: pad 0 - code 0x2008 - size / (test with a format that is not supported by the pad)
> TEST 34: pad 2 - code 0x2010 - size / (test with a format that is not supported by the pad)
> 
> basti@nanopct4:~/libcamera$ v4l2-compliance
> ...
> Format ioctls (Input 0):
>      test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK

when you just run v4l2-compliance without params, it runs only on /dev/video0
You should run it on the isp subdeivce node: '-d /dev/v4l-subdev0'

Thanks,
Dafna

> ...
> 
> ---
> 
>   .../platform/rockchip/rkisp1/rkisp1-isp.c     | 34 +++++++++++++++++++
>   1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 889982d8ca41..642dd13137d3 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -600,6 +600,39 @@ static int rkisp1_isp_enum_mbus_code(struct v4l2_subdev *sd,
>   	return -EINVAL;
>   }
>   
> +static int rkisp1_isp_enum_frame_size(struct v4l2_subdev *sd,
> +				      struct v4l2_subdev_pad_config *cfg,
> +				      struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	const struct rkisp1_isp_mbus_info *mbus_info;
> +
> +	if (fse->pad == RKISP1_ISP_PAD_SINK_PARAMS ||
> +	    fse->pad == RKISP1_ISP_PAD_SOURCE_STATS)
> +		return -EINVAL;
> +
> +	if (fse->index > 0)
> +		return -EINVAL;
> +
> +	mbus_info = rkisp1_isp_mbus_info_get(fse->code);
> +	if (!mbus_info)
> +		return -EINVAL;
> +
> +	if (!(mbus_info->direction & RKISP1_ISP_SD_SINK) &&
> +	    fse->pad == RKISP1_ISP_PAD_SINK_VIDEO)
> +		return -EINVAL;
> +
> +	if (!(mbus_info->direction & RKISP1_ISP_SD_SRC) &&
> +	    fse->pad == RKISP1_ISP_PAD_SOURCE_VIDEO)
> +		return -EINVAL;
> +
> +	fse->min_width = RKISP1_ISP_MIN_WIDTH;
> +	fse->max_width = RKISP1_ISP_MAX_WIDTH;
> +	fse->min_height = RKISP1_ISP_MIN_HEIGHT;
> +	fse->max_height = RKISP1_ISP_MAX_HEIGHT;
> +
> +	return 0;
> +}
> +
>   static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
>   				  struct v4l2_subdev_pad_config *cfg)
>   {
> @@ -880,6 +913,7 @@ static int rkisp1_subdev_link_validate(struct media_link *link)
>   
>   static const struct v4l2_subdev_pad_ops rkisp1_isp_pad_ops = {
>   	.enum_mbus_code = rkisp1_isp_enum_mbus_code,
> +	.enum_frame_size = rkisp1_isp_enum_frame_size,
>   	.get_selection = rkisp1_isp_get_selection,
>   	.set_selection = rkisp1_isp_set_selection,
>   	.init_cfg = rkisp1_isp_init_config,
> 
