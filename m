Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 936FF706396
	for <lists+linux-media@lfdr.de>; Wed, 17 May 2023 11:05:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbjEQJFw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 May 2023 05:05:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbjEQJFs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 05:05:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6820959C7
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 02:05:19 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 46800E79;
        Wed, 17 May 2023 11:05:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1684314305;
        bh=icmYpX73aM8763+tXMp3r/SpNC4nbSloOIk2ELSXNkM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mz7Rw5UY5Tv8JSIplc412GFmf1gyepJ69X1UQHBhHyEwduYhiFZZFjBi0cRcZ4+sz
         zsPE1VKHwfIWxS89rfSQeqvbgRWNk37tbTdI1uJv+xTtdKxTirj1VKTUUzIX7eb2ZK
         TqcQ43WcX+p3hw0frtqNi69jWFs/64s5PIpBUOPw=
Date:   Wed, 17 May 2023 11:05:08 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Jai Luthra <j-luthra@ti.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        "Guoniu . zhou" <guoniu.zhou@nxp.com>, slongerbeam@gmail.com,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 0/2] media: ov5640: drive-by frame_interval cleanups
Message-ID: <20230517090508.eunyw2ejht2mdlgi@lati>
References: <20230505071619.63229-1-jacopo.mondi@ideasonboard.com>
 <52b0df19-ed9e-14cc-f9ab-e4a1d453524a@ti.com>
 <20230516074653.pf6kg3ebvrqvdnbv@lati>
 <3bj55lulknp3tkqiojvzfdt4t62pzxcvjyrx2jz4dpba2pawii@blwilnnvrh4r>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="74bi3ahqfsnbshdg"
Content-Disposition: inline
In-Reply-To: <3bj55lulknp3tkqiojvzfdt4t62pzxcvjyrx2jz4dpba2pawii@blwilnnvrh4r>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--74bi3ahqfsnbshdg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Subject: Re: [PATCH 0/2] media: ov5640: drive-by frame_interval cleanups
MIME-Version: 1.0

Hi Jai

On Wed, May 17, 2023 at 01:29:13PM +0530, Jai Luthra wrote:
> Hi Jacopo,
>
> On May 16, 2023 at 09:46:57 +0200, Jacopo Mondi wrote:
> > Hi Jai,
> >    thanks for testing
> >
> > On Mon, May 15, 2023 at 05:25:55PM +0530, Jai Luthra wrote:
> > > Hi Jacopo, Guoniu,
> > >
> > > On 05/05/23 12:46, Jacopo Mondi wrote:
> > > > While looking at Guoniu Zhou patches I noticed that there were a few cleanups
> > > > related to the usage of frame_interval fileds for MIPI CSI-2 framerate
> > > > calculations.
> > > >
> > > > No functional changes intended, just cleanups.
> > > >
> > > > Guoniu: could you please test these on your setup as well ? A tested-by tag
> > > > would be useful!
> > > >
> > >
> > > Thanks for the latest fixes!
> > >
> > > Testing on my setup (CSI module w/ 2 lanes), I notice two weird issues and
> > > wonder if you see the same behavior on your setups?
> > >
> > > Issue 1
> > > -------
> > >
> > > On a fresh boot the sensor streams at 60fps, and checking link_freq from
> > > v4l2-ctl I get 384Mhz. But G_FRAME_INTERVAL returns 30FPS when using
> > > `media-ctl -p`:
> > > [stream:0 fmt:UYVY8_1X16/640x480@1/30]
> >
> > the g/s_frame_interval calls are not relevant for MIPI CSI-2
> >
> > I wonder if we should/could return -EINVAL in this case
> >
> >
> > >
> > > Issue 2
> > > -------
> > >
> > > If I manually set the frame interval to @1/60 using media-ctl, and then
> > > stream it - actual framerate gets reduced to 30FPS:
> >
> > Ah this shouldn't happen. s_frame_interval -should not- modify the
> > timings on a CSI-2 setup
> >
> > If not returning -EINVAL, we should at least return immediately
> >
> > >
> > > root@am62xx-evm:~# yavta -s 640x480 -f UYVY /dev/video0 -c5
> > > ....
> > > 0 (0) [-] any 0 614400 B 401.488754 401.488855 12.719 fps ts mono/EoF
> > > 1 (1) [-] any 1 614400 B 401.522057 401.522147 30.027 fps ts mono/EoF
> > > 2 (2) [-] any 2 614400 B 401.555434 401.555584 29.961 fps ts mono/EoF
> > > 3 (3) [-] any 3 614400 B 401.588723 401.588814 30.040 fps ts mono/EoF
> > > 4 (4) [-] any 4 614400 B 401.622051 401.622135 30.005 fps ts mono/EoF
> > > Captured 5 frames in 0.212005 seconds (23.584252 fps, 14490164.140730 B/s).
> > > 8 buffers released.
> > >
> > > After setting frame interval to @1/60, the link-frequency got reduced to
> > > 192Mhz, which probably explains the low framerate.
> > >
> > > root@am62xx-evm:~# v4l2-ctl -d /dev/v4l-subdev2 -C link_frequency
> > > link_frequency: 19 (192000000 0xb71b000)
> > >
> > > I will take a deeper look at update_pixel_rate() function to try and fix
> > > this - but wanted to confirm if this also happens on your CSI sensors?
> > >
> > > I also repeated same tests without this series and still saw both issues. In
> > > fact Issue 2 was worse because the sensor did not stream *at all* if I
> > > changed frame interval to @1/60. My guess is PATCH 2/2 fixes that by not
> > > updating the VBLANK using the DVP values.
> >
> > Probably yes, and this confirms to me that we should return early in
> > s_frame_interval if we're CSI-2 (or if this doesn't contradict the
> > specification even return an error).
>
> Oh makes sense, thanks.
>
> I can update s_frame_interval to return -EINVAL for CSI-2 as a follow-up
> series.
>
> Will also try if g_frame_interval can report correct framerate (60fps vs
> 30fps) depending upon the bus type, as I don't think returning -EINVAL
> would be correct behavior. If that does not work maybe we can unset the
> ops hooks before registering the subdev with the framework.
>

