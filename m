Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2080027C0B4
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 11:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbgI2JOv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 05:14:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727650AbgI2JOu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 05:14:50 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01153C0613D1
        for <linux-media@vger.kernel.org>; Tue, 29 Sep 2020 02:14:49 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id x14so4461563wrl.12
        for <linux-media@vger.kernel.org>; Tue, 29 Sep 2020 02:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=nL1RJ1CBsQM4FRjSLIq4hF2LWibhorMGgFGx7FERzoU=;
        b=gdHdOjUtbzxqgqGnhYkIQLu0EJiUF0CxOiu4yUaVxxsB4Y1RcTXJZcQOXBz5fuywkl
         3wLF7s89+6APQbGCO/in/zuRexI7frcXl+jlrQB4dr5Rj/Ic/VLtFtQncOVf2Pof5qEi
         AuckYtsq3x9uMOT/b5FP7SeE6uEKI90YGf5II=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=nL1RJ1CBsQM4FRjSLIq4hF2LWibhorMGgFGx7FERzoU=;
        b=VWn0jOGAMuFNz6Ln4fcjELgN8YGkWSNlaX6fH4V/J8iNQFh2Xl9JiDzgPpt7UvAaFC
         O7urhaxNXN5hg/547Grj9lnXjOccULUqYgI8Ipj1rkQ+VhjYmpvOkT0mZzpa1XtP/7zP
         Cu/BKbIlU3tnSnx/SFW22Pwuar5bRebaLNMqFcpSliYr79koMzYOfjkDdgWz1Y5nXOcv
         jitPqKN81v81VYVfMFRFQE0rr2PufKIyzje8Wuw8DuybWdBTcD+r8D7v8cK2ERNI6Out
         7A+kHSjzGFtEusZ5jHpjyQQwZmYMWJpBc6GyBMLeJw3UmBwNG7f+lE/0+ZncYf43oK82
         6LTg==
X-Gm-Message-State: AOAM5321WKYD7PQCb0M9WG2oua7lWzUEj83iFOrf28a29QacbPK7kY+r
        hjFolEGo6ANmmXQc5AhZhNj4rg==
X-Google-Smtp-Source: ABdhPJzUpk5sRYoMWrtr0UlpR9ORIRx/KJD45hyn02zRFIKDUXFqG2Is9+7QHPaCNhxuEtvE05yF9A==
X-Received: by 2002:a5d:470e:: with SMTP id y14mr3112131wrq.354.1601370888619;
        Tue, 29 Sep 2020 02:14:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id l126sm4669148wmf.39.2020.09.29.02.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 02:14:47 -0700 (PDT)
Date:   Tue, 29 Sep 2020 11:14:45 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>, linux-doc@vger.kernel.org,
        airlied@linux.ie, dri-devel@lists.freedesktop.org,
        thierry.reding@gmail.com, kraxel@redhat.com, afd@ti.com,
        m.szyprowski@samsung.com, arnd@arndb.de, corbet@lwn.net,
        jonathanh@nvidia.com, matthew.auld@intel.com,
        linux+etnaviv@armlinux.org.uk, labbott@redhat.com,
        linux-media@vger.kernel.org, pawel@osciak.com,
        intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, thomas.hellstrom@intel.com,
        rodrigo.vivi@intel.com, linux-tegra@vger.kernel.org,
        mchehab@kernel.org, gregkh@linuxfoundation.org,
        lmark@codeaurora.org, tfiga@chromium.org,
        kyungmin.park@samsung.com, robin.murphy@arm.com
Subject: Re: [PATCH v3 0/4] dma-buf: Flag vmap'ed memory as system or I/O
 memory
Message-ID: <20200929091445.GI438822@phenom.ffwll.local>
References: <20200925115601.23955-1-tzimmermann@suse.de>
 <20200926071334.GA42915@ravnborg.org>
 <8761e0dd-569e-0ea0-7bc5-25e4f7cb67cc@suse.de>
 <20200927191605.GA237178@ravnborg.org>
 <3f703297-7b4f-dcca-ea56-70b2413a1e3d@amd.com>
 <ef4400a7-397b-e550-7114-1d4238dd36f3@suse.de>
 <49c4dcec-cd69-510a-9781-e8fa5fb669f9@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49c4dcec-cd69-510a-9781-e8fa5fb669f9@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 28, 2020 at 01:22:13PM +0200, Christian König wrote:
