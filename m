Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCC7663F67
	for <lists+linux-media@lfdr.de>; Tue, 10 Jan 2023 12:45:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231524AbjAJLpY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Jan 2023 06:45:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230483AbjAJLpW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Jan 2023 06:45:22 -0500
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4711F50F68
        for <linux-media@vger.kernel.org>; Tue, 10 Jan 2023 03:45:21 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 123EDC0010;
        Tue, 10 Jan 2023 11:45:18 +0000 (UTC)
Date:   Tue, 10 Jan 2023 12:45:18 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Pekka Paalanen <ppaalanen@gmail.com>
Cc:     Sophie Friedrich <lkml@flowerpot.me>, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Subject: Re: Potential integration of thermal cameras into v4l
Message-ID: <20230110114518.cp3bitj4hketc2ix@uno.localdomain>
References: <e9da9461-240e-f5b4-089e-378b85734632@flowerpot.me>
 <20230110104626.23f476df@ferris.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="m5jn6lkfpgjpkl5r"
Content-Disposition: inline
In-Reply-To: <20230110104626.23f476df@ferris.localdomain>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--m5jn6lkfpgjpkl5r
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Potential integration of thermal cameras into v4l
MIME-Version: 1.0

Hi Sophie and Pekka

On Tue, Jan 10, 2023 at 10:46:26AM +0200, Pekka Paalanen wrote:
> On Sat, 7 Jan 2023 22:58:41 +0100
> Sophie Friedrich <lkml@flowerpot.me> wrote:
>
> > Hello people,
> >
> > over the past months I've written a driver for the Guide MobIR Air=C2=B9
> > USB-C thermal camera. The driver uses v4l2loopback and runs in user
> > space with python.=C2=B2 The driver manages camera state, calibration a=
nd
> > conversion of the raw microbolometer to temperature values.
> >
> > In my research I couldn't find any mentions of a thermal camera support
> > in the Linux kernel nor the media subsystem, so I assume I'm the first
> > to ask here and we would presumably need lay out some ground work.
> >
> > The current camera driver outputs the temperature in the Y16 format as
> > Kelvin * 100 (i.e. 28056 (raw) -> 280.56K -> 7.41=C2=B0C). This allows =
for
> > further processing down the line with i.e. OpenCV, but has its
> > limitations. Especially as temps of only up to 382.2=C2=B0C can be disp=
layed
> > currently.
> >
> > Does it seem feasible to integrate support for thermal cameras in the
> > Linux kernel and more specifically in the v4l2 subsystem?
>
> Hi,
>
> since no-one else replied to you yet, I thought to mention my 2c
> (I don't really do camera stuff myself so far):
>
> Perhaps the best place is to reach out to the libcamera community:
> https://libcamera.org/
>

cc-ed the libcamera list

I agree it would be interesting to better understand what you mean by
driver here.

The camera seems to be a UVC camera, does it deliver frames with the
current UVC driver or do you need kernel patches to support it ?

I would also be interested why it needs to go through v4l2loopback..

> It sounds to me like you want to do some hardware-specific
> processing in userspace, and it might not be great to try to come
> up with a generic thermal camera API at the kernel UAPI level.
> That's where libcamera fits in.
>
> As for the pixel type, maybe use a floating-point type to avoid
> range/precision problems? E.g. DRM_FORMAT_R32F for application
> facing API. That format does not seem to exist yet, but it's
> trivial to add into kernel's drm_fourcc.h and should be well
> accepted IMO.
>
>
> Thanks,
> pq
>
> >
> > [1]:
> > https://www.guideir.com/products/mobileaccessories/mobirair/data_300.ht=
ml
> > [2]: https://github.com/tyalie/pyMobirAir-v4l2/

This link is broken :)




--m5jn6lkfpgjpkl5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAmO9T84ACgkQcjQGjxah
VjwMSQ//Y/WlnH7FW7DLeE9gDUOyVOuWjSeBGpOF6TQ/jRPCItECu0ys9AHGlgpE
IWD1QOkbeqHhhJdFdan1b8xyFWoQ74y9Exp+i9m53R8BEF+DwsogfdY/NEC4Ipnj
beiOyj66wTOKtepQpvUcNCOx1QODBxB0s/plnC0M6Y5001v78+aBvvVY7elL7/5N
JTqaJkbUxRH4oKg0R/hcB5ndg7yLqexH/AopMOB3w0VYCfuW8+HcUcFA1i/lfWU6
yEtFbRyV3Fr8+M2qhCJfIQNxQKgKDXbM8RmhcpTBzmEEcOk0AlPhRZA5J1G/0gyb
0AG5GODa41MHtD1Rnj4WgNk4/TUrmoPp95NvdKh3ScdlgKij8ltLcOcCwEwLzRM9
hpB67YpWrUVEGZbYh1DciC2AmJQ359giBKNiZfYVORf3AF8CqmZVWdWoMJTYiZTR
vh5lOP6nHKN0KgFrtxuZne0FNTmJ+HrRos/HZe/ICjcKtOuxjv9W37qknxnrBoWZ
l2h5wsjCRIUdBvQc6aRKFMJYQCouqaMNdPaop3XCA1jfkbrTCoTY6+UzUL2aEOdL
W+X0gK7XAz93IgDnEhlzOmMfSuO0C/S5F6o3zvMHQGkYZjeyqtQMrI1kaxiBu+YN
u0WOGK9bjz2UNTGKwLjcemgZpFX1WYCLQdORKxpNvay1MB+g2UI=
=25yk
-----END PGP SIGNATURE-----

--m5jn6lkfpgjpkl5r--
