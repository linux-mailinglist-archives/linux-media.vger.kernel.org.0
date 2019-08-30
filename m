Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EAB0A346E
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2019 11:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727961AbfH3Jsx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Aug 2019 05:48:53 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46247 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727884AbfH3Jsx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Aug 2019 05:48:53 -0400
Received: by mail-oi1-f195.google.com with SMTP id t24so4848713oij.13
        for <linux-media@vger.kernel.org>; Fri, 30 Aug 2019 02:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=opPJo7Zv4ht/hnWpVSpz0d5Vp3/hOswmpsE3zretzJE=;
        b=EoqZX1Vsy9Szxp+b2Sg//tUs6kcL4ZoTGUwdLa+NeVeQfQf7IVynklZrNliG7NbW3c
         BqTTvlkqs6KgPDc2/MsnL7jzP3HCSBgEPj3iAcwf3MaoLg8C9MgHhZhnJloMTNHx7gHf
         ehsnc475CaxsOCW2n9iAALHDplUCtX23vexks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=opPJo7Zv4ht/hnWpVSpz0d5Vp3/hOswmpsE3zretzJE=;
        b=tNmsn1QxI/jF3IK/ZEJxEbHllUkgQv0XJwideySSFHle4bWcuujNNqxsielJGwb6jh
         5sWuaAZmaAhunvKI6WTZ04AXCIqXQ63Q/ICxjnwyNuTLFFbmYUyS2KIHZ3++vJ3/+B63
         VRegwgvQFngp736aQuxPP14ucaSzHuSGCrHRzXRJrJivdgIDoivqDWbBCQLcFtMPFFGO
         NxW/t/rVzyWLP9eULdkg0GOchMk0Vjq5uKPOZPs7XtLArdPyL3pSiKKeor97nkTmcJvx
         ZcnhuU1l6kLmxfjU0QJ7WVND2s50D1w2SpVs2r2YeWu4CdlEWCQGCW4aS/vmlFc9PwBS
         E9MA==
X-Gm-Message-State: APjAAAXkQV8Xm3rS7EqoWCaA7lEcZgstXhyuthlZwouJZZK8pbOpnQrh
        nzn5Abysb5WDTHoXQ2njsZKRGaySrtU=
X-Google-Smtp-Source: APXvYqzh+pIAh606p4We5wkbUEPYg9Q25VWQKHQzIGJTmWsMdAsHt48VBexstn3i1b1/FoDc+Bhthw==
X-Received: by 2002:aca:6707:: with SMTP id z7mr1272204oix.155.1567158531079;
        Fri, 30 Aug 2019 02:48:51 -0700 (PDT)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com. [209.85.210.45])
        by smtp.gmail.com with ESMTPSA id 63sm1827389otr.75.2019.08.30.02.48.49
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2019 02:48:50 -0700 (PDT)
Received: by mail-ot1-f45.google.com with SMTP id o101so6330957ota.8
        for <linux-media@vger.kernel.org>; Fri, 30 Aug 2019 02:48:49 -0700 (PDT)
X-Received: by 2002:a9d:4817:: with SMTP id c23mr10736054otf.97.1567158529318;
 Fri, 30 Aug 2019 02:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190822194500.2071-1-jernej.skrabec@siol.net>
 <20190822194500.2071-3-jernej.skrabec@siol.net> <CAPBb6MUChtZcNSTa2uT50k6uPU9T68wofLYGUFRJntDhjH8+iw@mail.gmail.com>
 <907f3c43-b994-f1c7-a15b-116566e19003@xs4all.nl>
