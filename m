Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81DC66A69DB
	for <lists+linux-media@lfdr.de>; Wed,  1 Mar 2023 10:35:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbjCAJfB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Mar 2023 04:35:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjCAJfB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Mar 2023 04:35:01 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C219036FD6
        for <linux-media@vger.kernel.org>; Wed,  1 Mar 2023 01:34:59 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB61C890;
        Wed,  1 Mar 2023 10:34:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677663298;
        bh=TgeMJMb7lPXdGNm7eLyvg2sKaCzy3kcPuWS+NoiYf4s=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=vlkHCGXt3Dg0cz0PJwXx+tpLDFEaEoityUmhj3j0sRXZoFWS1Qxuk9L+PdN+2bM5k
         sthElMmT9XVmtxDmO0C3oITsxrS6eqjAfBnvxKXUuI54wK6UBHFrEEk+swpzBTASw7
         hAZdMHZEjDwdzpOwC3OKfdU06dNcZKQTZqGdQnBk=
Message-ID: <3d901645-355a-d137-c5bb-82751ce36876@ideasonboard.com>
Date:   Wed, 1 Mar 2023 11:34:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/4] media: ti: cal: Use subdev state
Content-Language: en-US
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>,
        Vaishnav Achath <vaishnav.a@ti.com>
References: <20230228171620.330978-1-tomi.valkeinen@ideasonboard.com>
 <20230228171620.330978-3-tomi.valkeinen@ideasonboard.com>
 <20230301093104.s3xqw2t7x26dzydr@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230301093104.s3xqw2t7x26dzydr@uno.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/03/2023 11:31, Jacopo Mondi wrote:
