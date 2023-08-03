Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A876276E3B4
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 10:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234857AbjHCI42 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 04:56:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234854AbjHCI4X (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 04:56:23 -0400
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 432DCE46
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 01:56:21 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3738uA1W129631;
        Thu, 3 Aug 2023 03:56:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1691052970;
        bh=7ke8E0923ouTuKawO+UVRBv9qNC3IdcBYhbv62fSSCo=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=dAL4jJm5qZdsDUtQa0nXDFToWZkjylsjkyzo92EgSPRSbbAwpGRXEGfwTUOGvqV9c
         mueu7IbjspsUuV6Bi7FSy3FzV44oW+30GP4ZYGi/IK2aFu6lNd3nBnzmQ3+DZi60I/
         idc+CeIRFCH38JVIJg2u16wk48qbVDOqh9A93SPU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3738uAsr124085
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 3 Aug 2023 03:56:10 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 3
 Aug 2023 03:56:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 3 Aug 2023 03:56:09 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3738u8K0014523;
        Thu, 3 Aug 2023 03:56:09 -0500
Date:   Thu, 3 Aug 2023 14:26:13 +0530
From:   Jai Luthra <j-luthra@ti.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Marek Vasut <marex@denx.de>
CC:     <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH] media: ov5640: Fix initial RESETB state and annotate
 timings
Message-ID: <c5qeirmofhsfcef5oz32h76z4jcud6bklg3sixcvfpu2dobxpt@dxlnvlcgti42>
References: <20230724222116.162555-1-marex@denx.de>
 <4ileh7epyghpyy4sldufzgbssdplpli7motchwo2gosf3grxst@dnvnxfdm5mlv>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="22cdyahyuy6soi3q"
Content-Disposition: inline
In-Reply-To: <4ileh7epyghpyy4sldufzgbssdplpli7motchwo2gosf3grxst@dnvnxfdm5mlv>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--22cdyahyuy6soi3q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Marek, Jacopo,
On Jul 25, 2023 at 11:09:20 +0200, Jacopo Mondi wrote:
> Cc Jai which has recently changed this part to accomodate a design
> where RESETB and PWDN are not exposed as separate lines
>=20
> On Tue, Jul 25, 2023 at 12:21:16AM +0200, Marek Vasut wrote:
> > The initial state of RESETB input signal of OV5640 should be
> > asserted, i.e. the sensor should be in reset. This is not the
> > case, make it so.
> >
> > Since the subsequent assertion of RESETB signal is no longer
> > necessary and the timing of the power sequencing could be
> > slightly adjusted, add annotations to the delays which match
> > OV5640 datasheet rev. 2.03, both:
> >   figure 2-3 power up timing with internal DVDD
> >   figure 2-4 power up timing with external DVDD source
> >
> > The 5..10ms delay between PWDN assertion and RESETB assertion
> > is not even documented in the power sequencing diagram, and
> > with this reset fix, it is no longer even necessary.
> >
> > Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
> > Reported-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > ---
> > Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Cc: Steve Longerbeam <slongerbeam@gmail.com>
> > Cc: linux-media@vger.kernel.org
> > ---
> >  drivers/media/i2c/ov5640.c | 11 ++++-------
> >  1 file changed, 4 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index 7c065c39082dd..74b58380b5e69 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -2452,16 +2452,13 @@ static void ov5640_power(struct ov5640_dev *sen=
sor, bool enable)
> >  static void ov5640_powerup_sequence(struct ov5640_dev *sensor)
> >  {
> >  	if (sensor->pwdn_gpio) {
> > -		gpiod_set_value_cansleep(sensor->reset_gpio, 0);
> > +		gpiod_set_value_cansleep(sensor->reset_gpio, 1);
> >
> >  		/* camera power cycle */
> >  		ov5640_power(sensor, false);
>=20
> This is also probably a NOP for most designs but the one Jai had, as
> in his case a single "powerdown" line controls both PWDN and RESETB
> with some internal circuitry that handles signals inversions and
> delays. So I guess it is fine to have it here.
>=20

Yes the modules in question are -
    - Digilent PCam 5C
    - ALINX AN5641
    - TEVI-OV5640-*-RPI

All of them have a 15-pin FFC (RPi) compatible connector.

> > -		usleep_range(5000, 10000);
> > +		usleep_range(5000, 10000);	/* t2 */
> >  		ov5640_power(sensor, true);
> > -		usleep_range(5000, 10000);

I remember noticing this before, but chose to keep it around as the=20
above mentioned modules have a 5.5ms + 1ms delay mentioned in the=20
schematics [1] between toggling the weird "PWUP" gpio to the RESET=20
actually getting toggled.

But in my tests your patch is not breaking any of those modules, and=20
this delay does look very redundant from driver p.o.v. so I am happy=20
with removing it here.

In future if I face any issues I will try to come up with a better=20
approach that does not add redundant delays for modules that don't=20
perform magical delays on-board like those three special ones :)

[1]=20
https://digilent.com/reference/_media/reference/add-ons/pcam-5c/pcam_5c_sch=
=2Epdf

> > -
> > -		gpiod_set_value_cansleep(sensor->reset_gpio, 1);
> > -		usleep_range(1000, 2000);
> > +		usleep_range(1000, 2000);	/* t3 */
> >
> >  		gpiod_set_value_cansleep(sensor->reset_gpio, 0);
> >  	} else {
> > @@ -2469,7 +2466,7 @@ static void ov5640_powerup_sequence(struct ov5640=
_dev *sensor)
> >  		ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0,
> >  				 OV5640_REG_SYS_CTRL0_SW_RST);
> >  	}
> > -	usleep_range(20000, 25000);
> > +	usleep_range(20000, 25000);	/* t4 */
>=20
>=20
> This all looks good to me
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>=20
> Jai could you give this a run to make sure this works on your setup as
> well ?
>=20

