Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F321BB96C
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 18:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388951AbfIWQTq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 12:19:46 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50128 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387827AbfIWQTq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 12:19:46 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82F6053B;
        Mon, 23 Sep 2019 18:19:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1569255584;
        bh=wKjA/ed7Y+JVWrIgtRhilG+Jz5zhV9d6koPu4w6901g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XBOurYsOoScvXCDo6j6K5mwW802Tdyjwe6RtIlJj9xYe8gByC42gdgTVLL7MRrTeT
         AMKKKbdnjR2BcjJz/SFNCLEZBQHCmPtlPRyDpK+ypklKPCYVnvHB9carv1Gx97L05S
         ZjBtM/nwbnl3bDWAuTzuqgIrNkO9z5kwYJmi7j1M=
Date:   Mon, 23 Sep 2019 19:19:34 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Daniel Gomez <daniel@qtec.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Helen Koike <helen.koike@collabora.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>
Subject: Re: [ANN] Media sessions in Lyon in October: codecs
Message-ID: <20190923161934.GF5056@pendragon.ideasonboard.com>
References: <b3b2c3a6-43d6-ffbd-f94c-e6f92cad8a97@xs4all.nl>
 <20190923150213.2ub26ys4mhpp2hm5@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190923150213.2ub26ys4mhpp2hm5@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

(CC'ing Maxime)

On Mon, Sep 23, 2019 at 05:02:13PM +0200, Jacopo Mondi wrote:
> On Mon, Sep 23, 2019 at 04:12:55PM +0200, Hans Verkuil wrote:
> > Hi all,
> >
> > Since we have three separate half-day sessions for different topics I decided
> > to split the announcement for this in three emails as well, so these things
> > can be discussed in separate threads.
> >
> > All sessions are in room Terreaux VIP Lounge - Level 0.
> > There is a maximum of 15 people.
> >
> > The first session deals with the codec API and is on Tuesday morning from
> > 8:30 (tentative, might change) to 12:00 (we have to vacate the room at that
> > time).
> >
> > Confirmed attendees for this session:
> >
> > Boris Brezillon <boris.brezillon@collabora.com>
> > Alexandre Courbot <acourbot@chromium.org>
> > Nicolas Dufresne <nicolas@ndufresne.ca>
> > Tomasz Figa <tfiga@chromium.org>
> > Ezequiel Garcia <ezequiel@collabora.com>
> > Daniel Gomez <daniel@qtec.com>
> > Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > Eugen Hristev <Eugen.Hristev@microchip.com>
> > Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > Helen Koike <helen.koike@collabora.com>
> > Michael Tretter <m.tretter@pengutronix.de>
> > Hans Verkuil <hverkuil@xs4all.nl>
> >
> > Tentative:
> >
> > Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Jacopo Mondi <jacopo@jmondi.org>
> >
> > Jacopo, please confirm if you want to attend this session. I didn't find
> > an email with explicit confirmation, so it was probably done via irc. But since
> > this session is getting close to capacity I would prefer to keep attendance to
> > those are actually working with codecs (or will work with it in the near future).
> 
> I'm not really working on codecs, so if you're running almost at full
> capacity please feel free to re-assign my seat.

Same here. I think that Maxime Ripard, who isn't in the above list,
would be able to contribute more than I could.

> If there are free seats I might flock in, but without contributing too
> much to the discussions :)
> 
> > If I missed someone, or you are on the list but won't attend after all, then
> > please let me know.
> >
> >
> >
> > Agenda:
> >
> > - Status of any pending patches related to codec support.
> >
> > - Requirements of moving codec drivers out of staging.
> >
> > - Finalize the stateful encoder API. There are two pieces that need
> >   to be defined:
> >
> > 1) Setting the frame rate so bitrate control can make sense, since
> >    they need to know this information. This is also relevant for the
> >    stateless codec (and this may have to change on a per-frame basis
> >    for stateless codecs!).
> >
> >    This can either be implemented via ENUM_FRAMEINTERVALS for the coded
> >    pixelformats and S_PARM support, or we just add a new control for this.
> >    E.g. V4L2_CID_MPEG_VIDEO_FRAME_INTERVAL (or perhaps FRAME_RATE). If we
> >    go for a control, then we need to consider the unit. We can use a
> >    fraction as well. See this series that puts in the foundation for that:
> >    https://patchwork.linuxtv.org/cover/58857/
> >
> >    I am inclined to go with a control, since the semantics don't really
> >    match ENUM_FRAMEINTERVALS/S_PARM. These ioctls still need to be supported
> >    for legacy drivers. Open question: some drivers (mediatek, hva, coda)
> >    require S_PARM(OUTPUT), some (venus) allow both S_PARM(CAPTURE) and
> >    S_PARM(OUTPUT). I am inclined to allow both since this is not a CAPTURE
> >    vs OUTPUT thing, it is global to both queues.
> >
> > 2) Interactions between OUTPUT and CAPTURE formats.
> >
> >    The main problem is what to do if the capture sizeimage is too small
> >    for the OUTPUT resolution when streaming starts.
> >
> >    Proposal: width and height of S_FMT(OUTPUT) are used to
> >    calculate a minimum sizeimage (app may request more). This is
> >    driver-specific. (Is it? Or is this codec-specific?)
> >
> >    V4L2_FMT_FLAG_FIXED_RESOLUTION is always set for codec formats
> >    for the encoder (i.e. we don't support mid-stream resolution
> >    changes for now) and V4L2_EVENT_SOURCE_CHANGE is not
> >    supported. See https://patchwork.linuxtv.org/patch/56478/ for
> >    the patch adding this flag.
> >
> >    Of course, if we start to support mid-stream resolution
> >    changes (or other changes that require a source change event),
> >    then this flag should be dropped by the encoder driver and
> >    documentation on how to handle the source change event should
> >    be documented in the encoder spec. I prefer to postpone this
> >    until we have an encoder than can actually do mid-stream
> >    resolution changes.
> >
> >    If sizeimage of the OUTPUT is too small for the CAPTURE
> >    resolution and V4L2_EVENT_SOURCE_CHANGE is not supported,
> >    then the second STREAMON (either CAPTURE or OUTPUT) will
> >    return -ENOMEM since there is not enough memory to do the
> >    encode.
> >
> >    If V4L2_FMT_FLAG_FIXED_RESOLUTION is set (i.e. that should
> >    be the case for all current encoders), then any bitrate controls
> >    will be limited in range to what the current state (CAPTURE and
> >    OUTPUT formats and frame rate) supports.
> >
> > - Stateless encoders?
> >
> > - Anything else? (I have a feeling I missed a codec-related topic, but
> >   I can't find it in my mailbox)

-- 
Regards,

Laurent Pinchart
