Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 698136DF3F1
	for <lists+linux-media@lfdr.de>; Wed, 12 Apr 2023 13:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbjDLLm1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Apr 2023 07:42:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbjDLLm0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Apr 2023 07:42:26 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E5CA7EDD
        for <linux-media@vger.kernel.org>; Wed, 12 Apr 2023 04:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681299730; x=1712835730;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=lzMpvjupdiZ3WvA2OVygxZnrYD5jjqCi4KpgQk+7KyU=;
  b=CEyNO9iKtNu/ssUxiznn/nSMU3zp+9cHuDn8i8cpU9gIFZtEsgi0XNnO
   P9rgEgzScLnO1p8zf7MO4nNPrYlt7Wegt/DB8PKMpl92IB7ol11l5D+oZ
   7hdvRQfqhV1GX1HPP5D9DJI1BPsOtLzbB/oMfO5xZSTQWDFQDBFuG0ivv
   871IfpbaDjSD3KeUTeJ2WbOkJOQam7CXx7oeDOjTZlFdUDa9qtCCQwNiC
   pMRfnV7BSsGb9bTFZshuuwP9rhyWxIkIu+uL3sPRvFueHMyRLHLgaOGO9
   FMusBJ5dwF+l7k3+g4ClyOH+qll7OF4+5vSJba7EVsPinIQq8w2maQ9/W
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="430153008"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="430153008"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 04:40:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="832679069"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="832679069"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.139]) ([10.238.232.139])
  by fmsmga001.fm.intel.com with ESMTP; 12 Apr 2023 04:40:54 -0700
Subject: Re: [PATCH] media: i2c: add ov01a10 image sensor driver
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>
Cc:     linux-media@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <1675941758-21433-1-git-send-email-bingbu.cao@intel.com>
 <Y+TvvbfRSGUNKBCf@kekkonen.localdomain>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <793aa7a4-0b8b-dc55-2d91-9aa58e6735fd@linux.intel.com>
Date:   Wed, 12 Apr 2023 19:40:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <Y+TvvbfRSGUNKBCf@kekkonen.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Sakari,

Thanks for your review.

On 2/9/23 9:06 PM, Sakari Ailus wrote:
> Hi Bingbu,
> 
> Thanks for the patch.
> 
> On Thu, Feb 09, 2023 at 07:22:38PM +0800, Bingbu Cao wrote:
>> Add v4l2 device driver for OmniVision ov01a10 image sensor, ov01a10
>> image sensor can deliver 1280x800 resolution BGGR10 images at 60 fps.
>>
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>> Signed-off-by: Yating Wang <yating.wang@intel.com>
>> ---
>>  drivers/media/i2c/Kconfig   |  13 +
>>  drivers/media/i2c/Makefile  |   1 +
>>  drivers/media/i2c/ov01a10.c | 906 ++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 920 insertions(+)
>>  create mode 100644 drivers/media/i2c/ov01a10.c
>>
>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>> index 833241897d63..8e5d1ef0616f 100644
>> --- a/drivers/media/i2c/Kconfig
>> +++ b/drivers/media/i2c/Kconfig
>> @@ -338,6 +338,19 @@ config VIDEO_OG01A1B
>>  	  To compile this driver as a module, choose M here: the
>>  	  module will be called og01a1b.
>>  
>> +config VIDEO_OV01A10
>> +	tristate "OmniVision OV01A10 sensor support"
>> +	depends on VIDEO_DEV && I2C
>> +	select MEDIA_CONTROLLER
>> +	select VIDEO_V4L2_SUBDEV_API
>> +	select V4L2_FWNODE
>> +	help
>> +	  This is a Video4Linux2 sensor driver for the OmniVision
>> +	  OV01A10 camera.
>> +
>> +	  To compile this driver as a module, choose M here: the
>> +	  module will be called ov01a10.
>> +
>>  config VIDEO_OV02A10
>>  	tristate "OmniVision OV02A10 sensor support"
>>  	depends on VIDEO_DEV && I2C
>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
>> index 4d6c052bb5a7..ce214503b526 100644
>> --- a/drivers/media/i2c/Makefile
>> +++ b/drivers/media/i2c/Makefile
>> @@ -70,6 +70,7 @@ obj-$(CONFIG_VIDEO_MT9V032) += mt9v032.o
>>  obj-$(CONFIG_VIDEO_MT9V111) += mt9v111.o
>>  obj-$(CONFIG_VIDEO_NOON010PC30) += noon010pc30.o
>>  obj-$(CONFIG_VIDEO_OG01A1B) += og01a1b.o
>> +obj-$(CONFIG_VIDEO_OV01A10) += ov01a10.o
>>  obj-$(CONFIG_VIDEO_OV02A10) += ov02a10.o
>>  obj-$(CONFIG_VIDEO_OV08D10) += ov08d10.o
>>  obj-$(CONFIG_VIDEO_OV08X40) += ov08x40.o
>> diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
>> new file mode 100644
>> index 000000000000..13de9f9ccdc8
>> --- /dev/null
>> +++ b/drivers/media/i2c/ov01a10.c
>> @@ -0,0 +1,906 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// Copyright (c) 2020-2021 Intel Corporation.

..snip..

>> +static void ov01a10_update_pad_format(const struct ov01a10_mode *mode,
>> +				      struct v4l2_mbus_framefmt *fmt)
>> +{
>> +	fmt->width = mode->width;
>> +	fmt->height = mode->height;
>> +	fmt->code = MEDIA_BUS_FMT_SBGGR10_1X10;
>> +	fmt->field = V4L2_FIELD_NONE;
>> +}
>> +
..snip..

