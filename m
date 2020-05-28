Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC1521E5946
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2020 09:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgE1Hoc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 03:44:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbgE1Hob (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 03:44:31 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C2EDC05BD1E
        for <linux-media@vger.kernel.org>; Thu, 28 May 2020 00:44:31 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jeDDJ-0007wG-50; Thu, 28 May 2020 09:44:29 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jeDDI-00032P-D0; Thu, 28 May 2020 09:44:28 +0200
Date:   Thu, 28 May 2020 09:44:28 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCHv2 1/2] media: docs-rst: Document memory-to-memory video
 encoder interface
Message-ID: <20200528074428.GB19211@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <20200520100159.2094831-1-hverkuil-cisco@xs4all.nl>
 <20200520100159.2094831-2-hverkuil-cisco@xs4all.nl>
 <a14b50176ae678904f9dd39c1bb8edbc5801a030.camel@ndufresne.ca>
 <6caf4e56-2cb3-b193-3760-3a9b3c31bfb0@xs4all.nl>
 <CAAFQd5AveRXvi6GO42qeLXMRLAHiE43tiNvjCKNi2WTZHkVbzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAFQd5AveRXvi6GO42qeLXMRLAHiE43tiNvjCKNi2WTZHkVbzQ@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:40:31 up 98 days, 14:11, 107 users,  load average: 0.61, 0.27,
 0.19
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 26, 2020 at 06:01:35PM +0200, Tomasz Figa wrote:
> On Tue, May 26, 2020 at 10:32 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >
> > On 20/05/2020 22:32, Nicolas Dufresne wrote:
> > > Le mercredi 20 mai 2020 à 12:01 +0200, Hans Verkuil a écrit :
> > >> From: Tomasz Figa <tfiga@chromium.org>
> > >>
> > >> Due to complexity of the video encoding process, the V4L2 drivers of
> > >> stateful encoder hardware require specific sequences of V4L2 API calls
> > >> to be followed. These include capability enumeration, initialization,
> > >> encoding, encode parameters change, drain and reset.
> > >>
> > >> Specifics of the above have been discussed during Media Workshops at
> > >> LinuxCon Europe 2012 in Barcelona and then later Embedded Linux
> > >> Conference Europe 2014 in Düsseldorf. The de facto Codec API that
> > >> originated at those events was later implemented by the drivers we already
> > >> have merged in mainline, such as s5p-mfc or coda.
> > >>
> > >> The only thing missing was the real specification included as a part of
> > >> Linux Media documentation. Fix it now and document the encoder part of
> > >> the Codec API.
> > >>
> > >> Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> > >> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > >> ---
> > >>  .../userspace-api/media/v4l/dev-encoder.rst   | 727 ++++++++++++++++++
> > >>  .../userspace-api/media/v4l/dev-mem2mem.rst   |   1 +
> > >>  .../userspace-api/media/v4l/pixfmt-v4l2.rst   |   5 +
> > >>  .../userspace-api/media/v4l/v4l2.rst          |   2 +
> > >>  .../media/v4l/vidioc-encoder-cmd.rst          |  51 +-
> > >>  5 files changed, 766 insertions(+), 20 deletions(-)
> > >>  create mode 100644 Documentation/userspace-api/media/v4l/dev-encoder.rst
> > >>
> > >> diff --git a/Documentation/userspace-api/media/v4l/dev-encoder.rst b/Documentation/userspace-api/media/v4l/dev-encoder.rst
> >
> > <snip>
> >
> > >> +5. **Optional** Set the coded frame interval on the ``CAPTURE`` queue via
> > >> +   :c:func:`VIDIOC_S_PARM`. This is only necessary if the coded frame
> > >> +   interval is different from the raw frame interval, which is typically
> > >> +   the case for off-line encoding.
> > >> +
> > >> +   * ** Required fields:**
> > >> +
> > >> +     ``type``
> > >> +     a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> > >> +
> > >> +     ``parm.capture``
> > >> +     set all fields except ``parm.capture.timeperframe`` to 0.
> > >> +
> > >> +     ``parm.capture.timeperframe``
> > >> +     the desired coded frame interval; the encoder may adjust it to
> > >> +     match hardware requirements.
> > >> +
> > >> +   * **Return fields:**
> > >> +
> > >> +     ``parm.capture.timeperframe``
> > >> +     the adjusted frame interval.
> > >> +
> > >> +   .. important::
> > >> +
> > >> +      Changing the ``CAPTURE`` frame interval sets the framerate for the
> > >> +      coded video. It does *not* set the rate at which buffers arrive on the
> > >> +      ``CAPTURE`` queue, that depends on how fast the encoder is and how
> > >> +      fast raw frames are queued on the ``OUTPUT`` queue.
> > >> +
> > >> +   .. important::
> > >> +
> > >> +      ``timeperframe`` deals with *frames*, not fields. So for interlaced
> > >> +      formats this is the time per two fields, since a frame consists of
> > >> +      a top and a bottom field.
> > >> +
> > >> +   .. note::
> > >> +
> > >> +      Not all drivers support this functionality, in that case just set
> > >> +      the desired coded frame interval for the ``OUTPUT`` queue.
> > >
> > > There is a slight contorsion in the resulting user-space API. When I
> > > read this, the logical thing to do for live streams would be to just
> > > set the OUTPUT and the driver will take care of CAPTURE for me.
> > >
> > > While if I want to do offline, I don't know if this is supported or
> > > not. So the flow would be a bit special:
> > >
> > >   S_PARM(OUTPUT) with coded video frame rate
> > >   S_PARM(CAPTURE) width coded video
> > >   if ^ worked:
> > >      S_PARM(OUTPUT) with fastest rate possible
> > >
> > > Ideally I would have preferred if there was a more straight forward way
> > > to configure offline encoding for fastest performance with specific
> > > coded framerate. I don't think it's a blocker though, performance is
> > > not critical at all here. Maybe I'm missing something that allow to
> > > check if this is supported or not without trying it ?
> >
> > Good point. I considered adding a flag for the v4l2_fmtdesc struct that
> > reports whether you can set the capture framerate independently from the
> > OUTPUT framerate. Perhaps V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL?
> >
> > I actually think it would be best if that's added. It is not enough to
> > rely on whether S_PARM(CAPTURE) works to determine this feature since
> > at least one encoder drivers supports both OUTPUT and CAPTURE with S_PARM,
> > but CAPTURE does the same as OUTPUT, so that would be a red herring.
> >
> > I'll add this flag for v3.
> 
> Now if I think of it again, this behavior might be problematic for
> existing userspace, which I believe assumes encoding as fast as
> possible, because of how mem2mem devices were expected to behave.
> Could we define this to always default to as fast as possible?
> Otherwise we could end up regressing the encoding latency on latency
> sensitive applications, such as video conferencing.

