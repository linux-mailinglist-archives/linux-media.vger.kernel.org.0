Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EBD47D2BA1
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 09:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbjJWHpT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 03:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbjJWHpR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 03:45:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD204D68
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 00:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698047061;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PRXwWYUB0RyHZdRxXUPq8+jUMBiX2jfeSJRh5VUyswQ=;
        b=ZohZzWPFxrDX5QM/D7UWO2uSOS1vc27CJzvNds1NVp8n1MVR4dPP+PJ3Mbkg+m5QswhY7e
        wtVVL4L3WospoxizW305i4MPWriuEsqZX5elZVdpboDOSRmeUuz+5gGMY4z7oGm09Dkfdt
        XpLltUPgKV8dAPm5SXI3En/1WIxKYVs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-OTXmE4SoMjSiy24Z707Prw-1; Mon, 23 Oct 2023 03:44:10 -0400
X-MC-Unique: OTXmE4SoMjSiy24Z707Prw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9ba247e03aeso178041666b.1
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 00:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698047049; x=1698651849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PRXwWYUB0RyHZdRxXUPq8+jUMBiX2jfeSJRh5VUyswQ=;
        b=Pby58h+fIEIDp6J7Gg4TM/3cJP1ECCztnm+S22h/tjrgf9jCXAHgrIATZYKkZDbT5Q
         E5VJrFX5Uach+6lD/+aA0ZCJQLH8G4YbCKgiU8O1Kop3qVew/w52pLFttjcXCEVzxYYL
         QQZfdMlKc2D5GlE+P+TfpoWxAgH5D6NilAb2tEf6Min4B6m1/KzKmEBcRroPwEOnHL4b
         b8ebAPLLGgNMwnVmrn7gMAdBylg3tpjxCqotgUXaCEccmNxroi6cQYe21MIe33w/ltfE
         tUddCSkeozgAFaHHwevVkBhcEteISLouYwzkAZczZxs/1l8ZKp8OF+641RVE9EAsCzWP
         9grg==
X-Gm-Message-State: AOJu0YyD49rKCPLwxCfXkXEcSY9WkNq3Rzl2kD4V4TgBlvcGd4THbQcJ
        9oiWn4jSU2IG2fCtHqKKBysgmOke/rCjeC49w1+OfG033YoJc/gZcw3SoUpp1XWzvucRTVnhiue
        qL+cRqyRIXcG1l4JXLMMh/RA=
X-Received: by 2002:a17:907:318c:b0:9be:2991:81fb with SMTP id xe12-20020a170907318c00b009be299181fbmr7310189ejb.36.1698047048934;
        Mon, 23 Oct 2023 00:44:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuSINapzKMn13MvwphqRI9jaRGWW18LfNT0YGymCsK/1Nbv9PsYPoM1Z3dRzyHJmBa145OaQ==
X-Received: by 2002:a17:907:318c:b0:9be:2991:81fb with SMTP id xe12-20020a170907318c00b009be299181fbmr7310180ejb.36.1698047048665;
        Mon, 23 Oct 2023 00:44:08 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a5-20020a170906468500b00992b2c55c67sm6174936ejr.156.2023.10.23.00.44.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 00:44:08 -0700 (PDT)
Message-ID: <83426573-8c4b-ec20-6916-2917aa06954f@redhat.com>
Date:   Mon, 23 Oct 2023 09:44:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 10/15] media: intel/ipu6: add input system driver
To:     Andreas Helbech Kleist <andreaskleist@gmail.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>, bingbu.cao@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com
Cc:     ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        tomi.valkeinen@ideasonboard.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com, claus.stovgaard@gmail.com
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
 <20230727071558.1148653-11-bingbu.cao@intel.com>
 <1ce2242844b3e1348d7343b84b15dd87e0f66e6a.camel@gmail.com>
 <ea3cc241-4074-2b53-359f-360ca45a7b1f@linux.intel.com>
 <900a1efcbf29aa238f2ace788dc739e9c6ad3c26.camel@gmail.com>
 <9d5d0bd8-41d1-4879-fccf-54e56aaa5073@redhat.com>
 <e0cc94736e4142f2d661a8bbb0c800b709349377.camel@gmail.com>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <e0cc94736e4142f2d661a8bbb0c800b709349377.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 10/23/23 08:23, Andreas Helbech Kleist wrote:
