Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D96F2AA0D0
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 13:04:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387964AbfIELEb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 07:04:31 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:49881 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731215AbfIELEa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 07:04:30 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1i5pYz-0000rP-Fv; Thu, 05 Sep 2019 13:04:29 +0200
Message-ID: <1567681468.3958.3.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] media: hantro: h264: per-slice
 num_ref_idx_l[01]_active override
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Sasha Hauer <kernel@pengutronix.de>
Date:   Thu, 05 Sep 2019 13:04:28 +0200
In-Reply-To: <CAHD77H=UEor0jv3-8E6QPumwdo7wWEUGtzqwfGrGE6ZndtCb7A@mail.gmail.com>
References: <20190905101533.525-1-p.zabel@pengutronix.de>
         <20190905101533.525-2-p.zabel@pengutronix.de>
         <CAHD77H=UEor0jv3-8E6QPumwdo7wWEUGtzqwfGrGE6ZndtCb7A@mail.gmail.com>
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

On Thu, 2019-09-05 at 19:34 +0900, Tomasz Figa wrote:
> On Thu, Sep 5, 2019 at 7:15 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
> > 
> > If the slice header had the num_ref_idx_active_override flag set, we
> > should use the num_ref_idx_l[01]_active_minus1 fields instead of the
> > defaults from the PPS.
> > 
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> >  drivers/staging/media/hantro/hantro_g1_h264_dec.c | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> > index 7ab534936843..544cf92ab62c 100644
> > --- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> > +++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> > @@ -28,6 +28,8 @@ static void set_params(struct hantro_ctx *ctx)
> >         const struct v4l2_ctrl_h264_pps *pps = ctrls->pps;
> >         struct vb2_v4l2_buffer *src_buf = hantro_get_src_buf(ctx);
> >         struct hantro_dev *vpu = ctx->dev;
> > +       unsigned char refidx0_active;
> > +       unsigned char refidx1_active;
> >         u32 reg;
> > 
> >         /* Decoder control register 0. */
> > @@ -101,9 +103,16 @@ static void set_params(struct hantro_ctx *ctx)
> >         vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL5);
> > 
> >         /* Decoder control register 6. */
> > +       if (sps->flags & V4L2_H264_SLICE_FLAG_NUM_REF_IDX_ACTIVE_OVERRIDE) {
> > +               refidx0_active = slices[0].num_ref_idx_l0_active_minus1 + 1;
> > +               refidx1_active = slices[0].num_ref_idx_l1_active_minus1 + 1;
> > +       } else {
> > +               refidx0_active = pps->num_ref_idx_l0_default_active_minus1 + 1;
> > +               refidx1_active = pps->num_ref_idx_l1_default_active_minus1 + 1;
> > +       }
> >         reg = G1_REG_DEC_CTRL6_PPS_ID(slices[0].pic_parameter_set_id) |
> > -             G1_REG_DEC_CTRL6_REFIDX0_ACTIVE(pps->num_ref_idx_l0_default_active_minus1 + 1) |
> > -             G1_REG_DEC_CTRL6_REFIDX1_ACTIVE(pps->num_ref_idx_l1_default_active_minus1 + 1) |
> > +             G1_REG_DEC_CTRL6_REFIDX0_ACTIVE(refidx0_active) |
> > +             G1_REG_DEC_CTRL6_REFIDX1_ACTIVE(refidx1_active) |
> >               G1_REG_DEC_CTRL6_POC_LENGTH(slices[0].pic_order_cnt_bit_size);
> >         vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL6);
> 
> My understanding was that Hantro G1 parses the slices itself and
> handles the override flag internally.

Oh, in that case this patch is incorrect and the first one is indeed
unnecessary.

regards
Philipp
