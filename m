Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F165963D304
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 11:17:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235805AbiK3KQu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 05:16:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234230AbiK3KQn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 05:16:43 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B55EDC7
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 02:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669803350;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CxbB2FEXTvRF2CzuUkTWE4rFXxyela8ryo1CFsrhtF4=;
        b=F6TVtUA6lMbUD3UglKR5VtghAD8vcoT26RGy8mXtsyX3GrvH2NcEEjuesXBRzx49Hnd2fW
        QKMO6QdSq+Kid9rds36KV5GNVV4VF5hPnpKQs4QKdwxdl+Z9GGr+BCr8BBBVFh++m3lSix
        thtQ5hx0SWlDu90Xzn/RQ4rFXb+Tfkc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-637-SL3z1d9nPPe3_63xbxOPJQ-1; Wed, 30 Nov 2022 05:15:48 -0500
X-MC-Unique: SL3z1d9nPPe3_63xbxOPJQ-1
Received: by mail-wr1-f69.google.com with SMTP id m24-20020adfa3d8000000b00242168ce9d1so2155293wrb.15
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 02:15:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CxbB2FEXTvRF2CzuUkTWE4rFXxyela8ryo1CFsrhtF4=;
        b=0JH8f+BK1N6E+meFM4G0eEX2OH+Nccr8C1YbkIyoIb860wLXpM0kh5XlXyfBTtO8qe
         f+6HpcLl3rWvQT0mkgaY1dlgY/pyVg+yrftE7oXiV/INJAFKtfg3bqzzTY+V8KIYdcSv
         FEs8ZepYNKK8eQjhrnC3/f/bpFrJc82o0gaWCtat+hxRWDuYqfLPdLel/+KRCGyw1Wyj
         sR9CQUJwEi0AdGDTEIPErN4D4DRkn2IfCZZx9YrJvLNn8m4yrtl/GpZ+/wHYGHu5c8Ih
         Lf9HFuKjlE8+TPFEHEPFZhIDtmEbR5mxUAtKJOiCxbz4JXwrTxeYVgYs2XsHS5eDK+jm
         de8A==
X-Gm-Message-State: ANoB5plFPtZOtbsF4rEsmMBT7zQOW0c0gUGaFukt3oc2DOHu4pzXkRt+
        IS0Nmy3E+RrL0ir4uRJ8+T40Xo2jxxqctG3cJYoFfBfOLth55sX5H7HMLr4s/RzXjEMBV6IM8cf
        u23iGnX2a2eBkBnfzJo3V1Cc=
X-Received: by 2002:a05:6000:71e:b0:241:df3f:f5d6 with SMTP id bs30-20020a056000071e00b00241df3ff5d6mr25887799wrb.288.1669803347044;
        Wed, 30 Nov 2022 02:15:47 -0800 (PST)
X-Google-Smtp-Source: AA0mqf489Ao4FvIZrt2NmdFFZZC3lnncO3vTH3xWCwvBSPnOhZqxpghPRCNXtDB4BiPRHtQZXu9P+w==
X-Received: by 2002:a05:6000:71e:b0:241:df3f:f5d6 with SMTP id bs30-20020a056000071e00b00241df3ff5d6mr25887772wrb.288.1669803346802;
        Wed, 30 Nov 2022 02:15:46 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id l11-20020a1ced0b000000b003b3307fb98fsm1397702wmh.24.2022.11.30.02.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 02:15:46 -0800 (PST)
Message-ID: <6222f13a-a03f-cf20-343a-e885f80cc4ed@redhat.com>
Date:   Wed, 30 Nov 2022 11:15:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 17/17] drm/vc4: tests: Add unit test suite for the PV
 muxing
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
 <20221123-rpi-kunit-tests-v2-17-efe5ed518b63@cerno.tech>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v2-17-efe5ed518b63@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/28/22 15:53, Maxime Ripard wrote:
> The HVS to PixelValve muxing code is fairly error prone and has a bunch
> of arbitrary constraints due to the hardware setup.
> 
> Let's create a test suite that makes sure that the possible combinations
> work and the invalid ones don't.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Thanks for this patch. It shows how powerful KUnit can be for testing drivers. 

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