I would rather considering disabling the whole s/g/enum_frame_interval
operations in CSI-2 mode.

The specification report as an accepted error code

EINVAL
The struct v4l2_subdev_frame_interval pad references a non-existing
pad, or the pad doesn't support frame intervals.

https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.html

Hans Sakari and Laurent in cc: would it be acceptable to disable the
frame_interval operations completely when the sensor is used in MIPI
CSI-2 mode and only allow them in parallel mode ? Is returning -EINVAL
acceptable in that case ?

> >
> > Thanks
> >    j
> >
> > >
> > > For the series:
> > >
> > > Tested-by: Jai Luthra <j-luthra@ti.com>
> > >
> > > Thanks,
> > > Jai
> > >
> > > > Thanks
> > > >    j
> > > >
> > > > Jacopo Mondi (2):
> > > >    media: ov5640: Remove unused 'framerate' parameter
> > > >    media: ov5640: Drop dead code using frame_interval
> > > >
> > > >   drivers/media/i2c/ov5640.c | 17 +----------------
> > > >   1 file changed, 1 insertion(+), 16 deletions(-)
> > > >
> > > > --
> > > > 2.40.1
> > > >
> >
> >
> >
> >
> >
>
>



--74bi3ahqfsnbshdg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAmRkmMMACgkQcjQGjxah
VjznyhAAnJfIw+HYOXmrt5QzGuSHe65PlmwqDOOddx/xEHdknROkeanz8o83LtQC
Wpa0jFLblY94umxhC5Un0bKXcL2eLz9xZ3wibutR1BA/dqvStbUpKWQS8na+2fBZ
eZvhXj46rLUi/K0mSPPtrk4nfto7YjYCx3pSFPQn84UzBdH64ZggN6pozl7pAMaI
+3XkVvuTbh4gLtb4mRUUJ5UWsbnJMk9mbVsLq0tOxzrJjSXahB3uvkb0Kw7T+Ggc
i7mAce/qvaaQzkouzoU0l+AAM1lsZEhykVdmT/Nj3yudqfbTOO/gImEYLu9dKFaD
mELQhbNbfQM4kLtV2YD3JtMIGBDDKFQnIn6ifTChGab2nFA8x/1IQAz4v8+GtTCE
Ct+N5nxkfyQMUwOBjLt5595luOz7isEd43CXT7eqXyYG/IOhUHytTc/o+ep1s9NW
TMXhwvrdi3v5z/OOzaTDXeUrslHISpVbwB+7/Xulvu8KzkbK6g4drFfjS7MvTM04
oLLx8DnpAuYgykf7RxbiUZ6bMNpjmszj1/h3CuBN8rzqSrlun6gPRsc/4syjSvJL
wXcYTMexGGW0u6J7f5uLpNT0WF+4sc6Ixfkib2mBwfDSi1msLeNsxm2i5F/clWxx
T6JdEPjLJPknp0HA470PJxQiPE9UnrkC6Q+MPKPNG81+Y8kg5Yw=
=HqY/
-----END PGP SIGNATURE-----

--74bi3ahqfsnbshdg--
