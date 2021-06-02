Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EFFC397E4A
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 03:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbhFBB7a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Jun 2021 21:59:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbhFBB73 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Jun 2021 21:59:29 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91403C061574;
        Tue,  1 Jun 2021 18:57:46 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id w127so1228598oig.12;
        Tue, 01 Jun 2021 18:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SU3VNhIHP4qFfMS6BHdB+T/4wdfQUGXE54wCPeu58gQ=;
        b=QQO75cNDTpDKr0tOdLOk5vG9ysCKgZa/phRsAdD89jlR+TT9Wjgl3mHuc1yXOnZu9L
         xsRhHTI9U8g5BYgBihgDXw6SikyKy9uI+vcBR/0GRLeuZPZPL/sZ+Q8NyhCrFi6h/8Rq
         ZEOkfNeRAWeAfwfI/4mLVNOdfpqIvjsk/+BgiSUjprCSv3xhbHyQZJvd23gxCfFk6QKD
         QOImaejnjZGYi3c+IWhtKD14pHWKC11iaZ1fLPcXIYgwoFVMWYOv7mN3EYxOAP7W4T9/
         yHHTxTAYdLhrWVepaPX/WcM0IxKK2z1R8oLv3rcFrSmis3GkxABc1obOY4Yh0u0nmFw4
         Ckkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SU3VNhIHP4qFfMS6BHdB+T/4wdfQUGXE54wCPeu58gQ=;
        b=qUeuVpZFppJmDFsyW5XS1qHCIl8KNtrxcDAAiHnjkGtZdQY4dz5vB4FDbEWcpRVMvZ
         IwThj+felhl5bcvA9vmoP+j6fpYPI2lbH1SEEM/E+S5/CJ2h7q1KHXWEfKuSCmRCMdGS
         cZWNO/0PnYJIs2bu1tjy3Wi8UrHMSMqHQjpWsmZ8a1y0q8LQivyXYjcbMEUAy3/lwz3c
         M7A0jKPpEC/XkZ6yWOb0BW2WiAY8VFXQoKHiGW7xzwYgvq6q4204nsiDwEbVcqZT1jxS
         FaCion38U6NXiE36P6PaPYYeQxCD5UcD+aGa5z9w0Wkw37FVc6gTmvAGlMrT0BIBA3Xc
         bFpQ==
X-Gm-Message-State: AOAM533Go/l6E2UmvrmlDKIo/66yfR6HpKavakorKLMe13XeN3x/0Mpn
        +2w59558iPZhvJOFzkboplvrdjvCcjGPLbp6oaI=
X-Google-Smtp-Source: ABdhPJz1oJcj/TIW7IPXKfUGMx+mKb7O5I8+KY9nNPCZgngt3Y0TTxSNjp3R9qmQkBVU/dtI0mfS9UGxQ14qdDZsEFg=
X-Received: by 2002:a05:6808:1592:: with SMTP id t18mr19903224oiw.123.1622599066060;
 Tue, 01 Jun 2021 18:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <1622194158-70898-1-git-send-email-jiapeng.chong@linux.alibaba.com>
 <37a4f0bf-4acb-3961-699b-8335e194e315@amd.com>
In-Reply-To: <37a4f0bf-4acb-3961-699b-8335e194e315@amd.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 1 Jun 2021 21:57:35 -0400
Message-ID: <CADnq5_NY_uWzB6QjsM0_+xcbQkMfy1wm2gQx3v7xW_eHQ804YA@mail.gmail.com>
Subject: Re: [PATCH v3] amdgpu: remove unreachable code
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        "Deucher, Alexander" <alexander.deucher@amd.com>,
        Dave Airlie <airlied@linux.ie>,
        LKML <linux-kernel@vger.kernel.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Applied.  Thanks!

On Fri, May 28, 2021 at 8:18 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 28.05.21 um 11:29 schrieb Jiapeng Chong:
> > In the function amdgpu_uvd_cs_msg(), every branch in the switch
> > statement will have a return, so the code below the switch statement
> > will not be executed.
> >
> > Eliminate the follow smatch warning:
> >
> > drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:845 amdgpu_uvd_cs_msg() warn:
> > ignoring unreachable code.
> >
> > Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> > Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> > Changes in v2:
> >    -For the follow advice: https://lore.kernel.org/patchwork/patch/1435=
968/
> >
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_uvd.c
> > index c6dbc08..35f6874 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> > @@ -829,9 +829,8 @@ static int amdgpu_uvd_cs_msg(struct amdgpu_uvd_cs_c=
tx *ctx,
> >
> >       default:
> >               DRM_ERROR("Illegal UVD message type (%d)!\n", msg_type);
> > -             return -EINVAL;
> >       }
> > -     BUG();
> > +
> >       return -EINVAL;
> >   }
> >
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
