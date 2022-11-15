Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1B762A31F
	for <lists+linux-media@lfdr.de>; Tue, 15 Nov 2022 21:40:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231445AbiKOUkA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Nov 2022 15:40:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231153AbiKOUj7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Nov 2022 15:39:59 -0500
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE0E7DF81
        for <linux-media@vger.kernel.org>; Tue, 15 Nov 2022 12:39:57 -0800 (PST)
Received: by mail-qt1-x832.google.com with SMTP id z6so9516912qtv.5
        for <linux-media@vger.kernel.org>; Tue, 15 Nov 2022 12:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uFb9AkF5DsDUHSuCLnIVyedGIVQ0vSQgZz21yC2FixQ=;
        b=G5j57M07nAeUMUOvfKBIvtwuNdmKZr+ebSsapCXtIgkOPaL+d3y1f/cHlkniBZJiXf
         np4Mw+iFldQhTFQrmPllNufC8Hnlw6L5MY0dprWTkBjRCoXbGalIjjkgiaVl6q8G0whE
         n5RUvsblHzNjre5BtyuA482hj95moYLLPA83itnow+Ex5BIwlwrhopmb5li8HcABjJ88
         7od4gmnh1lAl0z+8ZyPgi4psyqzRD91MueRGZPReY18HjBQ1bOw4q/xxmnWRYPq1CGcH
         Mh3Rp5dHC/EgGC32pJDZg7Dei9vg6XzkR4+IK6MkR0CdYPIlf4g+/WNdIiCKXY88/yCl
         NQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFb9AkF5DsDUHSuCLnIVyedGIVQ0vSQgZz21yC2FixQ=;
        b=SGAwLoJI/N3EDeHlKd6Ocu53HMXnLmOatwe4j5CxdxG7igNLKn0E7E2fPkgszxVR19
         aBWlvYiY3oQzw07WVvxsVdLB8+ChWgRt81EAqCh/7cpqBNmWbaGVUB+jkTcZyKxyK5lt
         1noVA00+gRtuxXDAJljfdCW3uplAIGkinyJMxVftMj+N+MMf8LQg92WhyIIbIuW2MKNr
         +hchgbBx8It1RNYq3Hzjk+wbe41uJT3T5FADZhQmIezRK3AGjB8zx3SY2rFnWxw+jb7h
         Rl6VmEMlyUYawlHgutJ1JoUqEB9Tb3QUtGlmssdaCVPLfHsHPjVPySESUQiCHeX6mTu3
         ljWg==
X-Gm-Message-State: ANoB5plu8rQiMHpgofJzA/RsS2fh3e5Ioe0l0/UVJsncxgkFF/aR8PpE
        0XQhbG7AbZGMIS1SNH+D0khCnQ==
X-Google-Smtp-Source: AA0mqf7wdmvUOx1k+YSFk7zHP4ga+BQ8+SSFpdbt7xHstSjZfXURNKfbLdLQzQd+eKDBS9SkIqI9YA==
X-Received: by 2002:a05:622a:429b:b0:399:78b4:5771 with SMTP id cr27-20020a05622a429b00b0039978b45771mr18719839qtb.622.1668544797105;
        Tue, 15 Nov 2022 12:39:57 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.122.23])
        by smtp.gmail.com with ESMTPSA id v14-20020a05620a440e00b006fba0a389a4sm1371576qkp.88.2022.11.15.12.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 12:39:56 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
        (envelope-from <jgg@ziepe.ca>)
        id 1ov2ip-004k5T-H0;
        Tue, 15 Nov 2022 16:39:55 -0400
Date:   Tue, 15 Nov 2022 16:39:55 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alexandra Winter <wintera@linux.ibm.com>,
        Wenjia Zhang <wenjia@linux.ibm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Russell King <linux@armlinux.org.uk>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-rdma@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-s390@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH 2/7] RDMA/hfi1: don't pass bogus GFP_ flags to
 dma_alloc_coherent
Message-ID: <Y3P5G4IczsFR5Lky@ziepe.ca>
References: <20221113163535.884299-1-hch@lst.de>
 <20221113163535.884299-3-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221113163535.884299-3-hch@lst.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Nov 13, 2022 at 05:35:30PM +0100, Christoph Hellwig wrote:
> dma_alloc_coherent is an opaque allocator that only uses the GFP_ flags
> for allocation context control.  Don't pass GFP_USER which doesn't make
> sense for a kernel DMA allocation or __GFP_COMP which makes no sense
> for an allocation that can't in any way be converted to a page pointer.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/infiniband/hw/hfi1/init.c | 21 +++------------------
>  1 file changed, 3 insertions(+), 18 deletions(-)

I have no idea what qib was trying to do here, but I'm fine if you
take this through another tree

Acked-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
