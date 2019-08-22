Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 582F598BD2
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 08:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731868AbfHVG4g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 02:56:36 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:60833 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbfHVG4g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 02:56:36 -0400
X-Originating-IP: 87.18.63.98
Received: from uno.localdomain (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 2CEFC20008;
        Thu, 22 Aug 2019 06:56:31 +0000 (UTC)
Date:   Thu, 22 Aug 2019 08:58:00 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] media: imx214: Add new control with
 V4L2_CID_PIXEL_SIZE
Message-ID: <20190822065800.ja7mbga67vaawsil@uno.localdomain>
References: <20190819121720.31345-1-ribalda@kernel.org>
 <20190819121720.31345-3-ribalda@kernel.org>
 <20190821161523.6lckivpwiihpl35z@uno.localdomain>
 <CAPybu_3QzD4t7c4BXLcxAwYbuKUoAmJY8foPQLm=XKzgD7W+Dw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rdj7zxh5vjncwfdy"
Content-Disposition: inline
In-Reply-To: <CAPybu_3QzD4t7c4BXLcxAwYbuKUoAmJY8foPQLm=XKzgD7W+Dw@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--rdj7zxh5vjncwfdy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Ricardo,

On Wed, Aug 21, 2019 at 06:31:05PM +0200, Ricardo Ribalda Delgado wrote:
> Hi Jacopo
>
>
> On Wed, Aug 21, 2019 at 6:14 PM Jacopo Mondi <jacopo@jmondi.org> wrote:
> >
> > Hi Ricardo,
> >
> > On Mon, Aug 19, 2019 at 02:17:20PM +0200, Ricardo Ribalda Delgado wrote:
> > > According to the product brief, the unit cell size is 1120 nanometers^2.
> >
> > Should this information come from DT ?
>
> I do not think so. You cannot change this value and it needs to be
> defined also in sensors/cameras that might not have a DT, like a usb
> webcam.

You're probably right. I got this thinking because the camera
location/orientation are two read only parameters that come from DT,
but their value depends on the design of the device where the camera
is installed on, so they're configurable, while this and other
physical properties are not, and it doesn't make much sense to have
them in DT.

Thanks
   j

>
> It would be like adding to the DT the min/max exposure time...
>
> But of course we can discuss it ;)
>
> Best regards
>
> >
> > I'm asking as I've a series in review that adds an helper that
> > collectes dt properties and register controls for them. It currently
> > only supports the newly proposed camera location control, but there
> > might be others like the rotation, for which we already have a DT
> > property.
> >
> > https://patchwork.kernel.org/project/linux-media/list/?series=160901
> >
> > This new one is indeed an HW property of the sensor, I wonder if
> > having it in the firmware interface would make any sense or not...
> >
> > Thanks
> >   j
> >
> > >
> > > https://www.sony-semicon.co.jp/products_en/IS/sensor1/img/products/ProductBrief_IMX214_20150428.pdf
> > >
> > > Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> > > ---
> > >  drivers/media/i2c/imx214.c | 23 +++++++++++++++++++++++
> > >  1 file changed, 23 insertions(+)
> > >
> > > diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> > > index 159a3a604f0e..b2f6bd2d8d7d 100644
> > > --- a/drivers/media/i2c/imx214.c
> > > +++ b/drivers/media/i2c/imx214.c
> > > @@ -47,6 +47,7 @@ struct imx214 {
> > >       struct v4l2_ctrl *pixel_rate;
> > >       struct v4l2_ctrl *link_freq;
> > >       struct v4l2_ctrl *exposure;
> > > +     struct v4l2_ctrl *pixel_size;
> > >
> > >       struct regulator_bulk_data      supplies[IMX214_NUM_SUPPLIES];
> > >
> > > @@ -941,6 +942,26 @@ static int __maybe_unused imx214_resume(struct device *dev)
> > >       return ret;
> > >  }
> > >
> > > +static void pixel_size_init(const struct v4l2_ctrl *ctrl, u32 idx,
> > > +                  union v4l2_ctrl_ptr ptr)
> > > +{
> > > +     ptr.p_pixel_size->width = 1120;
> > > +     ptr.p_pixel_size->height = 1120;
> > > +}
> > > +
> > > +static const struct v4l2_ctrl_type_ops pixel_size_ops = {
> > > +     .init = pixel_size_init,
> > > +};
> > > +
> > > +static struct v4l2_ctrl *new_pixel_size_ctrl(struct v4l2_ctrl_handler *handler)
> > > +{
> > > +     static struct v4l2_ctrl_config ctrl = {
> > > +             .id = V4L2_CID_PIXEL_SIZE,
> > > +             .type_ops = &pixel_size_ops,
> > > +     };
> > > +
> > > +     return v4l2_ctrl_new_custom(handler, &ctrl, NULL);
> > > +}
> > >  static int imx214_probe(struct i2c_client *client)
> > >  {
> > >       struct device *dev = &client->dev;
> > > @@ -1029,6 +1050,8 @@ static int imx214_probe(struct i2c_client *client)
> > >                                            V4L2_CID_EXPOSURE,
> > >                                            0, 3184, 1, 0x0c70);
> > >
> > > +     imx214->pixel_size = new_pixel_size_ctrl(&imx214->ctrls);
> > > +
> > >       ret = imx214->ctrls.error;
> > >       if (ret) {
> > >               dev_err(&client->dev, "%s control init failed (%d)\n",
> > > --
> > > 2.23.0.rc1
> > >

--rdj7zxh5vjncwfdy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1ePPgACgkQcjQGjxah
VjwMjxAArr2C7WDJ9BhR2zFYHrKbgsFaW/1l+OqTTV7vDbHwH5lhIzsqjKXJ406g
4ExHp7xhZU3Rt3apZNMDguqF+t9nc8hAS/Z7cJY3uBTb203akHtuY1SNUez2JInS
T88rozV8SEW/yT6Gq9IZcpj8bozBdQZ1yXuZLVY4JEoHB2LHIDzzL4wV8L+8QT71
F4HDfosLMVfv0FxtmsF93kFtNAqAYzVLDYoLOWwTXMNeHHoU+NHWWdnRVz16nTPq
OP9B+u+VFX3rl//zNGs6e/OGKB15IMlFXD+eRV6S57btWOnPk476IquZFTmPp21H
bmGD7FHyftFzSa20xfFN45lJlDmQbNXO7ysh7pE/IDLQXNM9g32muolpzOhAlS0B
qUsO3o5awGAFZstZRTOPJ/J0P5VKf+SdoYkTPupRJaDQT0Fg43jpKrVxmqyi4ZJ4
V5r4YMdzwdFv0uTnqUyWmeopWp8XRwM+x3r002H7FjAON20F0HPys+0JtlOwOrA5
LaBe4hp61sssBeL1DGU6HUQb0jLPHoiCYaXsfgErEa1N7y9tkhvKocEIjrd080Gx
0sSW5YCBrYyK60h/+oKOKZK35YJnr1/aumYikGKVPKfvsPvwYug4/bKmy0uAWcV4
qrWVCBDuOLVWRyLorvm0fimnwHGxGJw7qLG5wzLMRnSzKAPBR5Y=
=f/eP
-----END PGP SIGNATURE-----

--rdj7zxh5vjncwfdy--
