Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A8DE33FCA
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 09:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbfFDHQP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 03:16:15 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:46971 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726691AbfFDHQP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 03:16:15 -0400
Received: by mail-ua1-f67.google.com with SMTP id a95so7401859uaa.13;
        Tue, 04 Jun 2019 00:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=744sh7i43ZPFiN/iw9NUnCWgofSPxKmCotfAmBs96b0=;
        b=IFAC6NpkYpPw9Edw3aHOIdy91qw0uIepSwcauD/df4nSMlkVUwHXfXu321k9CvyEuw
         YYgWZHxXYCT+buuHuW+5qonZRv38j7KV6LhJHUmgWUndZE4mFQbGlbvSfFCH7xTx8eix
         u+6x9o6n8sR4kpdymr5Z4PhAaP138QNtmLZHUDfHzZXMH1t7O1onvwbGz/2TPtH8sspe
         XblRix14XPcuEME0y8acw7xbkWK1BxRTncFik1Ac8HoyMHqIXzwVbRnXtXh/7wXIdRb9
         TZipOjYXX80jgGyGq0Nb8zMYoQMGVQARgoPSruNNbKBOluDYV9Q3N7IRrGx1vI6cCtM0
         VdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=744sh7i43ZPFiN/iw9NUnCWgofSPxKmCotfAmBs96b0=;
        b=NmwJJMbUMAevFQJH2NZZYjit7kIHZJpSyknaiBDjkPgVIxtqhFxPbekKDuWOKu6DQL
         Eu3CvwWy/w1Vafld6Q/DuaPrwVvV/vnMR0U5Jc7GvPm7pclIZZhXqGNN16OiqCfEBK/m
         Z5CTBj45hrXKHuWVc+obScICeDZE9gDFq5g3z058Y0rnuZYS+pCQbV8fOH4zZdPbmKX8
         hNjT6VZNAp351Vu6233Qti0GqmJ3v4rXtbJHUMbn/w72jZOuFOdOuQBLq0svieh9Rnq0
         FQSOkhu/HVNheaOwLcHcmHY/foVhFfI9Mpm2t080f9Kn8tcS5hbmIwarI05PkknEJrQO
         oBKg==
X-Gm-Message-State: APjAAAXetN1ehy27fnvsvoH+TrS1MJlXErKWn9/+0nFVcFYzlnFitPwT
        UQtmSc8AL96hMUeDoTGDbocVGgxJ0jJMZGybS00=
X-Google-Smtp-Source: APXvYqzUFQzKn9EneUzQvkQXk+oR8D+qZEm+3bxwEJhZF+r5g1FUgxpQ67hcS3Bz6JHc6oltyqHurNNTPWsPx5RFJto=
X-Received: by 2002:ab0:4e12:: with SMTP id g18mr14881980uah.1.1559632574221;
 Tue, 04 Jun 2019 00:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <1559135399-28998-1-git-send-email-92siuyang@gmail.com> <9a2b8351-cdb7-cec7-87d0-7aafb93ab647@xs4all.nl>
In-Reply-To: <9a2b8351-cdb7-cec7-87d0-7aafb93ab647@xs4all.nl>
From:   Yang Xiao <92siuyang@gmail.com>
Date:   Tue, 4 Jun 2019 15:15:33 +0800
Message-ID: <CAKgHYH0fCgo98+3R4+VWmV9RYHoy7v_BsV39Ed_qOYrxT0+zPA@mail.gmail.com>
Subject: Re: [PATCH] media: davinci: vpif_capture: fix memory leak in vpif_probe()
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     prabhakar.csengg@gmail.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Yes, you are correct. I will fix the issue and resubmit the patch again.

On Mon, Jun 3, 2019 at 7:55 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 5/29/19 3:09 PM, Young Xiao wrote:
> > If vpif_probe() fails on vpif_probe_complete(), then memory
> > allocated at initialize_vpif() for global vpif_obj.dev[i]
> > become unreleased.
> >
> > The patch adds deallocation of vpif_obj.dev[i] on the error path.
> >
> > Signed-off-by: Young Xiao <92siuyang@gmail.com>
> > ---
> >  drivers/media/platform/davinci/vpif_capture.c | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
> > index b5aacb0..63e6ec4 100644
> > --- a/drivers/media/platform/davinci/vpif_capture.c
> > +++ b/drivers/media/platform/davinci/vpif_capture.c
> > @@ -1621,6 +1621,14 @@ vpif_capture_get_pdata(struct platform_device *pdev)
> >       return NULL;
> >  }
> >
> > +static void free_vpif_objs(void)
> > +{
> > +     int i;
> > +
> > +     for (i = 0; i < VPIF_DISPLAY_MAX_DEVICES; i++)
> > +             kfree(vpif_obj.dev[i]);
> > +}
> > +
> >  /**
> >   * vpif_probe : This function probes the vpif capture driver
> >   * @pdev: platform device pointer
> > @@ -1701,7 +1709,10 @@ static __init int vpif_probe(struct platform_device *pdev)
> >                                 "registered sub device %s\n",
> >                                  subdevdata->name);
> >               }
> > -             vpif_probe_complete();
> > +             err = vpif_probe_complete();
> > +             if (err) {
> > +                     goto probe_subdev_out;
> > +             }
>
> No need for { and } as per kernel coding style.
>
> >       } else {
> >               vpif_obj.notifier.ops = &vpif_async_ops;
> >               err = v4l2_async_notifier_register(&vpif_obj.v4l2_dev,
> > @@ -1722,6 +1733,7 @@ static __init int vpif_probe(struct platform_device *pdev)
> >       v4l2_device_unregister(&vpif_obj.v4l2_dev);
> >  cleanup:
> >       v4l2_async_notifier_cleanup(&vpif_obj.notifier);
> > +     free_vpif_objs();
>
> This would break the case where initialize_vpif() returns an error, since
> initialize_vpif already frees these objects on error.
>
> In this case the easiest way of doing this is to just return if initialize_vpif
> returns an error. No need to clean up anything.
>
> Regards,
>
>         Hans
>
> >
> >       return err;
> >  }
> > @@ -1748,8 +1760,8 @@ static int vpif_remove(struct platform_device *device)
> >               ch = vpif_obj.dev[i];
> >               /* Unregister video device */
> >               video_unregister_device(&ch->video_dev);
> > -             kfree(vpif_obj.dev[i]);
> >       }
> > +     free_vpif_objs()
> >       return 0;
> >  }
> >
> >
>
