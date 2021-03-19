Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30C2834206F
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 16:02:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230493AbhCSPBp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 11:01:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbhCSPB0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 11:01:26 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43D64C06174A;
        Fri, 19 Mar 2021 08:01:26 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 15so12431753ljj.0;
        Fri, 19 Mar 2021 08:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3fuMF5lDYvIer8q/4u3Bt0urdjXphqXlR0AzV9iXUbw=;
        b=cpYDUdy86Ttv1uleRESwAsnmbznYVoKLpTzwBfe9HuoOu3rINS1vnBCAumz/D+a641
         7LrxzwU5fWtO3hB/TwKd781wNPKKIMC5v975X7zh8cXNIRKcfdrdowo5h1SKmP7uOSLa
         GWns/Jwpw6TskTxr3E+NqIVB3TQjpxVJJQlN/zQF3HXWX7c8zNM1/9xIQWizshDiNIZz
         NSKiKEwB5RA9EF7QYXlm2G8ELqkYwmh9Kl8NtQJ/oT+8oc2G+F9MRWlb1wtoVuMgN3q8
         7op6EkMJCcoU8Ku8v54YSbyKB5LZCAIV4pkYQG87a8TSE515qyGzPQjiZ4yQcr7fSvFB
         6k+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3fuMF5lDYvIer8q/4u3Bt0urdjXphqXlR0AzV9iXUbw=;
        b=o7ZI4dTP4v845jSwD1Hmkf36JHDMlpo2UQ/7z0yjySRFPq5ZAMPDuzr0k1a0pMPIME
         Bn96bdbkX1T0p2Ww+elwwJ4TFsDTs7ZpQrcfK2ASxxYHHaRKZ2xEPqjWOH/w10haL+lE
         QVYBwFzhnodF77qqcXLXw6RbWyyxTaNdwYFpuEPKZ0NwVO9V3TYrPo19Rel6Jw0pb0C9
         1SiAfmb3dsQJO2IN32m7pKiBjiIr6RVZrdWyLmaptb6aPr7I5xxWDtkWVKElopt4j4jX
         k3Rh8uSOmxo6B5GZcJ4QFTdzYGROBv1BDUzPsLX9JH8nbWSdifhHTi7zsxLNCATfYodY
         gOXw==
X-Gm-Message-State: AOAM533wQFG04xv6fPDn8Cmzha1y0LEE6uHpQzuar7desbkZ8q/3PWoF
        If54LWfpbrgMoiyzx+yZpM5BQ21gUSzqcfP7kHU=
X-Google-Smtp-Source: ABdhPJyosTcGlomxOYNpPIQY1YUObZp64SlFmebAtU0ZmPpn8/D4ejgrkNBkz1qSJzQYoDfeze5P2JKu6jA7fL0TIlo=
X-Received: by 2002:a2e:b88b:: with SMTP id r11mr1143604ljp.495.1616166079925;
 Fri, 19 Mar 2021 08:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210318202928.166955-1-ribalda@chromium.org> <20210318202928.166955-16-ribalda@chromium.org>
 <0aa1e1cb-063e-73d8-1fca-ca089029f1f9@xs4all.nl>
In-Reply-To: <0aa1e1cb-063e-73d8-1fca-ca089029f1f9@xs4all.nl>
From:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Fri, 19 Mar 2021 16:01:03 +0100
Message-ID: <CAPybu_2FSQY7XsuqfLAS59wPNTgkD=s1dK2ppGGtBpJPddQLPQ@mail.gmail.com>
Subject: Re: [PATCH v7 15/17] media: uvcvideo: Refactor __uvc_ctrl_commit
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hans


