Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4CF405DC9
	for <lists+linux-media@lfdr.de>; Thu,  9 Sep 2021 21:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344990AbhIITzc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Sep 2021 15:55:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237617AbhIITzb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Sep 2021 15:55:31 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78690C061575
        for <linux-media@vger.kernel.org>; Thu,  9 Sep 2021 12:54:21 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id u17so3147254ilm.13
        for <linux-media@vger.kernel.org>; Thu, 09 Sep 2021 12:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=iShYJ32xDiHcWLhTqCfK1ZR1yO9OyaBO2PNbhBqcZuI=;
        b=N7LMKwrD3cNfSvYn8EIm4d5qB6L335/PfR90mOpYMcYrFTkTjOvgUlTh2va3EDJwdT
         Ix3JJLKXmHK/hsoQhUFlrjElUniI9op0HHuRYHKQeO84n3Dq4j/Hl/S7h7p06RH64cEC
         9NjeAD4Sz4tp/0lrZWY6acmbqUmFzA5kKc4gjgzvED2Qb3THD5tTW4MwoAkJGxKNcgeK
         KDsxHCkRmDiUzrInKnM0f+1QtX6G52kHP5EVKaciwAZk4ahcn6gIxpXBXUFYVbYpug9j
         XxhkDR27odsSKEyVmYQtka6tE8ModF/pCt96k3wtHJDe3yxaCetUp4FmfKYyvtISqkpt
         NaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=iShYJ32xDiHcWLhTqCfK1ZR1yO9OyaBO2PNbhBqcZuI=;
        b=PjGyl5DFwfvJoYuYiqK/o3I0WotVf7nLBSHh9B23pCeS3UPzIYNaHVJx65Ra5RPh72
         Bt3ZJRPYfdDzjlF5T9oL/3hNpkUh5Q/YP1Vx7JkXER4TM3L+ba4zKg5XkkKv/FF2ruSE
         zvXbZwyU/PmShyOZp/jxAJPNd2Lb6Mmi2JgDfo+jxBCKLnVJ54PL4H1i0FuuYXKzMc7/
         mj0q/MYJui+hkEmuQwMaR+nhXd4LsI/6h67uQeY9jshZ3DHt2kUwkFv7S/KKW5Nu4rk5
         2ZEfRRVRQO1iOM1FFJWdCYyhqBKpWwoiEPtjAtMd4JXZNUitMsqtyasz8Xe52svtuVxw
         ILeA==
X-Gm-Message-State: AOAM530c531CCKqOm/gy0Qb+QBy6GI3dZ8J+t55x0vh+EhxCrh/5EuKr
        h6LjN7USeclkiqxHjGTILgsbHA==
