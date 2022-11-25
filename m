Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66553638840
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 12:06:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbiKYLGb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 06:06:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbiKYLGa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 06:06:30 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7E504D5E4
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 03:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669374340;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Kvo3ByqVNYtl4Gj5V4V1EtKWGChjY02VeHw9i+vXN5I=;
        b=ZYMGJKyekvjiSNWJPQ7ZrBOYVzf5DD9E+qGIucVsVh0Culk1eDWIoVBpcf6VSy2DHuThzm
        HjYcE9IwOgisA7Deg8Sn9zHf6XIzaqoa0mW/xuMJmlvgUrmCX95RWbDWp+mkimOhiU587v
        yN844plc7/meuMJFXUM6L8/UGusaOBU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-BlN7J5e5NOmHAO-kvCdVLA-1; Fri, 25 Nov 2022 06:05:33 -0500
X-MC-Unique: BlN7J5e5NOmHAO-kvCdVLA-1
Received: by mail-wr1-f70.google.com with SMTP id l9-20020adfa389000000b00241f907e102so772691wrb.8
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 03:05:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kvo3ByqVNYtl4Gj5V4V1EtKWGChjY02VeHw9i+vXN5I=;
        b=YR6yUOC7p6l5jbBsgsFU1iGn8bGr31Ynh+42E5i4Cmk9UA+rjCq7yuJn8t9fpP2vZu
         0tdoZWxvlTttDvpYIOLGziLHVafdnI9HrUc3bq7Dn1XfMoZFC1NA2As92fBkx2VZC3gP
         54Esb9GBqBYaJOFCZavF/vhUK2zfYU9U6oklj7ZISQ2IOsNbLpvVfhbt0+/f/N9EXwbO
         IBoEEK4aVLyRux83VQM5JZkdELACIcLkFChjKn3K6LRTdlqVI3qnNNmv3ag1Y3skDp6q
         GRwf2HZ90eHCz9D7cbAFtkfNooy1Mv8CMSJ6Xts+6OKdLVAHC5LaBki59PiscJlGB8X5
         7yPA==
X-Gm-Message-State: ANoB5plC5gryZd3498sn34o7V99xAiflQ1VV9KpLpc9a7atOvLhF3+/K
        YH8gvMogbh+UDc6tpJErtKjiSsUP9mv3T60czq32olEFebYd6DOXjsjbWDN/l0IJD11jbjx8i+g
        CWjP1nSQKHNLkxXArvkZrWgE=
X-Received: by 2002:adf:ce05:0:b0:241:ea29:fa06 with SMTP id p5-20020adfce05000000b00241ea29fa06mr8120160wrn.594.1669374332183;
        Fri, 25 Nov 2022 03:05:32 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6wTdp2+VuVoE5mvN2PyA3RkmkpVRnCk9tCcFb4MGlJIpqCV6lnFcIqScH72xr3oR/swXwGWw==
X-Received: by 2002:adf:ce05:0:b0:241:ea29:fa06 with SMTP id p5-20020adfce05000000b00241ea29fa06mr8120136wrn.594.1669374331867;
        Fri, 25 Nov 2022 03:05:31 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id f13-20020a05600c4e8d00b003c6c182bef9sm11765978wmq.36.2022.11.25.03.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 03:05:30 -0800 (PST)
Message-ID: <0c5c0fa9-7223-2855-04e8-5ce264b873e6@redhat.com>
Date:   Fri, 25 Nov 2022 12:05:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 13/24] drm/vc4: kms: Constify the HVS old/new state
 helpers
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
 <20221123-rpi-kunit-tests-v1-13-051a0bb60a16@cerno.tech>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-13-051a0bb60a16@cerno.tech>
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
> The vc4_hvs_get_(old|new)_global_state functions don't modify the
> drm_atomic_state passed as an argument, so let's make it const.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

