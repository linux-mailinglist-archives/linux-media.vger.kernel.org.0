Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7205321F583
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 16:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728433AbgGNO4C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 10:56:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbgGNO4C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 10:56:02 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B25DC061755;
        Tue, 14 Jul 2020 07:56:02 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id b6so22217504wrs.11;
        Tue, 14 Jul 2020 07:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=RqFq1NaLVNBIbToXT9qdq38OqjbXpvM12of+sWUmP7I=;
        b=gBNtZsvrx4arqCLByJfpm1CJFbuHVxJkcIsiXkaN7kRCcGVANFq/R31nplss35s0tX
         YTSXHDr+fRVAFlZZKe4L+6vdczqhmsJKNGVVd1w9h8A1olPpacZTWcY8QTJlSXF5iFT8
         c9IZhwt2CxBJ+jkgDhPB/Doo6jLEJRw7u/o4/l1tc5/NqHywdJpx/lT+a+j+9LnqAr78
         02UKzZ89srNbdrQ7Do/+qDKiT9Ne5v5tsnXgh3/hd0k8Er6YdIxnj00PKqpVxLrfZSu2
         3ZGQ17bn6SKQrotc040woUNPtsjKeo7NjI9D2HklW3Ax7LTAG4NidhX+gluf2tQFmqjR
         YkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=RqFq1NaLVNBIbToXT9qdq38OqjbXpvM12of+sWUmP7I=;
        b=biRZ4CBH341qGKvvzaHm5x+s/Q0Yc2nC1koEcCpKB8rH7ZX+yS3gZgDfGCeL3N+9Ww
         E//W/wAZ04b31N60ksiaGIuCfjNQSxevfhvbJyyAJx8nh/jq93aGG0AbxgJVWPWOr88p
         XqRMptuXwuEhNTWNDcZ0wEx9TXeX6PXEdLTTjeShSdP/dTpZpTSwAUhcx5P7EZxBI7up
         0q6HbcrBqaXr/vseqq6wYtesuPlYRcb352meT3e3SDTEkQBvNy0P9VdADC0wRg3Sxs3c
         2rO4mV0rxcZCZxIttKPa0msSGGCZQcnQLqykZBuWUmq7iZwQ1uwheOHfVaM7sRE57Fer
         icrA==
X-Gm-Message-State: AOAM530LwezmST5qV3++AgBlljkEmucAD0wGSOGQGXCCdiqR7O4DAMI5
        PLYHeGCUcNYC3qs8DCnA7lk=
X-Google-Smtp-Source: ABdhPJwQyYnurrKzmkh5mIhbZp11kOQERD+D2QEXfAJk6Km1H0q74KOlTFspmFoiBPP7G77IvTX4fg==
X-Received: by 2002:adf:e38d:: with SMTP id e13mr6211703wrm.304.1594738560705;
        Tue, 14 Jul 2020 07:56:00 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
        by smtp.gmail.com with ESMTPSA id k131sm4935268wmb.36.2020.07.14.07.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 07:56:00 -0700 (PDT)
Date:   Tue, 14 Jul 2020 11:55:53 -0300
From:   Melissa Wen <melissa.srw@gmail.com>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Trevor Woerner <twoerner@gmail.com>
Subject: Re: [PATCH 04/25] drm/vkms: Annotate vblank timer
Message-ID: <20200714145553.zetjvbewixnf2rla@smtp.gmail.com>
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
 <20200707201229.472834-5-daniel.vetter@ffwll.ch>
 <20200712222716.4rhvj7hryiecjthv@smtp.gmail.com>
 <20200714095717.njwk2u4tkgro54jn@smtp.gmail.com>
 <CAKMK7uGu4N2oe04N=haUodmVCLi6HnqFDORkObx8EPUQrEJ+MQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKMK7uGu4N2oe04N=haUodmVCLi6HnqFDORkObx8EPUQrEJ+MQ@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 07/14, Daniel Vetter wrote:
> On Tue, Jul 14, 2020 at 11:57 AM Melissa Wen <melissa.srw@gmail.com> wrote:
> >
> > On 07/12, Rodrigo Siqueira wrote:
> > > Hi,
> > >
> > > Everything looks fine to me, I just noticed that the amdgpu patches did
> > > not apply smoothly, however it was trivial to fix the issues.
> > >
> > > Reviewed-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > >
> > > Melissa,
> > > Since you are using vkms regularly, could you test this patch and review
> > > it? Remember to add your Tested-by when you finish.
> > >
> > Hi,
> >
> > I've applied the patch series, ran some tests on vkms, and found no
> > issues. I mean, things have remained stable.
> >
> > Tested-by: Melissa Wen <melissa.srw@gmail.com>
> 
> Did you test with CONFIG_PROVE_LOCKING enabled in the kernel .config?
> Without that enabled, there's not really any change here, but with
> that enabled there might be some lockdep splats in dmesg indicating a
> problem.
>

Even with the lock debugging config enabled, no new issue arose in dmesg
during my tests using vkms.

Melissa

> Thanks, Daniel
> >
> > > Thanks
> > >
> > > On 07/07, Daniel Vetter wrote:
> > > > This is needed to signal the fences from page flips, annotate it
> > > > accordingly. We need to annotate entire timer callback since if we get
> > > > stuck anywhere in there, then the timer stops, and hence fences stop.
> > > > Just annotating the top part that does the vblank handling isn't
> > > > enough.
> > > >
> > > > Cc: linux-media@vger.kernel.org
> > > > Cc: linaro-mm-sig@lists.linaro.org
> > > > Cc: linux-rdma@vger.kernel.org
> > > > Cc: amd-gfx@lists.freedesktop.org
> > > > Cc: intel-gfx@lists.freedesktop.org
> > > > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > Cc: Christian K�nig <christian.koenig@amd.com>
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > > > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > ---
> > > >  drivers/gpu/drm/vkms/vkms_crtc.c | 8 +++++++-
> > > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > index ac85e17428f8..a53a40848a72 100644
> > > > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > @@ -1,5 +1,7 @@
> > > >  // SPDX-License-Identifier: GPL-2.0+
> > > >
> > > > +#include <linux/dma-fence.h>
> > > > +
> > > >  #include <drm/drm_atomic.h>
> > > >  #include <drm/drm_atomic_helper.h>
> > > >  #include <drm/drm_probe_helper.h>
> > > > @@ -14,7 +16,9 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
> > > >     struct drm_crtc *crtc = &output->crtc;
> > > >     struct vkms_crtc_state *state;
> > > >     u64 ret_overrun;
> > > > -   bool ret;
> > > > +   bool ret, fence_cookie;
> > > > +
> > > > +   fence_cookie = dma_fence_begin_signalling();
> > > >
> > > >     ret_overrun = hrtimer_forward_now(&output->vblank_hrtimer,
> > > >                                       output->period_ns);
> > > > @@ -49,6 +53,8 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
> > > >                     DRM_DEBUG_DRIVER("Composer worker already queued\n");
> > > >     }
> > > >
> > > > +   dma_fence_end_signalling(fence_cookie);
> > > > +
> > > >     return HRTIMER_RESTART;
> > > >  }
> > > >
> > > > --
> > > > 2.27.0
> > > >
> > >
> > > --
> > > Rodrigo Siqueira
> > > https://siqueira.tech
> >
> >
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