> Am 28.09.20 um 09:37 schrieb Thomas Zimmermann:
> > Hi
> > 
> > Am 28.09.20 um 08:50 schrieb Christian König:
> > > Am 27.09.20 um 21:16 schrieb Sam Ravnborg:
> > > > Hi Thomas.
> > > > 
> > > > > > struct simap {
> > > > > >          union {
> > > > > >                  void __iomem *vaddr_iomem;
> > > > > >                  void *vaddr;
> > > > > >          };
> > > > > >          bool is_iomem;
> > > > > > };
> > > > > > 
> > > > > > Where simap is a shorthand for system_iomem_map
> > > > > > And it could al be stuffed into a include/linux/simap.h file.
> > > > > > 
> > > > > > Not totally sold on the simap name - but wanted to come up with
> > > > > > something.
> > > > > Yes. Others, myself included, have suggested to use a name that does not
> > > > > imply a connection to the dma-buf framework, but no one has come up with
> > > > >    a good name.
> > > > > 
> > > > > I strongly dislike simap, as it's entirely non-obvious what it does.
> > > > > dma-buf-map is not actually wrong. The structures represents the mapping
> > > > > of a dma-able buffer in most cases.
> > > > > 
> > > > > > With this approach users do not have to pull in dma-buf to use it and
> > > > > > users will not confuse that this is only for dma-buf usage.
> > > > > There's no need to enable dma-buf. It's all in the header file without
> > > > > dependencies on dma-buf. It's really just the name.
> > > > > 
> > > > > But there's something else to take into account. The whole issue here is
> > > > > that the buffer is disconnected from its originating driver, so we don't
> > > > > know which kind of memory ops we have to use. Thinking about it, I
> > > > > realized that no one else seemed to have this problem until now.
> > > > > Otherwise there would be a solution already. So maybe the dma-buf
> > > > > framework *is* the native use case for this data structure.
> > > > We have at least:
> > > > linux/fb.h:
> > > >      union {
> > > >          char __iomem *screen_base;      /* Virtual address */
> > > >          char *screen_buffer;
> > > >      };
> > > > 
> > > > Which solve more or less the same problem.
> > I thought this was for convenience. The important is_iomem bit is missing.
> > 
> > > I also already noted that in TTM we have exactly the same problem and a
> > > whole bunch of helpers to allow operations on those pointers.
> > How do you call this within TTM?
> 
> ttm_bus_placement, but I really don't like that name.
> 
> > 
> > The data structure represents a pointer to either system or I/O memory,
> > but not necessatrily device memory. It contains raw data. That would
> > give something like
> > 
> >    struct databuf_map
> >    struct databuf_ptr
> >    struct dbuf_map
> >    struct dbuf_ptr
> > 
> > My favorite would be dbuf_ptr. It's short and the API names would make
> > sense: dbuf_ptr_clear() for clearing, dbuf_ptr_set_vaddr() to set an
> > address, dbuf_ptr_incr() to increment, etc. Also, the _ptr indicates
> > that it's a single address; not an offset with length.
> 
> Puh, no idea. All of that doesn't sound like it 100% hits the underlying
> meaning of the structure.

Imo first let's merge this and then second with more users we might come
up with a better name. And cocci is fairly good at large-scale rename, to
the point where we manged to rename struct fence to struct dma_fence.

Also this entire thread here imo shows that we haven't yet figured out the
perfect name anyway, and I don't think it's worth it to hold this up
because of this bikeshed :-)

Cheers, Daniel

> 
> Christian.
> 
> > 
> > Best regards
> > Thomas
> > 
> > > Christian.
> > > 
> > > > > Anyway, if a better name than dma-buf-map comes in, I'm willing to
> > > > > rename the thing. Otherwise I intend to merge the patchset by the end of
> > > > > the week.
> > > > Well, the main thing is that I think this shoud be moved away from
> > > > dma-buf. But if indeed dma-buf is the only relevant user in drm then
> > > > I am totally fine with the current naming.
> > > > 
> > > > One alternative named that popped up in my head: struct sys_io_map {}
> > > > But again, if this is kept in dma-buf then I am fine with the current
> > > > naming.
> > > > 
> > > > In other words, if you continue to think this is mostly a dma-buf
> > > > thing all three patches are:
> > > > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > > > 
> > > >      Sam
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
