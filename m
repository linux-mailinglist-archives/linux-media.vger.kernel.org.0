Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A54E2D97B1
	for <lists+linux-media@lfdr.de>; Mon, 14 Dec 2020 12:53:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438751AbgLNLwx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 06:52:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438719AbgLNLwx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 06:52:53 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A41C2C0613CF
        for <linux-media@vger.kernel.org>; Mon, 14 Dec 2020 03:52:12 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 852481F44C2C
Subject: Re: [PATCH v3] media: rkisp1: isp: Add the enum_frame_size ioctl
To:     Sebastian Fricke <sebastian.fricke.linux@gmail.com>,
        linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com
References: <20201212185306.19135-1-sebastian.fricke.linux@gmail.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <f1c6b292-1a89-6283-ec6d-ee540719b359@collabora.com>
Date:   Mon, 14 Dec 2020 08:52:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201212185306.19135-1-sebastian.fricke.linux@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 12/12/20 3:53 PM, Sebastian Fricke wrote:
> Implement the VIDIOC_SUBDEV_ENUM_FRAME_SIZE ioctl for the isp entity,
> check if the mbus code is valid for the given pad.
> This call is not available for the parameter or metadata pads of the RkISP1.
> 
> Signed-off-by: Sebastian Fricke <sebastian.fricke.linux@gmail.com>

lgtm

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
> 
> v1: https://patchwork.kernel.org/project/linux-media/patch/20201206053935.24028-1-sebastian.fricke.linux@gmail.com/
> v2: https://patchwork.kernel.org/project/linux-media/patch/20201207184358.3793-1-sebastian.fricke.linux@gmail.com/ 
> 
> Changes since v2:
>     - Change the return code for the parameter and metadata pads to -ENOTTY instead of -EINVAL
>       as this reports that the pad doesn't support the ioctl
>     - Highlight more clearly that this patch is for the isp entity of the rkisp1, within the commit description
>       as well as in the commit title
>     - Add the correct v4l2-complience output to the patch mail
> 
> Changes since v1:
>     - Replace the custom bus code check with the `rkisp1_isp_mbus_info_get`
>       function
>     - Add a missing line break above the function
> 
> I have tested this patch with the following script:
> http://paste.debian.net/1176614/
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
> And here is the output from `v4l2-compliance --device /dev/v4l-subdev0`:
> Media Driver Info:
> 	Driver name      : rkisp1
> ...
> 	Name             : rkisp1_isp
> 
> ...
> 
> Sub-Device ioctls (Sink Pad 0):
> 	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> 	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>     ...
> 
> Sub-Device ioctls (Sink Pad 1):
> 	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> 		fail: v4l2-test-subdevs.cpp(303): fmt.width == 0 || fmt.width > 65536
> 		fail: v4l2-test-subdevs.cpp(348): checkMBusFrameFmt(node, fmt.format)
> 	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> 		fail: v4l2-test-subdevs.cpp(303): fmt.width == 0 || fmt.width > 65536
> 		fail: v4l2-test-subdevs.cpp(348): checkMBusFrameFmt(node, fmt.format)
>     ...
> 
> Sub-Device ioctls (Source Pad 2):
> 	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> 	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>     ...
> 
> Sub-Device ioctls (Source Pad 3):
> 	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> 		fail: v4l2-test-subdevs.cpp(303): fmt.width == 0 || fmt.width > 65536
> 		fail: v4l2-test-subdevs.cpp(348): checkMBusFrameFmt(node, fmt.format)
> 	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> 		fail: v4l2-test-subdevs.cpp(303): fmt.width == 0 || fmt.width > 65536
> 		fail: v4l2-test-subdevs.cpp(348): checkMBusFrameFmt(node, fmt.format)
>     ...
> ...
> As reported by Dafna Hirschfeld from v2 the errors on pad 1 & 3 are caused by a
> problem within v4l2-utils.
> 
> ---
>  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 889982d8ca41..2e5b57e3aedc 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -600,6 +600,39 @@ static int rkisp1_isp_enum_mbus_code(struct v4l2_subdev *sd,
>  	return -EINVAL;
>  }
>  
> +static int rkisp1_isp_enum_frame_size(struct v4l2_subdev *sd,
> +				      struct v4l2_subdev_pad_config *cfg,
> +				      struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	const struct rkisp1_isp_mbus_info *mbus_info;
> +
> +	if (fse->pad == RKISP1_ISP_PAD_SINK_PARAMS ||
> +	    fse->pad == RKISP1_ISP_PAD_SOURCE_STATS)
> +		return -ENOTTY;
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
>  static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
>  				  struct v4l2_subdev_pad_config *cfg)
>  {
> @@ -880,6 +913,7 @@ static int rkisp1_subdev_link_validate(struct media_link *link)
>  
>  static const struct v4l2_subdev_pad_ops rkisp1_isp_pad_ops = {
>  	.enum_mbus_code = rkisp1_isp_enum_mbus_code,
> +	.enum_frame_size = rkisp1_isp_enum_frame_size,
>  	.get_selection = rkisp1_isp_get_selection,
>  	.set_selection = rkisp1_isp_set_selection,
>  	.init_cfg = rkisp1_isp_init_config,
> 
