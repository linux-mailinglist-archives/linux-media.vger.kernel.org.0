Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52A91AD8F9
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 14:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbfIIM15 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 08:27:57 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:51089 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbfIIM15 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Sep 2019 08:27:57 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1i7Ilv-0005Hj-JO; Mon, 09 Sep 2019 14:27:55 +0200
Message-ID: <1568032074.2956.5.camel@pengutronix.de>
Subject: Re: [PATCH] media: uapi: h264: clarify
 num_ref_idx_l[01]_(default_)active fields
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        kernel@pengutronix.de
Date:   Mon, 09 Sep 2019 14:27:54 +0200
In-Reply-To: <4fd58acf-4553-aff2-85ab-3bd2b1851090@xs4all.nl>
References: <20190905114210.9232-1-p.zabel@pengutronix.de>
         <4fd58acf-4553-aff2-85ab-3bd2b1851090@xs4all.nl>
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

On Mon, 2019-09-09 at 14:09 +0200, Hans Verkuil wrote:
> On 9/5/19 1:42 PM, Philipp Zabel wrote:
> > To explain why num_ref_idx_active_override_flag is not part of the API,
> > describe how the num_ref_idx_l[01]_active_minus1 fields and the
> > num_ref_idx_l[01]_default_active_minus1 fields are used, depending on
> > whether the decoder parses slice headers itself or not.
> > 
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> >  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > index bc5dd8e76567..b9834625a939 100644
> > --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > @@ -1630,10 +1630,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >        -
> >      * - __u8
> >        - ``num_ref_idx_l0_default_active_minus1``
> > -      -
> > +      - This field is only used by decoders that parse slices themselves.
> 
> How do you know that the decoder does this?

We don't, so usespace has to provide it unconditionally.

This was meant as an explanation why. As you can see from the "media:
hantro: h264: per-slice num_ref_idx_l[01]_active override" thread I
found this a bit unintuitive.

> >      * - __u8
> >        - ``num_ref_idx_l1_default_active_minus1``
> > -      -
> > +      - This field is only used by decoders that parse slices themselves.
> >      * - __u8
> >        - ``weighted_bipred_idc``
> >        -
> > @@ -1820,10 +1820,14 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >        -
> >      * - __u8
> >        - ``num_ref_idx_l0_active_minus1``
> > -      -
> > +      - This field is used by decoders that do not parse slices themselves.
> > +        If num_ref_idx_active_override_flag is not set, this field must be
> > +        set to the value of num_ref_idx_l0_default_active_minus1.
> 
> I don't think you can know if the decoder parses the slices.

That is correct.

> Wouldn't it be better to just delete the 'This field is only used by decoders
> that parse slices themselves.' sentence? Drivers for HW that handle this can
> just ignore these fields.

If this has no place in the API documentation, or if it just might
confuse the user in a different way, it's indeed better drop these.
Is there another place where this could be clarified instead, perhaps
the kerneldoc comments?

Basically I was confused about why both the default and the override
have to be provided, and how the kernel driver determines which one to
choose, since the override flag is not part of the kernel API. As it
turns out, it doesn't have to choose; depending on whether the hardware
parses slices, the driver can pick either one or the other, and always
use that.

regards
Philipp