> Hi Tomi
> 
> On Tue, Feb 28, 2023 at 07:16:18PM +0200, Tomi Valkeinen wrote:
>> Change TI CAL driver to use subdev state. No functional changes
>> (intended).
>>
>> This allows us to get rid of the 'formats' field, as the formats are
>> kept in the state, and also the 'mutex' as we already have state locking.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/platform/ti/cal/cal-camerarx.c | 134 ++++++-------------
>>   drivers/media/platform/ti/cal/cal-video.c    |  21 ++-
>>   drivers/media/platform/ti/cal/cal.h          |   8 --
>>   3 files changed, 56 insertions(+), 107 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
>> index 267089b0fea0..3dfcb276d367 100644
>> --- a/drivers/media/platform/ti/cal/cal-camerarx.c
>> +++ b/drivers/media/platform/ti/cal/cal-camerarx.c
>> @@ -50,10 +50,16 @@ static s64 cal_camerarx_get_ext_link_freq(struct cal_camerarx *phy)
>>   	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2 = &phy->endpoint.bus.mipi_csi2;
>>   	u32 num_lanes = mipi_csi2->num_data_lanes;
>>   	const struct cal_format_info *fmtinfo;
>> +	struct v4l2_subdev_state *state;
>> +	struct v4l2_mbus_framefmt *fmt;
>>   	u32 bpp;
>>   	s64 freq;
>>
>> -	fmtinfo = cal_format_by_code(phy->formats[CAL_CAMERARX_PAD_SINK].code);
>> +	state = v4l2_subdev_get_locked_active_state(&phy->subdev);
>> +
>> +	fmt = v4l2_subdev_get_pad_format(&phy->subdev, state, CAL_CAMERARX_PAD_SINK);
>> +
>> +	fmtinfo = cal_format_by_code(fmt->code);
>>   	if (!fmtinfo)
>>   		return -EINVAL;
>>
>> @@ -620,34 +626,20 @@ static inline struct cal_camerarx *to_cal_camerarx(struct v4l2_subdev *sd)
>>   	return container_of(sd, struct cal_camerarx, subdev);
>>   }
>>
>> -static struct v4l2_mbus_framefmt *
>> -cal_camerarx_get_pad_format(struct cal_camerarx *phy,
>> -			    struct v4l2_subdev_state *state,
>> -			    unsigned int pad, u32 which)
>> -{
>> -	switch (which) {
>> -	case V4L2_SUBDEV_FORMAT_TRY:
>> -		return v4l2_subdev_get_try_format(&phy->subdev, state, pad);
>> -	case V4L2_SUBDEV_FORMAT_ACTIVE:
>> -		return &phy->formats[pad];
>> -	default:
>> -		return NULL;
>> -	}
>> -}
>> -
>>   static int cal_camerarx_sd_s_stream(struct v4l2_subdev *sd, int enable)
>>   {
>>   	struct cal_camerarx *phy = to_cal_camerarx(sd);
>> +	struct v4l2_subdev_state *state;
>>   	int ret = 0;
>>
>> -	mutex_lock(&phy->mutex);
>> +	state = v4l2_subdev_lock_and_get_active_state(sd);
>>
>>   	if (enable)
>>   		ret = cal_camerarx_start(phy);
>>   	else
>>   		cal_camerarx_stop(phy);
>>
>> -	mutex_unlock(&phy->mutex);
>> +	v4l2_subdev_unlock_state(state);
>>
>>   	return ret;
>>   }
>> @@ -657,62 +649,44 @@ static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
>>   					  struct v4l2_subdev_mbus_code_enum *code)
>>   {
>>   	struct cal_camerarx *phy = to_cal_camerarx(sd);
>> -	int ret = 0;
>> -
>> -	mutex_lock(&phy->mutex);
>>
>>   	/* No transcoding, source and sink codes must match. */
>>   	if (cal_rx_pad_is_source(code->pad)) {
>>   		struct v4l2_mbus_framefmt *fmt;
>>
>> -		if (code->index > 0) {
>> -			ret = -EINVAL;
>> -			goto out;
>> -		}
>> +		if (code->index > 0)
>> +			return -EINVAL;
>>
>> -		fmt = cal_camerarx_get_pad_format(phy, state,
>> -						  CAL_CAMERARX_PAD_SINK,
>> -						  code->which);
>> +		fmt = v4l2_subdev_get_pad_format(&phy->subdev, state,
>> +						 CAL_CAMERARX_PAD_SINK);
>>   		code->code = fmt->code;
>>   	} else {
>> -		if (code->index >= cal_num_formats) {
>> -			ret = -EINVAL;
>> -			goto out;
>> -		}
>> +		if (code->index >= cal_num_formats)
>> +			return -EINVAL;
>>
>>   		code->code = cal_formats[code->index].code;
>>   	}
>>
>> -out:
>> -	mutex_unlock(&phy->mutex);
>> -
>> -	return ret;
>> +	return 0;
>>   }
>>
>>   static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
>>   					   struct v4l2_subdev_state *state,
>>   					   struct v4l2_subdev_frame_size_enum *fse)
>>   {
>> -	struct cal_camerarx *phy = to_cal_camerarx(sd);
>>   	const struct cal_format_info *fmtinfo;
>> -	int ret = 0;
>>
>>   	if (fse->index > 0)
>>   		return -EINVAL;
>>
>> -	mutex_lock(&phy->mutex);
>> -
>>   	/* No transcoding, source and sink formats must match. */
>>   	if (cal_rx_pad_is_source(fse->pad)) {
>>   		struct v4l2_mbus_framefmt *fmt;
>>
>> -		fmt = cal_camerarx_get_pad_format(phy, state,
>> -						  CAL_CAMERARX_PAD_SINK,
>> -						  fse->which);
>> -		if (fse->code != fmt->code) {
>> -			ret = -EINVAL;
>> -			goto out;
>> -		}
>> +		fmt = v4l2_subdev_get_pad_format(sd, state,
>> +						 CAL_CAMERARX_PAD_SINK);
>> +		if (fse->code != fmt->code)
>> +			return -EINVAL;
>>
>>   		fse->min_width = fmt->width;
>>   		fse->max_width = fmt->width;
>> @@ -720,10 +694,8 @@ static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
>>   		fse->max_height = fmt->height;
>>   	} else {
>>   		fmtinfo = cal_format_by_code(fse->code);
>> -		if (!fmtinfo) {
>> -			ret = -EINVAL;
>> -			goto out;
>> -		}
>> +		if (!fmtinfo)
>> +			return -EINVAL;
>>
>>   		fse->min_width = CAL_MIN_WIDTH_BYTES * 8 / ALIGN(fmtinfo->bpp, 8);
>>   		fse->max_width = CAL_MAX_WIDTH_BYTES * 8 / ALIGN(fmtinfo->bpp, 8);
>> @@ -731,27 +703,6 @@ static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
>>   		fse->max_height = CAL_MAX_HEIGHT_LINES;
>>   	}
>>
>> -out:
>> -	mutex_unlock(&phy->mutex);
>> -
>> -	return ret;
>> -}
>> -
>> -static int cal_camerarx_sd_get_fmt(struct v4l2_subdev *sd,
>> -				   struct v4l2_subdev_state *state,
>> -				   struct v4l2_subdev_format *format)
>> -{
>> -	struct cal_camerarx *phy = to_cal_camerarx(sd);
>> -	struct v4l2_mbus_framefmt *fmt;
>> -
>> -	mutex_lock(&phy->mutex);
>> -
>> -	fmt = cal_camerarx_get_pad_format(phy, state, format->pad,
>> -					  format->which);
>> -	format->format = *fmt;
>> -
>> -	mutex_unlock(&phy->mutex);
>> -
>>   	return 0;
>>   }
>>
>> @@ -759,14 +710,13 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
>>   				   struct v4l2_subdev_state *state,
>>   				   struct v4l2_subdev_format *format)
>>   {
>> -	struct cal_camerarx *phy = to_cal_camerarx(sd);
>>   	const struct cal_format_info *fmtinfo;
>>   	struct v4l2_mbus_framefmt *fmt;
>>   	unsigned int bpp;
>>
>>   	/* No transcoding, source and sink formats must match. */
>>   	if (cal_rx_pad_is_source(format->pad))
>> -		return cal_camerarx_sd_get_fmt(sd, state, format);
>> +		return v4l2_subdev_get_fmt(sd, state, format);
>>
>>   	/*
>>   	 * Default to the first format if the requested media bus code isn't
>> @@ -790,20 +740,13 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
>>
>>   	/* Store the format and propagate it to the source pad. */
>>
>> -	mutex_lock(&phy->mutex);
>> -
>> -	fmt = cal_camerarx_get_pad_format(phy, state,
>> -					  CAL_CAMERARX_PAD_SINK,
>> -					  format->which);
>> +	fmt = v4l2_subdev_get_pad_format(sd, state, CAL_CAMERARX_PAD_SINK);
>>   	*fmt = format->format;
>>
>> -	fmt = cal_camerarx_get_pad_format(phy, state,
>> -					  CAL_CAMERARX_PAD_FIRST_SOURCE,
>> -					  format->which);
>> +	fmt = v4l2_subdev_get_pad_format(sd, state,
>> +					 CAL_CAMERARX_PAD_FIRST_SOURCE);
>>   	*fmt = format->format;
>>
>> -	mutex_unlock(&phy->mutex);
>> -
>>   	return 0;
>>   }
>>
>> @@ -837,7 +780,7 @@ static const struct v4l2_subdev_pad_ops cal_camerarx_pad_ops = {
>>   	.init_cfg = cal_camerarx_sd_init_cfg,
>>   	.enum_mbus_code = cal_camerarx_sd_enum_mbus_code,
>>   	.enum_frame_size = cal_camerarx_sd_enum_frame_size,
>> -	.get_fmt = cal_camerarx_sd_get_fmt,
>> +	.get_fmt = v4l2_subdev_get_fmt,
>>   	.set_fmt = cal_camerarx_sd_set_fmt,
>>   };
>>
>> @@ -872,7 +815,6 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>>   	phy->instance = instance;
>>
>>   	spin_lock_init(&phy->vc_lock);
>> -	mutex_init(&phy->mutex);
>>
>>   	phy->res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>>   						(instance == 0) ?
>> @@ -882,7 +824,7 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>>   	if (IS_ERR(phy->base)) {
>>   		cal_err(cal, "failed to ioremap\n");
>>   		ret = PTR_ERR(phy->base);
>> -		goto error;
>> +		goto err_entity_cleanup;
> 
> Am I mistaken or media entities are initialized later and you should
> here jump to "kfree(phy)" ?

The media_entity_cleanup doc says:

Calling media_entity_cleanup() on a media_entity whose memory has been
zeroed but that has not been initialized with media_entity_pad_init() is
valid and is a no-op

But probably it looks a bit nicer if we jump to the kfree, as there's 
not much downside to that.

  Tomi

