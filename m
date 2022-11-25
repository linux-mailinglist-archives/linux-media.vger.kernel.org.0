Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5816387F0
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 11:53:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbiKYKxn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 05:53:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230313AbiKYKxf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 05:53:35 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9416115FD1
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 02:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669373560;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=n34PtEGmQl2cURfa8hQ8Z0O727ShHGnHNNaASPtHi8s=;
        b=Lw3W5xY95be4kkjKzcm0VpPLxb6OzLO0mPdwGG5CoTfaiQOGSy07/wvNmA5y55dldK9pGu
        40vkrYMBF1wg6B0ztgByTMENp5a9BBaoz8YEtj+XG/1zItgIL5kLvdkicXBUGw23Wakp7q
        +eYWj8sxHBfXXdINKLgSeSfPny6Hyag=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-480-gyN6ASQ4OQSqwW2fjEh2Lw-1; Fri, 25 Nov 2022 05:52:39 -0500
X-MC-Unique: gyN6ASQ4OQSqwW2fjEh2Lw-1
Received: by mail-wm1-f70.google.com with SMTP id f1-20020a1cc901000000b003cf703a4f08so1670151wmb.2
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 02:52:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n34PtEGmQl2cURfa8hQ8Z0O727ShHGnHNNaASPtHi8s=;
        b=ku6ZcBu09Ya3TU6pt0JTj0F5Nw0bzJXNcNwh4FFYJJz9ONLuE8YnNWMsUl3GJdbCqJ
         +iSVRCgJVWr/lnTnyz/qu3mtdcC9wZomEmWO2QQaXgDImUVLZk+PsJTc9NgfqDsih0tD
         F3MElx82ZWVh1Mr12T5C2bxDnvKU72F3vBD0K1NETnv7x7sG5FT//Ez25OQJTXepbxl0
         5xnW+0woCxrOaNAjikv7snMrVa81ecfmqZ4H8lAcVlCXMhDZ2VtE0YvKVThVC4VKNWua
         6Vv5P1w9Ml1M0uJbYQ6IM8L/ZkJOKdalK1zXpsoUCxMvVMTp+Naq0lWuXwBWLoGQs9H+
         zFiA==
X-Gm-Message-State: ANoB5plTBGANKFqocqun2WspLrpKfOoz0raFL6UgQkORdym/SdW0vLvZ
        DN/vJaMjDn57efetFbL0fshyphMZAwLDbooCR0cm2skDXHQ8fBLFT4+ZYI+ywhbzEmmIwfIIGSL
        6cs8xLQHWheeoyg7YxwuBibM=
X-Received: by 2002:a5d:4090:0:b0:241:f675:c8cf with SMTP id o16-20020a5d4090000000b00241f675c8cfmr6482883wrp.480.1669373557802;
        Fri, 25 Nov 2022 02:52:37 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7YGj/u+vP3B6vxPKX/gUeG9Vi/HtdJMIkrGamAVZQ8SKuDoVi0lFd+x2jy0Z4gG5Pm/rZvXw==
X-Received: by 2002:a5d:4090:0:b0:241:f675:c8cf with SMTP id o16-20020a5d4090000000b00241f675c8cfmr6482859wrp.480.1669373557617;
        Fri, 25 Nov 2022 02:52:37 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id t2-20020a5d42c2000000b0023662d97130sm3426522wrr.20.2022.11.25.02.52.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 02:52:37 -0800 (PST)
Message-ID: <222411cb-0942-8b14-8f6d-e0184233cebb@redhat.com>
Date:   Fri, 25 Nov 2022 11:52:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 08/24] drm/tests: Add a test for DRM managed actions
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
 <20221123-rpi-kunit-tests-v1-8-051a0bb60a16@cerno.tech>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-8-051a0bb60a16@cerno.tech>
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
> DRM-managed actions are supposed to be ran whenever the device is
> released. Let's introduce a basic unit test to make sure it happens.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/tests/Makefile           |  1 +
>  drivers/gpu/drm/tests/drm_managed_test.c | 68 ++++++++++++++++++++++++++++++++
>  2 files changed, 69 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
> index b29ef1085cad..35962c6ef0c4 100644
> --- a/drivers/gpu/drm/tests/Makefile
> +++ b/drivers/gpu/drm/tests/Makefile
> @@ -9,6 +9,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
>  	drm_format_test.o \
>  	drm_framebuffer_test.o \
>  	drm_kunit_helpers.o \
> +	drm_managed_test.o \
>  	drm_mm_test.o \
>  	drm_plane_helper_test.o \
>  	drm_rect_test.o
> diff --git a/drivers/gpu/drm/tests/drm_managed_test.c b/drivers/gpu/drm/tests/drm_managed_test.c
> new file mode 100644
> index 000000000000..4fc11b289d9e
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/drm_managed_test.c
> @@ -0,0 +1,68 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_managed.h>
> +
> +#include <kunit/resource.h>
> +
> +#include <linux/device.h>
> +
> +#include "drm_kunit_helpers.h"
> +
> +#define TEST_TIMEOUT_MS	100
> +

Why did you choose this timeout value? Maybe we can add some comments
explaining the rationale.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

