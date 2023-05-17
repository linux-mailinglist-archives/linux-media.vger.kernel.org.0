Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90C66706210
	for <lists+linux-media@lfdr.de>; Wed, 17 May 2023 10:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230469AbjEQIA0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 May 2023 04:00:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230312AbjEQH70 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 03:59:26 -0400
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4CCA40CC
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 00:59:23 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34H7xDK7017322;
        Wed, 17 May 2023 02:59:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1684310353;
        bh=2tcoeqKFVCsLXkm3Vfy15yz3mcsM4H5N/4TjkTmLdkI=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=COryYznyrQNxchCTl9gU1mXrmkKZ7iqJ6A3VGhhTWrM2Wrm3CQZ0BX6fvpqnprpvo
         nbmNq5IqGtjMaPToD0Q1daS4HDN+WKF0IcS/350ZlyIwbXK3pccefeQVhdsP1NvSlV
         t7Tdo5vC3BJaClJebr8nBOPqadXgedWbZ4/zOkbM=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34H7xDWm026647
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 17 May 2023 02:59:13 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 17
 May 2023 02:59:13 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 17 May 2023 02:59:13 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34H7xCsm056780;
        Wed, 17 May 2023 02:59:13 -0500
Date:   Wed, 17 May 2023 13:29:13 +0530
From:   Jai Luthra <j-luthra@ti.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC:     "Guoniu . zhou" <guoniu.zhou@nxp.com>, <slongerbeam@gmail.com>,
        <linux-media@vger.kernel.org>, <mchehab@kernel.org>
Subject: Re: [PATCH 0/2] media: ov5640: drive-by frame_interval cleanups
Message-ID: <3bj55lulknp3tkqiojvzfdt4t62pzxcvjyrx2jz4dpba2pawii@blwilnnvrh4r>
References: <20230505071619.63229-1-jacopo.mondi@ideasonboard.com>
 <52b0df19-ed9e-14cc-f9ab-e4a1d453524a@ti.com>
 <20230516074653.pf6kg3ebvrqvdnbv@lati>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nhtpn4mjuuxzp4ol"
Content-Disposition: inline
In-Reply-To: <20230516074653.pf6kg3ebvrqvdnbv@lati>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--nhtpn4mjuuxzp4ol
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jacopo,

On May 16, 2023 at 09:46:57 +0200, Jacopo Mondi wrote:
> Hi Jai,
>    thanks for testing
>=20
> On Mon, May 15, 2023 at 05:25:55PM +0530, Jai Luthra wrote:
> > Hi Jacopo, Guoniu,
> >
> > On 05/05/23 12:46, Jacopo Mondi wrote:
> > > While looking at Guoniu Zhou patches I noticed that there were a few =
cleanups
> > > related to the usage of frame_interval fileds for MIPI CSI-2 framerate
> > > calculations.
> > >
> > > No functional changes intended, just cleanups.
> > >
> > > Guoniu: could you please test these on your setup as well ? A tested-=
by tag
> > > would be useful!
> > >
> >
> > Thanks for the latest fixes!
> >
> > Testing on my setup (CSI module w/ 2 lanes), I notice two weird issues =
and
> > wonder if you see the same behavior on your setups?
> >
> > Issue 1
> > -------
> >
> > On a fresh boot the sensor streams at 60fps, and checking link_freq from
> > v4l2-ctl I get 384Mhz. But G_FRAME_INTERVAL returns 30FPS when using
> > `media-ctl -p`:
> > [stream:0 fmt:UYVY8_1X16/640x480@1/30]
>=20
> the g/s_frame_interval calls are not relevant for MIPI CSI-2
>=20
> I wonder if we should/could return -EINVAL in this case
>=20
>=20
> >
> > Issue 2
> > -------
> >
> > If I manually set the frame interval to @1/60 using media-ctl, and then
> > stream it - actual framerate gets reduced to 30FPS:
>=20
> Ah this shouldn't happen. s_frame_interval -should not- modify the
> timings on a CSI-2 setup
>=20
> If not returning -EINVAL, we should at least return immediately
>=20
> >
> > root@am62xx-evm:~# yavta -s 640x480 -f UYVY /dev/video0 -c5
> > ....
> > 0 (0) [-] any 0 614400 B 401.488754 401.488855 12.719 fps ts mono/EoF
> > 1 (1) [-] any 1 614400 B 401.522057 401.522147 30.027 fps ts mono/EoF
> > 2 (2) [-] any 2 614400 B 401.555434 401.555584 29.961 fps ts mono/EoF
> > 3 (3) [-] any 3 614400 B 401.588723 401.588814 30.040 fps ts mono/EoF
> > 4 (4) [-] any 4 614400 B 401.622051 401.622135 30.005 fps ts mono/EoF
> > Captured 5 frames in 0.212005 seconds (23.584252 fps, 14490164.140730 B=
/s).
> > 8 buffers released.
> >
> > After setting frame interval to @1/60, the link-frequency got reduced to
> > 192Mhz, which probably explains the low framerate.
> >
> > root@am62xx-evm:~# v4l2-ctl -d /dev/v4l-subdev2 -C link_frequency
> > link_frequency: 19 (192000000 0xb71b000)
> >
> > I will take a deeper look at update_pixel_rate() function to try and fix
> > this - but wanted to confirm if this also happens on your CSI sensors?
> >
> > I also repeated same tests without this series and still saw both issue=
s. In
> > fact Issue 2 was worse because the sensor did not stream *at all* if I
> > changed frame interval to @1/60. My guess is PATCH 2/2 fixes that by not
> > updating the VBLANK using the DVP values.
>=20
> Probably yes, and this confirms to me that we should return early in
> s_frame_interval if we're CSI-2 (or if this doesn't contradict the
> specification even return an error).

