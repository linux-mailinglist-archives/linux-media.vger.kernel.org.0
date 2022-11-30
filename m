Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D8D563D2DA
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 11:11:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235284AbiK3KLH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 05:11:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233628AbiK3KLB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 05:11:01 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A98D27CE6
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 02:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669803003;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NoPdGdP1XN2IHlWy3xzG7ljlYAvy6qLxs9MsnW+HAEQ=;
        b=ZlZdyiD78BGnR/7hjwAEKvQuX3EWxeCxZAEK1un/gXLY11oC2oLzTipH7O2gQvjAkNXSfl
        VWCLswQXrsJ0DeE4uElLYmxNPYlFjF7gMIja7EsP/eBVb8zgPxM2525nGISImPvjh3nbLQ
        xTmuQ3MdMBKlw/dgan7AxN2Yc7Qd600=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-563-B1AnKgFhN_qqfzyrYkG3tQ-1; Wed, 30 Nov 2022 05:10:02 -0500
X-MC-Unique: B1AnKgFhN_qqfzyrYkG3tQ-1
Received: by mail-wm1-f71.google.com with SMTP id bg25-20020a05600c3c9900b003cf3ed7e27bso9173031wmb.4
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 02:10:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NoPdGdP1XN2IHlWy3xzG7ljlYAvy6qLxs9MsnW+HAEQ=;
        b=ad39j9gTffvbThcpbML6uwCJukmUipyGA5tvR5e1MT61Ta1pDffSAuwmy5PcjQp+WU
         QnUPoeRQBDCg1rmcYFJdKsJfUrJ005QDV5qMpsSalHfMIdUEU+rSV21AnO1WB+kOLT4I
         r9CjMwi14x4iFjTFLLsim0Zeb1Erl2b6oXBAOmOcJT8JUXL4j+r6B1UGwRIm7D/DEusq
         u5B8uOE+Zi7w97BMgy0QnUcz5lWvCmBoVaa65ChkjbwF3miuJAOpu4BklJ+NQUdqK6No
         +F/YlwdOPeNZG3VYePUg+XysWX064aKhkId6zcVwb67mHtRO3hZUDb2+r0ADW7AWrTVq
         Iq9Q==
X-Gm-Message-State: ANoB5pkO0rFOm3QP/cQUB2w2hGDwaBeqDdodzlRtaRYPODKTgeQlqUXK
        GTKxJK4z7p6J7HkHUQeToRva1wqkhZ/szlHfk6I0ppEhfveTtYtH4KzK++3rGXbxIT/q6SmvlYs
        hhHHiRzS159diBZWWvBOKfZY=
X-Received: by 2002:a5d:504d:0:b0:242:246c:2f89 with SMTP id h13-20020a5d504d000000b00242246c2f89mr3758400wrt.108.1669803000957;
        Wed, 30 Nov 2022 02:10:00 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5FkWQT/k1GHgrsZnt54cNcc31t/15SG2tVARml33QGcmHm1VSq1hvfrPDi51V6Qbq5abMc4Q==
X-Received: by 2002:a5d:504d:0:b0:242:246c:2f89 with SMTP id h13-20020a5d504d000000b00242246c2f89mr3758377wrt.108.1669803000781;
        Wed, 30 Nov 2022 02:10:00 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id b18-20020a5d5512000000b0023c8026841csm514653wrv.23.2022.11.30.02.09.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 02:10:00 -0800 (PST)
Message-ID: <31351d94-91ba-b0fe-cb20-3dcc8254fb66@redhat.com>
Date:   Wed, 30 Nov 2022 11:09:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 16/17] drm/vc4: tests: Fail the current test if we
 access a register
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
 <20221123-rpi-kunit-tests-v2-16-efe5ed518b63@cerno.tech>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v2-16-efe5ed518b63@cerno.tech>
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
> Accessing a register when running under kunit is a bad idea since our
> device is completely mocked.
> 
> Fail the current test if we ever access any of our hardware registers.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

[...]

> -#define CRTC_WRITE(offset, val) writel(val, vc4_crtc->regs + (offset))
> -#define CRTC_READ(offset) readl(vc4_crtc->regs + (offset))
> +#define CRTC_WRITE(offset, val)								\
> +	do {										\
> +		kunit_fail_current_test("Accessing a register in a unit test!\n");	\
> +		writel(val, vc4_crtc->regs + (offset));					\
> +	} while (0)
> +
> +#define CRTC_READ(offset)								\
> +	({										\
> +		kunit_fail_current_test("Accessing a register in a unit test!\n");	\
> +		readl(vc4_crtc->regs + (offset));					\
> +	})
> 

Should this be made conditional on whether DRM_VC4_KUNIT_TEST is enabled ? 

That is, just define the simpler macros when is disabled? The kunit_fail_current_test()
is just a no-op if CONFIG_KUNIT isn't enabled, but I think my question still stands.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

