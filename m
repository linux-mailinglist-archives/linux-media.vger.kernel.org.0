Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E91E1BADF0
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2020 21:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbgD0TbK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Apr 2020 15:31:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbgD0TbK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Apr 2020 15:31:10 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 071A2C0610D5;
        Mon, 27 Apr 2020 12:31:09 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id h4so169753wmb.4;
        Mon, 27 Apr 2020 12:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HK4ed8QncVCh1Vo6RkjCKVWlusnpc0yRSsJhSHttXjo=;
        b=IpTOEHL2igQRISoLq54oPFIyUCM/vlFDLK8fOD2SZsOKO7PJJpFtKkHoCHVXZlXJP7
         73g4hx79fWeVCiHrCHgX8g5TbEP4wxYEvD3TixvNDrvJLxlF+Eyg2euAR1vRcSu7nSzn
         Tz+SV96JIFZrG4THpscLqBiY6VJotLXmuMBmvZIV4LMKID4De0Zq0gwLtnfIQ+8HNfK4
         Xc3t7BG5r8mO6hTF/7PuxU0BntY/RJeD12UqHOVhZQ1kRWfl0IfXY/zWgLftfy1TWO5R
         VhgRcvrZzquG7+z/1NL6NcJHHQR6yAxjM+QNKvsPHMKbMyCD01KlMHoKChRu2x9w385V
         Ljjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HK4ed8QncVCh1Vo6RkjCKVWlusnpc0yRSsJhSHttXjo=;
        b=AB+wbHCemKshL25K7GZDKGDdXBfpWG+OBGpPnLQqSyh/rNeSHMhGocAvunpz7A5PZ5
         6LXvIDmCM+2xqUeoZJAM0NPk2T4NJuGNXor1SYDpP3X9gOHW1GeO85vOY2qI5mvjEgi3
         7FsavzyoLzGLUp1Q/mdT5kf/4il0fv5SEBRNjRYkHUpwel+49iz/vQWPlbjAKdVeR76/
         303mpj5u5kJae/Esxh6wyw5e4/GU1Mjq/czFKAlGNQ2AofhZsE9S4OWxqz5HSgCATV2X
         6lYNozo7rTZifK8hI7eRXBRpYwBK2wv7ykiYkMwhwgdD0xPn9rPk4r5ZXh/UJWZpmH3D
         zo3g==
X-Gm-Message-State: AGi0Puanq1XtOWRZcRfHAzPuo4g0oyj1K+D3bCfJV5IPIW3QHS8eoOjN
        33c17jiu77sdoSfUj0qB9MNSS3JcluncMabQhFw=
X-Google-Smtp-Source: APiQypIB/XGkXii6L27d5qf83YyxYGAbhK8c1MrsYRHdgjJbWhupl2AuXbKYhWqnRF9Fu63Y3D4QathCLMexhIHAI08=
X-Received: by 2002:a1c:6344:: with SMTP id x65mr284093wmb.56.1588015867738;
 Mon, 27 Apr 2020 12:31:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200427063655.21169-1-yanaijie@huawei.com> <69374bbb-7e17-8b3a-8a24-591de2c55ee3@amd.com>
In-Reply-To: <69374bbb-7e17-8b3a-8a24-591de2c55ee3@amd.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 27 Apr 2020 15:30:56 -0400
Message-ID: <CADnq5_OK-uhUgxuemTy4gzYWZuoYJsYRgR+t5k7bC0CMXAKF+Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: remove conversion to bool in amdgpu_device.c
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Jason Yan <yanaijie@huawei.com>,
        "Deucher, Alexander" <alexander.deucher@amd.com>,
        Chunming Zhou <David1.Zhou@amd.com>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Applied.  thanks!

Alex

On Mon, Apr 27, 2020 at 4:02 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 27.04.20 um 08:36 schrieb Jason Yan:
> > The '>' expression itself is bool, no need to convert it to bool again.
> > This fixes the following coccicheck warning:
> >
> > drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:3004:68-73: WARNING:
> > conversion to bool not needed here
> >
> > Signed-off-by: Jason Yan <yanaijie@huawei.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_device.c
> > index 3d601d5dd5af..ad94de3632d8 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -3000,7 +3000,7 @@ int amdgpu_device_init(struct amdgpu_device *adev=
,
> >       INIT_WORK(&adev->xgmi_reset_work, amdgpu_device_xgmi_reset_func);
> >
> >       adev->gfx.gfx_off_req_count =3D 1;
> > -     adev->pm.ac_power =3D power_supply_is_system_supplied() > 0 ? tru=
e : false;
> > +     adev->pm.ac_power =3D power_supply_is_system_supplied() > 0;
> >
> >       /* Registers mapping */
> >       /* TODO: block userspace mapping of io register */
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
