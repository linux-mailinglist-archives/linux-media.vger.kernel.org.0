Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A8002C2C50
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 17:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389323AbgKXQHw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 11:07:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728480AbgKXQHw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 11:07:52 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B4DDC0613D6;
        Tue, 24 Nov 2020 08:07:52 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id p19so2346252wmg.0;
        Tue, 24 Nov 2020 08:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8rWhHtCJs5MGkWI+i55QfEjGeto3X3YjovT1RZF7HCw=;
        b=i9DOX/pMZJJPDsx86lswNkEyyUpgYz4ORc7uLGiD3jB08V2nwpgokmb06iSMr5Fb9P
         t6NitYSpQR2pxV5iPEuhe96kXvv+lQ44nKDVOw7IA1nj4sr9bTHs5YNMrlqb4MKpH9uI
         /5WWkmXfFnzON/rJSoZ9vtMrqcNHjNLEwBsQVEHR+1UPDz3UR31XzpmQLRsorX6pMYF8
         sCvpvqwmg5DerfWx3hSS2Roh6ceTU1CAvFFIhlhelybtn9MtqzRXYb5PraplGQihnYuG
         9dTasMIrHKWnTuzKGhWLZpzEFtdigCpjjDT3at9ahxg1Jk5Z7+8OuULIHfOpNvbQrV8N
         J9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8rWhHtCJs5MGkWI+i55QfEjGeto3X3YjovT1RZF7HCw=;
        b=aNTYfw1WBujsHV25qqW9AOAX6YLSvzInjgzTnPjr4B8xu7LE3vYuDn2KX0aDVHsk19
         eUmbRvcTnQeHAgJ/GnBnI027AfhOvu5Pr2f1pn44u1mCwwa1VAymcGkohf6XXfCt0P+/
         Q26NlrI00PrZmsb2sU3gFiBTYNXrgqfqvOOMAgDPc7atR/hCCiWcJQRTKWoOjUd8M6qa
         QFJq/r2byJ3uEKiMnB0OP18B29ygjOIByZy7k2aM5vP4hdLjWc066B+ur7OjShdsExn3
         3tq5G70ZLD9Aod6HyObhqzqX4iC4vRpjR46j3sSFK30blbCSvGetJFa5LAEstw9wFpC1
         bh8A==
X-Gm-Message-State: AOAM5337NDZKDnpkwTDUNQqPpiplzAIN3YTBUHCafU2CRuquq9aNzulA
        t5OcuYNV/UtP4tzvVI30LGyPtpkBpHaDEoJluBvyRMuU
X-Google-Smtp-Source: ABdhPJzXrVXCAGS9GPO8l0bGLYugwN6LO3dlONC84XDqaWPFkiid8/EFr/E//N2QyuTgCb+8AQHlbPdbDjKigCUs+JU=
X-Received: by 2002:a1c:1c3:: with SMTP id 186mr5075062wmb.39.1606234070787;
 Tue, 24 Nov 2020 08:07:50 -0800 (PST)
MIME-Version: 1.0
References: <20201123111919.233376-1-lee.jones@linaro.org> <20201123111919.233376-18-lee.jones@linaro.org>
In-Reply-To: <20201123111919.233376-18-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 24 Nov 2020 11:07:39 -0500
Message-ID: <CADnq5_MeeQ0tU1AGUSLf8kifm-AAhUER1eMcrkpWQi6dLPmDgg@mail.gmail.com>
Subject: Re: [PATCH 17/40] drm/amd/amdgpu/gfx_v6_0: Supply description for
 'gfx_v6_0_ring_test_ib()'s 'timeout' param
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

On Mon, Nov 23, 2020 at 6:19 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c:1903: warning: Function parameter =
or member 'timeout' not described in 'gfx_v6_0_ring_test_ib'
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
>  drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c b/drivers/gpu/drm/amd/=
amdgpu/gfx_v6_0.c
> index 671c46ebeced9..ca74638dec9b7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
> @@ -1894,6 +1894,7 @@ static void gfx_v6_0_ring_emit_ib(struct amdgpu_rin=
g *ring,
>   * gfx_v6_0_ring_test_ib - basic ring IB test
>   *
>   * @ring: amdgpu_ring structure holding ring information
> + * @timeout: timeout value in jiffies, or MAX_SCHEDULE_TIMEOUT
>   *
>   * Allocate an IB and execute it on the gfx ring (SI).
>   * Provides a basic gfx ring test to verify that IBs are working.
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