I see your point regarding the latency, but I don't think that this justifies
"as fast as possible" as a default in the API. Adjusting the encoding speed
based on a user space hint is usually a trade-off that the driver must make.
If the trade-off results in a reduced latency, it is a regression in the
individual driver and the trade-offs must be discussed per driver.

> 
> For example, we could define the rates of both queues the other way
> around. The OUTPUT queue, which seems to be where the existing user
> space currently sets the desired stream frame rate, could be
> interpreted as the frame rate of the video to be encoded, while the
> CAPTURE queue would control the desired output rate of the encoded
> video, which would kind of match the V4L2 definition of CAPTURE frame
> interval.

Setting the desired stream frame rate on CAPTURE does not work with frame
reordering. In that case driver returns the CAPTURE buffers, whenever a coded
buffer is finished, and not necessarily at a certain frame rate. Strictly
following the V4L2 definition for CAPTURE frame interval, the driver would
need to produce repeated frames if the decode order differs from the display
order.

Setting the stream frame rate on the OUTPUT makes a lot of more sense to me,
because that is the rate at which we can feed buffers to the encoder. This
rate differs, if we use another V4L2 CAPTURE device as a live source or a file
as an offline source for the frames to be encoded, and determines the maximum
rate at which the encoder can produce CAPTURE buffers.

Michael
