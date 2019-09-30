Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DDA7C226F
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 15:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731406AbfI3Nup (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 09:50:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:40610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729738AbfI3Nup (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 09:50:45 -0400
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 377B3218DE;
        Mon, 30 Sep 2019 13:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569851444;
        bh=OIbZsPSF9qroZ0kz/LZxanDyoEYFB6HCUHmhhGKKq8k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=J8CyQdV6pCZnRDKG8N78sgAXNG4CxpVQcDB1HXZqdjOl45nFqHuI0N7YyyTmoJO9S
         enamULt2Px7Uq1qrwglFxrbHnkwlZHmwwwt5s7jxVv63r4FMNyBRu/XQ/ExjSuo8iN
         gyUxgEeMW9LMI3VHq3OhjuVw3/BvFvEBdk6tXVSw=
Received: by mail-lf1-f53.google.com with SMTP id u28so7093976lfc.5;
        Mon, 30 Sep 2019 06:50:44 -0700 (PDT)
X-Gm-Message-State: APjAAAXQUGBwE3xTED+55GFAip14ZXIaHdkqxrhwKOyzWbdRc4sF5etk
        CHK1LSenSZU7r7tO2h6nN31aE94PTkewm/1nY4U=
X-Google-Smtp-Source: APXvYqwVXh3xte/Qq+8kD2of/JzjRnkrT5ai7bQgRPTC8HxeWB5/Vq/4zTEr70WWOxMCWiqzOA7j5K25m/1BgMyTIZ0=
X-Received: by 2002:ac2:51a7:: with SMTP id f7mr11285925lfk.119.1569851442393;
 Mon, 30 Sep 2019 06:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190930101841.19630-1-ribalda@kernel.org> <20190930101841.19630-8-ribalda@kernel.org>
 <aa6ace11-9697-d3d9-907c-83b3398d8f5e@xs4all.nl>
In-Reply-To: <aa6ace11-9697-d3d9-907c-83b3398d8f5e@xs4all.nl>
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
Date:   Mon, 30 Sep 2019 15:50:25 +0200
X-Gmail-Original-Message-ID: <CAPybu_3vCpUzc8SxQUuYZpQmf-OrMx9ck=Wj3xv_5C0SzzBgWA@mail.gmail.com>
Message-ID: <CAPybu_3vCpUzc8SxQUuYZpQmf-OrMx9ck=Wj3xv_5C0SzzBgWA@mail.gmail.com>
Subject: Re: [PATCH v8 7/8] media: v4l2-ctrl: Add new helper v4l2_ctrl_ptr_from_void
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

Thanks for the review

On Mon, Sep 30, 2019 at 3:07 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 9/30/19 12:18 PM, Ricardo Ribalda Delgado wrote:
> > This helper function simplifies the code by not needing a union
> > v4l2_ctrl_ptr and an assignment every time we need to use
> > a ctrl_ptr.
> >
> > Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
> > Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> > ---
> >  include/media/v4l2-ctrls.h | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> > index c42f164e2c9e..d69cfdffd41d 100644
> > --- a/include/media/v4l2-ctrls.h
> > +++ b/include/media/v4l2-ctrls.h
> > @@ -73,6 +73,17 @@ union v4l2_ctrl_ptr {
> >       void *p;
> >  };
> >
> > +/**
> > + * v4l2_ctrl_ptr() - Helper function to return a v4l2_ctrl_ptr from a
> > + * void pointer
> > + * @ptr:     The void pointer
> > + */
> > +static inline union v4l2_ctrl_ptr v4l2_ctrl_ptr_from_void(void *ptr)
>
> Mismatch between function name and the comment above.
>
> But _from_void is not a good name, since it's from a void pointer.
>
> How about: v4l2_ctrl_ptr_create(void *ptr)
>
> since you create a v4l2_ctrl_ptr.
>
> Regards,
>
>         Hans

After talking on IRC:

Will fix both changes and resend v9 after v5.4-rc1 is merged back into
the media tree.

Thanks again!

>
> > +{
> > +     BUILD_BUG_ON(sizeof(union v4l2_ctrl_ptr) != sizeof(void *));
> > +     return (union v4l2_ctrl_ptr) ptr;
> > +}
> > +
> >  /**
> >   * struct v4l2_ctrl_ops - The control operations that the driver has to provide.
> >   *
> >
>
