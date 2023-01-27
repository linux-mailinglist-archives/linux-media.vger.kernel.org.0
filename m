Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E4A267E0F2
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 11:02:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233101AbjA0KCH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Jan 2023 05:02:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232726AbjA0KCG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Jan 2023 05:02:06 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C5095DC2A
        for <linux-media@vger.kernel.org>; Fri, 27 Jan 2023 02:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674813675;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iBonNxBex1x8EL+XVkksxs7UZFO/Rob9VHoqJQCH81o=;
        b=UykMjABYanllKlH7sTzfz6p7W1fXunF4RhErSSDhec9o8ObZqDuAYqymfCiyXm+unzHINq
        +vlVjVaNnLkZG4Nh6ylfL5s49s02622nvIoKShpx8Vr/fRQMm55IeXQXVmxZryVNlElR7V
        e2jh4/OT1abo9hFyA325mr5YxO8sYa0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-675-Kb0jwUo4Ptu5ovTUGj7MxQ-1; Fri, 27 Jan 2023 05:01:13 -0500
X-MC-Unique: Kb0jwUo4Ptu5ovTUGj7MxQ-1
Received: by mail-ed1-f69.google.com with SMTP id c12-20020a05640227cc00b0049e2c079aabso3229181ede.1
        for <linux-media@vger.kernel.org>; Fri, 27 Jan 2023 02:01:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iBonNxBex1x8EL+XVkksxs7UZFO/Rob9VHoqJQCH81o=;
        b=LZAI1WmGZtauq+eohZfw4qbHoKaSplAZ/ueM+eGb4kS3lJqK7qxEMuvAv3XYEXSEhn
         85Q9mZ14fEUKDcJJqzD14VkahB3krVLPwmnFOWu2kbou0C1WFAKwztqklyP/KzcBgAmq
         v5d4LWQBW2AdwrMIjyRxMIuBOm6ih0VaIGOajZzWUy1YlV9vvuhpL1/H/CQhtv5CPAR3
         qkmfiPssXGmiqNk3A1xn3aU67IFT3ifu6qbQ9TtQoHaz5lEW88dkoY1EmKwmT8UxNF8k
         exXm/8t7PPB633winAY9HGdDHcDGIJs+PbiT8+TZS3V2nRVGbYgId62+7UL3bMZA89QP
         9DHA==
X-Gm-Message-State: AO0yUKXydENEUR2k6oPGbjgecQd1itFPi0adzO7ARAlZw9CILt6NsnAq
        T6CwnvLfTQ/49EWFm/9p6mRe2Z2N1OBzJ1C7J5FWUNb8tW1T8BEaldJWKANZISJqNQRUQSKA02c
        ryF8Mf0Tp5mq0i2EoChpVkD0=
X-Received: by 2002:a17:907:8e9b:b0:87a:542e:53b4 with SMTP id tx27-20020a1709078e9b00b0087a542e53b4mr2741569ejc.64.1674813670312;
        Fri, 27 Jan 2023 02:01:10 -0800 (PST)
X-Google-Smtp-Source: AK7set+NKo44xbJ+gnJ/owWan1M1+HyvIwAsjCM1JceB1GyVJkD38wHI5lqzixieQS2VnOSnvKwzxA==
X-Received: by 2002:a17:907:8e9b:b0:87a:542e:53b4 with SMTP id tx27-20020a1709078e9b00b0087a542e53b4mr2741540ejc.64.1674813669966;
        Fri, 27 Jan 2023 02:01:09 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id h11-20020aa7de0b000000b004a21304f5a0sm206649edv.72.2023.01.27.02.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 02:01:09 -0800 (PST)
Message-ID: <5394cf3c-32d8-5098-9e35-55ff973e56c5@redhat.com>
Date:   Fri, 27 Jan 2023 11:01:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 06/11] media: v4l2-core: Built async and fwnode code
 into videodev.ko
Content-Language: en-US, nl
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>,
        linux-media@vger.kernel.org
References: <20230120114524.408368-1-hdegoede@redhat.com>
 <20230120114524.408368-7-hdegoede@redhat.com>
 <Y8qNausQs1j37/S4@paasikivi.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y8qNausQs1j37/S4@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 1/20/23 13:47, Sakari Ailus wrote:
