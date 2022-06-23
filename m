Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3811C55898E
	for <lists+linux-media@lfdr.de>; Thu, 23 Jun 2022 21:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbiFWTuU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jun 2022 15:50:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231605AbiFWTuH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jun 2022 15:50:07 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EED1227CFB
        for <linux-media@vger.kernel.org>; Thu, 23 Jun 2022 12:48:45 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (mtl.collabora.ca [66.171.169.34])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: nicolas)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id C350C66017E4;
        Thu, 23 Jun 2022 20:48:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1656013724;
        bh=2BoOjKoi+YvSbys57ZQ5pZ5czkwiGxPGBbi1UUIV66Y=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=Tze7dbh/3m0xIquU+K9JiikxTG0CJEd7L5JhBCMjFfGwZ7EJkVNF1wiUXvV7lkgXQ
         1EpjVyT2rjBc3C7H0WMqciztWGtgE90hOa0PjsXm/Bac5xwnGMPUCnp+1M6h8nLyAp
         AmKvBdeGZq9OdbQ2XauZzguAdm0viwPG6dQaKsb0IIVpAoyTX+E86uMIRZFmScoXL/
         wILM1VHO4wI9ek9TkDYh3ar4Fu8x72CyPvX+QDX/8Pk/H3OuwwRq9mx6mc6FSvDGtV
         ksoxxJmKnZwWAjOgawT3iBgMpmycALIoxjWsl0YyokFHeZlCYJF0bqFH7tPsWqlC5p
         k+9iiaYnbC3ag==
Message-ID: <cec075f5fd477bd45ddae4247fe4e40dc1d8ccf8.camel@collabora.com>
Subject: Re: [PATCH] mediatek/jpeg: validate data_offsets for v4l2 planes
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Justin Green <greenjustin@chromium.org>
Cc:     linux-media@vger.kernel.org, tiffany.lin@mediatek.com,
        andrew-ct.chen@mediatek.com, mchehab@kernel.org,
        matthias.bgg@gmail.com, andrescj@chromium.org,
        yunfei.dong@mediatek.com, Justin Green <greenjustin@google.com>
Date:   Thu, 23 Jun 2022 15:48:35 -0400
In-Reply-To: <CAHC42RcYS99N3=R4SK2+=U+23H6Xggu6JRR4Y=4ora+Ye0AViQ@mail.gmail.com>
References: <20220623191422.1157518-1-greenjustin@chromium.org>
         <1e1e8934915380ebcf0a1d2af11ef8f54bc2c28a.camel@collabora.com>
         <CAHC42RcYS99N3=R4SK2+=U+23H6Xggu6JRR4Y=4ora+Ye0AViQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 23 juin 2022 =C3=A0 15:42 -0400, Justin Green a =C3=A9crit=C2=A0:
> On Thu, Jun 23, 2022 at 3:31 PM Nicolas Dufresne
> <nicolas.dufresne@collabora.com> wrote:
> >=20
> > Le jeudi 23 juin 2022 =C3=A0 15:14 -0400, Justin Green a =C3=A9crit :
> > > Validate V4L2 plane data_offset values. We need to make sure the size=
 of
> > > the image we're encoding does not exceed the size of the buffer minus
> > > its offset.
> > >=20
> > > Signed-off-by: Justin Green <greenjustin@google.com>
> > > ---
> > >  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >=20
> > > diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/d=
rivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > > index bc5b0a0168ec..8f5c1b9937bc 100644
> > > --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > > +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > > @@ -687,6 +687,10 @@ static int mtk_jpeg_buf_prepare(struct vb2_buffe=
r *vb)
> > >=20
> > >       for (i =3D 0; i < q_data->fmt->colplanes; i++) {
> > >               plane_fmt =3D q_data->pix_mp.plane_fmt[i];
> > > +                if (vb->planes[i].data_offset > vb2_plane_size(vb, i=
) ||
> > > +                    vb2_plane_size(vb, i) - vb->planes[i].data_offse=
t
> > > +                    < plane_fmt.sizeimage)
> > > +                    return -EINVAL;
> >=20
> > Just double checking, but has data_offset been verified already to prev=
ent the
> > underflow ?
>=20
> I believe the "vb->planes[i].data_offset > vb2_plane_size(vb, i)"
> check should do that, right?

Perfect, with that said:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

If no new version required, would it be possible to add:

Fixes: 45f13a57d8134 ("media: platform: Add jpeg enc feature")

regards,
Nicolas
>=20
> >=20
> > >               if (ctx->enable_exif &&
> > >                   q_data->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG)
> > >                       vb2_set_plane_payload(vb, i, plane_fmt.sizeimag=
e +
> >=20

