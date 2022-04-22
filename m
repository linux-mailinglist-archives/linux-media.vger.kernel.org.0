Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67E0050BB9E
	for <lists+linux-media@lfdr.de>; Fri, 22 Apr 2022 17:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1449401AbiDVP1D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Apr 2022 11:27:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1448956AbiDVP1C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Apr 2022 11:27:02 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D7ED56208;
        Fri, 22 Apr 2022 08:24:08 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nicolas)
        with ESMTPSA id EDB2E1F46A0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1650641046;
        bh=dK6R0SIkmSyoaIUyv1bXXxHpwHaAoY34kpWRaFZLAaE=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=Pxe+BcI8NNOOyGmM9P9TERcoCDXKC0v6xO9c0YcoRuwXezBSsG6kdCUa1DDfuEKHZ
         oDH/8RNAN/cs/hS3CLty3X4iXOc+j4IJHiykOgMjRWKv1Vtx0qn5dK2EPSiLadZ0Z4
         tyAcwFGNTn/vDqzQa8KBWrnz3u5VuGBpLy67DPJOJR6iRclZL0F2ZvFt5rQKBDHpjC
         R4q7BJ8YVuAU4mWWnYFs3XB0WRUnFvv6R13P83mNWUyUGLCfcG+M84nWPTTWUMFBB4
         EUeYFbGa0CGJvIr/ZqnVDXLBVCCh5zeWDBM0rIqB5M8hvP+dZr7oYylIwmYYen/foc
         ysKIw4AxEsARA==
Message-ID: <341b153e10a7a0d2257dda8c9b2ee6a5ebea5472.camel@collabora.com>
Subject: Re: [PATCH v3 05/24] media: h264: Use v4l2_h264_reference for
 reflist
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     kernel@collabora.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Date:   Fri, 22 Apr 2022 11:23:55 -0400
In-Reply-To: <89d26979-6ba1-ef12-d39d-f71d80051505@xs4all.nl>
References: <20220405204426.259074-1-nicolas.dufresne@collabora.com>
         <20220405204426.259074-6-nicolas.dufresne@collabora.com>
         <89d26979-6ba1-ef12-d39d-f71d80051505@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 22 avril 2022 =C3=A0 07:42 +0200, Hans Verkuil a =C3=A9crit=C2=
=A0:
> Hi Nicolas,
>=20
> On 05/04/2022 22:44, Nicolas Dufresne wrote:
> > In preparation for adding field decoding support, convert the byte arra=
ys
> > for reflist into array of struct v4l2_h264_reference. That struct will
> > allow us to mark which field of the reference picture is being referenc=
ed.
> >=20
> > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> > ---
> >  .../mediatek/vcodec/vdec/vdec_h264_req_if.c   | 17 +++-
>=20
> After applying this patch building the mediatek driver fails:
>=20
> drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c: In functi=
on =E2=80=98get_ref_list=E2=80=99:
> drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c:451:32: er=
ror: =E2=80=98struct v4l2_h264_reflist_builder=E2=80=99 has no member named=
 =E2=80=98index=E2=80=99
>   451 |                 ref_list[i] =3D b->index;
>       |                                ^~

Sorry about this, I normally try to enable all the drivers, but failed at i=
t,
and forgot about this. I'll fix and I will even test for regressions as I n=
ow
have some hardware.

> drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c: In functi=
on =E2=80=98get_vdec_decode_parameters=E2=80=99:
> drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c:485:54: er=
ror: passing argument 2 of =E2=80=98v4l2_h264_build_p_ref_list=E2=80=99 fro=
m incompatible pointer type [-Werror=3Dincompatible-pointer-types]
>   485 |         v4l2_h264_build_p_ref_list(&reflist_builder, p0_reflist);
>       |                                                      ^~~~~~~~~~
>       |                                                      |
>       |                                                      u8 * {aka un=
signed char *}
>=20
> (dropped a lot more errors)
>=20
> Ditto for drivers/media/platform/nvidia/tegra-vde/h264.c:
>=20
> drivers/media/platform/nvidia/tegra-vde/h264.c: In function =E2=80=98tegr=
a_vde_h264_setup_frames=E2=80=99:
> drivers/media/platform/nvidia/tegra-vde/h264.c:806:57: error: passing arg=
ument 2 of =E2=80=98v4l2_h264_build_b_ref_lists=E2=80=99 from incompatible =
pointer type [-Werror=3Dincompatible-pointer-types]
>   806 |                 v4l2_h264_build_b_ref_lists(&b, reflists.b0, refl=
ists.b1);
>       |                                                 ~~~~~~~~^~~
>       |                                                         |
>       |                                                         u8 * {aka=
 unsigned char *}
> In file included from drivers/media/platform/nvidia/tegra-vde/h264.c:14:
> ./include/media/v4l2-h264.h:66:57: note: expected =E2=80=98struct v4l2_h2=
64_reference *=E2=80=99 but argument is of type =E2=80=98u8 *=E2=80=99 {aka=
 =E2=80=98unsigned char *=E2=80=99}
