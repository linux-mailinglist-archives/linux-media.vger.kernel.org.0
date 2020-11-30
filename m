Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94E852C90DE
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 23:21:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727154AbgK3WT3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 17:19:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726775AbgK3WT2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 17:19:28 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7876FC0613D2;
        Mon, 30 Nov 2020 14:18:48 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id f16so12883754otl.11;
        Mon, 30 Nov 2020 14:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fa2/8Ci4xxzQgPpzblIpuZWOOQWDWwEoKG3A0meA3jA=;
        b=PV/B6n8yvOYcyf7wJKlL+Eb8wXVZq3DHArWxHUlRCN3HMm1d/q09v5FMBWbibWzrqq
         8ZDjWTpP9bzG2Mwv44PZ76GCOYi7P7/4m2lqhdibxMcV99qu+x/JbAaiLdgTINrkyWki
         5+7cT9WvHXjVdVW5j1XvHUoLRyB58uKi+F1gMX1i8y2lb6ntUYkzpE1vO+wpIgMFammt
         BBWfLTbp1l0MwMMctfCSfahUSiCAYOOoFs8tFd7Alnny/6mjOLiPxOMo/eP0AGRgjoK9
         h8+H4jM8+BP0ADW7NQwaWV2U6esy19bkdVNMbtigTLSpy9PymNUwtKivP5fLMdBMunrx
         Exyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fa2/8Ci4xxzQgPpzblIpuZWOOQWDWwEoKG3A0meA3jA=;
        b=M6V3EWJelDb4/TblFa5RCmO8HQXMpRuOCltH8VMfWjyUkoE4aKSE6sAXt14o3sxS7D
         yYvdqC/SG/Zc+QPkN9PV6lA3gbnstgPEswN43FVL3Jjb17ou6O1IXEF+BtCbETHleaYk
         kjNPM/q+l5QdU7wNxy9IIFuVF0UWYYX1NOLLpw72qYef2Uisc+GlLRQpfUECj7I4X7/E
         M1QZrLoQAJlTNKfS9vRh1qGCDBf+EtJhSFlEXTWmlKibuSE6sec22vm/i2+rqAC3Oojx
         9VL9E9cqiEAumAJMtX+U4hTPyAkjONe/K702i837MB7yBaN9AFPoFCcO+8PwMXHxjR4P
         bFWg==
X-Gm-Message-State: AOAM533EFQ/pvqLLmPNtKCWk4U4hf3EVWQruAdAjy7B/HxAttViF3ksD
        MtdUmQ50gj2xQUAvtlI8QeYnG3QQt4jcI3AEf1c=
X-Google-Smtp-Source: ABdhPJyYustfZfZl7BLQkBh0ByhfaBrekSB0Y+9Ti6o+YIXL+LHrA4K+GmLqB4BN7E9+McG+pO2SI0wVg6XdMdk/SRo=
X-Received: by 2002:a9d:5388:: with SMTP id w8mr18736439otg.311.1606774727965;
 Mon, 30 Nov 2020 14:18:47 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org> <20201124193824.1118741-16-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-16-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 30 Nov 2020 17:18:36 -0500
Message-ID: <CADnq5_OfkE7H9dsurRiFb8Y3XkCHwcK0zBMCYnNTz0KK_ihr0Q@mail.gmail.com>
Subject: Re: [PATCH 15/40] drm/amd/amdgpu/gfx_v8_0: Functions must follow
 directly after their headers
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

On Tue, Nov 24, 2020 at 2:44 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c:3698: warning: Excess function par=
ameter 'adev' description in 'DEFAULT_SH_MEM_BASES'
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
>  drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/=
amdgpu/gfx_v8_0.c
> index 5e6d15f44560a..9a905531f8377 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> @@ -3687,6 +3687,7 @@ static void gfx_v8_0_setup_rb(struct amdgpu_device =
*adev)
>         mutex_unlock(&adev->grbm_idx_mutex);
>  }
>
> +#define DEFAULT_SH_MEM_BASES   (0x6000)
>  /**
>   * gfx_v8_0_init_compute_vmid - gart enable
>   *
> @@ -3695,7 +3696,6 @@ static void gfx_v8_0_setup_rb(struct amdgpu_device =
*adev)
>   * Initialize compute vmid sh_mem registers
>   *
>   */
> -#define DEFAULT_SH_MEM_BASES   (0x6000)
>  static void gfx_v8_0_init_compute_vmid(struct amdgpu_device *adev)
>  {
>         int i;
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
