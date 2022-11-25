Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2743E638837
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 12:05:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbiKYLFn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 06:05:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiKYLFm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 06:05:42 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 698B54D5C9
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 03:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669374290;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EIsNFOFnhjxNTgJU/2vZA8CiSz+sEWLC1ebQetbQ8TI=;
        b=R5ybHP+mIGURzD9d5Y0jYGlFJQPyZ94PZ92B3XscNBVwFU3qf1txswQ9NV/CoUPveA1Ef1
        Nc7Fu+Uw0nw6PlkTPRhImKEpMcSWYZX8O2pbUPKwGvWBb2gS7mXM+y22eFk421Y4dqHZ9S
        cbDy2vbS4eecO2aTN2tgCdlUxfu0hz0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-340-EMwBDDXXObGEBG_Q2LtgtA-1; Fri, 25 Nov 2022 06:04:49 -0500
X-MC-Unique: EMwBDDXXObGEBG_Q2LtgtA-1
Received: by mail-wm1-f69.google.com with SMTP id az40-20020a05600c602800b003cfa26c40easo3815107wmb.1
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 03:04:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EIsNFOFnhjxNTgJU/2vZA8CiSz+sEWLC1ebQetbQ8TI=;
        b=TyE8uWmcb27ZB0anmtJzEsqEhnO/EOasY/GaNSHCjgLBi6cGj6v4NcxL7LG454OUkQ
         GPvd6aGeZqNGq4HkdC9XDCQXT2v8Hjl7kdKXoSV/e/hxFhudDHKmlF35UCi4pW6HjIgI
         T2VYckyeJVN40DFgAIvtVC64Ha/rkN7YHIa5/YfPJr6/Jk3zBxo1j42taDWf9wldms/I
         FHAjU2aE54tcBkhadHBMINYBvkIvX664djqyiglLkFcCUqSqvKzeuu/qqWaxxe0gx7+L
         2O2wKU18AFfvDjGHqFOvlFTzrXCXkxwOiSk8korWrl7U39IRkNOkCxvsP50NFlSIJXjf
         R89w==
X-Gm-Message-State: ANoB5plMmPGxv21sFYuZQbGUCcgajgVlr5QA2B2FMueuAz26M+kpkKJD
        JaGBBTaabwvVziapMY+kgVBiVSKA6QrPCWtHvrTpdGcmxTjQq4IdmJru1G/WLUm+32Kwm4RQews
        4TZQuhKucW5Xg1dKU73kdCr8=
X-Received: by 2002:adf:f6d1:0:b0:241:e2af:444f with SMTP id y17-20020adff6d1000000b00241e2af444fmr10706105wrp.676.1669374287047;
        Fri, 25 Nov 2022 03:04:47 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4ai6UB7oIeeI+sRTVyelphEoAhUUiZPfWL2SD5YRQotSiu7iQrCPjltzySG4CbRwXoVo/zjA==
X-Received: by 2002:adf:f6d1:0:b0:241:e2af:444f with SMTP id y17-20020adff6d1000000b00241e2af444fmr10706084wrp.676.1669374286732;
        Fri, 25 Nov 2022 03:04:46 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id f14-20020a05600c154e00b003c6f3e5ba42sm10164544wmg.46.2022.11.25.03.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 03:04:45 -0800 (PST)
Message-ID: <d5451d30-be68-c492-6ec8-41681db400e2@redhat.com>
Date:   Fri, 25 Nov 2022 12:04:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 12/24] drm/vc4: Move HVS state to main header
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
 <20221123-rpi-kunit-tests-v1-12-051a0bb60a16@cerno.tech>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-12-051a0bb60a16@cerno.tech>
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
> In order to introduce unit tests for the HVS state computation, we'll
> need access to the vc4_hvs_state struct definition and its associated
> helpers.
> 
> Let's move them in our driver header.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

