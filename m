Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41EE12B222E
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 18:26:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgKMR0u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 12:26:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbgKMR0t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 12:26:49 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E56EC0613D1;
        Fri, 13 Nov 2020 09:26:49 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id u12so3540609wrt.0;
        Fri, 13 Nov 2020 09:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8iS1C8UHBhMpLbbDu7TV/SpqEICX1ZS5TAuJhzzyFG8=;
        b=gvcwXsFdEOv/znI10i5jHI+3by1YLLsrRKnb3c7JXoRdbwpVMUsrdS8IHWU8SeWBLU
         AnX330YexS19lfyz2Wz7Zm+LfhRUiD7kJdUnGMeOPjjkjDmxyQa+wG24PbM8TG/EwjKk
         TUpB+KVvegwARH5HnMUN0/DrD6ON/NlFK0zYTDw1bfH6jj5JtA6NyhGIIVX/grVIMpIG
         +Q7WKUaNlq43db6/3HWvtHWgkETat2wfsp3d7NDtIp7+pSkEYDN5vacUEb9Lz9YHzFsE
         o93Vf1IGs0GgdxTTdOZ7dw0IOtPx4KNM96W0tPSxMnrkWQDJWki+r1JMbFugRwIp4jSd
         N1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8iS1C8UHBhMpLbbDu7TV/SpqEICX1ZS5TAuJhzzyFG8=;
        b=kUAx1CV3LN2Gn1LT9KQwiV6BHt6P7NY0qLTorg7ATiGnGlFJbVy+vXMsCeEvDT8Mik
         7/mebDwIM1QmueRJDIse/PQzoV4DykkQEQq5240SV7W/x2VwTosfW1yNnDf+n7NTY1pf
         4nDGcq4lwCqMJmjC1SlIcQzUWq4lI03th1EuM/q7tahN+iMbcW5tfdVNlLhg3ZXw+Vyt
         xwB5/HDZXaUYKW+CttrFqcONfcaj6katKJ+3VtyVJFQl4B3XGf/MKiTDoUIg361DR8F5
         P4/MwR/2daZIfFLtm1gSLf+EhaByfi8Ol2atyyHNwIsTMpOvYGPhSVtDSspEe3cnqHbW
         zygQ==
X-Gm-Message-State: AOAM530GyifbaZih+av/r67PtlRMS4Q1gy/M7nxoE6Ug/cSWax/JKlhU
        NLtFrGyTnL8nh+66m8ZQw2/h101rraKHBD1L8rc=
X-Google-Smtp-Source: ABdhPJw2y+1b413Jn+9zmNl1pSTWBVJVbiN4CtaDcHcoAKp0WI5kqKs1HII5R7BSA3JX8BC/e5jFUhTzaT4i/cboQ1c=
X-Received: by 2002:adf:e350:: with SMTP id n16mr4962082wrj.419.1605288403359;
 Fri, 13 Nov 2020 09:26:43 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org> <20201113134938.4004947-25-lee.jones@linaro.org>
In-Reply-To: <20201113134938.4004947-25-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 13 Nov 2020 12:26:32 -0500
Message-ID: <CADnq5_OL0taGuQFnzxZUSVm8yJ6yOA0fj9xW91WKsa8zYRMyeg@mail.gmail.com>
Subject: Re: [PATCH 24/40] drm/amd/amdgpu/amdgpu_ids: Supply missing docs for
 'id' and 'vmhub'
To:     Lee Jones <lee.jones@linaro.org>
Cc:     David Airlie <airlied@linux.ie>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
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

On Fri, Nov 13, 2020 at 8:50 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c:271: warning: Function parameter=
 or member 'id' not described in 'amdgpu_vmid_grab_reserved'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c:523: warning: Function parameter=
 or member 'vmhub' not described in 'amdgpu_vmid_reset'
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ids.c
> index 6e9a9e5dbea07..61a1331f482c5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> @@ -259,6 +259,7 @@ static int amdgpu_vmid_grab_idle(struct amdgpu_vm *vm=
,
>   * @sync: sync object where we add dependencies
>   * @fence: fence protecting ID from reuse
>   * @job: job who wants to use the VMID
> + * @id: resulting VMID
>   *
>   * Try to assign a reserved VMID.
>   */
> @@ -514,6 +515,7 @@ void amdgpu_vmid_free_reserved(struct amdgpu_device *=
adev,
>   * amdgpu_vmid_reset - reset VMID to zero
>   *
>   * @adev: amdgpu device structure
> + * @vmhub: vmhub type
>   * @vmid: vmid number to use
>   *
>   * Reset saved GDW, GWS and OA to force switch on next flush.
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
