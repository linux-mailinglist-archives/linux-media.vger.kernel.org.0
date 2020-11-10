Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A01852AE3A0
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 23:49:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732240AbgKJWtF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 17:49:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726688AbgKJWtF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 17:49:05 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3070BC0613D1;
        Tue, 10 Nov 2020 14:49:05 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id p1so77275wrf.12;
        Tue, 10 Nov 2020 14:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QxHHXS3cE89335PSH++B3mpGjtCNjtBO+QlCYD3Zvgg=;
        b=d7Cf/FwtcLiCtQMr2eyAmlsaUArJWJ0mziqwcGthPg+06xrhupxq3z2PJhG4/MOQ1v
         2y24q3ZKffwNLday4vMhmBJKmvLVB5yTGkioUypllMxDxoy4nC+axoHxhTsS09qxLvEF
         aNfrZS3g+ONTPB2yFxfxA9xgifBMPyoEtCijAHg3dXeWSPWNJI2XBjjspAPTmiug38mC
         adG3s8vzndR9dtkuigjX6S0VrdKvOTg/PoYVIiGceMfBTLzh0qh93YHsNz/aDmDBy78g
         IYmjb2gdKK53T4MtNvzkA7E8EWbdwcFn1ZK6kleNWR6sl8ftlxUeW1BsD4/LZBXDcn1y
         apSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QxHHXS3cE89335PSH++B3mpGjtCNjtBO+QlCYD3Zvgg=;
        b=fBadOzMCVw6KY6YqClipJod5slXMvLAsbsSWKb1AmkVx043RMTz57WtT3yNDcR7UUi
         7jpl6AeU9H4ssd5/mqMxCHyMRC0FA5vk5ON762CgZ0QmAFa/KHEY85fvUP9gDKw/6N5F
         7BkPUX3CsMqRzoqQV/dHrEYmteFjBsHHXhaZWNxjE7OUFTJQ6XoRvGuDz/BSb5MUgdF4
         SSGzVom2A6dq9cS8mR72AKHH46f8yrxuKxGIjh/zGGp+0GHD5ReTgC9BHLsGiST9TBG1
         Zdk0B8HFCoySQpqfxquLGwpTva6saLH5Vf5q5COFYLXtoWjrrzfohAymIHuRLxQGi2PY
         TZEA==
X-Gm-Message-State: AOAM5315MfGGBkpGU7FF3LzSce3+XhHdncNSuvdtX8dMot4uJ4cFFFlx
        jybsJU+RZ73jQvpFGJUyS15e2uUdgVHdvmQ3SAg=
X-Google-Smtp-Source: ABdhPJymLAqxpu3e02/OvsvW/fAZlu4drY7sx7O8tcwcyxZTALYLa8ia33M2ks/S4NtXxb3AAC3z65dgBL+gdcUEYd8=
X-Received: by 2002:adf:e551:: with SMTP id z17mr27115192wrm.374.1605048543898;
 Tue, 10 Nov 2020 14:49:03 -0800 (PST)
MIME-Version: 1.0
References: <20201109211855.3340030-1-lee.jones@linaro.org> <20201109211855.3340030-21-lee.jones@linaro.org>
In-Reply-To: <20201109211855.3340030-21-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 10 Nov 2020 17:48:52 -0500
Message-ID: <CADnq5_NEGAkOQTthXYpG_BaaLS2vcD3RC7FTSSZ=cDw26-TPtA@mail.gmail.com>
Subject: Re: [PATCH 20/20] drm/radeon/cik: Fix a bunch of function parameter descriptions
To:     Lee Jones <lee.jones@linaro.org>
Cc:     David Airlie <airlied@linux.ie>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 9, 2020 at 4:19 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/radeon/cik.c:1869:5: warning: no previous prototype for =
=E2=80=98ci_mc_load_microcode=E2=80=99 [-Wmissing-prototypes]
>  drivers/gpu/drm/radeon/cik.c: In function =E2=80=98cik_gpu_init=E2=80=99=
:
>  drivers/gpu/drm/radeon/cik.c:3181:6: warning: variable =E2=80=98mc_share=
d_chmap=E2=80=99 set but not used [-Wunused-but-set-variable]
>  drivers/gpu/drm/radeon/cik.c: At top level:
>  drivers/gpu/drm/radeon/cik.c:4852:5: warning: no previous prototype for =
=E2=80=98cik_gpu_check_soft_reset=E2=80=99 [-Wmissing-prototypes]
>  drivers/gpu/drm/radeon/cik.c:5850:6: warning: no previous prototype for =
=E2=80=98cik_enter_rlc_safe_mode=E2=80=99 [-Wmissing-prototypes]
>  drivers/gpu/drm/radeon/cik.c:5871:6: warning: no previous prototype for =
=E2=80=98cik_exit_rlc_safe_mode=E2=80=99 [-Wmissing-prototypes]
>  drivers/gpu/drm/radeon/cik.c:6289:6: warning: no previous prototype for =
=E2=80=98cik_update_cg=E2=80=99 [-Wmissing-prototypes]
>  drivers/gpu/drm/radeon/cik.c:6421:6: warning: no previous prototype for =
=E2=80=98cik_init_cp_pg_table=E2=80=99 [-Wmissing-prototypes]
>  drivers/gpu/drm/radeon/cik.c:6678:5: warning: no previous prototype for =
=E2=80=98cik_get_csb_size=E2=80=99 [-Wmissing-prototypes]
>  drivers/gpu/drm/radeon/cik.c:6710:6: warning: no previous prototype for =
=E2=80=98cik_get_csb_buffer=E2=80=99 [-Wmissing-prototypes]
>  drivers/gpu/drm/radeon/cik.c:3084: warning: Function parameter or member=
 'max_rb_num_per_se' not described in 'cik_get_rb_disabled'
