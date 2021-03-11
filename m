Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE04D336E7C
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 10:10:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231903AbhCKJJe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 04:09:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231629AbhCKJJW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 04:09:22 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90126C061760
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 01:09:22 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id 9so1176962ljd.7
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 01:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RnT+lPnIHBw/xRDsclmASuOvNjJ9ngFpJSmXHW9gT1s=;
        b=LH0uuBBonQYeRw5PRypwMx3pqqtIVdxzggC6gcxg+8Fpd8x2nix9/7lRT5+jzm0UPx
         MCspsVqaFPDjsy+63ETLGmuUlnp6dsGlWNsqApadi7qWKY9cIUGi0AlLwFkAPAT4uz7D
         qRVolWJtwHagQiLm6gsOJ2xuXkZksMNT3jXwloZYMpmIFOBU8o11f3bK9fUcjGBZttYS
         8RcTOHpkCWZm9fYQGw3tQyFTyN3TkDmCCsjUHr+Ydxg4pY7ef7+ThT2p0ZF1pNWO7bln
         zEpU4WgnpJ4bBHRTlggPNCS/lCxrESMo2Fs5SI3B+6VbwF2mJvg2MXEy3HFEaM3gqc7J
         4/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RnT+lPnIHBw/xRDsclmASuOvNjJ9ngFpJSmXHW9gT1s=;
        b=l/iTvmIeBgQWfWBB7jxCbrPbmqJWc+qfvMQAcAE/TDBFvbaMJjILpQXyWaJb7+0GK7
         N1K4ZFWCa0G7eaCJb+gGB9a0RxIYwQl/fGzHgQtFH1NN2bDYsB8ETLd2ym6xe11ojrbB
         pfVQ7SkblUvOQl5cDYeacKxVMNoQBErxLGS0GamXjHFyt19JwzGtXndaE0plV4uiMTa/
         N77refAhftzrJnKC/6jc/gyeGQ31tcZ4xSTf5ZnVWBJGDJDpkdQ5X28c6VnSgRW757rr
         hQ1CFtvCqxGJTRV/AhDq75dENOHB6KlYiaeNfuiNfRxA1AUHLLAUXB+Gty3VhJCOHkxl
         YiWA==
X-Gm-Message-State: AOAM532ht2BWfpYK1SmUUg+XylX7YkgAbohND/Gu0DsgwRqpIunVcZHW
        HP15JMc3BUCKpWm+str4r+VgIiV0JJr+Bun1sPKXAwNHNUQ7Yrnt
X-Google-Smtp-Source: ABdhPJygCiPkPDqr0CqthkNvw/7NV0v7TWfyanbCIGUU8Z08ssP9bcbSuJn6t1JsPsFXX9SBpw2eJhIpt/fNi5u69OM=
X-Received: by 2002:a2e:557:: with SMTP id 84mr4309802ljf.480.1615453760997;
 Thu, 11 Mar 2021 01:09:20 -0800 (PST)
MIME-Version: 1.0
References: <20210310163655.2591893-1-daniel@qtec.com> <CADnq5_PmbXBaziCEqRODb_DvtKaw9ucXXjkdmdj9N_R8P-9Jcw@mail.gmail.com>
In-Reply-To: <CADnq5_PmbXBaziCEqRODb_DvtKaw9ucXXjkdmdj9N_R8P-9Jcw@mail.gmail.com>
From:   Daniel Gomez <daniel@qtec.com>
Date:   Thu, 11 Mar 2021 10:09:10 +0100
Message-ID: <CAH1Ww+T4WwLzg_nnF=1sjm9LW9wCjFb0X9c=qmuubvMqJdW4PA@mail.gmail.com>
Subject: Re: [PATCH]] drm/amdgpu/gfx9: add gfxoff quirk
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Hawking Zhang <Hawking.Zhang@amd.com>,
        Huang Rui <ray.huang@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
        Dennis Li <Dennis.Li@amd.com>, Monk Liu <Monk.Liu@amd.com>,
        Yintian Tao <yttao@amd.com>, Guchun Chen <guchun.chen@amd.com>,
        Evan Quan <evan.quan@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 10 Mar 2021 at 18:06, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Wed, Mar 10, 2021 at 11:37 AM Daniel Gomez <daniel@qtec.com> wrote:
