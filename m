Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAD9C712253
	for <lists+linux-media@lfdr.de>; Fri, 26 May 2023 10:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242587AbjEZIgR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 May 2023 04:36:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242184AbjEZIgP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 May 2023 04:36:15 -0400
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8A9A12C
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 01:36:11 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34Q8ZtAX015325;
        Fri, 26 May 2023 03:35:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1685090155;
        bh=RvMlGZxjb2OXjBhFDyds0gvllSctdu8hRzyY8r68n9s=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=IWU0T7t4WpIOUKF1GMYPXw8pWkvNrXzQxejFeFvJmSCSiGZQPHCwI3A8/T8b0jOby
         99rV46z9KOTuEPhqsCQRgBvGxP0BTCr2tnXzsMFoWBF+njdDz3zOgqUhjYILY6IAhO
         9c/wjJTwoS0M8oVejBtCEogqpom7VdNlXvOyIgtE=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34Q8ZtaL074622
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 26 May 2023 03:35:55 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 May 2023 03:35:55 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 May 2023 03:35:55 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34Q8Zs2M043995;
        Fri, 26 May 2023 03:35:54 -0500
Date:   Fri, 26 May 2023 14:05:50 +0530
From:   Jai Luthra <j-luthra@ti.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Guoniu . zhou" <guoniu.zhou@nxp.com>, <slongerbeam@gmail.com>,
        <linux-media@vger.kernel.org>, <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH 0/2] media: ov5640: drive-by frame_interval cleanups
Message-ID: <2wjwwyg2y42vse6vj6376vzruieb4c7e6ruw5de4ivc42bonvz@jmruiyfr4wo4>
References: <20230505071619.63229-1-jacopo.mondi@ideasonboard.com>
 <52b0df19-ed9e-14cc-f9ab-e4a1d453524a@ti.com>
 <20230516074653.pf6kg3ebvrqvdnbv@lati>
 <3bj55lulknp3tkqiojvzfdt4t62pzxcvjyrx2jz4dpba2pawii@blwilnnvrh4r>
 <20230517090508.eunyw2ejht2mdlgi@lati>
 <ZG4BYJXWyg02D8lf@kekkonen.localdomain>
 <20230524130624.GG5094@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xndysbnnsieevces"
Content-Disposition: inline
In-Reply-To: <20230524130624.GG5094@pendragon.ideasonboard.com>
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

--xndysbnnsieevces
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent, Jacopo,

On May 24, 2023 at 16:06:24 +0300, Laurent Pinchart wrote:
> On Wed, May 24, 2023 at 12:21:52PM +0000, Sakari Ailus wrote:
> > On Wed, May 17, 2023 at 11:05:08AM +0200, Jacopo Mondi wrote:
> > > On Wed, May 17, 2023 at 01:29:13PM +0530, Jai Luthra wrote:
> > > > On May 16, 2023 at 09:46:57 +0200, Jacopo Mondi wrote:
> > > > > On Mon, May 15, 2023 at 05:25:55PM +0530, Jai Luthra wrote:
> > > > > > On 05/05/23 12:46, Jacopo Mondi wrote:
> > > > > > > While looking at Guoniu Zhou patches I noticed that there wer=
e a few cleanups
> > > > > > > related to the usage of frame_interval fileds for MIPI CSI-2 =
framerate
> > > > > > > calculations.
> > > > > > >
> > > > > > > No functional changes intended, just cleanups.
> > > > > > >
> > > > > > > Guoniu: could you please test these on your setup as well ? A=
 tested-by tag
> > > > > > > would be useful!
> > > > > > >
> > > > > >
> > > > > > Thanks for the latest fixes!
> > > > > >
> > > > > > Testing on my setup (CSI module w/ 2 lanes), I notice two weird=
 issues and
