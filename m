Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C187324E41
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2019 13:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbfEULpA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 May 2019 07:45:00 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:47033 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726740AbfEULpA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 May 2019 07:45:00 -0400
Received: from aptenodytes (aaubervilliers-681-1-80-185.w90-88.abo.wanadoo.fr [90.88.22.185])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 7470810000C;
        Tue, 21 May 2019 11:44:51 +0000 (UTC)
Message-ID: <dee0307b4cce84f1e35b5c6da7a8b2dbbac22bbc.camel@bootlin.com>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Date:   Tue, 21 May 2019 13:44:50 +0200
In-Reply-To: <CAAFQd5AoNvVbx+PMQM9jOA-q4NEqe-PEm66DtxSd-9B8G=-9Ow@mail.gmail.com>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
         <3e0d6d5106e9c0c27ef4b11e64a488726ff77103.camel@ndufresne.ca>
         <39ded6d4ddf85849bf45abc94dc8e104fd4c0978.camel@bootlin.com>
         <CAAFQd5AoNvVbx+PMQM9jOA-q4NEqe-PEm66DtxSd-9B8G=-9Ow@mail.gmail.com>
Organization: Bootlin
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Tue, 2019-05-21 at 19:27 +0900, Tomasz Figa wrote:
> On Thu, May 16, 2019 at 2:43 AM Paul Kocialkowski
> <paul.kocialkowski@bootlin.com> wrote:
> > Hi,
> > 
> > Le mercredi 15 mai 2019 à 10:42 -0400, Nicolas Dufresne a écrit :
> > > Le mercredi 15 mai 2019 à 12:09 +0200, Paul Kocialkowski a écrit :
> > > > Hi,
> > > > 
> > > > With the Rockchip stateless VPU driver in the works, we now have a
> > > > better idea of what the situation is like on platforms other than
> > > > Allwinner. This email shares my conclusions about the situation and how
> > > > we should update the MPEG-2, H.264 and H.265 controls accordingly.
> > > > 
> > > > - Per-slice decoding
> > > > 
> > > > We've discussed this one already[0] and Hans has submitted a patch[1]
> > > > to implement the required core bits. When we agree it looks good, we
> > > > should lift the restriction that all slices must be concatenated and
> > > > have them submitted as individual requests.
> > > > 
> > > > One question is what to do about other controls. I feel like it would
> > > > make sense to always pass all the required controls for decoding the
> > > > slice, including the ones that don't change across slices. But there
> > > > may be no particular advantage to this and only downsides. Not doing it
> > > > and relying on the "control cache" can work, but we need to specify
> > > > that only a single stream can be decoded per opened instance of the
> > > > v4l2 device. This is the assumption we're going with for handling
> > > > multi-slice anyway, so it shouldn't be an issue.
> > > 
> > > My opinion on this is that the m2m instance is a state, and the driver
> > > should be responsible of doing time-division multiplexing across
> > > multiple m2m instance jobs. Doing the time-division multiplexing in
> > > userspace would require some sort of daemon to work properly across
> > > processes. I also think the kernel is better place for doing resource
> > > access scheduling in general.
> > 
> > I agree with that yes. We always have a single m2m context and specific
> > controls per opened device so keeping cached values works out well.
> > 
> > So maybe we shall explicitly require that the request with the first
> > slice for a frame also contains the per-frame controls.
> > 
> 
> Agreed.
> 
> One more argument not to allow such multiplexing is that despite the
> API being called "stateless", there is actually some state saved
> between frames, e.g. the Rockchip decoder writes some intermediate
> data to some local buffers which need to be given to the decoder to
> decode the next frame. Actually, on Rockchip there is even a
> requirement to keep the reference list entries in the same order
> between frames.

Well, what I'm suggesting is to have one stream per m2m context, but it
should certainly be possible to have multiple m2m contexts (multiple
userspace open calls) that decode different streams concurrently.

Is that really going to be a problem for Rockchip? If so, then the
driver should probably enforce allowing a single userspace open and m2m
context at a time.

Cheers,

Paul

-- 
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

