Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0515B6388F7
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 12:42:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbiKYLm3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 06:42:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbiKYLm1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 06:42:27 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1E4F1BE9E
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 03:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669376488;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FOhIdeO2viHCtBqTf2iYEwnXDI6Ezk/3Vbjgspkc6Ig=;
        b=c7tKW8ZQpWV70y0RyBULR6dFoyK22cVI3TGTRDCHODX9jXVFWrlDAD96bwC+kRpkxRZnI2
        vyyPlLp5WeIIxu9nDdFyM+172b1BIZnuf88kVP7xR4ObB7qUjFzWp/jNwlEYt30t7vz0zV
        ka4F568td+NJm0CSY/DwbhU4quh+Zt0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-164-y0ztY9CyNqG7pufiNlgo-A-1; Fri, 25 Nov 2022 06:41:26 -0500
X-MC-Unique: y0ztY9CyNqG7pufiNlgo-A-1
Received: by mail-wm1-f69.google.com with SMTP id z18-20020a05600c221200b003cf7fcc286aso1721346wml.1
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 03:41:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FOhIdeO2viHCtBqTf2iYEwnXDI6Ezk/3Vbjgspkc6Ig=;
        b=nciOAfy0kEmao/sqYJ6A+Zae/P6xpgvwsTxvWUrJ/ciaO/bNUr0octXMt0c5i/hXzy
         TJF8P3uiQ392OftY6ltF8TSxgvbQB4OD2YcYNlxx3iGNT0YQwOLlhYwEfhkqL1Ic5dh+
         B2wD3RN/fX102XVCWD+YdlA9QNmmZgIH8jTNhOL55q4kxWMuIrLejf2RvQe5wKb1Ieqp
         NEJ0m4Th7V5LrhZpIpcjrgBYFJ8mTMsbY60Kpi/qb9riGSsDjwO2gdXWl/7U37VK5sic
         aJFkjirSV1vlEFiA4qpBShzDoYsOShkVsX2ofgx0bDro9xAk2w2HM5qhqswKPFToSd5+
         2jZA==
X-Gm-Message-State: ANoB5pnOt+mhbECFPwrz7BiF/HpmzwSiGgcHnNseRRGH4+2mHQX5rs9C
        m0kdN2AFKkwBw/lX60MFNolFpw8+sbZznynXDKfbFFFPpRi5DoiDcqxLKWvGck/aXTETWQUdifk
        9lDV5/59oauwqnSEzIDfB2m8=
X-Received: by 2002:adf:e34d:0:b0:241:ee4a:2301 with SMTP id n13-20020adfe34d000000b00241ee4a2301mr7222671wrj.429.1669376485538;
        Fri, 25 Nov 2022 03:41:25 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7XK7j/pUPAtmTo6t54sJnnyf1J8fqURJI79qjd/c5yPhwa217razm52j8W7b414NZu8YvG6w==
X-Received: by 2002:adf:e34d:0:b0:241:ee4a:2301 with SMTP id n13-20020adfe34d000000b00241ee4a2301mr7222654wrj.429.1669376485339;
        Fri, 25 Nov 2022 03:41:25 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id he6-20020a05600c540600b003cf4ec90938sm4846070wmb.21.2022.11.25.03.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 03:41:24 -0800 (PST)
Message-ID: <a39d6b1f-a496-d293-8f27-c17d30d6c0b5@redhat.com>
Date:   Fri, 25 Nov 2022 12:41:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 21/24] drm/vc4: hvs: Provide a function to initialize the
 HVS structure
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
 <20221123-rpi-kunit-tests-v1-21-051a0bb60a16@cerno.tech>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-21-051a0bb60a16@cerno.tech>
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
> We'll need to initialize the HVS structure without a backing device to
> create a mock we'll use for testing.
> 
> Split the structure initialization part into a separate function.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

