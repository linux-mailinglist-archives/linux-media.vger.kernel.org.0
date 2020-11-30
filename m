Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAE572C9106
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 23:27:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730627AbgK3W1J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 17:27:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730612AbgK3W1J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 17:27:09 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 203B2C0613D2;
        Mon, 30 Nov 2020 14:26:29 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id n12so12963082otk.0;
        Mon, 30 Nov 2020 14:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ELyTcX08LymPeenJIXXi/ZPMDQRwxk9oNbn6BfJ/r5o=;
        b=dSrhy5UQczAxydBaxnIin48cdsjDak8wLPUXxDuBp+tcQ9Ta/HCWMAkuMygGhCqhMz
         Uwu7K92Ep3Hf+sXE+e8XLMMEwLynUO6Ge3suxhvWnyWM2PmoiAQwOPwd1tNEp1tT/ssH
         4KycpbzWX/ywYQuc4tmkp+JrjizgTXDdv0Zg7l8NG7+hBVje1wj/ngV4UuutQpzSxhgY
         SZTwuBXRzPT01VI+otVFMKBymSPQsh9F356ghr1ICD6ZikvE3N9hSW9eLQo1XGBEr+CP
         KXDYo30Qf+vtU+Jvmftd9jXf8M32LP02OUUdjBKGG6ZIvso0fRBqAar9OYEXhIqrDg0i
         8Vmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ELyTcX08LymPeenJIXXi/ZPMDQRwxk9oNbn6BfJ/r5o=;
        b=oexPZ2JFf33Jdv2C2EPh3sdK6yP3LaY6ETmPkFqal3MMOJgDQzEmtamRvg7kYj5CIT
         YLHtyjGSIqSUW7k+5Ye74fqEMwu4qygG+addSIAIHxJ9s1zqAvNHLNMrKp+9Tu78vCNE
         OL6+xEz8dz2bceHkgzb+sNaeKhYm138i003VJD136+0VgPJDLAtA1/iN2DlZNk0I5VHW
         4sJ+VAnJmFeidvkujH6DPqKoWBrNBN/qvJ8ZAiU3EgkDVwlHLxoOoZULCvHB8hxu+U/8
         ii07NA6Vv+9+Rvjy6ce4EPQBK57GIcofCuZhGXbfdGu6XOt0w/Cs0ZIMU3+RIGrkmKrQ
         cJJQ==
X-Gm-Message-State: AOAM530mTtjRhgjq9Q4SIDVzp39V455PmJ10lhkiwxtrI0cMOhBgmXen
        hdUDdFhfKuww7KpeWVR3aO5K0ZAgRcgCeaQ6uuc=
X-Google-Smtp-Source: ABdhPJyhogOwk85GqUih/K8lKuyluajJarfEg+XxKqk24TSWNaiPT1bDAc6sGbBpjoUmaGnLLEPc6a+mDBG/pq5B2Vw=
X-Received: by 2002:a9d:4713:: with SMTP id a19mr19192784otf.132.1606775188591;
 Mon, 30 Nov 2020 14:26:28 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org> <20201124193824.1118741-20-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-20-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 30 Nov 2020 17:26:17 -0500
Message-ID: <CADnq5_MY9MF2V9VG15F=cMtrn_aH1hcLGL5QidPz6b04gD-uEw@mail.gmail.com>
Subject: Re: [PATCH 19/40] drm/amd/amdgpu/sdma_v3_0: Fix incorrect param
 doc-rot issue
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

On Tue, Nov 24, 2020 at 2:45 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c:1651: warning: Function parameter=
 or member 'ib' not described in 'sdma_v3_0_emit_copy_buffer'
>  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c:1651: warning: Excess function pa=
rameter 'ring' description in 'sdma_v3_0_emit_copy_buffer'
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

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd=
/amdgpu/sdma_v3_0.c
> index 43410a7bccc25..8ca7fba9c035f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
> @@ -1633,7 +1633,7 @@ static void sdma_v3_0_set_irq_funcs(struct amdgpu_d=
evice *adev)
>  /**
>   * sdma_v3_0_emit_copy_buffer - copy buffer using the sDMA engine
>   *
> - * @ring: amdgpu_ring structure holding ring information
> + * @ib: indirect buffer to copy to
>   * @src_offset: src GPU address
>   * @dst_offset: dst GPU address
>   * @byte_count: number of bytes to xfer
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