Oh makes sense, thanks.

I can update s_frame_interval to return -EINVAL for CSI-2 as a follow-up=20
series.

Will also try if g_frame_interval can report correct framerate (60fps vs=20
30fps) depending upon the bus type, as I don't think returning -EINVAL=20
would be correct behavior. If that does not work maybe we can unset the=20
ops hooks before registering the subdev with the framework.

>=20
> Thanks
>    j
>=20
> >
> > For the series:
> >
> > Tested-by: Jai Luthra <j-luthra@ti.com>
> >
> > Thanks,
> > Jai
> >
> > > Thanks
> > >    j
> > >
> > > Jacopo Mondi (2):
> > >    media: ov5640: Remove unused 'framerate' parameter
> > >    media: ov5640: Drop dead code using frame_interval
> > >
> > >   drivers/media/i2c/ov5640.c | 17 +----------------
> > >   1 file changed, 1 insertion(+), 16 deletions(-)
> > >
> > > --
> > > 2.40.1
> > >
>=20
>=20
>=20
>=20
>=20



--nhtpn4mjuuxzp4ol
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmRkiVAACgkQQ96R+SSa
cUUWaQ//dI5GLdIdk5xQglkZW0IafVkSDpj2YBjZbZFCjFjPs6DOBRMuqI4B0rUC
LNNZIhGT5OnAWJyGY8s4bp4ldnUfCgK2DOPxZaS/OkXwfEpPs4Nwx4DuW9beOLY1
OlCGQT1zuUgbYPl57Be2VxvqPpu49m2JHYLsB1Q8K+idOb47KtO9vOrEpx5ljvo9
F76F2N8DKeiN41D8jdhFZcP639qOnz/5d9C/F6AAQrm1ASTbeyx2vmbvHwaq2+/4
qPT4m1eys0ZqFlQAnp+Om5XXtFrQUsX/bnNrhTuSRs30JeaxtxLNv19DN7MhaMzG
T5d9pOhn40WCD3CLBmsyDsjH5DgUk2K9l5pfGX7PWDYqQyN9FE4ckpz+zS8Qhfjt
c5xTJTf1Kw2LH9vcu5shVgxWQ4kcQr9bU86hOnEOnnkCTk2ej59UmIO7AQNUGc4X
b5mvrEn7azyuZfKBBR2brFagw7fJfWIiObvemxpb37tvPGnzhkVUDD0zXZEwvBny
OKtLrXZ3jEoG5F/AC/8v1n0kygIV3xOqp5h+yaR6aj+Krqw7pRdHds0qBZ2bxyd/
ef8mB7VxtsR2WLYxmc22eNttAIP/yie0HFTLwTOX1LhcKpxnG81VfsZ5YZuAC7L/
W10k8ObYxubVURxuOxDZH0/52hF5WLd09mE04SGlM/wcWCsZ0Ww=
=3puX
-----END PGP SIGNATURE-----

--nhtpn4mjuuxzp4ol--
