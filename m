Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C340B39A9E2
	for <lists+linux-media@lfdr.de>; Thu,  3 Jun 2021 20:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbhFCSSy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Jun 2021 14:18:54 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51962 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhFCSSy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Jun 2021 14:18:54 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 75CC51F434B7
Message-ID: <cf495da7ff81ac5641198e813d337a4e825fb765.camel@collabora.com>
Subject: Re: [PATCH 1/5] media: v4l2: print the fh, during qbuf/dqbuf tracing
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Emil Velikov <emil.l.velikov@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Courbot <gnurou@gmail.com>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        kernel@collabora.com
Cc:     linux-media@vger.kernel.org
Date:   Thu, 03 Jun 2021 15:16:59 -0300
In-Reply-To: <20210517183801.1255496-2-emil.l.velikov@gmail.com>
References: <20210517183801.1255496-1-emil.l.velikov@gmail.com>
         <20210517183801.1255496-2-emil.l.velikov@gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Emil,

Thanks a lot for the series, I think it's great to start
discussing some generic tracing for the media subsytem.

First of all, looks like you should fix your submission
process, the cover letter didn't hit patchwork. See:

https://patchwork.linuxtv.org/project/linux-media/list/?series=5446

Unsure what's going on, but please take a look.

Some feedback about this patch.

On Mon, 2021-05-17 at 19:37 +0100, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
> 
> To correlate the buffer handling with specific jobs, we need to provide
> the file handle (pointer) used.
> 

In general, it will be useful to have more information here.
For instance, you are changing traces, so e.g. a before/after
could be better.

Not just for this patch, but in general, I think we'd like
to have more documentation.
 
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 10 ++++++++--
>  include/trace/events/v4l2.h          | 22 ++++++++++++----------
>  2 files changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 31d1342e61e8..4b56493a1bae 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -3343,10 +3343,16 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
>         }
>  
>         if (err == 0) {
> +               struct video_device *vdev = video_devdata(file);
> +               struct v4l2_fh *fh = NULL;
> +
> +               if (test_bit(V4L2_FL_USES_V4L2_FH, &vdev->flags))
> +                       fh = file->private_data;
> +
>                 if (cmd == VIDIOC_DQBUF)
> -                       trace_v4l2_dqbuf(video_devdata(file)->minor, parg);
> +                       trace_v4l2_dqbuf(fh, parg);
>                 else if (cmd == VIDIOC_QBUF)
> -                       trace_v4l2_qbuf(video_devdata(file)->minor, parg);
> +                       trace_v4l2_qbuf(fh, parg);
>         }
>  
>         if (has_array_args) {
> diff --git a/include/trace/events/v4l2.h b/include/trace/events/v4l2.h
> index 248bc09bfc99..e07311cfe5ca 100644
> --- a/include/trace/events/v4l2.h
> +++ b/include/trace/events/v4l2.h
> @@ -7,6 +7,7 @@
>  
>  #include <linux/tracepoint.h>
>  #include <media/videobuf2-v4l2.h>
> +#include <media/v4l2-device.h>
>  
>  /* Enums require being exported to userspace, for user tool parsing */
>  #undef EM
> @@ -98,12 +99,12 @@ SHOW_FIELD
>                 { V4L2_TC_USERBITS_8BITCHARS,   "USERBITS_8BITCHARS" })
>  
>  DECLARE_EVENT_CLASS(v4l2_event_class,
> -       TP_PROTO(int minor, struct v4l2_buffer *buf),
> -
> -       TP_ARGS(minor, buf),
> +       TP_PROTO(struct v4l2_fh *fh, struct v4l2_buffer *buf),
> +       TP_ARGS(fh, buf),
>  
>         TP_STRUCT__entry(
>                 __field(int, minor)
> +               __field(struct v4l2_fh *, fh)
>                 __field(u32, index)
>                 __field(u32, type)
>                 __field(u32, bytesused)
> @@ -124,7 +125,8 @@ DECLARE_EVENT_CLASS(v4l2_event_class,
>         ),
>  
>         TP_fast_assign(
> -               __entry->minor = minor;
> +               __entry->minor = fh ? fh->vdev->minor : -1;

I think this is a regression now, if the driver isn't using
V4L2_FL_USES_V4L2_FH, then minor field will be -1?

Maybe we could leave this ioctl trace, and drop this patch,
and instead do the tracing at the mem2mem level in v4l2_m2m_qbuf.

Thanks,
Ezequiel

