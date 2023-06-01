Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02D877195B6
	for <lists+linux-media@lfdr.de>; Thu,  1 Jun 2023 10:36:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232350AbjFAIg0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jun 2023 04:36:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231439AbjFAIfq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jun 2023 04:35:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F12B1E62
        for <linux-media@vger.kernel.org>; Thu,  1 Jun 2023 01:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685608419;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=x3eTbQbDDM0TVJI2q9CCZlJmje2SWQlIPH+HPIdVlJE=;
        b=EKOvNKmIUsR6KgNbHT90AxF6G5REOm8cUC+notRrlc8RQ/hiy0HcwW2uMnsAnaK/5mjhwY
        Mk8pjRxQzPALX+gOhu1CHglJVH9VTwRRgI++I0VBXNBjaaN1SBBnifHjfrFr0xZVauerjv
        V8+uZw6sVeDPwwKUXXzz7xCYwlgSwcY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-FY06RKskO5aBjQ3sTL_1Rg-1; Thu, 01 Jun 2023 04:33:38 -0400
X-MC-Unique: FY06RKskO5aBjQ3sTL_1Rg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9744659b7b5so38699466b.3
        for <linux-media@vger.kernel.org>; Thu, 01 Jun 2023 01:33:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685608417; x=1688200417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x3eTbQbDDM0TVJI2q9CCZlJmje2SWQlIPH+HPIdVlJE=;
        b=gX3rrQOo7tX/xu6TJDDfH1ka8O20zfvPP+gnmcysY1a2ioEkp9FylnKaS3UmdjJl8k
         nVY1uIh7i0TpAx5pvhohmEMYgQdVhPND4Ct2pSYevnUEWW/zS/t2bDVMRDdtfS0HPThi
         RLVNgH0l66umwxUZbFmB8bsMtRdtYPkaQiu0XpwCSOjaVEcrTnj9gCZ3fNe4P3xejgiO
         zuzF9dNCP1w4cotc99Crwm0oYnXKvUZdEKL2fFK6XPmqXzRQjya4S10putzcQVO7yZPS
         U5Gh7KpvtgU86uvPf/IVqNtAClsMNbomG0Q+G+KwCcCTQFFwkrkCPHepZwRexzScIgzh
         9QZg==
X-Gm-Message-State: AC+VfDxFL1K1QN6jkqG5A7nuoiEtuy8kUWpwCiXSYG9B2mLd4QPJ3x9K
        enuOJqqz1kbd6+qjDZ/VFlieQxMGdxL9miQvlPMjNYHe8o94l1tiRQiz1s/JL0xXAyuXDUnJqYc
        FowbqbclET29NtfcUZNZZB54=
X-Received: by 2002:a17:907:168c:b0:973:dd61:d427 with SMTP id hc12-20020a170907168c00b00973dd61d427mr3862754ejc.66.1685608416982;
        Thu, 01 Jun 2023 01:33:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4JM9RzyqbodQJgPbI8rbyO2ezKuijiFWSI2bBq4x0g+lpo1VOfEFy7K0dEU8LSZndKwud2Ow==
X-Received: by 2002:a17:907:168c:b0:973:dd61:d427 with SMTP id hc12-20020a170907168c00b00973dd61d427mr3862741ejc.66.1685608416697;
        Thu, 01 Jun 2023 01:33:36 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ss7-20020a170907038700b0096a2eaa508asm10160658ejb.168.2023.06.01.01.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 01:33:36 -0700 (PDT)
Message-ID: <88bfdd38-d128-4653-9792-b16bc32f972b@redhat.com>
Date:   Thu, 1 Jun 2023 10:33:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/3] platform/x86: int3472: Add ov13b10 (09B13) sensor
 module support
To:     Dan Scally <dan.scally@ideasonboard.com>, bingbu.cao@intel.com,
        djrscally@gmail.com, hao.yao@intel.com