>    66 |                             struct v4l2_h264_reference *b0_reflis=
t,
>       |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~=
~
> drivers/media/platform/nvidia/tegra-vde/h264.c:806:70: error: passing arg=
ument 3 of =E2=80=98v4l2_h264_build_b_ref_lists=E2=80=99 from incompatible =
pointer type [-Werror=3Dincompatible-pointer-types]
>   806 |                 v4l2_h264_build_b_ref_lists(&b, reflists.b0, refl=
ists.b1);
>       |                                                              ~~~~=
~~~~^~~
>       |                                                                  =
    |
>       |                                                                  =
    u8 * {aka unsigned char *}
> In file included from drivers/media/platform/nvidia/tegra-vde/h264.c:14:
> ./include/media/v4l2-h264.h:67:57: note: expected =E2=80=98struct v4l2_h2=
64_reference *=E2=80=99 but argument is of type =E2=80=98u8 *=E2=80=99 {aka=
 =E2=80=98unsigned char *=E2=80=99}
>    67 |                             struct v4l2_h264_reference *b1_reflis=
t);
>       |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~=
~
> drivers/media/platform/nvidia/tegra-vde/h264.c:809:56: error: passing arg=
ument 2 of =E2=80=98v4l2_h264_build_p_ref_list=E2=80=99 from incompatible p=
ointer type [-Werror=3Dincompatible-pointer-types]
>   809 |                 v4l2_h264_build_p_ref_list(&b, reflists.p);
>       |                                                ~~~~~~~~^~
>       |                                                        |
>       |                                                        u8 * {aka =
unsigned char *}
> In file included from drivers/media/platform/nvidia/tegra-vde/h264.c:14:
> ./include/media/v4l2-h264.h:83:56: note: expected =E2=80=98struct v4l2_h2=
64_reference *=E2=80=99 but argument is of type =E2=80=98u8 *=E2=80=99 {aka=
 =E2=80=98unsigned char *=E2=80=99}
>    83 |                            struct v4l2_h264_reference *reflist);
>       |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
>=20
> It looks like you didn't build the tegra-vde driver either.

Driver was added recently, I will enable and port it, I'll check with Dmitr=
y if
he can validate, though I won't includ interlaced support there, I'll just =
port
to the new structure.

