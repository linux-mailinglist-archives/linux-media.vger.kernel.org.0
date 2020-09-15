Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42AD526AA51
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 19:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727279AbgIORRA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 13:17:00 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:51051 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727872AbgIORP6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 13:15:58 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1kIEXS-00033S-SU; Tue, 15 Sep 2020 17:14:42 +0000
Subject: Re: [PATCH] media: rc: fix check on dev->min_timeout for
 LIRC_GET_MIN_TIMEOUT ioctl
To:     Sean Young <sean@mess.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxim Levitsky <maximlevitsky@gmail.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200915153608.35154-1-colin.king@canonical.com>
 <20200915171256.GA681@gofer.mess.org>
From:   Colin Ian King <colin.king@canonical.com>
Message-ID: <dc1fed82-d0dd-9dd3-d33c-1225ea7b80c3@canonical.com>
Date:   Tue, 15 Sep 2020 18:14:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <20200915171256.GA681@gofer.mess.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/09/2020 18:12, Sean Young wrote:
> On Tue, Sep 15, 2020 at 04:36:08PM +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently the LIRC_GET_MIN_TIMEOUT is checking for a null dev->max_timeout
>> and then accessing dev->min_timeout, hence we may have a potential null
>> pointer dereference issue.  This looks like a cut-n-paste typo, fix it
>> by checking on dev->min_timeout before accessing it.
> 
> max_timeout and min_timeout are both u32, not pointers. So, the commit 
> message is wrong: there is no null pointer dereference issue.
> 
> Every driver which has max_timeout also has min_timeout set (I've checked
> for this). So technically this is not wrong, but maybe it looks wrong?

Oops. I totally misread the analysis report. My bad.

> 
> Thanks,
> 
> Sean
>>
>> Addresses-Coverity: ("Copy-paste error")
>> Fixes: e589333f346b ("V4L/DVB: IR: extend interfaces to support more device settings")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/media/rc/lirc_dev.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
>> index 220363b9a868..d230c21e1d31 100644
>> --- a/drivers/media/rc/lirc_dev.c
>> +++ b/drivers/media/rc/lirc_dev.c
>> @@ -533,7 +533,7 @@ static long lirc_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>>  
>>  	/* Generic timeout support */
>>  	case LIRC_GET_MIN_TIMEOUT:
>> -		if (!dev->max_timeout)
>> +		if (!dev->min_timeout)
>>  			ret = -ENOTTY;
>>  		else
>>  			val = dev->min_timeout;
>> -- 
>> 2.27.0

