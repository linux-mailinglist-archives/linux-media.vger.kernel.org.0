Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 568BA63D756
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 14:57:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229852AbiK3N5w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 08:57:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbiK3N5v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 08:57:51 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 223E84AF33
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 05:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669816611;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kSm+1SashonF2cMN2GTNt71Qqy7zZwT84h/qKyp8JJY=;
        b=UcMfiquCGi3HfVTTHh9+OqsT9a6Yd4s3Fl0EGGOZ+l7CTW6Fo9K1ldRe/I0ehwdvb7mcWs
        uh2UWjfdeXR2Tf5wuWb8yNg+Aq651UI4asRXCAHf52Av6TflqfQlVVlUsdn/lqtZDZU27Z
        4M/py/ad2buxD7jKKpURuwkx+qi3tP4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-480-B9-5GmwIM0CzpJEqw_Qj2Q-1; Wed, 30 Nov 2022 08:56:49 -0500
X-MC-Unique: B9-5GmwIM0CzpJEqw_Qj2Q-1
Received: by mail-ed1-f69.google.com with SMTP id h9-20020a05640250c900b00461d8ee12e2so9873247edb.23
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 05:56:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kSm+1SashonF2cMN2GTNt71Qqy7zZwT84h/qKyp8JJY=;
        b=HcoLn3c46V3doYLtm0B0szHxl3JYQrfyqpPzCGeSJRf06xmcZvzzutunHltXJ+dHi7
         Xs4A9uYq+a5yOc5F7Cxin0I64ONh2TBwZCEc6DVo1yN5hcTRr4FI9K21fwj3wNGIFihW
         magMn1VSut3c5/OSTVQRsCUvud4Y205JwAcA0PxO1eNtNDyDHzL8Os9kvcjUovpRr1CY
         1RryKUrMEmy2FpnJFaTP3yRMHnxSxBX1bOuP+CdvI0VU56whVQz5OZjAzDrB+ApPviRd
         Lt/RDVX2CexbV0qr9dYecDYhIaj9mQBg1I/hfBASPJlZU63wUbonmSwDaLcxZVJqLQLv
         4Qog==
X-Gm-Message-State: ANoB5pkNO2zcUjbDJ123thT/T4g++S7lhmTayx/NXZWZRmn9JfmJteMf
        pOT8ol1l1EtewMSPGCMYfrV9KpgO2h1aXCZpVJrCHxampLKag9dLxsZSAcsxTcrzBKWWBSwQvWU
        QVg5lt2zq/4isNF7JZ8BeyKA=
X-Received: by 2002:a17:906:3897:b0:7c0:911e:199a with SMTP id q23-20020a170906389700b007c0911e199amr4786634ejd.689.1669816608017;
        Wed, 30 Nov 2022 05:56:48 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6crMmGw72sVXSH0uPQVmFD7LKpHRazGOvQWcT7xnqe7S7q64Oyr5Y3xTDNx+kV1fwntuzr1g==
X-Received: by 2002:a17:906:3897:b0:7c0:911e:199a with SMTP id q23-20020a170906389700b007c0911e199amr4786621ejd.689.1669816607838;
        Wed, 30 Nov 2022 05:56:47 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id gi20-20020a1709070c9400b0077d6f628e14sm682234ejc.83.2022.11.30.05.56.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 05:56:47 -0800 (PST)
Message-ID: <ad9d01b6-de08-b54c-d300-cf133df90536@redhat.com>
Date:   Wed, 30 Nov 2022 14:56:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/6] media: ov5693: Add support for a privacy-led GPIO
Content-Language: en-US, nl
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-media@vger.kernel.org
References: <20221129231149.697154-1-hdegoede@redhat.com>
 <20221129231149.697154-2-hdegoede@redhat.com>
 <Y4ddgnRbRyUDSPFI@paasikivi.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y4ddgnRbRyUDSPFI@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 11/30/22 14:41, Sakari Ailus wrote:
> Hi Hans,
> 
> On Wed, Nov 30, 2022 at 12:11:44AM +0100, Hans de Goede wrote:
>> Add support for a privacy-led GPIO.
>>
>> Making the privacy LED to controlable from userspace, as using the LED
>> class subsystem would do, would make it too easy for spy-ware to disable
>> the LED.
>>
>> To avoid this have the sensor driver directly control the LED.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Note an additional advantage of directly controlling the GPIO is that
>> GPIOs are tied directly to consumer devices. Where as with a LED class
>> device, there would need to be some mechanism to tie the right LED
>> (e.g front or back) to the right sensor.
> 
> Thanks for the patch.
> 
> This approach has the drawback that support needs to be added for each
> sensor separately. Any idea how many sensor drivers might need this?

Quite a few probably. But as discussed here I plan to write a generic
sensor_power helper library since many sensor drivers have a lot of
boilerplate code to get clks + regulators + enable/reset gpios. The plan
is to add support for a "privacy-led" to this library so that all sensors
which use this get support for free.

Laurent pointed out that some sensors may have more complex power-up
sequence demands, which is true. But looking at existing drivers
then many follow a std simple pattern which can be supported in
a helper-library.

> Most implementations have privacy LED hard-wired to the sensor's power
> rails so it'll be lit whenever the sensor is powered on.
> 
> If there would be more than just a couple of these I'd instead create a LED
> class device and hook it up to the sensor in V4L2.


A LED cladd device will allow userspace to override the privacy-led
value which is considered bad from a privacy point of view. This
was actually already discussed here:

https://lore.kernel.org/platform-driver-x86/e5d8913c-13ba-3b11-94bc-5d1ee1d736b0@ideasonboard.com/

See the part of the thread on the cover-letter with Dan, Laurent
and me participating.

And a LED class device also will be a challenge to bind to the right
sensor on devices with more then one sensor, where as mentioned
above using GPIO-mappings give us the binding to the right sensor
for free.

Regards,

Hans



