Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCBE16387D0
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 11:49:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230235AbiKYKti (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 05:49:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbiKYKth (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 05:49:37 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E85094841D
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 02:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669373318;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S8+u64ScLLmuZTRFUyAfXczflJucAb1iFk9pCBWNFeo=;
        b=IE2mwNmxX9twte6qGLqlDBcpi6Ut9yp1hT/QuJxa55Sv4YPeznyKHD5nnsZSFNey7Lujmq
        aqIE1E6kq9pkIJTo68FigoNwiGv50YG4EPH5Yr3C8kPR8fWXm31X8h5LQgvgN9zKjlbFzk
        MCSdBOcxmA83suNaZuIUHiUR9la4w5Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-407-xWlS6b2XNnCYla-ovOEMAw-1; Fri, 25 Nov 2022 05:48:37 -0500
X-MC-Unique: xWlS6b2XNnCYla-ovOEMAw-1
Received: by mail-wm1-f71.google.com with SMTP id ay19-20020a05600c1e1300b003cf758f1617so4017455wmb.5
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 02:48:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S8+u64ScLLmuZTRFUyAfXczflJucAb1iFk9pCBWNFeo=;
        b=odwWFiuFm41h2KBsjGiWDa5WdU0DF1flRHtuZSO8giwJRJ6X66MC3MWZz1t4eazt+L
         6uewzNPTXaZF0Wo/xnxELX7PI2d8Qo+bKFsCNVneNfL9a6OVB0Uqb7l+vUlaywBruL8U
         ZIVSXSHdBmD3XFyXeJflR1E0+3/702q/2WO6+zf+l/FN0fdGGaX1o1Ykv50w7JuGfk3b
         7TYwL49S4OyIzMKH+fgSpRwuf9Z9f2xncEG3l6fh51Fa5o85ivONQ77SerJLaqpexaho
         wbgfCbn3tQdjgd5PlF+99TKyQOYtn+zmJg2YwnVd13287z4l5MysbQnuVXeOEq/RuqFC
         7Mzw==
X-Gm-Message-State: ANoB5pmqJJ36Wj3pSzvC5xlh8Lpm0pl6ZX3eBaur8P0dLwWPVPoP+w4L
        N8Pyl4ufd6BPYzcr1NspwXHS/GuSX+GbBoSAvgueu5CLOWMV/Tc5be+klKd7meElVdVapxI25Ha
        oP8FDCgPi/L1Sdq5xHge732s=
X-Received: by 2002:a5d:4ec1:0:b0:241:f72c:1ca1 with SMTP id s1-20020a5d4ec1000000b00241f72c1ca1mr6336186wrv.395.1669373315771;
        Fri, 25 Nov 2022 02:48:35 -0800 (PST)
X-Google-Smtp-Source: AA0mqf68mWbhAYVWJ14W9k0aC8vAp+Trr4GSf385HbqRyPEST2QyT8ndyWd8MhWpBxlgO+Y4G88ZeQ==
X-Received: by 2002:a5d:4ec1:0:b0:241:f72c:1ca1 with SMTP id s1-20020a5d4ec1000000b00241f72c1ca1mr6336150wrv.395.1669373315494;
        Fri, 25 Nov 2022 02:48:35 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id n11-20020adfe78b000000b0023677fd2657sm3555977wrm.52.2022.11.25.02.48.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 02:48:34 -0800 (PST)
Message-ID: <09086f46-8b21-9d72-d230-f59df7f2c51d@redhat.com>
Date:   Fri, 25 Nov 2022 11:48:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 07/24] drm/tests: helpers: Allow to pass a custom
 drm_driver
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
 <20221123-rpi-kunit-tests-v1-7-051a0bb60a16@cerno.tech>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-7-051a0bb60a16@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/23/22 16:25, Maxime Ripard wrote:
> Some tests will need to provide their own drm_driver instead of relying
> on the dumb one in the helpers, so let's create a helper that allows to
> do so.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

