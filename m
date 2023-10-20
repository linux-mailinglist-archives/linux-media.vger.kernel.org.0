Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E3557D11BA
	for <lists+linux-media@lfdr.de>; Fri, 20 Oct 2023 16:40:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377572AbjJTOkx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Oct 2023 10:40:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377518AbjJTOkw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Oct 2023 10:40:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20C7E114
        for <linux-media@vger.kernel.org>; Fri, 20 Oct 2023 07:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697812803;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DsPiAZJZgPwsGl6SU0F7yOl3ehtjNEP4a7c/MZs69xE=;
        b=OQuoAa47/UJqO8FS64H0VE+yuPjbtWx5j1Fpg4Ix1atC4zgG4zYzcxM224MKURGolPBO99
        9MT7aaWFr1mo87rAVG6qdw/ZsOIaFIZfKXc5PsDDDn1Jb50ncPnWvWAPJAEA4Yn35574zG
        OwF6E3Bwbm20Rs1me5AwaoNLw2XeN6w=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-MCa6TlxnPP2CrJLoMfsG_g-1; Fri, 20 Oct 2023 10:40:01 -0400
X-MC-Unique: MCa6TlxnPP2CrJLoMfsG_g-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9a9e12a3093so101697566b.0
        for <linux-media@vger.kernel.org>; Fri, 20 Oct 2023 07:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697812800; x=1698417600;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DsPiAZJZgPwsGl6SU0F7yOl3ehtjNEP4a7c/MZs69xE=;
        b=AC9lDnrAjIVAr2noxfCNOXiBT48ef3CiOve9DERbGBvmT71tFM35Q51ARUAKr6HsS5
         ALHzdSTJZopPoVL7f5RpL8PYhL5knE73ZMjDwAOJaSBAPHXAkL7g5cBpvpVcUdrVeg2A
         lxO/sVyhor1cEIZFqQFzOlxbhKcIqzTlXNhQonpoDAjS49z5r8RoxRhxrHv2Ylcx8/ah
         8eZPRaRa1auAaO3diSO5LScvYHJ7IcRENiNLI8mSEXPqUGIjqGSm41Ye5iBZpGV43nvL
         L1aEkOmHMuGDpc3wZJ/MfmOk88x30Cyc/TH+5+SJpGaDVCo0ZMb7ffYaIKF1sEDHWwRh
         LwTw==
X-Gm-Message-State: AOJu0YwE8v91QJBWNtCncvinYIw7PreLXJ4ppX75LSaTJ8thRjuDTYQo
        gVgUjBjWmk3MDrqO7yCyXn3k5dt8KpB2OmbL6lLf2jyvFLIRl6NpxxPvjggIZWkKJt72F5yhp34
        EP30OZQwiw0JwJIvz7DgQ35k=
X-Received: by 2002:a17:907:d1b:b0:9a1:aaae:8207 with SMTP id gn27-20020a1709070d1b00b009a1aaae8207mr5022560ejc.20.1697812800702;
        Fri, 20 Oct 2023 07:40:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0lJjoal3BwLxmQOQOvHkKSnhEqxZFw7Ay4R3bvqTHAYqfSJnydwPUqR8heIhibyGMQXVUAA==
X-Received: by 2002:a17:907:d1b:b0:9a1:aaae:8207 with SMTP id gn27-20020a1709070d1b00b009a1aaae8207mr5022546ejc.20.1697812800354;
        Fri, 20 Oct 2023 07:40:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u10-20020a17090657ca00b009b8dbdd5203sm1624311ejr.107.2023.10.20.07.39.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Oct 2023 07:39:59 -0700 (PDT)
Message-ID: <9d5d0bd8-41d1-4879-fccf-54e56aaa5073@redhat.com>
Date:   Fri, 20 Oct 2023 16:39:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 10/15] media: intel/ipu6: add input system driver
Content-Language: en-US, nl
To:     Andreas Helbech Kleist <andreaskleist@gmail.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>, bingbu.cao@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com
Cc:     ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        tomi.valkeinen@ideasonboard.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
 <20230727071558.1148653-11-bingbu.cao@intel.com>
 <1ce2242844b3e1348d7343b84b15dd87e0f66e6a.camel@gmail.com>
 <ea3cc241-4074-2b53-359f-360ca45a7b1f@linux.intel.com>
 <900a1efcbf29aa238f2ace788dc739e9c6ad3c26.camel@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <900a1efcbf29aa238f2ace788dc739e9c6ad3c26.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 10/20/23 12:47, Andreas Helbech Kleist wrote:
> Hi Bingbu,
> 
> On Thu, 2023-10-19 at 16:28 +0800, Bingbu Cao wrote:
>> On 10/3/23 6:13 PM, Andreas Helbech Kleist wrote:
>>> On Thu, 2023-07-27 at 15:15 +0800, bingbu.cao@intel.com wrote:
>>>
>>>> +static const struct pci_device_id isys_pci_tbl[] = {
>>>> +       { PCI_VDEVICE(INTEL, IPU6_PCI_ID) },
>>>> +       { PCI_VDEVICE(INTEL, IPU6SE_PCI_ID) },
>>>> +       { PCI_VDEVICE(INTEL, IPU6EP_ADL_P_PCI_ID) },
>>>> +       { PCI_VDEVICE(INTEL, IPU6EP_ADL_N_PCI_ID) },
>>>> +       { PCI_VDEVICE(INTEL, IPU6EP_RPL_P_PCI_ID) },
>>>> +       { PCI_VDEVICE(INTEL, IPU6EP_MTL_PCI_ID) },
>>>> +       { }
>>>> +};
>>>
>>> Unused
>>
>> Have you tried that whether isys driver can be auto-loaded w/o
>> this pci id table? It cannot on my side.
> 
> I've only tried it on my WIP IPU4 hack of this driver

Oh a IPU4 version of this driver would be very interesting,
I was actually thinking about looking into this myself
because I have a Chuwi Hi13 tablet which uses the IPU4 and
it would be nice to get the camera working there (and on
other IPU4 using devices).

Can you give some more info on your IPU4 work, e.g. :

1. Does it work?
2. Which sensor are you using it with ?
3. Which device are you testing on ?
4. Do you have a public git branch with this somewhere ?

I'm afraid that I won't have time to look into this
myself anytime soon, but I'm very interested in this.

> but I think it
> is correct for IPU6 as well. The reason is that isys_driver is an
> auxiliary_driver, so I don't think 
> 
>     MODULE_DEVICE_TABLE(pci, isys_pci_tbl);
> 
> has any effect. The PCI probe happens in ipu6_pci_probe in ipu6.c
> (because it has a pci_device_id table as well), and the isys_driver is
> probed indirectly by ipu6-bus.c.

So the MODULE_DEVICE_TABLE(pci, isys_pci_tbl) indeed does not
belong in this auxbus driver, instead it should use some sort
of auxbus MODULE_DEVICE_TABLE() to autoload based on its
auxbus modalias.

But it does have an effect, modprobe will load both the main
ipu6 driver registering the aux devices as well as this driver
based on the modalias of the PCI device because with this
MODULE_DEVICE_TABLE(pci, isys_pci_tbl); statement both drivers
match that PCI modalias.

But the correct thing to do here would be to switch to
an auxbus based MODULE_DEVICE_TABLE() for the isys driver.

Regards,

Hans




