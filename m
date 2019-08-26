Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB9BB9CAC5
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 09:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730041AbfHZHmS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 03:42:18 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:51725 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729942AbfHZHmS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 03:42:18 -0400
X-Originating-IP: 87.18.63.98
Received: from uno.localdomain (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 26969FF80F;
        Mon, 26 Aug 2019 07:42:13 +0000 (UTC)
Date:   Mon, 26 Aug 2019 09:43:44 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 5/7] media: v4l2-core: Add new helper for area controls
Message-ID: <20190826074344.yboir7ihjvrqyrv6@uno.localdomain>
References: <20190823123737.7774-1-ribalda@kernel.org>
 <20190823123737.7774-5-ribalda@kernel.org>
 <1566564998.3023.13.camel@pengutronix.de>
 <CAPybu_0iodVnn1Fa5BFi7zc7ugwpN926wCJaoKU548zqrNJ5iw@mail.gmail.com>
 <1566566016.3023.21.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gmvus75kizerfxb7"
Content-Disposition: inline
In-Reply-To: <1566566016.3023.21.camel@pengutronix.de>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--gmvus75kizerfxb7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Ricardo,

On Fri, Aug 23, 2019 at 03:13:36PM +0200, Philipp Zabel wrote:
> On Fri, 2019-08-23 at 15:05 +0200, Ricardo Ribalda Delgado wrote:
> > On Fri, Aug 23, 2019 at 2:56 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
> > >
> > > On Fri, 2019-08-23 at 14:37 +0200, Ricardo Ribalda Delgado wrote:
> > > > Adding a V4L2_CID_UNIT_CELL_SIZE control requires a lot of boilerplate,
> > > > try to minimize it by adding a new helper.
> > > >
> > > > Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > > Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> > > > ---
> > > >  drivers/media/v4l2-core/v4l2-ctrls.c | 25 ++++++++++++++++++++++++-
> > > >  include/media/v4l2-ctrls.h           | 16 ++++++++++++++++
> > > >  2 files changed, 40 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> > > > index b3bf458df7f7..33e48f0aec1a 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> > > > @@ -2660,7 +2660,6 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
> > > >  }
> > > >  EXPORT_SYMBOL(v4l2_ctrl_new_std_menu_items);
> > > >
> > > > -/* Helper function for standard integer menu controls */
> > >
> > > Why move this ...
> > >
> > > >  struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
> > > >                       const struct v4l2_ctrl_ops *ops,
> > > >                       u32 id, u8 _max, u8 _def, const s64 *qmenu_int)
> > > > @@ -2684,6 +2683,30 @@ struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
> > > >  }
> > > >  EXPORT_SYMBOL(v4l2_ctrl_new_int_menu);
> > > >
> > > > +static void area_init(const struct v4l2_ctrl *ctrl, u32 idx,
> > > > +             union v4l2_ctrl_ptr ptr)
> > > > +{
> > > > +     memcpy(ptr.p_area, ctrl->priv, sizeof(*ptr.p_area));
> > > > +}
> > > > +
> > > > +static const struct v4l2_ctrl_type_ops area_ops = {
> > > > +     .init = area_init,
> > > > +};
> > > > +
> > > > +struct v4l2_ctrl *v4l2_ctrl_new_area(struct v4l2_ctrl_handler *hdl,
> > > > +                                  const struct v4l2_ctrl_ops *ops,
> > > > +                                  u32 id, const struct v4l2_area *area)
> > > > +{
> > > > +     static struct v4l2_ctrl_config ctrl = {
> > > > +             .id = V4L2_CID_UNIT_CELL_SIZE,
> > > > +             .type_ops = &area_ops,
> > > > +     };
> > > > +
> > > > +     return v4l2_ctrl_new_custom(hdl, &ctrl, (void *)area);
> > > > +}
> > > > +EXPORT_SYMBOL(v4l2_ctrl_new_area);
> > > > +
> > > > +/* Helper function for standard integer menu controls */
> > >
> > > ... here?
> >
> > Because I screwed up :). Let me fix that sorry.
> >
> > I will push all your changes to:
> >
> > https://github.com/ribalda/linux/tree/unit-size-v4
> >
> > plus any other comment and then I will wait 2-3 days for resend
>
> Awesome, thanks! Feel free to add
>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

With the issue pointed out by Philipp addressed
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

>
> regards
> Philipp

--gmvus75kizerfxb7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1jjbAACgkQcjQGjxah
VjynIhAAwtTeujpSGqKFNzs5jlsF0OGxvrxkVhvjpyZHW7wGZMnmChN9MyNdkWLw
gZhp7gtlWld/hfX1iOnvgOz0SD5li/EkddFPCPMK/KRvn4ps3oNe98JEduqWushU
BCwo4sGLXlzmTDEsA5c44oLMkR/G2wOsLpH2x0eOqLKOKAy0AgEpVg7KqvH//0At
FJA+cBmz3ce2MMsM93sqbxnTVN0nvQ6uAlyRZmAWW2xDHH7Wy9uxKaUCy52Hkywj
huKlXD/U9kCqlbNSsaIJrKbcmJwdmDN89dxF+nNDRVoVht2w8xi5DYg9jZQCRhIk
SPE6qySMIoH9sJkQeaYW0rzhD1i/eLI6jm0A1OmvkWtT1E2mLvu5sw4wgZSbkgDO
ZvdXIsSUFTdBaf12XfLreuilpPcT6uJUg/33DtGdp89nVH3/yesWhsgXrcOJs/UE
TPudC4xhgVqmy5846MHKkl4v5l263xchmLRGzZlN7LkqQTpDZynpCuLNAI9E5Zhp
0HSeF3Evg5taR1ZhY3vky4977EUBNmMmKgRxMsoKlC+Be/3MpM6j8h8/b7JQMWrL
Rwy1co5/ZGUtuYzSYf1jzvJT6PEAGo6Fie1AA53Q3V8qGMdJNx8wAx6p/lb8ACe2
BkLxFS0V2HgSh6gmAKFSQZoCJzIyc7EJM/6PrB+GotNjsUQse6U=
=fkss
-----END PGP SIGNATURE-----

--gmvus75kizerfxb7--
