Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC116175D9B
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 15:53:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727234AbgCBOxU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 09:53:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:51790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727121AbgCBOxU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Mar 2020 09:53:20 -0500
Received: from coco.lan (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 33B702080C;
        Mon,  2 Mar 2020 14:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583160798;
        bh=1w9gTDD0mrerWDAhBZGXC4+5deyJLyj8xbrGt2brb1M=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=vbwhZe/bLsp7NOTdfaVhIg+efxFdCJXjCBx2bckpQ3qaVSuNgaPyuipY86T6XKLqX
         DOW1RIhCiMORXa1+yh/1bhqlm3O6V8hFAnkYx0EswUdqMs97/5Y36Y2eWBV0tHP8WC
         KxF/fGryhEoQqyJOI147qTKoyO0TkR3UmSczIyxQ=
Date:   Mon, 2 Mar 2020 15:53:12 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v6 5/6] media: rkvdec: Add the rkvdec driver
Message-ID: <20200302155312.62185b98@coco.lan>
In-Reply-To: <20200302153039.0c4ff54f@collabora.com>
References: <20200220163016.21708-1-ezequiel@collabora.com>
        <20200220163016.21708-6-ezequiel@collabora.com>
        <20200302145746.3e94c1d1@coco.lan>
        <20200302153039.0c4ff54f@collabora.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 2 Mar 2020 15:30:39 +0100
Boris Brezillon <boris.brezillon@collabora.com> escreveu:

> On Mon, 2 Mar 2020 14:57:46 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
>=20
> > > +#define M_N(ctxidx, idc0_m, idc0_n, idc1_m, idc1_n,		\
> > > +	    idc2_m, idc2_n, intra_m, intra_n)			\
> > > +	[0][(ctxidx)] =3D {idc0_m, idc0_n},			\
> > > +	[1][(ctxidx)] =3D {idc1_m, idc1_n},			\
> > > +	[2][(ctxidx)] =3D {idc2_m, idc2_n},			\
> > > +	[3][(ctxidx)] =3D {intra_m, intra_n}   =20
> >=20
> > Hmm... I can't even imagine what a macro named "M_N" would do.
> > Please use a better name for it. =20
>=20
> Well, the meaning of those fields is explained in the spec, and the
> name itself has been chosen so it's short enough to not have lines
> exceeding 80 chars while still keeping the number of lines used for the
> cabac_table[] definition acceptable. But, I'm open to any other
> suggestion.

Well, code reviewers may not have the specs on their hands when
reviewing patches :-)

Keep 80 columns is something we desire, but not at the expense of
making the code harder to maintain or understand. Yet, I suspect
that increasing the name by a few extra bytes will still allow it to
sit at the 80 columns space[1].

[1] This macro passes 9 parameters. If each parameter consumes 4 chars,
    and they're preceded by a tab, that would mean 44 columns.

Perhaps something like CABAC_ENTRY or even MN_VALUES would be better.

>=20
> >=20
> > -
> >=20
> > With regards to the macro itself, at least for my eyes, it looked bad,
> > from long-term maintenance PoV, to have a first argument (ctxidx) whose
> > value is just a monotonic linearly-incremented counter. =20
>=20
> It's not, we have holes in the middle, hence the explicit indexing. I
> also tried to have something as close as possible to the spec, so
> people can easily see where it comes from.
>=20
> >=20
> > I mean, the way it is, it sounds risky, as one might miss a number
> > and one entire line of the array would be filled with zeros. =20
>=20
> That's exactly why I used explicit indexing: I want specific portions
> of the table to be 0-filled :-).

Ah, OK! Implementation makes sense then.
>=20
> >  =20
> > > +
> > > +/*
> > > + * Constant CABAC table.
> > > + * Built from the tables described in section '9.3.1.1 Initialisatio=
n process
> > > + * for context variables' of the H264 spec.
> > > + */
> > > +static const s8 rkvdec_h264_cabac_table[4][464][2] =3D {
> > > +	/* Table 9-12 =E2=80=93 Values of variables m and n for ctxIdx from=
 0 to 10 */
> > > +	M_N(0, 20, -15, 20, -15, 20, -15, 20, -15),   =20
> >=20
> > So, (maybe except if the ctxidx value has some real meaning),
> > perhaps you could, instead, switch the array order at the tables,
> > and get rid of ctxidx parameter for good, so the above code would
> > be like: =20
>=20
> I can't switch the array order since the HW expects things to be
> organized this way (that table is directly copied to a memory region
> that's passed to the HW).
>=20
> >=20
> > #define INIT_MN_PAIRS(idc0_m, idc0_n, idc1_m, idc1_n,	\
> > 	       idc2_m, idc2_n, intra_m, intra_n)	\
> > 	{						\
> > 		[0] =3D {idc0_m, idc0_n},			\
> > 		[1] =3D {idc1_m, idc1_n},			\
> > 		[2] =3D {idc2_m, idc2_n},			\
> > 		[3] =3D {intra_m, intra_n}		\
> > 	},
> >=20
> > static const s8 rkvdec_h264_cabac_table[464][4][2] =3D {
> > 	/* Table 9-12 =E2=80=93 Values of variables m and n for ctxIdx from 0 =
to 10 */
> > 	INIT_MN_PAIRS(20, -15, 20, -15, 20, -15, 20, -15),
> > 	... =20
>=20


Thanks,
Mauro
