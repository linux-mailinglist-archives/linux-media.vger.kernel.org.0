Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89B753A26E8
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 10:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbhFJI0n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 04:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230304AbhFJI0m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 04:26:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1399C061574
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 01:24:46 -0700 (PDT)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A717C436;
        Thu, 10 Jun 2021 10:24:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623313484;
        bh=u1bGzioFeJCgwQ1gdqQU7DFwPPY3hAtcZ8wO6LfR0vA=;
        h=To:References:From:Subject:Date:In-Reply-To:From;
        b=BUeEKbUBN71HvpWaMcXyaJloFOeElPXksz8eq8s6rqxfF1GceS0gYKTzjIptO8QTV
         SXDJa/K8WGVSSHGkRSpdb1G2XMhkNpEuHEe6YW/dp4w/TZoPKVcrqCG//gKOVew+V4
         J/Cdl1FIs8zNeko042pJ8kmklhReeeTRt825VwEE=
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20210609100228.278798-1-tomi.valkeinen@ideasonboard.com>
 <20210609100228.278798-2-tomi.valkeinen@ideasonboard.com>
 <7f49880d-6ffc-5e2b-e3f2-adbd695364f3@xs4all.nl>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3 1/1] media: v4l2-subdev: add subdev-wide state struct
Message-ID: <c20eb633-3898-d0fb-c37f-b77c6fe14caa@ideasonboard.com>
Date:   Thu, 10 Jun 2021 11:24:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7f49880d-6ffc-5e2b-e3f2-adbd695364f3@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/06/2021 11:00, Hans Verkuil wrote:
> Hi Tomi,
> 
> A few small comments:
> 
> On 09/06/2021 12:02, Tomi Valkeinen wrote:
>> We have 'struct v4l2_subdev_pad_config' which contains configuration for
>> a single pad used for the TRY functionality, and an array of those
>> structs is passed to various v4l2_subdev_pad_ops.
>>
>> I was working on subdev internal routing between pads, and realized that
>> there's no way to add TRY functionality for routes, which is not pad
>> specific configuration. Adding a separate struct for try-route config
>> wouldn't work either, as e.g. set-fmt needs to know the try-route
>> configuration to propagate the settings.
>>
>> This patch adds a new struct, 'struct v4l2_subdev_state' (which at the
>> moment only contains the v4l2_subdev_pad_config array) and the new
>> struct is used in most of the places where v4l2_subdev_pad_config was
>> used. All v4l2_subdev_pad_ops functions taking v4l2_subdev_pad_config
>> are changed to instead take v4l2_subdev_state.
>>
>> The changes to drivers/media/v4l2-core/v4l2-subdev.c and
>> include/media/v4l2-subdev.h were written by hand, and all the driver
>> changes were done with the semantic patch below. The spatch needs to be
>> applied to a select list of directories. I used the following shell
>> commands to apply the spatch:
> 
> <snip>
> 
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index 956dafab43d4..dacae53b68d5 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -26,19 +26,21 @@
>>   #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>>   static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
>>   {
>> -	if (sd->entity.num_pads) {
>> -		fh->pad = v4l2_subdev_alloc_pad_config(sd);
>> -		if (fh->pad == NULL)
>> -			return -ENOMEM;
>> -	}
>> +	struct v4l2_subdev_state *state;
>> +
>> +	state = v4l2_subdev_alloc_state(sd);
>> +	if (IS_ERR(state))
>> +		return PTR_ERR(state);
>> +
>> +	fh->state = state;
>>   
>>   	return 0;
>>   }
>>   
>>   static void subdev_fh_free(struct v4l2_subdev_fh *fh)
>>   {
>> -	v4l2_subdev_free_pad_config(fh->pad);
>> -	fh->pad = NULL;
>> +	v4l2_subdev_free_state(fh->state);
>> +	fh->state = NULL;
>>   }
>>   
>>   static int subdev_open(struct file *file)
>> @@ -146,63 +148,63 @@ static inline int check_pad(struct v4l2_subdev *sd, u32 pad)
>>   	return 0;
>>   }
>>   
>> -static int check_cfg(u32 which, struct v4l2_subdev_pad_config *cfg)
>> +static int check_cfg(u32 which, struct v4l2_subdev_state *state)
> 
> This should be renamed to check_state or check_state_pads (see next comment).

Ok.

