Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29EF44F8089
	for <lists+linux-media@lfdr.de>; Thu,  7 Apr 2022 15:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241244AbiDGNcO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Apr 2022 09:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232597AbiDGNcM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Apr 2022 09:32:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6E08C19E
        for <linux-media@vger.kernel.org>; Thu,  7 Apr 2022 06:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649338209;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oFOEsWzoiUS9y0uNWiK+Uj/FvgEiEbzhwqlHCzAenJo=;
        b=e5rdN5XDH3+axy0cwUw5QujMoUCRVzK2ISqIvCrQh4r37477hIV0DDgTK5HIgvv6nnR7dX
        Vx8wXn3exuBHDci9q+OBQYTi0LnTSp1LsyoCySRaEUS99IugixKfyc/kx+ofzQe97/l9I4
        9eho8zEHXlN0f/v7JHoxG0tx+PBDPis=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-RTwza-YsOPOcoxTjNfYO5A-1; Thu, 07 Apr 2022 09:30:08 -0400
X-MC-Unique: RTwza-YsOPOcoxTjNfYO5A-1
Received: by mail-wm1-f72.google.com with SMTP id j6-20020a05600c1c0600b0038e7d07ebcaso1500800wms.0
        for <linux-media@vger.kernel.org>; Thu, 07 Apr 2022 06:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oFOEsWzoiUS9y0uNWiK+Uj/FvgEiEbzhwqlHCzAenJo=;
        b=0wNpw5zndLv+G0k5/At5GhmXnTW16CinFT+wjAeRgIN6IeIOMyKPCuEe9hjuvHBfrU
         5LtWLW53JgyWpCUcqRRj/v/R3vSp8hSl+mkr5IcO/YW2gQEExyl+Hg8+Y5Yg0AzbswaE
         0o6BgcDvDQaB28KbuvV1QBYQSaITjFPin74I69fwEt3GxVDx8p75ULNv1JlbbnBPXcD+
         T8AIGPc2ip8FDcMdvUCQS51I0sQn22Z00L4iA7v+CNXrwNUAfwr578RVH9qx85He425D
         lhT/eJWpGnoM19ScvPKko6vd2H7zso2dhTqnUkLO4jHvfruIjTLCrwKdA0HE9ic5saZZ
         whSw==
X-Gm-Message-State: AOAM533ESLrOlfH0akwYeKbCUM6Lii6Jt8dYS1Mxh4buH7kQ9NJ4iJWJ
        /+jVqbLxfwS6GgLlQn7v2VWwGiN2DV1t3w2MRU214KWNhyb61NS0eEz4SEIGKQP17u1G26V/FxT
        eHT8vX/HdtXwkcREckaoSass=
X-Received: by 2002:a5d:5987:0:b0:204:1f21:6a29 with SMTP id n7-20020a5d5987000000b002041f216a29mr11125683wri.716.1649338206615;
        Thu, 07 Apr 2022 06:30:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHhyt6TJv9cnYh3O+w2+P8EerBGfzJnZrRoxkX8R2UxyrNxuqiqRa2rKZwAlKyV73pUqeKBQ==
X-Received: by 2002:a5d:5987:0:b0:204:1f21:6a29 with SMTP id n7-20020a5d5987000000b002041f216a29mr11125665wri.716.1649338206429;
        Thu, 07 Apr 2022 06:30:06 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id l2-20020a5d5602000000b00206120e0b0fsm14766168wrv.18.2022.04.07.06.30.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 06:30:06 -0700 (PDT)
Message-ID: <a6e442f1-cb22-e196-1546-67e0c9b1a921@redhat.com>
Date:   Thu, 7 Apr 2022 15:30:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/vc4: Use newer fence API properly to fix build errors
Content-Language: en-US
To:     linux-kernel@vger.kernel.org
Cc:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, Emma Anholt <emma@anholt.net>,
        Maxime Ripard <mripard@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
References: <20220407131950.915091-1-javierm@redhat.com>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220407131950.915091-1-javierm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/7/22 15:19, Javier Martinez Canillas wrote:
> The commit 73511edf8b19 ("dma-buf: specify usage while adding fences to
> dma_resv obj v7") ported all the DRM drivers to use the newer fence API
> that specifies the usage with the enum dma_resv_usage rather than doing
> an explicit shared / exclusive distinction.
> 
> But the commit didn't do it properly in two callers of the vc4 driver,
> leading to build errors.
> 
> Fixes: 73511edf8b19 ("dma-buf: specify usage while adding fences to dma_resv obj v7")
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> ---
Pushed to drm-misc (drm-misc-next) since this fixes a build error and
Christian already reviewed it.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

