Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 685FF6947C4
	for <lists+linux-media@lfdr.de>; Mon, 13 Feb 2023 15:14:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbjBMOOF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Feb 2023 09:14:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjBMOOE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Feb 2023 09:14:04 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ECA71449B
        for <linux-media@vger.kernel.org>; Mon, 13 Feb 2023 06:14:02 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net [192.222.136.102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: nicolas)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 2C2D8660206B;
        Mon, 13 Feb 2023 14:14:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1676297641;
        bh=nnbH+P/6oSJLiDlT9DlaRGN/Gfyz8ryCCRHdxSiYHmw=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=nvaJR9hjtPyXMfwSm4eWLLGN5aLqIYtQcUjAKD1ou/sl5Skm3SOLQJN1Yg/nzk2ME
         h0wrvL9KcQzlgtGllYi2Tq7VZFlzknnUo7lRlh26dIfrSzhFJE4ScULd5vrVcPLgQk
         2XslF2saVpLDkhaV69+D9iY5bBZC/+icyUvEAqDE5Dl0nm6PyjecbkoCAmXOCAMaoM
         NDX717hTnp8SnS6ds64gQ7q8odeSerr8RprFlX7KUEKreQk7LiRAeAX1s79Q9cqvOg
         P1akUVbqyNsy/Py6289PCts3M+x2FvDfuGGGO4MEpH1pxPZfFpJb0TubNuD9PoPM0a
         IL4IQr2RP5Vsw==
Message-ID: <2829b86c409058fb566a6a398eedff96b76cf6fe.camel@collabora.com>
Subject: Re: [PATCH v11 0/6] Wave5 codec driver
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Som Qin <som.qin@starfivetech.com>,
        Sebastian Fricke <sebastian.fricke@collabora.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     "kernel@collabora.com" <kernel@collabora.com>,
        "bob.beckett@collabora.com" <bob.beckett@collabora.com>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "nas.chung@chipsnmedia.com" <nas.chung@chipsnmedia.com>
