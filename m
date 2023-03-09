Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5EEE6B24E5
	for <lists+linux-media@lfdr.de>; Thu,  9 Mar 2023 14:06:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbjCINGb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Mar 2023 08:06:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbjCINGa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Mar 2023 08:06:30 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B00C0B328B
        for <linux-media@vger.kernel.org>; Thu,  9 Mar 2023 05:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678367143;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iyUpIDvJNh7zX+4lqJB/HKvTjqjy+LCprs0FG5kR41o=;
        b=IQv+9jKx2n7fFP0aemHi5Mczav0Sz25mLRo0wikBiCY0LHBZNGJ/oDm+779FUxty11GLb9
        /HZ2KSerFRXI85KThMPLiSwhh+s5WDIlbmmCaJse4B92biEfzoeg8ovXJNkGG/+LCBR91U
        CUnLs/XveTXFWVlGCtKGDSXw0YuQ6yg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-fcO8jJJBNouYUlLlkpa15A-1; Thu, 09 Mar 2023 08:05:42 -0500
X-MC-Unique: fcO8jJJBNouYUlLlkpa15A-1
Received: by mail-ed1-f69.google.com with SMTP id v11-20020a056402348b00b004ce34232666so2858957edc.3
        for <linux-media@vger.kernel.org>; Thu, 09 Mar 2023 05:05:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678367141;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iyUpIDvJNh7zX+4lqJB/HKvTjqjy+LCprs0FG5kR41o=;
        b=bPJ7kXPK0PKgAcu9zoS+3lTHbgZ6LnolNPvQqPRdyEvR+rhDSj4cr2cJIgTVpuMIBe
         NBnl9K+pyGatGIB9b2gxSFybocnFHVmeZuWghir1DS84r1WgC8LA/Rv0YFgkq7i+aVn0
         wV7L3t9NyoM6iHTBToyLPNK6sormwBMMzJViTKbYKM5mZ0xOKpMkhOvyb9AA/zWUOApp
         xgWKdnDg1m5Fka80NfxUUyvHEoWDz5DSgcuHabXoz1S5PoMI3/QYzyOrwbyS9ySlqAwL
         fndRJrB5YYAMGVgYiS6lV5qZuQd8l0tJimhJ5PedeKGtuMlKMtsIG8mi4kgzTbf3/0fO
         2vXA==
X-Gm-Message-State: AO0yUKWtOYZd8tm/BKHuguYbaZbJYqxyIxw/K3PUTdK3JmCehp9pkKPE
        LP777DEckRrZriy17DU/flPZegKrEz/cOU4uH1YvLHo7k2Q8x06f5Roqa4Q+AH90dFAY8oaDMQL
        iW0woGGkBBAwPkl1Ln17hVtw=
X-Received: by 2002:a17:907:8a0c:b0:87b:3d29:2982 with SMTP id sc12-20020a1709078a0c00b0087b3d292982mr28125116ejc.11.1678367141645;
        Thu, 09 Mar 2023 05:05:41 -0800 (PST)
X-Google-Smtp-Source: AK7set+xE07jNF43XW4t8JijfVN9oIrSMG++jtDHjrvyNhDMKYKz3VSXUs924FuLR0Sk7EptCXgbSQ==
X-Received: by 2002:a17:907:8a0c:b0:87b:3d29:2982 with SMTP id sc12-20020a1709078a0c00b0087b3d292982mr28125094ejc.11.1678367141399;
        Thu, 09 Mar 2023 05:05:41 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id f3-20020a170906738300b008cf377e8795sm8847126ejl.199.2023.03.09.05.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 05:05:40 -0800 (PST)
Message-ID: <5e6671be-eb91-599e-7362-b33911141e2a@redhat.com>
Date:   Thu, 9 Mar 2023 14:05:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/1] media: v4l: subdev: Make link validation safer
Content-Language: en-US, nl
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>
References: <20230309122716.1624141-1-sakari.ailus@linux.intel.com>
 <89823804-7d23-334a-91b2-ea3c819232fd@redhat.com>
 <ZAnXe9H3xg3g/f55@kekkonen.localdomain>
 <c1c67b80-1c7b-18c1-0d42-66978910db5b@ideasonboard.com>
 <ZAnYY32TyVKyaKhb@kekkonen.localdomain>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZAnYY32TyVKyaKhb@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 3/9/23 14:00, Sakari Ailus wrote:
> On Thu, Mar 09, 2023 at 02:57:52PM +0200, Tomi Valkeinen wrote:
>> On 09/03/2023 14:56, Sakari Ailus wrote:
>>> On Thu, Mar 09, 2023 at 01:43:50PM +0100, Hans de Goede wrote:
>>>> Hi Sakari,
>>>>
>>>> On 3/9/23 13:27, Sakari Ailus wrote:
>>>>> Link validation currently accesses invalid pointers if the link passed to it
>>>>> is not between two sub-devices. This is of course a driver bug.
>>>>>
>>>>> Ignore the error but print a debug message, as this is how it used to work
>>>>> previously.
>>>>>
>>>>> Fixes: a6b995ed03ff ("media: subdev: use streams in v4l2_subdev_link_validate()")
>>>>> Reported-by: Hans de Goede <hdegoede@redhat.com>
>>>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>>>> Reported-and-tested-by: Hans de Goede <hdegoede@redhat.com>
>>>>
>>>> FWIW you have my Reported-by in there twice now ...
>>>
>>> Ah, thanks. I'll drop the first tag.
>>
>> $ git grep Reported-and-tested-by Documentation/
>> Documentation/process/maintainer-tip.rst:Please do not use combined tags, e.g. ``Reported-and-tested-by``, as
> 
> Uh-oh. Well, I'll just split that. Thanks.

This is new to me too, but good to know. I'll try to get rid of the habbit
of using the combined tags then.

Regards,

Hans


