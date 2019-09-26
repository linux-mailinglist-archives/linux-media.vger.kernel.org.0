Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10938BF4B0
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2019 16:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbfIZOJU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Sep 2019 10:09:20 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:37527 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbfIZOJT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Sep 2019 10:09:19 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iDUSM-0002LC-HE; Thu, 26 Sep 2019 16:09:18 +0200
Message-ID: <1569506956.3011.7.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] media: uapi: h264: clarify pic_order_cnt_bit_size
 field
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        kernel@pengutronix.de
Date:   Thu, 26 Sep 2019 16:09:16 +0200
In-Reply-To: <457642c2-7d77-5eab-4537-01151b474aa9@xs4all.nl>
References: <20190905131255.10150-1-p.zabel@pengutronix.de>
         <20190905131255.10150-2-p.zabel@pengutronix.de>
         <457642c2-7d77-5eab-4537-01151b474aa9@xs4all.nl>
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

Hi Hans,

On Thu, 2019-09-26 at 15:23 +0200, Hans Verkuil wrote:
> On 9/5/19 3:12 PM, Philipp Zabel wrote:
> > Since pic_order_cnt_bit_size is not a syntax element itself, explicitly
> > state that it is the total size in bits of the pic_order_cnt_lsb,
> > delta_pic_order_cnt_bottom, delta_pic_order_cnt[0], and
> > delta_pic_order_cnt[1] syntax elements contained in the slice.
> > 
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> >  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > index c281bc7ed1b3..08b49b2bbfa8 100644
> > --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > @@ -1799,7 +1799,8 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >        - Size in bits of the dec_ref_pic_marking() syntax element.
> >      * - __u32
> >        - ``pic_order_cnt_bit_size``
> > -      -
> > +      - Size in bits of the pic_order_cnt_lsb, delta_pic_order_cnt_bottom,
> > +        delta_pic_order_cnt[0], and delta_pic_order_cnt[1] syntax elements.
> 
> It's a little bit ambiguous: this field contains the size in bits of all these
> fields combined, right? Not the size in bits of each field separately.

Yes.

> I.e. if these fields are all 8 bits, then pic_order_cnt_bit_size is 4*8 and
> not just 8.

The size of pic_order_cnt_lsb is determined by another field's value
(log2_max_pic_order_cnt_lsb_minus4), and the other three are
exponential-Golomb coded, so each can be of different length (including
zero).

> I think this should be rephrased.

Ok, how about:

 "Combined size in bits of the picture order count related syntax
  elements: pic_order_cnt_lsb, delta_pic_order_cnt_bottom,
  delta_pic_order_cnt[0], and delta_pic_order_cnt[1]."

Actually, there's either pic_order_cnt_lsb + (optionally)
delta_pic_order_cnt_bottom present, or delta_pic_order_cnt[0] +
(optionally) delta_pic_order_cnt[1], never all four. Describing that in
the uapi docs seemed overly verbose, though. The relevant part in the
slice_header() syntax spec looks like this:

  if (pic_order_cnt_type == 0) {
    pic_order_cnt_lsb
    if (bottom_field_pic_order_in_frame_present_flag && !field_pic_flag)
      delta_pic_order_cnt_bottom
  }
  if (pic_order_cnt_type == 1 && !delta_pic_order_always_zero_flag) {
    delta_pic_order_cnt[0]
    if (bottom_field_pic_order_in_frame_present_flag && !field_pic_flag)
      delta_pic_order_cnt[1]
  }

pic_order_cnt_bit_size is supposed to be the size in bits of this whole
block. pic_order_cnt_type and log2_max_pic_order_cnt_lsb_minus4 are from
the SPS header, bottom_field_pic_order_in_frame_present_flag is from the
PPS header, and field_pic_flag is contained earlier in the slice header.

regards
Philipp
