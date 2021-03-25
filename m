Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75531349BB2
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 22:34:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230470AbhCYVeA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 17:34:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230500AbhCYVd6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 17:33:58 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD580C061761
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 14:33:57 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id j18so3745579wra.2
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 14:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=TXHI1OxX+D4iSzKCuoMMss3yjiQz/+KLKVrP99q3G2I=;
        b=frvH/QuNUnODqvtDdusaUFppblhOygLUWsC1ixB43GNG2Cc+yxM2WFbRWpgjN4Ju8Y
         95PeIsuDNMn98oqagJ3ef1Nu2yOkiL1vvMi/6inWwQyeTtLH5DD3GrBLCXNufjRYGMCK
         r/gFSHALeS9GIhicmr/nrrhcB3MijIi/RQZtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=TXHI1OxX+D4iSzKCuoMMss3yjiQz/+KLKVrP99q3G2I=;
        b=gZemiMmTBvd9is0NZ6qDwJlrIJdO++bTTRd9mrSwniP8XfIi7mS1hLCZDuAZ0327M5
         OtkbBy3EFtF/p1DIl9egbxoo0bDyfuhx2CRllZrWs6nnmGzJP2NTbZzB9S+9tT5wIUeh
         XM8g+GlIm6oJMMYM/e769E8cHORef7YbTCMXOpGRH46oNMxeSDAqWwgzhFHQEhNv5pM3
         WPP4le1Rx5tp6GkHzkgd8vLYw+SNu3UtIHiLi/ugjcmht4Y3F7Ywbo6O5tEte4Ie4J/+
         c5UfX1lqPqMeWc2pT/nTh/BeEefbQA/P+Ar+2BmLTEomNo51wMjQDdIJ7PHLNg9Er3d8
         ZQ2w==
X-Gm-Message-State: AOAM533GUFJ2st+KjRaBqS+ulItm+PVA1JTBX2s39bYY8zrlvUVMoRvG
        xcSf5WTUgnLHQAGIWbu8/VR9AA==
X-Google-Smtp-Source: ABdhPJwn8UAApYENGs0EsRiOl6kaa4IOv1NsIwYwvHs5ZhbA+T+EIOa3Ak0sCs/YbuNvp+I4gerYDg==
X-Received: by 2002:adf:e8c9:: with SMTP id k9mr10992298wrn.315.1616708036367;
        Thu, 25 Mar 2021 14:33:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id x13sm1115693wmp.39.2021.03.25.14.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 14:33:55 -0700 (PDT)
Date:   Thu, 25 Mar 2021 22:33:53 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jason Gunthorpe <jgg@nvidia.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        3pvd@google.com, Jann Horn <jannh@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Peter Xu <peterx@redhat.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH 3/3] mm: unexport follow_pfn
Message-ID: <YF0BwfzqpPLuFTw+@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@nvidia.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        3pvd@google.com, Jann Horn <jannh@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>, Peter Xu <peterx@redhat.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Daniel Vetter <daniel.vetter@intel.com>
References: <20210316153303.3216674-1-daniel.vetter@ffwll.ch>
 <20210316153303.3216674-4-daniel.vetter@ffwll.ch>
 <20210324125211.GA2356281@nvidia.com>
 <YFuQNj10P+uUHD4G@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YFuQNj10P+uUHD4G@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 24, 2021 at 08:17:10PM +0100, Daniel Vetter wrote:
> On Wed, Mar 24, 2021 at 09:52:11AM -0300, Jason Gunthorpe wrote:
> > On Tue, Mar 16, 2021 at 04:33:03PM +0100, Daniel Vetter wrote:
> > > Both kvm (in bd2fae8da794 ("KVM: do not assume PTE is writable after
> > > follow_pfn")) and vfio (in 07956b6269d3 ("vfio/type1: Use
> > > follow_pte()")) have lost their callsites of follow_pfn(). All the
> > > other ones have been switched over to unsafe_follow_pfn because they
> > > cannot be fixed without breaking userspace api.
> > > 
> > > Argueably the vfio code is still racy, but that's kinda a bigger
> > > picture. But since it does leak the pte beyond where it drops the pt
> > > lock, without anything else like an mmu notifier guaranteeing
> > > coherence, the problem is at least clearly visible in the vfio code.
> > > So good enough with me.
> > > 
> > > I've decided to keep the explanation that after dropping the pt lock
> > > you must have an mmu notifier if you keep using the pte somehow by
> > > adjusting it and moving it into the kerneldoc for the new follow_pte()
> > > function.
> > > 
> > > Cc: 3pvd@google.com
> > > Cc: Jann Horn <jannh@google.com>
> > > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > > Cc: Jason Gunthorpe <jgg@nvidia.com>
> > > Cc: Cornelia Huck <cohuck@redhat.com>
> > > Cc: Peter Xu <peterx@redhat.com>
> > > Cc: Alex Williamson <alex.williamson@redhat.com>
> > > Cc: linux-mm@kvack.org
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Cc: linux-samsung-soc@vger.kernel.org
> > > Cc: linux-media@vger.kernel.org
> > > Cc: kvm@vger.kernel.org
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > ---
> > >  include/linux/mm.h |  2 --
> > >  mm/memory.c        | 26 +++++---------------------
> > >  mm/nommu.c         | 13 +------------
> > >  3 files changed, 6 insertions(+), 35 deletions(-)
> > 
> > I think this is the right thing to do.
> 
> Was just about to smash this into the topic branch for testing in
> linux-next. Feel like an ack on the series, or at least the two mm
> patches?

Pushed them to my topic branch for a bit of testing in linux-next,
hopefully goes all fine for a pull for 5.13.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
