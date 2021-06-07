Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA4D139D63E
	for <lists+linux-media@lfdr.de>; Mon,  7 Jun 2021 09:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbhFGHqL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Jun 2021 03:46:11 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50112 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbhFGHqK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Jun 2021 03:46:10 -0400
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 393D48DB;
        Mon,  7 Jun 2021 09:44:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623051858;
        bh=Higm1pJfwT6D0msL5RrCqW0ByHF5DUsrPDSKe8GywYw=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=E3mDCJ9EQZ3kZxbW+JlXtMgdJ7o/TXZ2xJg2W+Fboec0ryhe+DIkIPzbWzDv1UDKs
         Metv48bmwaG+sxw1c/Hr5vyT7HZuQVs3vdLUbeTnhGTayZ0S3oK3WNVxES+ifxzCj3
         BZAKrIOjCNBUsxtDyPfPcTqwbc8TBnwMu1NyKiio=
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Pratyush Yadav <p.yadav@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        linux-media@vger.kernel.org
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
 <20210524110909.672432-22-tomi.valkeinen@ideasonboard.com>
 <YLou7fPDyQaCaz1o@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3 21/38] media: ti-vpe: cal: handle cal_ctx_v4l2_register
 error
Message-ID: <a810e868-5ddf-7cf6-df70-723aa8bd447b@ideasonboard.com>
Date:   Mon, 7 Jun 2021 10:44:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YLou7fPDyQaCaz1o@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/06/2021 16:47, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Mon, May 24, 2021 at 02:08:52PM +0300, Tomi Valkeinen wrote:
>> cal_async_notifier_complete() doesn't handle errors returned from
>> cal_ctx_v4l2_register(). Add the error handling.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/platform/ti-vpe/cal.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
>> index ba8821a3b262..9e051c2e84a9 100644
>> --- a/drivers/media/platform/ti-vpe/cal.c
>> +++ b/drivers/media/platform/ti-vpe/cal.c
>> @@ -743,8 +743,12 @@ static int cal_async_notifier_complete(struct v4l2_async_notifier *notifier)
>>   	int ret = 0;
>>   
>>   	for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
>> -		if (cal->ctx[i])
>> -			cal_ctx_v4l2_register(cal->ctx[i]);
>> +		if (!cal->ctx[i])
>> +			continue;
>> +
>> +		ret = cal_ctx_v4l2_register(cal->ctx[i]);
>> +		if (ret)
>> +			return ret;
> 
> This part looks good, so
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Don't we need to call cal_ctx_v4l2_unregister() in the error path of
> cal_async_notifier_register() though ?

Hmm, can you elaborate? I don't understand where and why we need to call 
the unregister.

  Tomi