>=20
> Regards,
>=20
> 	Hans
>=20
> >  drivers/media/v4l2-core/v4l2-h264.c           | 33 ++++---
> >  .../staging/media/hantro/hantro_g1_h264_dec.c | 38 +++----
> >  drivers/staging/media/hantro/hantro_hw.h      |  6 +-
> >  .../media/hantro/rockchip_vpu2_hw_h264_dec.c  | 98 +++++++++----------
> >  drivers/staging/media/rkvdec/rkvdec-h264.c    | 12 +--
> >  include/media/v4l2-h264.h                     | 19 ++--
> >  7 files changed, 116 insertions(+), 107 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_=
if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c
> > index 43542de11e9c..72c599e05a47 100644
> > --- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c
> > +++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c
> > @@ -442,9 +442,16 @@ static void update_dpb(const struct v4l2_ctrl_h264=
_decode_params *dec_param,
> >  /*
> >   * The firmware expects unused reflist entries to have the value 0x20.
> >   */
> > -static void fixup_ref_list(u8 *ref_list, size_t num_valid)
> > +static void get_ref_list(u8 *ref_list, struct v4l2_h264_reflist_builde=
r *b)
> >  {
> > -	memset(&ref_list[num_valid], 0x20, 32 - num_valid);
> > +	u32 i;
> > +
> > +	/* FIXME mark the reference parity */
> > +	for (i =3D 0; i < b->num_valid; i++)
> > +		ref_list[i] =3D b->index;
> > +
> > +	for (; i < 32; i++)
> > +		ref_list[i] =3D 0x20;
> >  }
> > =20
> >  static void get_vdec_decode_parameters(struct vdec_h264_slice_inst *in=
st)
> > @@ -478,9 +485,9 @@ static void get_vdec_decode_parameters(struct vdec_=
h264_slice_inst *inst)
> >  	v4l2_h264_build_p_ref_list(&reflist_builder, p0_reflist);
> >  	v4l2_h264_build_b_ref_lists(&reflist_builder, b0_reflist, b1_reflist)=
;
> >  	/* Adapt the built lists to the firmware's expectations */
> > -	fixup_ref_list(p0_reflist, reflist_builder.num_valid);
> > -	fixup_ref_list(b0_reflist, reflist_builder.num_valid);
> > -	fixup_ref_list(b1_reflist, reflist_builder.num_valid);
> > +	get_ref_list(p0_reflist, reflist_builder);
> > +	get_ref_list(b0_reflist, reflist_builder);
> > +	get_ref_list(b1_reflist, reflist_builder);
> > =20
> >  	memcpy(&inst->vsi_ctx.h264_slice_params, slice_param,
> >  	       sizeof(inst->vsi_ctx.h264_slice_params));
> > diff --git a/drivers/media/v4l2-core/v4l2-h264.c b/drivers/media/v4l2-c=
ore/v4l2-h264.c
> > index ac47519a9fbe..afbfcf78efe4 100644
> > --- a/drivers/media/v4l2-core/v4l2-h264.c
> > +++ b/drivers/media/v4l2-core/v4l2-h264.c
> > @@ -75,12 +75,12 @@ v4l2_h264_init_reflist_builder(struct v4l2_h264_ref=
list_builder *b,
> >  			pic_order_count =3D dpb[i].top_field_order_cnt;
> > =20
> >  		b->refs[i].pic_order_count =3D pic_order_count;
> > -		b->unordered_reflist[b->num_valid] =3D i;
> > +		b->unordered_reflist[b->num_valid].index =3D i;
> >  		b->num_valid++;
> >  	}
> > =20
> >  	for (i =3D b->num_valid; i < ARRAY_SIZE(b->unordered_reflist); i++)
> > -		b->unordered_reflist[i] =3D i;
> > +		b->unordered_reflist[i].index =3D i;
> >  }
> >  EXPORT_SYMBOL_GPL(v4l2_h264_init_reflist_builder);
> > =20
> > @@ -90,8 +90,8 @@ static int v4l2_h264_p_ref_list_cmp(const void *ptra,=
 const void *ptrb,
> >  	const struct v4l2_h264_reflist_builder *builder =3D data;
> >  	u8 idxa, idxb;
> > =20
> > -	idxa =3D *((u8 *)ptra);
> > -	idxb =3D *((u8 *)ptrb);
> > +	idxa =3D ((struct v4l2_h264_reference *)ptra)->index;
> > +	idxb =3D ((struct v4l2_h264_reference *)ptrb)->index;
> > =20
> >  	if (WARN_ON(idxa >=3D V4L2_H264_NUM_DPB_ENTRIES ||
> >  		    idxb >=3D V4L2_H264_NUM_DPB_ENTRIES))
> > @@ -125,8 +125,8 @@ static int v4l2_h264_b0_ref_list_cmp(const void *pt=
ra, const void *ptrb,
> >  	s32 poca, pocb;
> >  	u8 idxa, idxb;
> > =20
> > -	idxa =3D *((u8 *)ptra);
> > -	idxb =3D *((u8 *)ptrb);
> > +	idxa =3D ((struct v4l2_h264_reference *)ptra)->index;
> > +	idxb =3D ((struct v4l2_h264_reference *)ptrb)->index;
> > =20
> >  	if (WARN_ON(idxa >=3D V4L2_H264_NUM_DPB_ENTRIES ||
> >  		    idxb >=3D V4L2_H264_NUM_DPB_ENTRIES))
> > @@ -170,8 +170,8 @@ static int v4l2_h264_b1_ref_list_cmp(const void *pt=
ra, const void *ptrb,
> >  	s32 poca, pocb;
> >  	u8 idxa, idxb;
> > =20
> > -	idxa =3D *((u8 *)ptra);
> > -	idxb =3D *((u8 *)ptrb);
> > +	idxa =3D ((struct v4l2_h264_reference *)ptra)->index;
> > +	idxb =3D ((struct v4l2_h264_reference *)ptrb)->index;
> > =20
> >  	if (WARN_ON(idxa >=3D V4L2_H264_NUM_DPB_ENTRIES ||
> >  		    idxb >=3D V4L2_H264_NUM_DPB_ENTRIES))
> > @@ -212,8 +212,8 @@ static int v4l2_h264_b1_ref_list_cmp(const void *pt=
ra, const void *ptrb,
> >   * v4l2_h264_build_p_ref_list() - Build the P reference list
> >   *
> >   * @builder: reference list builder context
> > - * @reflist: 16-bytes array used to store the P reference list. Each e=
ntry
> > - *	     is an index in the DPB
> > + * @reflist: 16 sized array used to store the P reference list. Each e=
ntry
> > + *	     is a v4l2_h264_reference structure
> >   *
> >   * This functions builds the P reference lists. This procedure is desc=
ribe in
> >   * section '8.2.4 Decoding process for reference picture lists constru=
ction'
> > @@ -222,7 +222,7 @@ static int v4l2_h264_b1_ref_list_cmp(const void *pt=
ra, const void *ptrb,
> >   */
> >  void
> >  v4l2_h264_build_p_ref_list(const struct v4l2_h264_reflist_builder *bui=
lder,
> > -			   u8 *reflist)
> > +			   struct v4l2_h264_reference *reflist)
> >  {
> >  	memcpy(reflist, builder->unordered_reflist,
> >  	       sizeof(builder->unordered_reflist[0]) * builder->num_valid);
> > @@ -235,10 +235,10 @@ EXPORT_SYMBOL_GPL(v4l2_h264_build_p_ref_list);
> >   * v4l2_h264_build_b_ref_lists() - Build the B0/B1 reference lists
> >   *
> >   * @builder: reference list builder context
> > - * @b0_reflist: 16-bytes array used to store the B0 reference list. Ea=
ch entry
> > - *		is an index in the DPB
> > - * @b1_reflist: 16-bytes array used to store the B1 reference list. Ea=
ch entry
> > - *		is an index in the DPB
> > + * @b0_reflist: 16 sized array used to store the B0 reference list. Ea=
ch entry
> > + *		is a v4l2_h264_reference structure
> > + * @b1_reflist: 16 sized array used to store the B1 reference list. Ea=
ch entry
> > + *		is a v4l2_h264_reference structure
> >   *
> >   * This functions builds the B0/B1 reference lists. This procedure is =
described
> >   * in section '8.2.4 Decoding process for reference picture lists cons=
truction'
> > @@ -247,7 +247,8 @@ EXPORT_SYMBOL_GPL(v4l2_h264_build_p_ref_list);
> >   */
> >  void
> >  v4l2_h264_build_b_ref_lists(const struct v4l2_h264_reflist_builder *bu=
ilder,
> > -			    u8 *b0_reflist, u8 *b1_reflist)
> > +			    struct v4l2_h264_reference *b0_reflist,
> > +			    struct v4l2_h264_reference *b1_reflist)
> >  {
> >  	memcpy(b0_reflist, builder->unordered_reflist,
> >  	       sizeof(builder->unordered_reflist[0]) * builder->num_valid);
> > diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/driver=
s/staging/media/hantro/hantro_g1_h264_dec.c
> > index f49dbfb8a843..9de7f05eff2a 100644
> > --- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> > +++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> > @@ -126,7 +126,7 @@ static void set_params(struct hantro_ctx *ctx, stru=
ct vb2_v4l2_buffer *src_buf)
> > =20
> >  static void set_ref(struct hantro_ctx *ctx)
> >  {
> > -	const u8 *b0_reflist, *b1_reflist, *p_reflist;
> > +	const struct v4l2_h264_reference *b0_reflist, *b1_reflist, *p_reflist=
;
> >  	struct hantro_dev *vpu =3D ctx->dev;
> >  	int reg_num;
> >  	u32 reg;
> > @@ -157,12 +157,12 @@ static void set_ref(struct hantro_ctx *ctx)
> >  	 */
> >  	reg_num =3D 0;
> >  	for (i =3D 0; i < 15; i +=3D 3) {
> > -		reg =3D G1_REG_BD_REF_PIC_BINIT_RLIST_F0(b0_reflist[i]) |
> > -		      G1_REG_BD_REF_PIC_BINIT_RLIST_F1(b0_reflist[i + 1]) |
> > -		      G1_REG_BD_REF_PIC_BINIT_RLIST_F2(b0_reflist[i + 2]) |
> > -		      G1_REG_BD_REF_PIC_BINIT_RLIST_B0(b1_reflist[i]) |
> > -		      G1_REG_BD_REF_PIC_BINIT_RLIST_B1(b1_reflist[i + 1]) |
> > -		      G1_REG_BD_REF_PIC_BINIT_RLIST_B2(b1_reflist[i + 2]);
> > +		reg =3D G1_REG_BD_REF_PIC_BINIT_RLIST_F0(b0_reflist[i].index) |
> > +		      G1_REG_BD_REF_PIC_BINIT_RLIST_F1(b0_reflist[i + 1].index) |
> > +		      G1_REG_BD_REF_PIC_BINIT_RLIST_F2(b0_reflist[i + 2].index) |
> > +		      G1_REG_BD_REF_PIC_BINIT_RLIST_B0(b1_reflist[i].index) |
> > +		      G1_REG_BD_REF_PIC_BINIT_RLIST_B1(b1_reflist[i + 1].index) |
> > +		      G1_REG_BD_REF_PIC_BINIT_RLIST_B2(b1_reflist[i + 2].index);
> >  		vdpu_write_relaxed(vpu, reg, G1_REG_BD_REF_PIC(reg_num++));
> >  	}
> > =20
> > @@ -171,12 +171,12 @@ static void set_ref(struct hantro_ctx *ctx)
> >  	 * of forward and backward reference picture lists and first 4 entrie=
s
> >  	 * of P forward picture list.
> >  	 */
> > -	reg =3D G1_REG_BD_P_REF_PIC_BINIT_RLIST_F15(b0_reflist[15]) |
> > -	      G1_REG_BD_P_REF_PIC_BINIT_RLIST_B15(b1_reflist[15]) |
> > -	      G1_REG_BD_P_REF_PIC_PINIT_RLIST_F0(p_reflist[0]) |
> > -	      G1_REG_BD_P_REF_PIC_PINIT_RLIST_F1(p_reflist[1]) |
> > -	      G1_REG_BD_P_REF_PIC_PINIT_RLIST_F2(p_reflist[2]) |
> > -	      G1_REG_BD_P_REF_PIC_PINIT_RLIST_F3(p_reflist[3]);
> > +	reg =3D G1_REG_BD_P_REF_PIC_BINIT_RLIST_F15(b0_reflist[15].index) |
> > +	      G1_REG_BD_P_REF_PIC_BINIT_RLIST_B15(b1_reflist[15].index) |
> > +	      G1_REG_BD_P_REF_PIC_PINIT_RLIST_F0(p_reflist[0].index) |
> > +	      G1_REG_BD_P_REF_PIC_PINIT_RLIST_F1(p_reflist[1].index) |
> > +	      G1_REG_BD_P_REF_PIC_PINIT_RLIST_F2(p_reflist[2].index) |
> > +	      G1_REG_BD_P_REF_PIC_PINIT_RLIST_F3(p_reflist[3].index);
> >  	vdpu_write_relaxed(vpu, reg, G1_REG_BD_P_REF_PIC);
> > =20
> >  	/*
> > @@ -185,12 +185,12 @@ static void set_ref(struct hantro_ctx *ctx)
> >  	 */
> >  	reg_num =3D 0;
> >  	for (i =3D 4; i < HANTRO_H264_DPB_SIZE; i +=3D 6) {
> > -		reg =3D G1_REG_FWD_PIC_PINIT_RLIST_F0(p_reflist[i]) |
> > -		      G1_REG_FWD_PIC_PINIT_RLIST_F1(p_reflist[i + 1]) |
> > -		      G1_REG_FWD_PIC_PINIT_RLIST_F2(p_reflist[i + 2]) |
> > -		      G1_REG_FWD_PIC_PINIT_RLIST_F3(p_reflist[i + 3]) |
> > -		      G1_REG_FWD_PIC_PINIT_RLIST_F4(p_reflist[i + 4]) |
> > -		      G1_REG_FWD_PIC_PINIT_RLIST_F5(p_reflist[i + 5]);
> > +		reg =3D G1_REG_FWD_PIC_PINIT_RLIST_F0(p_reflist[i].index) |
> > +		      G1_REG_FWD_PIC_PINIT_RLIST_F1(p_reflist[i + 1].index) |
> > +		      G1_REG_FWD_PIC_PINIT_RLIST_F2(p_reflist[i + 2].index) |
> > +		      G1_REG_FWD_PIC_PINIT_RLIST_F3(p_reflist[i + 3].index) |
> > +		      G1_REG_FWD_PIC_PINIT_RLIST_F4(p_reflist[i + 4].index) |
> > +		      G1_REG_FWD_PIC_PINIT_RLIST_F5(p_reflist[i + 5].index);
> >  		vdpu_write_relaxed(vpu, reg, G1_REG_FWD_PIC(reg_num++));
> >  	}
> > =20
> > diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging=
/media/hantro/hantro_hw.h
> > index ed018e293ba0..2bc6b8f088f5 100644
> > --- a/drivers/staging/media/hantro/hantro_hw.h
> > +++ b/drivers/staging/media/hantro/hantro_hw.h
> > @@ -69,9 +69,9 @@ struct hantro_h264_dec_ctrls {
> >   * @b1:		B1 reflist
> >   */
> >  struct hantro_h264_dec_reflists {
> > -	u8 p[HANTRO_H264_DPB_SIZE];
> > -	u8 b0[HANTRO_H264_DPB_SIZE];
> > -	u8 b1[HANTRO_H264_DPB_SIZE];
> > +	struct v4l2_h264_reference p[HANTRO_H264_DPB_SIZE];
> > +	struct v4l2_h264_reference b0[HANTRO_H264_DPB_SIZE];
> > +	struct v4l2_h264_reference b1[HANTRO_H264_DPB_SIZE];
> >  };
> > =20
> >  /**
> > diff --git a/drivers/staging/media/hantro/rockchip_vpu2_hw_h264_dec.c b=
/drivers/staging/media/hantro/rockchip_vpu2_hw_h264_dec.c
> > index 64a6330475eb..46c1a83bcc4e 100644
> > --- a/drivers/staging/media/hantro/rockchip_vpu2_hw_h264_dec.c
> > +++ b/drivers/staging/media/hantro/rockchip_vpu2_hw_h264_dec.c
> > @@ -298,7 +298,7 @@ static void set_params(struct hantro_ctx *ctx, stru=
ct vb2_v4l2_buffer *src_buf)
> > =20
> >  static void set_ref(struct hantro_ctx *ctx)
> >  {
> > -	const u8 *b0_reflist, *b1_reflist, *p_reflist;
> > +	const struct v4l2_h264_reference *b0_reflist, *b1_reflist, *p_reflist=
;
> >  	struct hantro_dev *vpu =3D ctx->dev;
> >  	u32 reg;
> >  	int i;
> > @@ -307,20 +307,20 @@ static void set_ref(struct hantro_ctx *ctx)
> >  	b1_reflist =3D ctx->h264_dec.reflists.b1;
> >  	p_reflist =3D ctx->h264_dec.reflists.p;
> > =20
> > -	reg =3D VDPU_REG_PINIT_RLIST_F9(p_reflist[9]) |
> > -	      VDPU_REG_PINIT_RLIST_F8(p_reflist[8]) |
> > -	      VDPU_REG_PINIT_RLIST_F7(p_reflist[7]) |
> > -	      VDPU_REG_PINIT_RLIST_F6(p_reflist[6]) |
> > -	      VDPU_REG_PINIT_RLIST_F5(p_reflist[5]) |
> > -	      VDPU_REG_PINIT_RLIST_F4(p_reflist[4]);
> > +	reg =3D VDPU_REG_PINIT_RLIST_F9(p_reflist[9].index) |
> > +	      VDPU_REG_PINIT_RLIST_F8(p_reflist[8].index) |
> > +	      VDPU_REG_PINIT_RLIST_F7(p_reflist[7].index) |
> > +	      VDPU_REG_PINIT_RLIST_F6(p_reflist[6].index) |
> > +	      VDPU_REG_PINIT_RLIST_F5(p_reflist[5].index) |
> > +	      VDPU_REG_PINIT_RLIST_F4(p_reflist[4].index);
> >  	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(74));
> > =20
> > -	reg =3D VDPU_REG_PINIT_RLIST_F15(p_reflist[15]) |
> > -	      VDPU_REG_PINIT_RLIST_F14(p_reflist[14]) |
> > -	      VDPU_REG_PINIT_RLIST_F13(p_reflist[13]) |
> > -	      VDPU_REG_PINIT_RLIST_F12(p_reflist[12]) |
> > -	      VDPU_REG_PINIT_RLIST_F11(p_reflist[11]) |
> > -	      VDPU_REG_PINIT_RLIST_F10(p_reflist[10]);
> > +	reg =3D VDPU_REG_PINIT_RLIST_F15(p_reflist[15].index) |
> > +	      VDPU_REG_PINIT_RLIST_F14(p_reflist[14].index) |
> > +	      VDPU_REG_PINIT_RLIST_F13(p_reflist[13].index) |
> > +	      VDPU_REG_PINIT_RLIST_F12(p_reflist[12].index) |
> > +	      VDPU_REG_PINIT_RLIST_F11(p_reflist[11].index) |
> > +	      VDPU_REG_PINIT_RLIST_F10(p_reflist[10].index);
> >  	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(75));
> > =20
> >  	reg =3D VDPU_REG_REFER1_NBR(hantro_h264_get_ref_nbr(ctx, 1)) |
> > @@ -355,54 +355,54 @@ static void set_ref(struct hantro_ctx *ctx)
> >  	      VDPU_REG_REFER14_NBR(hantro_h264_get_ref_nbr(ctx, 14));
> >  	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(83));
> > =20
> > -	reg =3D VDPU_REG_BINIT_RLIST_F5(b0_reflist[5]) |
> > -	      VDPU_REG_BINIT_RLIST_F4(b0_reflist[4]) |
> > -	      VDPU_REG_BINIT_RLIST_F3(b0_reflist[3]) |
> > -	      VDPU_REG_BINIT_RLIST_F2(b0_reflist[2]) |
> > -	      VDPU_REG_BINIT_RLIST_F1(b0_reflist[1]) |
> > -	      VDPU_REG_BINIT_RLIST_F0(b0_reflist[0]);
> > +	reg =3D VDPU_REG_BINIT_RLIST_F5(b0_reflist[5].index) |
> > +	      VDPU_REG_BINIT_RLIST_F4(b0_reflist[4].index) |
> > +	      VDPU_REG_BINIT_RLIST_F3(b0_reflist[3].index) |
> > +	      VDPU_REG_BINIT_RLIST_F2(b0_reflist[2].index) |
> > +	      VDPU_REG_BINIT_RLIST_F1(b0_reflist[1].index) |
> > +	      VDPU_REG_BINIT_RLIST_F0(b0_reflist[0].index);
> >  	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(100));
> > =20
> > -	reg =3D VDPU_REG_BINIT_RLIST_F11(b0_reflist[11]) |
> > -	      VDPU_REG_BINIT_RLIST_F10(b0_reflist[10]) |
> > -	      VDPU_REG_BINIT_RLIST_F9(b0_reflist[9]) |
> > -	      VDPU_REG_BINIT_RLIST_F8(b0_reflist[8]) |
> > -	      VDPU_REG_BINIT_RLIST_F7(b0_reflist[7]) |
> > -	      VDPU_REG_BINIT_RLIST_F6(b0_reflist[6]);
> > +	reg =3D VDPU_REG_BINIT_RLIST_F11(b0_reflist[11].index) |
> > +	      VDPU_REG_BINIT_RLIST_F10(b0_reflist[10].index) |
> > +	      VDPU_REG_BINIT_RLIST_F9(b0_reflist[9].index) |
> > +	      VDPU_REG_BINIT_RLIST_F8(b0_reflist[8].index) |
> > +	      VDPU_REG_BINIT_RLIST_F7(b0_reflist[7].index) |
> > +	      VDPU_REG_BINIT_RLIST_F6(b0_reflist[6].index);
> >  	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(101));
> > =20
> > -	reg =3D VDPU_REG_BINIT_RLIST_F15(b0_reflist[15]) |
> > -	      VDPU_REG_BINIT_RLIST_F14(b0_reflist[14]) |
> > -	      VDPU_REG_BINIT_RLIST_F13(b0_reflist[13]) |
> > -	      VDPU_REG_BINIT_RLIST_F12(b0_reflist[12]);
> > +	reg =3D VDPU_REG_BINIT_RLIST_F15(b0_reflist[15].index) |
> > +	      VDPU_REG_BINIT_RLIST_F14(b0_reflist[14].index) |
> > +	      VDPU_REG_BINIT_RLIST_F13(b0_reflist[13].index) |
> > +	      VDPU_REG_BINIT_RLIST_F12(b0_reflist[12].index);
> >  	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(102));
> > =20
> > -	reg =3D VDPU_REG_BINIT_RLIST_B5(b1_reflist[5]) |
> > -	      VDPU_REG_BINIT_RLIST_B4(b1_reflist[4]) |
> > -	      VDPU_REG_BINIT_RLIST_B3(b1_reflist[3]) |
> > -	      VDPU_REG_BINIT_RLIST_B2(b1_reflist[2]) |
> > -	      VDPU_REG_BINIT_RLIST_B1(b1_reflist[1]) |
> > -	      VDPU_REG_BINIT_RLIST_B0(b1_reflist[0]);
> > +	reg =3D VDPU_REG_BINIT_RLIST_B5(b1_reflist[5].index) |
> > +	      VDPU_REG_BINIT_RLIST_B4(b1_reflist[4].index) |
> > +	      VDPU_REG_BINIT_RLIST_B3(b1_reflist[3].index) |
> > +	      VDPU_REG_BINIT_RLIST_B2(b1_reflist[2].index) |
> > +	      VDPU_REG_BINIT_RLIST_B1(b1_reflist[1].index) |
> > +	      VDPU_REG_BINIT_RLIST_B0(b1_reflist[0].index);
> >  	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(103));
> > =20
> > -	reg =3D VDPU_REG_BINIT_RLIST_B11(b1_reflist[11]) |
> > -	      VDPU_REG_BINIT_RLIST_B10(b1_reflist[10]) |
> > -	      VDPU_REG_BINIT_RLIST_B9(b1_reflist[9]) |
> > -	      VDPU_REG_BINIT_RLIST_B8(b1_reflist[8]) |
> > -	      VDPU_REG_BINIT_RLIST_B7(b1_reflist[7]) |
> > -	      VDPU_REG_BINIT_RLIST_B6(b1_reflist[6]);
> > +	reg =3D VDPU_REG_BINIT_RLIST_B11(b1_reflist[11].index) |
> > +	      VDPU_REG_BINIT_RLIST_B10(b1_reflist[10].index) |
> > +	      VDPU_REG_BINIT_RLIST_B9(b1_reflist[9].index) |
> > +	      VDPU_REG_BINIT_RLIST_B8(b1_reflist[8].index) |
> > +	      VDPU_REG_BINIT_RLIST_B7(b1_reflist[7].index) |
> > +	      VDPU_REG_BINIT_RLIST_B6(b1_reflist[6].index);
> >  	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(104));
> > =20
> > -	reg =3D VDPU_REG_BINIT_RLIST_B15(b1_reflist[15]) |
> > -	      VDPU_REG_BINIT_RLIST_B14(b1_reflist[14]) |
> > -	      VDPU_REG_BINIT_RLIST_B13(b1_reflist[13]) |
> > -	      VDPU_REG_BINIT_RLIST_B12(b1_reflist[12]);
> > +	reg =3D VDPU_REG_BINIT_RLIST_B15(b1_reflist[15].index) |
> > +	      VDPU_REG_BINIT_RLIST_B14(b1_reflist[14].index) |
> > +	      VDPU_REG_BINIT_RLIST_B13(b1_reflist[13].index) |
> > +	      VDPU_REG_BINIT_RLIST_B12(b1_reflist[12].index);
> >  	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(105));
> > =20
> > -	reg =3D VDPU_REG_PINIT_RLIST_F3(p_reflist[3]) |
> > -	      VDPU_REG_PINIT_RLIST_F2(p_reflist[2]) |
> > -	      VDPU_REG_PINIT_RLIST_F1(p_reflist[1]) |
> > -	      VDPU_REG_PINIT_RLIST_F0(p_reflist[0]);
> > +	reg =3D VDPU_REG_PINIT_RLIST_F3(p_reflist[3].index) |
> > +	      VDPU_REG_PINIT_RLIST_F2(p_reflist[2].index) |
> > +	      VDPU_REG_PINIT_RLIST_F1(p_reflist[1].index) |
> > +	      VDPU_REG_PINIT_RLIST_F0(p_reflist[0].index);
> >  	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(106));
> > =20
> >  	reg =3D VDPU_REG_REFER_LTERM_E(ctx->h264_dec.dpb_longterm);
> > diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/stagi=
ng/media/rkvdec/rkvdec-h264.c
> > index 951e19231da2..3c7f3d87fab4 100644
> > --- a/drivers/staging/media/rkvdec/rkvdec-h264.c
> > +++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
> > @@ -100,9 +100,9 @@ struct rkvdec_h264_priv_tbl {
> >  #define RKVDEC_H264_DPB_SIZE 16
> > =20
> >  struct rkvdec_h264_reflists {
> > -	u8 p[RKVDEC_H264_DPB_SIZE];
> > -	u8 b0[RKVDEC_H264_DPB_SIZE];
> > -	u8 b1[RKVDEC_H264_DPB_SIZE];
> > +	struct v4l2_h264_reference p[RKVDEC_H264_DPB_SIZE];
> > +	struct v4l2_h264_reference b0[RKVDEC_H264_DPB_SIZE];
> > +	struct v4l2_h264_reference b1[RKVDEC_H264_DPB_SIZE];
> >  	u8 num_valid;
> >  };
> > =20
> > @@ -767,13 +767,13 @@ static void assemble_hw_rps(struct rkvdec_ctx *ct=
x,
> > =20
> >  			switch (j) {
> >  			case 0:
> > -				idx =3D h264_ctx->reflists.p[i];
> > +				idx =3D h264_ctx->reflists.p[i].index;
> >  				break;
> >  			case 1:
> > -				idx =3D h264_ctx->reflists.b0[i];
> > +				idx =3D h264_ctx->reflists.b0[i].index;
> >  				break;
> >  			case 2:
> > -				idx =3D h264_ctx->reflists.b1[i];
> > +				idx =3D h264_ctx->reflists.b1[i].index;
> >  				break;
> >  			}
> > =20
> > diff --git a/include/media/v4l2-h264.h b/include/media/v4l2-h264.h
> > index 4b1c71c935e0..ef9a894e3c32 100644
> > --- a/include/media/v4l2-h264.h
> > +++ b/include/media/v4l2-h264.h
> > @@ -37,7 +37,7 @@ struct v4l2_h264_reflist_builder {
> >  		u16 longterm : 1;
> >  	} refs[V4L2_H264_NUM_DPB_ENTRIES];
> >  	s32 cur_pic_order_count;
> > -	u8 unordered_reflist[V4L2_H264_NUM_DPB_ENTRIES];
> > +	struct v4l2_h264_reference unordered_reflist[V4L2_H264_NUM_DPB_ENTRIE=
S];
> >  	u8 num_valid;
> >  };
> > =20
> > @@ -51,10 +51,10 @@ v4l2_h264_init_reflist_builder(struct v4l2_h264_ref=
list_builder *b,
> >   * v4l2_h264_build_b_ref_lists() - Build the B0/B1 reference lists
> >   *
> >   * @builder: reference list builder context
> > - * @b0_reflist: 16-bytes array used to store the B0 reference list. Ea=
ch entry
> > - *		is an index in the DPB
> > - * @b1_reflist: 16-bytes array used to store the B1 reference list. Ea=
ch entry
> > - *		is an index in the DPB
> > + * @b0_reflist: 16 sized array used to store the B0 reference list. Ea=
ch entry
> > + *		is a v4l2_h264_reference structure
> > + * @b1_reflist: 16 sized array used to store the B1 reference list. Ea=
ch entry
> > + *		is a v4l2_h264_reference structure
> >   *
> >   * This functions builds the B0/B1 reference lists. This procedure is =
described
> >   * in section '8.2.4 Decoding process for reference picture lists cons=
truction'
> > @@ -63,14 +63,15 @@ v4l2_h264_init_reflist_builder(struct v4l2_h264_ref=
list_builder *b,
> >   */
> >  void
> >  v4l2_h264_build_b_ref_lists(const struct v4l2_h264_reflist_builder *bu=
ilder,
> > -			    u8 *b0_reflist, u8 *b1_reflist);
> > +			    struct v4l2_h264_reference *b0_reflist,
> > +			    struct v4l2_h264_reference *b1_reflist);
> > =20
> >  /**
> >   * v4l2_h264_build_p_ref_list() - Build the P reference list
> >   *
> >   * @builder: reference list builder context
> > - * @reflist: 16-bytes array used to store the P reference list. Each e=
ntry
> > - *	     is an index in the DPB
> > + * @reflist: 16 sized array used to store the P reference list. Each e=
ntry
> > + *	     is a v4l2_h264_reference structure
> >   *
> >   * This functions builds the P reference lists. This procedure is desc=
ribe in
> >   * section '8.2.4 Decoding process for reference picture lists constru=
ction'
> > @@ -79,6 +80,6 @@ v4l2_h264_build_b_ref_lists(const struct v4l2_h264_re=
flist_builder *builder,
> >   */
> >  void
> >  v4l2_h264_build_p_ref_list(const struct v4l2_h264_reflist_builder *bui=
lder,
> > -			   u8 *reflist);
> > +			   struct v4l2_h264_reference *reflist);
> > =20
> >  #endif /* _MEDIA_V4L2_H264_H */
>=20

