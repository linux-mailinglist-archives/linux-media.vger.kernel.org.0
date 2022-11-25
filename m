Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA3C638869
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 12:14:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230387AbiKYLOs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 06:14:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbiKYLOr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 06:14:47 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DC8D4D5FA
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 03:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669374822;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qFx/VXqLp/Ia7vJAw9Cj+XP8sI/+0/nuoQb7QGji8jU=;
        b=U9auQhXVqixk0MWUNhoeZ7iS4TkChVz6eBYjq8X46dBP29nbsMeRVtVJ7s/0V+V7kJxR6Y
        glEb4G2YaI8GoU0GK2LCf3tna+cvQqzWwW61SZpdQbSl2vGTHc267AmZuM2ZFH8gq1IL+Y
        lt9Y4SRPrMqIUT2Mb96QbdD4xhrJyvU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-137-nzvbKnrAMYeen1L2PQolvg-1; Fri, 25 Nov 2022 06:13:40 -0500
X-MC-Unique: nzvbKnrAMYeen1L2PQolvg-1
Received: by mail-wm1-f72.google.com with SMTP id 206-20020a1c02d7000000b003d02dc20735so2308963wmc.0
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 03:13:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qFx/VXqLp/Ia7vJAw9Cj+XP8sI/+0/nuoQb7QGji8jU=;
        b=1NtqlhFBr9whMxykRN56wkZR3sDv9QlHp3UtzSnBRgq5CeHVO0+5A+jryaUXyzpMi0
         wI3jO9JvEJEAucibcoCKvvdYl857V1llvckLPcGSak7oI1Zfn1Qtv0g9BPUuKYwRghqp
         xd5PGzh6rtNHnsNoqt5mLDLI4NTp3ll+n9Tm48g4t3SFYwRcDIrqXtMbtCnxe8i8ditq
         MVpeHdTOzDzZsbUBdKhmOIKvKak9TU4ZhsQ0c51/kwZ0Otw33MTVhQPnHRXA7zH5IIE9
         olw+2sC2+Y7mgwjuNGOOepEl+XXeRdUMLu6OjyAgqSoAGrT97OCfmTngWL3NHpBnxN8r
         /eow==
X-Gm-Message-State: ANoB5pkgUweNGOfqa7TweMGvgu8VrEJcOCwpLZxUpozVtoNEv2usvEhM
        xdc7Nfo1tgVyQx0q2Q8sdPoKJ02mqkZxfM7J6h6yWyvWJ9Fk4/Gn0HPYVo848J7U5yNehZvLCfe
        ybbtK4Rf2xqOHIYqyAVkShww=
X-Received: by 2002:a05:600c:4113:b0:3cf:a3e0:73e4 with SMTP id j19-20020a05600c411300b003cfa3e073e4mr14008552wmi.21.1669374819685;
        Fri, 25 Nov 2022 03:13:39 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4QbRaGQmx0lzXwDi9UpdtUdoe4KD8bKMgqn+J5cd47t76yI/i28tjLFg1hYaguZbzcAUiqhw==
X-Received: by 2002:a05:600c:4113:b0:3cf:a3e0:73e4 with SMTP id j19-20020a05600c411300b003cfa3e073e4mr14008533wmi.21.1669374819497;
        Fri, 25 Nov 2022 03:13:39 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id e3-20020a5d65c3000000b002383edcde09sm3440822wrw.59.2022.11.25.03.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 03:13:39 -0800 (PST)
Message-ID: <2405809e-8183-e353-1259-94e16ebe8204@redhat.com>
Date:   Fri, 25 Nov 2022 12:13:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 17/24] drm/vc4: crtc: Pass the device and data in
 vc4_crtc_init
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
 <20221123-rpi-kunit-tests-v1-17-051a0bb60a16@cerno.tech>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-17-051a0bb60a16@cerno.tech>
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
> Both users of vc4_crtc_init need the same extra initialization to set
> the pointer to the platform_device and the CRTC data. Since it's
> mandatory, let's make them both arguments of vc4_crtc_init().
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

