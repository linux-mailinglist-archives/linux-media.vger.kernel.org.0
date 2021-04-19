Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D37C364055
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 13:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235872AbhDSLTf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 07:19:35 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46256 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbhDSLTc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 07:19:32 -0400
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD859D4A;
        Mon, 19 Apr 2021 13:19:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618831142;
        bh=EsBqMd6ozMmLIAoV4sMqOW7D1DJB4dn35waMTtVR4wo=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=TnzcH7izGVJU2TmYwa02OZmejbG/5KqAl9rmKkPUxabY/nrS1WAA20ZMDmsz5Levl
         TIx3XoUgkjlQ4YJF9RIOaGks1h3z3NboiBYtkh4uYg57PBfjuR2wQmmvI/BhfVOIt8
         DJ1Gn2yDQuthE29+tMrHJTvfPeW3CWT7wIpOLV+M=
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-15-tomi.valkeinen@ideasonboard.com>
 <YHwoTIhbLtKoD+6F@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 14/28] media: ti-vpe: cal: catch VC errors
Message-ID: <0e4bcb84-8acf-2bb2-85be-fb96599b3c3c@ideasonboard.com>
Date:   Mon, 19 Apr 2021 14:19:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHwoTIhbLtKoD+6F@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/04/2021 15:38, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Mon, Apr 12, 2021 at 02:34:43PM +0300, Tomi Valkeinen wrote:
>> CAL driver currently ignores VC related errors. To help catch error
>> conditions, enable all the VC error interrupts and handle them in the
>> interrupt handler by printing an error.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/platform/ti-vpe/cal-camerarx.c | 23 ++++++++++++++++----
>>   drivers/media/platform/ti-vpe/cal.c          |  9 ++++++++
>>   2 files changed, 28 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
>> index 974fcbb19547..0354f311c5d2 100644
>> --- a/drivers/media/platform/ti-vpe/cal-camerarx.c
>> +++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
>> @@ -226,24 +226,39 @@ static void cal_camerarx_enable_irqs(struct cal_camerarx *phy)
>>   		CAL_CSI2_COMPLEXIO_IRQ_FIFO_OVR_MASK |
>>   		CAL_CSI2_COMPLEXIO_IRQ_SHORT_PACKET_MASK |
>>   		CAL_CSI2_COMPLEXIO_IRQ_ECC_NO_CORRECTION_MASK;
>> -
>> -	/* Enable CIO error IRQs. */
>> +	const u32 vc_err_mask =
>> +		CAL_CSI2_VC_IRQ_CS_IRQ_MASK(0) |
>> +		CAL_CSI2_VC_IRQ_CS_IRQ_MASK(1) |
>> +		CAL_CSI2_VC_IRQ_CS_IRQ_MASK(2) |
>> +		CAL_CSI2_VC_IRQ_CS_IRQ_MASK(3) |
>> +		CAL_CSI2_VC_IRQ_ECC_CORRECTION_IRQ_MASK(0) |
>> +		CAL_CSI2_VC_IRQ_ECC_CORRECTION_IRQ_MASK(1) |
>> +		CAL_CSI2_VC_IRQ_ECC_CORRECTION_IRQ_MASK(2) |
>> +		CAL_CSI2_VC_IRQ_ECC_CORRECTION_IRQ_MASK(3);
>> +
>> +	/* Enable CIO & VC error IRQs. */
>>   	cal_write(phy->cal, CAL_HL_IRQENABLE_SET(0),
>> -		  CAL_HL_IRQ_CIO_MASK(phy->instance));
>> +		  CAL_HL_IRQ_CIO_MASK(phy->instance) | CAL_HL_IRQ_VC_MASK(phy->instance));
> 
> Line wrap ? Same in multiple places below. I know there's no strict 80
> columns limit anymore, but I don't think longer lines help with
> readability in this patch (not to mention the coding style inconsistency
> with the rest of the driver).

Well, I disagree, but I guess that's in the eye of the beholder.

If we have a coding style with strict 80 column limit, then there are 
other places I need to start fixing too. My personal coding style is 
such that around 80 columns I start thinking about splitting if it can 
be done without any messiness, around 100 I seriously try to split it, 
and around 120 I think it's broken.

I can change this and the other similar line, the end result is only 
slightly messier, but...

>> +
>> +			if (status & CAL_HL_IRQ_VC_MASK(i)) {
>> +				u32 vc_stat = cal_read(cal, CAL_CSI2_VC_IRQSTATUS(i));
>> +
>> +				dev_err_ratelimited(cal->dev,
>> +						    "CIO%u VC error: %#08x\n", i, vc_stat);
>> +
>> +				cal_write(cal, CAL_CSI2_VC_IRQSTATUS(i), vc_stat);
>> +			}

...especially for this part sticking to 80 columns uglifies the code.

u32 vc_stat =
	cal_read(cal,
		 CAL_CSI2_VC_IRQSTATUS(i));

or

u32 cio_stat = cal_read(cal,
	CAL_CSI2_COMPLEXIO_IRQSTATUS(i));

I could split parts to a separate function, but I don't think the end 
result would be better.

I think we discuss the 80-column problem almost in every series. Maybe 
we need to agree to some clear predefined rules to avoid future 
discussions about this? =)

  Tomi
