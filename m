Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A750B7D6542
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 10:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232720AbjJYIgg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 04:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232281AbjJYIgf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 04:36:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFE7B184
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 01:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698222949;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NQpjKAdRMCsBLBzO7RdMS7bySUCko7AFx9f7Fqo+gtU=;
        b=GFISMFUlAWOnwMmbpbIr3eD2k5lfHId+X+CaekvMHoLp88eZXl386iy40vXqDPJKWJeLLY
        M6Xs2xpV/rZGtayvrQkC0BpiJb/sVSiEANiT1m90O7s2oRemV0J5O29+Qi1T/vSh2nS9ZS
        5eJOK26DAszGK2C7ajZmknItR+jEkI0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-IifuQW1ZMBqXigbcZKmycg-1; Wed, 25 Oct 2023 04:35:47 -0400
X-MC-Unique: IifuQW1ZMBqXigbcZKmycg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9c75886c044so299705966b.2
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 01:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698222946; x=1698827746;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NQpjKAdRMCsBLBzO7RdMS7bySUCko7AFx9f7Fqo+gtU=;
        b=KAHa/JymATJjb6wGi/qWP8iglnke9XRfgH8DGotm/sSI/TzeF8UyWHUiK9ldoivFcs
         vNE8Skf8Ebl4yhuaQE42GY7eWB+EFDJCvMCZBKA8rgM/5/mc4g1Kh3Si0ZhDVhepN11N
         HFJxRGv4VJ/YsVNilhvxSvalO7O+Va/dEoNR4mk9cz8fhzhRwgotAekv6Cp5IkzaJrDx
         DXfk1kups6evRSdYo01JIPFn0GLLN3Xz+9pi8NRDLxJO4JOX/XNOso0FlUwfiljSH0RU
         7Jy7pceBx6TMrbOET8t9uUElCNZjQJ/m6wv9q1vUhO6bc8Awt8g3BGW7SkNG5XR1OtOk
         Y3TQ==
X-Gm-Message-State: AOJu0YyfibxpdhMk60BdqThnSFkBIFLtID8vJcbTEnPoLzTsndXcdckJ
        zrTkRV6DV9ONmWKIQ+YxrZY+EkAoMGYddsdLfNfSxqRb4Qxjz5ruui8GbH+Hq+A1NFuHyFZefip
        KqvPc+djkFAekDKfcmNSYRg4=
X-Received: by 2002:a17:907:7295:b0:9bf:30e8:5bf9 with SMTP id dt21-20020a170907729500b009bf30e85bf9mr12383653ejc.4.1698222946371;
        Wed, 25 Oct 2023 01:35:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTO70h0Fw/aP+4ilrx0l68JEVgSRo3WH/vwl6KlxP+zGWZ8bJb3+iWB+baeRhCobSUDQhanA==
X-Received: by 2002:a17:907:7295:b0:9bf:30e8:5bf9 with SMTP id dt21-20020a170907729500b009bf30e85bf9mr12383638ejc.4.1698222946028;
        Wed, 25 Oct 2023 01:35:46 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n17-20020a170906089100b009c3f8f46c22sm9479739eje.77.2023.10.25.01.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 01:35:45 -0700 (PDT)
Message-ID: <68d38228-ff0f-d61f-1651-593f2a3945ae@redhat.com>
Date:   Wed, 25 Oct 2023 10:35:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 02/15] media: intel/ipu6: add IPU auxiliary devices
To:     Bingbu Cao <bingbu.cao@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        bingbu.cao@intel.com
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, ilpo.jarvinen@linux.intel.com,
        andreaskleist@gmail.com, claus.stovgaard@gmail.com,
        tfiga@chromium.org, senozhatsky@chromium.org,
        tomi.valkeinen@ideasonboard.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <20231024112924.3934228-3-bingbu.cao@intel.com>
 <ZTe/WBM/kPB+GWKk@smile.fi.intel.com>
 <3da91870-641a-e0fb-1135-b592d5ca3373@linux.intel.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <3da91870-641a-e0fb-1135-b592d5ca3373@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 10/25/23 09:14, Bingbu Cao wrote:
