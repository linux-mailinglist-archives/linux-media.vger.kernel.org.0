Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1925A3131EE
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 13:14:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232070AbhBHMOY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 07:14:24 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:55089 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230125AbhBHMOM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Feb 2021 07:14:12 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 95PrljZ0RW4yN95PullY6V; Mon, 08 Feb 2021 13:13:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1612786402; bh=UsuC5UVidhy759SXuMsATpWqtnnkMoB+2bB+6Mr76pc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=eig2o7jyR9I5Ag8X6rXxnQCLYF3OTuOghQrS3FkuKmI2bjuQhiIvKgiaK0bHwfGiY
         v+goQ+fMHhDUPKcpG84m9h6nWb3XY0x6wHJTneok26bsOJTUH2ZBauwJebW4D14BtR
         bT0M8MFtuP8B8Kq6JY+TGFnS7KZEsNiqtZ9eg+q5ZdUddPplggyVMUy/NVzDQiI4Dl
         YXA6PVAWPl8r1+BhLF+QH8cjiFpSSlJN3LlZFJtXSCZt4PvYfHB2hxTBAbNtkyw5pw
         6lgabzw9eII915l0L4oRxni9R1AebE9xd7cn+1rWdR4Qw2DDwJqvk48WDvJRFoC3iu
         isGziswSJmTtg==
Subject: Re: [PATCH] imx334: 'ret' is uninitialized, should have been
 PTR_ERR()
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Martina Krasteva <martinax.krasteva@linux.intel.com>
References: <917ccfef-b93e-4d90-0b5a-4974145ab187@xs4all.nl>
 <20210208120830.GT32460@paasikivi.fi.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <362ff64d-f72d-eb2e-7d10-40334f7e9ef6@xs4all.nl>
Date:   Mon, 8 Feb 2021 13:13:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210208120830.GT32460@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGj7qUONVw8DBIQ9ttb00jCrWjQyqFxk8Uup63PcjzjVU6pNPzDm0AdN9cIIl8J96dKqVOfLAo/6Agk/pMm291hMMaEWz3U7QjS1FUNy7YvOg9HrNaLq
 pgKz9e6MAFUAgSpfigOAFsJAH1P5tB/Ofbp341sRbpVMQHGMCwSnQWVjvi1S4Ntw1mtaG1he/ocZ5m1c5VeUgboDoVFVknBj2682CDyOkHW8ggAzFudUP+TB
 oQ8QhU3STv5dERibpYB/tN0GoN8Wtl9/tXbSuq30UzBrCUTU9Wrmnwj0Xm9xieP5
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/02/2021 13:08, Sakari Ailus wrote:
> Hi Hans,
> 
> On Mon, Feb 08, 2021 at 12:32:29PM +0100, Hans Verkuil wrote:
>> Fix this compiler warning:
>>
>> drivers/media/i2c/imx334.c: In function 'imx334_parse_hw_config':
>> include/linux/dev_printk.h:112:2: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
>>   112 |  _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
>>       |  ^~~~~~~~
>> drivers/media/i2c/imx334.c:783:6: note: 'ret' was declared here
>>   783 |  int ret;
>>       |      ^~~
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  drivers/media/i2c/imx334.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
>> index 07e31bc2ef18..ad530f0d338a 100644
>> --- a/drivers/media/i2c/imx334.c
>> +++ b/drivers/media/i2c/imx334.c
>> @@ -790,7 +790,8 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
>>  	imx334->reset_gpio = devm_gpiod_get_optional(imx334->dev, "reset",
>>  						     GPIOD_OUT_LOW);
>>  	if (IS_ERR(imx334->reset_gpio)) {
>> -		dev_err(imx334->dev, "failed to get reset gpio %d", ret);
>> +		dev_err(imx334->dev, "failed to get reset gpio %ld",
>> +			PTR_ERR(imx334->reset_gpio));
>>  		return PTR_ERR(imx334->reset_gpio);
>>  	}
>>
> 
> Thanks for the patch.
> 
> Feel free to merge this through your tree if you think you'll have other
> fixes. In that case,
> 
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> I can also pick it if you like.
> 

Can you pick it up? I have no new PRs planned this week.

Regards,

	Hans