> Hi Hans,
> 
> Many thanks for working on this.

You are welcome.

> On Fri, Jan 20, 2023 at 12:45:19PM +0100, Hans de Goede wrote:
>> Currently the videodev.ko code may be builtin while e.g. v4l2-fwnode.ko
>> is build as a module.
>>
>> This makes it hard to add code depending on other subsystems spanning
>> both videodev.ko and v4l2-fwnode.ko. Specifically this block adding code
>> depending on the LED subsystem.
>>
>> This is made even harder because CONFIG_V4L2_FWNODE is selected,
>> not depended on so it itself cannot depend on another subsystem without
>> editing all the Kconfig symbols selecting it to also list the dependency
>> and there are many of such symbols.
>>
>> Adding a "select LED_CLASS if NEW_LEDS" to CONFIG_V4L2_FWNODE leads
>> to Kconfig erroring out with "error: recursive dependency detected!".
>>
>> To fix this dependency mess, change the V4L2_FWNODE and V4L2_ASYNC
>> (which V4L2_FWNODE selects) Kconfig symbols from tristate to bools and
>> link their code into videodev.ko instead of making them separate modules.
>>
>> This will allow using IS_REACHABLE(LED_CLASS) for the new LED integration
>> code without needing to worry that it expands to 0 in some places and
>> 1 in other places because some of the code being builtin vs modular.
>>
>> On x86_64 this leads to the following size changes for videodev.ko
>>
>> [hans@shalem linux]$ size drivers/media/v4l2-core/videodev.ko
>>
>> Before:
>>    text	   data	    bss	    dec	    hex	filename
>>  218206	  14395	   2448	 235049	  39629 drivers/media/v4l2-core/videodev.ko
>> After:
>>    text	   data	    bss	    dec	    hex	filename
>>  243213	  17615	   2456	 263284	  40474	drivers/media/v4l2-core/videodev.ko
>>
>> So (as expected) there is some increase in size here, but it
>> really is not that much.
>>
>> And the uncompressed no-debuginfo .ko file disk-usage actually shrinks
>> by 17 KiB (comparing the slightly larger videodev.ko against the
>> 3 original modules) and loading time will also be better.
>>
>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v5:
>> - Add a new v4l2-dev-priv.h for the async debugfs prototypes and add
>>   static inline wrappers there when CONFIG_V4L2_ASYNC is not enabled
>>
>> Changes in v4:
>> - New patch in v4 of this patch-set
>> ---
>>  drivers/media/v4l2-core/Kconfig         |  4 ++--
>>  drivers/media/v4l2-core/Makefile        |  4 ++--
>>  drivers/media/v4l2-core/v4l2-async.c    | 17 ++++-------------
>>  drivers/media/v4l2-core/v4l2-dev-priv.h | 19 +++++++++++++++++++
>>  drivers/media/v4l2-core/v4l2-dev.c      |  8 ++++++++
>>  drivers/media/v4l2-core/v4l2-fwnode.c   |  6 ------
>>  6 files changed, 35 insertions(+), 23 deletions(-)
>>  create mode 100644 drivers/media/v4l2-core/v4l2-dev-priv.h
>>
>> diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
>> index 348559bc2468..73574d946010 100644
>> --- a/drivers/media/v4l2-core/Kconfig
>> +++ b/drivers/media/v4l2-core/Kconfig
>> @@ -68,11 +68,11 @@ config V4L2_FLASH_LED_CLASS
>>  	  When in doubt, say N.
>>  
>>  config V4L2_FWNODE
>> -	tristate
>> +	bool
>>  	select V4L2_ASYNC
>>  
>>  config V4L2_ASYNC
>> -	tristate
>> +	bool
>>  
>>  # Used by drivers that need Videobuf modules
>>  config VIDEOBUF_GEN
>> diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
>> index 41d91bd10cf2..8c5a1ab8d939 100644
>> --- a/drivers/media/v4l2-core/Makefile
>> +++ b/drivers/media/v4l2-core/Makefile
>> @@ -15,7 +15,9 @@ videodev-objs	:=	v4l2-dev.o v4l2-ioctl.o v4l2-device.o v4l2-fh.o \
>>  
>>  # Please keep it alphabetically sorted by Kconfig name
>>  # (e. g. LC_ALL=C sort Makefile)
>> +videodev-$(CONFIG_V4L2_ASYNC) += v4l2-async.o
>>  videodev-$(CONFIG_COMPAT) += v4l2-compat-ioctl32.o
>> +videodev-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
>>  videodev-$(CONFIG_MEDIA_CONTROLLER) += v4l2-mc.o
>>  videodev-$(CONFIG_SPI) += v4l2-spi.o
>>  videodev-$(CONFIG_TRACEPOINTS) += v4l2-trace.o
>> @@ -24,9 +26,7 @@ videodev-$(CONFIG_VIDEO_V4L2_I2C) += v4l2-i2c.o
>>  # Please keep it alphabetically sorted by Kconfig name
>>  # (e. g. LC_ALL=C sort Makefile)
>>  
>> -obj-$(CONFIG_V4L2_ASYNC) += v4l2-async.o
>>  obj-$(CONFIG_V4L2_FLASH_LED_CLASS) += v4l2-flash-led-class.o
>> -obj-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
>>  obj-$(CONFIG_V4L2_H264) += v4l2-h264.o
>>  obj-$(CONFIG_V4L2_JPEG_HELPER) += v4l2-jpeg.o
>>  obj-$(CONFIG_V4L2_MEM2MEM_DEV) += v4l2-mem2mem.o
>> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
>> index 2f1b718a9189..024d6b82b50a 100644
>> --- a/drivers/media/v4l2-core/v4l2-async.c
>> +++ b/drivers/media/v4l2-core/v4l2-async.c
>> @@ -11,7 +11,6 @@
>>  #include <linux/i2c.h>
>>  #include <linux/list.h>
>>  #include <linux/mm.h>
>> -#include <linux/module.h>
>>  #include <linux/mutex.h>
>>  #include <linux/of.h>
>>  #include <linux/platform_device.h>
>> @@ -24,6 +23,8 @@
>>  #include <media/v4l2-fwnode.h>
>>  #include <media/v4l2-subdev.h>
>>  
>> +#include "v4l2-dev-priv.h"
>> +
>>  static int v4l2_async_nf_call_bound(struct v4l2_async_notifier *n,
>>  				    struct v4l2_subdev *subdev,
>>  				    struct v4l2_async_subdev *asd)
>> @@ -900,25 +901,15 @@ DEFINE_SHOW_ATTRIBUTE(pending_subdevs);
>>  
>>  static struct dentry *v4l2_async_debugfs_dir;
>>  
>> -static int __init v4l2_async_init(void)
>> +void __init v4l2_async_debugfs_init(void)
>>  {
>>  	v4l2_async_debugfs_dir = debugfs_create_dir("v4l2-async", NULL);
>>  	debugfs_create_file("pending_async_subdevices", 0444,
>>  			    v4l2_async_debugfs_dir, NULL,
>>  			    &pending_subdevs_fops);
>> -
>> -	return 0;
>>  }
>>  
>> -static void __exit v4l2_async_exit(void)
>> +void __exit v4l2_async_debugfs_exit(void)
>>  {
>>  	debugfs_remove_recursive(v4l2_async_debugfs_dir);
>>  }
>> -
>> -subsys_initcall(v4l2_async_init);
>> -module_exit(v4l2_async_exit);
>> -
>> -MODULE_AUTHOR("Guennadi Liakhovetski <g.liakhovetski@gmx.de>");
>> -MODULE_AUTHOR("Sakari Ailus <sakari.ailus@linux.intel.com>");
>> -MODULE_AUTHOR("Ezequiel Garcia <ezequiel@collabora.com>");
>> -MODULE_LICENSE("GPL");
>> diff --git a/drivers/media/v4l2-core/v4l2-dev-priv.h b/drivers/media/v4l2-core/v4l2-dev-priv.h
>> new file mode 100644
>> index 000000000000..b5b1ee78be20
>> --- /dev/null
>> +++ b/drivers/media/v4l2-core/v4l2-dev-priv.h
> 
> Could we call this v4l2-async-debugfs.h? I don't necessarily expect more
> material here.