X-Google-Smtp-Source: ABdhPJwWTj/Ia+wX7Pghcp8pPPi9/rjwpGl2OLF79WALTgqqHh66LAtzAUief2+m8D+/vAqzNvLz9A==
X-Received: by 2002:a05:6e02:1b08:: with SMTP id i8mr3580902ilv.161.1631217260825;
        Thu, 09 Sep 2021 12:54:20 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (mtl.collabora.ca. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id a16sm1399414ili.64.2021.09.09.12.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 12:54:20 -0700 (PDT)
Message-ID: <8984f8a3c0dfd3a5f83fb5cc7b0357dca4787274.camel@ndufresne.ca>
Subject: Re: [EXT] Re: [PATCH v8 04/15] media:Add v4l2 event codec_error and
 skip
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ming Qian <ming.qian@nxp.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Cc:     "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Date:   Thu, 09 Sep 2021 15:54:18 -0400
In-Reply-To: <AM6PR04MB634124118288EC775F05AFC3E7D59@AM6PR04MB6341.eurprd04.prod.outlook.com>
References: <cover.1631002447.git.ming.qian@nxp.com>
         <647f84c1e7c2a48d6492d38fa4f06586235500b8.1631002447.git.ming.qian@nxp.com>
         <fffd24d3374ecb2fbfafa9b85fa0ef8012fc7efa.camel@ndufresne.ca>
         <AM6PR04MB634124118288EC775F05AFC3E7D59@AM6PR04MB6341.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 09 septembre 2021 à 03:13 +0000, Ming Qian a écrit :
> > -----Original Message-----
> > From: Nicolas Dufresne [mailto:nicolas@ndufresne.ca]
> > Sent: Wednesday, September 8, 2021 9:33 PM
> > To: Ming Qian <ming.qian@nxp.com>; mchehab@kernel.org;
> > shawnguo@kernel.org; robh+dt@kernel.org; s.hauer@pengutronix.de
> > Cc: hverkuil-cisco@xs4all.nl; kernel@pengutronix.de; festevam@gmail.com;
> > dl-linux-imx <linux-imx@nxp.com>; Aisheng Dong <aisheng.dong@nxp.com>;
> > linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> > Subject: [EXT] Re: [PATCH v8 04/15] media:Add v4l2 event codec_error and
> > skip
> > 
> > Caution: EXT Email
> > 
> > Hi Ming,
> > 
> > more API only review.
> > 
> > Le mardi 07 septembre 2021 à 17:49 +0800, Ming Qian a écrit :
> > > The codec_error event can tell client that there are some error occurs
> > > in the decoder engine.
> > > 
> > > The skip event can tell the client that there are a frame has been
> > > decoded, but it won't be outputed.
> > > 
> > > Signed-off-by: Ming Qian <ming.qian@nxp.com>
> > > Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
> > > Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
> > > ---
> > >  .../userspace-api/media/v4l/vidioc-dqevent.rst       | 12 ++++++++++++
> > >  include/uapi/linux/videodev2.h                       |  2 ++
> > >  2 files changed, 14 insertions(+)
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
> > > b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
> > > index 6eb40073c906..87d40ad25604 100644
> > > --- a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
> > > +++ b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
> > > @@ -182,6 +182,18 @@ call.
> > >       the regions changes. This event has a struct
> > >       :c:type:`v4l2_event_motion_det`
> > >       associated with it.
> > > +    * - ``V4L2_EVENT_CODEC_ERROR``
> > > +      - 7
> > > +      - This event is triggered when some error occurs inside the codec
> > engine,
> > > +     usually it can be replaced by a POLLERR event, but in some cases,
> > > the
> > POLLERR
> > > +     may cause the application to exit, but this event can allow the
> > application to
> > > +     handle the codec error without exiting.
> > 
> > Events are sent to userspace in a separate queue from the VB2 queue. Which
> > means it's impossible for userspace to know where this error actually took
> > place.
> > Userspace may endup discarding valid frames from the VB queue, as it does
> > not know which one are good, and which one are bad.
> > 
> > There is likely a bit of spec work to be done here for non-fatal decode
> > errors,
> > but I think the right approach is to use V4L2_BUF_FLAG_ERROR. What we
> > expect from decoders is that for each frame, a CAPTURE buffer is assigned.
> > If
> > decoding that frame was not possible but the error is recoverable (corrupted
> > bitstream, missing reference, etc.), then the failing frame get marked with
> > FLAG_ERROR and decoding continues as usual.
> > 
> > What isn't documented is that you can set bytesused to 0, meaning there is
> > nothing useful in that frame, or a valid bytesused when you know only some
> > blocks are broken (e.g. missing 1 ref). Though, GStreamer might be the only
> > implementation of that, and byteused 0 may confuse some existing userspace.
> > 
> 
> Hi Nicolas,
>     We don't use this event to tell userspace which frame is broken. Actually
> it tries to tell userspace that 
> the decoder is abnormal and there will be no more frames output. The usersapce
> shouldn't wait, it can reset the decoder instance if it wants to continue
> decoding more frames, or it can exit directly.
>     Usually there will no capture buffer can be dequeued, so we can't set a
> V4L2_BUF_FLAG_ERROR flag to a capture buffer.

That is not logical, if userspace asked to decode a buffer, but didn't queue
back any CAPTURE buffer, you are expected to just sit there and wait.

>     In my opinion, setting bytesused to 0 means eos, and as you say, it may
> confuse some existing userspace.

Byteused 0 only mean EOS for one specific driver, MFC. That behaviour was kept
to avoid breaking existing userspace. In fact, you have to opt in, the framework
will prevent you from using it for that purpose.

>     I think it can be replaced by POLLERR in most of case, but we meet some
> applications who prefer to use this event instead of pollerr

In general, recoverable errors should be handled without the need for userspace
to reset. This looks more like you have a bug in your error handling and deffer
it to userspace. Most userspace will just abort and report to users, I doubt
this is really what you expect.

What matters for recoverable errors is that you keep consuming OUTPUT buffers.
And userspace should be happy with never getting anything from the CAPTURE till
the propblem was recovered by the driver. Of course, userspace should probably
garbage collect the metadata it might be holding, chromium does that with a
leaky queue of 16 metadata buffer notably

My recommandation would be to drop this for now, and just try to not stall on
errors (or make it a hard failure for now, pollerr, or ioctl errors).

> 
> 
> > > +    * - ``V4L2_EVENT_SKIP``
> > > +      - 8
> > > +      - This event is triggered when one frame is decoded, but it won't
> > > be
> > outputed
> > > +     to the display. So the application can't get this frame, and the
> > > input
> > frame count
> > > +     is dismatch with the output frame count. And this evevt is telling
> > > the
> > client to
> > > +     handle this case.
> > 
> > Similar to my previous comment, this event is flawed, since userspace cannot
> > know were the skip is located in the queued buffers. Currently, all decoders
> > are
> > mandated to support V4L2_BUF_FLAG_TIMESTAMP_COPY. The timestamp
> > must NOT be interpreted by the driver and must be reproduce as-is in the
> > associated CAPTURE buffer. It is possible to "garbage" collect skipped
> > frames
> > with this method, though tedious.
> > 
> > An alternative, and I think it would be much nicer then this, would be to
> > use
> > the v4l2_buffer.sequence counter, and just make it skip 1 on skips. Though,
> > the
> > down side is that userspace must also know how to reorder frames (a driver
> > job for stateless codecs) in order to identify which frame was skipped. So
> > this
> > is perhaps not that useful, other then knowing something was skipped in the
> > past.
> > 
> > A third option would be to introduce V4L2_BUF_FLAG_SKIPPED. This way the
> > driver could return an empty payload (bytesused = 0) buffer with this flag
> > set,
> > and the proper timestamp properly copied. This would let the driver
> > communicate skipped frames in real-time. Note that this could break with
> > existing userspace, so it would need to be opted-in somehow (a control or
> > some flags).
> 
> Hi Nicolas,
>    The problem we meet is that userspace doesn't care which frame is skipped,
> it just need to know that there are a frame is skipped, the driver should
> promise the input frame count is equals to the output frame count.
>     Your first method is possible in theory, but we find the timestamp may be
> unreliable, we meet many timestamp issues that userspace may enqueue invalid
> timestamp or repeated timestamp and so on, so we can't accept this solution.

The driver should not interpret the provided timestamp, so it should not be able
to say if the timestamp is valid or not, this is not the driver's task.

The driver task is to match the timestamp to the CAPTURE buffer (if that buffer
was produced), and reproduce it exactly.

>     I think your second option is better. And there are only 1 question, we
> find some application prefer to use the V4L2_EVENT_EOS to check the eos, not
> checking the empty buffer, if we use this method to check skipped frame, the

Checking the empty buffer is a legacy method, only available in Samsung MFC
driver. The spec says that the last buffer should be flagged with _LAST, and any
further attempt to poll should unblock and DQBUF return EPIPE.

> application should check empty buffer instead of V4L2_EVENT_EOS, otherwise if
> the last frame is skipped, the application will miss it. Of course this is not
> a problem, it just increases the complexity of the userspace implementation

The EPIPE mechanism covers this issue, which we initially had with the LAST
flag.

>     I don't think your third method is feasible, the reasons are as below
> 		1. usually the empty payload means eos, and as you say, it
> may introduce confusion.
>     	2. The driver may not have the opportunity to return an empty payload
> during decoding, in our driver, driver will pass the capture buffer to
> firmware, and when some frame is skipped, the firmware won't return the
> buffer, driver may not find an available capture buffer to return to
> userspace.
> 
>    The requirement is that userspace need to match the input frame count and
> output frame count. It doesn't care which frame is skipped, so the
> V4L2_EVENT_SKIP is the easiest way for driver and userspace.
>    If you think this event is really inappropriate, I prefer to adopt your
> second option

Please, drop SKIP from you driver and this patchset and fix your draining
process handling to follow the spec. The Samsung OMX component is irrelevant to
mainline submission, the OMX code should be updated to follow the spec.

> 
> > 
> > >      * - ``V4L2_EVENT_PRIVATE_START``
> > >        - 0x08000000
> > >        - Base event number for driver-private events.
> > > diff --git a/include/uapi/linux/videodev2.h
> > > b/include/uapi/linux/videodev2.h index 5bb0682b4a23..c56640d42dc5
> > > 100644
> > > --- a/include/uapi/linux/videodev2.h
> > > +++ b/include/uapi/linux/videodev2.h
> > > @@ -2369,6 +2369,8 @@ struct v4l2_streamparm {
> > >  #define V4L2_EVENT_FRAME_SYNC                        4
> > >  #define V4L2_EVENT_SOURCE_CHANGE             5
> > >  #define V4L2_EVENT_MOTION_DET                        6
> > > +#define V4L2_EVENT_CODEC_ERROR                       7
> > > +#define V4L2_EVENT_SKIP                              8
> > >  #define V4L2_EVENT_PRIVATE_START             0x08000000
> > > 
> > >  /* Payload for V4L2_EVENT_VSYNC */
> > 
> 


