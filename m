Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 547C319BD9
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 12:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727542AbfEJKtQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 May 2019 06:49:16 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:59643 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727251AbfEJKtQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 May 2019 06:49:16 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.89)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hP35W-0003Mk-U4; Fri, 10 May 2019 12:49:14 +0200
Message-ID: <1557485354.7859.5.camel@pengutronix.de>
Subject: Re: [PATCH v5 4/5] [media] allegro: add Allegro DVT video IP core
 driver
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Michael Tretter <m.tretter@pengutronix.de>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     dshah@xilinx.com, mchehab@kernel.org, robh+dt@kernel.org,
        kernel@pengutronix.de, tfiga@chromium.org
Date:   Fri, 10 May 2019 12:49:14 +0200
In-Reply-To: <0d15e216-7e10-eb55-1957-32be1c48f461@xs4all.nl>
References: <20190503122010.16663-1-m.tretter@pengutronix.de>
         <20190503122010.16663-5-m.tretter@pengutronix.de>
         <0d15e216-7e10-eb55-1957-32be1c48f461@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2019-05-10 at 10:28 +0200, Hans Verkuil wrote:
[...]
> > +static int allegro_g_selection(struct file *file, void *priv,
> > +			       struct v4l2_selection *s)
> > +{
> > +	struct v4l2_fh *fh = file->private_data;
> > +	struct allegro_channel *channel = fh_to_channel(fh);
> > +
> > +	if (!V4L2_TYPE_IS_OUTPUT(s->type))
> > +		return -EINVAL;
> > +
> > +	switch (s->target) {
> > +	case V4L2_SEL_TGT_CROP:
> > +	case V4L2_SEL_TGT_CROP_DEFAULT:
> > +	case V4L2_SEL_TGT_CROP_BOUNDS:
> > +		s->r.left = 0;
> > +		s->r.top = 0;
> > +		s->r.width = channel->width;
> > +		s->r.height = channel->height;
> 
> I don't think this is quite right. The CROP target should return the visible
> width/height (e.g. 1920x1080) whereas the other two targets should return the
> coded width/height (e.g. 1920x1088 when rounded to the macroblock alignment).

The stateful encoder spec says about CROP_DEFAULT and CROP_BOUNDS:

    V4L2_SEL_TGT_CROP_BOUNDS

         equal to the full source frame, matching the active OUTPUT
         format

    V4L2_SEL_TGT_CROP_DEFAULT

        equal to V4L2_SEL_TGT_CROP_BOUNDS

There is no mention that the "full source frame" must be equal to the
coded size. Enforcing this would unnecesarily limit the ability to
import DMA-Buffers from other sources.

Imagine for example 1080p capture and encoding - if the source provides
unpadded 1920x1080 buffers (with the required stride), importing them
into an encoder that enforces height to be a multiple ot 16 wouldn't
work, even though the hardware may be capable of only reading 1080 lines
from the source frame.

> Note: if the hardware doesn't require that the raw frame is macroblock aligned,
> then I need to think a bit more about how the selection handling should be
> done.

regards
Philipp
