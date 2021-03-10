Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAF803344CC
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 18:07:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233134AbhCJRHI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 12:07:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233135AbhCJRGz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 12:06:55 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD50BC061760;
        Wed, 10 Mar 2021 09:06:54 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id v192so12280922oia.5;
        Wed, 10 Mar 2021 09:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ckay+pu+4QlnhlTMgneWcMsMH2vmyeEkqCVZ+1F2Jt4=;
        b=BuuvW328vUQyFQCiJB0ex0uqb6U68KYKwLjkoH74TeY9hzeTIH0PaOKJBUAr2mXLMt
         MkM0F9QEc8VKhIJrp/u6cwdFERONDunEnM5xrxlh+ghjBJ2ZDhWbxUY54rpAhZ8cwF0u
         zqeYW8Dbf/pX7ThZqdr9kpLYKDYYYPSR0lJXFxB46+DXiVnLZfv987kERgE4FwFClnxz
         C8tvL38uZOfxD6eDCA5DUTBB+bj8MIl0A4XrQieClIFxVrR+4lmJ0WvZSc+sY/R1vgXO
         4fn44UllvjIPs7YvP7j8iD/IyKeU1IdBiQX2DC2dazSwflbLnCOvhbwNgqNcFp2ZEugB
         M9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ckay+pu+4QlnhlTMgneWcMsMH2vmyeEkqCVZ+1F2Jt4=;
        b=PXwkowQumpGCaqOvshevXvtB2Ey7z2bSb2JTAGhCj9yXE/RzyNvY2OKs8eVNC+C8gP
         Qm12SkZ0PjxGspZCGtc2miqSLk9E77/Ifc/ez63B6zrEawRJN1i8DJ6IxY3sswOctrVa
         q4aLqeN43HfRRyvzTU3hW7u+Dol2uF4zL5uooAHtesgWrCXMNx/l9sY6v8O+Ejk10gX1
         SPG8VZXkFIoKD5fZMLw9+2ROkbh7mMEY4rDZaPI91brRqqkjFHEZNkLigdkT/hbrSNak
         UkcMfXN4LbmRpxZOfYZ0R16RJC23uyRHE5L58hHya9R8d4VIy+5BtwuvHiWA1CYCLuic
         dYJQ==
X-Gm-Message-State: AOAM533gehqNfv4T326ZdjtjRvbZybcqpvI0fMnW6GshMs4yP4wNjJUW
        mh1CDUHc/ElyY2vOAf/zt8/tJ4wKOqUkmiWYtgZScr4O
X-Google-Smtp-Source: ABdhPJz+N++ipstT7fwx8AeHyiwcCQ4oNiFfp1L623ZgZtgNubYgLNBkODDj1YHjtonmpx8CpU3NaDX2TXdxUWQG8ZE=
X-Received: by 2002:aca:af10:: with SMTP id y16mr3086498oie.120.1615396014280;
 Wed, 10 Mar 2021 09:06:54 -0800 (PST)
MIME-Version: 1.0
References: <20210310163655.2591893-1-daniel@qtec.com>
In-Reply-To: <20210310163655.2591893-1-daniel@qtec.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Wed, 10 Mar 2021 12:06:43 -0500
Message-ID: <CADnq5_PmbXBaziCEqRODb_DvtKaw9ucXXjkdmdj9N_R8P-9Jcw@mail.gmail.com>
Subject: Re: [PATCH]] drm/amdgpu/gfx9: add gfxoff quirk
To:     Daniel Gomez <daniel@qtec.com>
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

On Wed, Mar 10, 2021 at 11:37 AM Daniel Gomez <daniel@qtec.com> wrote:
>
> Disabling GFXOFF via the quirk list fixes a hardware lockup in
> Ryzen V1605B, RAVEN 0x1002:0x15DD rev 0x83.
>
> Signed-off-by: Daniel Gomez <daniel@qtec.com>
> ---
>
> This patch is a continuation of the work here:
> https://lkml.org/lkml/2021/2/3/122 where a hardware lockup was discussed and
> a dma_fence deadlock was provoke as a side effect. To reproduce the issue
> please refer to the above link.
>
> The hardware lockup was introduced in 5.6-rc1 for our particular revision as it
> wasn't part of the new blacklist. Before that, in kernel v5.5, this hardware was
> working fine without any hardware lock because the GFXOFF was actually disabled
> by the if condition for the CHIP_RAVEN case. So this patch, adds the 'Radeon
> Vega Mobile Series [1002:15dd] (rev 83)' to the blacklist to disable the GFXOFF.
>
> But besides the fix, I'd like to ask from where this revision comes from. Is it
> an ASIC revision or is it hardcoded in the VBIOS from our vendor? From what I
> can see, it comes from the ASIC and I wonder if somehow we can get an APU in the
> future, 'not blacklisted', with the same problem. Then, should this table only
> filter for the vendor and device and not the revision? Do you know if there are
> any revisions for the 1002:15dd validated, tested and functional?

The pci revision id (RID) is used to specify the specific SKU within a
family.  GFXOFF is supposed to be working on all raven variants.  It
was tested and functional on all reference platforms and any OEM
platforms that launched with Linux support.  There are a lot of
dependencies on sbios in the early raven variants (0x15dd), so it's
likely more of a specific platform issue, but there is not a good way
to detect this so we use the DID/SSID/RID as a proxy.  The newer raven
variants (0x15d8) have much better GFXOFF support since they all
shipped with newer firmware and sbios.

Alex


>
> Logs:
> [   27.708348] [drm] initializing kernel modesetting (RAVEN
> 0x1002:0x15DD 0x1002:0x15DD 0x83).
> [   27.789156] amdgpu: ATOM BIOS: 113-RAVEN-115
>
> Thanks in advance,
> Daniel
>
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> index 65db88bb6cbc..319d4b99aec8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> @@ -1243,6 +1243,8 @@ static const struct amdgpu_gfxoff_quirk amdgpu_gfxoff_quirk_list[] = {
>         { 0x1002, 0x15dd, 0x103c, 0x83e7, 0xd3 },
>         /* GFXOFF is unstable on C6 parts with a VBIOS 113-RAVEN-114 */
>         { 0x1002, 0x15dd, 0x1002, 0x15dd, 0xc6 },
> +       /* GFXOFF provokes a hw lockup on 83 parts with a VBIOS 113-RAVEN-115 */
> +       { 0x1002, 0x15dd, 0x1002, 0x15dd, 0x83 },
>         { 0, 0, 0, 0, 0 },
>  };
>
> --
> 2.30.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