> Hi,
> 
> On Fri, 2023-10-20 at 16:39 +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 10/20/23 12:47, Andreas Helbech Kleist wrote:
>>> I've only tried it on my WIP IPU4 hack of this driver
>>
>> Oh a IPU4 version of this driver would be very interesting,
>> I was actually thinking about looking into this myself
>> because I have a Chuwi Hi13 tablet which uses the IPU4 and
>> it would be nice to get the camera working there (and on
>> other IPU4 using devices).
>>
>> Can you give some more info on your IPU4 work, e.g. :
>>
>> 1. Does it work?
> 
> Not yet. The intel-ipu4 module is working to the extent I'm able to
> test it without the isys-module. Buttress authentication succeeds, and
> I have very similar mmiotraces between the new driver and the old 4.19
> based driver I'm comparing it to.
> 
> The isys-module is very much work in progress. I'm learning the v4l2 
> along the way, so there is a steep learning curve.
> 
>> 2. Which sensor are you using it with ?
> 
> A custom tc358748 driver that pretends to be a sensor that delivers RGB
> data. I tried with the tc358746 driver in-tree, but figured it would be
> simpler to start out with a custom driver, since we have an old driver
> that has a list of the exact register writes needed to setup the
> device.
> 
>> 3. Which device are you testing on ?
> 
> An endoscopic system from Ambu A/S (the company I work for). See my
> colleague Claus' description of the device here:
> https://lore.kernel.org/all/471df7ffdf34b73d186c429a366cfee62963015f.camel@gmail.com/
> 
>> 4. Do you have a public git branch with this somewhere ?
> 
> Not yet, but I will share when I have something working. I could push
> the main driver part if anyone is interested. The isys driver is not
> worth sharing yet.

Sharing the code once you have something working is fine.

>> I'm afraid that I won't have time to look into this
>> myself anytime soon, but I'm very interested in this.
> 
> It would be great to have somebody else testing this out when I get a
> bit further.

Ok, I cannot promise I'll be able to find the time but I'm definitely
interested in this.

If you can send me a link to a git repo with the patches once you
have something working, then I will try to make the time to test this.

>>> but I think it
>>> is correct for IPU6 as well. The reason is that isys_driver is an
>>> auxiliary_driver, so I don't think 
>>>
>>>     MODULE_DEVICE_TABLE(pci, isys_pci_tbl);
>>>
>>> has any effect. The PCI probe happens in ipu6_pci_probe in ipu6.c
>>> (because it has a pci_device_id table as well), and the isys_driver
>>> is
>>> probed indirectly by ipu6-bus.c.
>>
>> So the MODULE_DEVICE_TABLE(pci, isys_pci_tbl) indeed does not
>> belong in this auxbus driver, instead it should use some sort
>> of auxbus MODULE_DEVICE_TABLE() to autoload based on its
>> auxbus modalias.
>>
>> But it does have an effect, modprobe will load both the main
>> ipu6 driver registering the aux devices as well as this driver
>> based on the modalias of the PCI device because with this
>> MODULE_DEVICE_TABLE(pci, isys_pci_tbl); statement both drivers
>> match that PCI modalias.
> 
> All right. But since the main driver contains the same table, I don't
> think there's any need to have it here?
> 
>> But the correct thing to do here would be to switch to
>> an auxbus based MODULE_DEVICE_TABLE() for the isys driver.
> 
> The isys_driver already has an auxiliary_device_id table. I'm not sure
> if that's what you mean?
> 
> From the bottom of ipu6-isys.c in PATCH 10/15:
> 
> +static const struct auxiliary_device_id ipu6_isys_id_table[] = {
> +	{
> +		.name = "intel_ipu6.isys",
> +		.driver_data = (kernel_ulong_t)&ipu6_isys_auxdrv_data,
> +	},
> +};

Right, so this needs a:

MODULE_DEVICE_TABLE(auxiliary, ipu6_isys_id_table);

And then the:

MODULE_DEVICE_TABLE(pci, isys_pci_tbl)

and any other mention of isys_pci_tbl can be dropped.

Regards,

Hans

