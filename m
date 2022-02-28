Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB5C34C6573
	for <lists+linux-media@lfdr.de>; Mon, 28 Feb 2022 10:10:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234219AbiB1JKo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Feb 2022 04:10:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234088AbiB1JKn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Feb 2022 04:10:43 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E0585373A
        for <linux-media@vger.kernel.org>; Mon, 28 Feb 2022 01:10:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DDCEA611DB
        for <linux-media@vger.kernel.org>; Mon, 28 Feb 2022 09:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE640C340E7;
        Mon, 28 Feb 2022 09:10:01 +0000 (UTC)
Message-ID: <fb84036b-fa25-48b8-e0f5-2d1296fbdb59@xs4all.nl>
Date:   Mon, 28 Feb 2022 10:10:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v4 6/7] media: subdev: add v4l2_subdev_call_state_active()
Content-Language: en-US
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20220216130049.508664-1-tomi.valkeinen@ideasonboard.com>
 <20220216130049.508664-7-tomi.valkeinen@ideasonboard.com>
 <71751dde-a0f6-898e-a7d3-e509afb67fed@xs4all.nl>
In-Reply-To: <71751dde-a0f6-898e-a7d3-e509afb67fed@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2/28/22 09:59, Hans Verkuil wrote:
> 
> 
> On 2/16/22 14:00, Tomi Valkeinen wrote:
>> Add v4l2_subdev_call_state_active() macro to help calling subdev ops
>> that take a subdev state as a parameter.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Hmm, after reading Laurent's comments I also think I was a bit too hasty.
It should either be moved to a v4l2-subdev-legacy.h header (are there other
legacy functions that could be moved there as well?) or it should have 'legacy'
or something like that in the name.

Regards,

	Hans

> 
> Regards,
> 
> 	Hans
> 
>> ---
>>  include/media/v4l2-subdev.h | 31 +++++++++++++++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>>
>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>> index 84c02488d53f..0db61203c8d9 100644
>> --- a/include/media/v4l2-subdev.h
>> +++ b/include/media/v4l2-subdev.h
>> @@ -1359,6 +1359,37 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
>>  		__result;						\
>>  	})
>>  
>> +/**
>> + * v4l2_subdev_call_state_active - call an operation of a v4l2_subdev which
>> + *				   takes state as a parameter, passing the
>> + *				   subdev its active state.
>> + *
>> + * @sd: pointer to the &struct v4l2_subdev
>> + * @o: name of the element at &struct v4l2_subdev_ops that contains @f.
>> + *     Each element there groups a set of callbacks functions.
>> + * @f: callback function to be called.
>> + *     The callback functions are defined in groups, according to
>> + *     each element at &struct v4l2_subdev_ops.
>> + * @args: arguments for @f.
>> + *
>> + * This is similar to v4l2_subdev_call(), except that this version can only be
>> + * used for ops that take a subdev state as a parameter. The macro will get the
>> + * active state and lock it before calling the op, and unlock it after the
>> + * call.
>> + */
>> +#define v4l2_subdev_call_state_active(sd, o, f, args...)		\
>> +	({								\
>> +		int __result;						\
>> +		struct v4l2_subdev_state *state;			\
>> +		state = v4l2_subdev_get_active_state(sd);		\
>> +		if (state)						\
>> +			v4l2_subdev_lock_state(state);			\
>> +		__result = v4l2_subdev_call(sd, o, f, state, ##args);	\
>> +		if (state)						\
>> +			v4l2_subdev_unlock_state(state);		\
>> +		__result;						\
>> +	})
>> +
>>  /**
>>   * v4l2_subdev_has_op - Checks if a subdev defines a certain operation.
>>   *
