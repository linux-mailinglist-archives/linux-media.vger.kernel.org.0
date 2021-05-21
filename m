Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C793838C733
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 14:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233375AbhEUM4y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 08:56:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235326AbhEUMzl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 08:55:41 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1596BC061347
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 05:54:16 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id i17so20955503wrq.11
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 05:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FJZtfLgsMzPpeEGC1nWMm7W+KSm1MH2DLYlMQ7WHt1A=;
        b=sFGpdh1dbpP8JSKR1U5AOEieSm0E4tGRK55RIlKzhpUYYD3nZXIvDR2brLKqPzRu0u
         zIyVfraBuh1c5fIsX1HMBxFUVwKD2R3qnFutX1JtHyW0NlRGTH0uvf832I4g8nhP0T/a
         mwwiDfknsZS7vuFFEi2KwIiHPPS1XkXKy3DnGSkiBlVJybTzdOZFR5fgrpIqzn5vP+UJ
         /kAfrcH2cZLJ8QhLo3Wg5w2a8TqB6b28BhglC7vyL8r099YlZraIJYospyDMT/v3U0MH
         u/USku+abTJL2De2pHeCfruVuOdK4CBydA07Cv6yLoBnuDbtwx0km2WGWDWNiPW8kci0
         fl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FJZtfLgsMzPpeEGC1nWMm7W+KSm1MH2DLYlMQ7WHt1A=;
        b=aVSgWL0HT3MOfhyddsyMTk0bctY6guxbMeNNxqfNtLEEfUDpceATknx3AUGMJQif7W
         //5cFpUV100ozMR56VBLqQ9nE7gMHbdR/plmOQU2Rs27zShN8SMBRP6wirpcCTKtgoeV
         UDEemh4h/hkfwPOAirSen2yHnQLmgXHU+P1kSmIHcN09V2URA9ffOXa6MTBDqgOGfxkE
         HCr/248moireVX/n28ljE1DQIg/pnCMAYZxPRPtrBkcI5eXvILd1GKW42d1Ey3MXzfpY
         NC7mn2ADMbNcw0Si2L+odpOmto1NoDstmRewNql2Hvnp+zZSB1ZEigxCGzidvdvbhP65
         ICEQ==
X-Gm-Message-State: AOAM5327dTBQ1r3+HRS9drvp3blv9yzJaKKgOv5B6gpUTZP54WQ8LAuv
        dWxlbPpHwYZdeFvA2/e5EPPK0li7AqepKgtCSkuGvQ==
X-Google-Smtp-Source: ABdhPJwl27bN4Oz12Tnt6vIx/LxywSl8190UB/7R09nMwblbNvh85dxGlpNGkieI1QeXVqDFLBux5vHjGvOpKZOK43M=
X-Received: by 2002:a5d:570c:: with SMTP id a12mr9289625wrv.354.1621601654629;
 Fri, 21 May 2021 05:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-4-daniel.vetter@ffwll.ch> <CAPj87rMBVRamT+VAVUaUnq3C1KFVqzABi99RKs=1_vyb4YWDnQ@mail.gmail.com>
 <d1ef10e8-b774-06e5-92ab-047c58e1ea41@amd.com>
In-Reply-To: <d1ef10e8-b774-06e5-92ab-047c58e1ea41@amd.com>
From:   Daniel Stone <daniel@fooishbar.org>
Date:   Fri, 21 May 2021 13:54:03 +0100
Message-ID: <CAPj87rOzV1mC=Nv2zfsYXrD4ARV7cmmJmkUCSwRSw1Ksy0k-aA@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 04/11] drm/panfrost: Fix implicit sync
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Steven Price <steven.price@arm.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 21 May 2021 at 13:28, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
> Am 21.05.21 um 14:22 schrieb Daniel Stone:
> > Yeah, the 'second-generation Valhall' GPUs coming later this year /
> > early next year are starting to get pretty weird. Firmware-mediated
> > job scheduling out of multiple queues, userspace having direct access
> > to the queues and can do inter-queue synchronisation (at least I think
> > so), etc. For bonus points, synchronisation is based on $addr =3D $val
> > to signal and $addr =3D=3D $val to wait, with a separate fence primitiv=
e
> > as well.
>
> Well that sounds familiar :)

I laughed when I first saw it, because it was better than crying I guess.

If you're curious, the interface definitions are in the csf/ directory
in the 'Bifrost kernel driver' r30p0 download you can get from the Arm
developer site. Unfortunately the exact semantics aren't completely
clear.

> > Obviously Arm should be part of this conversation here, but I guess
> > we'll have to wait for a while yet to see how everything's shaken out
> > with this new gen, and hope that whatever's been designed upstream in
> > the meantime is actually vaguely compatible ...
>
> Yeah, going to keep you in CC when we start to code and review user fence=
s.

Awesome, thanks Christian. Appreciate it. :)

Cheers,
Daniel
