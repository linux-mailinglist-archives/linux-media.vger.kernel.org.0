Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A269529411C
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 19:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395204AbgJTRKN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 13:10:13 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43414 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395195AbgJTRKN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 13:10:13 -0400
Received: from [IPv6:2003:c7:cf43:5b00:28a3:2f4e:277d:2227] (p200300c7cf435b0028a32f4e277d2227.dip0.t-ipconnect.de [IPv6:2003:c7:cf43:5b00:28a3:2f4e:277d:2227])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C51451F44EDB;
        Tue, 20 Oct 2020 18:10:10 +0100 (BST)
Subject: Re: [PATCH] media: staging: rkisp1: rsz: make const array static,
 makes object smaller
To:     David Laight <David.Laight@ACULAB.COM>,
        'Colin King' <colin.king@canonical.com>,
        Helen Koike <helen.koike@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>
Cc:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201020144655.53251-1-colin.king@canonical.com>
 <d5663dec063440129bf6c373aa252d51@AcuMS.aculab.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <cec23fd3-15c1-8e52-3f4d-300d6149d89c@collabora.com>
Date:   Tue, 20 Oct 2020 19:10:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d5663dec063440129bf6c373aa252d51@AcuMS.aculab.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 20.10.20 um 17:29 schrieb David Laight:
> From: Colin King
>> Sent: 20 October 2020 15:47
>>
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Don't populate the const array dev_names on the stack but instead it
>> static. Makes the object code smaller by 15 bytes.
>>
>> Before:
>>     text	   data	    bss	    dec	    hex	filename
>>    17091	   2648	     64	  19803	   4d5b	media/rkisp1/rkisp1-resizer.o
>>
>> After:
>>     text	   data	    bss	    dec	    hex	filename
>>    17012	   2712	     64	  19788	   4d4c	media/rkisp1/rkisp1-resizer.o
>>
>> (gcc version 10.2.0)
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>   drivers/staging/media/rkisp1/rkisp1-resizer.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-
>> resizer.c
>> index 1687d82e6c68..7ca5b47c5bf5 100644
>> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
>> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
>> @@ -763,8 +763,10 @@ static void rkisp1_rsz_unregister(struct rkisp1_resizer *rsz)
>>
>>   static int rkisp1_rsz_register(struct rkisp1_resizer *rsz)
>>   {
>> -	const char * const dev_names[] = {RKISP1_RSZ_MP_DEV_NAME,
>> -					  RKISP1_RSZ_SP_DEV_NAME};
>> +	static const char * const dev_names[] = {
>> +		RKISP1_RSZ_MP_DEV_NAME,
>> +		RKISP1_RSZ_SP_DEV_NAME
>> +	};
>>   	struct media_pad *pads = rsz->pads;
>>   	struct v4l2_subdev *sd = &rsz->sd;
>>   	int ret;
> 
> Don't look at what that code is actually doing....
> It is rather horrid.
> rkisp1_rsz_register() is called for each entry in an array (twice).
> The array index is written into rsz->id.
> The value is then used to select one of the two strings.
> But rsz->id is actually an enum type.

Hi,
Is it that bad to use enum as an array index?
we use it in many places in the driver.

Thanks,
Dafna

> 
> rkisp1_rsz_register() should probably just be called twice with some
> extra parameters.
> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 
