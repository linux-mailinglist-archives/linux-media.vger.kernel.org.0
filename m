Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA3178B7C
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2019 14:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727418AbfG2MOf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jul 2019 08:14:35 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45780 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726972AbfG2MOf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jul 2019 08:14:35 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E39CBCC;
        Mon, 29 Jul 2019 14:14:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1564402473;
        bh=wCcAv6FM39diFN+jloWxPo/sh6IQxLvyE55J6Ukj43k=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=EXVYBv5C2Fy1T255ejinqH2w7bZ2KZfQLDogsCIDvvZObjLlX3XBstaONLOl1zwYh
         +PtIcBcFdTS5Es71PD3z2jJ3HGaKPQIMk2i7OaeoC2UTOMCrrnRZ2JpqrMQ08ch3MA
         cWrtMeLvUSmXhqe96Xg3cKNn3Jz325jQ1LYgV7SM=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] media: vsp1: fix memory leak of dl on error return path
To:     Colin Ian King <colin.king@canonical.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190728171124.14202-1-colin.king@canonical.com>
 <e5c3dede-2c59-4c64-7a8c-f022ee06cbfa@ideasonboard.com>
 <22ff8757-fd79-a279-f55e-fc7c8d204a60@canonical.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <dd5e9421-9d32-0cad-9411-575569766b2f@ideasonboard.com>
Date:   Mon, 29 Jul 2019 13:14:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <22ff8757-fd79-a279-f55e-fc7c8d204a60@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/07/2019 13:12, Colin Ian King wrote:
> On 29/07/2019 13:11, Kieran Bingham wrote:
>> Hi Colin,
>>
>> On 28/07/2019 18:11, Colin King wrote:
>>> From: Colin Ian King <colin.king@canonical.com>
>>>
>>> Currently when the call vsp1_dl_body_get fails and returns null the
>>> error return path leaks the allocation of dl. Fix this by kfree'ing
>>> dl before returning.
>>
>> Eeep. This does indeed look to be the case.
>>
>>>
>>> Addresses-Coverity: ("Resource leak")
>>> Fixes: 5d7936b8e27d ("media: vsp1: Convert display lists to use new body pool")
>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>
>> Thank you!
> 
> Thank static analysis :-)

Bah, that's just the hammer - you're the one finding the nails :-D
--
Kieran


> 
>>
>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>
>>
>>> ---
>>>  drivers/media/platform/vsp1/vsp1_dl.c | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/vsp1/vsp1_dl.c b/drivers/media/platform/vsp1/vsp1_dl.c
>>> index 104b6f514536..d7b43037e500 100644
>>> --- a/drivers/media/platform/vsp1/vsp1_dl.c
>>> +++ b/drivers/media/platform/vsp1/vsp1_dl.c
>>> @@ -557,8 +557,10 @@ static struct vsp1_dl_list *vsp1_dl_list_alloc(struct vsp1_dl_manager *dlm)
>>>  
>>>  	/* Get a default body for our list. */
>>>  	dl->body0 = vsp1_dl_body_get(dlm->pool);
>>> -	if (!dl->body0)
>>> +	if (!dl->body0) {
>>> +		kfree(dl);
>>>  		return NULL;
>>> +	}
>>>  
>>>  	header_offset = dl->body0->max_entries * sizeof(*dl->body0->entries);
>>>  
>>>
>>
> 

