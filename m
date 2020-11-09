Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D06712AC588
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 20:54:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730678AbgKITyY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 14:54:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730456AbgKITyY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 14:54:24 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A163C0613CF;
        Mon,  9 Nov 2020 11:54:23 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id w24so674122wmi.0;
        Mon, 09 Nov 2020 11:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=blMIJqfyn+uYrIFhsDadDE528X0wnbKqoGnhBSRDkeM=;
        b=u5xWIKC81MwGnxL3ZjOcHeoE1X2iT8RKWt/1qo7ewqCC7mQzZtP4agtlhLt+Xv3ruY
         Uqa330apvJSitaJJG0zCSGiyktUKXBfP6w/3IlF1Jo1NxBINNCIhYd1CXg1oOSeBq11R
         kB61Te1dsOTwoa2vpAV4dNXU6uJeazJ8yZGYMSse1eS2hLj6cuwfhl2JLj/gqEQzjCio
         1QS4DSVw0MiI08NFaL36g858sQ/n61UPXXTxQyddILRnVaNCuzmHphfscz5avJZ+zOXI
         Ta9JOVzDO9+4V8XYpMsHhM71tpJzfa8fJatHcwX0HDHm+a32ST+bweskKKQgMYUppdBh
         qGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=blMIJqfyn+uYrIFhsDadDE528X0wnbKqoGnhBSRDkeM=;
        b=CgC6Sm8ax5egTEf/mCSQrInHV3RW2SkpN/FcZSxksSI/BiLmHkECgQ8KSEIa1Qon0w
         QKWgK+zJ7zGSpL05NkblT/e1glI1BNCScfij6NmCxotVGlGCKgfOVdE86EBjrbDhyyne
         XEsAn45H0/C7o+9oHqXFOqzG5AonaBjFnjXIF/Bx2J+UEAiOlV0+lpxTdsI+h8ZE3Hub
         l2X8+7/+8OwbjV88E2mUGv1dN22yQsDbzVVPFymZvJntu6p/w2/WrGdTVcXikmECGxw+
         Ifexx/SOqeB16HNFYPPuxipSVi2V3PkTfdM7hZJgvdI/ddez6RyqidY08CBKomIhLhHx
         wMHQ==
X-Gm-Message-State: AOAM532WmwnOXlfTejmUbZEk8SLaRfLyxSid/neXFyYHqpNO3sy1se5g
        LDzrb1wybovdcxw8iX5hAG/38EAHSQOTK+Zwz+0=
X-Google-Smtp-Source: ABdhPJwBfuZyATovbM1IuUQM7O9GPHy39nSVLi118te05KekkpRznL9TPLcotUXqnnlLAjOq/3YWZAYPQzHgpZpgxV0=
X-Received: by 2002:a1c:1c3:: with SMTP id 186mr820881wmb.39.1604951662293;
 Mon, 09 Nov 2020 11:54:22 -0800 (PST)
MIME-Version: 1.0
References: <20201106214949.2042120-1-lee.jones@linaro.org> <20201106214949.2042120-15-lee.jones@linaro.org>
In-Reply-To: <20201106214949.2042120-15-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 9 Nov 2020 14:54:11 -0500
Message-ID: <CADnq5_M=9pDypu7r9R8Y3fuC0Oz6+uu68ybLpG+gog=v-8taGg@mail.gmail.com>
Subject: Re: [PATCH 14/19] drm/amd/amdgpu/amdgpu_device: Provide documentation
 for 'reg_addr' params
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

On Fri, Nov 6, 2020 at 4:50 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:594: warning: Function parame=
ter or member 'reg_addr' not described in 'amdgpu_device_indirect_rreg'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:624: warning: Function parame=
ter or member 'reg_addr' not described in 'amdgpu_device_indirect_rreg64'
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
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index 300fcade4a2b1..63374d12e00fe 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -585,6 +585,7 @@ void amdgpu_mm_wdoorbell64(struct amdgpu_device *adev=
, u32 index, u64 v)
>   * @adev: amdgpu_device pointer
>   * @pcie_index: mmio register offset
>   * @pcie_data: mmio register offset
> + * @reg_addr: indirect register address to read from
>   *
>   * Returns the value of indirect register @reg_addr
>   */
> @@ -615,6 +616,7 @@ u32 amdgpu_device_indirect_rreg(struct amdgpu_device =
*adev,
>   * @adev: amdgpu_device pointer
>   * @pcie_index: mmio register offset
>   * @pcie_data: mmio register offset
> + * @reg_addr: indirect register address to read from
>   *
>   * Returns the value of indirect register @reg_addr
>   */
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
