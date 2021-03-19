Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 915EB3423CB
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 18:56:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbhCSRz2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 13:55:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230296AbhCSRzW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 13:55:22 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65777C06175F
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 10:55:22 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id b2-20020a7bc2420000b029010be1081172so5702831wmj.1
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 10:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=H4E5zo6M+sGFb9jJfPuBMekAUt72xfRBAZEVdNXvosI=;
        b=HkWCKtqano6hr83mTvHPNb1mTJD7j++xG4i3V1pZc+fMnH//eWACXOeqWIMYDAyiqD
         CWBkqUiJ1zmtZ3OlxFIY9DcUS/euNcLz8nxn4AxgvZ1rE5qJAgMaRKnutzlS1iCHVLZf
         S1ATj65HkMPVN9VP3K+xuo111cO9NYWhg1scM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=H4E5zo6M+sGFb9jJfPuBMekAUt72xfRBAZEVdNXvosI=;
        b=fd0qGEOkfIDqWUGaF2K4QJGGqd66yzaEvHfb1boAf74jyAKA8jRwo9DzAd068s8+yn
         KCbEVNRHqCxvvZvooFBxNAnNNt64W/PdpM9TpfDlLW+DEH0gHU5Hy375CblL4rcYlT8a
         3ewCAfdpqtC22YE/D107pMexxsCuuYFA8XOZnPbEUykIRNJG0+cY5H5DrE43tPMYDxiC
         9V37o4BlHZRJ2P3v531oG70/W/F+ZVFuNGdFJBevXvpKsbjBXe5Nc7iwx1I8c8XHVmiu
         9o+DG3NcY8ZSEDNXHIP46rBNNub9bRj6n/EDo3MY0qf9JdJvn5R2+XyE9NEE5vyBavUE
         Tx5g==
X-Gm-Message-State: AOAM532LDRZk+MiLYE38x1RPJVFIxCV+2ZX6DDGRzJsm1t/Dr7hTGPjz
        JwE00fGuP1hjQpGxf107F5WC4Q==
X-Google-Smtp-Source: ABdhPJznH8/2o31By7revAgfT3dpRwhrdpC+rY/yFumwMUBtQGtz1iOu7IVxYDezg1HGlBR9UX23fg==
X-Received: by 2002:a7b:c0c3:: with SMTP id s3mr4743813wmh.11.1616176521069;
        Fri, 19 Mar 2021 10:55:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id s3sm7109143wmd.21.2021.03.19.10.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 10:55:20 -0700 (PDT)
Date:   Fri, 19 Mar 2021 18:55:18 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Roland Scheidegger <sroland@vmware.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Anthony Koo <Anthony.Koo@amd.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Colin Ian King <colin.king@canonical.com>,
        Dave Airlie <airlied@redhat.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Harry Wentland <harry.wentland@amd.com>,
        Jeremy Kolb <jkolb@brandeis.edu>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Leo Li <sunpeng.li@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>, Lyude Paul <lyude@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Nouveau Dev <nouveau@lists.freedesktop.org>,
        Qinglang Miao <miaoqinglang@huawei.com>,
        Rob Clark <rob.clark@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Zack Rusin <zackr@vmware.com>
Subject: Re: [RESEND 00/53] Rid GPU from W=1 warnings
Message-ID: <YFTlhh1ZSFffO+Nr@phenom.ffwll.local>
Mail-Followup-To: Lee Jones <lee.jones@linaro.org>,
        Roland Scheidegger <sroland@vmware.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Anthony Koo <Anthony.Koo@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Colin Ian King <colin.king@canonical.com>,
        Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Harry Wentland <harry.wentland@amd.com>,
        Jeremy Kolb <jkolb@brandeis.edu>,
        Kuogee Hsieh <khsieh@codeaurora.org>, Leo Li <sunpeng.li@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
        Lyude Paul <lyude@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Nouveau Dev <nouveau@lists.freedesktop.org>,
        Qinglang Miao <miaoqinglang@huawei.com>,
        Rob Clark <rob.clark@linaro.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Sumit Semwal <sumit.semwal@linaro.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Zack Rusin <zackr@vmware.com>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
 <16d4300e-bf29-1e85-317b-53d257890cb9@vmware.com>
 <20210308091932.GB4931@dell>
 <YEobySvG0zPs9xhc@phenom.ffwll.local>
 <20210311135152.GT701493@dell>
 <20210317081729.GH701493@dell>
 <CAKMK7uEibsgXXTEM1d2CGSswp-koouPSouseP_rwLHTdpxfRpw@mail.gmail.com>
 <CAKMK7uHkJGDL8k3FfAqAM78honZR0euMcacW8UpdPZfS1J-7cA@mail.gmail.com>
 <20210319082407.GG2916463@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319082407.GG2916463@dell>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 19, 2021 at 08:24:07AM +0000, Lee Jones wrote:
> On Thu, 18 Mar 2021, Daniel Vetter wrote:
> 
> > On Wed, Mar 17, 2021 at 9:32 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Wed, Mar 17, 2021 at 9:17 AM Lee Jones <lee.jones@linaro.org> wrote:
> > > >
> > > > On Thu, 11 Mar 2021, Lee Jones wrote:
> > > >
> > > > > On Thu, 11 Mar 2021, Daniel Vetter wrote:
> > > > >
> > > > > > On Mon, Mar 08, 2021 at 09:19:32AM +0000, Lee Jones wrote:
> > > > > > > On Fri, 05 Mar 2021, Roland Scheidegger wrote:
> > > > > > >
> > > > > > > > The vmwgfx ones look all good to me, so for
> > > > > > > > 23-53: Reviewed-by: Roland Scheidegger <sroland@vmware.com>
> > > > > > > > That said, they were already signed off by Zack, so not sure what
> > > > > > > > happened here.
> > > > > > >
> > > > > > > Yes, they were accepted at one point, then dropped without a reason.
> > > > > > >
> > > > > > > Since I rebased onto the latest -next, I had to pluck them back out of
> > > > > > > a previous one.
> > > > > >
> > > > > > They should show up in linux-next again. We merge patches for next merge
> > > > > > window even during the current merge window, but need to make sure they
> > > > > > don't pollute linux-next. Occasionally the cut off is wrong so patches
> > > > > > show up, and then get pulled again.
> > > > > >
> > > > > > Unfortunately especially the 5.12 merge cycle was very wobbly due to some
> > > > > > confusion here. But your patches should all be in linux-next again (they
> > > > > > are queued up for 5.13 in drm-misc-next, I checked that).
> > > > > >
> > > > > > Sorry for the confusion here.
> > > > >
> > > > > Oh, I see.  Well so long as they don't get dropped, I'll be happy.
> > > > >
> > > > > Thanks for the explanation Daniel
> > > >
> > > > After rebasing today, all of my GPU patches have remained.  Would
> > > > someone be kind enough to check that everything is still in order
> > > > please?
> > >
> > > It's still broken somehow. I've kiced Maxime and Maarten again,
> > > they're also on this thread.
> > 
> > You're patches have made it into drm-next meanwhile, so they should
> > show up in linux-next through that tree at least. Except if that one
> > also has some trouble.
> 
> Thanks for letting me know.
> 
> I see some patches made it back in, others didn't.
> 
> I'll resend the stragglers - bear with.

The vmwgfx ones should all be back, the others I guess just werent ever
applied. I'll vacuum them all up if you resend. Apologies for the wobbly
ride.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
