Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20C8336F844
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 12:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231431AbhD3KFa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 06:05:30 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:59161 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229559AbhD3KFa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 06:05:30 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id cQ0flz9J4iDzScQ0ilpTHh; Fri, 30 Apr 2021 12:04:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619777078; bh=ks5//nsbY4IUJklzOoYqyw4PJOvSbdi7HJh52A5cUF4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=GBhCHuBCr7Vh8TMi4K6lW3rslbTRu7/vl07evAY9X+XlJDhkrEy0v9egsX2r0qgaP
         spRJHb9zh/30xFS22SE9Ld3Gk9LW15B0CHO48HEGY9uqk0/AYf9kvRyw8cxPFDa/I3
         hfPyWy9/Ul9IpawjfbWJwEGO6uSlU1iVOddynrOYf/bcnX27ckek7q8IDBr9B7wm6Q
         9fJLNq7T5m2WvhqX5OClxDGNTpzE6k8+W7Td8RdNo5vBW1yROl17yHGw1uZFTuhVal
         0B3GL50lLArg5b2/Ergev3Ad8xKfBrQeIzB3XxyxMI2Ut14Pecgs+2zWkkWfvzsiMW
         VMi9Chyi0D3Eg==
Subject: Re: [PATCH v4 5/9] staging: media: atomisp: reformat code comment
 blocks
To:     Deepak R Varma <drv@mailo.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <cover.1619630709.git.drv@mailo.com>
 <034c3cc993191feb8fda719dd1b2adc9e2074e78.1619630709.git.drv@mailo.com>
 <20210429070611.GA1409@agape.jhs> <YIqdT6wsrlNP/cEo@192.168.1.8>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <693e054f-6a7b-d9e7-a72a-07d7fa295487@xs4all.nl>
Date:   Fri, 30 Apr 2021 12:04:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YIqdT6wsrlNP/cEo@192.168.1.8>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGCHXKh7uC75znIjT/4+e+hkPHcw11bfPLpGPToLoXiXCKDbOKgsRGMbJJlr/kj/L2ESWNHlsACJF11zQPEzx9cnDt8f4SA18By6iALUYpICUkAiDZh2
 d5wIK2ivnu1qVQSyliNKWtM2fWQ7b3wdAWvUZ0P/LlJ87YELOIMnS+MZgteQI3phFc+Ig0jKX7o7qk5rcUwVYzFZSDo2jFIXsdzdbJfl+9r8LeD7p47NBD/r
 8xlNn3FnMguwGoN+RHtQlIWmFrpXI9T9XOZQruxf9XXuh2EibZ6ldegrgZ4tdh8m9rUeixDDSks2OjiMgxZSGnTtmC8zISqIyLC81WK0kjLj2fz37DptPkRY
 7s04vXkX45YGEulzB7c3bHz1JNrzSQ3W5a5vdDP4cRgcF2t13ueGzVN8/oBxXIWcDu5uzWWWOIWPLFBGVW3aekDRcgQp18hBRAgSGchZpCAIa/ouK/A=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/04/2021 13:49, Deepak R Varma wrote:
> On Thu, Apr 29, 2021 at 09:06:12AM +0200, Fabio Aiuto wrote:
>> Hi Deepak,
> 
> Hello Fabio :)
> 
>>
>> On Wed, Apr 28, 2021 at 11:38:45PM +0530, Deepak R Varma wrote:
>>> Reformat code comment blocks according to the coding style guidelines.
>>> This resolves different checkpatch script WARNINGs around block comments.
>>>
>>> Suggested-by: Fabio Aiuto <fabioaiuto83@gmail.com>
>>> Signed-off-by: Deepak R Varma <drv@mailo.com>
>>> ---
>>>
>>> Changes since v3:
>>>    - Include additional header files in the clean up
>>> Changes since v2:
>>>    - Tag Fabio Auito for the patch suggestion
>>>
>>> diff --git a/drivers/staging/media/atomisp/i2c/mt9m114.h b/drivers/staging/media/atomisp/i2c/mt9m114.h
>>> index 787bbf59e895..aad98f37aaa6 100644
>>> --- a/drivers/staging/media/atomisp/i2c/mt9m114.h
>>> +++ b/drivers/staging/media/atomisp/i2c/mt9m114.h
>>> @@ -765,7 +765,8 @@ static struct misensor_reg const mt9m114_common[] = {
>>>  	{MISENSOR_16BIT, 0xC868, 0x0280}, /* cam_output_width = 952 */
>>>  	{MISENSOR_16BIT, 0xC86A, 0x01E0}, /* cam_output_height = 538 */
>>>  	/* LOAD = Step3-Recommended
>>> -	 * Patch,Errata and Sensor optimization Setting */
>>> +	 * Patch,Errata and Sensor optimization Setting
>>> +	 */
>>
>> 	/*
>> 	 * LOAD = Step3-Recommended
>>
>> :(
> 
> oops... sorry for the oversight. Not sure how I missed it.
> I will wait for any other feedback on other patches and send
> in a corrected version shortly.

I've fixed this up myself.

I'm taking this series and make a PR for this, wrapping up these
atomisp cleanups.

If you plan any more cleanups, then please do this on top of this
branch: https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=for-v5.14-out1

That contains all pending cleanups for staging/media.

Regards,

	Hans

> 
> Thank you,
> deepak.
> 
> 
> 
>>
>>
>>>  	{MISENSOR_16BIT, 0x316A, 0x8270}, /* DAC_TXLO_ROW */
>>>
>>
>> thank you,
>>
>> fabio
> 
> 

