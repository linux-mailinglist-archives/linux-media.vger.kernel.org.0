Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE3C41CDB27
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 15:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729676AbgEKN1F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 09:27:05 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50970 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727019AbgEKN1F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 09:27:05 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 848842A13D9
Message-ID: <cc259e64e01b0700d63b955ad0ab6933b3f71447.camel@collabora.com>
Subject: Re: [PATCH v3 3/3] media: rkvdec: Add the VP9 backend
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Gustavo Padovan <gustavo.padovan@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Date:   Mon, 11 May 2020 10:26:53 -0300
In-Reply-To: <CAAFQd5C3MpWqRRMGQJTW8rNz65T2CRYj6yFa56mJWR+DFqrFzg@mail.gmail.com>
References: <20200505134110.3435-1-ezequiel@collabora.com>
         <20200505134110.3435-4-ezequiel@collabora.com>
         <8e8eda07-e5f5-86dc-899b-0823ea0479f2@xs4all.nl>
         <b2160325f5b9bae5b437a37069db926d2a464e8d.camel@collabora.com>
         <CAAFQd5C3MpWqRRMGQJTW8rNz65T2CRYj6yFa56mJWR+DFqrFzg@mail.gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2020-05-08 at 18:56 +0200, Tomasz Figa wrote:
> On Fri, May 8, 2020 at 6:26 PM Ezequiel Garcia <ezequiel@collabora.com> wrote:
> > On Fri, 2020-05-08 at 12:34 +0200, Hans Verkuil wrote:
> > > On 05/05/2020 15:41, Ezequiel Garcia wrote:
> > > > From: Boris Brezillon <boris.brezillon@collabora.com>
> > > > 
> > > > The Rockchip VDEC supports VP9 profile 0 up to 4096x2304@30fps. Add
> > > > a backend for this new format.
> > > > 
> > > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > > ---
> > > >  drivers/staging/media/rkvdec/Makefile     |    2 +-
> > > >  drivers/staging/media/rkvdec/rkvdec-vp9.c | 1577 +++++++++++++++++++++
> > > >  drivers/staging/media/rkvdec/rkvdec.c     |   56 +-
> > > >  drivers/staging/media/rkvdec/rkvdec.h     |    6 +
> > > >  4 files changed, 1637 insertions(+), 4 deletions(-)
> > > >  create mode 100644 drivers/staging/media/rkvdec/rkvdec-vp9.c
> > > > 
> > > > diff --git a/drivers/staging/media/rkvdec/Makefile b/drivers/staging/media/rkvdec/Makefile
> > > > index c08fed0a39f9..cb86b429cfaa 100644
> > > > --- a/drivers/staging/media/rkvdec/Makefile
> > > > +++ b/drivers/staging/media/rkvdec/Makefile
> > > > @@ -1,3 +1,3 @@
> > > >  obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC) += rockchip-vdec.o
> > > > 
> > > > -rockchip-vdec-y += rkvdec.o rkvdec-h264.o
> > > > +rockchip-vdec-y += rkvdec.o rkvdec-h264.o rkvdec-vp9.o
> > > > diff --git a/drivers/staging/media/rkvdec/rkvdec-vp9.c b/drivers/staging/media/rkvdec/rkvdec-vp9.c
> > > > new file mode 100644
> > > > index 000000000000..37d0ea4e3570
> > > > --- /dev/null
> > > > +++ b/drivers/staging/media/rkvdec/rkvdec-vp9.c
> > > > @@ -0,0 +1,1577 @@
> > > 
> > > <snip>
> > > 
> > > > +static void init_inter_probs(struct rkvdec_ctx *ctx,
> > > > +                        const struct rkvdec_vp9_run *run)
> > > > +{
> > > > +   const struct v4l2_ctrl_vp9_frame_decode_params *dec_params;
> > > > +   struct rkvdec_vp9_ctx *vp9_ctx = ctx->priv;
> > > > +   struct rkvdec_vp9_priv_tbl *tbl = vp9_ctx->priv_tbl.cpu;
> > > > +   struct rkvdec_vp9_inter_frame_probs *rkprobs;
> > > > +   const struct v4l2_vp9_probabilities *probs;
> > > > +   unsigned int i, j, k;
> > > > +
> > > > +   rkprobs = &tbl->probs.inter;
> > > > +   dec_params = run->decode_params;
> > > > +   probs = &dec_params->probs;
> > > > +
> > > > +   /*
> > > > +    * inter probs
> > > > +    * 151 x 128 bits, aligned to 152 x 128 bits
> > > > +    * inter only
> > > > +    * intra_y_mode & inter_block info 6 x 128 bits
> > > > +    */
> > > > +
> > > > +   memcpy(rkprobs->y_mode, probs->y_mode, sizeof(rkprobs->y_mode));
> > > > +   memcpy(rkprobs->comp_mode, probs->comp_mode,
> > > > +          sizeof(rkprobs->comp_mode));
> > > > +   memcpy(rkprobs->comp_ref, probs->comp_ref,
> > > > +          sizeof(rkprobs->comp_ref));
> > > > +   memcpy(rkprobs->single_ref, probs->single_ref,
> > > > +          sizeof(rkprobs->single_ref));
> > > > +   memcpy(rkprobs->inter_mode, probs->inter_mode,
> > > > +          sizeof(rkprobs->inter_mode));
> > > > +   memcpy(rkprobs->interp_filter, probs->interp_filter,
> > > > +          sizeof(rkprobs->interp_filter));
> > > > +
> > > > +   /* 128 x 128 bits coeff related */
> > > > +   for (i = 0; i < ARRAY_SIZE(probs->coef); i++) {
> > > > +           for (j = 0; j < ARRAY_SIZE(probs->coef[0]); j++) {
> > > > +                   for (k = 0; k < ARRAY_SIZE(probs->coef[0][0]); k++)
> > > > +                           write_coeff_plane(probs->coef[i][j][k],
> > > > +                                             rkprobs->coef[k][i][j]);
> > > > +           }
> > > > +   }
> > > > +
> > > > +   /* intra uv mode 6 x 128 */
> > > > +   memcpy(rkprobs->uv_mode_0_2, &probs->uv_mode[0],
> > > > +          sizeof(rkprobs->uv_mode_0_2));
> > > > +   memcpy(rkprobs->uv_mode_3_5, &probs->uv_mode[3],
> > > > +          sizeof(rkprobs->uv_mode_3_5));
> > > > +   memcpy(rkprobs->uv_mode_6_8, &probs->uv_mode[6],
> > > > +          sizeof(rkprobs->uv_mode_6_8));
> > > > +   memcpy(rkprobs->uv_mode_9, &probs->uv_mode[9],
> > > > +          sizeof(rkprobs->uv_mode_9));
> > > > +
> > > > +   /* mv related 6 x 128 */
> > > > +   memcpy(rkprobs->mv.joint, probs->mv.joint,
> > > > +          sizeof(rkprobs->mv.joint));
> > > > +   memcpy(rkprobs->mv.sign, probs->mv.sign,
> > > > +          sizeof(rkprobs->mv.sign));
> > > > +   memcpy(rkprobs->mv.class, probs->mv.class,
> > > > +          sizeof(rkprobs->mv.class));
> > > > +   memcpy(rkprobs->mv.class0_bit, probs->mv.class0_bit,
> > > > +          sizeof(rkprobs->mv.class0_bit));
> > > > +   memcpy(rkprobs->mv.bits, probs->mv.bits,
> > > > +          sizeof(rkprobs->mv.bits));
> > > > +   memcpy(rkprobs->mv.class0_fr, probs->mv.class0_fr,
> > > > +          sizeof(rkprobs->mv.class0_fr));
> > > > +   memcpy(rkprobs->mv.fr, probs->mv.fr,
> > > > +          sizeof(rkprobs->mv.fr));
> > > > +   memcpy(rkprobs->mv.class0_hp, probs->mv.class0_hp,
> > > > +          sizeof(rkprobs->mv.class0_hp));
> > > > +   memcpy(rkprobs->mv.hp, probs->mv.hp,
> > > > +          sizeof(rkprobs->mv.hp));
> > > 
> > > Can't you just do: 'rkprobs->mv = probs->mv'?
> > > 
> > 
> > I think I'd like to keep this as-is.
> > 
> > Having the memcpy makes it explicit that we are copying
> > these structs around. While the assignment would
> > bring type checking, it can be misleading for readers.
> 
> On the other hand, it's not obvious from the code that all fields of
> the structure are copied. Perhaps memcpy(&rkprobs->mv, &probs->mv,
> sizeof(rkprobs->mv)) would be a good compromise?

Well, that would effectively (inadvertedly) tie probs:mv to rkprobs:mv,
so we might as well do something like:

(thanks Boris for the suggestion)

--- a/drivers/staging/media/rkvdec/rkvdec-vp9.c
+++ b/drivers/staging/media/rkvdec/rkvdec-vp9.c
@@ -48,17 +48,7 @@ struct rkvdec_vp9_inter_frame_probs {
        u8 uv_mode_9[9];
        u8 padding4[7];
        u8 padding5[16];
-       struct {
-               u8 joint[3];
-               u8 sign[2];
-               u8 class[2][10];
-               u8 class0_bit[2];
-               u8 bits[2][10];
-               u8 class0_fr[2][2][3];
-               u8 fr[2][3];
-               u8 class0_hp[2];
-               u8 hp[2];
-       } mv;
+       struct v4l2_vp9_mv_probabilities mv;
 };


However, I'm reluctant to consider any of these suggestions
because we are effectively matching a hardware descriptor
to a software interface, where the latter is unstable.

If we were to change the software interface at any point,
we'd break this driver.

The more I think about this, the more I think the drivers
needs to stay as-is.

Thanks,
Ezequiel

