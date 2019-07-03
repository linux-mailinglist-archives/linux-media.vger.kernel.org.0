Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2163F5E70D
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 16:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbfGCOqQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 10:46:16 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:37429 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbfGCOqQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 10:46:16 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1higWU-00058i-GC; Wed, 03 Jul 2019 16:46:14 +0200
Message-ID: <1562165172.4604.11.camel@pengutronix.de>
Subject: Re: [RFC] Stateful codecs and requirements for compressed formats
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Tomasz Figa <tfiga@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Date:   Wed, 03 Jul 2019 16:46:12 +0200
In-Reply-To: <CAAFQd5BqUS201QP4KHzmnKi5r+3P_KAa=L9CF3=zyQKypNyVuw@mail.gmail.com>
References: <530f28e9-f686-6222-c6cc-9a5207b151f7@xs4all.nl>
         <CAAFQd5BqUS201QP4KHzmnKi5r+3P_KAa=L9CF3=zyQKypNyVuw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2019-07-03 at 17:32 +0900, Tomasz Figa wrote:
> Hi Hans,
> 
> On Fri, Jun 28, 2019 at 11:34 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> > 
> > Hi all,
> > 
> > I hope I Cc-ed everyone with a stake in this issue.
> > 
> > One recurring question is how a stateful encoder fills buffers and how a stateful
> > decoder consumes buffers.
> > 
> > The most generic case is that an encoder produces a bitstream and just fills each
> > CAPTURE buffer to the brim before continuing with the next buffer.
> > 
> > I don't think there are drivers that do this, I believe that all drivers just
> > output a single compressed frame. For interlaced formats I understand it is either
> > one compressed field per buffer, or two compressed fields per buffer (this is
> > what I heard, I don't know if this is true).
> > 
> > In any case, I don't think this is specified anywhere. Please correct me if I am
> > wrong.
> > 
> > The latest stateful codec spec is here:
> > 
> > https://hverkuil.home.xs4all.nl/codec-api/uapi/v4l/dev-mem2mem.html
> > 
> > Assuming what I described above is indeed the case, then I think this should
> > be documented. I don't know enough if a flag is needed somewhere to describe
> > the behavior for interlaced formats, or can we leave this open and have userspace
> > detect this?
> > 
> 
> From Chromium perspective, we don't have any use case for encoding
> interlaced contents, so we'll be okay with whatever the interested
> parties decide on. :)
> 
> > 
> > For decoders it is more complicated. The stateful decoder spec is written with
> > the assumption that userspace can just fill each OUTPUT buffer to the brim with
> > the compressed bitstream. I.e., no need to split at frame or other boundaries.
> > 
> > See section 4.5.1.7 in the spec.
> > 
> > But I understand that various HW decoders *do* have limitations. I would really
> > like to know about those, since that needs to be exposed to userspace somehow.
> 
> AFAIK mtk-vcodec needs H.264 SPS and PPS to be split into their own
> separate buffers. I believe it also needs 1 buffer to contain exactly
> 1 frame and 1 frame to be fully contained inside 1 buffer.
> 
> Venus also needed 1 buffer to contain exactly 1 frame and 1 frame to
> be fully contained inside 1 buffer. It used to have some specific
> requirements regarding SPS and PPS too, but I think that was fixed in
> the firmware.
> 
> > 
> > Specifically, the venus decoder needs to know the resolution of the coded video
> > beforehand
> 
> I don't think that's true for venus. It does parsing and can detect
> the resolution.
> 
> However that's probably the case for coda...

Yes, it is currently true for the coda driver. But I believe it is not
actually necessary for coda hardware / firmware. I have already started
to split sequence initialization (where the firmare parses the bitstream
headers) from internal frame buffer allocation (which have to match
capture buffers in size), and I think it should be possible to
completely decouple the two and postpone buffer allocation far enough to
allow output stream start without prior knowledge of the resolution.

The decoder coda firmware fully parses the bitstream, but the driver has
to copy it from the external output buffers into an internal bitstream
ringbuffer anyway, and a few workarounds are necessary to make it always
succeed regardless of whether the first buffer presented to it only
contains headers, headers and a very small frame, or enough data to
completely fill the bitstream reader's prefetch buffer. For this the
driver has to parse the NAL start headers to a certain degree.

Due to this bitstream copy in the driver, in theory there are no limits
on how the input data is split into v4l2 buffers, but in practice only
single frame per v4l2 output buffer use cases are actually tested
regularly.

The encoder produces a single compressed frame per buffer. There is no
support for B frames in the firmware, as far as I can tell. There is no
driver support for interlaced formats currently, I'm not sure whether
the firmware supports interlacing.

regards
Philipp
