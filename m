Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E21D59842
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 12:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbfF1KS3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 06:18:29 -0400
Received: from mx08-00252a01.pphosted.com ([91.207.212.211]:33328 "EHLO
        mx08-00252a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726502AbfF1KS2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 06:18:28 -0400
X-Greylist: delayed 476 seconds by postgrey-1.27 at vger.kernel.org; Fri, 28 Jun 2019 06:18:26 EDT
Received: from pps.filterd (m0102629.ppops.net [127.0.0.1])
        by mx08-00252a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x5SA7n81015956
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2019 11:10:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raspberrypi.org; h=mime-version :
 references : in-reply-to : from : date : message-id : subject : to : cc :
 content-type : content-transfer-encoding; s=pp;
 bh=TDIgDFZYckSDRxESTmMyi7W5fZyMRfxZe7Gx+vhjabg=;
 b=IQo53t+yjWUCv3doZWHJZCeK3izg0lwHGOlK8P33mQRL8s+q/ny/2UEh1D9woQw6Yvr5
 tt1SEfnhypFuAtrsMZ6lzb4xLHqHLJxl6kPh0PhHmJoRJ1MICezIQl6p7x4jSD8FIEH0
 KLYX+emoKcpJJB0uIVKzfUybu95zhnyWEuV2hpKjOkp5CTOnlv1Hyr/zaGuOzIwGjDsJ
 pW24zLIxamcqCgbQy92oE9AmQXIuv+bHxqc8VAHUfQHH6ysi61/fSvBpY48p7Oy0JdEK
 4SV7K+W/tJZDuwStTr+0Lc15t8NxPeohbW01fthgDwU0aUuM6zL1IfNEyPj+sOOH+t3R rw== 
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
        by mx08-00252a01.pphosted.com with ESMTP id 2t9exhk1ra-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2019 11:10:29 +0100
Received: by mail-pf1-f197.google.com with SMTP id q14so3608631pff.8
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2019 03:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TDIgDFZYckSDRxESTmMyi7W5fZyMRfxZe7Gx+vhjabg=;
        b=HudN4HAHZcs4n+TjXAVpvaFmaWUaeWvgdeEaD5uPP2pctk8+jyvr9RzUT29zh1gaXe
         UOF4fmSp795KpnHjMUQnzhG0Re2Ji1DcaVfWw2kYfnoEROQ0vzXytKKmaJOkGv8//6sX
         1MAyofMKiUctDEYamTmlO9kVUEkRf6BuB42bKrHxRm3m3GgN72NOusNMroRISHbl0ESQ
         UTa58slZscEURFsRjzYrzLtbr9CT6204iqCYyMuDGuFUtjSBMKKmpqn38ptKhm9r0nhw
         5p6j99Ta4NSMegugPG7vDfZQW4ZEfPkjioSg/l075jTUAuw8d242bXWK19HhlOwWeSmC
         MQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TDIgDFZYckSDRxESTmMyi7W5fZyMRfxZe7Gx+vhjabg=;
        b=lxu4qJ6mVPHJwRIjrqAUGA4EnkjMQ5keUndG6oM2cXaW+V6lCqGu1r31PPq3W/A3fB
         LkI7yHSJQHEH102aZlnOHfjIi4gqHVAFNOq1UDgSYwmEk6XCpjj7ZeuV8dmqllaJ/WK3
         UW0rWxgCNOKlXjRuP0XUkD2J9V55zjC3jPXtswKkblKfHN+58iw3Wemuw/oj/+E1f5Q+
         /cyKwLq8wqvIkTOKZzbBrsTDfH0zhB363SnihbvTBK/d0K6BNWBc91K78alIucU3gm5a
         sO3pdUU9HzIcjqOqiKoOWdonaR3sUOZX4ABXRyp8ZDI55yx1NiNSeZEJ6y63jqdEDvbZ
         WxPA==
X-Gm-Message-State: APjAAAUGdzn2xu4kPSDJ81IIE4wK/UgAzTamwymrbQSzW8Filra1ku/M
        LrVPiuy97jPJhxg/8E4GJJCWWdwr/9R11KEAj8tb4yDpNaTkP5Ma4KRowMY3svUvGs/qHyMxh8b
        kbmcZvWzEjwNnGY2B3C3p3YNnci35aG8wr+1bRw==
X-Received: by 2002:a17:90a:17c4:: with SMTP id q62mr12393437pja.104.1561716627073;
        Fri, 28 Jun 2019 03:10:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwEreDZiFkAwV+0cUZgFrczBqG3Z5CPzr28vUCwFKMAVXeCeEB1P8eVW2rvYmKKjCeaDkR2QMfiT3p9cEbAMu8=
X-Received: by 2002:a17:90a:17c4:: with SMTP id q62mr12393404pja.104.1561716626804;
 Fri, 28 Jun 2019 03:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
 <1561661788-22744-2-git-send-email-wahrenst@gmx.net> <5e20b1d04b3c2f64173631ec2f0261a8a9597f0c.camel@ndufresne.ca>
In-Reply-To: <5e20b1d04b3c2f64173631ec2f0261a8a9597f0c.camel@ndufresne.ca>
From:   Dave Stevenson <dave.stevenson@raspberrypi.org>
Date:   Fri, 28 Jun 2019 11:10:13 +0100
Message-ID: <CAAoAYcOvnF55U0kPMFE4cOd=nUqjoidirbGP6AWN=5Rqp0RhbQ@mail.gmail.com>
Subject: Re: [PATCH 01/31] staging: bcm2835-camera: Ensure H264 header bytes
 get a sensible timestamp
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Stefan Wahren <wahrenst@gmx.net>, Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" 
        <linux-rpi-kernel@lists.infradead.org>,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        LMML <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:5.22.84,1.0.8
 definitions=2019-06-28_04:2019-06-25,2019-06-28 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas

On Thu, 27 Jun 2019 at 20:55, Nicolas Dufresne <nicolas@ndufresne.ca> wrote=
:
>
> Hi Dave,
>
> Le jeudi 27 juin 2019 =C3=A0 20:55 +0200, Stefan Wahren a =C3=A9crit :
> > From: Dave Stevenson <dave.stevenson@raspberrypi.org>
> >
> > H264 header come from VC with 0 timestamps, which means they get a
> > strange timestamp when processed with VC/kernel start times,
> > particularly if used with the inline header option.
> > Remember the last frame timestamp and use that if set, or otherwise
> > use the kernel start time.
>
> Normally H264 headers are considered to be part of the following frame.
> Giving it the timestamp of the previous frame will likely confuse some
> userspace and cause an off-by-one in timestamp. I understand this is a
> workaround, but am wondering if this can be improved.

Sorry, slight ambiguity in how I'm reading your comment.

Are you saying that the header bytes want to be in the same buffer as
the following frame?
I thought this had also been discussed in the V4L2 stateful codec API
threads along with how many encoded frames were allowed in a single
V4L2 buffer. I certainly hadn't seen a statement about the header
bytes being combined with the next frame.
If the behaviour required by V4L2 is that header bytes and following
frame are in the same buffer, then that is relatively easy to achieve
in the firmware. This workaround can remain for older firmware as it
will never trigger if the firmware has combined the frames.


Or are you saying that the header bytes remain in their own buffer,
but the timestamp wants to be the same as the next frame? That is
harder to achieve in the firmware, but could probably be done in the
kernel driver by holding on to the header bytes frame until the next
buffer had been received, at which point the timestamp can be copied
across. Possible, but just needs slightly careful handling to ensure
we don't lose buffers accidentally.

  Dave

> >
> > Link: https://github.com/raspberrypi/linux/issues/1836
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
> > ---
> >  .../staging/vc04_services/bcm2835-camera/bcm2835-camera.c  | 14 ++++++=
++++++--
> >  .../staging/vc04_services/bcm2835-camera/bcm2835-camera.h  |  2 ++
> >  2 files changed, 14 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camer=
a.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> > index dce6e6d..0c04815 100644
> > --- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> > +++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> > @@ -359,7 +359,9 @@ static void buffer_cb(struct vchiq_mmal_instance *i=
nstance,
> >               }
> >       } else {
> >               if (dev->capture.frame_count) {
> > -                     if (dev->capture.vc_start_timestamp !=3D -1 && pt=
s) {
> > +                     if (dev->capture.vc_start_timestamp !=3D -1) {
> > +                             buf->vb.vb2_buf.timestamp =3D ktime_get_n=
s();
> > +                     } else if (pts) {
> >                               ktime_t timestamp;
> >                               s64 runtime_us =3D pts -
> >                                   dev->capture.vc_start_timestamp;
> > @@ -372,8 +374,15 @@ static void buffer_cb(struct vchiq_mmal_instance *=
instance,
> >                                        ktime_to_ns(timestamp));
> >                               buf->vb.vb2_buf.timestamp =3D ktime_to_ns=
(timestamp);
> >                       } else {
> > -                             buf->vb.vb2_buf.timestamp =3D ktime_get_n=
s();
> > +                             if (dev->capture.last_timestamp) {
> > +                                     buf->vb.vb2_buf.timestamp =3D
> > +                                             dev->capture.last_timesta=
mp;
> > +                             } else {
> > +                                     buf->vb.vb2_buf.timestamp =3D
> > +                                             ktime_to_ns(dev->capture.=
kernel_start_ts);
> > +                             }
> >                       }
> > +                     dev->capture.last_timestamp =3D buf->vb.vb2_buf.t=
imestamp;
> >
> >                       vb2_set_plane_payload(&buf->vb.vb2_buf, 0, length=
);
> >                       vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_D=
ONE);
> > @@ -541,6 +550,7 @@ static int start_streaming(struct vb2_queue *vq, un=
signed int count)
> >                        dev->capture.vc_start_timestamp, parameter_size)=
;
> >
> >       dev->capture.kernel_start_ts =3D ktime_get();
> > +     dev->capture.last_timestamp =3D 0;
> >
> >       /* enable the camera port */
> >       dev->capture.port->cb_ctx =3D dev;
> > diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camer=
a.h b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h
> > index 2b5679e..09273b0 100644
> > --- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h
> > +++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h
> > @@ -90,6 +90,8 @@ struct bm2835_mmal_dev {
> >               s64         vc_start_timestamp;
> >               /* Kernel start timestamp for streaming */
> >               ktime_t kernel_start_ts;
> > +             /* Timestamp of last frame */
> > +             u64             last_timestamp;
> >
> >               struct vchiq_mmal_port  *port; /* port being used for cap=
ture */
> >               /* camera port being used for capture */
> > --
> > 2.7.4
> >