> >
> > Disabling GFXOFF via the quirk list fixes a hardware lockup in
> > Ryzen V1605B, RAVEN 0x1002:0x15DD rev 0x83.
> >
> > Signed-off-by: Daniel Gomez <daniel@qtec.com>
> > ---
> >
> > This patch is a continuation of the work here:
> > https://lkml.org/lkml/2021/2/3/122 where a hardware lockup was discussed and
> > a dma_fence deadlock was provoke as a side effect. To reproduce the issue
> > please refer to the above link.
> >
> > The hardware lockup was introduced in 5.6-rc1 for our particular revision as it
> > wasn't part of the new blacklist. Before that, in kernel v5.5, this hardware was
> > working fine without any hardware lock because the GFXOFF was actually disabled
> > by the if condition for the CHIP_RAVEN case. So this patch, adds the 'Radeon
> > Vega Mobile Series [1002:15dd] (rev 83)' to the blacklist to disable the GFXOFF.
> >
> > But besides the fix, I'd like to ask from where this revision comes from. Is it
> > an ASIC revision or is it hardcoded in the VBIOS from our vendor? From what I
> > can see, it comes from the ASIC and I wonder if somehow we can get an APU in the
> > future, 'not blacklisted', with the same problem. Then, should this table only
> > filter for the vendor and device and not the revision? Do you know if there are
> > any revisions for the 1002:15dd validated, tested and functional?
>
> The pci revision id (RID) is used to specify the specific SKU within a
> family.  GFXOFF is supposed to be working on all raven variants.  It
> was tested and functional on all reference platforms and any OEM
> platforms that launched with Linux support.  There are a lot of
> dependencies on sbios in the early raven variants (0x15dd), so it's
> likely more of a specific platform issue, but there is not a good way
> to detect this so we use the DID/SSID/RID as a proxy.  The newer raven
> variants (0x15d8) have much better GFXOFF support since they all
> shipped with newer firmware and sbios.

We took one of the first reference platform boards to design our
custom board based on the V1605B and I assume it has one of the early 'unstable'
raven variants with RID 0x83. Also, as OEM we are in control of the bios
(provided by insyde) but I wasn't sure about the RID so, thanks for the
clarification. Is there anything we can do with the bios to have the GFXOFF
enabled and 'stable' for this particular revision? Otherwise we'd need to add
the 0x83 RID to the table. Also, there is an extra ']' in the patch
subject. Sorry
for that. Would you need a new patch in case you accept it with the ']' removed?

Good to hear that the newer raven versions have better GFXOFF support.

Daniel

>
> Alex
>
>
> >
> > Logs:
> > [   27.708348] [drm] initializing kernel modesetting (RAVEN
> > 0x1002:0x15DD 0x1002:0x15DD 0x83).
> > [   27.789156] amdgpu: ATOM BIOS: 113-RAVEN-115
> >
> > Thanks in advance,
> > Daniel
> >
> >  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> > index 65db88bb6cbc..319d4b99aec8 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> > @@ -1243,6 +1243,8 @@ static const struct amdgpu_gfxoff_quirk amdgpu_gfxoff_quirk_list[] = {
> >         { 0x1002, 0x15dd, 0x103c, 0x83e7, 0xd3 },
> >         /* GFXOFF is unstable on C6 parts with a VBIOS 113-RAVEN-114 */
> >         { 0x1002, 0x15dd, 0x1002, 0x15dd, 0xc6 },
> > +       /* GFXOFF provokes a hw lockup on 83 parts with a VBIOS 113-RAVEN-115 */
> > +       { 0x1002, 0x15dd, 0x1002, 0x15dd, 0x83 },
> >         { 0, 0, 0, 0, 0 },
> >  };
> >
> > --
> > 2.30.1
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
