Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23AB5341755
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 09:25:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234240AbhCSIYW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 04:24:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233819AbhCSIYM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 04:24:12 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B846BC06174A
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 01:24:11 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id bx7so9719820edb.12
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 01:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=i3ME3RZycqfcfKl/INYO3mj0pc2g5bpS8vxgj1H2Zho=;
        b=P+5LihIKwLgCsx10OfJIAw04qzyiTgtZ+9mVR3WckS2IOAidGoGZL3ddGFqeTyiWrx
         HFNLGJkkIgVaAyVKZXa3FE1/nuP6JHJbyOdedNBMMzQp/iT+6gDLy1aJtYevlvk92o+g
         FOiw14Uq3K23+15kZQxvtt3z0iFriNPPHzkntAqWaThhUj0y5bOV/LkWWvM5vboi3NL6
         nruXC6lGYs+ze7MJBrOuFwiI1j/aNoW14FE/UHwTmaxsYLtiY6iwiT8Nknb+edBW42sw
         /gW2YDfE/zZkyFLp5hFpuBA/KGScPE/fy3K2x45r7r5KCQ161p+ccfRVEUZjHFsRSn6F
         rnRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=i3ME3RZycqfcfKl/INYO3mj0pc2g5bpS8vxgj1H2Zho=;
        b=cF9AuCMGwoSGMfplrf6wmUmFgLNOES2kv6df0F/7JqzF4lkrzkOxXrBSyU6oUxja3p
         VS5ewp0b4tGks51g2kZ5IpevfCWIL5G6B9l2SHyqJEpL5igfm4eW004oFCPr3h5vIIgf
         JH9qZOZkV0TImfxoQyhcjeXx+fDFAv4LmqX/Ze/Me6qXh1DfX/t6iRJfjPILCK2RD/Bh
         neeKB2jBLzzoyZB9oaE7gDXoicPhpju6cM1U327C+gruQem51YyGwSkk5PYTcpjdMLVE
         1LemboNACIsK6GL7V8C2RDiDobdu7AjTOdRhJ2Lb3P+SftcXQQD4lV6M8GDENUBJfeEH
         DFUg==
X-Gm-Message-State: AOAM530Kh+1ymHMjV5MOJg9mUxMqNW7TxMZDkA7GyViQTDAeOb9XwwYe
        IAqTRRFPwcxSkQXgRP9inCNvRA==
X-Google-Smtp-Source: ABdhPJwvsynmGTO200msXpOq0tH3ulqN/PugQIqOCYp1LVOxM4bgeagMgSBC0AYVkGV7Fb9kcROngA==
X-Received: by 2002:a05:6402:17af:: with SMTP id j15mr8214688edy.50.1616142250503;
        Fri, 19 Mar 2021 01:24:10 -0700 (PDT)
Received: from dell ([91.110.221.194])
        by smtp.gmail.com with ESMTPSA id gb4sm3185084ejc.122.2021.03.19.01.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 01:24:10 -0700 (PDT)
Date:   Fri, 19 Mar 2021 08:24:07 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Roland Scheidegger <sroland@vmware.com>,
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
Message-ID: <20210319082407.GG2916463@dell>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
 <16d4300e-bf29-1e85-317b-53d257890cb9@vmware.com>
 <20210308091932.GB4931@dell>
 <YEobySvG0zPs9xhc@phenom.ffwll.local>
 <20210311135152.GT701493@dell>
 <20210317081729.GH701493@dell>
 <CAKMK7uEibsgXXTEM1d2CGSswp-koouPSouseP_rwLHTdpxfRpw@mail.gmail.com>
 <CAKMK7uHkJGDL8k3FfAqAM78honZR0euMcacW8UpdPZfS1J-7cA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKMK7uHkJGDL8k3FfAqAM78honZR0euMcacW8UpdPZfS1J-7cA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 18 Mar 2021, Daniel Vetter wrote:

> On Wed, Mar 17, 2021 at 9:32 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Wed, Mar 17, 2021 at 9:17 AM Lee Jones <lee.jones@linaro.org> wrote:
> > >
> > > On Thu, 11 Mar 2021, Lee Jones wrote:
> > >
> > > > On Thu, 11 Mar 2021, Daniel Vetter wrote:
> > > >
> > > > > On Mon, Mar 08, 2021 at 09:19:32AM +0000, Lee Jones wrote:
> > > > > > On Fri, 05 Mar 2021, Roland Scheidegger wrote:
> > > > > >
> > > > > > > The vmwgfx ones look all good to me, so for
> > > > > > > 23-53: Reviewed-by: Roland Scheidegger <sroland@vmware.com>
> > > > > > > That said, they were already signed off by Zack, so not sure what
> > > > > > > happened here.
> > > > > >
> > > > > > Yes, they were accepted at one point, then dropped without a reason.
> > > > > >
> > > > > > Since I rebased onto the latest -next, I had to pluck them back out of
> > > > > > a previous one.
> > > > >
> > > > > They should show up in linux-next again. We merge patches for next merge
> > > > > window even during the current merge window, but need to make sure they
> > > > > don't pollute linux-next. Occasionally the cut off is wrong so patches
> > > > > show up, and then get pulled again.
> > > > >
> > > > > Unfortunately especially the 5.12 merge cycle was very wobbly due to some
> > > > > confusion here. But your patches should all be in linux-next again (they
> > > > > are queued up for 5.13 in drm-misc-next, I checked that).
> > > > >
> > > > > Sorry for the confusion here.
> > > >
> > > > Oh, I see.  Well so long as they don't get dropped, I'll be happy.
> > > >
> > > > Thanks for the explanation Daniel
> > >
> > > After rebasing today, all of my GPU patches have remained.  Would
> > > someone be kind enough to check that everything is still in order
> > > please?
> >
> > It's still broken somehow. I've kiced Maxime and Maarten again,
> > they're also on this thread.
> 
> You're patches have made it into drm-next meanwhile, so they should
> show up in linux-next through that tree at least. Except if that one
> also has some trouble.

Thanks for letting me know.

I see some patches made it back in, others didn't.

I'll resend the stragglers - bear with.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
