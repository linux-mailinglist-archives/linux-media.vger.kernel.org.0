Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF6A63EE0A
	for <lists+linux-media@lfdr.de>; Thu,  1 Dec 2022 11:39:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230300AbiLAKjY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Dec 2022 05:39:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbiLAKjW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Dec 2022 05:39:22 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68B1F54465
        for <linux-media@vger.kernel.org>; Thu,  1 Dec 2022 02:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669891113;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=10Al1tSX1JNmT1W2eYBPU7HPfHOrdNXuqygGPStHWlc=;
        b=WytJe5b9dZZOf14CVQbSwOdtp4ZeLvSbTYtwvy+DKrArVSXU1aVTQ9H2pCTjU4rWVzA1NG
        755nZrP2BN6DNJur/uUTxlu16/f4g7PHXMVnxmMZt9ZFonmW16FNjXhCAd2LPkhMi4IHfF
        eTkJkKTldV3WStqyHsDelQ4U6epU5jU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-489-BIfy8aqGNA2OOdZij_KhUg-1; Thu, 01 Dec 2022 05:38:32 -0500
X-MC-Unique: BIfy8aqGNA2OOdZij_KhUg-1
Received: by mail-wr1-f71.google.com with SMTP id l9-20020adfa389000000b00241f907e102so282979wrb.8
        for <linux-media@vger.kernel.org>; Thu, 01 Dec 2022 02:38:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=10Al1tSX1JNmT1W2eYBPU7HPfHOrdNXuqygGPStHWlc=;
        b=QARLONZWKzxIw5Y9Isafvg+IDzPh0H6oAxil+WAwgYDLeCyUg5aOn6DVD0XPeVXjtD
         iTeesyhCRqgt54+LPzHEo/PVyhgD13FCmViClLqb6MHbcAONYdA4bZS7tiCKqHfw9sOb
         vC3twlFzUS8tz2Ny/Zy41uq6fIJh2hYklVkcjIGJBXVhHoP3Tksri5Iiwn8o6TlP9u1g
         B6DTjj8vx5dvM5BRdcNvgzf+SraiR6heTrDXUyOAfeyzhgM/0MTFIBVE/7dU9mQey40m
         XzPC9CNr7m3S186lBPH3v9mb3lRepx8bf3UWIRb0XfFXy1reu4nP8YaREFv23v4pjRW7
         Pq8w==
X-Gm-Message-State: ANoB5pns7Mj5cbnJgdyFaprHpvhDEUuUVBQy//yKJ0smkGtubWSRMaRO
        ULEwAz+EOABolCVX5RxzeI5wkHW/EbMvtgmJQm139+F9II3lBaLeO1/htzI0WBMAlHAhlfWpjnj
        wUjfZYqGbhQHu4lpK69ZYODc=
X-Received: by 2002:a5d:43c9:0:b0:236:78d0:5223 with SMTP id v9-20020a5d43c9000000b0023678d05223mr41643009wrr.250.1669891111396;
        Thu, 01 Dec 2022 02:38:31 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6KufTftndeSFnuJj0ww4Bi4u4dwK5MuxmTqCH6QTPyZEYTXUnzD5dmnVqEGF5aWgQYEpubqQ==
X-Received: by 2002:a5d:43c9:0:b0:236:78d0:5223 with SMTP id v9-20020a5d43c9000000b0023678d05223mr41642998wrr.250.1669891111156;
        Thu, 01 Dec 2022 02:38:31 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id fc13-20020a05600c524d00b003d04e4ed873sm10098252wmb.22.2022.12.01.02.38.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 02:38:30 -0800 (PST)
Message-ID: <31192e08-3d83-6fb0-06b0-51d50d073abc@redhat.com>
Date:   Thu, 1 Dec 2022 11:38:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 01/17] drm/tests: helpers: Move the helper header to
 include/drm
Content-Language: en-US
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        David Airlie <airlied@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kunit-dev@googlegroups.com, linux-media@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Brendan Higgins <brendan.higgins@linux.dev>,
        =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-kernel@vger.kernel.org, David Gow <davidgow@google.com>
References: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
 <20221123-rpi-kunit-tests-v2-1-efe5ed518b63@cerno.tech>
 <ebe02c21-7770-0415-096e-76a839bad154@redhat.com>
 <20221201102756.cdvxu4iryhu3rjpf@houat>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221201102756.cdvxu4iryhu3rjpf@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Maxime,

On 12/1/22 11:27, Maxime Ripard wrote:

[...]

>>
>> I wonder if now that this header was moved outside of the tests directory,
>> if we should add stub functions in the header file that are just defined
>> but do nothing if CONFIG_DRM_KUNIT_TEST isn't enabled. So that including
>> it in drivers will be a no-op.
>>
>> Or do you plan to conditionally include this header file in drivers? So
>> that is only included when CONFIG_DRM_KUNIT_TEST is enabled?
> 
> I'm not entirely sure. I'd expect only the tests to include it, and thus
> would depend on DRM_KUNIT_TEST already. But we can always add the stubs
> if it's ever included in a different context.
> 
>> Another thing that wondered is if we want a different namespace for this
>> header, i.e: <drm/testing/drm_kunit_helpers.h>, to make it clear that is
>> not part of the DRM API but just for testing helpers.
> 
> If there's a single header, I don't think we need to create the
> directory. This is also something we can consolidate later on if needed.
>

Agree on both. It's better to land as is and then figure out if needs
to be changed once other drivers add more tests.
 
>> But these are open questions really, and they can be done as follow-up:
>>
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> Thanks :)

You are welcome!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