> > > > > > wonder if you see the same behavior on your setups?
> > > > > >
> > > > > > Issue 1
> > > > > > -------
> > > > > >
> > > > > > On a fresh boot the sensor streams at 60fps, and checking link_=
freq from
> > > > > > v4l2-ctl I get 384Mhz. But G_FRAME_INTERVAL returns 30FPS when =
using
> > > > > > `media-ctl -p`:
> > > > > > [stream:0 fmt:UYVY8_1X16/640x480@1/30]
> > > > >
> > > > > the g/s_frame_interval calls are not relevant for MIPI CSI-2
> > > > >
> > > > > I wonder if we should/could return -EINVAL in this case
> > > > >
> > > > >
> > > > > >
> > > > > > Issue 2
> > > > > > -------
> > > > > >
> > > > > > If I manually set the frame interval to @1/60 using media-ctl, =
and then
> > > > > > stream it - actual framerate gets reduced to 30FPS:
> > > > >
> > > > > Ah this shouldn't happen. s_frame_interval -should not- modify the
> > > > > timings on a CSI-2 setup
> > > > >
> > > > > If not returning -EINVAL, we should at least return immediately
> > > > >
> > > > > >
> > > > > > root@am62xx-evm:~# yavta -s 640x480 -f UYVY /dev/video0 -c5
> > > > > > ....
> > > > > > 0 (0) [-] any 0 614400 B 401.488754 401.488855 12.719 fps ts mo=
no/EoF
> > > > > > 1 (1) [-] any 1 614400 B 401.522057 401.522147 30.027 fps ts mo=
no/EoF
> > > > > > 2 (2) [-] any 2 614400 B 401.555434 401.555584 29.961 fps ts mo=
no/EoF
> > > > > > 3 (3) [-] any 3 614400 B 401.588723 401.588814 30.040 fps ts mo=
no/EoF
> > > > > > 4 (4) [-] any 4 614400 B 401.622051 401.622135 30.005 fps ts mo=
no/EoF
> > > > > > Captured 5 frames in 0.212005 seconds (23.584252 fps, 14490164.=
140730 B/s).
> > > > > > 8 buffers released.
> > > > > >
> > > > > > After setting frame interval to @1/60, the link-frequency got r=
educed to
> > > > > > 192Mhz, which probably explains the low framerate.
> > > > > >
> > > > > > root@am62xx-evm:~# v4l2-ctl -d /dev/v4l-subdev2 -C link_frequen=
cy
> > > > > > link_frequency: 19 (192000000 0xb71b000)
> > > > > >
> > > > > > I will take a deeper look at update_pixel_rate() function to tr=
y and fix
> > > > > > this - but wanted to confirm if this also happens on your CSI s=
ensors?
> > > > > >
> > > > > > I also repeated same tests without this series and still saw bo=
th issues. In
> > > > > > fact Issue 2 was worse because the sensor did not stream *at al=
l* if I
> > > > > > changed frame interval to @1/60. My guess is PATCH 2/2 fixes th=
at by not
> > > > > > updating the VBLANK using the DVP values.
> > > > >
> > > > > Probably yes, and this confirms to me that we should return early=
 in
> > > > > s_frame_interval if we're CSI-2 (or if this doesn't contradict the
> > > > > specification even return an error).
> > > >
> > > > Oh makes sense, thanks.
> > > >
> > > > I can update s_frame_interval to return -EINVAL for CSI-2 as a foll=
ow-up
> > > > series.
> > > >
> > > > Will also try if g_frame_interval can report correct framerate (60f=
ps vs
> > > > 30fps) depending upon the bus type, as I don't think returning -EIN=
VAL
> > > > would be correct behavior. If that does not work maybe we can unset=
 the
