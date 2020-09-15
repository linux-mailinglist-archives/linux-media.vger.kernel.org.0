Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 864D926AD21
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 21:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727935AbgIOTGT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 15:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727559AbgIOTCU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 15:02:20 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B9F1C061788
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2020 12:02:19 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id s13so510439wmh.4
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2020 12:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yXie8KLV7ShlZWhEm9UlbuFqIWQ7E77axILBYs0CyOY=;
        b=VXzVLKVemj5KkWSG36GqyUkMATpaKPcudVfiq3MwDsuDJ0c17tK2bo/NiDgkfw5yKy
         pE9dBIsXPOeBwPvxA4TPbdMit4Vl8y3nnoJetU2KH6rPOL/njCIt0dc8ysH1clbROPmg
         copZ1T0oylISB8qXRxJT/VtlRzPEIax2Sego+m3Y+eU9poNsBgMojSQlrRFZoeRbv2Xo
         andiWRFfCCEceJ2BVZxie7WEaBMYBewsWKxM7P945A5P0Dl5H/3wYxjy3zkg/9GPBnUK
         9Hxd75SWfQTT8utSQcOQqurRK5subkGfe9c4dTC8aJgFZAkBhzlI0orlRTS5x8jXLqSP
         Hlog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yXie8KLV7ShlZWhEm9UlbuFqIWQ7E77axILBYs0CyOY=;
        b=VY2GKXu2MLmabVprIPy1zd6FQfU/urFpeoljQN4C8DLWSMzzFKBUOGqICEdpGWdYOw
         WXY+RV9ltLr2iJY/TU0pdrLpc66N914JPdnUGuGterIKOf29AxCAesbWH0slIxhkvmYH
         fJ/Vzj3IU5KL73lTUaK7UmSLYFjuWuQfmL6OFRGe48WOlJ4eeM44MQOyPvB6C2rqu1mA
         Xa8GXa9U5d55eQClhcwD9aqtpGm5m/1AGf7RE+QACG6YIenCgzQ4VbWJtSJAbQRGkeMX
         5kzHY2wyGBxpEiHK0fCHBlZB/suxu7tdZGOtlnXFDFghVUWlzJ+zxKVPhcFGTN9xgMje
         OoXA==
X-Gm-Message-State: AOAM532nLWWhMW4lusGqdO8Pvt00RtRHwHRq92g6dnk9jmjs25758e+6
        yNJ48c/BQ2N1eVZ1EhzCq+R29oLseSFemKog4yHpxqAd
X-Google-Smtp-Source: ABdhPJzk9eyxFbI1rJI68h478tr8wfvyAYGWtTFclkkVdtqdvg+JoAVZ3j4OlPmVc8RQgrxC9TLlU1GoxApBrz0roOA=
X-Received: by 2002:a7b:c141:: with SMTP id z1mr793609wmi.79.1600196538282;
 Tue, 15 Sep 2020 12:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <1599638225-39300-1-git-send-email-tiantao6@hisilicon.com> <665ed169-cc12-2e6e-11f9-bc1a69fdaad7@amd.com>
In-Reply-To: <665ed169-cc12-2e6e-11f9-bc1a69fdaad7@amd.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 15 Sep 2020 15:02:07 -0400
Message-ID: <CADnq5_Mj4bJ-FMORL9cvex5E_5gO6p5CQqTvcDSA0OZoPeHevQ@mail.gmail.com>
Subject: Re: [PATCH] drm/scheduler: fix sched_fence.c kernel-doc warnings
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Tian Tao <tiantao6@hisilicon.com>, Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "Deucher, Alexander" <alexander.deucher@amd.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        linux-media <linux-media@vger.kernel.org>, linuxarm@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Applied.  Thanks!

Alex

On Wed, Sep 9, 2020 at 5:11 AM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 09.09.20 um 09:57 schrieb Tian Tao:
> > Fix kernel-doc warnings.
> > drivers/gpu/drm/scheduler/sched_fence.c:110: warning: Function paramete=
r or
> > member 'f' not described in 'drm_sched_fence_release_scheduled'
> > drivers/gpu/drm/scheduler/sched_fence.c:110: warning: Excess function
> > parameter 'fence' description in 'drm_sched_fence_release_scheduled'
> >
> > Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/scheduler/sched_fence.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/=
scheduler/sched_fence.c
> > index 8b45c3a1b84..69de2c7 100644
> > --- a/drivers/gpu/drm/scheduler/sched_fence.c
> > +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> > @@ -101,7 +101,7 @@ static void drm_sched_fence_free(struct rcu_head *r=
cu)
> >   /**
> >    * drm_sched_fence_release_scheduled - callback that fence can be fre=
ed
> >    *
> > - * @fence: fence
> > + * @f: fence
> >    *
> >    * This function is called when the reference count becomes zero.
> >    * It just RCU schedules freeing up the fence.
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
