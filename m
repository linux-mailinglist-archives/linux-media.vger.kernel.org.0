Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 881F61F5183
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 11:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727952AbgFJJuW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 05:50:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727892AbgFJJuU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 05:50:20 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 140E6C03E96B;
        Wed, 10 Jun 2020 02:50:20 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E4B4229E;
        Wed, 10 Jun 2020 11:50:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591782618;
        bh=vM1Ww7BwHjo1qcsMi6A7j4oJwN232NHykLZLp2qhAAY=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=dM5TNb63KjS3oFX8N0auti1uJEEZVNB11OUAd1lcwAhHIjHIcOT0yM6WIBh0Z71Cm
         oNkR729WrllzY5DgWUzgKDz8BTDatM5q3R1iD29BD/sQTtQGqP/OtIMnsjHf+xI6VD
         tDEKUY0ucST8HTePREddp7lKXx5SADTgRl7Kcgx4=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [RFC 2/5] media: adv748x: Post-pone IO10 write to power up
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, dave.stevenson@raspberrypi.org
References: <20190316154801.20460-1-jacopo+renesas@jmondi.org>
 <20190316154801.20460-3-jacopo+renesas@jmondi.org>
 <e72d1698-baed-6d80-3453-51d77cbf9d07@ideasonboard.com>
 <20190412144551.wivieg3ue2inj5j3@uno.localdomain>
 <5c53a56c-ea52-001b-0ea3-ce2f20483702@ideasonboard.com>
 <20190415070026.3yq5tbufajptkijf@uno.localdomain>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <0d37be83-eda5-8946-6dd0-c48e731245e1@ideasonboard.com>
Date:   Wed, 10 Jun 2020 10:50:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20190415070026.3yq5tbufajptkijf@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Sorry for dragging up an old thread...

On 15/04/2019 08:00, Jacopo Mondi wrote:
> Hi Kieran,
> 
> On Fri, Apr 12, 2019 at 04:57:45PM +0100, Kieran Bingham wrote:
>> Hi Jacopo,
>>
>> On 12/04/2019 15:45, Jacopo Mondi wrote:
>>> Hi Kieran,
>>>
>>> On Fri, Apr 12, 2019 at 03:15:46PM +0100, Kieran Bingham wrote:
>>>> Hi Jacopo,
>>>>
>>>> On 16/03/2019 15:47, Jacopo Mondi wrote:
>>>>> Post-pone the write of the ADV748X_IO_10 register that controls the active
>>>>> routing between the CP and AFE cores to the 4-lanes CSI-2 TXA at TX
>>>>> power-up time.
>>>>
>>>> "by caching its configuration in the driver state."
>>>>
>>>>>
>>>>> While at there, use the 'csi4_in_sel' name, which matches the register
>>>>
>>>> 'While at it, use the...'
>>>>
>>>> Except I'm not sure csi4_in_sel is the right name for the cached values
>>>> as below...
>>>>
>>>>
>>>>> field description in the manual, in place of 'io_10' which is the full
>>>>> register name.
>>>>>
>>>>
>>>> This has a fixes tag, but doesn't state what the actual problem is?
>>>>
>>>
>>> As reported in the cover letter, please see:
>>> "[PATCH] media: adv748x: Don't disable CSI-2 on link_setup"
>>
>> Ah I see, I had missed that.
>>
>> The patch itself should still describe the problem if it's fixing
>> something. The cover letter will not be available in the git-log.
>>
> 
> You're right, I'll expand the commit message.
> 
>> Ok, so this patch supersedes "[PATCH] media: adv748x: Don't disable
>> CSI-2 on link_setup" ?
>>
> 
> Yes
> 
>>>> Can I assume that the problem is that the configuration here is being
>>>> written to the hardware before it is powered up or such?
>>>>
>>>> Or perhaps reading through the patch again, is it that the call to
>>>> link_setup can affect running streams?
>>>
>>> The issue I was trying to solve, even with the first patch is that
>>> going through a link disable (eg. at media graph reset time) wrote to
>>> the csi4_in_sel register a 0 value, when both TXA and TXB routing
>>> where disabled and this causes issues on some HDMI transmiters, for
>>> reason Ian and Hans tried to expand but about which I'm not yet sure
>>> about.
>>
>> Ok, I found that patch and read their comments. So disabling the CSI2
>> might trigger a hot-plug event to the transmitter which makes them think
>> they have been (physically) disconnected in some way, or triggers them
>> to re-read the EDID which will fail. But we don't really know what the
>> fault is yet.
>>
> 
> Correct. Please note that I've seen this happening with one HDMI
> transmitter (a chromecast device), while if HDMI source is a laptop
> everything's fine...
> 
>>
>>> The idea here is to cache the routing settings at link_setup time
>>> (upon activation or deactivation of a link) and apply them to hardware
>>> at tx power up time, which happens at s_stream(1).
>>>
>>> In this way, if streaming is started, we know at least one link is
>>> enabled and we can write to csi4_in_sel.
>>
>> Overall this seems reasonable, only making a change to io10 when either
>> of the stream states are changed.
>>
> 
> Thanks, I'll re-send (maybe even out of this series if it gets stale).
> Could I have your tag on the next iteration?

