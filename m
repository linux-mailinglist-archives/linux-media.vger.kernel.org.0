Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 371FF363E62
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 11:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232583AbhDSJSU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 05:18:20 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45062 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231637AbhDSJST (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 05:18:19 -0400
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E3CACD4A;
        Mon, 19 Apr 2021 11:17:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618823869;
        bh=Uj9btoxzc/tit0BrMS8GFG/9S1oT8ApK2fJ2BsM2nKI=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=Hs15VqqxM02zAqN+SIOPteA1oScDOcuJSb/Uh8mfJuuotQvDlVZHOir4Pg+KZWuf6
         2XBRf1UKD2vjbvmZKGTB3tzyNN35z1DC5vgNWloQ/C2RvkAI59THP2ffNrcxqr1bf7
         8wD90X6Eyu1gUigd2nSd7/qa92BoFCdxCGE2moD8=
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-11-tomi.valkeinen@ideasonboard.com>
 <YHwkCwIEWiWrq3ca@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 10/28] media: ti-vpe: cal: Add pixel processing context
Message-ID: <652917ce-2311-0cd1-bb07-adbc656c76df@ideasonboard.com>
Date:   Mon, 19 Apr 2021 12:17:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHwkCwIEWiWrq3ca@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/04/2021 15:20, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Mon, Apr 12, 2021 at 02:34:39PM +0300, Tomi Valkeinen wrote:
>> CAL has 4 pixel processing contexts (PIX PROC) of which the driver
>> currently uses pix proc 0 for PHY0, and pix proc 1 for PHY1 (as the
>> driver supports only a single source per PHY).
>>
>> Add a pix_proc field to cal_ctx to allow us to use different pix proc
>> contexts in the future
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/platform/ti-vpe/cal.c | 9 +++++----
>>   drivers/media/platform/ti-vpe/cal.h | 1 +
>>   2 files changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
>> index c550eeb27e79..3dc83c66fd96 100644
>> --- a/drivers/media/platform/ti-vpe/cal.c
>> +++ b/drivers/media/platform/ti-vpe/cal.c
>> @@ -355,16 +355,16 @@ static void cal_ctx_pix_proc_config(struct cal_ctx *ctx)
>>   		break;
>>   	}
>>   
>> -	val = cal_read(ctx->cal, CAL_PIX_PROC(ctx->index));
>> +	val = cal_read(ctx->cal, CAL_PIX_PROC(ctx->pix_proc));
>>   	cal_set_field(&val, extract, CAL_PIX_PROC_EXTRACT_MASK);
>>   	cal_set_field(&val, CAL_PIX_PROC_DPCMD_BYPASS, CAL_PIX_PROC_DPCMD_MASK);
>>   	cal_set_field(&val, CAL_PIX_PROC_DPCME_BYPASS, CAL_PIX_PROC_DPCME_MASK);
>>   	cal_set_field(&val, pack, CAL_PIX_PROC_PACK_MASK);
>>   	cal_set_field(&val, ctx->cport, CAL_PIX_PROC_CPORT_MASK);
>>   	cal_set_field(&val, 1, CAL_PIX_PROC_EN_MASK);
>> -	cal_write(ctx->cal, CAL_PIX_PROC(ctx->index), val);
>> -	ctx_dbg(3, ctx, "CAL_PIX_PROC(%d) = 0x%08x\n", ctx->index,
>> -		cal_read(ctx->cal, CAL_PIX_PROC(ctx->index)));
>> +	cal_write(ctx->cal, CAL_PIX_PROC(ctx->pix_proc), val);
>> +	ctx_dbg(3, ctx, "CAL_PIX_PROC(%d) = 0x%08x\n", ctx->pix_proc,
> 
> While at it, you could s/%d/%u/
> 
>> +		cal_read(ctx->cal, CAL_PIX_PROC(ctx->pix_proc)));
> 
> And should we use val here instead of reading the value back ?

I think it's usually good to read the value from the register. It'll 
show what the register value really is, not what we thought we wrote. 
Usually those two should be the same, but in some cases there are 
read-only fields or non-writeable areas.

That said, I'm not sure if any of the registers printed in cal.c have 
any of those fields, so... I don't feel strongly either way, but I also 
don't see benefit in doing the change (verifying there are no read-only 
fields, and fixing the conflicts).

I can change this and the other similar cases if you have a reason why 
it's better =).

  Tomi
