Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1B4C63D003
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 09:01:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234293AbiK3IBH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 03:01:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234202AbiK3IBD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 03:01:03 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6FAA2EF40
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 00:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669795208;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=j2a8xmX2uqZ7NUsrGlJ+pz4pKlQs3R+YDShsHCw2aB8=;
        b=jNNQa17HSX18/sywOQlGceO1Y9wMXW1SB3lmYzNJEaqxd7B0s520ZeJ5dbohNpB8Pv0V03
        eNJda6lskbGtSFLw6kFqP8gKM2kA0BugO48CT8lSX1EU8Th/QklEECtkVsxjET+/dInoAG
        c3o/V8gXr+oWhqZ0QCYtFwcqZGBWy78=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-609-aHVvvOyCOoyhZRVWULTEdg-1; Wed, 30 Nov 2022 03:00:06 -0500
X-MC-Unique: aHVvvOyCOoyhZRVWULTEdg-1
Received: by mail-wm1-f69.google.com with SMTP id m17-20020a05600c3b1100b003cf9cc47da5so9031292wms.9
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 00:00:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j2a8xmX2uqZ7NUsrGlJ+pz4pKlQs3R+YDShsHCw2aB8=;
        b=lqvv13xlzDdt8aNlv7X0iA/OvD2UpCmHrU6fnUVGKjIpGGglorpwiC+almM1A4qnW8
         UKQp4u4NeHm4tOy4+qN1iJMUetJcrwQD4Fjx+DHrmr2C1fE/qGTchfU2HX/ZyLGEJT5Z
         NFhguHW6q1yC1JFegE4Os1R76wyw6Xq7sKmmniOitADe/VHoFS07eRTxyajFYrOX6aUt
         V+mjIfTVkBZxpGqGzl1HK7aoThKShca+4LWz7UBgXgWvrLMRTxlrephFFz8BN22xeGh6
         FiAeFFIZvFayoJm4cu32099avyGwEdE8OMcseK6QYR7yvb5r2SqeDbMrBCaKpmXFkxBU
         I/1g==
X-Gm-Message-State: ANoB5pmYt4gWQpzyLdoompyQ3Y+G90sQ38oiuaU/E4sN8m8sCmj/pWvf
        3m2yybpexyfG6P4i2lqDoTN00FLz1wXeHDhR2Nbt5afBkErmc7k1+RSDwpifUl5Mac4aXJT1VX5
        RfWDgGmVOZu9wkuTRARK6US4=
X-Received: by 2002:a05:600c:24e:b0:3c5:f9f1:f956 with SMTP id 14-20020a05600c024e00b003c5f9f1f956mr30842025wmj.50.1669795205210;
        Wed, 30 Nov 2022 00:00:05 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Ey5+o85KLpwLVMTdnP29Su8T24kkvZHNDgYMdluRgMtIMgcoctfGdxRoxGf1Zvfd2hRrQBg==
X-Received: by 2002:a05:600c:24e:b0:3c5:f9f1:f956 with SMTP id 14-20020a05600c024e00b003c5f9f1f956mr30842007wmj.50.1669795205007;
        Wed, 30 Nov 2022 00:00:05 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id c124-20020a1c3582000000b003cf894dbc4fsm1046855wma.25.2022.11.30.00.00.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 00:00:04 -0800 (PST)
Message-ID: <ebe02c21-7770-0415-096e-76a839bad154@redhat.com>
Date:   Wed, 30 Nov 2022 09:00:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 01/17] drm/tests: helpers: Move the helper header to
 include/drm
Content-Language: en-US
To:     Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     dri-devel@lists.freedesktop.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kunit-dev@googlegroups.com, linux-media@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Brendan Higgins <brendan.higgins@linux.dev>,
        =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-kernel@vger.kernel.org, David Gow <davidgow@google.com>
References: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
 <20221123-rpi-kunit-tests-v2-1-efe5ed518b63@cerno.tech>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v2-1-efe5ed518b63@cerno.tech>
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

On 11/28/22 15:53, Maxime Ripard wrote:
> We'll need to use those helpers from drivers too, so let's move it to a
> more visible location.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/tests/drm_client_modeset_test.c            | 3 +--
>  drivers/gpu/drm/tests/drm_kunit_helpers.c                  | 3 +--
>  drivers/gpu/drm/tests/drm_modes_test.c                     | 3 +--
>  drivers/gpu/drm/tests/drm_probe_helper_test.c              | 3 +--
>  {drivers/gpu/drm/tests => include/drm}/drm_kunit_helpers.h | 0
>  5 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
> index 52929536a158..ed2f62e92fea 100644
> --- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
> +++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
> @@ -8,12 +8,11 @@
>  #include <drm/drm_connector.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_drv.h>
> +#include <drm/drm_kunit_helpers.h>

I wonder if now that this header was moved outside of the tests directory,
if we should add stub functions in the header file that are just defined
but do nothing if CONFIG_DRM_KUNIT_TEST isn't enabled. So that including
it in drivers will be a no-op.

Or do you plan to conditionally include this header file in drivers? So
that is only included when CONFIG_DRM_KUNIT_TEST is enabled?

Another thing that wondered is if we want a different namespace for this
header, i.e: <drm/testing/drm_kunit_helpers.h>, to make it clear that is
not part of the DRM API but just for testing helpers.

But these are open questions really, and they can be done as follow-up:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

