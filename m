Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7E4B2C68CF
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 16:37:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730624AbgK0PhD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 10:37:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728495AbgK0PhD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 10:37:03 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6DF2C0613D1
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2020 07:37:01 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id l1so5988645wrb.9
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2020 07:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=K1Lvq4AT8euTQFOTDi7SD1yQLWPU3xtKj6SslzOCQcc=;
        b=j0CTYxjISTzyYB3fnH07BP1SfkXZdDJFFx3Fq1Vh21kSx5OS6XHKFajDvVcGcx8pA8
         cPCJqXp/h1c+KknHtBJuMbi8uavr493P4Sb/k+TrVqytxJYTAlRNAo2DznOvjz/xp51u
         jzdWE2vocNjByPF32K8tQ5Xdol/Cx8Q13Vf3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=K1Lvq4AT8euTQFOTDi7SD1yQLWPU3xtKj6SslzOCQcc=;
        b=CbULuNw0mePPdC7wZ2M3OjU8dRgqwAF9I4Uxuh7scmW9V7+5jVEf3j/q9EP+cfqOE9
         ccVDVLNfdc1VNZc1DFui03enNGzD4YXsvM1SttLbb8e1zmFoChZS8iAEHl657R3GX2TW
         vKWl/CRo1v6UofUxpXustR8lPyssDdUqttPe/j67veCR8YHJnonGLcDOWl13RHt7eBcF
         RIiJfFC+DDa3U5OeCd6yVD9HnNtbSrR6o46uZYyUKcDr6yjuwBw0ITkeRxVgoIFzGzWV
         ITkQArUc5ExYTnG/iQjsmr2cXwWWLi4l92NveSHTLkh1txP5bM0pOE+W7D/KmdPZMIJm
         8hLQ==
X-Gm-Message-State: AOAM5320SVrRKZphnXnSctj7J8RjOFoF1baqXrWIrCMHcGOXo+HnOJU6
        GSXNKryyJXUinqHQ/zGWMORQUw==
X-Google-Smtp-Source: ABdhPJw+HtnvrbrT1AqdueQE1hAvJ6eYSG3hDtZ8dwkM1q0A/rHWJIoxRYFcjysrLjp6WJc+IFTRWQ==
X-Received: by 2002:adf:dd52:: with SMTP id u18mr10975193wrm.44.1606491420509;
        Fri, 27 Nov 2020 07:37:00 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id t184sm2744650wmt.13.2020.11.27.07.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 07:36:59 -0800 (PST)
Date:   Fri, 27 Nov 2020 16:36:57 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v6 00/17] follow_pfn and other iomap races
Message-ID: <20201127153657.GJ401619@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@ziepe.ca>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org
References: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
 <20201127131225.GX5487@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201127131225.GX5487@ziepe.ca>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 27, 2020 at 09:12:25AM -0400, Jason Gunthorpe wrote:
> On Thu, Nov 19, 2020 at 03:41:29PM +0100, Daniel Vetter wrote:
> > I feel like this is ready for some wider soaking. Since the remaining bits
> > are all kinda connnected probably simplest if it all goes through -mm.
> 
> Did you figure out a sumbission plan for this stuff?

I was kinda hoping Andrew would pick it all up.

> > Daniel Vetter (17):
> >   drm/exynos: Stop using frame_vector helpers
> >   drm/exynos: Use FOLL_LONGTERM for g2d cmdlists
> >   misc/habana: Stop using frame_vector helpers
> >   misc/habana: Use FOLL_LONGTERM for userptr
> >   mm/frame-vector: Use FOLL_LONGTERM
> >   media: videobuf2: Move frame_vector into media subsystem
> 
> At the very least it would be good to get those in right away.
> 
> >   mm: Add unsafe_follow_pfn
> >   media/videbuf1|2: Mark follow_pfn usage as unsafe
> >   vfio/type1: Mark follow_pfn as unsafe
> 
> I'm surprised nobody from VFIO has remarked on this, I think thety
> won't like it

Same here tbh :-)

> >   mm: Close race in generic_access_phys
> >   PCI: Obey iomem restrictions for procfs mmap
> >   /dev/mem: Only set filp->f_mapping
> >   resource: Move devmem revoke code to resource framework
> >   sysfs: Support zapping of binary attr mmaps
> >   PCI: Revoke mappings like devmem
> 
> This sequence seems fairly stand alone, and in good shape as well

Yeah your split makes sense. I'll reorder them for the next round (which
I'm prepping right now).
> 
> My advice is to put the done things on a branch and get Stephen to put
> them in linux-next. You can send a PR to Lins. There is very little mm
> stuff in here, and cross subsystem stuff works better in git land,
> IMHO.

Yeah could do. Andrew, any preferences?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
