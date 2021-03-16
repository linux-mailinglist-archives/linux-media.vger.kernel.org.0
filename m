Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A32833DB67
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 18:51:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232654AbhCPRvH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 13:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233040AbhCPRug (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 13:50:36 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68A12C06175F
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 10:50:35 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id m7so19076217iow.7
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 10:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JtrNAHIlNGqyu7tY2KgHDa90TRR2iABoGQSIvstGdZs=;
        b=kN4jETKpOsMT8ujABTKX/KoA1MUTlDRb+Z9NHUYVnpAh0syYrBtdaNgzA3IIHB602i
         HsTlTbMAjEyLIPblDWQdvaFB6Q6U8xj7Wm6Qa/UJmkrU/ZRuins9KWZSKS1KwDBsxG0K
         uk71bJAwFyqxS1ex5mOipRhoh7DVGXgqio8WQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JtrNAHIlNGqyu7tY2KgHDa90TRR2iABoGQSIvstGdZs=;
        b=DxIfFnuMvP4cLZUgoszfsii6qTdWRMGeGNhPk/K247uPYPTikVCX1XCk0Y6jbZweyB
         BCUx+F823zTG6V8fpt7OcdEHnFsHAhgRLTks9akCC1E+XhfSP/unit2Xho9Xp1vMSvoK
         zDct7cu2v7hicE63zyGui8NVYhia3H44+Pu5Mjb3+A+0ubQ1ZNL1iRTFgVennlzrqEJo
         eCd2KwhyYz9uXVRn68juvLdn3slTrNbiUDtMKBxs1RN5mFTOQIOy8Tb14IB0ANUwS/j0
         9pvvv0qoLyuFBndwn50VFBSwKJeLtDu4Al/YWA6CLSDGg/XroCDXceRS/E7go7nNH+pH
         9Raw==
X-Gm-Message-State: AOAM532HqpzLRtK2xrtjsM6iNncZJOQia/TGUKUHjWTAi8FEW5nRbUl9
        XmLhOymmJPFyEAnzWU7Rh0rPFF9dnFLlWw==
X-Google-Smtp-Source: ABdhPJwtLilJQ0cCUH6aMELhgFGvZZbKmRR9JcgK1k/6EjORf3Lt5vfQumBTcnpWq3i1mXOyzX3b+g==
X-Received: by 2002:a5e:cb4c:: with SMTP id h12mr4101923iok.183.1615917034650;
        Tue, 16 Mar 2021 10:50:34 -0700 (PDT)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com. [209.85.166.45])
        by smtp.gmail.com with ESMTPSA id a15sm9758650iln.87.2021.03.16.10.50.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Mar 2021 10:50:33 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id n14so38156921iog.3
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 10:50:32 -0700 (PDT)
X-Received: by 2002:a02:cb4b:: with SMTP id k11mr15230940jap.144.1615917032400;
 Tue, 16 Mar 2021 10:50:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210315123406.1523607-1-ribalda@chromium.org> <34c90095-bcbf-5530-786a-e709cc493fa9@linux.intel.com>
In-Reply-To: <34c90095-bcbf-5530-786a-e709cc493fa9@linux.intel.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 16 Mar 2021 18:50:20 +0100
X-Gmail-Original-Message-ID: <CANiDSCvMvYVN0+zN3du2pJfGLPJ_f7Ees2YrfybJgUDmBjq2jQ@mail.gmail.com>
Message-ID: <CANiDSCvMvYVN0+zN3du2pJfGLPJ_f7Ees2YrfybJgUDmBjq2jQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: staging/intel-ipu3: Fix memory leak in imu_fmt
To:     Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devel@driverdev.osuosl.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu

Thanks for your review

On Tue, Mar 16, 2021 at 12:29 PM Bingbu Cao <bingbu.cao@linux.intel.com> wrote:
>
> Hi, Ricardo
>
> Thanks for your patch.
> It looks fine for me, do you mind squash 2 patchsets into 1 commit?

Are you sure? There are two different issues that we are solving.

Best regards!

>
> On 3/15/21 8:34 PM, Ricardo Ribalda wrote:
> > We are losing the reference to an allocated memory if try. Change the
> > order of the check to avoid that.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 6d5f26f2e045 ("media: staging/intel-ipu3-v4l: reduce kernel stack usage")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/staging/media/ipu3/ipu3-v4l2.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
> > index 60aa02eb7d2a..35a74d99322f 100644
> > --- a/drivers/staging/media/ipu3/ipu3-v4l2.c
> > +++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
> > @@ -693,6 +693,13 @@ static int imgu_fmt(struct imgu_device *imgu, unsigned int pipe, int node,
> >               if (inode == IMGU_NODE_STAT_3A || inode == IMGU_NODE_PARAMS)
> >                       continue;
> >
> > +             /* CSS expects some format on OUT queue */
> > +             if (i != IPU3_CSS_QUEUE_OUT &&
> > +                 !imgu_pipe->nodes[inode].enabled) {
> > +                     fmts[i] = NULL;
> > +                     continue;
> > +             }
> > +
> >               if (try) {
> >                       fmts[i] = kmemdup(&imgu_pipe->nodes[inode].vdev_fmt.fmt.pix_mp,
> >                                         sizeof(struct v4l2_pix_format_mplane),
> > @@ -705,10 +712,6 @@ static int imgu_fmt(struct imgu_device *imgu, unsigned int pipe, int node,
> >                       fmts[i] = &imgu_pipe->nodes[inode].vdev_fmt.fmt.pix_mp;
> >               }
> >
> > -             /* CSS expects some format on OUT queue */
> > -             if (i != IPU3_CSS_QUEUE_OUT &&
> > -                 !imgu_pipe->nodes[inode].enabled)
> > -                     fmts[i] = NULL;
> >       }
> >
> >       if (!try) {
> >
>
> --
> Best regards,
> Bingbu Cao



-- 
Ricardo Ribalda
