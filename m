Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCA6853A967
	for <lists+linux-media@lfdr.de>; Wed,  1 Jun 2022 16:52:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353561AbiFAOwu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jun 2022 10:52:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233844AbiFAOwt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jun 2022 10:52:49 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE1B5403D4
        for <linux-media@vger.kernel.org>; Wed,  1 Jun 2022 07:52:48 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id n13-20020a17090a394d00b001e30a60f82dso6483108pjf.5
        for <linux-media@vger.kernel.org>; Wed, 01 Jun 2022 07:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=f+l3Hk+6FFyk8vfmjX/U6HXz2Y13gVkjD8RbjyOHnBg=;
        b=T5QqxGoUWNlBhCvVCWar98KbLBlFh2IAuojNaK8vvjKwgDeliiAt4f3t71WOdr8+Py
         HHMOe73t4gfkGJiwHy+Hm70Yy7VauFSTuriqV7I5dLMxENsXS5NHU703r5zm8sGzuyvW
         ERZjD24VHVXiLLmqN1EGXjLw6PBs9QKqmrdhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=f+l3Hk+6FFyk8vfmjX/U6HXz2Y13gVkjD8RbjyOHnBg=;
        b=RAMteC4knsMRNrB9JGoOqbDo8e4gvupUJ3ZUfaIQuG+MyfHCm3G6t0mpBy3/BpoBf/
         tSLkqw8RkmodjZo4kpY3Ym+BTIifOn5Ev1zyLTuOXx82CTTEUW6ztffysYdTTepnxIC5
         sQX+I1Sm8aMgqpaAjrERq1P+IiS8XLBAmhUqX2sIRCuKBROLZBEAe+u/x0WSaCZPoZ6I
         PM2ADizuCm3t+Czcjt9Ugijulc/iN2Tdjb07h+aV5DE60B9M2FNijHhc44fdllwWMQZ/
         HSQ+XkaKjdHhkKL7QWCRvuStVLrWsnRX/5GdpWUu1Wh4Jo96DihPRyJnMB/n7gPJsg0I
         GS9Q==
X-Gm-Message-State: AOAM531HrkzqAYKgF2+yX2nGOwONU7cmFLjkgAjn2nPMLGNKTe1zyX4N
        6V4SXRz7xgJZ2XFyI+1IBfpvVw==
X-Google-Smtp-Source: ABdhPJzKbPPwilL4Mlo2lBLeWQY4KScURQiGlR+yz2oCKIOnCppVLjpaiJcEObTKUBj8vtB6Oz8esg==
X-Received: by 2002:a17:902:d2c1:b0:165:d4cd:e118 with SMTP id n1-20020a170902d2c100b00165d4cde118mr125029plc.4.1654095168205;
        Wed, 01 Jun 2022 07:52:48 -0700 (PDT)
Received: from google.com ([240f:75:7537:3187:ec3a:4b49:34bc:e5b4])
        by smtp.gmail.com with ESMTPSA id u79-20020a627952000000b0051ba7515e0dsm1629431pfc.54.2022.06.01.07.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 07:52:47 -0700 (PDT)
Date:   Wed, 1 Jun 2022 23:52:41 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@infradead.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-fence: allow dma fence to have
 their own lock
Message-ID: <Ypd9OSqMtGMVKYZ0@google.com>
References: <20220530142232.2871634-1-senozhatsky@chromium.org>
 <7eee4274-bd69-df8d-9067-771366217804@amd.com>
 <YpWCvniLzJfcp684@google.com>
 <33aba213-b6ad-4a15-9272-c62f5dfb1fb7@gmail.com>
 <Ypd3Us3a93aLonqT@google.com>
 <a009c207-a5fa-af1e-b961-8083b48360bf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a009c207-a5fa-af1e-b961-8083b48360bf@gmail.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (22/06/01 16:38), Christian König wrote:
> > > Well, you don't.
> > > 
> > > If you have a dynamic context structure you need to reference count that as
> > > well. In other words every time you create a fence in your context you need
> > > to increment the reference count and every time a fence is release you
> > > decrement it.
> > OK then fence release should be able to point back to its "context"
> > structure. Either a "private" data in dma fence or we need to "embed"
> > fence into another object (refcounted) that owns the lock and provide
> > dma fence ops->release callback, which can container_of() to the object
> > that dma fence is embedded into.
> > 
> > I think you are suggesting the latter. Thanks for clarifications.
> 
> Daniel might hurt me for this, but if you really only need a pointer to your
> context then we could say that using a pointer value for the context field
> is ok as well.
> 
> That should be fine as well as long as you can guarantee that it will be
> unique during the lifetime of all it's fences.

I think we can guarantee that. Object that creates fence is kmalloc-ed and
it sticks around until dma_fence_release() calls ops->release() and kfree-s
it. We *probably* can even do something like it now, by re-purposing dma_fence
context member:

        dma_fence_init(obj->fence,
                       &fence_ops,
                       &obj->fence_lock,
                       (u64)obj,                             <<   :/
                       atomic64_inc_return(&obj->seqno));

I'd certainly refrain from being creative here and doing things that
are not documented/common. DMA fence embedding should work for us.

> > The limiting factor of this approach is that now our ops->release() is
> > under the same "pressure" as dma_fence_put()->dma_fence_release() are.
> > dma_fence_put() and dma_fence_release() can be called from any context,
> > as far as I understand, e.g. IRQ, however our normal object ->release
> > can schedule, we do things like synchronize_rcu() and so on. Nothing is
> > impossible, just saying that even this approach is not 100% perfect and
> > may need additional workarounds.
> 
> Well just use a work item for release.

Yup, that's the plan.
