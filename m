Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79C2D54376D
	for <lists+linux-media@lfdr.de>; Wed,  8 Jun 2022 17:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242446AbiFHPbX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jun 2022 11:31:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240721AbiFHPbX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jun 2022 11:31:23 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 614295FD5
        for <linux-media@vger.kernel.org>; Wed,  8 Jun 2022 08:31:17 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id x7so15157550qta.6
        for <linux-media@vger.kernel.org>; Wed, 08 Jun 2022 08:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=GPd0DGotXshUD7kf6AijDsGBim00VEDigRTwVbHhPfk=;
        b=SG1lnvrSgBVR2ZLG+BkmoX7JEtL6skCI064+VGhq0uKDlkzHjuNHN6zDS9lt1olPEL
         978VeNynLgZxnk8eqC7QMXEa2O8lcUyumaxxh16I0OP89MnFZDXsxAmO52metprv3tU9
         5UvsFLxv9WgVdf+0GVJwg1fKhjlvjuhMrQmnS/NgO5MWm3AO0zoJqvtepRPtadMz5w13
         Je5cTdDfgKXgxvOqSMxJNEpL2WL9bMbERIpb91pkOYYZ8adsYzSvAuNdht9lkPDHOk93
         D78u9iFSOC016iet4cCckWP1KnvKK414KZl7ZvOMyxNKE3JYuEceQBcJYW2uIqeif3Vr
         gcIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=GPd0DGotXshUD7kf6AijDsGBim00VEDigRTwVbHhPfk=;
        b=lgOIje65y4AZ7L7TUgfTMHMU3+u5bJL+stA51tIIXDsyysL7fdsw/TxZkBgOvMuaA5
         L6QEzSe/39H6DRxFkVzRcsHBZza87AvruYsZysud2ayMyBOhdRzQlGVpcXnchQItTNV1
         5Kk2pNPrOw7FmJ01mHuyXMJ2TLUc+WTUkhtizVTi2vBT8CBS2sbHux4sDEgV/8sr5/BI
         /4TRgbsUrnTyPNtI9ulhE12CAHxlR2A/BVPHxyH3IJ4R5OuQR6u0co0D3xsk3MwE2if5
         Ra6PKzVi7dR6CvksCNj00Vzd/QVM7Du9UGiK76A+kRCUBq0BUR4j1b5Hz9VsR6+vDKB7
         /CsA==
X-Gm-Message-State: AOAM533v3rqxw646ZlbTNMEBqCpP45ZQO55q1pxmCC3Adu+YXySSG5/f
        3QkMJK/Jlv8i6pogLmJox1+nzQ==
X-Google-Smtp-Source: ABdhPJw9V/B4RmpjL5q5id5W1NDF74Esf7h9JAmAjR5Xqes0gqnUEh4JjvX72ORhmLNPGotu1v+7Fw==
X-Received: by 2002:a05:622a:1391:b0:304:eb9f:aee6 with SMTP id o17-20020a05622a139100b00304eb9faee6mr13457912qtk.365.1654702275914;
        Wed, 08 Jun 2022 08:31:15 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id w4-20020a05620a444400b006a6278a2b31sm7636977qkp.75.2022.06.08.08.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 08:31:15 -0700 (PDT)
