Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8C46343BF1
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 09:40:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhCVIkK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 04:40:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbhCVIjy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 04:39:54 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C98C061574
        for <linux-media@vger.kernel.org>; Mon, 22 Mar 2021 01:39:51 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id w18so18291469edc.0
        for <linux-media@vger.kernel.org>; Mon, 22 Mar 2021 01:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=WosURJkM/PKSCOw9xPERzj9fjDA03BThhpk0x/4VEXg=;
        b=Xmw1I0kVglEkkyuysEP1PPTcEa0qNfUT+YiRUf21xzme6vAcGVqGQFhILRd5KF6HQT
         oAFfhdwqyw/7k+Z2aHghIGttZFXr1qMivDnMOZCpx8s5pSWybC9p5wS1T/12dE6axlRE
         XAlEAguYbFxtFpFCih0t7ANGSfFkAXJPAyhS+Jg6Q8zR7vgp8MQJsJZwV5QH4Lv271/e
         lMaD1/D08eqYnnkHs2fb3tKFeeRsUuQqLNmnsRV+6ktK6/aHy3TmEZc2QmGgIgILxbUb
         0fyOqeOpSaLYJh4YvLz/ximI7JeQMp89Wpc2roOfrbULHCS6TVt3Xn9qBMNloAPNH+ra
         IZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=WosURJkM/PKSCOw9xPERzj9fjDA03BThhpk0x/4VEXg=;
        b=pMnjeNByFk4vWRqPFplVp3QK4s7ORhZsdlt+vOYRlvwRfsgkUIiWsJUhZCDvoWhkwW
         IMgDSAXe9tBbvRHcETMZNketzVqTOyBW8xWP50EsED4Fb9TeHdLh4qIRMQpJSMU72T7r
         fvHrQgZHlWMSSmV3jysbKOhmpGrIEkDXXljnM0kGcSoJR9RmwpR2KYxfnszSGI2r6V7B
         MkwO/XwJlKF3IbrrbI/NtVCBxlS2uCM3DzMmiyuXtk4qpk/1CpMNl+5b4QxDW76pG2oD
         DfuniGVe7dSqep6u6O2hzWZRDUi3wH5SS3boLZoY6dgGq4vJNr+S24KAjIfGzY2dcUzN
         Wv2A==
X-Gm-Message-State: AOAM532Zoqr+1ytzq58eJ7T8izf3eAChBpbAOIrs2mnkOA6i3SFDK+EQ
        XjH/TJpGYDlM+JShWvJ/J3hkxQ==
X-Google-Smtp-Source: ABdhPJw6q+bFZcIwo/y4uN0oE8skM7XUnmmeJDRr9QTv/JOzMN54LLFvW9KELWO6DcVO4jr2DhMgiA==
X-Received: by 2002:a05:6402:1713:: with SMTP id y19mr23148734edu.52.1616402390537;
        Mon, 22 Mar 2021 01:39:50 -0700 (PDT)
Received: from dell ([91.110.221.180])
        by smtp.gmail.com with ESMTPSA id ga28sm4809735ejc.82.2021.03.22.01.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 01:39:50 -0700 (PDT)
Date:   Mon, 22 Mar 2021 08:39:47 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Roland Scheidegger <sroland@vmware.com>,
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
Message-ID: <20210322083947.GM2916463@dell>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
 <16d4300e-bf29-1e85-317b-53d257890cb9@vmware.com>
 <20210308091932.GB4931@dell>
 <YEobySvG0zPs9xhc@phenom.ffwll.local>
 <20210311135152.GT701493@dell>
 <20210317081729.GH701493@dell>
 <CAKMK7uEibsgXXTEM1d2CGSswp-koouPSouseP_rwLHTdpxfRpw@mail.gmail.com>
 <CAKMK7uHkJGDL8k3FfAqAM78honZR0euMcacW8UpdPZfS1J-7cA@mail.gmail.com>
 <20210319082407.GG2916463@dell>
 <YFTlhh1ZSFffO+Nr@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YFTlhh1ZSFffO+Nr@phenom.ffwll.local>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 19 Mar 2021, Daniel Vetter wrote:

> On Fri, Mar 19, 2021 at 08:24:07AM +0000, Lee Jones wrote:
> > On Thu, 18 Mar 2021, Daniel Vetter wrote:
> > 
> > > On Wed, Mar 17, 2021 at 9:32 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Wed, Mar 17, 2021 at 9:17 AM Lee Jones <lee.jones@linaro.org> wrote:
> > > > >
> > > > > On Thu, 11 Mar 2021, Lee Jones wrote:
> > > > >
> > > > > > On Thu, 11 Mar 2021, Daniel Vetter wrote:
> > > > > >
> > > > > > > On Mon, Mar 08, 2021 at 09:19:32AM +0000, Lee Jones wrote:
> > > > > > > > On Fri, 05 Mar 2021, Roland Scheidegger wrote:
> > > > > > > >
> > > > > > > > > The vmwgfx ones look all good to me, so for
> > > > > > > > > 23-53: Reviewed-by: Roland Scheidegger <sroland@vmware.com>
> > > > > > > > > That said, they were already signed off by Zack, so not sure what
> > > > > > > > > happened here.
> > > > > > > >
> > > > > > > > Yes, they were accepted at one point, then dropped without a reason.
> > > > > > > >
> > > > > > > > Since I rebased onto the latest -next, I had to pluck them back out of
> > > > > > > > a previous one.
> > > > > > >
> > > > > > > They should show up in linux-next again. We merge patches for next merge
> > > > > > > window even during the current merge window, but need to make sure they
> > > > > > > don't pollute linux-next. Occasionally the cut off is wrong so patches
> > > > > > > show up, and then get pulled again.
> > > > > > >
> > > > > > > Unfortunately especially the 5.12 merge cycle was very wobbly due to some
> > > > > > > confusion here. But your patches should all be in linux-next again (they
> > > > > > > are queued up for 5.13 in drm-misc-next, I checked that).
> > > > > > >
> > > > > > > Sorry for the confusion here.
> > > > > >
> > > > > > Oh, I see.  Well so long as they don't get dropped, I'll be happy.
> > > > > >
> > > > > > Thanks for the explanation Daniel
> > > > >
> > > > > After rebasing today, all of my GPU patches have remained.  Would
> > > > > someone be kind enough to check that everything is still in order
> > > > > please?
> > > >
> > > > It's still broken somehow. I've kiced Maxime and Maarten again,
> > > > they're also on this thread.
> > > 
> > > You're patches have made it into drm-next meanwhile, so they should
> > > show up in linux-next through that tree at least. Except if that one
> > > also has some trouble.
> > 
> > Thanks for letting me know.
> > 
> > I see some patches made it back in, others didn't.
> > 
> > I'll resend the stragglers - bear with.
> 
> The vmwgfx ones should all be back, the others I guess just werent ever
> applied. I'll vacuum them all up if you resend. Apologies for the wobbly
> ride.

NP, it happens.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