> Andy,
> 
> Thanks for your review.
> 
> On 10/24/23 8:58 PM, Andy Shevchenko wrote:
>> On Tue, Oct 24, 2023 at 07:29:11PM +0800, bingbu.cao@intel.com wrote:
>>> From: Bingbu Cao <bingbu.cao@intel.com>
>>>
>>> Even the IPU input system and processing system are in a single PCI
>>> device, each system has its own power sequence, the processing system
>>> power up depends on the input system power up.
>>>
>>> Besides, input system and processing system have their own MMU
>>> hardware for IPU DMA address mapping.
>>>
>>> Register the IS/PS devices on auxiliary bus and attach power domain
>>> to implement the power sequence dependency.
>>
>> ...
>>
>> Seems again poor / random list of header inclusions...
>> Please, go through your files and use IWYU (Include What You Use) principle
>> in them.
>>
>>> +#include <linux/pci.h>
>>
>> auxiliary_bus.h, err.h, list.h, mutex.h, dev_printk.h, slab.h, dma-mapping.h are missing.
>> You are lucky it does compile.
> 
> auxiliary_bus.h is included in ipu6-bus.h, list.h, mutex.h dev_printk.h are
> included in device.h, dma-mapping.h and scatterlist.h are included in pci.h.
> 
> I am a little confused about the rule, do you mean we need include the
> generic headers we need even it is included in others header?

Yes you must *not* rely on other headers including headers from
which you directly use symbols.

People are working on reducing the number of includes inside headers
to speed up building the kernel because including unnecessary headers
inside another header has a big impact on build time.

Regards,

Hans





> 
>>
>> ...
>>
>>> +#ifndef IPU6_BUS_H
>>> +#define IPU6_BUS_H
>>> +
>>> +#include <linux/auxiliary_bus.h>
>>
>> ...Especially for headers which will affect the compilation time.
>>
>>> +#include <linux/pci.h>
>>
>> This is not used.
> 
> Do you mean it just need a 'struct pci_dev;' ?
>>
>> ...
>>
>>> +	struct list_head list;
>>
>> + types.h
>>
>>> +	struct sg_table fw_sgt;
>>
>> + scatterlist.h
>>
>>> +	dma_addr_t pkg_dir_dma_addr;
>>
>> types.h
>>
>> ...
>>
>>> +struct ipu6_auxdrv_data {
>>> +	irqreturn_t (*isr)(struct ipu6_bus_device *adev);
>>> +	irqreturn_t (*isr_threaded)(struct ipu6_bus_device *adev);
>>
>> irqreturn.h
>>
>>> +	bool wake_isr_thread;
>>> +};
>>
>> ...
>>
>>> +#define to_ipu6_bus_device(_dev) container_of(to_auxiliary_dev(_dev), \
>>> +					      struct ipu6_bus_device, auxdev)
>>> +#define auxdev_to_adev(_auxdev) container_of(_auxdev, \
>>> +					     struct ipu6_bus_device, auxdev)
>>
>> container_of.h
>>
>> Also, can you reformat to be more readable like
>>
>> #define auxdev_to_adev(_auxdev)					\
>> 	container_of(_auxdev, struct ipu6_bus_device, auxdev)
> 
> Ack.
> 
>>
>>> +#define ipu6_bus_get_drvdata(adev) dev_get_drvdata(&(adev)->auxdev.dev)
>>
>> device.h
>>
>> ...
>>
>>> +	ret = dma_set_max_seg_size(&pdev->dev, UINT_MAX);
>>> +	if (ret)
>>> +		return dev_err_probe(&pdev->dev, ret,
>>> +				     "Failed to set max_seg_size\n");
>>
>> With the help of
>>
>> 	struct device *dev = &pdev->dev;
>>
>> this and other lines become neater
>>
>>
>> 	ret = dma_set_max_seg_size(dev, _DMA_SEGMENT_SIZE); // as I commented earlier about
>> 	if (ret)
>> 		return dev_err_probe(dev, ret, "Failed to set max_seg_size\n");
> 
> Ack.
> 
>>
> 

