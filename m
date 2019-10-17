Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 851FCDB0B7
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 17:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405291AbfJQPHN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 11:07:13 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:37376 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389795AbfJQPHM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 11:07:12 -0400
Received: by mail-ed1-f66.google.com with SMTP id r4so2017902edy.4
        for <linux-media@vger.kernel.org>; Thu, 17 Oct 2019 08:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=op76gnLFzYL0lfQFlC3qOADyB2guwVZxhXHWMZFfDag=;
        b=fiY0kKd+jSKzY69vLXNWF9aiEhgGti3vKkXcBBNX4A4TtHGV+NYChKIBGMfK34xtYr
         cN33H1sJwsvsY1en7opJfumchBWsmId/UK37rOQk2bhi22dIXH6XkVrJmZ8EJBLvgiq5
         TlpplXl4DmaS2myq81ewGWhri9iU9xEGeMYD2LGirInmXs/9g211hOVNmNArOxOwWTLR
         sqtbxBrEHof6gPAH8HTvFxCxCji8zPUuCJ8Q0tMcvYaouv0JeGDNLg67qGijOkWhEfC4
         08aHJcnt7LV62BBoua4R25yav9i2LqrR3p0d2gWt3wOF8tPPiEAvMcv4r7COw/AJyxnF
         Tc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=op76gnLFzYL0lfQFlC3qOADyB2guwVZxhXHWMZFfDag=;
        b=COeY6s8hqVQpFqWzSbROiINzyXk8y72nbqIYaWhUPAOSI5lc+p1nLZesKgfSoUfiq8
         w1ilf3TgR4kbLkyPtQf3i1HMkHzpRyrzoqLBnZ/ycRbv7A2d5EbKMbN5E0DD0aHps9R9
         2dExAiXhrFxgagZ0FGUFQkMOGT+v4Ggnx/NzYNDufAc9Pqg/F5F7tysCKNyX5cwV3msi
         LPsgfdYCmju+kbsww8P3MZuxyLhDlBrxOaM44DSQXkUnFH0SnsRtY3zJhYrHel9i75x8
         fCaiN0ENdQjao3tqPYNqGwkX2qadC2jQc9XoMC5uXRvI4di8Bk8MJc1Kj4a0b5fiAQsR
         PR8Q==
X-Gm-Message-State: APjAAAXNF1glGOhR9/cgggONzOQNP9R0oz59VDCNLOyO9Qsp0Fk2/08K
        61AsVU2BsQtSm0MORgYzCGISUyzxX6hXbCtuWIRtMA==
X-Google-Smtp-Source: APXvYqwl6Fx7Ev+y6/eX3M9AxLjt+Ps8POn4p0F3M8HHwcWpxcWkV9a7uhu92LyQLfyUiV8k2I6C/OmgoGxGuGL978Q=
X-Received: by 2002:aa7:c38f:: with SMTP id k15mr4452620edq.100.1571324829879;
 Thu, 17 Oct 2019 08:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <20191003101038.13732-1-stanimir.varbanov@linaro.org> <50eb3902-fe10-5952-8bdf-9b6b9ac37c62@linaro.org>
In-Reply-To: <50eb3902-fe10-5952-8bdf-9b6b9ac37c62@linaro.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 17 Oct 2019 17:08:29 +0200
Message-ID: <CAMZdPi8D8WQJJ5U15_4A4HgXjJNUR2BOGZJUc85wgX+=QsTZ0w@mail.gmail.com>
Subject: Re: [PATCH v4] venus: venc: Fix enum frameintervals
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stanimir,

On Thu, 3 Oct 2019 at 12:15, Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> I have tested this on db410c with following gst pipeline:
>
> gst-launch-1.0 -v videotestsrc !
> video/x-raw,format=NV12,width=1280,height=960,framerate=24/1 !
> v4l2h264enc
> extra-controls="controls,h264_profile=4,h264_level="5",video_bitrate=10000000;"
> ! filesink location=gstenc.h264
>
> Loic, could you give it a try on db820c too?
>
> Here is the info on the bug which I try to fix with current patch:
>
> https://bugs.96boards.org/show_bug.cgi?id=513
>
> On 10/3/19 1:10 PM, Stanimir Varbanov wrote:
> > This fixes an issue when setting the encoder framerate because of
> > missing precision. Now the frameinterval type is changed to
> > TYPE_CONTINUOUS and step = 1. Also the math is changed when
> > framerate property is called - the firmware side expects the
> > framerate in Q16 values.
> >
> > Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> > ---
> >
> > Changes since v3:
> > Keep min/max numerator one, and divide frate(max/min) to frame
> > factor (returned framerate max/min capabilities are in range
> > 1 to 120fps but in Q16 i.e. 65536 to 7864320).
> >
> >  drivers/media/platform/qcom/venus/venc.c | 17 ++++++++++++-----
> >  1 file changed, 12 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> > index 1b7fb2d5887c..133ff7eceb83 100644
> > --- a/drivers/media/platform/qcom/venus/venc.c
> > +++ b/drivers/media/platform/qcom/venus/venc.c
> > @@ -22,6 +22,7 @@
> >  #include "venc.h"
> >
> >  #define NUM_B_FRAMES_MAX     4
> > +#define FRAMERATE_FACTOR     BIT(16)
> >
> >  /*
> >   * Three resons to keep MPLANE formats (despite that the number of planes
> > @@ -576,7 +577,7 @@ static int venc_enum_frameintervals(struct file *file, void *fh,
> >       struct venus_inst *inst = to_inst(file);
> >       const struct venus_format *fmt;
> >
> > -     fival->type = V4L2_FRMIVAL_TYPE_STEPWISE;
> > +     fival->type = V4L2_FRMIVAL_TYPE_CONTINUOUS;
> >
> >       fmt = find_format(inst, fival->pixel_format,
> >                         V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> > @@ -600,11 +601,11 @@ static int venc_enum_frameintervals(struct file *file, void *fh,
> >               return -EINVAL;
> >
> >       fival->stepwise.min.numerator = 1;
> > -     fival->stepwise.min.denominator = frate_max(inst);
> > +     fival->stepwise.min.denominator = frate_max(inst) / FRAMERATE_FACTOR;

On 820c frate_max() returns 120 set denominator to 0, and causes
gstreamer failure.

Regards,
Loic
