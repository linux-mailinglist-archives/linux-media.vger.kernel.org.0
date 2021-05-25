Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3449F3905A1
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 17:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231918AbhEYPk3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 11:40:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230521AbhEYPk2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 11:40:28 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD3C6C061574;
        Tue, 25 May 2021 08:38:58 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id t10-20020a05683022eab0290304ed8bc759so28974087otc.12;
        Tue, 25 May 2021 08:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=G29C7319Dv2jp3aawArMwM12C1t7ygPQnrD+x7K3emo=;
        b=KU7xaHHWx+wjYxjyiCHaCZEWUPHeUexy/WMEsPCmjL8AAcOY6Vq2QpeGYW0xF87Ll7
         q261c+N8lKPgZf/XwQ7j7x3C6Qa6A12CgzAe3UzfA2ubPMbkB1zFND9rE4wuz9ScI9+J
         agYywA53hAc2mlCHM4WT2j/Y1/8PaTyCaXJMDwnj9xHnIl/jxyOV6TuuFx1Vk6Z+b0nz
         l/ha/d3NccEWuIY09x7gkQPjt9pmGPRYLH+KxlE2+Z6ZSQqlYUIedi/QPpWaGTKOTfqO
         S+AvIR8SGj09nK1ODGEOX5JoJS05lrzwrYIAvbnJAF6ZkmkyKm18LulSYjCIKAWTsTT3
         jkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=G29C7319Dv2jp3aawArMwM12C1t7ygPQnrD+x7K3emo=;
        b=hYjd3Sb+3LIq1gwr6Bf0NlJoriN7Zl5tasYrPRV+9oxAkJDo86zGpyaRt1FZ/P2Xpg
         iJjEQmpDGkL4A+1B1isI90tseKmTYJ8U13Um2fbb3vwMtZZViEz9Okwo84x0K+YAwio2
         h2qRhAJtG0ivPq6KfEF6xrX+smmqPVVac2GIRVQj1nMqiySAR6mOCtUiHDKKsyX2XjSx
         7ZyqWmunIf8jNzGrSYwI/FUjIj8lczsMqKPvqY5DbNTka19h8GVp/5Y/XMRAgBYleft1
         h40wnlChD6vOIfEVLry+Cjsy+eicIqvsVwVZS7nTfJ9AbInqWOw0S2N4r04jw+Bvqg18
         KlXw==
X-Gm-Message-State: AOAM533wR4McNlAeS4BY9mAQ+dcMLb14qILvKVcFPKrTsP9fr/Xom9fx
        Xw6PxluErbRfWfzICYmdUhMIxbat+NYxP8d303s=
X-Google-Smtp-Source: ABdhPJyGNsx4a/dIqRXAcEEjQuHqAgdTAML8/MtCbrWA0+YY4Kkwm24gxdVHMVAyL+bFEaY7hRXemO0XzttpEfnPt+s=
X-Received: by 2002:a9d:74c6:: with SMTP id a6mr24158328otl.132.1621957138307;
 Tue, 25 May 2021 08:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <1621853213-55876-1-git-send-email-jiapeng.chong@linux.alibaba.com>
 <CADnq5_N3WkoYHcn8b1-qZ23+t=E9xxV5fV_1Lwqck6x2dUPqmA@mail.gmail.com> <950d5d2a-c01f-35d4-0933-04cae2c4984d@gmail.com>
In-Reply-To: <950d5d2a-c01f-35d4-0933-04cae2c4984d@gmail.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 25 May 2021 11:38:47 -0400
Message-ID: <CADnq5_PgmZMTOKGSt29_MkonMaf5exgBy1VUgHyd14dKT+_13A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: remove unreachable code
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Dave Airlie <airlied@linux.ie>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "Deucher, Alexander" <alexander.deucher@amd.com>,
        Christian Koenig <christian.koenig@amd.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 25, 2021 at 11:27 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 24.05.21 um 20:48 schrieb Alex Deucher:
> > Applied.  Thanks!
>
> Ok, that's unfortunate.
>
> IIRC we added the code because of a different compiler warning.
>

I can revert it.

Alex

> Christian.
>
> >
> > Alex
> >
> > On Mon, May 24, 2021 at 6:47 AM Jiapeng Chong
> > <jiapeng.chong@linux.alibaba.com> wrote:
> >> In the function amdgpu_uvd_cs_msg(), every branch in the switch
> >> statement will have a return, so the code below the switch statement
> >> will not be executed.
> >>
> >> Eliminate the follow smatch warning:
> >>
> >> drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:845 amdgpu_uvd_cs_msg() warn:
> >> ignoring unreachable code.
> >>
> >> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> >> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> >> ---
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 2 --
> >>   1 file changed, 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_uvd.c
> >> index 82f0542..375b346 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> >> @@ -842,8 +842,6 @@ static int amdgpu_uvd_cs_msg(struct amdgpu_uvd_cs_=
ctx *ctx,
> >>                  DRM_ERROR("Illegal UVD message type (%d)!\n", msg_typ=
e);
> >>                  return -EINVAL;
> >>          }
> >> -       BUG();
> >> -       return -EINVAL;
> >>   }
> >>
> >>   /**
> >> --
> >> 1.8.3.1
> >>
> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/amd-gfx
>
