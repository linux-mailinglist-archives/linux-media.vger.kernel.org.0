Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52EC81CD5E6
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 12:08:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728710AbgEKKI0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 06:08:26 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:42387 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725983AbgEKKI0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 06:08:26 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Y5MBjA4BPhEkrY5MCjFzrG; Mon, 11 May 2020 12:08:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1589191703; bh=TouBDOQ1cLBvDP/VkvIDXNmXljBFUOeKcWA2hkXwZL4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=uYZaErh93zi8Si+lFZewQ4Xg7X+BCIe0tZZ7do2fh8C0WAwtJJ3/DO/do1bYwaGTl
         TaePjYTICt5/AUbCcezqzGgYpJpQuQBWpXlHaoaKawXopD3ctDDLcx7amjlIV2AxHO
         bFVxXJN7W2ZzNR1EDn9jD8PW3UyRZDT9n9kFkpsKb5bQmAcDIfZbkykGA5tpQ6hFgN
         M6JbTrqTpCjvcytDelSTB3AMfZw9fAOebGKJJ+oIVoSeJV8sj6RQ3VMtjlfEM6rGtk
         1I+zUmwppCR9XiQpEZNpikhJsN+ffB/YqFDEY6qv6MNVSJ18kokuL09cKFzbeuwOzV
         EgIeQpuRc4EOw==
Subject: Re: gspca webcam: need to plug it 5 times before it works
To:     Pavel Machek <pavel@ucw.cz>,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, samr7@cs.washington.edu,
        gerard@gkall.hobby.nl
Cc:     linux@rainbow-software.org, kilgota@auburn.edu, moinejf@free.fr
References: <20200404184732.GA17534@duo.ucw.cz>
 <20200404191530.GA19753@duo.ucw.cz> <20200404191846.GA20044@duo.ucw.cz>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1e034f42-6997-d778-dce2-e5d641d91d0e@xs4all.nl>
Date:   Mon, 11 May 2020 12:08:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200404191846.GA20044@duo.ucw.cz>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKAUB970jI9ej9JDOMqm7PEEICWjgG/kh5MAchhg/dGUqa6aY5MS+Z18/6Bq+QLIRAk7DahiTY1+1HIU34VHLSdAc19TnxgONJIhy/bO8YIJ74Qilqm/
 Tpd5r2x+F/05pyfeHXnBBkpk3RrlwxgINkPifdv/DrHLDvprOElBXlIJ11D17eFH1+LBaKDzhpyghW3tY/AvzLKDfpf5B1g70tIs68GJGFYc6DdOXVCD+VJX
 w298z3z1OA1xz3PAwcCvHtFJTeSd9vM6yyIyTHMfwM+j44sUyrbNon3w3n0DdC/R6c2OE1X+s4AfQYgztKH3dsiTQXES3k9I1+R0Rg8uvnnJOIFDxztzvwKW
 U/a/8h4JXcQUHWmZiia3xxUEIcYSBWX5DSKogCkZ6j0kOjQKyihFhZ0el4VAxTa9Ko5WkLW5FEMHQaSlOhEWJPe9g7jBSTe00i/1SMI0Xt3vMfsfOMUG354m
 93gmy3wOIr2s5ayzhbLulT6CGsh6R/ROC9KjLA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pavel,

I tested with my sq930x (Creative WebCam Notebook Ultra) and I couldn't
reproduce this. Changing gain/exposure while streaming worked fine too.

It could be flaky usb hardware on your side, it's hard to tell.

Regards,

	Hans

On 04/04/2020 21:18, Pavel Machek wrote:
> Hi!
> 
>>> ..but if I'm patient enough, it eventually starts working... somehow.
>>>
>>> Incoming data seems to go in reliably. Outgoing commands (such as
>>> change gain) don't seem to be unreliable.
>>>
>>> Any idea how to debug / what could be wrong?
>>
>> And I can force it to probe like this: which... makes it work, but
>> does not fix the outgoing commands.
>>
>> Any ideas?
> 
> (Adding people from module_authors to the list.)
> 
>  								Pavel
>  
>> diff --git a/drivers/media/usb/gspca/sq930x.c b/drivers/media/usb/gspca/sq930x.c
>> index c3610247a90e..c9756c0a78df 100644
>> --- a/drivers/media/usb/gspca/sq930x.c
>> +++ b/drivers/media/usb/gspca/sq930x.c
>> @@ -7,6 +7,7 @@
>>   * Copyright (C) 2007 Sam Revitch <samr7@cs.washington.edu>
>>   */
>>  
>> +#define DEBUG
>>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>  
>>  #define MODULE_NAME "sq930x"
>> @@ -446,7 +447,7 @@ static void reg_w(struct gspca_dev *gspca_dev, u16 value, u16 index)
>>  			USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
>>  			value, index, NULL, 0,
>>  			500);
>> -	msleep(30);
>> +	msleep(90);
>>  	if (ret < 0) {
>>  		pr_err("reg_w %04x %04x failed %d\n", value, index, ret);
>>  		gspca_dev->usb_err = ret;
>> @@ -635,19 +636,25 @@ static void cmos_probe(struct gspca_dev *gspca_dev)
>>  		SENSOR_MT9V111,
>>  	};
>>  
>> +	printk("CMOS Probing...\n");
>>  	for (i = 0; i < ARRAY_SIZE(probe_order); i++) {
>> +	  printk("Probing type %d...\n", i);
>> +	  
>>  		sensor = &sensor_tb[probe_order[i]];
>>  		ucbus_write(&sd->gspca_dev, sensor->cmd, sensor->cmd_len, 8);
>>  		gpio_init(sd, sensor->gpio);
>> -		msleep(100);
>> +		msleep(200);
>>  		reg_r(gspca_dev, (sensor->i2c_addr << 8) | 0x001c, 1);
>> -		msleep(100);
>> -		if (gspca_dev->usb_buf[0] != 0)
>> +		msleep(200);
>> +		if (gspca_dev->usb_buf[0] != 0) {
>> +		  printk("#### LUCKY! Have type %d\n", i);
>>  			break;
>> +		}
>>  	}
>>  	if (i >= ARRAY_SIZE(probe_order)) {
>> -		pr_err("Unknown sensor\n");
>> -		gspca_dev->usb_err = -EINVAL;
>> +		printk("Unknown sensor ... hmm?\n");
>> +		sd->sensor = probe_order[i-1];
>> +		//gspca_dev->usb_err = -EINVAL;
>>  		return;
>>  	}
>>  	sd->sensor = probe_order[i];
>>
>>
>> -- 
>> (english) http://www.livejournal.com/~pavelmachek
>> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
> 
> 
> 