> > > > ops hooks before registering the subdev with the framework.
> > >=20
> > > I would rather considering disabling the whole s/g/enum_frame_interval
> > > operations in CSI-2 mode.
> > >=20
> > > The specification report as an accepted error code
> > >=20
> > > EINVAL
> > > The struct v4l2_subdev_frame_interval pad references a non-existing
> > > pad, or the pad doesn't support frame intervals.
> > >=20
> > > https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc=
-subdev-g-frame-interval.html
> > >=20
> > > Hans Sakari and Laurent in cc: would it be acceptable to disable the
> > > frame_interval operations completely when the sensor is used in MIPI
> > > CSI-2 mode and only allow them in parallel mode ? Is returning -EINVAL
> > > acceptable in that case ?
> >=20
> > I don't think the bus *should* really make a difference. The driver has
> > supported s_frame_interval in the past and drop that support completely
> > likely would cause issues.
> >=20
> > Although --- if in this case supporting s_frame_interval just for paral=
lel
> > really helps keeping the driver somehow sane and doesn't break anything=
, I
> > have no objections.
> >=20
> > -EINVAL works for me.
>=20
> I'd rather drop it in both cases, but for parallel mode I believe it
> could cause regressions.

Thanks, I can send a follow-up series to return -EINVAL for=20
[gs]_frame_interval ops when in MIPI mode.

---

Although I noticed one issue with fixing the framerate to 60fps for=20
640x480 (VGA) mode -- it does not work with all the MIPI CSI-2 modules I=20
have available for testing:
1. Digilent PCam5C
2. ALINX AN5641
3. Technexion TEVI-OV5640-RPI

Module 3 works fine at both 60fps and 30fps for VGA mode.

Module 1 and 2 work with 30fps, but give blank (black) frames at the=20
default link frequency (which is at 60fps).

The XVCLK for module 1 & 2 is 12Mhz while for module 3 it is 24Mhz, so I=20
suspect some issue in the sensor clock tree.

Surprisingly 1024x768@1/30 works fine on all modules, which is at the=20
same link frequency (384Mhz) as 640x480@1/60 so I don't think the issue=20
is around achieving a high MIPI clock with the lower XVCLK.

---

Jacopo,

Would it be acceptable to bump down the default link frequency to 192Mhz=20
instead of 384Mhz (and thus framerate fixed to 30fps for VGA) in my=20
follow-up series?

Once I can debug the issue with clock tree, we can bump it back up to=20
384Mhz/60fps.

>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

Thanks,
Jai

--xndysbnnsieevces
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmRwb1YACgkQQ96R+SSa
cUXe7g/9GWZ6jXhaEG1pUx19cmwRzNINyYlhmoW7/adOI08E+hZw0XHd+yK12B8e
CvCGyJAEIF3bc0g4iVbLdNlE9koDD2/Yr16L2IKhDtYFBTTQ3NbByfsB2GCjKn5V
fHasH9qXy3amKClloIX/3Apj42ji+dTgKG2M5EJhnPqu677Vp54J1wNGHi9jm1fu
ncddxr+LDxZvJBAM3LKwXG7h/G+n5mAVVFa1FUjvJsAtTq0HLtOiNAeQvz76VI7/
WjE51PkJYP7E9Hh93KM/BlHsbwGUXTS+a3TIo05CuLcwF/6x+n5t+Kx2ikQSVyRl
ARe4WDPnW5uBm/4A8c92Kq6oRLH30QTz8Cav+jDw1Gdx1TSGUNWgY/cjRXWrQ/3K
vDQBKIyjtYgEICEnDGoCaccPIaxxhDMkXLhBj2qaA92aJXCS7wM3Ri//Fvne/usT
Rg2clgPKO2uipVImV7NLNsbE6zGrH75lYzeaMRAdpeqYE1xmx93FU3m6noInMQWN
JztJYWy70By+JT5lzLmqrfCgiFpwQ8VHyXUGVG5H/KlhYprFSNEUrG5wWiZWFNaf
THt6+YcWZgKR4CoE4q/72riyxWu2Ufx1fuC989pkxVifGhAeN1qRDoSPiw12LeLY
T+Zos+wPBssaKyJayJEQ9p4Hy2qCB0jXJnOdUtTeGkou5hPUF/8=
=r9TA
-----END PGP SIGNATURE-----

--xndysbnnsieevces--
