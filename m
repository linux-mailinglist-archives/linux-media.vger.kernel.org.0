Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC5BD1A76BA
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 10:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437252AbgDNI7N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 04:59:13 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:42007 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2437118AbgDNI7M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 04:59:12 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id OHPKjOrxh7xncOHPNj15dZ; Tue, 14 Apr 2020 10:59:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1586854749; bh=rzPTxABO+GO1ugN9j20FMyIDQtHP+K58senQ24jTmeU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=wIX4lrZYhA1ZNxZ1zu0YHpjfb3/YpkUl4SIXy9p8vUwDC3l9MksiY5zCtsdXZPIcx
         DrchSwyRHNztaKYhUj8S+mm3TVrFDxSBCXcWLYHMC3xSHSm8Y057DYv31ikZ/Jiznx
         v8ACZ0ANVNLOAFAze84oTQSZ2PVIeGOX6HDlcSyCsedLpUD1NX6WcOHTyaHs8sVhuY
         DBMJlesQODpFgurBw82if94aOYyqrTNJ6Q7uif3GwH+3ykGNQya2P/85q+6HTNnqXS
         4KvioAGuaXLZ8/q5HT64wWCzTJOihjiVI7/MHYyybf+V+KxuQLvKwl1CePTulPhnLj
         7yk2eS8bDPt7w==
Subject: Re: gspca webcam: need to plug it 5 times before it works
To:     Pavel Machek <pavel@ucw.cz>,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, samr7@cs.washington.edu,
        gerard@gkall.hobby.nl
Cc:     linux@rainbow-software.org, kilgota@auburn.edu, moinejf@free.fr
References: <20200404184732.GA17534@duo.ucw.cz>
 <20200404191530.GA19753@duo.ucw.cz> <20200404191846.GA20044@duo.ucw.cz>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ae4ed621-8f91-2c6a-bd11-2f4709a056dc@xs4all.nl>
Date:   Tue, 14 Apr 2020 10:59:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200404191846.GA20044@duo.ucw.cz>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAOpjT6gnyQpA6kxmqjfE+s0kn+FWY8uOLPLQ8MXzuHjYKzU6z2HfKptcPI+tvk97Uq6fVHNbRPhp5/2mPUBRJYvcFWzGuv/v26d7OPnwgpWM9k6uybj
 97cHUFYJ4lZP/6xsc4SJAG6t4T3+ISq5xRdr/N4zh2yHz4siBgbFiTT/rIi6EhOcOahX+sYtuvya5Bj3O020xIsq4JPIamZeFKDMjtRAMy5nxcbJSCnm7z9P
 80pOCqQB2v6KqCFZN4gzHOpcJwrYNlAzZVNRvIZlITM0aOGwCxJnz+W3S33heSO+YDz7VZSpYZNr06Q1iq0a/p4zyDyVQr/ytJdKmmd0OpDkVJtGbRzaSzEK
 9jR9nB4/ynspMFYsh2qcnGfAZ+9xQ1oIhddNsbj3j4H9iyp/WlU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pavel,

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

You're on your own, I'm afraid.

I think I have one or two of these webcams, but they are in the Netherlands
while I am in Norway, and I have no idea when I will be back.

Frankly, I would recommend buying a uvc webcam rather than spending any time on
these old crappy webcams.

Regards,

	Hans

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