I found this patch on a branch while rebasing old patches to latest.

It still applies, and seems to make sense - and it looks like I agreed
with you back when you posted it.

It seems it only needed me to say:

"Yes,

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
"

To unblock this particular patch (separate from the rest of the series
it currently resides in.

So there you have it ;-)

With the only action remaining being to try to briefly describe the
problem it fixes in the commit message.


Thanks,
--
Kieran



> 
> Thanks
>   j
> 
>>
>>>>> Fixes: 9423ca350df7 ("media: adv748x: Implement TX link_setup callback")
>>>>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>>>>> ---
>>>>>  drivers/media/i2c/adv748x/adv748x-core.c | 53 ++++++++++++++----------
>>>>>  drivers/media/i2c/adv748x/adv748x.h      |  2 +
>>>>>  2 files changed, 33 insertions(+), 22 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
>>>>> index 0e5a75eb6d75..02135741b1a6 100644
>>>>> --- a/drivers/media/i2c/adv748x/adv748x-core.c
>>>>> +++ b/drivers/media/i2c/adv748x/adv748x-core.c
>>>>> @@ -305,23 +305,35 @@ static int adv748x_power_down_tx(struct adv748x_csi2 *tx)
>>>>>
>>>>>  int adv748x_tx_power(struct adv748x_csi2 *tx, bool on)
>>>>>  {
>>>>> -	int val;
>>>>> +	u8 io10_mask = ADV748X_IO_10_CSI1_EN | ADV748X_IO_10_CSI4_EN |
>>>>> +		       ADV748X_IO_10_CSI4_IN_SEL_AFE;
>>>>> +	struct adv748x_state *state = tx->state;
>>>>> +	int ret;
>>>>>
>>>>>  	if (!is_tx_enabled(tx))
>>>>>  		return 0;
>>>>>
>>>>> -	val = tx_read(tx, ADV748X_CSI_FS_AS_LS);
>>>>> -	if (val < 0)
>>>>> -		return val;
>>>>> +	ret = tx_read(tx, ADV748X_CSI_FS_AS_LS);
>>>>> +	if (ret < 0)
>>>>> +		return ret;
>>>>>
>>>>>  	/*
>>>>>  	 * This test against BIT(6) is not documented by the datasheet, but was
>>>>>  	 * specified in the downstream driver.
>>>>>  	 * Track with a WARN_ONCE to determine if it is ever set by HW.
>>>>>  	 */
>>>>> -	WARN_ONCE((on && val & ADV748X_CSI_FS_AS_LS_UNKNOWN),
>>>>> +	WARN_ONCE((on && ret & ADV748X_CSI_FS_AS_LS_UNKNOWN),
>>>>>  			"Enabling with unknown bit set");
>>>>>
>>>>> +	/* Configure TXA routing. */
>>>>
>>>> Should TXA routing be configured even on TXB power up? This function
>>>> handles both TX code paths. (Edit: possibly yes)
>>>>
>>>
>>> The comment is wrong, thanks for noticing.
>>>
>>>> Can the logic that determines state->csi4_in_sel value simply be moved
>>>> here (or to an independent adv748x_configure_routing() function)?
>>>>
>>>
>>> It has to be changed at link_setup time in rensponse to a media link
>>> activation or deactivation.
>>>
>>>> I think this patch means that changes to routing will now only take
>>>> effect when starting or stopping a stream, is that right? (If so - could
>>>> that go into the commit message please?)
>>>>
>>>
>>> Well...
>>>
>>>  Post-pone the write of the ADV748X_IO_10 register that controls the active
>>>  routing between the CP and AFE cores to the 4-lanes CSI-2 TXA at TX
>>>  power-up time.
>>>
>>> Doesn't it say that? Or what confused you is that s_stream->s_power(1)
>>> and I should mention streaming instead of power up?
>>
>> I think of "Power up" meaning at device probe time (or possibly some
>> runtime-pm event time). But yes, I think the distinction that it now
>> happens at stream_on/stream_off is important.
>>
>>
>>
>>>
>>>>
>>>>
>>>>
>>>>> +	if (on) {
>>>>> +		ret = io_clrset(state, ADV748X_IO_10, io10_mask,
>>>>> +				state->csi4_in_sel);
>>>>> +		if (ret)
>>>>> +			return ret;
>>>>> +	}
>>>>> +
>>>>> +
>>>>>  	return on ? adv748x_power_up_tx(tx) : adv748x_power_down_tx(tx);
>>>>>  }
>>>>>
>>>>> @@ -337,10 +349,7 @@ static int adv748x_link_setup(struct media_entity *entity,
>>>>>  	struct adv748x_state *state = v4l2_get_subdevdata(sd);
>>>>>  	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
>>>>>  	bool enable = flags & MEDIA_LNK_FL_ENABLED;
>>>>> -	u8 io10_mask = ADV748X_IO_10_CSI1_EN |
>>>>> -		       ADV748X_IO_10_CSI4_EN |
>>>>> -		       ADV748X_IO_10_CSI4_IN_SEL_AFE;
>>>>> -	u8 io10 = 0;
>>>>> +	u8 csi4_in_sel = 0;
>>>>>
>>>>>  	/* Refuse to enable multiple links to the same TX at the same time. */
>>>>>  	if (enable && tx->src)
>>>>> @@ -359,17 +368,19 @@ static int adv748x_link_setup(struct media_entity *entity,
>>>>>
>>>>>  	if (state->afe.tx) {
>>>>>  		/* AFE Requires TXA enabled, even when output to TXB */
>>>>> -		io10 |= ADV748X_IO_10_CSI4_EN;
>>>>> +		csi4_in_sel |= ADV748X_IO_10_CSI4_EN;
>>>>>  		if (is_txa(tx))
>>>>> -			io10 |= ADV748X_IO_10_CSI4_IN_SEL_AFE;
>>>>> +			csi4_in_sel |= ADV748X_IO_10_CSI4_IN_SEL_AFE;
>>>>
>>>> Hrm ... this is the one part that I think can't be determined without
>>>> caching some sort of value to state the routing.
>>>>
>>>
>>> Yes
>>
>> But the actual hardware shouldn't be updated if the stream is running
>> right? (I wonder if the media-controller would prevent that anyway).
>>
>>
>>
>>>
>>>>>  		else
>>>>> -			io10 |= ADV748X_IO_10_CSI1_EN;
>>>>> +			csi4_in_sel |= ADV748X_IO_10_CSI1_EN;
>>>>>  	}
>>>>>
>>>>>  	if (state->hdmi.tx)
>>>>> -		io10 |= ADV748X_IO_10_CSI4_EN;
>>>>> +		csi4_in_sel |= ADV748X_IO_10_CSI4_EN;
>>>>>
>>>>> -	return io_clrset(state, ADV748X_IO_10, io10_mask, io10);
>>>>> +	state->csi4_in_sel = csi4_in_sel;
>>>>> +
>>>>> +	return 0;
>>>>>  }
>>>>>
>>>>>  static const struct media_entity_operations adv748x_tx_media_ops = {
>>>>> @@ -485,7 +496,6 @@ static int adv748x_sw_reset(struct adv748x_state *state)
>>>>>  static int adv748x_reset(struct adv748x_state *state)
>>>>>  {
>>>>>  	int ret;
>>>>> -	u8 regval = 0;
>>>>>
>>>>>  	ret = adv748x_sw_reset(state);
>>>>>  	if (ret < 0)
>>>>> @@ -504,6 +514,12 @@ static int adv748x_reset(struct adv748x_state *state)
>>>>>  	if (ret)
>>>>>  		return ret;
>>>>>
>>>>
>>>> Should adv748x_reset() reset the state->csi4_in_sel cached value to 0
>>>> before setting it?
>>>
>>> I should better check when reset happens, and if it happens only when
>>> links have been disabled or not.
>>> If links are disabled, the variable gets zeroed by the link_setup
>>> callback. If reset happens with links active, we should not zero it
>>> otherwise we lose the configuration
>>
>>
>> Ah yes, I missed that the local variable is initialised to zero, and
>> this state variable is set to the result at the end of the call...
>>
>> It does mean that the function ordering will be important here.
>>
>> It becomes irrelevant if these conditionals move to the same point
>> anyway though.
>>
>>
>>
>>>
>>>>
>>>>
>>>>> +	/* Conditionally enable TXa and TXb. */
>>>>> +	if (is_tx_enabled(&state->txa))
>>>>> +		state->csi4_in_sel |= ADV748X_IO_10_CSI4_EN;
>>>>> +	if (is_tx_enabled(&state->txb))
>>>>> +		state->csi4_in_sel |= ADV748X_IO_10_CSI1_EN;
>>>>
>>>> This makes it looks like the naming "csi4_in_sel" is less appropriate,
>>>> as it covers both CSI4 and CSI1...
>>>>
>>>
>>> Blame the hw designers :)
>>
>> Always. ... of course they keep blaming us back :D
>>
>>>
>>>> Also, this is confusing two terms, between the 'enable' and the 'select'
>>>>
>>>> The _EN bits looks like they control the activation of the CSI
>>>> transmitter, where as the 'select' bits control the routing.
>>>>
>>>
>>> You are righ. csi4_in_sel should only control the 3 bits used for
>>> routing, while enabling and disabling of the TXes is controlled by
>>> other bits of the io_10 register.
>>> I'll look into changing the name back
>>>
>>>> As the is_tx_enabled($TX) state is constant, perhaps that bit could be
>>>> inferred later when the register is written, and doesn't need to be
>>>> cached here?
>>>
>>> I'll consider that, thanks
>>
>> I think it's only the routing choice that needs to be stored in the
>> state. That would minimise being stored 'globally', and the values could
>> be determined at the time of programming the register.
>>
>>>
>>> Thanks
>>>   j
>>>
>>>>
>>>>
>>>>> +
>>>>>  	/* Reset TXA and TXB */
>>>>>  	adv748x_tx_power(&state->txa, 1);
>>>>>  	adv748x_tx_power(&state->txa, 0);
>>>>> @@ -513,13 +529,6 @@ static int adv748x_reset(struct adv748x_state *state)
>>>>>  	/* Disable chip powerdown & Enable HDMI Rx block */
>>>>>  	io_write(state, ADV748X_IO_PD, ADV748X_IO_PD_RX_EN);
>>>>>
>>>>> -	/* Conditionally enable TXa and TXb. */
>>>>> -	if (is_tx_enabled(&state->txa))
>>>>> -		regval |= ADV748X_IO_10_CSI4_EN;
>>>>> -	if (is_tx_enabled(&state->txb))
>>>>> -		regval |= ADV748X_IO_10_CSI1_EN;
>>>>> -	io_write(state, ADV748X_IO_10, regval);
>>>>> -
>>>>>  	/* Use vid_std and v_freq as freerun resolution for CP */
>>>>>  	cp_clrset(state, ADV748X_CP_CLMP_POS, ADV748X_CP_CLMP_POS_DIS_AUTO,
>>>>>  					      ADV748X_CP_CLMP_POS_DIS_AUTO);
>>>>> diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
>>>>> index 4a5a6445604f..27c116d09284 100644
>>>>> --- a/drivers/media/i2c/adv748x/adv748x.h
>>>>> +++ b/drivers/media/i2c/adv748x/adv748x.h
>>>>> @@ -196,6 +196,8 @@ struct adv748x_state {
>>>>>  	struct adv748x_afe afe;
>>>>>  	struct adv748x_csi2 txa;
>>>>>  	struct adv748x_csi2 txb;
>>>>> +
>>>>> +	unsigned int csi4_in_sel;
>>>>>  };
>>>>>
>>>>>  #define adv748x_hdmi_to_state(h) container_of(h, struct adv748x_state, hdmi)
>>>>> --
>>>>> 2.21.0
>>>>>
>>
>> --
>> Regards
>> --
>> Kieran

-- 
Regards
--
Kieran
