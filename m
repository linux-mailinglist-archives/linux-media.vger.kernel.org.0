Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94BD1538562
	for <lists+linux-media@lfdr.de>; Mon, 30 May 2022 17:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237084AbiE3Pth (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 May 2022 11:49:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238522AbiE3PtT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 May 2022 11:49:19 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3DEFBE3C
        for <linux-media@vger.kernel.org>; Mon, 30 May 2022 08:09:56 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id pq9-20020a17090b3d8900b001df622bf81dso10975820pjb.3
        for <linux-media@vger.kernel.org>; Mon, 30 May 2022 08:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=MDPsVzr9oRyPkDpdSrgjcqTfOM2U/KUUhbX2zAPuMn4=;
        b=Rmu2aX+sVAwyRRIb8uJtLMJIpDvhcNVejEF5IBcJ3h5yqmi2cUtdDqcTOA0ypkJTh9
         rhLj41dl6/tr/MmFpmgayS8Gul644Tp/xjjxNjBbGlmtLqch9E5HhTB+O6upwO04lJHd
         PkmajRsVMECLRiDKXkEGJYdRGRsAgw7uGeooI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=MDPsVzr9oRyPkDpdSrgjcqTfOM2U/KUUhbX2zAPuMn4=;
        b=6P27lpi9YOGdcPJyx7AScgC2sqX57B4+EMZnulq/ksEkLA6WnM55LC5zX1luSJgBl/
         I45gis7BACZng1qdB+d2Rs3sX1crRlZc/w+yXtpJwdaAt+16VNPPGjGMNtx5sGUbvPO3
         YI/ZT530+Qj8zHaUohyilj2NO7oXZji3zQAbNMgxLjEqyA1F5dZA1EV/GeAlciHLghw+
         OqxhvJ7lzAzjAQubIjJeFEBpT0DfEovYBXnec66haBBXlBTqkHL0IIiNwFfhNdGf2Bki
         7duNH14u9ajs4O5lIkmETbT29vd1bS+YTzujxtnlP7XPKCk4EDHr8NnkywSpfFyGOlJF
         IADA==
X-Gm-Message-State: AOAM530anfGI5kfVRKeJ7imYNPwMU16GqAwAa4nBKICHAV23EyHVY0vS
        ga2ycNNZT5UUpqSPaVtey1m28Q==
X-Google-Smtp-Source: ABdhPJwq3IbiSe+zl8GbAUwRzcQ8OUxiTgD7YBetwDEH+LuBXltBpWmdQNeyJempTdQIRVtLo9dQ9Q==
X-Received: by 2002:a17:90a:6390:b0:1e0:a47b:a57a with SMTP id f16-20020a17090a639000b001e0a47ba57amr23275881pjj.115.1653923396152;
        Mon, 30 May 2022 08:09:56 -0700 (PDT)
Received: from google.com ([240f:75:7537:3187:7d2a:ad1f:afa1:7770])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902bf4b00b0016392bd5060sm7274738pls.142.2022.05.30.08.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 08:09:55 -0700 (PDT)
Date:   Tue, 31 May 2022 00:09:49 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@infradead.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dma-fence: allow dma fence to have their own lock
Message-ID: <YpTePTj6rrHYN0QT@google.com>
References: <20220530142232.2871634-1-senozhatsky@chromium.org>
 <7eee4274-bd69-df8d-9067-771366217804@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7eee4274-bd69-df8d-9067-771366217804@amd.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Christian,

On (22/05/30 16:55), Christian König wrote:
> Hi Sergey,
> 
> I'm removing most of the mail because you have a very fundamental
> misunderstanding about what this dma_fence lock is all about.

Happy to learn.

> Am 30.05.22 um 16:22 schrieb Sergey Senozhatsky:
> > [SNIP]
> > So the `lock` should have at least same lifespan as the DMA fence
> > that borrows it, which is impossible to guarantee in our case.
>
> Nope, that's not correct. The lock should have at least same lifespan as the
> context of the DMA fence.

In our case we have one context and it lives as long as the module is loaded.
Does this mean that all DMA fences within that context should be serialized
by a single spinlock? We can have a number of "active" fences so the lock
can become a bit congested. But each operation creates, exports and signals
just once fence.

> The idea here is that DMA fence signaling and callback calling serializes.
> E.g. when you have fence a,b,c,d... they must signal in the order a,b,c,d...
> and that's what this lock is good for.

Hmm, OK. So that borrowed ->lock is in fact something like
context_lock_irqsave() and context_unlock_irqrestore().

> If you just want to create a single dma_fence which is also only bound to a
> single context you can embed the lock into the fence without much problem.

Aha, I guess this is what we need then. I'll take a look. Thanks.
