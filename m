Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B9AC638745
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 11:20:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbiKYKUq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 05:20:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbiKYKUo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 05:20:44 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3BFA3FBAC
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 02:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669371585;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bY19rPV8ppg6ZUdn2yxRqF47aTG2fFJ0ZNtqig4Q8uo=;
        b=GKZEQYHwBtT0I7Nt6YqDVZvUfrtodsXenJ/vU/TfAbqidrwC4g67w4lmVgjR7yuWCki6u3
        +8S76Q30NhzHJJY1ATn2rvomdpHSDZHRa/u9O+W0QkJUDi0ED8CLYlGJBryEYVMJGLpWRx
        1OJjhVFps4TCNROx16mGo4SA1WkPOWY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-253-uMiZL4JLPL6Ir-i1URXy6Q-1; Fri, 25 Nov 2022 05:19:43 -0500
X-MC-Unique: uMiZL4JLPL6Ir-i1URXy6Q-1
Received: by mail-wm1-f71.google.com with SMTP id p14-20020a05600c204e00b003cf4cce4da5so1645425wmg.0
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 02:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bY19rPV8ppg6ZUdn2yxRqF47aTG2fFJ0ZNtqig4Q8uo=;
        b=PbDVWf29qrHrY6jlALmIF0S0Vp+lYjulN3GdOB0wMs6N9uyBT56fzB6vFrSedKq9Xf
         LYWwGlgSKVUL1LBiaNpsYsFdAElA8eHf+AtDpssXGKEDxtSEEK8TmruYGwDSCSU11e5K
         k5HRhRUJ4SGayBY2MywevJwSXBUQFd+/7Ap1ID79NSxBVVoILcF3uN266c3hKmWKqLDS
         W1yufeUtCAdjwO6tW0AuZh5iYu49yMJBfawqAxDHgXgPFEOgW4VQH7kiXzMzPFmRCC0+
         LIiwiBO4BP0hnMtIWKQ5BLp+U12gQ+L/4XDQvobIHDM1ausk5SMQJ5LHYMzeISI26Uxl
         Uatg==
X-Gm-Message-State: ANoB5pmGDnpUVIOZ0B1kBVSly2bZ5M/kEufRXhazKOxPALCynb/OsDjP
        LHMkx+X1jZG91KpaSHg6c1C2xPYrmCpYf1nN2Rapm68C0lLO692zmTn/qGOZDgZ8mga+JPbVjbG
        8V2aE+rYw4pmfv7Y3dg8Cqfg=
X-Received: by 2002:adf:f189:0:b0:241:bc9e:a238 with SMTP id h9-20020adff189000000b00241bc9ea238mr12437051wro.558.1669371581921;
        Fri, 25 Nov 2022 02:19:41 -0800 (PST)
X-Google-Smtp-Source: AA0mqf733o27EIhWoSlUjNsa9tcFhysJWN14yjguQxBT++y7CLSBTY7xXokXb5BEj/8z8JRbucHxIA==
X-Received: by 2002:adf:f189:0:b0:241:bc9e:a238 with SMTP id h9-20020adff189000000b00241bc9ea238mr12437025wro.558.1669371581684;
        Fri, 25 Nov 2022 02:19:41 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id u10-20020a05600c19ca00b003c5571c27a1sm6216386wmq.32.2022.11.25.02.19.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 02:19:41 -0800 (PST)
Message-ID: <68ad39a2-e47c-ffcb-34ad-ea680beac59c@redhat.com>
Date:   Fri, 25 Nov 2022 11:19:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 05/24] drm/tests: helpers: Make sure the device is bound
Content-Language: en-US
To:     Maxime Ripard <maxime@cerno.tech>,
        Maxime Ripard <mripard@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     David Gow <davidgow@google.com>, linaro-mm-sig@lists.linaro.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kselftest@vger.kernel.org,
        =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
        linux-media@vger.kernel.org, kunit-dev@googlegroups.com,
        dri-devel@lists.freedesktop.org,
        Brendan Higgins <brendan.higgins@linux.dev>,
        linux-kernel@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
 <20221123-rpi-kunit-tests-v1-5-051a0bb60a16@cerno.tech>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-5-051a0bb60a16@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/23/22 16:25, Maxime Ripard wrote:
> The device managed resources are freed when the device is detached, so
> it has to be bound in the first place.
> 
> Let's create a fake driver that we will bind to our fake device to
> benefit from the device managed cleanups in our tests.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/tests/drm_kunit_helpers.c | 60 +++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>

If I understood the platform core code correctly, the probe is always sync in
the case of platform drivers. Unless .probe_type = PROBE_PREFER_ASYNCHRONOUS is
set or a module is loaded using with the "async_probe=1" parameter. So I believe
the wait queue won't be needed. The only DRM driver that forces an async probe is
drivers/gpu/drm/hyperv/hyperv_drm_drv.c AFAICT.

So I would drop this patch from the set for now.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

