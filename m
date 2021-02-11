Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4053188BB
	for <lists+linux-media@lfdr.de>; Thu, 11 Feb 2021 11:59:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231285AbhBKKyU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Feb 2021 05:54:20 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:47097 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbhBKKvw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Feb 2021 05:51:52 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lA9Yg-0000EO-CF; Thu, 11 Feb 2021 10:50:50 +0000
Subject: Re: [PATCH][next] media: i2c: imx334: Fix a read of the uninitialized
 variable ret
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Martina Krasteva <martinax.krasteva@intel.com>,
        Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210210190752.146631-1-colin.king@canonical.com>
 <20210210210303.GE3@paasikivi.fi.intel.com> <20210211104148.GE2696@kadam>
From:   Colin Ian King <colin.king@canonical.com>
Message-ID: <afe29495-6608-b0c3-de12-1b81980fac2d@canonical.com>
Date:   Thu, 11 Feb 2021 10:50:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210211104148.GE2696@kadam>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/02/2021 10:41, Dan Carpenter wrote:
> On Wed, Feb 10, 2021 at 11:03:03PM +0200, Sakari Ailus wrote:
>> Hi Colin,
>>
>> On Wed, Feb 10, 2021 at 07:07:52PM +0000, Colin King wrote:
>>> From: Colin Ian King <colin.king@canonical.com>
>>>
>>> Currently there is a dev_err error message that is printing the
>>> error status in variable ret (that has not been set) instead of
>>> the correct error status from imx334->reset_gpio.  Fix this.
>>>
>>> Addresses-Coverity: ("Uninitialized scalar variable")
>>> Fixes: 9746b11715c3 ("media: i2c: Add imx334 camera sensor driver")
>>>
>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>> ---
>>>  drivers/media/i2c/imx334.c | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
>>> index 07e31bc2ef18..f8b1caf26c9b 100644
>>> --- a/drivers/media/i2c/imx334.c
>>> +++ b/drivers/media/i2c/imx334.c
>>> @@ -790,7 +790,8 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
>>>  	imx334->reset_gpio = devm_gpiod_get_optional(imx334->dev, "reset",
>>>  						     GPIOD_OUT_LOW);
>>>  	if (IS_ERR(imx334->reset_gpio)) {
>>> -		dev_err(imx334->dev, "failed to get reset gpio %d", ret);
>>> +		dev_err(imx334->dev, "failed to get reset gpio %ld",
>>> +			IS_ERR_VALUE(imx334->reset_gpio));
> 
> IS_ERR_VALUE() isn't right.  It would always print 1 here.  It should
> just be PTR_ERR().
> 
> IS_ERR_VALUE() is like IS_ERR() but for when you're storing memory
> addresses in an unsigned long variable.  get_unmapped_area(), for
> example, returns unsigned longs.
> 
> regards,
> dan carpenter
> 
Thanks, that was a brown paper bug mistake for sure :-/

Colin