On Fri, Mar 19, 2021 at 9:35 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 18/03/2021 21:29, Ricardo Ribalda wrote:
> > Take a v4l2_ext_controls instead of an array of controls, this way we
> > can access the error_idx in future changes.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c |  5 ++---
> >  drivers/media/usb/uvc/uvc_v4l2.c |  8 ++++++--
> >  drivers/media/usb/uvc/uvcvideo.h | 10 ++++------
> >  3 files changed, 12 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 1ec8333811bc..fb8155ca0c0d 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1664,8 +1664,7 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
> >  }
> >
> >  int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
> > -                   const struct v4l2_ext_control *xctrls,
> > -                   unsigned int xctrls_count)
> > +                   struct v4l2_ext_controls *ctrls)
> >  {
> >       struct uvc_video_chain *chain = handle->chain;
> >       struct uvc_entity *entity;
> > @@ -1679,7 +1678,7 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
> >       }
> >
> >       if (!rollback)
> > -             uvc_ctrl_send_events(handle, xctrls, xctrls_count);
> > +             uvc_ctrl_send_events(handle, ctrls->controls, ctrls->count);
> >  done:
> >       mutex_unlock(&chain->ctrl_mutex);
> >       return ret;
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index ddebdeb5a81b..ea2c41b04664 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -1025,6 +1025,10 @@ static int uvc_ioctl_s_ctrl(struct file *file, void *fh,
> >       struct uvc_fh *handle = fh;
> >       struct uvc_video_chain *chain = handle->chain;
> >       struct v4l2_ext_control xctrl;
> > +     struct v4l2_ext_controls ctrls = {
> > +             .count = 1,
> > +             .controls = &xctrl,
> > +     };
>
> Rather than creating this extra ctrls struct, I think this can be simplified by just
> removing uvc_ioctl_s_ctrl and uvc_ioctl_g_ctrl altogether. The v4l2-ioctl.c source
> will call vidioc_g/s_ext_ctrls if the driver doesn't provide vidioc_g/s_ctrl ops.
>
> Let's just simplify this by adding another patch before this one that just removes
> uvc_ioctl_s_ctrl and uvc_ioctl_g_ctrl.
>
> Otherwise this patch looks good.

I think I have found a 13 year old bug.....
https://git.kernel.org/pub/scm/linux/kernel/git/ribalda/linux.git/commit/?h=uvc-compliance-v8&id=7034e9ed5a8203c73cef9ab972ece48ade70b22f

>
> Regards,
>
>         Hans
>
> >       int ret;
> >
> >       ret = uvc_ctrl_is_accessible(chain, ctrl->id, VIDIOC_S_CTRL);
> > @@ -1045,7 +1049,7 @@ static int uvc_ioctl_s_ctrl(struct file *file, void *fh,
> >               return ret;
> >       }
> >
> > -     ret = uvc_ctrl_commit(handle, &xctrl, 1);
> > +     ret = uvc_ctrl_commit(handle, &ctrls);
> >       if (ret < 0)
> >               return ret;
> >
> > @@ -1149,7 +1153,7 @@ static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
> >       ctrls->error_idx = 0;
> >
> >       if (ioctl == VIDIOC_S_EXT_CTRLS)
> > -             return uvc_ctrl_commit(handle, ctrls->controls, ctrls->count);
> > +             return uvc_ctrl_commit(handle, ctrls);
> >       else
> >               return uvc_ctrl_rollback(handle);
> >  }
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index a93aeedb5499..4e7b6da3c6d2 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -887,17 +887,15 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
> >
> >  int uvc_ctrl_begin(struct uvc_video_chain *chain);
> >  int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
> > -                   const struct v4l2_ext_control *xctrls,
> > -                   unsigned int xctrls_count);
> > +                   struct v4l2_ext_controls *ctrls);
> >  static inline int uvc_ctrl_commit(struct uvc_fh *handle,
> > -                               const struct v4l2_ext_control *xctrls,
> > -                               unsigned int xctrls_count)
> > +                               struct v4l2_ext_controls *ctrls)
> >  {
> > -     return __uvc_ctrl_commit(handle, 0, xctrls, xctrls_count);
> > +     return __uvc_ctrl_commit(handle, 0, ctrls);
> >  }
> >  static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
> >  {
> > -     return __uvc_ctrl_commit(handle, 1, NULL, 0);
> > +     return __uvc_ctrl_commit(handle, 1, NULL);
> >  }
> >
> >  int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
> >
>


-- 
Ricardo Ribalda
