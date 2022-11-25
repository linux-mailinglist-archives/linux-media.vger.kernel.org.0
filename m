Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 844C1638588
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 09:51:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbiKYIvi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 03:51:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbiKYIvd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 03:51:33 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C02F6275DC
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 00:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669366236;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZCa5X8lXlExaGphI0WGFeQw46HpXtfvTpixratHZyiE=;
        b=U5OE6i2kK+253b1jnmoN/dJT5oWKLarXAF/d/b82PF5t212A6bQvFzh37aZ4h+FjZGNnvc
        xl1JZTuo8RQv38OIrCpT1xhLqK8Kg0aB/NMSpwFYUdA6QcPhDHBgQiHQ09btvxgZOTbeTF
        vlWs02MNI8f7gKFEP5MZkwxMRkGb+zc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-251-iWNAFr6pNqy9nd32ST52Fw-1; Fri, 25 Nov 2022 03:50:34 -0500
X-MC-Unique: iWNAFr6pNqy9nd32ST52Fw-1
Received: by mail-wm1-f69.google.com with SMTP id m17-20020a05600c3b1100b003cf9cc47da5so2112754wms.9
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 00:50:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZCa5X8lXlExaGphI0WGFeQw46HpXtfvTpixratHZyiE=;
        b=EMCt47dJEoe714Ml8Aisl87fDJLk9T3JfDreIn+FD9cI+cFx/5qqHpNIJY5yTGeSnJ
         QY0RMxRp+lsnHv26alGmGQEcCiU8dnbB9qJ3rl5AnJOSXfqpfzKAm+3YkBr0zl460RUq
         b0tqUUv3ItAB82aELhxGIG8TqAkyPieiefQH2Tqj+4QilKI8/N6cW3XJvv0DSIG2H+Tk
         TsF6TcZTRtalksMLmZAdyk1s97PfGJx7fkYPnUZns35JHUQRbheWxenJPcjgkDQZrmyr
         OFBZ77lanhsLsuad6gcSLpUDltd/FntnxTJ282+7k+CjK0xXQUWoBKrsVzvQBeTaCI+V
         CXEQ==
X-Gm-Message-State: ANoB5pl2WmXQF6dGBHXcrJ15gYf/fqn/F09Kxghfu2vjwRJIIufZCpI8
        rTMZwbsYZLobl6T2d+9OLVV5QMQ/RbHi3wkSNkIE1btM7Vf/HG+IgK25GwjcxujcrkobxHtNnQO
        qJhLTitGJRJ865AQjc6v8uFc=
X-Received: by 2002:a5d:5305:0:b0:242:25e:e731 with SMTP id e5-20020a5d5305000000b00242025ee731mr2642370wrv.48.1669366233209;
        Fri, 25 Nov 2022 00:50:33 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6mov6a1ABQsKCpweMfuKZj8FtStMvwn4E4x4v/bkoJJVxviE1bsUHgijhFDEI16xW3gYv3qw==
X-Received: by 2002:a5d:5305:0:b0:242:25e:e731 with SMTP id e5-20020a5d5305000000b00242025ee731mr2642344wrv.48.1669366232940;
        Fri, 25 Nov 2022 00:50:32 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id p11-20020a05600c468b00b003cfd10a33afsm8890236wmo.11.2022.11.25.00.50.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 00:50:32 -0800 (PST)
Message-ID: <2517016e-1b31-b821-df0c-8c0498f11719@redhat.com>
Date:   Fri, 25 Nov 2022 09:50:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 01/24] drm/tests: helpers: Rename the device init helper
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
 <20221123-rpi-kunit-tests-v1-1-051a0bb60a16@cerno.tech>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-1-051a0bb60a16@cerno.tech>
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
> The name doesn't really fit the conventions for the other helpers in
> DRM/KMS, so let's rename it to make it obvious that we allocate a new
> DRM device.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

