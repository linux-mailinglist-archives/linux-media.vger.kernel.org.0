Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7782141A6E0
	for <lists+linux-media@lfdr.de>; Tue, 28 Sep 2021 07:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233972AbhI1FEF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Sep 2021 01:04:05 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56936 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233365AbhI1FEC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Sep 2021 01:04:02 -0400
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C9F93F1;
        Tue, 28 Sep 2021 07:02:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632805341;
        bh=HHi+Yt0uLGRlI96kYvIh6IZPgUwTMRdZZrKvQlYjOmM=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=NkJENOo2Aw7nporDMFrRzw1KCghN/WsPRxSKldDtoNeLFay0weSY5FeaND6z5sHin
         ljUroBvyPw1Ff+SFsiIaVgZy/JR4xDvhG4jOO4ipvhgKnSp1YKQxifzwbRVB57ohla
         d/GRPp/hMdOdL3TwK8sTijnkQ4CC24ErgjRAV/MM=
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
 <20210830110116.488338-7-tomi.valkeinen@ideasonboard.com>
 <YVEiM5MHXvWK9dr/@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v8 06/36] media: subdev: Add
 v4l2_subdev_validate(_and_lock)_state()
Message-ID: <fdb7faf3-337c-28aa-081d-75d317c418d5@ideasonboard.com>
Date:   Tue, 28 Sep 2021 08:02:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YVEiM5MHXvWK9dr/@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/09/2021 04:45, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Mon, Aug 30, 2021 at 02:00:46PM +0300, Tomi Valkeinen wrote:
>> All suitable subdev ops are now passed either the TRY or the ACTIVE
>> state by the v4l2 core. However, other subdrivers can still call the ops
>> passing NULL as the state, implying the active case.
>>
>> Thus all subdev drivers supporting active state need to handle the NULL
>> state case.
> 
> Do they ? Can't we mandate that the callers pass the correct state ? Do
> you think that would make the transition too difficult ?

That would limit the use of the new drivers. E.g. the sensor driver I'm 
using works fine with CAL & co. without handling the NULL, but then the 
sensor driver couldn't be used with "old" drivers.

> The way I understand the issue, this would only be needed to facilitate
> the transition. Is there a reason why the drivers you've ported (CAL &
> co.) use v4l2_subdev_validate_and_lock_state() after completing the
> transition, or is the correct state always passed by the caller ?

The drivers I'm using only call non-state-aware ops in the other 
subdevs, so they should work fine without validate.

I think it's safer to just use the validate versions for now. They're 
trivial to convert to non-validate versions later.

We could just do the validate implicitly while locking the state, but it 
would make the code a bit odd:

state = v4l2_subdev_lock_state(state);

After the transition we want to do just:

v4l2_subdev_lock_state(state);

Or we could do v4l2_subdev_lock_state() with a macro, which changes the 
state variable, but... I think I'd rather have it clear and obvious with 
v4l2_subdev_validate_and_lock_state().

>> Additionally, the subdev drivers usually need to lock the
>> state.
>>
>> Add two helper functions to easen the transition to centrally managed
>> ACTIVE state. v4l2_subdev_validate_state() ensures that the state is not
>> NULL, and v4l2_subdev_validate_and_lock_state() does the same and
>> additionally locks the state.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   include/media/v4l2-subdev.h | 41 +++++++++++++++++++++++++++++++++++++
>>   1 file changed, 41 insertions(+)
>>
>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>> index 52a725281b23..2290b5025fc0 100644
>> --- a/include/media/v4l2-subdev.h
>> +++ b/include/media/v4l2-subdev.h
>> @@ -1307,4 +1307,45 @@ void v4l2_subdev_lock_state(struct v4l2_subdev_state *state);
>>    */
>>   void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state);
>>   
>> +/**
>> + * v4l2_subdev_validate_state() - Gets the TRY or ACTIVE subdev state
>> + * @sd: subdevice
>> + * @state: subdevice state as passed to the subdev op
>> + *
>> + * Subdev ops used to be sometimes called with NULL as the state for ACTIVE
>> + * case. Even if the v4l2 core now passes proper state for both TRY and
>> + * ACTIVE cases, a subdev driver may call an op in another subdev driver,
>> + * passing NULL.
>> + *
>> + * This function can be used as a helper to get the state also for the ACTIVE
>> + * case. The subdev driver that supports ACTIVE state can use this function
>> + * as the first thing in its ops, ensuring that the state variable contains
>> + * either the TRY or ACTIVE state.
>> + */
>> +static inline struct v4l2_subdev_state *
>> +v4l2_subdev_validate_state(struct v4l2_subdev *sd,
>> +			   struct v4l2_subdev_state *state)
>> +{
>> +	return state ? state : sd->state;
>> +}
> 
> This doesn't seem to be used by the drivers you've ported, or by the
> R-Car and GMSL patches from Jacopo. Do we need this function ?

Probably not. If you need to validate, you most likely will lock the 
state right afterwards, so v4l2_subdev_validate_and_lock_state should be 
enough.

  Tomi
