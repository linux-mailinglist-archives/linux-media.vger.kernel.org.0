Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B48C97D48C6
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 09:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232706AbjJXHki (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 03:40:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232818AbjJXHkh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 03:40:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFA8FEE
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 00:40:33 -0700 (PDT)
Received: from [192.168.88.20] (91-158-149-209.elisa-laajakaista.fi [91.158.149.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 523F1B53;
        Tue, 24 Oct 2023 09:40:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698133221;
        bh=PyyhodwSwR/k+zlm8+DORg0Pz7zbGBd1Kh85QQMu9y0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=lOsGqRNaZYS4bXotgOPhpGdshAjsPEjTXgXh1Sx4dRz5YmFn1gafwt8+7M+PZNR19
         BYS+kcuQHVf7IgJIKDgNP2ymrRz/vzL9BCgJVWuxAjyLiH5WTXVXxzAcnMU+bVtB0c
         aqtzMDK5BWuuiOYG58lFopkt3PnPJY9q7Vb8PfFY=
Message-ID: <34f89236-4be5-4228-9a2f-3a6a2ef36b59@ideasonboard.com>
Date:   Tue, 24 Oct 2023 10:40:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 3/4] media: v4l2-subdev: Store frame interval in
 subdev state
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Hans de Goede <hansg@kernel.org>
References: <20231024005130.28026-1-laurent.pinchart@ideasonboard.com>
 <20231024005130.28026-4-laurent.pinchart@ideasonboard.com>
 <ae1af16e-eb25-4c37-8d6e-16a910a4fa9a@ideasonboard.com>
 <20231024073808.GA5121@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20231024073808.GA5121@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/10/2023 10:38, Laurent Pinchart wrote:
> Hi Tomi,
> 
> On Tue, Oct 24, 2023 at 10:21:18AM +0300, Tomi Valkeinen wrote:
>> On 24/10/2023 03:51, Laurent Pinchart wrote:
>>> Subdev states store all standard pad configuration data, except for
>>> frame intervals. Fix it by adding interval fields in the
>>> v4l2_subdev_pad_config and v4l2_subdev_stream_config structures, with
>>> corresponding accessor functions and a helper function to implement the
>>> .get_frame_interval() operation.
>>>
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> ---
>>>    drivers/media/v4l2-core/v4l2-subdev.c | 44 +++++++++++++++++++++
>>>    include/media/v4l2-subdev.h           | 57 +++++++++++++++++++++++++++
>>>    2 files changed, 101 insertions(+)
>>>
>>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>>> index c45d60a87701..518f2f35c68d 100644
>>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>>> @@ -1618,6 +1618,29 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>>>    }
>>>    EXPORT_SYMBOL_GPL(v4l2_subdev_get_fmt);
>>>    
>>> +int v4l2_subdev_get_frame_interval(struct v4l2_subdev *sd,
>>> +				   struct v4l2_subdev_state *state,
>>> +				   struct v4l2_subdev_frame_interval *fi)
>>> +{
>>> +	struct v4l2_fract *interval;
>>> +
>>> +	if (sd->flags & V4L2_SUBDEV_FL_STREAMS)
>>> +		interval = v4l2_subdev_state_get_stream_interval(state, fi->pad,
>>> +								 fi->stream);
>>> +	else if (fi->pad < sd->entity.num_pads && fi->stream == 0)
>>> +		interval = v4l2_subdev_get_pad_interval(sd, state, fi->pad);
>>> +	else
>>> +		interval = NULL;
>>> +
>>> +	if (!interval)
>>> +		return -EINVAL;
>>> +
>>> +	fi->interval = *interval;
>>> +
>>> +	return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_interval);
>>> +
>>>    int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
>>>    			    struct v4l2_subdev_state *state,
>>>    			    const struct v4l2_subdev_krouting *routing)
>>> @@ -1761,6 +1784,27 @@ v4l2_subdev_state_get_stream_compose(struct v4l2_subdev_state *state,
>>>    }
>>>    EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_stream_compose);
>>>    
>>> +struct v4l2_fract *
>>> +v4l2_subdev_state_get_stream_interval(struct v4l2_subdev_state *state,
>>> +				      unsigned int pad, u32 stream)
>>> +{
>>> +	struct v4l2_subdev_stream_configs *stream_configs;
>>> +	unsigned int i;
>>> +
>>> +	lockdep_assert_held(state->lock);
>>> +
>>> +	stream_configs = &state->stream_configs;
>>> +
>>> +	for (i = 0; i < stream_configs->num_configs; ++i) {
>>> +		if (stream_configs->configs[i].pad == pad &&
>>> +		    stream_configs->configs[i].stream == stream)
>>> +			return &stream_configs->configs[i].interval;
>>> +	}
>>> +
>>> +	return NULL;
>>> +}
>>> +EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_stream_interval);
>>> +
>>>    int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
>>>    					  u32 pad, u32 stream, u32 *other_pad,
>>>    					  u32 *other_stream)
>>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>>> index 962b546d0e3b..363f9a8a084c 100644
>>> --- a/include/media/v4l2-subdev.h
>>> +++ b/include/media/v4l2-subdev.h
>>> @@ -681,11 +681,13 @@ struct v4l2_subdev_ir_ops {
>>>     * @format: &struct v4l2_mbus_framefmt
>>>     * @crop: &struct v4l2_rect to be used for crop
>>>     * @compose: &struct v4l2_rect to be used for compose
>>> + * @interval: frame interval
>>>     */
>>>    struct v4l2_subdev_pad_config {
>>>    	struct v4l2_mbus_framefmt format;
>>>    	struct v4l2_rect crop;
>>>    	struct v4l2_rect compose;
>>> +	struct v4l2_fract interval;
>>>    };
>>>    
>>>    /**
>>> @@ -697,6 +699,7 @@ struct v4l2_subdev_pad_config {
>>>     * @fmt: &struct v4l2_mbus_framefmt
>>>     * @crop: &struct v4l2_rect to be used for crop
>>>     * @compose: &struct v4l2_rect to be used for compose
>>> + * @interval: frame interval
>>>     *
>>>     * This structure stores configuration for a stream.
>>>     */
>>> @@ -708,6 +711,7 @@ struct v4l2_subdev_stream_config {
>>>    	struct v4l2_mbus_framefmt fmt;
>>>    	struct v4l2_rect crop;
>>>    	struct v4l2_rect compose;
>>> +	struct v4l2_fract interval;
>>>    };
>>>    
>>>    /**
>>> @@ -1199,6 +1203,26 @@ v4l2_subdev_get_pad_compose(struct v4l2_subdev *sd,
>>>    	return &state->pads[pad].compose;
>>>    }
>>>    
>>> +/**
>>> + * v4l2_subdev_get_pad_interval - ancillary routine to get
>>> + *	&struct v4l2_subdev_pad_config->interval
>>> + *
>>> + * @sd: pointer to &struct v4l2_subdev
>>> + * @state: pointer to &struct v4l2_subdev_state.
>>> + * @pad: index of the pad in the &struct v4l2_subdev_state->pads array.
>>> + */
>>> +static inline struct v4l2_fract *
>>> +v4l2_subdev_get_pad_interval(struct v4l2_subdev *sd,
>>> +			     struct v4l2_subdev_state *state,
>>> +			     unsigned int pad)
>>> +{
>>> +	if (WARN_ON(!state))
>>> +		return NULL;
>>> +	if (WARN_ON(pad >= sd->entity.num_pads))
>>> +		pad = 0;
>>> +	return &state->pads[pad].interval;
>>> +}
>>> +
>>>    /*
>>>     * Temprary helpers until uses of v4l2_subdev_get_try_* functions have been
>>>     * renamed
>>> @@ -1489,6 +1513,24 @@ v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
>>>    int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>>>    			struct v4l2_subdev_format *format);
>>>    
>>> +/**
>>> + * v4l2_subdev_get_frame_interval() - Fill frame interval based on state
>>> + * @sd: subdevice
>>> + * @state: subdevice state
>>> + * @fi: pointer to &struct v4l2_subdev_frame_interval
>>> + *
>>> + * Fill @fi->interval field based on the information in the @fi struct.
>>> + *
>>> + * This function can be used by the subdev drivers which support active state to
>>> + * implement v4l2_subdev_pad_ops.get_frame_interval if the subdev driver does
>>> + * not need to do anything special in their get_frame_interval op.
>>
>> What would the "something special" be? Can we instead just say that the
>> framework will return the frame interval from the state for drivers that
>> support active state (similar to get-routing)? Or perhaps that's not a
>> wise thing to do for old operations...
> 
> I've copied that text from v4l2_subdev_get_fmt(). I'm fine changing it,
> if both say the same. If you send a patch to improve the documentation
> of v4l2_subdev_get_fmt(), I'll update this patch :-)

My point wasn't the docs, but changing the framework to return the frame 
interval directly from the state.

Anyway, I was mostly just thinking out loud. Not part of this series anyway.

  Tomi