Date:   Mon, 13 Feb 2023 09:13:49 -0500
In-Reply-To: <a336c17afc9143858fb9beb82aa800a8@EXMBX164.cuchost.com>
References: <a336c17afc9143858fb9beb82aa800a8@EXMBX164.cuchost.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 13 f=C3=A9vrier 2023 =C3=A0 06:13 +0000, Som Qin a =C3=A9crit=C2=
=A0:
> On 12/7/22 20:13, Sebastian Fricke wrote:
> > The Wave5 codec driver is a stateful encoder/decoder.
> > It is found on the J721S2 SoC, JH7100 SoC, and ssd202d SoC. etc.
> > But the current test report is based on J721S2 SoC and pre-silicon FPGA=
.
> >=20
> > The driver currently supports V4L2_PIX_FMT_HEVC and V4L2_PIX_FMT_H264.
> >=20
> > This driver has so far been tested on the J721S2 EVM board and
> > pre-silicon FPGA.
> >=20
> > Testing on the J721S2 EVM board in combination with the GStreamer v4l2
> > good plugin shows the decoder is working correctly, it has been tested
> > with H264 & HEVC video clips with multiple different dimensions (4k,
> > 1080p, 720p, 540p, 360p, 270p) and various lengths. Additionally,
> > Fluster conformance tests have been run for both supported codecs.
> >=20
> > The encoder can encode various videos but still has some issues causing
> > it to fail occassionally.
> >=20
> > V4L2 compliance:
> >=20
> > Total for wave5-dec device /dev/video0: 44, Succeeded: 44, Failed: 0, W=
arnings: 0
> >=20
> > Buffer ioctls:
> > 		fail: ../../../v4l-utils-1.18.1/utils/v4l2-compliance/v4l2-test-buffe=
rs.cpp(610): q.reqbufs(node, 1)
> > 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
> > 		fail: ../../../v4l-utils-1.18.1/utils/v4l2-compliance/v4l2-test-buffe=
rs.cpp(753): q.reqbufs(node, 2)
> > 	test VIDIOC_EXPBUF: FAIL
> > 	test Requests: OK (Not Supported)
> >=20
> > Total for wave5-enc device /dev/video1: 44, Succeeded: 42, Failed: 2, W=
arnings: 2
> >=20
> > changes since v10:
> >=20
> > * Remove structure member from the encoder and decoder output info
> >  structs, that have assigned values from the registers but aren't used
> >  in the driver, add comments to describe the register values in the
> >  register definitions
> > * Fix issue with decoding videos with a dimension where the height is
> >  not a multiple of 16 (270, 360, 540, 1024 etc.)
> > * Fix incorrect variable format identifiers in printks
> > * Use debug logs in loops to avoid flooding the message log
> > * Use the swap() function instead of manual swapping of two values
> > * Add extended controls for the encoder
> > * Fix control flow issue while handling bitstream buffers, where an
> >  error while writing the source buffer into the hardware ring buffer
> >  would result in skipping the problematic buffer, which in turn causes
> >  a reordering of source buffers
> > * Use the rectangle format as described by the hardware, the hardware
> >  uses for rectangles like the display rectangle 4 offsets (top, bottom,
> >  left, right), which depict the offset from the respective edge. Use
> >  this format instead of implicitly converting the bottom and right
> >  attributes to width and height attributes.
> > * Return an error upon reading the sequence header while STREAMON
> > * Squash the VDI and the VPUAPI layer commits as they had circular
> >  dependencies
> >=20
> > changes since v9:
> >=20
> > * Move from staging to the media directory
> >  * Move coda driver to sub-directory
> >=20
> > * Fixes:
> >  * Use platform_get_irq instead of platform_get_resource to fetch the I=
RQ
> >=20
> > * General cleanups:
> >  * Add missing error messages to error conditions
> >  * Improve messages/variable names/comments, align parameter names acro=
ss the driver
> >  * Use macros instead of magic numbers in multiple occassions
> >  * Reduce code duplication in multiple places
> >  * Fix whitespace, newline and tab alignment issues
> >  * Remove unused struct fields & commented out code
> >  * Convert signed integers to unsigned if signed is not necessary
> >  * Convert int/unsigned int to s32/u32, when the variable is assigned t=
o the
> >    return of a register read or provided as a parameter for a register =
write
> >    (and vice versa)
> >  * Fix incorrect bitwise operators where logical operators are appropri=
ate
> >  * Multiple smaller changes
> >=20
> > * Generalization:
> >  * Add new helper file providing generalized routines for vpu-dec & vpu=
-enc
> >  * Generalize luma & chroma table size calculation and stride calculati=
on
> >=20
> > * Resource cleanup and error handling:
> >  * Add error handling to all calls with ignored return codes
> >  * Handle DMA resource cleanup properly
> >  * Fix insufficient instance cleanup while opening dec/enc
> >=20
> > changes since v8:
> >=20
> > * add 'wave5' to DEV_NAME
> > * update to support Multi-stream
> > * update to support loop test/dynamic resolution change
> > * remove unnecessary memset, g_volatile, old version option
> >=20
> > changes since v7:
> >=20
> > * update v4l2-compliance test report
> > * fix build error on linux-kernel 5.18.0-rc4
> >=20
> > changes since v6:
> >=20
> > * update TODO file
> > * get sram info from device tree
> >=20
> > changes since v5:
> >=20
> > * support NV12/NV21 pixelformat for encoder and decoder
> > * handle adnormal exit and EOS
> >=20
> > changes since v4:
> >=20
> > * refactor functions in wave5-hw and fix bug reported by Daniel Palmer
> > * rename functions and variables to better names
> > * change variable types such as replacing s32 with u32 and int with boo=
l
> > * as appropriate
> >=20
> > changes since v3:
> >=20
> > * Fixing all issues commented by Dan Carpenter
> > * Change file names to have wave5- prefix
> > * In wave5_vpu_probe, enable the clocks before reading registers, as
> > * commented from Daniel Palmer
> > * Add more to the TODO list,
> >=20
> > changes since v2:
> >=20
> > Main fixes includes:
> > * change the yaml and dirver code to support up to 4 clks (instead of
> > * one)
> > * fix Kconfig format
> > * remove unneeded cast,
> > * change var types
> > * change var names, func names
> > * checkpatch fixes
> >=20
> > changes since v1:
> >=20
> > Fix changes due to comments from Ezequiel and Dan Carpenter. Main fixes
> > inclueds:
> > * move all files to one dir 'wave5'
> > * replace private error codes with standard error codes
> > * fix extra spaces
> > * various checkpatch fixes
> > * replace private 'DPRINTK' macro with standard 'dev_err/dbg ..'
> > * fix error handling
> > * add more possible fixes to the TODO file
> >=20
>=20
> We used the patchset on JH7110 SoC which is integrated with a wave511 VPU=
.=20
> We see issue that the decoder output contains garbage data in the image
> when decoding some of HEVC videos, in 1080p or 4k. But Most of the videos
> we tested decoded well.
>=20
> Beside, ffmpeg h264_v4l2m2m could not get the correct resolution via
> VIDIOC_G_FMT or VIDIOC_TRY_FMT for 1080p AVC video.

