Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54EAD22E8B4
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 11:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726989AbgG0JTA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 05:19:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726228AbgG0JS7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 05:18:59 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 634AEC061794
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2020 02:18:58 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id h13so11842849otr.0
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2020 02:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zc3ux+IsWbWWoLKJHkKGARI75ZF/T808eZJbHvIF1VM=;
        b=eMX3EfSoC71BJ468HuVnT4tHiHT+kZc9Rf5BLBGRmdbnX625br9/ZgrTVBIs9VkvxM
         h/NhtF6V+Z3r49dXCdhoqeoPsS6BbCAMMQSjziQVUeGaC+Ssn1F1wbxFkcVDpyMkMAJT
         TfGtlT4eQc8JuVia9jsB/3H03cpkXx//owQQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zc3ux+IsWbWWoLKJHkKGARI75ZF/T808eZJbHvIF1VM=;
        b=CDAqNx+9xKaFfSaeznbnFElLXCjZ5dkJZVsfxj4n7cOdbnd9qWap4bphc2qSFzCdKs
         Eqq2g1i8nI3jK8jOjKgtYEBOFOKEdSE8uS6Qfxif1X8kmmPAy5ECBxdXMmMgidXXUS2v
         kNE4gaOJ6ztb1/0rDihV+9XqnAFIaJOtS/5DGMI2KHCXoHqfwSZamnwA8XqaaDuTZBWY
         JBTApxEBhS7+GS3hXE0fiPV3Wx2PKMZiCUGxC/MexHnkvJxeU1VievgtGlBnCLoIKudx
         8o6e17TveGqJHsSjN3wzCBbxz+uSnK06Y52dKMfEEzG2WHHa44G3Kn5eZGv9HLViHKvK
         0cIw==
X-Gm-Message-State: AOAM5300nlFYIt5A39JQrFTRIvDWQa5HedVggr68xFQe9Jz4F2C7912D
        KrXdL4gi7ppnsRlWzYcKBO936dXLHGc=
X-Google-Smtp-Source: ABdhPJxyQj1adgASPpU3qk5m+N+wFs0us57vbgSG8MHdh0w4YjF0wBZiWl8FMPISq+eA4jQgA7j44Q==
X-Received: by 2002:a05:6830:4a6:: with SMTP id l6mr19034770otd.229.1595841536487;
        Mon, 27 Jul 2020 02:18:56 -0700 (PDT)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com. [209.85.161.51])
        by smtp.gmail.com with ESMTPSA id q12sm3238398otm.5.2020.07.27.02.18.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 02:18:55 -0700 (PDT)
Received: by mail-oo1-f51.google.com with SMTP id n21so2128832ooj.5
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2020 02:18:55 -0700 (PDT)
X-Received: by 2002:a4a:1d83:: with SMTP id 125mr20003757oog.18.1595841534527;
 Mon, 27 Jul 2020 02:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200720092933.2089288-1-jjsu@chromium.org> <91e92ed1-5364-884d-79ab-20d64594deb2@koikeco.de>
In-Reply-To: <91e92ed1-5364-884d-79ab-20d64594deb2@koikeco.de>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Mon, 27 Jul 2020 18:18:41 +0900
X-Gmail-Original-Message-ID: <CAPBb6MW4qD8+1vW4HYb5Fg0Q-kMsHcQebRE-_4a4CSHpNcEFMw@mail.gmail.com>
Message-ID: <CAPBb6MW4qD8+1vW4HYb5Fg0Q-kMsHcQebRE-_4a4CSHpNcEFMw@mail.gmail.com>
Subject: Re: [PATCH] media: v4l2-dev/ioctl: Fix document for VIDIOC_QUERYCAP
To:     Helen Koike <helen@koikeco.de>
Cc:     Jian-Jia Su <jjsu@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 21, 2020 at 4:45 AM Helen Koike <helen@koikeco.de> wrote:
>
> Hi,
>
> On 7/20/20 6:29 AM, Jian-Jia Su wrote:
> > V4L2_CAP_VIDEO_M2M is documented as 0x00004000
> > V4L2_CAP_VIDEO_M2M_MPLANE is documented as 0x00008000
> > This is different from the definition in include/uapi/linux/videodev2.h
> >
>
> Nice catch, they are swapped in the docs indeed.
>
> From videodev2.h:
>
> /* Is a video mem-to-mem device that supports multiplanar formats */
> #define V4L2_CAP_VIDEO_M2M_MPLANE       0x00004000
> /* Is a video mem-to-mem device */
> #define V4L2_CAP_VIDEO_M2M              0x00008000
>
> > Signed-off-by: Jian-Jia Su <jjsu@chromium.org>
>
> Reviewed-by: Helen Koike <helen.koike@collabora.com>

FWIW,

Reviewed-by: Alexandre Courbot <acourbot@chromium.org>

>
> Regards,
> Helen
>
> > ---
> >  Documentation/userspace-api/media/v4l/vidioc-querycap.rst | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
> > index 666ac4d420519..90347367ef06a 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
> > @@ -168,11 +168,11 @@ specification the ioctl returns an ``EINVAL`` error code.
> >        - The device supports the :ref:`multi-planar API <planar-apis>`
> >       through the :ref:`Video Output <output>` interface.
> >      * - ``V4L2_CAP_VIDEO_M2M``
> > -      - 0x00004000
> > +      - 0x00008000
> >        - The device supports the single-planar API through the Video
> >       Memory-To-Memory interface.
> >      * - ``V4L2_CAP_VIDEO_M2M_MPLANE``
> > -      - 0x00008000
> > +      - 0x00004000
> >        - The device supports the :ref:`multi-planar API <planar-apis>`
> >       through the Video Memory-To-Memory interface.
> >      * - ``V4L2_CAP_VIDEO_OVERLAY``
> >
