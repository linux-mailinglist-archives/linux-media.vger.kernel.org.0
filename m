Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16F9C3726D4
	for <lists+linux-media@lfdr.de>; Tue,  4 May 2021 09:57:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbhEDH55 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 May 2021 03:57:57 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45634 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbhEDH54 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 May 2021 03:57:56 -0400
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1DACF580;
        Tue,  4 May 2021 09:57:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1620115020;
        bh=OmpxqGhxRge89hghuuhW9cj6FCDfmZEhlFR+KI22uV4=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=fxmkcJWh0EFJ6aO3mtTbAS1Olvdv96EZuAM9zdvWmMFUcVXLr7jUNfJ7+Rv6L1m8F
         c2WJgwaACRe9d/4p+BfQE/9IKbLSP1Dj8hR8XG0EIaDh25Oy56LZ+/0Ijk9kdFKmCx
         I04j41SrHk0/z0PasNJiv5E9lF1ovlE2/Wczmvf8=
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-16-tomi.valkeinen@ideasonboard.com>
 <YHwqLSgwYmt9ZAOU@pendragon.ideasonboard.com>
 <9d6b96f4-cdb0-5820-965d-7135a926829f@ideasonboard.com>
 <YIn2Y/HpOPBKUzh/@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 15/28] media: ti-vpe: cal: remove wait when stopping
 camerarx
Message-ID: <28d4fab7-44c5-70d3-1dd7-d8814a39fef0@ideasonboard.com>
Date:   Tue, 4 May 2021 10:56:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YIn2Y/HpOPBKUzh/@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/04/2021 02:57, Laurent Pinchart wrote:
> Hi Tomi,
> 
> On Mon, Apr 19, 2021 at 02:29:20PM +0300, Tomi Valkeinen wrote:
>> On 18/04/2021 15:46, Laurent Pinchart wrote:
>>> On Mon, Apr 12, 2021 at 02:34:44PM +0300, Tomi Valkeinen wrote:
>>>> Asserting ComplexIO reset seems to affect the HW (ie. asserting reset
>>>> will break an active capture), but the RESET_DONE bit never changes to
>>>> "reset is ongoing" state. Thus we always get a timeout.
>>>>
>>>> Drop the wait, as it seems to achieve nothing.
>>>>
>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>> ---
>>>>    drivers/media/platform/ti-vpe/cal-camerarx.c | 15 ++-------------
>>>>    1 file changed, 2 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
>>>> index 0354f311c5d2..245c601b992c 100644
>>>> --- a/drivers/media/platform/ti-vpe/cal-camerarx.c
>>>> +++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
>>>> @@ -405,7 +405,6 @@ static int cal_camerarx_start(struct cal_camerarx *phy)
>>>>    
>>>>    static void cal_camerarx_stop(struct cal_camerarx *phy)
>>>>    {
>>>> -	unsigned int i;
>>>>    	int ret;
>>>>    
>>>>    	cal_camerarx_ppi_disable(phy);
>>>> @@ -419,19 +418,9 @@ static void cal_camerarx_stop(struct cal_camerarx *phy)
>>>>    			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL,
>>>>    			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_MASK);
>>>>    
>>>> -	/* Wait for power down completion */
>>>> -	for (i = 0; i < 10; i++) {
>>>> -		if (cal_read_field(phy->cal,
>>>> -				   CAL_CSI2_COMPLEXIO_CFG(phy->instance),
>>>> -				   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) ==
>>>> -		    CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETONGOING)
>>>
>>> Isn't this the wrong condition ? I would have expected
>>> CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETCOMPLETED, not
>>> CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETONGOING. That could explain why
>>> you always get a timeout.
>>
>> No, I don't think so. The complexio reset is set active just before the
>> wait. So the reset status should show reset ongoing, until at some point
>> we release the reset (we do that when starting the PHY again).
>>
>> The TRM doesn't talk about this, though. So, I guess the status might go
>> to RESETONGOING for a very short time and back to RESETCOMPLETED before
>> the code can see the RESETONGOING. But I suspect the status just stays
>> at RESETCOMPLETED.
> 
> The TRM is indeed not very clear. My understanding was that asserting
> RESET_CTRL initiates the reset, and RESET_DONE switches to 1 once the
> reset completes. There's however a note in the initialization sequence
> that states

No, it's a bit to keep (or release) camerarx in reset. When the camerarx 
is being started, both reset ctrl and done are 0. The driver then 
releases the reset by setting ctrl to 1. Nothing happens at this time, 
as the camerarx needs the byteclk from the sensor to finish the reset. 
Later, when the sensor has been started, done changes to 1. This works fine.

The problem is on the stop side. Setting ctrl back to 0 does something, 
as the capture stops, so presumably the camerarx goes into reset state. 
But the done bit does not change.

The done bit is back to 0 when we start the camerarx again. My guess is 
that it's reset when the CAL module is turned off via runtime PM. This 
is not good, as there's no strict rule that says CAL will be turned off 
by runtime PM. However, I have not found any other way to reset the done 
bit. And in the case that we don't get a CAL reset, I guess we're still 
fine, as the camerarx is just already out of reset, and works.

  Tomi