Thanks for the report, Sebastian has been working on a v12, which includes
important rework regarding format negotiation, hopefully this will help. On=
e of
the pressing issue was that the original driver this effort was derived on =
was
designed to work on ancient GStreamer (1.16) and would simply not work at a=
ll on
new version, so this has been taking some time. It was also highlighted tha=
t
h264_v4l2m2m may run out of ram on JH7110 in absence of V4L2_CID_MIN_BUFFER=
*
controls, so we will be adding these too.

p.s. if you are allowed to share the streams (or a sample of it) you have h=
ad
issue with, Sebastian can certainly add this to his validation.

regards,
Nicolas

>=20
> > Nas Chung (3):
> >  media: chips-media: wave5: Add vpuapi layer
> >  media: chips-media: wave5: Add the v4l2 layer
> >  media: chips-media: wave5: Add TODO file
> >=20
> > Robert Beckett (2):
> >  dt-bindings: media: wave5: add yaml devicetree bindings
> >  media: chips-media: wave5: Add wave5 driver to maintainers file
> >=20
> > Sebastian Fricke (1):
> >  media: platform: chips-media: Move Coda to separate folder
> >=20
> > .../devicetree/bindings/cnm,wave5.yml         |   72 +
> > MAINTAINERS                                   |   11 +-
> > drivers/media/platform/chips-media/Kconfig    |   18 +-
> > drivers/media/platform/chips-media/Makefile   |    6 +-
> > .../media/platform/chips-media/coda/Kconfig   |   18 +
> > .../media/platform/chips-media/coda/Makefile  |    6 +
> > .../chips-media/{ =3D> coda}/coda-bit.c         |    0
> > .../chips-media/{ =3D> coda}/coda-common.c      |    0
> > .../chips-media/{ =3D> coda}/coda-gdi.c         |    0
> > .../chips-media/{ =3D> coda}/coda-h264.c        |    0
> > .../chips-media/{ =3D> coda}/coda-jpeg.c        |    0
> > .../chips-media/{ =3D> coda}/coda-mpeg2.c       |    0
> > .../chips-media/{ =3D> coda}/coda-mpeg4.c       |    0
> > .../platform/chips-media/{ =3D> coda}/coda.h    |    0
> > .../chips-media/{ =3D> coda}/coda_regs.h        |    0
> > .../chips-media/{ =3D> coda}/imx-vdoa.c         |    0
> > .../chips-media/{ =3D> coda}/imx-vdoa.h         |    0
> > .../platform/chips-media/{ =3D> coda}/trace.h   |    0
> > .../media/platform/chips-media/wave5/Kconfig  |   12 +
> > .../media/platform/chips-media/wave5/Makefile |   10 +
> > drivers/media/platform/chips-media/wave5/TODO |   18 +
> > .../platform/chips-media/wave5/wave5-helper.c |  175 +
> > .../platform/chips-media/wave5/wave5-helper.h |   28 +
> > .../platform/chips-media/wave5/wave5-hw.c     | 3359 +++++++++++++++++
> > .../chips-media/wave5/wave5-regdefine.h       |  743 ++++
> > .../platform/chips-media/wave5/wave5-vdi.c    |  245 ++
> > .../platform/chips-media/wave5/wave5-vdi.h    |   67 +
> > .../chips-media/wave5/wave5-vpu-dec.c         | 1429 +++++++
> > .../chips-media/wave5/wave5-vpu-enc.c         | 1746 +++++++++
> > .../platform/chips-media/wave5/wave5-vpu.c    |  362 ++
> > .../platform/chips-media/wave5/wave5-vpu.h    |   72 +
> > .../platform/chips-media/wave5/wave5-vpuapi.c | 1040 +++++
> > .../platform/chips-media/wave5/wave5-vpuapi.h | 1136 ++++++
> > .../chips-media/wave5/wave5-vpuconfig.h       |   90 +
> > .../chips-media/wave5/wave5-vpuerror.h        |  454 +++
> > .../media/platform/chips-media/wave5/wave5.h  |   94 +
> > 36 files changed, 11190 insertions(+), 21 deletions(-)
> > create mode 100644 Documentation/devicetree/bindings/cnm,wave5.yml
> > create mode 100644 drivers/media/platform/chips-media/coda/Kconfig
> > create mode 100644 drivers/media/platform/chips-media/coda/Makefile
> > rename drivers/media/platform/chips-media/{ =3D> coda}/coda-bit.c (100%=
)
> > rename drivers/media/platform/chips-media/{ =3D> coda}/coda-common.c (1=
00%)
> > rename drivers/media/platform/chips-media/{ =3D> coda}/coda-gdi.c (100%=
)
> > rename drivers/media/platform/chips-media/{ =3D> coda}/coda-h264.c (100=
%)
> > rename drivers/media/platform/chips-media/{ =3D> coda}/coda-jpeg.c (100=
%)
> > rename drivers/media/platform/chips-media/{ =3D> coda}/coda-mpeg2.c (10=
0%)
> > rename drivers/media/platform/chips-media/{ =3D> coda}/coda-mpeg4.c (10=
0%)
> > rename drivers/media/platform/chips-media/{ =3D> coda}/coda.h (100%)
> > rename drivers/media/platform/chips-media/{ =3D> coda}/coda_regs.h (100=
%)
> > rename drivers/media/platform/chips-media/{ =3D> coda}/imx-vdoa.c (100%=
)
> > rename drivers/media/platform/chips-media/{ =3D> coda}/imx-vdoa.h (100%=
)
> > rename drivers/media/platform/chips-media/{ =3D> coda}/trace.h (100%)
> > create mode 100644 drivers/media/platform/chips-media/wave5/Kconfig
> > create mode 100644 drivers/media/platform/chips-media/wave5/Makefile
> > create mode 100644 drivers/media/platform/chips-media/wave5/TODO
> > create mode 100644 drivers/media/platform/chips-media/wave5/wave5-helpe=
r.c
> > create mode 100644 drivers/media/platform/chips-media/wave5/wave5-helpe=
r.h
> > create mode 100644 drivers/media/platform/chips-media/wave5/wave5-hw.c
> > create mode 100644 drivers/media/platform/chips-media/wave5/wave5-regde=
fine.h
> > create mode 100644 drivers/media/platform/chips-media/wave5/wave5-vdi.c
> > create mode 100644 drivers/media/platform/chips-media/wave5/wave5-vdi.h
> > create mode 100644 drivers/media/platform/chips-media/wave5/wave5-vpu-d=
ec.c
> > create mode 100644 drivers/media/platform/chips-media/wave5/wave5-vpu-e=
nc.c
> > create mode 100644 drivers/media/platform/chips-media/wave5/wave5-vpu.c
> > create mode 100644 drivers/media/platform/chips-media/wave5/wave5-vpu.h
> > create mode 100644 drivers/media/platform/chips-media/wave5/wave5-vpuap=
i.c
> > create mode 100644 drivers/media/platform/chips-media/wave5/wave5-vpuap=
i.h
> > create mode 100644 drivers/media/platform/chips-media/wave5/wave5-vpuco=
nfig.h
> > create mode 100644 drivers/media/platform/chips-media/wave5/wave5-vpuer=
ror.h
> > create mode 100644 drivers/media/platform/chips-media/wave5/wave5.h
> >=20
> > --=20
> > 2.25.1
> >=20
>=20