Renaming it is fine by my. I have renamed it to
v4l2-async-debugfs.h for the upcoming v6 of this series.

Regards,

Hans



> 
>> @@ -0,0 +1,19 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Video capture interface for Linux version 2 private header.
>> + *
>> + * Copyright (C) 2023 Hans de Goede <hdegoede@redhat.com>
>> + */
>> +
>> +#ifndef _V4L2_DEV_PRIV_H_
>> +#define _V4L2_DEV_PRIV_H_
>> +
>> +#if IS_ENABLED(CONFIG_V4L2_ASYNC)
>> +void v4l2_async_debugfs_init(void);
>> +void v4l2_async_debugfs_exit(void);
>> +#else
>> +static inline void v4l2_async_debugfs_init(void) {}
>> +static inline void v4l2_async_debugfs_exit(void) {}
>> +#endif
>> +
>> +#endif
>> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
>> index 397d553177fa..10ba2e4196a6 100644
>> --- a/drivers/media/v4l2-core/v4l2-dev.c
>> +++ b/drivers/media/v4l2-core/v4l2-dev.c
>> @@ -31,6 +31,8 @@
>>  #include <media/v4l2-ioctl.h>
>>  #include <media/v4l2-event.h>
>>  
>> +#include "v4l2-dev-priv.h"
>> +
>>  #define VIDEO_NUM_DEVICES	256
>>  #define VIDEO_NAME              "video4linux"
>>  
>> @@ -1190,6 +1192,7 @@ static int __init videodev_init(void)
>>  		return -EIO;
>>  	}
>>  
>> +	v4l2_async_debugfs_init();
>>  	return 0;
>>  }
>>  
>> @@ -1197,6 +1200,7 @@ static void __exit videodev_exit(void)
>>  {
>>  	dev_t dev = MKDEV(VIDEO_MAJOR, 0);
>>  
>> +	v4l2_async_debugfs_exit();
>>  	class_unregister(&video_class);
>>  	unregister_chrdev_region(dev, VIDEO_NUM_DEVICES);
>>  }
>> @@ -1205,6 +1209,10 @@ subsys_initcall(videodev_init);
>>  module_exit(videodev_exit)
>>  
>>  MODULE_AUTHOR("Alan Cox, Mauro Carvalho Chehab <mchehab@kernel.org>, Bill Dirks, Justin Schoeman, Gerd Knorr");
>> +MODULE_AUTHOR("Guennadi Liakhovetski <g.liakhovetski@gmx.de>");
>> +MODULE_AUTHOR("Sakari Ailus <sakari.ailus@linux.intel.com>");
>> +MODULE_AUTHOR("Ezequiel Garcia <ezequiel@collabora.com>");
>> +MODULE_AUTHOR("Sylwester Nawrocki <s.nawrocki@samsung.com>");
>>  MODULE_DESCRIPTION("Video4Linux2 core driver");
>>  MODULE_LICENSE("GPL");
>>  MODULE_ALIAS_CHARDEV_MAJOR(VIDEO_MAJOR);
>> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
>> index 3d9533c1b202..c8a2264262bc 100644
>> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
>> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
>> @@ -17,7 +17,6 @@
>>  #include <linux/acpi.h>
>>  #include <linux/kernel.h>
>>  #include <linux/mm.h>
>> -#include <linux/module.h>
>>  #include <linux/of.h>
>>  #include <linux/property.h>
>>  #include <linux/slab.h>
>> @@ -1328,8 +1327,3 @@ int v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd)
>>  	return ret;
>>  }
>>  EXPORT_SYMBOL_GPL(v4l2_async_register_subdev_sensor);
>> -
>> -MODULE_LICENSE("GPL");
>> -MODULE_AUTHOR("Sakari Ailus <sakari.ailus@linux.intel.com>");
>> -MODULE_AUTHOR("Sylwester Nawrocki <s.nawrocki@samsung.com>");
>> -MODULE_AUTHOR("Guennadi Liakhovetski <g.liakhovetski@gmx.de>");
>> -- 
>> 2.39.0
>>
> 

