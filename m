Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24BA119C4E
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 13:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727356AbfEJLP6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 May 2019 07:15:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36406 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727324AbfEJLP5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 May 2019 07:15:57 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB970330;
        Fri, 10 May 2019 13:15:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557486954;
        bh=WmunaI8oHw7jhEazGcE81sTya3SO/IDt3fOyyPmna48=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=dZxJdtZ6h2ahIcyyEJWzaM8CpeDqecUcdlDmko5vaWELUX1ncflvIFK6UIC/4UUtl
         fk+BYN4ds5wudlFSbkbkC5OHYQ6aSAki1yU7j/EmTO5R/ZxwqYMlgZoSO0EIQ2sFEP
         PA8OHKXGRtbtzgCM2j80HlOLZxLcZWBBqlwYnhUs=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v3 4/5] media: vsp1: Split out pre-filter multiplier
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
References: <20190411161256.19607-1-kieran.bingham+renesas@ideasonboard.com>
 <20190411161256.19607-5-kieran.bingham+renesas@ideasonboard.com>
 <20190418063754.GH4806@pendragon.ideasonboard.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <c6222a3f-ea53-e147-7269-e6113be38520@ideasonboard.com>
Date:   Fri, 10 May 2019 12:15:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418063754.GH4806@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On 18/04/2019 07:37, Laurent Pinchart wrote:
> Hi Kieran,
> 
> Thank you for the patch.
> 
> On Thu, Apr 11, 2019 at 05:12:55PM +0100, Kieran Bingham wrote:
>> The 'mp' value is used through many calculations in determining the scaling
>> factors of the UDS. Factor this out so that it can be reused in further
>> calculations, and also ensure that if the BLADV control is ever changed only a
>> single function needs to be modified.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> ---
>>  drivers/media/platform/vsp1/vsp1_uds.c | 22 ++++++++++++++--------
>>  1 file changed, 14 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/media/platform/vsp1/vsp1_uds.c b/drivers/media/platform/vsp1/vsp1_uds.c
>> index 27012af973b2..c71c24363d54 100644
>> --- a/drivers/media/platform/vsp1/vsp1_uds.c
>> +++ b/drivers/media/platform/vsp1/vsp1_uds.c
>> @@ -46,6 +46,18 @@ void vsp1_uds_set_alpha(struct vsp1_entity *entity, struct vsp1_dl_body *dlb,
>>  		       alpha << VI6_UDS_ALPVAL_VAL0_SHIFT);
>>  }
>>  
>> +/*
>> + * Determine the pre-filter multiplication value.
> 
> This would benefit from a more detailed description, and in particular a
> definition of what "pre-filter" means.

There is a pre-filter processing stage to the scaling filter. I think it
does some form of pixel binning. The specifics are not documented.

I could update this to:

/*
 * Determine the pre-filter binning divider
 *
 * The UDS uses a two stage filter scaler process. This determines the
 * rate at which pixels are reduced for large down-scaling ratios before
 * being fed into the bicubic filter.
 */

>> + *
>> + * This calculation assumes that the BLADV control is unset.
> 
> s/control/bit/ ?
> s/unset/not set/ ?
> 

Sure.

>> + */
>> +static unsigned int uds_multiplier(int ratio)
> 
> Should the function be renamed to uds_pre_multiplier() ? And isn't it a
> divisor ? :-)

Indeed in the pipeline, the component is used when  downscaling, and so
I believe it is part of a pre-filter divider.

How about: uds_binning_ratio() ?




>> +{
>> +	unsigned int mp = ratio / 4096;
>> +
>> +	return mp < 4 ? 1 : (mp < 8 ? 2 : 4);
>> +}
>> +
>>  /*
>>   * uds_output_size - Return the output size for an input size and scaling ratio
>>   * @input: input size in pixels
>> @@ -55,10 +67,7 @@ static unsigned int uds_output_size(unsigned int input, unsigned int ratio)
>>  {
>>  	if (ratio > 4096) {
>>  		/* Down-scaling */
>> -		unsigned int mp;
>> -
>> -		mp = ratio / 4096;
>> -		mp = mp < 4 ? 1 : (mp < 8 ? 2 : 4);
>> +		unsigned int mp = uds_multiplier(ratio);
>>  
>>  		return (input - 1) / mp * mp * 4096 / ratio + 1;
>>  	} else {
>> @@ -88,10 +97,7 @@ static unsigned int uds_passband_width(unsigned int ratio)
>>  {
>>  	if (ratio >= 4096) {
>>  		/* Down-scaling */
>> -		unsigned int mp;
>> -
>> -		mp = ratio / 4096;
>> -		mp = mp < 4 ? 1 : (mp < 8 ? 2 : 4);
>> +		unsigned int mp = uds_multiplier(ratio);
>>  
>>  		return 64 * 4096 * mp / ratio;
>>  	} else {
> 
--
Regards

Kieran