>> +static int ov01a10_set_format(struct v4l2_subdev *sd,
>> +			      struct v4l2_subdev_state *sd_state,
>> +			      struct v4l2_subdev_format *fmt)
>> +{
>> +	struct ov01a10 *ov01a10 = to_ov01a10(sd);
>> +	const struct ov01a10_mode *mode;
>> +	s32 vblank_def, h_blank;
>> +
>> +	mode = v4l2_find_nearest_size(supported_modes,
>> +				      ARRAY_SIZE(supported_modes), width,
>> +				      height, fmt->format.width,
>> +				      fmt->format.height);
>> +
>> +	mutex_lock(&ov01a10->mutex);
>> +	ov01a10_update_pad_format(mode, &fmt->format);
> 
> Could you switch to the sub-device state? That is now the preferred way to
> serialise access to e.g. the format.
> 
> See e.g.
> <URL:https://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git/tree/drivers/media/i2c/ov1063x.c?h=streams/work-v16>.
> 
> The control handler's mutex doubles as a sub-device state mutex.

Is it fine to use v4l2_subdev_get_fmt()? Or will it be deprecated soon?

> 
>> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
>> +		*v4l2_subdev_get_try_format(sd, sd_state, fmt->pad) = fmt->format;
>> +	} else {
>> +		ov01a10->cur_mode = mode;
>> +		__v4l2_ctrl_s_ctrl(ov01a10->link_freq, mode->link_freq_index);
>> +		__v4l2_ctrl_s_ctrl_int64(ov01a10->pixel_rate, OV01A10_SCLK);
>> +
>> +		vblank_def = mode->vts_def - mode->height;
>> +		__v4l2_ctrl_modify_range(ov01a10->vblank,
>> +					 mode->vts_min - mode->height,
>> +					 OV01A10_VTS_MAX - mode->height, 1,
>> +					 vblank_def);
>> +		__v4l2_ctrl_s_ctrl(ov01a10->vblank, vblank_def);
>> +		h_blank = mode->hts - mode->width;
>> +		__v4l2_ctrl_modify_range(ov01a10->hblank, h_blank, h_blank, 1,
>> +					 h_blank);
>> +	}
>> +	mutex_unlock(&ov01a10->mutex);
>> +
>> +	return 0;
>> +}
>> +
>> +static int ov01a10_get_format(struct v4l2_subdev *sd,
>> +			      struct v4l2_subdev_state *sd_state,
>> +			      struct v4l2_subdev_format *fmt)
>> +{
>> +	struct ov01a10 *ov01a10 = to_ov01a10(sd);
>> +
>> +	mutex_lock(&ov01a10->mutex);
>> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
>> +		fmt->format = *v4l2_subdev_get_try_format(&ov01a10->sd,
>> +							  sd_state, fmt->pad);
>> +	else
>> +		ov01a10_update_pad_format(ov01a10->cur_mode, &fmt->format);
>> +
>> +	mutex_unlock(&ov01a10->mutex);
>> +
>> +	return 0;
>> +}
>> +
>> +static int ov01a10_enum_mbus_code(struct v4l2_subdev *sd,
>> +				  struct v4l2_subdev_state *sd_state,
>> +				  struct v4l2_subdev_mbus_code_enum *code)
>> +{
>> +	if (code->index > 0)
>> +		return -EINVAL;
>> +
>> +	code->code = MEDIA_BUS_FMT_SBGGR10_1X10;
>> +
>> +	return 0;
>> +}
>> +
>> +static int ov01a10_enum_frame_size(struct v4l2_subdev *sd,
>> +				   struct v4l2_subdev_state *sd_state,
>> +				   struct v4l2_subdev_frame_size_enum *fse)
>> +{
>> +	if (fse->index >= ARRAY_SIZE(supported_modes))
>> +		return -EINVAL;
>> +
>> +	if (fse->code != MEDIA_BUS_FMT_SBGGR10_1X10)
>> +		return -EINVAL;
>> +
>> +	fse->min_width = supported_modes[fse->index].width;
>> +	fse->max_width = fse->min_width;
>> +	fse->min_height = supported_modes[fse->index].height;
>> +	fse->max_height = fse->min_height;
>> +
>> +	return 0;
>> +}
>> +
>> +static int ov01a10_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>> +{
>> +	struct ov01a10 *ov01a10 = to_ov01a10(sd);
>> +
>> +	mutex_lock(&ov01a10->mutex);
>> +	ov01a10_update_pad_format(&supported_modes[0],
>> +				  v4l2_subdev_get_try_format(sd, fh->state, 0));
>> +	mutex_unlock(&ov01a10->mutex);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct v4l2_subdev_core_ops ov01a10_core_ops = {
>> +	.log_status = v4l2_ctrl_subdev_log_status,
>> +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
>> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
>> +};
>> +
>> +static const struct v4l2_subdev_video_ops ov01a10_video_ops = {
>> +	.s_stream = ov01a10_set_stream,
>> +};
>> +
>> +static const struct v4l2_subdev_pad_ops ov01a10_pad_ops = {
>> +	.set_fmt = ov01a10_set_format,
>> +	.get_fmt = ov01a10_get_format,
>> +	.enum_mbus_code = ov01a10_enum_mbus_code,
>> +	.enum_frame_size = ov01a10_enum_frame_size,
>> +};
>> +

...

> 

-- 
Best regards,
Bingbu Cao
