Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6B56387FB
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 11:55:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbiKYKzG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 05:55:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbiKYKzE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 05:55:04 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82E7A4909C
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 02:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669373647;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9tvd04/iu26771wlB7WciR/DkQpotQap05SOjl7Y+To=;
        b=IFO8O5CCbjGtmhQgqNuDDRkyEspYsmnx8s5Gmb51qDl3pWMB9sXL7HVH3/zISByJXCkQ7I
        VV4NAtp9Kl9LBBJ5eUseklz1viXCoob8rU7b4WgBD0uMAj6os50VUflohTaelRBmmLKPfM
        WGXaRm1I6yMKSmmD9YpiXxfK7Q3GgEY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-562-oGaf2Y76NbqlAEEOV1E9qw-1; Fri, 25 Nov 2022 05:54:06 -0500
X-MC-Unique: oGaf2Y76NbqlAEEOV1E9qw-1
Received: by mail-wm1-f69.google.com with SMTP id v125-20020a1cac83000000b003cfa148576dso2269520wme.3
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 02:54:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9tvd04/iu26771wlB7WciR/DkQpotQap05SOjl7Y+To=;
        b=0xkHSVd6cHB/ORoe++yTSfQqkILshZuLM0FmTTA8hZp9G/UQcOibtwhSVLcRVxVh/b
         7aj5fyZc81/Q5OIb2RndrcygrHyh/eb65J3pOqOB0e/m7i4Ch7rkh4POhGWg2r1owVAj
         wJ1K2wewPEZqDW+Di5uhVbdfE2U8NEGukBDq96rE3ZQwifY9shvD0dQykPlSD38uTftz
         yyz0ULRoeztwi7tP8XjhiDTmLwcg8lKYgtRKnCCcagvKCzbOyPcWUkigpturMY+HOOha
         BDjaDEBTXgVoFUbzuF80AaQ2EKRjHGu+ffczrsRiTQT/eGt0vRaZO9N8wHLuLME3CpYq
         ZxcA==
X-Gm-Message-State: ANoB5pmEc9fDGFpOplsRNOnZ/JaerIxq3C9rLdAcm0t9/pBsdp8On3jg
        5A86SRcV2yw8qivbz/JVtrmvD0Bc7U/PYg3fmQ8udoe7r6TU1hKJ8Z4z1Xr9hkY8puUNevAIszU
        m2lLPA5KEJI7FHOjNJqdVUZY=
X-Received: by 2002:adf:e94c:0:b0:236:6d79:b312 with SMTP id m12-20020adfe94c000000b002366d79b312mr22866553wrn.699.1669373645074;
        Fri, 25 Nov 2022 02:54:05 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4MhXPJaPoTEfI4yng3ZY2kweBGK0CbbycrpZOheo/dL+NoYUdJpT+aQbCzIEhJ5+Sz9WdagQ==
X-Received: by 2002:adf:e94c:0:b0:236:6d79:b312 with SMTP id m12-20020adfe94c000000b002366d79b312mr22866536wrn.699.1669373644817;
        Fri, 25 Nov 2022 02:54:04 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id l11-20020a1c790b000000b003b4a699ce8esm8527114wme.6.2022.11.25.02.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 02:54:04 -0800 (PST)
Message-ID: <1b0c23f4-eb5c-38d2-b1ff-541140ac32a0@redhat.com>
Date:   Fri, 25 Nov 2022 11:54:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 09/24] drm/atomic: Constify the old/new state accessors
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
 <20221123-rpi-kunit-tests-v1-9-051a0bb60a16@cerno.tech>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-9-051a0bb60a16@cerno.tech>
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
> The drm_atomic_get_(old|new)_*_state don't modify the passed
> drm_atomic_state, so we can make it const.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

