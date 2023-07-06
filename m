Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4B0B749C6A
	for <lists+linux-media@lfdr.de>; Thu,  6 Jul 2023 14:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232546AbjGFMtJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jul 2023 08:49:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232533AbjGFMsv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jul 2023 08:48:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6E2D1996
        for <linux-media@vger.kernel.org>; Thu,  6 Jul 2023 05:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688647662;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=s/FqZ+yjYq+SqbnRx8DsxvkuQOb56GSfqhNW9ZQ66wA=;
        b=IvahwDg4g6wnfa+CIGDt03lOu4FMUaajLp4nlEs6YTRMji1WAXM99nE0kjJ8NL+QKiHRVG
        wsO6F22CqvG9gZJSMC//93F//bd9xNOvfuMCZ0I92WjAWdMDCSLbudvg2s8aR4I2mRqz4o
        xQznckPNgHCJFouaMgthfJJKmmebb6I=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198-5WLJ2_fZN0CYWf7q4wdktQ-1; Thu, 06 Jul 2023 08:47:41 -0400
X-MC-Unique: 5WLJ2_fZN0CYWf7q4wdktQ-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2b703d64832so7853741fa.2
        for <linux-media@vger.kernel.org>; Thu, 06 Jul 2023 05:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688647659; x=1691239659;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s/FqZ+yjYq+SqbnRx8DsxvkuQOb56GSfqhNW9ZQ66wA=;
        b=OjNPOKfAayqQYfCBh2wq/qCZOo5kjnZapcNAm/cBsStD11wewcHWkrJ5ITuyj+6i7d
         ZbQYAIdkdmk/zHIZ1OeKHKTZfRMp7H6JoqdReoh7awbwXLXCB1/BjKGG7ndQmJ+rg9o/
         0GXkRxiibOXS1dx53NP5Um9Nre6wA2exYJ3sRNyu95+PtIsCb5Cl2mQBg8jRd/EdqFbn
         by+sWqKCvHsWXyW8SYepAzfiVmu+nXYAhjQa3b7aWaofoXblTjl+xQpYNQRgWWgi5D5W
         7EaSkMaUCdT93nEgxa7gN2OTHKvX0y4hIwHPu2NXSbMRSSOcvGFzTNZttczaNDyN/Xn1
         Twqg==
X-Gm-Message-State: ABy/qLalVGSmf3mIHUfRuoN3Zona5/9WaMNMAx6hqpnK4HfgSB+RmLlT
        lDrZFHWvVvcZrk1lXW1kQe5qkdH4q3lMSWvzE0IiaaTy+kvbN7YCb7kFTffEWMa2uvKMjcwPdrX
        KQ4+BXNVMkxfr9vuvqG3bbt4=
X-Received: by 2002:a2e:9b83:0:b0:2b6:efc7:2af7 with SMTP id z3-20020a2e9b83000000b002b6efc72af7mr1558269lji.44.1688647659666;
        Thu, 06 Jul 2023 05:47:39 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHAaA2P1ghVIslb3IzWlS/SfwCOfeySqJOcydCdvLpFkQALBSGxB6rFsA5QQIvncR+Mh1T/kQ==
X-Received: by 2002:a2e:9b83:0:b0:2b6:efc7:2af7 with SMTP id z3-20020a2e9b83000000b002b6efc72af7mr1558252lji.44.1688647659365;
        Thu, 06 Jul 2023 05:47:39 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id f15-20020a056402150f00b0051e06693590sm735007edw.91.2023.07.06.05.47.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 05:47:38 -0700 (PDT)
Message-ID: <b098d5e6-5aeb-a9e1-5f4c-6eed4b78b3fd@redhat.com>
Date:   Thu, 6 Jul 2023 14:47:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 18/18] media: atomisp: csi2-bridge: Add support for VCM
 I2C-client instantiation
Content-Language: en-US, nl
To:     Andy Shevchenko <andy@kernel.org>
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        linux-acpi@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, Hao Yao <hao.yao@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
References: <20230705213010.390849-1-hdegoede@redhat.com>
 <20230705213010.390849-19-hdegoede@redhat.com>
 <ZKaUWAAf586ZIRMF@smile.fi.intel.com>
 <500c0f9a-7b81-3c13-6da8-39245282fe46@redhat.com>
 <ZKa2qnreaCfb2Lgc@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZKa2qnreaCfb2Lgc@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 7/6/23 14:42, Andy Shevchenko wrote:
> On Thu, Jul 06, 2023 at 02:31:14PM +0200, Hans de Goede wrote:
>> On 7/6/23 12:15, Andy Shevchenko wrote:
>>> On Wed, Jul 05, 2023 at 11:30:10PM +0200, Hans de Goede wrote:
> 
>>>> +	vcm_type = kstrdup(obj->string.pointer, GFP_KERNEL);
>>>
>>> Where is the counterpart kfree()?
>>
>> The vcm-type is stored in one of the generated sw-nodes and the ipu-bridge
>> code only creates those once and them leaves them in memory, even on
>> a rmmod. So this is deliberately leaked just like that the ipu_bridge
>> struct which contains all the swnode-s is deliberately leaked by
>> ipu-bridge.c
> 
> Should we worry about those leakages?

No this is by design because removing the swnodes while e.g. a sensor
driver might still be bound to the i2c-client is trouble-some and
the callers of ipu_bridge_init check if it has already run and then
skip calling it.

So after a rmmod + modprobe of the atomisp / ipu3-cio2 driver
ipu_bridge_init() will not get called a second time. Instead
the old swnodes (1) which are already set as secondary fwnodes for
the sensor and bridge devices are re-used.

Regards,

Hans


1) + the properties they contain