Message-ID: <6d0e09146c59faa4d81b2608cf0279b2873d1d6e.camel@ndufresne.ca>
Subject: Re: [RFC PATCH v2] media: visl: add virtual stateless driver
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>, daniel.almeida@collabora.com
Cc:     linux-media@vger.kernel.org
Date:   Wed, 08 Jun 2022 11:31:14 -0400
In-Reply-To: <c10fcafb-58b0-2df4-9d5e-eb09ebdef6f8@xs4all.nl>
References: <20210810220552.298140-3-daniel.almeida@collabora.com>
         <20220606212622.495841-1-daniel.almeida@collabora.com>
         <c10fcafb-58b0-2df4-9d5e-eb09ebdef6f8@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1 (3.44.1-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mardi 07 juin 2022 =C3=A0 14:02 +0200, Hans Verkuil a =C3=A9crit=C2=A0:
> On 6/6/22 23:26, daniel.almeida@collabora.com wrote:
> > From: Daniel Almeida <daniel.almeida@collabora.com>
> >=20
> > A virtual stateless device for stateless uAPI development purposes.
> >=20
> > This tool's objective is to help the development and testing of userspa=
ce
> > applications that use the V4L2 stateless API to decode media.
>=20
> So this is specifically for *decoding*, right? Is it the intention that t=
he
> same driver will be able to handle stateless encoding as well in the futu=
re?
> Or would that be a new driver?
>=20
> It matters primarily for the naming of the driver. If it is decoding only=
,
> then it should be something like visldec.

For the same reason we didn't add this to vicodec, we should probably keep
decoding and encoding separate. An stateless encoder stub would need to pro=
duce
some valid stream, I'm not sure how we should address this. So yes, we mayb=
e
want to call is visldec.

Nicolas

p.s. do we need to define the pronunciation for that? "Vi SL dec" or "Vizel=
 Dec"
?

>=20
> >=20
> > A userspace implementation can use visl to run a decoding loop even whe=
n no
> > hardware is available or when the kernel uAPI for the codec has not bee=
n
> > upstreamed yet. This can reveal bugs at an early stage.
> >=20
> > This driver can also trace the contents of the V4L2 controls submitted =
to it.
> > It can also dump the contents of the vb2 buffers through a debugfs
> > interface. This is in many ways similar to the tracing infrastructure
> > available for other popular encode/decode APIs out there and can help d=
evelop
> > a userspace application by using another (working) one as a reference.
> >=20
> > Note that no actual decoding of video frames is performed by visl. The =
V4L2
> > test pattern generator is used to write various debug information to th=
e
> > capture buffers instead.
> >=20
> > Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> >=20
> > ---
> > Was media: vivpu: add virtual VPU driver
> >=20
> > Changes from v1:
> >=20
> > - Addressed review comments from v1
> > - Driver was renamed to visl
> > - Dropped AV1 support for now (as it's not upstream yet)
> > - Added support for FWHT, MPEG2, VP8, VP9, H264
> > - Added TPG support
> > - Driver can now dump the controls for the codecs above through ftrace
> > - Driver can now dump the vb2 bitstream buffer through a debugfs infras=
tructure
> >=20
> > I ran this on a kernel with KASAN/kmemleak enabled, nothing showed up.
> >=20
> > v4l2-compliance results:
> >=20
> > v4l2-compliance 1.22.1, 64 bits, 64-bit time_t
>=20
> Based on the output I can tell that this is an old v4l2-compliance utilit=
y.
>=20
> Please compile it straight from the v4l-utils git repo.
>=20
> Also compare it with the output when used with vicodec: the compliance te=
st
> should be able to detect that it is a stateless decoder, but I don't see =
that
> in the output below, either because it is a too old version, or the drive=
r
> does something wrong, breaking this detection.
>=20
> >=20
> > Compliance test for visl device /dev/video0:
> >=20
> > Driver Info:
> >         Driver name      : visl
> >         Card type        : visl
> >         Bus info         : platform:visl
> >         Driver version   : 5.19.0
> >         Capabilities     : 0x84204000
> >                 Video Memory-to-Memory Multiplanar
> >                 Streaming
> >                 Extended Pix Format
> >                 Device Capabilities
> >         Device Caps      : 0x04204000
> >                 Video Memory-to-Memory Multiplanar
> >                 Streaming
> >                 Extended Pix Format
> > Media Driver Info:
> >         Driver name      : visl
> >         Model            : visl
> >         Serial           :=20
> >         Bus info         : platform:visl
> >         Media version    : 5.19.0
> >         Hardware revision: 0x00000000 (0)
> >         Driver version   : 5.19.0
> > Interface Info:
> >         ID               : 0x0300000c
> >         Type             : V4L Video
> > Entity Info:
> >         ID               : 0x00000001 (1)
> >         Name             : visl-source
> >         Function         : V4L2 I/O
> >         Pad 0x01000002   : 0: Source
> >           Link 0x02000008: to remote pad 0x1000004 of entity 'visl-proc=
' (Video Decoder): Data, Enabled, Immutable
> >=20
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
> >         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> >         test VIDIOC_G/S_AUDIO: OK (Not Supported)
> >         Inputs: 0 Audio Inputs: 0 Tuners: 0
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
> > Control ioctls:
> >         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> >         test VIDIOC_QUERYCTRL: OK
> >         test VIDIOC_G/S_CTRL: OK
> >         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> >         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> >         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> >         Standard Controls: 3 Private Controls: 0
> >         Standard Compound Controls: 13 Private Compound Controls: 0
> >=20
> > Format ioctls:
> >         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> >         test VIDIOC_G/S_PARM: OK (Not Supported)
> >         test VIDIOC_G_FBUF: OK (Not Supported)
> >         test VIDIOC_G_FMT: OK
> >         test VIDIOC_TRY_FMT: OK
> >         test VIDIOC_S_FMT: OK
> >         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> >         test Cropping: OK (Not Supported)
> >         test Composing: OK (Not Supported)
> >         test Scaling: OK
> >=20
> > Codec ioctls:
> >         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> >         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> >         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> >=20
> > Buffer ioctls:
> >         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> >         test VIDIOC_EXPBUF: OK
> >         test Requests: OK
> >=20
> > Test input 0:
> >=20
> > Streaming ioctls:
> >         test read/write: OK (Not Supported)
> >         test blocking wait: OK
> >         Video Capture Multiplanar: Captured 58 buffers   =20
> >         test MMAP (no poll): OK
> >         Video Capture Multiplanar: Captured 58 buffers   =20
> >         test MMAP (select): OK
> >         Video Capture Multiplanar: Captured 58 buffers   =20
> >         test MMAP (epoll): OK
> >         Video Capture Multiplanar: Captured 58 buffers   =20
> >         test USERPTR (no poll): OK
> >         Video Capture Multiplanar: Captured 58 buffers   =20
> >         test USERPTR (select): OK
> >         test DMABUF: Cannot test, specify --expbuf-device
> >=20
> > Total for visl device /dev/video0: 53, Succeeded: 53, Failed: 0, Warnin=
gs: 0
> >=20
> > ---
> >  drivers/media/test-drivers/Kconfig            |   1 +
> >  drivers/media/test-drivers/Makefile           |   1 +
> >  drivers/media/test-drivers/visl/Kconfig       |  31 +
> >  drivers/media/test-drivers/visl/Makefile      |   8 +
> >  drivers/media/test-drivers/visl/visl-core.c   | 532 ++++++++++++
> >  .../media/test-drivers/visl/visl-debugfs.c    | 148 ++++
> >  .../media/test-drivers/visl/visl-debugfs.h    |  72 ++
> >  drivers/media/test-drivers/visl/visl-dec.c    | 468 +++++++++++
> >  drivers/media/test-drivers/visl/visl-dec.h    | 100 +++
> >  .../media/test-drivers/visl/visl-trace-fwht.h |  66 ++
> >  .../media/test-drivers/visl/visl-trace-h264.h | 349 ++++++++
> >  .../test-drivers/visl/visl-trace-mpeg2.h      |  99 +++
> >  .../test-drivers/visl/visl-trace-points.c     |   9 +
> >  .../media/test-drivers/visl/visl-trace-vp8.h  | 156 ++++
> >  .../media/test-drivers/visl/visl-trace-vp9.h  | 292 +++++++
> >  drivers/media/test-drivers/visl/visl-video.c  | 776 ++++++++++++++++++
> >  drivers/media/test-drivers/visl/visl-video.h  |  61 ++
> >  drivers/media/test-drivers/visl/visl.h        | 178 ++++
> >  18 files changed, 3347 insertions(+)
> >  create mode 100644 drivers/media/test-drivers/visl/Kconfig
> >  create mode 100644 drivers/media/test-drivers/visl/Makefile
> >  create mode 100644 drivers/media/test-drivers/visl/visl-core.c
> >  create mode 100644 drivers/media/test-drivers/visl/visl-debugfs.c
> >  create mode 100644 drivers/media/test-drivers/visl/visl-debugfs.h
> >  create mode 100644 drivers/media/test-drivers/visl/visl-dec.c
> >  create mode 100644 drivers/media/test-drivers/visl/visl-dec.h
> >  create mode 100644 drivers/media/test-drivers/visl/visl-trace-fwht.h
> >  create mode 100644 drivers/media/test-drivers/visl/visl-trace-h264.h
> >  create mode 100644 drivers/media/test-drivers/visl/visl-trace-mpeg2.h
> >  create mode 100644 drivers/media/test-drivers/visl/visl-trace-points.c
> >  create mode 100644 drivers/media/test-drivers/visl/visl-trace-vp8.h
> >  create mode 100644 drivers/media/test-drivers/visl/visl-trace-vp9.h
> >  create mode 100644 drivers/media/test-drivers/visl/visl-video.c
> >  create mode 100644 drivers/media/test-drivers/visl/visl-video.h
> >  create mode 100644 drivers/media/test-drivers/visl/visl.h
> >=20
> > diff --git a/drivers/media/test-drivers/Kconfig b/drivers/media/test-dr=
ivers/Kconfig
> > index 51cf27834df0..459b433e9fae 100644
> > --- a/drivers/media/test-drivers/Kconfig
> > +++ b/drivers/media/test-drivers/Kconfig
> > @@ -20,6 +20,7 @@ config VIDEO_VIM2M
> >  source "drivers/media/test-drivers/vicodec/Kconfig"
> >  source "drivers/media/test-drivers/vimc/Kconfig"
> >  source "drivers/media/test-drivers/vivid/Kconfig"
> > +source "drivers/media/test-drivers/visl/Kconfig"
> > =20
> >  endif #V4L_TEST_DRIVERS
> > =20
> > diff --git a/drivers/media/test-drivers/Makefile b/drivers/media/test-d=
rivers/Makefile
> > index ff390b687189..740714a4584d 100644
> > --- a/drivers/media/test-drivers/Makefile
> > +++ b/drivers/media/test-drivers/Makefile
> > @@ -12,3 +12,4 @@ obj-$(CONFIG_VIDEO_VICODEC) +=3D vicodec/
> >  obj-$(CONFIG_VIDEO_VIM2M) +=3D vim2m.o
> >  obj-$(CONFIG_VIDEO_VIMC) +=3D vimc/
> >  obj-$(CONFIG_VIDEO_VIVID) +=3D vivid/
> > +obj-$(CONFIG_VIDEO_VISL) +=3D visl/
> > diff --git a/drivers/media/test-drivers/visl/Kconfig b/drivers/media/te=
st-drivers/visl/Kconfig
> > new file mode 100644
> > index 000000000000..976319c3c372
> > --- /dev/null
> > +++ b/drivers/media/test-drivers/visl/Kconfig
> > @@ -0,0 +1,31 @@
> > +# SPDX-License-Identifier: GPL-2.0+
> > +config VIDEO_VISL
> > +	tristate "Virtual Stateless Driver (visl)"
>=20
> I think this should be "Virtual Stateless Codec Driver" (or Stateless Dec=
oder Driver if
> it will only be for decoding). "Stateless Driver" is too vague.
>=20
> > +	depends on VIDEO_DEV
> > +	select FONT_SUPPORT
> > +	select FONT_8x16
> > +	select VIDEOBUF2_VMALLOC
> > +	select V4L2_MEM2MEM_DEV
> > +	select MEDIA_CONTROLLER
> > +	select MEDIA_CONTROLLER_REQUEST_API
> > +	select VIDEO_V4L2_TPG
> > +	help
> > +
> > +	  A virtual stateless device for uAPI development purposes.
> > +
> > +	  A userspace implementation can use visl to run a decoding loop even
> > +	  when no hardware is available or when the kernel uAPI for the codec
> > +	  has not been upstreamed yet. This can reveal bugs at an early stage=
.
> > +
> > +
>=20
> A few too many empty lines here. One is enough.
>=20
> Regards,
>=20
> 	Hans
>=20
> > +
> > +	  When in doubt, say N.
> > +
> > +config VISL_DEBUGFS
> > +	bool "Enable debugfs for visl"
> > +	depends on VIDEO_VISL
> > +	depends on DEBUG_FS
> > +
> > +	help
> > +	  Choose Y to dump the bitstream buffers through debugfs.
> > +	  When in doubt, say N.

