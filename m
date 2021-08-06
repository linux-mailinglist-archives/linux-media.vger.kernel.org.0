Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB4853E263F
	for <lists+linux-media@lfdr.de>; Fri,  6 Aug 2021 10:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240121AbhHFIiu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Aug 2021 04:38:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230402AbhHFIit (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Aug 2021 04:38:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC0EBC061798
        for <linux-media@vger.kernel.org>; Fri,  6 Aug 2021 01:38:33 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D3A5E4FB;
        Fri,  6 Aug 2021 10:38:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1628239110;
        bh=t+UDtKq/TQvlwHut6McQ1TN7Uzv2chKDeSWbkvt9Veg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=exQ/j00brSt4ktR9pnWS7Iwfft4yT1m8dNKSkv2fQTHMKaXsXm2R5hxQzdyC6ji76
         ZNHAZpW8OPCW/MJu1J/ovQ3HNS3QN77ije5P3QT+pHKGJa5tnipN4YyT+zo3XzYdi0
         JqGxK6fJzNJoV9ibrs5e4B8vNaRj88kj6LKzp2oQ=
Date:   Fri, 6 Aug 2021 11:38:16 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     David Plowman <david.plowman@raspberrypi.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v3 1/2] media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAIN_XXX
 controls
Message-ID: <YQz0+AE29wW6phox@pendragon.ideasonboard.com>
References: <20210722121249.16483-1-david.plowman@raspberrypi.com>
 <20210722121249.16483-2-david.plowman@raspberrypi.com>
 <YQwCOBCFK9w4dvxl@pendragon.ideasonboard.com>
 <20210805154042.GE3@valkosipuli.retiisi.eu>
 <YQwIjW1BannEjBWg@pendragon.ideasonboard.com>
 <20210805180503.GF3@valkosipuli.retiisi.eu>
 <CAHW6GYJpV0gyNVLFoFbmxRQfhzTaK2DFA7R5ah-+W3U8XpkK7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHW6GYJpV0gyNVLFoFbmxRQfhzTaK2DFA7R5ah-+W3U8XpkK7A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi David,

On Fri, Aug 06, 2021 at 09:15:09AM +0100, David Plowman wrote:
> Hi Sakari, Laurent
> 
> Thanks for the various comments and discussion. It did prompt me to
> have some second thoughts about some of the details here, as follows.
> 
> These controls are aimed specifically at sensors that do some kind of
> on-board "demosaic / remosaic" process, for instance to produce
> standard Bayer patterns from non-standard ones. As such the principal
> requirement is for the sensor to know what "grey" looks like, which we
> tell it by sending it the red and blue gains from the white balance
> algorithm. (This obviously enables it to reduce colour aliasing during
> the processing that it does.)
> 
> So perhaps the comparison here should be with the existing
> V4L2_CID_RED/BLUE_BALANCE controls. I'm not sure that it really
> matters exactly what the colours of the pixels on the sensor really
> are, it's knowing what "grey" looks like that is important. Any new
> controls could be quite cumbersome to use if you have to figure out
> what the underlying pixel arrangement looks like, it certainly feels
> much easier to refer simply to red/blue pixels, leaving the driver to
> deal with its own internal idiosyncrasies.
> 
> Having said that, the particular sensor I have exposes a gain for each
> of the four Bayer channels, even though I find myself ignoring the
> green ones!!
> 
> Anyway, I certainly feel I could go either way on this one - do you
> have any more thoughts on the matter?

With an array control, we would have to decide (and document) which
components are stored in the array, and in which order. For Bayer
sensors, that would be B, Gb, Gr and R. As for the order, there are
three options:

- fixed order (e.g. always B, Gb, Gr, R)
- matching the sensor's CFA native order (always the same for a given
  sensor, but varying between different sensors)
- matching the currently configured format (the bayer pattern can change
  when moving the crop rectangle by one pixels or when mirroring the
  sensor readout)

The last two options seem quite impractical to me. The first option, if
we only consider Bayer sensors, is equivalent to the four controls your
propose in the sense that the semantics is defined in the control
specification and identical for all sensors, but with the advantage of
bundling all four values together. It will also allow expanding this to
other patterns if the need arise, which I think would be useful.

If we were to redesign the red/blue gains, I'd go for a single array
control today, with one value per CFA component.

> On Thu, 5 Aug 2021 at 19:05, Sakari Ailus wrote:
> > On Thu, Aug 05, 2021 at 06:49:33PM +0300, Laurent Pinchart wrote:
> > > On Thu, Aug 05, 2021 at 06:40:42PM +0300, Sakari Ailus wrote:
> > > > On Thu, Aug 05, 2021 at 06:22:32PM +0300, Laurent Pinchart wrote:
> > > > > On Thu, Jul 22, 2021 at 01:12:48PM +0100, David Plowman wrote:
> > > > > > We add new controls, one for each of the four usual Bayer channels:
> > > > > >
> > > > > > V4L2_CID_NOTIFY_GAIN_RED
> > > > > > V4L2_CID_NOTIFY_GAIN_GREENR
> > > > > > V4L2_CID_NOTIFY_GAIN_BLUE
> > > > > > V4L2_CID_NOTIFY_GAIN_GREENB
> > > > >
> > > > > This will effectively limit the API to Bayer patterns. I wonder if we
> > > > > should instead implement it as a single array control, with one element
> > > > > per CFA component.
> > > >
> > > > There are other raw patterns, too. Supporting them would likely require one
> > > > or a few more controls.
> > > >
> > > > That said, as the values change often it's more efficient to use a single
> > > > control. But each colour combination (not each pattern) would require its
> > > > own control in this case, eventually requiring more controls.
> > >
> > > I'm not sure to follow you. My idea is to define a single control, with
> > > a number of elements that depends on the pattern being used, and the
> > > order specified in the native sensor pattern. I don't think each colour
> > > combination would then require its own control.
> >
> > Ah, I guess that would work, too. Then we'll need to define what kind of
> > pixel orders are supported for that single control (and for which formats).

-- 
Regards,

Laurent Pinchart