In-Reply-To: <907f3c43-b994-f1c7-a15b-116566e19003@xs4all.nl>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Fri, 30 Aug 2019 18:48:36 +0900
X-Gmail-Original-Message-ID: <CAPBb6MV979V4BpOyYRGr4oAJOeqSmn-w1V3TRRhWePtqpzzWeQ@mail.gmail.com>
Message-ID: <CAPBb6MV979V4BpOyYRGr4oAJOeqSmn-w1V3TRRhWePtqpzzWeQ@mail.gmail.com>
Subject: Re: [PATCH 2/8] videodev2.h: add V4L2_DEC_CMD_FLUSH
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Jernej Skrabec <jernej.skrabec@siol.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        mripard@kernel.org, Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>, Chen-Yu Tsai <wens@csie.org>,
        gregkh@linuxfoundation.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, devel@driverdev.osuosl.org,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        Ezequiel Garcia <ezequiel@collabora.com>, jonas@kwiboo.se
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 30, 2019 at 6:45 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 8/30/19 11:38 AM, Alexandre Courbot wrote:
> > On Fri, Aug 23, 2019 at 4:45 AM Jernej Skrabec <jernej.skrabec@siol.net> wrote:
> >>
> >> From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >>
> >> Add this new V4L2_DEC_CMD_FLUSH decoder command and document it.
> >>
> >> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> >> ---
> >>  Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst | 11 ++++++++++-
> >>  Documentation/media/videodev2.h.rst.exceptions      |  1 +
> >>  include/uapi/linux/videodev2.h                      |  1 +
> >>  3 files changed, 12 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst b/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
> >> index 57f0066f4cff..0bffef6058f7 100644
> >> --- a/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
> >> +++ b/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
> >> @@ -208,7 +208,16 @@ introduced in Linux 3.3. They are, however, mandatory for stateful mem2mem decod
> >>         been started yet, the driver will return an ``EPERM`` error code. When
> >>         the decoder is already running, this command does nothing. No
> >>         flags are defined for this command.
> >> -
> >> +    * - ``V4L2_DEC_CMD_FLUSH``
> >> +      - 4
> >> +      - Flush any held capture buffers. Only valid for stateless decoders,
> >> +        and only if ``V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF`` was set.
> >> +       This command is typically used when the application reached the
> >> +       end of the stream and the last output buffer had the
> >> +       ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag set. This would prevent
> >> +       dequeueing the last capture buffer containing the last decoded frame.
> >> +       So this command can be used to explicitly flush that last decoded
> >> +       frame.
> >
> > Just for safety, can we also specify that it is valid to call this
> > command even if no buffer was held (in which case it is a no-op), as
> > this can help make user-space code simpler?
>
> Ah yes, thanks for the reminder.
>
> Jernej, when you post the next version of this series, can you change the text
> above to:
>
> - Flush any held capture buffers. Only valid for stateless decoders.
>   This command is typically used when the application reached the
>   end of the stream and the last output buffer had the
>   ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag set. This would prevent
>   dequeueing the capture buffer containing the last decoded frame.
>   So this command can be used to explicitly flush that final decoded
>   frame. This command does nothing if there are no held capture buffers.

With the above,

Reviewed-by: Alexandre Courbot <acourbot@chromium.org>

Thanks!

>
> Regards,
>
>         Hans
>
> >
> >>
> >>  Return Value
> >>  ============
> >> diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
> >> index adeb6b7a15cb..a79028e4d929 100644
> >> --- a/Documentation/media/videodev2.h.rst.exceptions
> >> +++ b/Documentation/media/videodev2.h.rst.exceptions
> >> @@ -434,6 +434,7 @@ replace define V4L2_DEC_CMD_START decoder-cmds
> >>  replace define V4L2_DEC_CMD_STOP decoder-cmds
> >>  replace define V4L2_DEC_CMD_PAUSE decoder-cmds
> >>  replace define V4L2_DEC_CMD_RESUME decoder-cmds
> >> +replace define V4L2_DEC_CMD_FLUSH decoder-cmds
> >>
> >>  replace define V4L2_DEC_CMD_START_MUTE_AUDIO decoder-cmds
> >>  replace define V4L2_DEC_CMD_PAUSE_TO_BLACK decoder-cmds
> >> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> >> index 4fa9f543742d..91a79e16089c 100644
> >> --- a/include/uapi/linux/videodev2.h
> >> +++ b/include/uapi/linux/videodev2.h
> >> @@ -1978,6 +1978,7 @@ struct v4l2_encoder_cmd {
> >>  #define V4L2_DEC_CMD_STOP        (1)
> >>  #define V4L2_DEC_CMD_PAUSE       (2)
> >>  #define V4L2_DEC_CMD_RESUME      (3)
> >> +#define V4L2_DEC_CMD_FLUSH       (4)
> >>
> >>  /* Flags for V4L2_DEC_CMD_START */
> >>  #define V4L2_DEC_CMD_START_MUTE_AUDIO  (1 << 0)
> >> --
> >> 2.22.1
> >>
>
