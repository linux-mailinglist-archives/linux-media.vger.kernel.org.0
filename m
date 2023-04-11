Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9002B6DD45A
	for <lists+linux-media@lfdr.de>; Tue, 11 Apr 2023 09:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230046AbjDKHip (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Apr 2023 03:38:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbjDKHin (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Apr 2023 03:38:43 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 802071BD1
        for <linux-media@vger.kernel.org>; Tue, 11 Apr 2023 00:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681198721; x=1712734721;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/5ImStrCNkOSEhk1rU8iK73uCIQtHjuNNDeLBjo5jds=;
  b=bOAoSyYKKq/Z3zigMbNu2Gmb2MbzVx2gNK/W4FwMU9EZSnAmGpI6YCVa
   xOyk/0MW4fHue9PvVK/gPom0wb3FpUCTIMrb91B2ztIb3fW1iltDBRtu2
   rZHapRqioIUGUm1F7wAa3OiezVlX+LvwUzu1ntbo+Cehjr9I1Uxxuzi+m
   uavs4x+M+OvzJisafPc4M9PYzqrq6BSucZgFpc5mHmQe79bEDid96HrOx
   LPr0wChguirXOh9Yq3ovuZZW2rosfL5RmqR0dLXIMnhJcTwL9ynV3r3Xx
   qIdT+PRHoOaHP0gXbNGkY7hrUzztJ299S/ooi/9lR82Ns+BnA7HrJ1I0O
   g==;
X-IronPort-AV: E=Sophos;i="5.98,336,1673910000"; 
   d="scan'208";a="30239411"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 11 Apr 2023 09:38:39 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 11 Apr 2023 09:38:39 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 11 Apr 2023 09:38:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681198719; x=1712734719;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/5ImStrCNkOSEhk1rU8iK73uCIQtHjuNNDeLBjo5jds=;
  b=eun3SMDhNRmPwVhAnGb1p17efZR/JDmdMmd/8MqTbBedJrO7q+eKPDuf
   uyTxoXlG2aSpnpWv/w7MSNqTKav9hy8YqgwoBFgneTdyTzFxPCHMtcvu0
   ga8XIDQB4aHIRHfziQ7gr0/fPrX13Wl/7lM4Sqwm3FIowvrSLECV5bb+O
   ELKyuSnFqKsyGk6ajTbsWeof7uTSQ/vHwPa0VFe1KF3cref18m3dz24Cs
   rRj5qh1i1t//EtKMDPu8fC0MeJDPHThwUshBc/rCE2InkZd3U1NtrMDm5
   iw7d5APfCnsPXRTlekSgZ5n05U5QybIYGaqOek5fZgHma04KbTlD6dlif
   g==;
X-IronPort-AV: E=Sophos;i="5.98,336,1673910000"; 
   d="scan'208";a="30239410"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 11 Apr 2023 09:38:39 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 39F95280056;
        Tue, 11 Apr 2023 09:38:39 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/1] media: imx: imx7-media-csi: Set pixfmt field, width, height & sizeimage
Date:   Tue, 11 Apr 2023 09:38:38 +0200
Message-ID: <1934107.PYKUYFuaPT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230407022214.GE31272@pendragon.ideasonboard.com>
References: <20230406135637.257580-1-alexander.stein@ew.tq-group.com> <20230407022214.GE31272@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

thanks for the feedback.

Am Freitag, 7. April 2023, 04:22:14 CEST schrieb Laurent Pinchart:
> Hi Alexander,
>=20
> Thank you for the patch.
>=20
> On Thu, Apr 06, 2023 at 03:56:37PM +0200, Alexander Stein wrote:
> > Fixes the following v4l2-comliance errors for VIDIOC_TRY_FMT:
> > * !pix.width || !pix.height
> > * !pix.sizeimage
> > * pix.field =3D=3D V4L2_FIELD_ANY
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > This patch is based on [1] and fixes the last v4l2-compliance errors and
> > a 'WARN_ON(!plane_sizes[i])' in vb2_core_reqbufs().
> > My platform: TQMa8MQML (imx8mm) + imx327lqr.
> >=20
> > The v4l2-compliance output:
> > --8<--
> > v4l2-compliance 1.24.1-5010, 64 bits, 64-bit time_t
> > v4l2-compliance SHA: 8799081b1436 2023-02-24 17:03:58
> >=20
> > Compliance test for imx-capture device /dev/video0:
> >=20
> > Driver Info:
> >         Driver name      : imx-capture
> >         Card type        : imx-capture
> >         Bus info         : platform:32e20000.csi
> >         Driver version   : 6.3.0
> >         Capabilities     : 0xa4200001
> >        =20
> >                 Video Capture
> >                 I/O MC
> >                 Streaming
> >                 Extended Pix Format
> >                 Device Capabilities
> >        =20
> >         Device Caps      : 0x24200001
> >        =20
> >                 Video Capture
> >                 I/O MC
> >                 Streaming
> >                 Extended Pix Format
> >=20
> > Media Driver Info:
> >         Driver name      : imx7-csi
> >         Model            : imx-media
> >         Serial           :
> >         Bus info         : platform:32e20000.csi
> >         Media version    : 6.3.0
> >         Hardware revision: 0x00000000 (0)
> >         Driver version   : 6.3.0
> >=20
> > Interface Info:
> >         ID               : 0x03000006
> >         Type             : V4L Video
> >=20
> > Entity Info:
> >         ID               : 0x00000004 (4)
> >         Name             : csi capture
> >         Function         : V4L2 I/O
> >         Pad 0x01000005   : 0: Sink
> >        =20
> >           Link 0x02000008: from remote pad 0x1000003 of entity 'csi'
> >           (Video Interface Bridge): Data, Enabled, Immutable>=20
> > Required ioctls:
> >         test MC information (see 'Media Driver Info' above): OK
> >         test VIDIOC_QUERYCAP: OK
> >         test invalid ioctls: OK
> >=20
> > Allow for multiple opens:
> >         test second /dev/video0 open: OK
> >         test VIDIOC_QUERYCAP: OK
> >         test VIDIOC_G/S_PRIORITY: OK
> >         test for unlimited opens: OK
> >=20
> > Debug ioctls:
> >         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> >         test VIDIOC_LOG_STATUS: OK (Not Supported)
> >=20
> > Input ioctls:
> >         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> >         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> >         test VIDIOC_ENUMAUDIO: OK (Not Supported)
> >         test VIDIOC_G/S/ENUMINPUT: OK
> >         test VIDIOC_G/S_AUDIO: OK (Not Supported)
> >         Inputs: 1 Audio Inputs: 0 Tuners: 0
> >=20
> > Output ioctls:
> >         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> >         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> >         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> >         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> >         Outputs: 0 Audio Outputs: 0 Modulators: 0
> >=20
> > Input/Output configuration ioctls:
> >         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> >         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> >         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> >         test VIDIOC_G/S_EDID: OK (Not Supported)
> >=20
> > Control ioctls (Input 0):
> >         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> >         test VIDIOC_QUERYCTRL: OK (Not Supported)
> >         test VIDIOC_G/S_CTRL: OK (Not Supported)
> >         test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> >         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> >         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> >         Standard Controls: 0 Private Controls: 0
> >=20
> > Format ioctls (Input 0):
> >         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> >         test VIDIOC_G/S_PARM: OK (Not Supported)
> >         test VIDIOC_G_FBUF: OK (Not Supported)
> >         test VIDIOC_G_FMT: OK
> >        =20
> >                 fail: v4l2-test-formats.cpp(468): !pix.width ||
> >                 !pix.height
> >        =20
> >         test VIDIOC_TRY_FMT: FAIL
> >        =20
> >                 fail: v4l2-test-formats.cpp(468): !pix.width ||
> >                 !pix.height
> >        =20
> >         test VIDIOC_S_FMT: FAIL
> >         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> >         test Cropping: OK (Not Supported)
> >        =20
> >                 fail: v4l2-test-formats.cpp(1726): !sel_padded.r.width =
||
> >                 !sel_padded.r.height fail: v4l2-test-formats.cpp(1778):
> >                 testBasicCompose(node, V4L2_BUF_TYPE_VIDEO_CAPTURE)>   =
     =20
> >         test Composing: FAIL
> >         test Scaling: OK
> >=20
> > Codec ioctls (Input 0):
> >         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> >         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> >         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> >=20
> > Buffer ioctls (Input 0):
> >                 fail: v4l2-test-buffers.cpp(607): q.reqbufs(node, 1)
> >        =20
> >         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
> >        =20
> >                 fail: v4l2-test-buffers.cpp(783): VIDIOC_EXPBUF is
> >                 supported, but the V4L2_MEMORY_MMAP support is missing =
or
> >                 malfunctioning. fail: v4l2-test-buffers.cpp(784):
> >                 VIDIOC_EXPBUF is supported, but the V4L2_MEMORY_MMAP
> >                 support is missing, probably due to earlier failing
> >                 format tests.>        =20
> >         test VIDIOC_EXPBUF: OK (Not Supported)
> >         test Requests: OK (Not Supported)
> >=20
> > Total for imx-capture device /dev/video0: 46, Succeeded: 42, Failed: 4,
> > Warnings: 0 --8<--
> >=20
> > Best regards,
> > Alexander
> >=20
> > [1]
> > https://lore.kernel.org/all/20230321072707.678039-1-alexander.stein@ew.=
tq
> > -group.com/>=20
> >  drivers/media/platform/nxp/imx7-media-csi.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >=20
> > diff --git a/drivers/media/platform/nxp/imx7-media-csi.c
> > b/drivers/media/platform/nxp/imx7-media-csi.c index
> > 389d7d88b341..1888559a6531 100644
> > --- a/drivers/media/platform/nxp/imx7-media-csi.c
> > +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> > @@ -1147,6 +1147,7 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format
> > *pixfmt,>=20
> >  {
> > =20
> >  	struct v4l2_mbus_framefmt fmt_src;
> >  	const struct imx7_csi_pixfmt *cc;
> >=20
> > +	unsigned int walign;
> >=20
> >  	/*
> >  =09
> >  	 * Find the pixel format, default to the first supported format if=20
not
> >=20
> > @@ -1175,6 +1176,17 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format
> > *pixfmt,>=20
> >  	v4l2_fill_mbus_format(&fmt_src, pixfmt, 0);
> >  	imx7_csi_mbus_fmt_to_pix_fmt(pixfmt, &fmt_src, cc);
> >=20
> > +	if (cc->bpp =3D=3D 8)
> > +		walign =3D 8;
> > +	else
> > +		walign =3D 4;
> > +
> > +	v4l_bound_align_image(&pixfmt->width, 1, 0xffff / (cc->bpp / 8),=20
walign,
> > +			      &pixfmt->height, 1, 0xffff, 1, 0);
> > +
> > +	pixfmt->sizeimage =3D (cc->bpp * pixfmt->width * pixfmt->height) /
> > BITS_PER_BYTE;
> No need for parentheses, and I'd wrap the line. Or replace BITS_PER_BYTE
> with 8:
>=20
> 	pixfmt->sizeimage =3D pixfmt->width * pixfmt->height * cc->bpp / 8;
>=20
> which I think is as readable.

=46ine with me. Will change that.

> You also need to handle bytesperline.

I originally had a patch for that as well. But with some debugging output I=
=20
noticed this already has the correct value. But maybe this was just=20
coincidence and it actually needs to be set as well.

> I'd go one step further, and get rid of imx7_csi_mbus_fmt_to_pix_fmt().
> This is historical, there's no need to convert between mbus and pixel
> formats anymore.

Okay, but that is an additional change.

> > +	pixfmt->field =3D V4L2_FIELD_NONE;
>=20
> This should probably be moved to a separate patch. Interlaced format
> handling is broken, there's no IDMAC on i.MX7. The code comes from
> shared helpers with i.MX6 before the driver got destaged.

The motivation for this patch came from the v4l2-compliance errors, so I=20
grouped setting missing properties into a single patch. It's not so much ab=
out=20
interlaced format, but an uninitialized pixfmt->field, so I would prefer=20
keeping them in a single patch.

Best regards,
Alexander

> > +
> >=20
> >  	if (compose) {
> >  =09
> >  		compose->width =3D fmt_src.width;
> >  		compose->height =3D fmt_src.height;


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