>>   {
>> -	if (which == V4L2_SUBDEV_FORMAT_TRY && !cfg)
>> +	if (which == V4L2_SUBDEV_FORMAT_TRY && !state)
> 
> Should this also check for !state->pads? At least in the current code
> it really checks for the pad configuration, so I think it should.
> 
> If so, then this function should probably be renamed to check_state_pads.

Hmm, yes, I think you're right. We can have a case where we have state, 
but state->pads is NULL.

>>   		return -EINVAL;
>>   
>>   	return 0;
>>   }
>>   
>>   static inline int check_format(struct v4l2_subdev *sd,
>> -			       struct v4l2_subdev_pad_config *cfg,
>> +			       struct v4l2_subdev_state *state,
>>   			       struct v4l2_subdev_format *format)
>>   {
>>   	if (!format)
>>   		return -EINVAL;
>>   
>>   	return check_which(format->which) ? : check_pad(sd, format->pad) ? :
>> -	       check_cfg(format->which, cfg);
>> +	       check_cfg(format->which, state);
>>   }
>>   
>>   static int call_get_fmt(struct v4l2_subdev *sd,
>> -			struct v4l2_subdev_pad_config *cfg,
>> +			struct v4l2_subdev_state *state,
>>   			struct v4l2_subdev_format *format)
>>   {
>> -	return check_format(sd, cfg, format) ? :
>> -	       sd->ops->pad->get_fmt(sd, cfg, format);
>> +	return check_format(sd, state, format) ? :
>> +	       sd->ops->pad->get_fmt(sd, state, format);
>>   }
>>   
>>   static int call_set_fmt(struct v4l2_subdev *sd,
>> -			struct v4l2_subdev_pad_config *cfg,
>> +			struct v4l2_subdev_state *state,
>>   			struct v4l2_subdev_format *format)
>>   {
>> -	return check_format(sd, cfg, format) ? :
>> -	       sd->ops->pad->set_fmt(sd, cfg, format);
>> +	return check_format(sd, state, format) ? :
>> +	       sd->ops->pad->set_fmt(sd, state, format);
>>   }
>>   
>>   static int call_enum_mbus_code(struct v4l2_subdev *sd,
>> -			       struct v4l2_subdev_pad_config *cfg,
>> +			       struct v4l2_subdev_state *state,
>>   			       struct v4l2_subdev_mbus_code_enum *code)
>>   {
>>   	if (!code)
>>   		return -EINVAL;
>>   
>>   	return check_which(code->which) ? : check_pad(sd, code->pad) ? :
>> -	       check_cfg(code->which, cfg) ? :
>> -	       sd->ops->pad->enum_mbus_code(sd, cfg, code);
>> +	       check_cfg(code->which, state) ? :
>> +	       sd->ops->pad->enum_mbus_code(sd, state, code);
>>   }
>>   
>>   static int call_enum_frame_size(struct v4l2_subdev *sd,
>> -				struct v4l2_subdev_pad_config *cfg,
>> +				struct v4l2_subdev_state *state,
>>   				struct v4l2_subdev_frame_size_enum *fse)
>>   {
>>   	if (!fse)
>>   		return -EINVAL;
>>   
>>   	return check_which(fse->which) ? : check_pad(sd, fse->pad) ? :
>> -	       check_cfg(fse->which, cfg) ? :
>> -	       sd->ops->pad->enum_frame_size(sd, cfg, fse);
>> +	       check_cfg(fse->which, state) ? :
>> +	       sd->ops->pad->enum_frame_size(sd, state, fse);
>>   }
>>   
>>   static inline int check_frame_interval(struct v4l2_subdev *sd,
>> @@ -229,42 +231,42 @@ static int call_s_frame_interval(struct v4l2_subdev *sd,
>>   }
>>   
>>   static int call_enum_frame_interval(struct v4l2_subdev *sd,
>> -				    struct v4l2_subdev_pad_config *cfg,
>> +				    struct v4l2_subdev_state *state,
>>   				    struct v4l2_subdev_frame_interval_enum *fie)
>>   {
>>   	if (!fie)
>>   		return -EINVAL;
>>   
>>   	return check_which(fie->which) ? : check_pad(sd, fie->pad) ? :
>> -	       check_cfg(fie->which, cfg) ? :
>> -	       sd->ops->pad->enum_frame_interval(sd, cfg, fie);
>> +	       check_cfg(fie->which, state) ? :
>> +	       sd->ops->pad->enum_frame_interval(sd, state, fie);
>>   }
>>   
>>   static inline int check_selection(struct v4l2_subdev *sd,
>> -				  struct v4l2_subdev_pad_config *cfg,
>> +				  struct v4l2_subdev_state *state,
>>   				  struct v4l2_subdev_selection *sel)
>>   {
>>   	if (!sel)
>>   		return -EINVAL;
>>   
>>   	return check_which(sel->which) ? : check_pad(sd, sel->pad) ? :
>> -	       check_cfg(sel->which, cfg);
>> +	       check_cfg(sel->which, state);
>>   }
>>   
>>   static int call_get_selection(struct v4l2_subdev *sd,
>> -			      struct v4l2_subdev_pad_config *cfg,
>> +			      struct v4l2_subdev_state *state,
>>   			      struct v4l2_subdev_selection *sel)
>>   {
>> -	return check_selection(sd, cfg, sel) ? :
>> -	       sd->ops->pad->get_selection(sd, cfg, sel);
>> +	return check_selection(sd, state, sel) ? :
>> +	       sd->ops->pad->get_selection(sd, state, sel);
>>   }
>>   
>>   static int call_set_selection(struct v4l2_subdev *sd,
>> -			      struct v4l2_subdev_pad_config *cfg,
>> +			      struct v4l2_subdev_state *state,
>>   			      struct v4l2_subdev_selection *sel)
>>   {
>> -	return check_selection(sd, cfg, sel) ? :
>> -	       sd->ops->pad->set_selection(sd, cfg, sel);
>> +	return check_selection(sd, state, sel) ? :
>> +	       sd->ops->pad->set_selection(sd, state, sel);
>>   }
>>   
>>   static inline int check_edid(struct v4l2_subdev *sd,
>> @@ -506,7 +508,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>>   
>>   		memset(format->reserved, 0, sizeof(format->reserved));
>>   		memset(format->format.reserved, 0, sizeof(format->format.reserved));
>> -		return v4l2_subdev_call(sd, pad, get_fmt, subdev_fh->pad, format);
>> +		return v4l2_subdev_call(sd, pad, get_fmt, subdev_fh->state, format);
>>   	}
>>   
>>   	case VIDIOC_SUBDEV_S_FMT: {
>> @@ -517,7 +519,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>>   
>>   		memset(format->reserved, 0, sizeof(format->reserved));
>>   		memset(format->format.reserved, 0, sizeof(format->format.reserved));
>> -		return v4l2_subdev_call(sd, pad, set_fmt, subdev_fh->pad, format);
>> +		return v4l2_subdev_call(sd, pad, set_fmt, subdev_fh->state, format);
>>   	}
>>   
>>   	case VIDIOC_SUBDEV_G_CROP: {
>> @@ -531,7 +533,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>>   		sel.target = V4L2_SEL_TGT_CROP;
>>   
>>   		rval = v4l2_subdev_call(
>> -			sd, pad, get_selection, subdev_fh->pad, &sel);
>> +			sd, pad, get_selection, subdev_fh->state, &sel);
>>   
>>   		crop->rect = sel.r;
>>   
>> @@ -553,7 +555,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>>   		sel.r = crop->rect;
>>   
>>   		rval = v4l2_subdev_call(
>> -			sd, pad, set_selection, subdev_fh->pad, &sel);
>> +			sd, pad, set_selection, subdev_fh->state, &sel);
>>   
>>   		crop->rect = sel.r;
>>   
>> @@ -564,7 +566,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>>   		struct v4l2_subdev_mbus_code_enum *code = arg;
>>   
>>   		memset(code->reserved, 0, sizeof(code->reserved));
>> -		return v4l2_subdev_call(sd, pad, enum_mbus_code, subdev_fh->pad,
>> +		return v4l2_subdev_call(sd, pad, enum_mbus_code, subdev_fh->state,
>>   					code);
>>   	}
>>   
>> @@ -572,7 +574,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>>   		struct v4l2_subdev_frame_size_enum *fse = arg;
>>   
>>   		memset(fse->reserved, 0, sizeof(fse->reserved));
>> -		return v4l2_subdev_call(sd, pad, enum_frame_size, subdev_fh->pad,
>> +		return v4l2_subdev_call(sd, pad, enum_frame_size, subdev_fh->state,
>>   					fse);
>>   	}
>>   
>> @@ -597,7 +599,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>>   		struct v4l2_subdev_frame_interval_enum *fie = arg;
>>   
>>   		memset(fie->reserved, 0, sizeof(fie->reserved));
>> -		return v4l2_subdev_call(sd, pad, enum_frame_interval, subdev_fh->pad,
>> +		return v4l2_subdev_call(sd, pad, enum_frame_interval, subdev_fh->state,
>>   					fie);
>>   	}
>>   
>> @@ -606,7 +608,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>>   
>>   		memset(sel->reserved, 0, sizeof(sel->reserved));
>>   		return v4l2_subdev_call(
>> -			sd, pad, get_selection, subdev_fh->pad, sel);
>> +			sd, pad, get_selection, subdev_fh->state, sel);
>>   	}
>>   
>>   	case VIDIOC_SUBDEV_S_SELECTION: {
>> @@ -617,7 +619,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>>   
>>   		memset(sel->reserved, 0, sizeof(sel->reserved));
>>   		return v4l2_subdev_call(
>> -			sd, pad, set_selection, subdev_fh->pad, sel);
>> +			sd, pad, set_selection, subdev_fh->state, sel);
>>   	}
>>   
>>   	case VIDIOC_G_EDID: {
>> @@ -892,35 +894,48 @@ int v4l2_subdev_link_validate(struct media_link *link)
>>   }
>>   EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate);
>>   
>> -struct v4l2_subdev_pad_config *
>> -v4l2_subdev_alloc_pad_config(struct v4l2_subdev *sd)
>> +struct v4l2_subdev_state *v4l2_subdev_alloc_state(struct v4l2_subdev *sd)
>>   {
>> -	struct v4l2_subdev_pad_config *cfg;
>> +	struct v4l2_subdev_state *state;
>>   	int ret;
>>   
>> -	if (!sd->entity.num_pads)
>> -		return NULL;
>> +	state = kzalloc(sizeof(*state), GFP_KERNEL);
>> +	if (!state)
>> +		return ERR_PTR(-ENOMEM);
>>   
>> -	cfg = kvmalloc_array(sd->entity.num_pads, sizeof(*cfg),
>> -			     GFP_KERNEL | __GFP_ZERO);
>> -	if (!cfg)
>> -		return NULL;
>> -
>> -	ret = v4l2_subdev_call(sd, pad, init_cfg, cfg);
>> -	if (ret < 0 && ret != -ENOIOCTLCMD) {
>> -		kvfree(cfg);
>> -		return NULL;
>> +	if (sd->entity.num_pads) {
>> +		state->pads = kvmalloc_array(sd->entity.num_pads,
>> +					     sizeof(*state->pads),
>> +					     GFP_KERNEL | __GFP_ZERO);
>> +		if (!state->pads) {
>> +			ret = -ENOMEM;
>> +			goto err;
>> +		}
>>   	}
>>   
>> -	return cfg;
>> +	ret = v4l2_subdev_call(sd, pad, init_cfg, state);
> 
> The init_cfg callback should also be renamed to init_state, but this can
> be done in a second patch.

Yes, there are more renames that can be done, but I didn't want to 
explode the patch to even bigger size =).

>> +	if (ret < 0 && ret != -ENOIOCTLCMD)
>> +		goto err;
>> +
>> +	return state;
>> +
>> +err:
>> +	if (state && state->pads)
>> +		kvfree(state->pads);
>> +
>> +	kfree(state);
>> +
>> +	return ERR_PTR(ret);
>>   }
>> -EXPORT_SYMBOL_GPL(v4l2_subdev_alloc_pad_config);
>> +EXPORT_SYMBOL_GPL(v4l2_subdev_alloc_state);
>>   
>> -void v4l2_subdev_free_pad_config(struct v4l2_subdev_pad_config *cfg)
>> +void v4l2_subdev_free_state(struct v4l2_subdev_state *state)
>>   {
>> -	kvfree(cfg);
>> +	kvfree(state->pads);
> 
> I'd change this to:
> 
> 	if (state)
> 		kvfree(state->pads);
> 
> That way you can call v4l2_subdev_free_state() with a NULL pointer. It's more robust.

Yes, good point.

>> +	kfree(state);
>>   }
>> -EXPORT_SYMBOL_GPL(v4l2_subdev_free_pad_config);
>> +EXPORT_SYMBOL_GPL(v4l2_subdev_free_state);
>> +
>>   #endif /* CONFIG_MEDIA_CONTROLLER */
>>   
>>   void v4l2_subdev_init(struct v4l2_subdev *sd, const struct v4l2_subdev_ops *ops)
> 
> <snip>
> 
>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>> index d0e9a5bdb08b..89115ba4c0f2 100644
>> --- a/include/media/v4l2-subdev.h
>> +++ b/include/media/v4l2-subdev.h
>> @@ -623,6 +623,19 @@ struct v4l2_subdev_pad_config {
> 
> I wonder if v4l2_subdev_pad_config shouldn't be renamed to v4l2_subdev_pad_state
> or would v4l2_subdev_state_pad. It's more consistent with the 'state' terminology.
> 
> This too can be done in a separate patch.
> 
> I like the 'state' term much better than 'config'.

Yes, I agree here too, and was in my list of "later".

Thanks!

  Tomi

