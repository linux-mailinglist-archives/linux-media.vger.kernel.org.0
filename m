Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D695DB4B1
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 19:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394803AbfJQRsw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 13:48:52 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:35996 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388397AbfJQRsw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 13:48:52 -0400
Received: by mail-ed1-f66.google.com with SMTP id h2so2475506edn.3
        for <linux-media@vger.kernel.org>; Thu, 17 Oct 2019 10:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qA1FV2SShAhO4HJceYdFIaShDaqJxU3NPe6CxCrjdF8=;
        b=UQ/oBkOnsR2jNdbXGCA50XjdanFuhsc3LYWAmRJ0vXylGXqCbprQm1HQoopcOesrt+
         u20gOR4oW4MP5pASmWG+/tmCL1uOYmX8C12T98KJ9mHpfNb7F3IfD+3jtuURhToRF/mg
         e6PYtwYwgajB3I7cAdIfAwFHmmU5CkD9/S+/Em9pHmd+6Nx+M931iZP+W3dzbDfmEky4
         gG9oyjey6fyHWO49qrppyisVLKNw0JC2AWC5Jzkhbda05zZCxjktk9K7wUT8e1uX9XPV
         FfM22vyXm1E3k0Ines2TDzNMDqYlpQFMzQ3iZGvbNmvlr0YrlKpSRJcGg1P7dLbv29Ga
         1Ttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qA1FV2SShAhO4HJceYdFIaShDaqJxU3NPe6CxCrjdF8=;
        b=mb3pa/JdmXtG6HRNgjK49SkzoVJyW0vksoV+JJD93MJQkQK6HrILYd6bW7lx1Qzs8T
         LO7TpDSTxS6LcpbQ68Z43tKYIxhTSoeE6kciUJ5yaZJomjlbZPT4nebd0mO8q3C2uut5
         8InBZGexwbcmlVqqvqf3G/R5je7dXpEVW+ejC5NpHmBef6v35Ix4+rjNyJH35K5dK1IQ
         0OCTW+XLZXsNBLABR8H1voPafG0Fbl03SemshGI+ctmzQFK2u7efOuHJz5ci0bge5y3m
         IfVcTMrtVXrKj08LtYmIMkHnj78l0n1SQHg7hSCF/e446h2HZjL6keNsJT0wFJtwMzYB
         kC1g==
X-Gm-Message-State: APjAAAWAAC0FKbEFUm4NM9HeXJUqrOS0DgN2DGPm7v9NGGtcjH3M2ZeD
        0/qJ2iTX5CCETStvClUpWnEfa7+wg18PPYoTQpepxQ==
X-Google-Smtp-Source: APXvYqyA6G2zo9+EZZoj+C27brXJJTiIYyFXiJVUXjePW5zIVv3zRSNwZkCKcJpEWybnxn4A4avLP84SvMdF7ZgmuMQ=
X-Received: by 2002:aa7:c603:: with SMTP id h3mr5173020edq.44.1571334530324;
 Thu, 17 Oct 2019 10:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191003101038.13732-1-stanimir.varbanov@linaro.org>
 <50eb3902-fe10-5952-8bdf-9b6b9ac37c62@linaro.org> <CAMZdPi8D8WQJJ5U15_4A4HgXjJNUR2BOGZJUc85wgX+=QsTZ0w@mail.gmail.com>
 <92e1234e-174a-3fa5-f77c-ae0072bd22c2@linaro.org>
In-Reply-To: <92e1234e-174a-3fa5-f77c-ae0072bd22c2@linaro.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 17 Oct 2019 19:50:08 +0200
Message-ID: <CAMZdPi-52+tpBZ8OzW0mA4844yLS-8O472izAmKXcZZ+jh+oqQ@mail.gmail.com>
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

On Thu, 17 Oct 2019 at 17:47, Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Hi Loic,
>
> On 10/17/19 6:08 PM, Loic Poulain wrote:
> > Hi Stanimir,
> >
> > On Thu, 3 Oct 2019 at 12:15, Stanimir Varbanov
> > <stanimir.varbanov@linaro.org> wrote:
> >>
> >> I have tested this on db410c with following gst pipeline:
> >>
> >> gst-launch-1.0 -v videotestsrc !
> >> video/x-raw,format=NV12,width=1280,height=960,framerate=24/1 !
> >> v4l2h264enc
> >> extra-controls="controls,h264_profile=4,h264_level="5",video_bitrate=10000000;"
> >> ! filesink location=gstenc.h264
> >>
> >> Loic, could you give it a try on db820c too?
> >>
> >> Here is the info on the bug which I try to fix with current patch:
> >>
> >> https://bugs.96boards.org/show_bug.cgi?id=513
> >>
> >> On 10/3/19 1:10 PM, Stanimir Varbanov wrote:
> >>> This fixes an issue when setting the encoder framerate because of
> >>> missing precision. Now the frameinterval type is changed to
> >>> TYPE_CONTINUOUS and step = 1. Also the math is changed when
> >>> framerate property is called - the firmware side expects the
> >>> framerate in Q16 values.
> >>>
> >>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> >>> ---
> >>>
> >>> Changes since v3:
> >>> Keep min/max numerator one, and divide frate(max/min) to frame
> >>> factor (returned framerate max/min capabilities are in range
> >>> 1 to 120fps but in Q16 i.e. 65536 to 7864320).
> >>>
> >>>  drivers/media/platform/qcom/venus/venc.c | 17 ++++++++++++-----
> >>>  1 file changed, 12 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> >>> index 1b7fb2d5887c..133ff7eceb83 100644
> >>> --- a/drivers/media/platform/qcom/venus/venc.c
> >>> +++ b/drivers/media/platform/qcom/venus/venc.c
> >>> @@ -22,6 +22,7 @@
> >>>  #include "venc.h"
> >>>
> >>>  #define NUM_B_FRAMES_MAX     4
> >>> +#define FRAMERATE_FACTOR     BIT(16)
> >>>
> >>>  /*
> >>>   * Three resons to keep MPLANE formats (despite that the number of planes
> >>> @@ -576,7 +577,7 @@ static int venc_enum_frameintervals(struct file *file, void *fh,
> >>>       struct venus_inst *inst = to_inst(file);
> >>>       const struct venus_format *fmt;
> >>>
> >>> -     fival->type = V4L2_FRMIVAL_TYPE_STEPWISE;
> >>> +     fival->type = V4L2_FRMIVAL_TYPE_CONTINUOUS;
> >>>
> >>>       fmt = find_format(inst, fival->pixel_format,
> >>>                         V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> >>> @@ -600,11 +601,11 @@ static int venc_enum_frameintervals(struct file *file, void *fh,
> >>>               return -EINVAL;
> >>>
> >>>       fival->stepwise.min.numerator = 1;
> >>> -     fival->stepwise.min.denominator = frate_max(inst);
> >>> +     fival->stepwise.min.denominator = frate_max(inst) / FRAMERATE_FACTOR;
> >
> > On 820c frate_max() returns 120 set denominator to 0, and causes
> > gstreamer failure.
>
> OK, thanks!
>
> We have two options
> - unify frate_min/max() to return in Q16 depending on the hfi version
> - or move frame_factor in frate_min/max() and return the framerate (1..120)

No strong preference...

Regards,
Loic
