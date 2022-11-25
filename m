Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A6D7638622
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 10:26:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbiKYJ0q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 04:26:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbiKYJ00 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 04:26:26 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE42C2AE07
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 01:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669368331;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PdoQUUexZ7ga7BmgL2KbubMH7KSrCAhYA4sosdJ8U/Q=;
        b=giVqJNnwSpAmIsy5HDtDQGT3+bBWEA8OgflXYS1O/0SdAGqnYYt+bsNx/APK4UFk7j2or7
        DtRUkIN4IqTkKhYJURUGtRRCx5NZ8r0v9T/XOj5Y7U/pzJ/3hKoivblPIy7blRxO9n4k38
        8YHfW+7eV3ZAbTvXG5qJD3BCegmIwBo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-187-ZlO90_CzMGqjXD4d1MSRiw-1; Fri, 25 Nov 2022 04:25:29 -0500
X-MC-Unique: ZlO90_CzMGqjXD4d1MSRiw-1
Received: by mail-wm1-f69.google.com with SMTP id x10-20020a05600c420a00b003cfa33f2e7cso2168133wmh.2
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 01:25:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PdoQUUexZ7ga7BmgL2KbubMH7KSrCAhYA4sosdJ8U/Q=;
        b=e5QSs0rKK6i+OvCGDx/UL7vZ9xMsXUIUNRdueoRnABxL7F/sInpB+xwL1OdUBTEtHO
         Ys2o3N7jntHGPI0nY1qyPUnUfnCxpa80MCqy0Ek6beM6TNvQ5Sm/tVN+G++FMD12esjs
         dzgHXhi3IUOwNJ0CUnos6Ugny6CUzLtglYWHXZjH0A6xKYG/D7xXnonrjk8UU37WOR0+
         j8J760a6N96tn9sKseV/+/2D2xunKczwRy1Sf9Trnq8jOKjhXkOENN8C2ZKUKMJpTZ9N
         k1Od4s/KtuFIISroGhRqPKjEp7IrwpmOc1lacEYMJDS1hxQE9VQyCeCZ+R5FP3pp1HmQ
         YITw==
X-Gm-Message-State: ANoB5pn0Ooacbw7vOEF4cQFN/ujpwFpsbLshMmPE3qpHHqAz7yBanEfF
        wr+ZM4UG0EhH0btIT7IJOkhb6hi4P20UUDmHPUcQAuROUdpWDCC0TJKPUd8te7+Fw5jJme9ptX7
        uwTVHPzGlj1NCyitV1CUAq9c=
X-Received: by 2002:a05:600c:3501:b0:3c7:4f0:77b3 with SMTP id h1-20020a05600c350100b003c704f077b3mr13270559wmq.93.1669368328284;
        Fri, 25 Nov 2022 01:25:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4vxRVWps62Nub/Y/bXYoNoPFQkcrqfFgC4Xw+JywmVH37euSYEJ8/pRQ9JWKoQwlq2n7w9Uw==
X-Received: by 2002:a05:600c:3501:b0:3c7:4f0:77b3 with SMTP id h1-20020a05600c350100b003c704f077b3mr13270533wmq.93.1669368328022;
        Fri, 25 Nov 2022 01:25:28 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id b17-20020a5d4b91000000b0024207478de3sm664177wrt.93.2022.11.25.01.25.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 01:25:26 -0800 (PST)
Message-ID: <56cbef35-da0e-d278-fef5-83b0944ed416@redhat.com>
Date:   Fri, 25 Nov 2022 10:25:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 04/24] drm/tests: helpers: Switch to a platform_device
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
 <20221123-rpi-kunit-tests-v1-4-051a0bb60a16@cerno.tech>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-4-051a0bb60a16@cerno.tech>
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
> The device managed resources are ran if the device has bus, which is not
> the case of a root_device.
> 
> Let's use a platform_device instead.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/tests/drm_kunit_helpers.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> index 2f974f45c5b4..651aa93a98a8 100644
> --- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
> +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> @@ -6,6 +6,7 @@
>  #include <kunit/resource.h>
>  
>  #include <linux/device.h>
> +#include <linux/platform_device.h>
>  
>  #include "drm_kunit_helpers.h"
>  
> @@ -20,12 +21,26 @@ static const struct drm_mode_config_funcs drm_mode_config_funcs = {
>  
>  struct device *drm_kunit_helper_alloc_device(struct kunit *test)
>  {
> -	return root_device_register(FAKE_DEVICE_NAME);
> +	struct platform_device *pdev;
> +	int ret;
> +
> +	ret = platform_driver_register(&fake_platform_driver);

Maybe the platform_driver_register() is something that should be done
in the drm_client_modeset_test_init() callback ?

I would also as a part of this series rename the kunit_suite from
"drm_test_pick_cmdline_test_suite" to "drm_test_modeset_test_suite"
or something like that. Since you are already setting the .init and
.exit callbacks to allocate and release the devices. So it is more
than just a test suite for cmdline params testing.

> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	pdev = platform_device_alloc(FAKE_DEVICE_NAME, PLATFORM_DEVID_NONE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
> +
> +	ret = platform_device_add(pdev);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	return &pdev->dev;
>  }
>

Probably won't do it as a part of this series to avoid making it cross
subsystem, but I think there's room to further consolidation since this
helper seems to be quite generic and something that would be useful for
other subsystems. So it would make sense for kunit to have helpers to
manage platform drivers and devices.

In fact, I see that drivers/base/test/test_async_driver_probe.c already
has similar helpers that could be exposed to the rest of the kernel.

The patch looks good to me though and any of these changes could be done
as a follow-up:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

