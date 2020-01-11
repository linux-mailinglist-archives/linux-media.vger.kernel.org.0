Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16E91137B73
	for <lists+linux-media@lfdr.de>; Sat, 11 Jan 2020 05:59:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728351AbgAKE7c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jan 2020 23:59:32 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60316 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728328AbgAKE7c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jan 2020 23:59:32 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 4A413292E31
Message-ID: <cd6b893998514bbd8307af39239e802cdb81967e.camel@collabora.com>
Subject: Re: [PATCH] media: hantro: Support H264 profile control
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hirokazu Honda <hiroh@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devel@driverdev.osuosl.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Sat, 11 Jan 2020 01:59:20 -0300
In-Reply-To: <c88b2822-0dd2-8ea3-eb0b-262df5a30830@xs4all.nl>
References: <20191122051608.128717-1-hiroh@chromium.org>
         <767528be59275265072896e5c679e97575615fdd.camel@ndufresne.ca>
         <CAAFQd5D3OpAAtX7_0ktz4-aAgWN_G4YBQMR=Vwp7JPopjvRkRA@mail.gmail.com>
         <f5341ed837529bd38d466d4b655e261d64065912.camel@ndufresne.ca>
         <CAAFQd5Cpk8qG+VgE6+aznBmXu11YG0gNQyCRanZghds-TPKvyg@mail.gmail.com>
         <c88b2822-0dd2-8ea3-eb0b-262df5a30830@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hirokazu, Hans,

On Fri, 2020-01-10 at 13:31 +0100, Hans Verkuil wrote:
> On 11/29/19 1:16 AM, Tomasz Figa wrote:
> > On Sat, Nov 23, 2019 at 1:52 AM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
> > > Le samedi 23 novembre 2019 à 01:00 +0900, Tomasz Figa a écrit :
> > > > On Sat, Nov 23, 2019 at 12:09 AM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
> > > > > Le vendredi 22 novembre 2019 à 14:16 +0900, Hirokazu Honda a écrit :
> > > > > > The Hantro G1 decoder supports H.264 profiles from Baseline to High, with
> > > > > > the exception of the Extended profile.
> > > > > > 
> > > > > > Expose the V4L2_CID_MPEG_VIDEO_H264_PROFILE control, so that the
> > > > > > applications can query the driver for the list of supported profiles.
> > > > > 
> > > > > Thanks for this patch. Do you think we could also add the LEVEL control
> > > > > so the profile/level enumeration becomes complete ?
> > > > > 
> > > > > I'm thinking it would be nice if the v4l2 compliance test make sure
> > > > > that codecs do implement these controls (both stateful and stateless),
> > > > > it's essential for stack with software fallback, or multiple capable
> > > > > codec hardware but with different capabilities.
> > > > > 
> > > > 
> > > > Level is a difficult story, because it also specifies the number of
> > > > macroblocks per second, but for decoders like this the number of
> > > > macroblocks per second it can handle depends on things the driver
> > > > might be not aware of - clock frequencies, DDR throughput, system
> > > > load, etc.
> > > > 
> > > > My take on this is that the decoder driver should advertise the
> > > > highest resolution the decoder can handle due to hardware constraints.
> > > > Performance related things depend on the integration details and
> > > > should be managed elsewhere. For example Android and Chrome OS manage
> > > > expected decoding performance in per-board configuration files.
> > > 
> > > When you read datasheet, the HW is always rated to maximum level (and
> > > it's a range) with the assumption of a single stream. It seems much
> > > easier to expose this as-is, statically then to start doing some math
> > > with data that isn't fully exposed to the user. This is about filtering
> > > of multiple CODEC instances, it does not need to be rocket science,
> > > specially that the amount of missing data is important (e.g. usage of
> > > tiles, compression, IPP all have an impact on the final performance).
> > > All we want to know in userspace is if this HW is even possibly capable
> > > of LEVEL X, and if not, we'll look for another one.
> > > 
> > 
> > Agreed, one could potentially define it this way, but would it be
> > really useful for the userspace and the users? I guess it could enable
> > slightly faster fallback to software decoding in the extreme case of
> > the hardware not supporting the level at all, but I suspect that the
> > majority of cases would be the hardware just being unusably slow.
> > 
> > Also, as I mentioned before, we already return the range of supported
> > resolutions, which in practice should map to the part of the level
> > that may depend on hardware capabilities rather than performance, so
> > exposing levels as well would add redundancy to the information
> > exposed.
> 
> There is a lot of discussion here, but it all revolves around a potential
> LEVEL control.
> 
> So I gather everyone is OK with merging this patch?
> 

I'm fine with this.

[..]
> > > > > > diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> > > > > > index 6d9d41170832..9387619235d8 100644
> > > > > > --- a/drivers/staging/media/hantro/hantro_drv.c
> > > > > > +++ b/drivers/staging/media/hantro/hantro_drv.c
> > > > > > @@ -355,6 +355,16 @@ static const struct hantro_ctrl controls[] = {
> > > > > >                       .def = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
> > > > > >                       .max = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
> > > > > >               },
> > > > > > +     }, {
> > > > > > +             .codec = HANTRO_H264_DECODER,
> > > > > > +             .cfg = {
> > > > > > +                     .id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
> > > > > > +                     .min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,

I'd like to see the .def here ^^^ for consistency
with the other controls.

But I know this is my OCD speaking, so it's fine
as-is as well.

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

> > > > > > +                     .max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> > > > > > +                     .menu_skip_mask =
> > > > > > +                     BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
> > > > > > +                     .def = V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,

Thanks,
Eze