Works on BeaglePlay and SK-AM62 (with my CSI v8 series applied on next)

Tested-by: Jai Luthra <j-luthra@ti.com>

> Thanks
>   j
>=20
> >
> >  	/*
> >  	 * software standby: allows registers programming;
> > --
> > 2.40.1
> >
>=20

--=20
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145

--22cdyahyuy6soi3q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmTLa6oACgkQQ96R+SSa
cUVsfw//RQAUUbQbmnFVoEKsnHythj8lMWMqLPUipOKdgTKOlOCS7SFdDxI510QV
gKwefl8RhJ8JsN0Gtx6ZRMA9oqSCKMs/mNzyeZE36M2DWOHE4b8jNxLvSPdfVV90
66rMTzxGhFjwbij5Snqu4S3qL/4rHNqmTk6XyVJ+B5SJMwNJPTOHmS5r2mBTSsGx
gTNYFoirTV+Bhw7Cng3gzy228vYlzMqmWfAU782cBTtXSqpOt+ngeVl6jkXC5O12
+3Yj7fi5fVxDrYUgZ2el94+XwYx2GoG7oeqJA/5v+59Fc9npFUiF+ZU+WPL5mphu
KlGD3Pdn5zZUCdGa95dKaPfKi4joDvJ/fZ4JJbcUKrPZSmKa6ak9JX5/iB/I1h19
iITKvKFm5kHgbYNJxYw4tRN1bZjgzLUFGM0QO1CbVfUeMr14ScrEWzdiShUU/2JK
laZQh8lIYXYFnQm5aLWQ3jQ9f1rrGGGncKQfkfAqnNKI/7CIRjnhP5EP5plXxvTK
Fy5mF4A71XcCvjRdDdz6TbzTv4HIjBZ/5SG9a5z16p1ewV65rCCRQU2eKUsJQbRs
OsHCPB6XcPt96rffCipFT7lAleYjYtNE2vBHWOH+wiPccAsyPjp1bkA7aZo9YLRk
6mxLtWEt7nLfaolPkjBcNBC6RgzW+htbKTGiE+lDfZ7GHmBbBMU=
=xbUK
-----END PGP SIGNATURE-----

--22cdyahyuy6soi3q--