>  drivers/gpu/drm/radeon/cik.c:3084: warning: Excess function parameter 'm=
ax_rb_num' description in 'cik_get_rb_disabled'
>  drivers/gpu/drm/radeon/cik.c:3084: warning: Excess function parameter 's=
e_num' description in 'cik_get_rb_disabled'
>  drivers/gpu/drm/radeon/cik.c:3114: warning: Function parameter or member=
 'max_rb_num_per_se' not described in 'cik_setup_rb'
>  drivers/gpu/drm/radeon/cik.c:3114: warning: Excess function parameter 'm=
ax_rb_num' description in 'cik_setup_rb'
>  drivers/gpu/drm/radeon/cik.c:5662: warning: Function parameter or member=
 'mc_client' not described in 'cik_vm_decode_fault'
>  drivers/gpu/drm/radeon/cik.c:5690: warning: Function parameter or member=
 'ring' not described in 'cik_vm_flush'
>  drivers/gpu/drm/radeon/cik.c:5690: warning: Function parameter or member=
 'vm_id' not described in 'cik_vm_flush'
>  drivers/gpu/drm/radeon/cik.c:5690: warning: Function parameter or member=
 'pd_addr' not described in 'cik_vm_flush'
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied with minor fixups.  Thanks!

Alex


> ---
>  drivers/gpu/drm/radeon/cik.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
> index 5c42877fd6fbf..4494f9122fd91 100644
> --- a/drivers/gpu/drm/radeon/cik.c
> +++ b/drivers/gpu/drm/radeon/cik.c
> @@ -3071,8 +3071,7 @@ static u32 cik_create_bitmask(u32 bit_width)
>   * cik_get_rb_disabled - computes the mask of disabled RBs
>   *
>   * @rdev: radeon_device pointer
> - * @max_rb_num: max RBs (render backends) for the asic
> - * @se_num: number of SEs (shader engines) for the asic
> + * @max_rb_num_per_se: max RBs (render backends) for the asic
>   * @sh_per_se: number of SH blocks per SE for the asic
>   *
>   * Calculates the bitmask of disabled RBs (CIK).
> @@ -3104,7 +3103,7 @@ static u32 cik_get_rb_disabled(struct radeon_device=
 *rdev,
>   * @rdev: radeon_device pointer
>   * @se_num: number of SEs (shader engines) for the asic
>   * @sh_per_se: number of SH blocks per SE for the asic
> - * @max_rb_num: max RBs (render backends) for the asic
> + * @max_rb_num_per_se: max RBs (render backends) for the asic
>   *
>   * Configures per-SE/SH RB registers (CIK).
>   */
> @@ -5654,6 +5653,7 @@ void cik_vm_fini(struct radeon_device *rdev)
>   * @rdev: radeon_device pointer
>   * @status: VM_CONTEXT1_PROTECTION_FAULT_STATUS register value
>   * @addr: VM_CONTEXT1_PROTECTION_FAULT_ADDR register value
> + * @mc_client: VM_CONTEXT1_PROTECTION_FAULT_MCCLIENT register value
>   *
>   * Print human readable fault information (CIK).
>   */
> @@ -5677,11 +5677,9 @@ static void cik_vm_decode_fault(struct radeon_devi=
ce *rdev,
>                block, mc_client, mc_id);
>  }
>
> -/**
> +/*
>   * cik_vm_flush - cik vm flush using the CP
>   *
> - * @rdev: radeon_device pointer
> - *
>   * Update the page table base and flush the VM TLB
>   * using the CP (CIK).
>   */
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
