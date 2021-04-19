Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE9636408F
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 13:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237751AbhDSL34 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 07:29:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbhDSL3z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 07:29:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B585EC06174A
        for <linux-media@vger.kernel.org>; Mon, 19 Apr 2021 04:29:25 -0700 (PDT)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43307D4A;
        Mon, 19 Apr 2021 13:29:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618831761;
        bh=oM0gW+V6uQXyJGm+lSsom52vX0HJuD7wnAAjs2cvswg=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=DYloTK5qRaNMpdQE75f/Ca+9u8t5JBPoQZv56r46sAIPiJtla2sw8idYI9oUJ/H6m
         KDCThzqJF8aeNnhUKAzy1xI67dgRpOzXhvl0PlpyO1fGUSvUEbEGFNTOGLY8GZM2qw
         bfPSQzrjTCijhK7RINaF8jr9tHlhghjXx7Gdk2xk=
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-16-tomi.valkeinen@ideasonboard.com>
 <YHwqLSgwYmt9ZAOU@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 15/28] media: ti-vpe: cal: remove wait when stopping
 camerarx
Message-ID: <9d6b96f4-cdb0-5820-965d-7135a926829f@ideasonboard.com>
Date:   Mon, 19 Apr 2021 14:29:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHwqLSgwYmt9ZAOU@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/04/2021 15:46, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Mon, Apr 12, 2021 at 02:34:44PM +0300, Tomi Valkeinen wrote:
>> Asserting ComplexIO reset seems to affect the HW (ie. asserting reset
>> will break an active capture), but the RESET_DONE bit never changes to
>> "reset is ongoing" state. Thus we always get a timeout.
>>
>> Drop the wait, as it seems to achieve nothing.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/platform/ti-vpe/cal-camerarx.c | 15 ++-------------
>>   1 file changed, 2 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
>> index 0354f311c5d2..245c601b992c 100644
>> --- a/drivers/media/platform/ti-vpe/cal-camerarx.c
>> +++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
>> @@ -405,7 +405,6 @@ static int cal_camerarx_start(struct cal_camerarx *phy)
>>   
>>   static void cal_camerarx_stop(struct cal_camerarx *phy)
>>   {
>> -	unsigned int i;
>>   	int ret;
>>   
>>   	cal_camerarx_ppi_disable(phy);
>> @@ -419,19 +418,9 @@ static void cal_camerarx_stop(struct cal_camerarx *phy)
>>   			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL,
>>   			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_MASK);
>>   
>> -	/* Wait for power down completion */
>> -	for (i = 0; i < 10; i++) {
>> -		if (cal_read_field(phy->cal,
>> -				   CAL_CSI2_COMPLEXIO_CFG(phy->instance),
>> -				   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) ==
>> -		    CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETONGOING)
> 
> Isn't this the wrong condition ? I would have expected
> CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETCOMPLETED, not
> CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETONGOING. That could explain why
> you always get a timeout.

No, I don't think so. The complexio reset is set active just before the 
wait. So the reset status should show reset ongoing, until at some point 
we release the reset (we do that when starting the PHY again).

The TRM doesn't talk about this, though. So, I guess the status might go 
to RESETONGOING for a very short time and back to RESETCOMPLETED before 
the code can see the RESETONGOING. But I suspect the status just stays 
at RESETCOMPLETED.

  Tomi
