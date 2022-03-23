Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED544E568B
	for <lists+linux-media@lfdr.de>; Wed, 23 Mar 2022 17:32:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239067AbiCWQeS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Mar 2022 12:34:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239030AbiCWQeQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Mar 2022 12:34:16 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 151777CDDD
        for <linux-media@vger.kernel.org>; Wed, 23 Mar 2022 09:32:45 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id kc20so1625345qvb.3
        for <linux-media@vger.kernel.org>; Wed, 23 Mar 2022 09:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=7LH/BAJ5JIiAI3E0xe273jWZ+iAloz6/lGJSM6J+7qc=;
        b=UUg+s18BivN7Ydyj2Ln4yb45sBSGsRz/zT14LWD4Y+rRELLyXCvQHk7hpbcgzcn9ni
         iy7BZaBsQjGIOpygvNMl82NGgay+S5LVTg5lmNUc78+cJgwEsRZ0B9XrcRyZabJgrvNA
         cq0g3tEKC3UHqTl2QJGv7BrfJAQRwk3P5WA6WtnGGrBfcEYTK5TWAQjyOD1Prb489rZZ
         XJ5aS0AX8Q52whoJ//Ckj0x+hXg66HJEC3iA3mAgAtkYr21rDnaxQAKiQ94mV0LftGSU
         82uSFpw5H/NuKHm6o6yJA9aFV8Bewpep2O2QYCeJPO5wDvtPvcrUm13o9et24+K65FO0
         0Irg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7LH/BAJ5JIiAI3E0xe273jWZ+iAloz6/lGJSM6J+7qc=;
        b=8EbZq1SdBssyVqY/s3drW0nU7X9gsEX+gPsCFpv6/d97+C3DGIFvw5k3rha0CCybiE
         W9vW0+6zRYmuM6ayp4VAN6Od+O1OTEYQge6K+VFF3xuATMPyZJdGMx+VnY4QY1/HO3+W
         7v/xOdvI81L5tcQuYqUqaLXXQUnw63rYprYpiNz95bQjrhacISUeobCYTPqj2p7XS63c
         mKAdHNZbFW+7NDfEh09FWK/tqvwxO6B+RON6sWjWCCHckFPBJBzi+n0RDoRvuOYExi8p
         +XlFXci2vYsLrsz8f21jvZGzNvpT/6daV3MAS5lP7+XEHimAzoSXWeO/zgPIbX38iVBP
         GqmQ==
X-Gm-Message-State: AOAM531XwMqfISQqPrkXKxO/0gn/lBwZOPtU0zEHlw5kKzF0J4g69K50
        nDoz1nXKW6lijcQR6Hily2BD5g==
X-Google-Smtp-Source: ABdhPJyZieS4yH7sj5HKr466jKN3HJ6IQr0Aix1wpCOMBxPMNqtld1II12OSbI55/DAsq2dmJpfpNg==
X-Received: by 2002:ad4:5a11:0:b0:441:1485:33ff with SMTP id ei17-20020ad45a11000000b00441148533ffmr340193qvb.127.1648053164217;
        Wed, 23 Mar 2022 09:32:44 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id h206-20020a379ed7000000b0067b5192da4csm214905qke.12.2022.03.23.09.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 09:32:43 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1nX3uc-004xPv-BA; Wed, 23 Mar 2022 13:32:42 -0300
Date:   Wed, 23 Mar 2022 13:32:42 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
        daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Leon Romanovsky <leon@kernel.org>,
        Maor Gottlieb <maorg@nvidia.com>,
        Gal Pressman <galpress@amazon.com>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 04/23] RDMA: use dma_resv_wait() instead of extracting
 the fence
Message-ID: <20220323163242.GJ64706@ziepe.ca>
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-4-christian.koenig@amd.com>
 <Yjse+S0bf4P6QTfu@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yjse+S0bf4P6QTfu@phenom.ffwll.local>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 23, 2022 at 02:22:01PM +0100, Daniel Vetter wrote:
> On Mon, Mar 21, 2022 at 02:58:37PM +0100, Christian König wrote:
> > Use dma_resv_wait() instead of extracting the exclusive fence and
> > waiting on it manually.
> > 
> > Signed-off-by: Christian König <christian.koenig@amd.com>
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> 
> Jason, can you ack this for merging through drm trees please?

Sure, it looks trivial, but I didn't see the whole series:

Acked-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
