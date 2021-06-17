Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 793473ABCA6
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 21:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbhFQT2U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 15:28:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbhFQT2U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 15:28:20 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87B92C061574
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 12:26:10 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id m18so8000265wrv.2
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 12:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=uOCbhZ/ibkRBObHTOgKs1UFBQ9qhD4uIcfjgRg2K5Rs=;
        b=IH1EtHRcSfinmclrpIc4Ng6Z7QMgqeen5j6b9qDw9LlX3wUMNyz7FR5R2CPO52LkTf
         QD+gv9wIv5pC6wI/j5ngc570YTPSoQC2HVxc+/PgCaUlG19XD4VHTKEeFdM63kxC4KXb
         RWLz1Vo9kZ1DZtt0ovCaSIdBs4XA0bFdD5FjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=uOCbhZ/ibkRBObHTOgKs1UFBQ9qhD4uIcfjgRg2K5Rs=;
        b=d1JzNtW5yXy8U5x65+8sPb1Kz4ca81ffOldv3LGJF8mB0odH1NsntpVV7quqTBT3A0
         CzhRigCnuWPKlHrXYAFa2acw4OHI2nIHFcqBMTbxvXa0KiNyRDHcpxo+NGzvAUhD+ORh
         TYnJpb33G3ATBpIN98yBvz+L7ZwGkOpAx9pU9GIAjnL7ctBzwhTIej1/VXWQKqfI+qJY
         yNzfbbjnvlN+0RSkqOpeoyuBfW/3bi+V4vQGHs/LQXzkwNlwQA1PUT0b/0Suho931J1/
         J9bcrhQwAz8KzaKBGusBt8I5YJ40GFVbOOluPfsKjsWDsspCo4U0p/fUovFvs+uckHT7
         5Jfg==
X-Gm-Message-State: AOAM530VzaKxA1i8IHJ1jGZGU345XOxlpvgUY0bSbusRzTQTdXZFzVQY
        ui3e2ksWuKPHU7qooUqGDYMDag==
X-Google-Smtp-Source: ABdhPJyFfhTApY3wh24dH1FBegs1U/7U9Tg5s0DawhN6NGiIRg2uLHMj8Cb4gBd6mBJpG1xllNPadg==
X-Received: by 2002:adf:e80c:: with SMTP id o12mr4048275wrm.425.1623957969045;
        Thu, 17 Jun 2021 12:26:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id r6sm6181038wrz.91.2021.06.17.12.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 12:26:08 -0700 (PDT)
Date:   Thu, 17 Jun 2021 21:26:06 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        sumit.semwal@linaro.org
Subject: Re: [PATCH 1/7] dma-buf: add some more kerneldoc to
 dma_resv_add_shared_fence
Message-ID: <YMuhzpyiNMSz3Nx+@phenom.ffwll.local>
References: <20210616082655.111001-1-christian.koenig@amd.com>
 <20210616082655.111001-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210616082655.111001-2-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 16, 2021 at 10:26:49AM +0200, Christian König wrote:
> Explicitly document that code can't assume that shared fences
> signal after the exclusive fence.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-resv.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index f26c71747d43..4ab02b6c387a 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -235,7 +235,10 @@ EXPORT_SYMBOL(dma_resv_reset_shared_max);
>   * @fence: the shared fence to add
>   *
>   * Add a fence to a shared slot, obj->lock must be held, and
> - * dma_resv_reserve_shared() has been called.
> + * dma_resv_reserve_shared() has been called. The shared fences can signal in
> + * any order and there is especially no guarantee that shared fences signal
> + * after the exclusive one. Code relying on any signaling order is broken and
> + * needs to be fixed.

So I agree this are reasonable semantics, but you need to audit drivers
first. Because currently that's not how at least a bunch of them work.
There's way more drivers than the handful you've looked at.

Imo gold standard here is what I've tried doing for the "how do we set
fences" side, which is going through all of them. The trouble is that this
is a bit nastier, because a) drivers play much more tricks here and b)
understand each driver's scheduling logic is more work than how they set
fences for a request/cs.

Unfortunately I haven't gotten around to doing that yet, because it means
a few days of uninterrupted time crawling through way too much code. I
haven't even found time to respin my old series to make the fence setting
more consistent (since I find a few more issues there than just the amdgpu
one that sparked it all).
-Daniel

>   */
>  void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
>  {
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