Cc:     markgross@kernel.org, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        bingbu.cao@linux.intel.com
References: <20230524035135.90315-1-bingbu.cao@intel.com>
 <20230524035135.90315-3-bingbu.cao@intel.com>
 <745f5335-b849-52da-f3e2-52cb1f4d1bd6@redhat.com>
 <e424987d-f7c2-4c08-eacc-67192453a78c@ideasonboard.com>
 <7fc1a3fb-d300-de09-1e0d-606971560fc1@redhat.com>
 <8183d5d6-8707-1ebb-4c47-49f35483fdc5@ideasonboard.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <8183d5d6-8707-1ebb-4c47-49f35483fdc5@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

On 5/31/23 21:34, Dan Scally wrote:
> Hi Hans
> 
> On 31/05/2023 16:34, Hans de Goede wrote:

<snip>

>> I think what we need is for the sensor drivers to use standardized supply-names, so pick one of "avdd" or "vdda" and use that everywhere.
>>
>> This will require some compat code in some of the sensor drivers to try the old supply name if the new standardized supply name fails (easy when using the bulk regulator API, one of the 2 will just become a dummy regulator), but I believe that in the long run this is the best solution.
>>
>> Like how we also have all the sensor driver standardized on using "powerdown" and "reset" as GPIO con-ids.
> 
> I agree that this is ideal long term yes - I'll change the ov7251 to that effect.

Ack.

<snip>

>> I was sorta hoping to also test this on a miix510, but upon checking I saw that the mainline ov2680.c does not yet work on the miix510. Porting my atomisp-ov2680.c changes should get us close to having the standard ov2680.c work on the miix510 (ACPI enumeration, runtime-pm and selection API support will all be added).
> 
> 
> That would be nice. The ov2680 on a Miix510 is the sensor I was originally trying to get working, a very long time ago. I had a tree that "worked" in that you could stream with it but it was very ugly, as I had no idea what I was doing at the time and swiftly got the Surface instead and so moved on to that. The references to OV2680 in the CIO2/INT3472 code are hangovers from that early support really.
> 
>>
>> I have recently bought a second hand miix 510. Long story short: Can you give me some quick instructions, or a docs pointer for testing a new sensor with libcamera ?  Or preferably I guess first outside of libcamera just grabbing raw-bayer + some userspace debayer tool for testing and then later on test under libcamera ?
> 
> 
> Outside of libcamera is a case of configuring the formats and then grabbing frames from the CIO2's devnode, then queuing those frames to the IPU3's input devnode. The easiest way to do it is using the ipu3 utils within the libcamera project, which don't actually use the library itself but rather just configure with media-ctl and capture with yavta. See [1] and [2] for example. Testing within libcamera requires that the driver meet libcamera's requirements [3] which mostly means ensuring it has the 5 mandatory controls, plus some targets for the .get_selection() callback - I can't remember exactly which ones but I think it's CROP, NATIVE_SIZE, CROP_BOUNDS and CROP_DEFAULT. And I think it would also need an entry adding right at [4] to describe the sensor for libcamera. After that the cam tool from libcamera should list it with cam -l and capture from it with cam -cN --capture, or alternatively qcam would display the stream.
> 
> 
> [1] https://git.libcamera.org/libcamera/libcamera.git/tree/utils/ipu3/ipu3-capture.sh
> 
> [2] https://git.libcamera.org/libcamera/libcamera.git/tree/utils/ipu3/ipu3-process.sh
> 
> [3] https://git.libcamera.org/libcamera/libcamera.git/tree/Documentation/sensor_driver_requirements.rst
> 
> [4] https://git.libcamera.org/libcamera/libcamera.git/tree/src/libcamera/camera_sensor_properties.cpp#n140

Thank you for the testing instructions. I will give this a try once I have all the recent atomisp
improvements ported to the main ov2680 driver and I have the main ov2680 driver working with the atomisp.

>> More p.s. :
>>
>> Dan what about: https://patchwork.kernel.org/project/platform-driver-x86/patch/20230311223019.14123-1-dan.scally@ideasonboard.com/ and my remarks on that patch from you ?
> 
> 
> That one completely fell off my radar - sorry about that. I can pick it up again in the morning.

Note I send a another reply in that thread yesterday with an alternative suggestion for fixing this (I would like to not have to add any GPIO remapping stuff in INT3472 when possible, IMHO the sensor drivers should be patched to use the right con-ids where possible).

Regards,

Hans


