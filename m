Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4407C6388D1
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 12:33:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbiKYLdQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 06:33:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbiKYLdO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 06:33:14 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DFDCEE3D
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 03:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669375943;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VsGy2+SrkApv7QX3F61FbC2SPRAOik8DhfKcdY40dBI=;
        b=XLGa/PlxlbWm7ybOXLUt+g55fnBvcW9mnXetQpFFiuvO8sgIgL7tIV8TDYushOo+H2ICyB
        /eFxTnp9NLYLKIXKg50PULbMoOhGIC8JEpWGoWFnQd6TXdWfnQdQsJfrrmlDh1sMlCKytc
        QGPsWckLAHUmtQTvvt83OHVjYHzpWoA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615-4DAMMi0pNO2fUVMaGDEwTA-1; Fri, 25 Nov 2022 06:32:19 -0500
X-MC-Unique: 4DAMMi0pNO2fUVMaGDEwTA-1
Received: by mail-wr1-f70.google.com with SMTP id h10-20020adfaa8a000000b0024208cf285eso98088wrc.22
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 03:32:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VsGy2+SrkApv7QX3F61FbC2SPRAOik8DhfKcdY40dBI=;
        b=hS6IxgFIWDBEYCnJqtz1ID6O4TRmXjwG2Az0A9uQ3tmrvK21NxFAG9cVV2QhDuDhqv
         mYBjoW+5XGlQHMu6jxf5HddT8GDHq7KsNL50cEYBNUQnk3aA+EfQ7jCE4dd44gQc0Qe+
         OMvO/VaVpm3kw3l4IUuBznpaWfeyicKD4oE44aQma5e9pIGRyG/TZWhNqrMpsVEsx1bY
         ZBd6t/yeQmHxyqK5yK1WxYwMl212ezA7szZcLkM4OFLKCdGer2iGODgAtE8aSpcfgaFp
         8YFAy6Ia9SsNdt/5+zSnnOfAt/weJLJGAmieZSgJ5vpRw48u+PX9an0fMKb3F3xByT4y
         9/vQ==
X-Gm-Message-State: ANoB5pm2OhdqYw1rbeBmJf2GwHJC+ZxihD5SVNq3khyyDQKK0IJFgby3
        5PKzJozwTY2nf5ae0wgHSzSezL55mfWkaLNL/jl2m7B+Ns35U/7el5rSQsYLgosrqkzBF5RV5lx
        gVKuWtxTRzLFjLx05qFC7/5Q=
X-Received: by 2002:a05:600c:246:b0:3cf:760a:fbaf with SMTP id 6-20020a05600c024600b003cf760afbafmr14987948wmj.110.1669375938633;
        Fri, 25 Nov 2022 03:32:18 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5OsbzQLyftwLIWI3nDfrRG5jE1JPupjLhaA0WX3eVwlG57KKybql+K8IcZ8fhxJNc3nhLhqQ==
X-Received: by 2002:a05:600c:246:b0:3cf:760a:fbaf with SMTP id 6-20020a05600c024600b003cf760afbafmr14987919wmj.110.1669375938413;
        Fri, 25 Nov 2022 03:32:18 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id x10-20020a05600c21ca00b003a6125562e1sm4484075wmj.46.2022.11.25.03.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 03:32:17 -0800 (PST)
Message-ID: <171d89b4-fbd9-8df8-5250-5fabd1973960@redhat.com>
Date:   Fri, 25 Nov 2022 12:32:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 20/24] drm/vc4: crtc: Provide a CRTC name
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
 <20221123-rpi-kunit-tests-v1-20-051a0bb60a16@cerno.tech>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-20-051a0bb60a16@cerno.tech>
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

On 11/23/22 16:26, Maxime Ripard wrote:
> It's fairly hard to figure out the instance of the CRTC affected by an
> atomic change using the default name.
> 
> Since we can provide our own to the CRTC initialization functions, let's
> do so to make the debugging sessions easier.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 10 +++++++++-
>  drivers/gpu/drm/vc4/vc4_drv.h  |  2 ++
>  drivers/gpu/drm/vc4/vc4_txp.c  |  1 +
>  3 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index 8bc30ad0904b..59e473059fa2 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -1118,6 +1118,7 @@ static const struct drm_crtc_helper_funcs vc4_crtc_helper_funcs = {
>  
>  static const struct vc4_pv_data bcm2835_pv0_data = {
>  	.base = {
> +		.name = "pixelvalve-0",

I wonder if would make sense to add the SoC name too, but either way:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

