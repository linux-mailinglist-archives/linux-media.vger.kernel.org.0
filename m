Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D8A3D02CC
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 23:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730793AbfJHVYN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 17:24:13 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44308 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730523AbfJHVYM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 17:24:12 -0400
Received: by mail-wr1-f65.google.com with SMTP id z9so21045882wrl.11
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2019 14:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=agsx6DjVJnEQxz30t+cLLI/SXq9/UecHarG8kuykg04=;
        b=BG6J4mcQKcEhdSEADVl2PTtx/FejpJ1TFWfNPnuBljTARFHeV1/TB4xm+ncOtPq1/g
         TCBUO9Z1Zr6gLm14VSB9MuRWM899ZqAL4iCUvpVzwjXzJh10j7fbXwZv/Z+TMvM/0vk3
         Sss21QNyT/S2KzMYaLnue8gj69i/FWRCFEPnsoOtruW+MxRdBh8KAsl/6DzoLHW7tKjc
         0CYKArxd9vcv1o/+0zoCcOhrNWhYkvoQ5IP3Chx+7xr19bq1O7ZCBugK+2JbnoPoXJRP
         sqeUokESweEahiN1g0Y3YDfDHkOjmQMHBPhDFs3JOgIr/xRgnvwG26HN1eKung3LBznJ
         lQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=agsx6DjVJnEQxz30t+cLLI/SXq9/UecHarG8kuykg04=;
        b=rBKg6jdnznv1DA5nTLQzodGD+hEMhjYMPlvAR6RBN5B5a8cPyPSq0nZHKYx1k4ZA/W
         qgYDtusoC4DcveFPmuSofkzwSFA5sona1H6SalrLToLCV4LMsM/IrRaAEJeNqdNa+6OT
         5PPy/qSMBMT4fA4yhhHFf3nJIKRV/VVbbBmOghg41owoy+ScVsdmdmVuDZ5Jgg1HZc5W
         A96PaerNqaNHonIhOpic6EC8w7AHGgGbD1O3CTeH1WKlntn4XuBrWAJLSWA7Vh9rjpT9
         8IrIZfRxv8ZcGNIghOtqPSdCTIKCP9S7Xa20Q/qt3au0gtxPYfRK7AE0ZhSRgbjq+Vmp
         0tLw==
X-Gm-Message-State: APjAAAWE1xHMbsKL8JZmu98JyX7XT/TtJ1nv+TPQy7VS61dhBtJXPcVb
        sSV2FrTCNRsIgMQecvgJnOpaEdvOTqxA04xG2B2bVA==
X-Google-Smtp-Source: APXvYqzlj4oIfiTYH4wAhj067CdZq8TPz6/rtUgm/QJHi66IeqdzgUROOB5H0FRN9M344gg5ry0UYOrsLw9Ca9kuCko=
X-Received: by 2002:adf:910d:: with SMTP id j13mr2874wrj.128.1570569846944;
 Tue, 08 Oct 2019 14:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <20191007145909.29979-1-mjourdan@baylibre.com> <20191007145909.29979-3-mjourdan@baylibre.com>
 <912dfabbaafc6eb4dce343ad43914ae54fc99343.camel@ndufresne.ca> <0cd4cc5b8aea989d0cd44cad81ebb01cbdd6fc22.camel@ndufresne.ca>
In-Reply-To: <0cd4cc5b8aea989d0cd44cad81ebb01cbdd6fc22.camel@ndufresne.ca>
From:   Maxime Jourdan <mjourdan@baylibre.com>
Date:   Tue, 8 Oct 2019 23:23:56 +0200
Message-ID: <CAMO6naySRH_BcWpNDqscdYEJk2U+rCq=ksQYhjSp6hGD8=SALg@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: meson: vdec: add H.264 decoding support
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 8, 2019 at 10:44 PM Nicolas Dufresne <nicolas@ndufresne.ca> wro=
te:
>
> Le mardi 08 octobre 2019 =C3=A0 16:27 -0400, Nicolas Dufresne a =C3=A9cri=
t :
> > Le lundi 07 octobre 2019 =C3=A0 16:59 +0200, Maxime Jourdan a =C3=A9cri=
t :
> > > Add support for the H264 compressed format (V4L2_PIX_FMT_H264).
> > >
> > > Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> > > ---
> > >  drivers/staging/media/meson/vdec/Makefile     |   2 +-
> > >  drivers/staging/media/meson/vdec/codec_h264.c | 482 ++++++++++++++++=
++
> > >  drivers/staging/media/meson/vdec/codec_h264.h |  14 +
> > >  .../staging/media/meson/vdec/vdec_platform.c  |  37 ++
> > >  4 files changed, 534 insertions(+), 1 deletion(-)
> > >  create mode 100644 drivers/staging/media/meson/vdec/codec_h264.c
> > >  create mode 100644 drivers/staging/media/meson/vdec/codec_h264.h
> > >
> > > diff --git a/drivers/staging/media/meson/vdec/Makefile b/drivers/stag=
ing/media/meson/vdec/Makefile
> > > index 6bea129084b7..711d990c760e 100644
> > > --- a/drivers/staging/media/meson/vdec/Makefile
> > > +++ b/drivers/staging/media/meson/vdec/Makefile
> > > @@ -3,6 +3,6 @@
> > >
> > >  meson-vdec-objs =3D esparser.o vdec.o vdec_helpers.o vdec_platform.o
> > >  meson-vdec-objs +=3D vdec_1.o
> > > -meson-vdec-objs +=3D codec_mpeg12.o
> > > +meson-vdec-objs +=3D codec_mpeg12.o codec_h264.o
> > >
> > >  obj-$(CONFIG_VIDEO_MESON_VDEC) +=3D meson-vdec.o
> > > diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/=
staging/media/meson/vdec/codec_h264.c
> > > new file mode 100644
> > > index 000000000000..4528a6a01c3d
> > > --- /dev/null
> > > +++ b/drivers/staging/media/meson/vdec/codec_h264.c
> > > @@ -0,0 +1,482 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * Copyright (C) 2019 BayLibre, SAS
> > > + * Author: Maxime Jourdan <mjourdan@baylibre.com>
> > > + */
> > > +
> > > +#include <media/v4l2-mem2mem.h>
> > > +#include <media/videobuf2-dma-contig.h>
> > > +
> > > +#include "vdec_helpers.h"
> > > +#include "dos_regs.h"
> > > +
> > > +#define SIZE_EXT_FW        (20 * SZ_1K)
> > > +#define SIZE_WORKSPACE     0x1ee000
> > > +#define SIZE_SEI   (8 * SZ_1K)
> > > +
> > > +/*
> > > + * Offset added by the firmware which must be substracted
> > > + * from the workspace phyaddr
> > > + */
> > > +#define WORKSPACE_BUF_OFFSET       0x1000000
> > > +
> > > +/* ISR status */
> > > +#define CMD_MASK           GENMASK(7, 0)
> > > +#define CMD_SRC_CHANGE             1
> > > +#define CMD_FRAMES_READY   2
> > > +#define CMD_FATAL_ERROR            6
> > > +#define CMD_BAD_WIDTH              7
> > > +#define CMD_BAD_HEIGHT             8
> > > +
> > > +#define SEI_DATA_READY     BIT(15)
> > > +
> > > +/* Picture type */
> > > +#define PIC_TOP_BOT        5
> > > +#define PIC_BOT_TOP        6
> > > +
> > > +/* Size of Motion Vector per macroblock */
> > > +#define MB_MV_SIZE 96
> > > +
> > > +/* Frame status data */
> > > +#define PIC_STRUCT_BIT     5
> > > +#define PIC_STRUCT_MASK    GENMASK(2, 0)
> > > +#define BUF_IDX_MASK       GENMASK(4, 0)
> > > +#define ERROR_FLAG BIT(9)
> > > +#define OFFSET_BIT 16
> > > +#define OFFSET_MASK        GENMASK(15, 0)
> > > +
> > > +/* Bitstream parsed data */
> > > +#define MB_TOTAL_BIT       8
> > > +#define MB_TOTAL_MASK      GENMASK(15, 0)
> > > +#define MB_WIDTH_MASK      GENMASK(7, 0)
> > > +#define MAX_REF_BIT        24
> > > +#define MAX_REF_MASK       GENMASK(6, 0)
> > > +#define AR_IDC_BIT 16
> > > +#define AR_IDC_MASK        GENMASK(7, 0)
> > > +#define AR_PRESENT_FLAG    BIT(0)
> > > +#define AR_EXTEND  0xff
> > > +
> > > +/*
> > > + * Buffer to send to the ESPARSER to signal End Of Stream for H.264.
> > > + * This is a 16x16 encoded picture that will trigger drain firmware-=
side.
> > > + * There is no known alternative.
> > > + */
> > > +static const u8 eos_sequence[SZ_4K] =3D {
> > > +   0x00, 0x00, 0x00, 0x01, 0x06, 0x05, 0xff, 0xe4, 0xdc, 0x45, 0xe9,=
 0xbd,
> > > +   0xe6, 0xd9, 0x48, 0xb7, 0x96, 0x2c, 0xd8, 0x20, 0xd9, 0x23, 0xee,=
 0xef,
> > > +   0x78, 0x32, 0x36, 0x34, 0x20, 0x2d, 0x20, 0x63, 0x6f, 0x72, 0x65,=
 0x20,
> > > +   0x36, 0x37, 0x20, 0x72, 0x31, 0x31, 0x33, 0x30, 0x20, 0x38, 0x34,=
 0x37,
> > > +   0x35, 0x39, 0x37, 0x37, 0x20, 0x2d, 0x20, 0x48, 0x2e, 0x32, 0x36,=
 0x34,
> > > +   0x2f, 0x4d, 0x50, 0x45, 0x47, 0x2d, 0x34, 0x20, 0x41, 0x56, 0x43,=
 0x20,
> > > +   0x63, 0x6f, 0x64, 0x65, 0x63, 0x20, 0x2d, 0x20, 0x43, 0x6f, 0x70,=
 0x79,
> > > +   0x6c, 0x65, 0x66, 0x74, 0x20, 0x32, 0x30, 0x30, 0x33, 0x2d, 0x32,=
 0x30,
> > > +   0x30, 0x39, 0x20, 0x2d, 0x20, 0x68, 0x74, 0x74, 0x70, 0x3a, 0x2f,=
 0x2f,
> > > +   0x77, 0x77, 0x77, 0x2e, 0x76, 0x69, 0x64, 0x65, 0x6f, 0x6c, 0x61,=
 0x6e,
> > > +   0x2e, 0x6f, 0x72, 0x67, 0x2f, 0x78, 0x32, 0x36, 0x34, 0x2e, 0x68,=
 0x74,
> > > +   0x6d, 0x6c, 0x20, 0x2d, 0x20, 0x6f, 0x70, 0x74, 0x69, 0x6f, 0x6e,=
 0x73,
> > > +   0x3a, 0x20, 0x63, 0x61, 0x62, 0x61, 0x63, 0x3d, 0x31, 0x20, 0x72,=
 0x65,
> > > +   0x66, 0x3d, 0x31, 0x20, 0x64, 0x65, 0x62, 0x6c, 0x6f, 0x63, 0x6b,=
 0x3d,
> > > +   0x31, 0x3a, 0x30, 0x3a, 0x30, 0x20, 0x61, 0x6e, 0x61, 0x6c, 0x79,=
 0x73,
> > > +   0x65, 0x3d, 0x30, 0x78, 0x31, 0x3a, 0x30, 0x78, 0x31, 0x31, 0x31,=
 0x20,
> > > +   0x6d, 0x65, 0x3d, 0x68, 0x65, 0x78, 0x20, 0x73, 0x75, 0x62, 0x6d,=
 0x65,
> > > +   0x3d, 0x36, 0x20, 0x70, 0x73, 0x79, 0x5f, 0x72, 0x64, 0x3d, 0x31,=
 0x2e,
> > > +   0x30, 0x3a, 0x30, 0x2e, 0x30, 0x20, 0x6d, 0x69, 0x78, 0x65, 0x64,=
 0x5f,
> > > +   0x72, 0x65, 0x66, 0x3d, 0x30, 0x20, 0x6d, 0x65, 0x5f, 0x72, 0x61,=
 0x6e,
> > > +   0x67, 0x65, 0x3d, 0x31, 0x36, 0x20, 0x63, 0x68, 0x72, 0x6f, 0x6d,=
 0x61,
> > > +   0x5f, 0x6d, 0x65, 0x3d, 0x31, 0x20, 0x74, 0x72, 0x65, 0x6c, 0x6c,=
 0x69,
> > > +   0x73, 0x3d, 0x30, 0x20, 0x38, 0x78, 0x38, 0x64, 0x63, 0x74, 0x3d,=
 0x30,
> > > +   0x20, 0x63, 0x71, 0x6d, 0x3d, 0x30, 0x20, 0x64, 0x65, 0x61, 0x64,=
 0x7a,
> > > +   0x6f, 0x6e, 0x65, 0x3d, 0x32, 0x31, 0x2c, 0x31, 0x31, 0x20, 0x63,=
 0x68,
> > > +   0x72, 0x6f, 0x6d, 0x61, 0x5f, 0x71, 0x70, 0x5f, 0x6f, 0x66, 0x66,=
 0x73,
> > > +   0x65, 0x74, 0x3d, 0x2d, 0x32, 0x20, 0x74, 0x68, 0x72, 0x65, 0x61,=
 0x64,
> > > +   0x73, 0x3d, 0x31, 0x20, 0x6e, 0x72, 0x3d, 0x30, 0x20, 0x64, 0x65,=
 0x63,
> > > +   0x69, 0x6d, 0x61, 0x74, 0x65, 0x3d, 0x31, 0x20, 0x6d, 0x62, 0x61,=
 0x66,
> > > +   0x66, 0x3d, 0x30, 0x20, 0x62, 0x66, 0x72, 0x61, 0x6d, 0x65, 0x73,=
 0x3d,
> > > +   0x30, 0x20, 0x6b, 0x65, 0x79, 0x69, 0x6e, 0x74, 0x3d, 0x32, 0x35,=
 0x30,
> > > +   0x20, 0x6b, 0x65, 0x79, 0x69, 0x6e, 0x74, 0x5f, 0x6d, 0x69, 0x6e,=
 0x3d,
> > > +   0x32, 0x35, 0x20, 0x73, 0x63, 0x65, 0x6e, 0x65, 0x63, 0x75, 0x74,=
 0x3d,
> > > +   0x34, 0x30, 0x20, 0x72, 0x63, 0x3d, 0x61, 0x62, 0x72, 0x20, 0x62,=
 0x69,
> > > +   0x74, 0x72, 0x61, 0x74, 0x65, 0x3d, 0x31, 0x30, 0x20, 0x72, 0x61,=
 0x74,
> > > +   0x65, 0x74, 0x6f, 0x6c, 0x3d, 0x31, 0x2e, 0x30, 0x20, 0x71, 0x63,=
 0x6f,
> > > +   0x6d, 0x70, 0x3d, 0x30, 0x2e, 0x36, 0x30, 0x20, 0x71, 0x70, 0x6d,=
 0x69,
> > > +   0x6e, 0x3d, 0x31, 0x30, 0x20, 0x71, 0x70, 0x6d, 0x61, 0x78, 0x3d,=
 0x35,
> > > +   0x31, 0x20, 0x71, 0x70, 0x73, 0x74, 0x65, 0x70, 0x3d, 0x34, 0x20,=
 0x69,
> > > +   0x70, 0x5f, 0x72, 0x61, 0x74, 0x69, 0x6f, 0x3d, 0x31, 0x2e, 0x34,=
 0x30,
> > > +   0x20, 0x61, 0x71, 0x3d, 0x31, 0x3a, 0x31, 0x2e, 0x30, 0x30, 0x00,=
 0x80,
> > > +   0x00, 0x00, 0x00, 0x01, 0x67, 0x4d, 0x40, 0x0a, 0x9a, 0x74, 0xf4,=
 0x20,
> > > +   0x00, 0x00, 0x03, 0x00, 0x20, 0x00, 0x00, 0x06, 0x51, 0xe2, 0x44,=
 0xd4,
> > > +   0x00, 0x00, 0x00, 0x01, 0x68, 0xee, 0x32, 0xc8, 0x00, 0x00, 0x00,=
 0x01,
> > > +   0x65, 0x88, 0x80, 0x20, 0x00, 0x08, 0x7f, 0xea, 0x6a, 0xe2, 0x99,=
 0xb6,
> > > +   0x57, 0xae, 0x49, 0x30, 0xf5, 0xfe, 0x5e, 0x46, 0x0b, 0x72, 0x44,=
 0xc4,
> > > +   0xe1, 0xfc, 0x62, 0xda, 0xf1, 0xfb, 0xa2, 0xdb, 0xd6, 0xbe, 0x5c,=
 0xd7,
> > > +   0x24, 0xa3, 0xf5, 0xb9, 0x2f, 0x57, 0x16, 0x49, 0x75, 0x47, 0x77,=
 0x09,
> > > +   0x5c, 0xa1, 0xb4, 0xc3, 0x4f, 0x60, 0x2b, 0xb0, 0x0c, 0xc8, 0xd6,=
 0x66,
> > > +   0xba, 0x9b, 0x82, 0x29, 0x33, 0x92, 0x26, 0x99, 0x31, 0x1c, 0x7f,=
 0x9b,
> > > +   0x00, 0x00, 0x01, 0x0ff,
> > > +};
> >
> > I can read that this contains a pretty large SEI, SPS, PPS, IDR and
> > finally this unspecified Nal 15 with no size, but I don't expect every
> > can. Maybe you could format this into nals, and document whatever you
> > know about this blob ? If you need info, I may suggest you do put that
> > into a file and use YUView software to parse it.
>
> While parsing the SEI was interesting, I think you can drop it
> entirely. It's a blob of user data the x264 adds so that you can get
> all the parameters that was passed to it. This even includes the URI
> http://www.videolan.org/x264.html and the SVN revision number of thex264 =
build.
>
> For the SPS bit, only thing that came out is that this is Main profile,
> do all supported generation of H264 decoder on Amlogic supports main ?
> To be conservative, it might be nice to encode a constrained-baseline
> one. You could also make it smaller by dropping the VUI parameters.
> Remember that the SEI and PPS are both bigger then the black slice
> being encoded.
>
> About "unspecified" NAL at the end, not sure if it's really needed, I'd
> try to drop it.
>

I actually had a talk with amlogic about this a while ago, their
summary was that this is a 16x16 encoded picture (so no wonder you
found a SPS & cie in it) that will trigger drain firmware side. It's a
complete hack but last time I checked this was their only way (in
vendor SDK) of draining the H.264 decoder. This blob is actually the
same that is sent by vendor userspace when trying to drain the
decoder, hence why I kept it.

I will see if we can find a way around this, or at least shorten this
packet. Thanks for all the insights!

> >
> > > +
> > > +static const u8 *codec_h264_eos_sequence(u32 *len)
> > > +{
> > > +   *len =3D ARRAY_SIZE(eos_sequence);
> > > +   return eos_sequence;
> > > +}
> > > +
> > > +struct codec_h264 {
> > > +   /* H.264 decoder requires an extended firmware */
> > > +   void      *ext_fw_vaddr;
> > > +   dma_addr_t ext_fw_paddr;
> > > +
> > > +   /* Buffer for the H.264 Workspace */
> > > +   void      *workspace_vaddr;
> > > +   dma_addr_t workspace_paddr;
> > > +
> > > +   /* Buffer for the H.264 references MV */
> > > +   void      *ref_vaddr;
> > > +   dma_addr_t ref_paddr;
> > > +   u32        ref_size;
> > > +
> > > +   /* Buffer for parsed SEI data */
> > > +   void      *sei_vaddr;
> > > +   dma_addr_t sei_paddr;
> > > +
> > > +   u32 mb_width;
> > > +   u32 mb_height;
> > > +   u32 max_refs;
> > > +};
> > > +
> > > +static int codec_h264_can_recycle(struct amvdec_core *core)
> > > +{
> > > +   return !amvdec_read_dos(core, AV_SCRATCH_7) ||
> > > +          !amvdec_read_dos(core, AV_SCRATCH_8);
> > > +}
> > > +
> > > +static void codec_h264_recycle(struct amvdec_core *core, u32 buf_idx=
)
> > > +{
> > > +   /*
> > > +    * Tell the firmware it can recycle this buffer.
> > > +    * AV_SCRATCH_8 serves the same purpose.
> > > +    */
> > > +   if (!amvdec_read_dos(core, AV_SCRATCH_7))
> > > +           amvdec_write_dos(core, AV_SCRATCH_7, buf_idx + 1);
> > > +   else
> > > +           amvdec_write_dos(core, AV_SCRATCH_8, buf_idx + 1);
> > > +}
> > > +
> > > +static int codec_h264_start(struct amvdec_session *sess)
> > > +{
> > > +   u32 workspace_offset;
> > > +   struct amvdec_core *core =3D sess->core;
> > > +   struct codec_h264 *h264 =3D sess->priv;
> > > +
> > > +   /* Allocate some memory for the H.264 decoder's state */
> > > +   h264->workspace_vaddr =3D
> > > +           dma_alloc_coherent(core->dev, SIZE_WORKSPACE,
> > > +                              &h264->workspace_paddr, GFP_KERNEL);
> > > +   if (!h264->workspace_vaddr)
> > > +           return -ENOMEM;
> > > +
> > > +   /* Allocate some memory for the H.264 SEI dump */
> > > +   h264->sei_vaddr =3D dma_alloc_coherent(core->dev, SIZE_SEI,
> > > +                                        &h264->sei_paddr, GFP_KERNEL=
);
> > > +   if (!h264->sei_vaddr)
> > > +           return -ENOMEM;
> > > +
> > > +   amvdec_write_dos_bits(core, POWER_CTL_VLD, BIT(9) | BIT(6));
> > > +
> > > +   workspace_offset =3D h264->workspace_paddr - WORKSPACE_BUF_OFFSET=
;
> > > +   amvdec_write_dos(core, AV_SCRATCH_1, workspace_offset);
> > > +   amvdec_write_dos(core, AV_SCRATCH_G, h264->ext_fw_paddr);
> > > +   amvdec_write_dos(core, AV_SCRATCH_I, h264->sei_paddr -
> > > +                                        workspace_offset);
> > > +
> > > +   /* Enable "error correction" */
> > > +   amvdec_write_dos(core, AV_SCRATCH_F,
> > > +                    (amvdec_read_dos(core, AV_SCRATCH_F) & 0xffffffc=
3) |
> > > +                    BIT(4) | BIT(7));
> > > +
> > > +   amvdec_write_dos(core, MDEC_PIC_DC_THRESH, 0x404038aa);
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +static int codec_h264_stop(struct amvdec_session *sess)
> > > +{
> > > +   struct codec_h264 *h264 =3D sess->priv;
> > > +   struct amvdec_core *core =3D sess->core;
> > > +
> > > +   if (h264->ext_fw_vaddr)
> > > +           dma_free_coherent(core->dev, SIZE_EXT_FW,
> > > +                             h264->ext_fw_vaddr, h264->ext_fw_paddr)=
;
> > > +
> > > +   if (h264->workspace_vaddr)
> > > +           dma_free_coherent(core->dev, SIZE_WORKSPACE,
> > > +                            h264->workspace_vaddr, h264->workspace_p=
addr);
> > > +
> > > +   if (h264->ref_vaddr)
> > > +           dma_free_coherent(core->dev, h264->ref_size,
> > > +                             h264->ref_vaddr, h264->ref_paddr);
> > > +
> > > +   if (h264->sei_vaddr)
> > > +           dma_free_coherent(core->dev, SIZE_SEI,
> > > +                             h264->sei_vaddr, h264->sei_paddr);
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +static int codec_h264_load_extended_firmware(struct amvdec_session *=
sess,
> > > +                                        const u8 *data, u32 len)
> > > +{
> > > +   struct codec_h264 *h264;
> > > +   struct amvdec_core *core =3D sess->core;
> > > +
> > > +   if (len < SIZE_EXT_FW)
> > > +           return -EINVAL;
> > > +
> > > +   h264 =3D kzalloc(sizeof(*h264), GFP_KERNEL);
> > > +   if (!h264)
> > > +           return -ENOMEM;
> > > +
> > > +   h264->ext_fw_vaddr =3D dma_alloc_coherent(core->dev, SIZE_EXT_FW,
> > > +                                         &h264->ext_fw_paddr, GFP_KE=
RNEL);
> > > +   if (!h264->ext_fw_vaddr) {
> > > +           kfree(h264);
> > > +           return -ENOMEM;
> > > +   }
> > > +
> > > +   memcpy(h264->ext_fw_vaddr, data, SIZE_EXT_FW);
> > > +   sess->priv =3D h264;
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +static const struct v4l2_fract par_table[] =3D {
> > > +   { 1, 1 },   { 1, 1 },    { 12, 11 }, { 10, 11 },
> > > +   { 16, 11 }, { 40, 33 },  { 24, 11 }, { 20, 11 },
> > > +   { 32, 11 }, { 80, 33 },  { 18, 11 }, { 15, 11 },
> > > +   { 64, 33 }, { 160, 99 }, { 4, 3 },   { 3, 2 },
> > > +   { 2, 1 }
> > > +};
> > > +
> > > +static void codec_h264_set_par(struct amvdec_session *sess)
> > > +{
> > > +   struct amvdec_core *core =3D sess->core;
> > > +   u32 seq_info =3D amvdec_read_dos(core, AV_SCRATCH_2);
> > > +   u32 ar_idc =3D (seq_info >> AR_IDC_BIT) & AR_IDC_MASK;
> > > +
> > > +   if (!(seq_info & AR_PRESENT_FLAG))
> > > +           return;
> > > +
> > > +   if (ar_idc =3D=3D AR_EXTEND) {
> > > +           u32 ar_info =3D amvdec_read_dos(core, AV_SCRATCH_3);
> > > +
> > > +           sess->pixelaspect.numerator =3D ar_info & 0xffff;
> > > +           sess->pixelaspect.denominator =3D (ar_info >> 16) & 0xfff=
f;
> > > +           return;
> > > +   }
> > > +
> > > +   if (ar_idc >=3D ARRAY_SIZE(par_table))
> > > +           return;
> > > +
> > > +   sess->pixelaspect =3D par_table[ar_idc];
> > > +}
> > > +
> > > +static void codec_h264_resume(struct amvdec_session *sess)
> > > +{
> > > +   struct amvdec_core *core =3D sess->core;
> > > +   struct codec_h264 *h264 =3D sess->priv;
> > > +   u32 mb_width, mb_height, mb_total;
> > > +
> > > +   amvdec_set_canvases(sess, (u32[]){ ANC0_CANVAS_ADDR, 0 },
> > > +                             (u32[]){ 24, 0 });
> > > +
> > > +   dev_dbg(core->dev, "max_refs =3D %u; actual_dpb_size =3D %u\n",
> > > +           h264->max_refs, sess->num_dst_bufs);
> > > +
> > > +   /* Align to a multiple of 4 macroblocks */
> > > +   mb_width =3D ALIGN(h264->mb_width, 4);
> > > +   mb_height =3D ALIGN(h264->mb_height, 4);
> > > +   mb_total =3D mb_width * mb_height;
> > > +
> > > +   h264->ref_size =3D mb_total * MB_MV_SIZE * h264->max_refs;
> > > +   h264->ref_vaddr =3D dma_alloc_coherent(core->dev, h264->ref_size,
> > > +                                        &h264->ref_paddr, GFP_KERNEL=
);
> > > +   if (!h264->ref_vaddr) {
> > > +           amvdec_abort(sess);
> > > +           return;
> > > +   }
> > > +
> > > +   /* Address to store the references' MVs */
> > > +   amvdec_write_dos(core, AV_SCRATCH_1, h264->ref_paddr);
> > > +   /* End of ref MV */
> > > +   amvdec_write_dos(core, AV_SCRATCH_4, h264->ref_paddr + h264->ref_=
size);
> > > +
> > > +   amvdec_write_dos(core, AV_SCRATCH_0, (h264->max_refs << 24) |
> > > +                                        (sess->num_dst_bufs << 16) |
> > > +                                        ((h264->max_refs - 1) << 8))=
;
> > > +}
> > > +
> > > +/**
> > > + * Configure the H.264 decoder when the parser detected a parameter =
set change
> > > + */
> > > +static void codec_h264_src_change(struct amvdec_session *sess)
> > > +{
> > > +   struct amvdec_core *core =3D sess->core;
> > > +   struct codec_h264 *h264 =3D sess->priv;
> > > +   u32 parsed_info, mb_total;
> > > +   u32 crop_infor, crop_bottom, crop_right;
> > > +   u32 frame_width, frame_height;
> > > +
> > > +   sess->keyframe_found =3D 1;
> > > +
> > > +   parsed_info =3D amvdec_read_dos(core, AV_SCRATCH_1);
> > > +
> > > +   /* Total number of 16x16 macroblocks */
> > > +   mb_total =3D (parsed_info >> MB_TOTAL_BIT) & MB_TOTAL_MASK;
> > > +   /* Number of macroblocks per line */
> > > +   h264->mb_width =3D parsed_info & MB_WIDTH_MASK;
> > > +   /* Number of macroblock lines */
> > > +   h264->mb_height =3D mb_total / h264->mb_width;
> > > +
> > > +   h264->max_refs =3D ((parsed_info >> MAX_REF_BIT) & MAX_REF_MASK) =
+ 1;
> > > +
> > > +   crop_infor =3D amvdec_read_dos(core, AV_SCRATCH_6);
> > > +   crop_bottom =3D (crop_infor & 0xff);
> > > +   crop_right =3D (crop_infor >> 16) & 0xff;
> > > +
> > > +   frame_width =3D h264->mb_width * 16 - crop_right;
> > > +   frame_height =3D h264->mb_height * 16 - crop_bottom;
> > > +
> > > +   dev_dbg(core->dev, "frame: %ux%u; crop: %u %u\n",
> > > +           frame_width, frame_height, crop_right, crop_bottom);
> > > +
> > > +   codec_h264_set_par(sess);
> > > +   amvdec_src_change(sess, frame_width, frame_height, h264->max_refs=
 + 5);
> > > +}
> > > +
> > > +/**
> > > + * The bitstream offset is split in half in 2 different registers.
> > > + * Fetch its MSB here, which location depends on the frame number.
> > > + */
> > > +static u32 get_offset_msb(struct amvdec_core *core, int frame_num)
> > > +{
> > > +   int take_msb =3D frame_num % 2;
> > > +   int reg_offset =3D (frame_num / 2) * 4;
> > > +   u32 offset_msb =3D amvdec_read_dos(core, AV_SCRATCH_A + reg_offse=
t);
> > > +
> > > +   if (take_msb)
> > > +           return offset_msb & 0xffff0000;
> > > +
> > > +   return (offset_msb & 0x0000ffff) << 16;
> > > +}
> > > +
> > > +static void codec_h264_frames_ready(struct amvdec_session *sess, u32=
 status)
> > > +{
> > > +   struct amvdec_core *core =3D sess->core;
> > > +   int error_count;
> > > +   int num_frames;
> > > +   int i;
> > > +
> > > +   error_count =3D amvdec_read_dos(core, AV_SCRATCH_D);
> > > +   num_frames =3D (status >> 8) & 0xff;
> > > +   if (error_count) {
> > > +           dev_warn(core->dev,
> > > +                    "decoder error(s) happened, count %d\n", error_c=
ount);
> > > +           amvdec_write_dos(core, AV_SCRATCH_D, 0);
> > > +   }
> > > +
> > > +   for (i =3D 0; i < num_frames; i++) {
> > > +           u32 frame_status =3D amvdec_read_dos(core, AV_SCRATCH_1 +=
 i * 4);
> > > +           u32 buffer_index =3D frame_status & BUF_IDX_MASK;
> > > +           u32 pic_struct =3D (frame_status >> PIC_STRUCT_BIT) &
> > > +                            PIC_STRUCT_MASK;
> > > +           u32 offset =3D (frame_status >> OFFSET_BIT) & OFFSET_MASK=
;
> > > +           u32 field =3D V4L2_FIELD_NONE;
> > > +
> > > +           /*
> > > +            * A buffer decode error means it was decoded,
> > > +            * but part of the picture will have artifacts.
> > > +            * Typical reason is a temporarily corrupted bitstream
> > > +            */
> > > +           if (frame_status & ERROR_FLAG)
> > > +                   dev_dbg(core->dev, "Buffer %d decode error\n",
> > > +                           buffer_index);
> > > +
> > > +           if (pic_struct =3D=3D PIC_TOP_BOT)
> > > +                   field =3D V4L2_FIELD_INTERLACED_TB;
> > > +           else if (pic_struct =3D=3D PIC_BOT_TOP)
> > > +                   field =3D V4L2_FIELD_INTERLACED_BT;
> > > +
> > > +           offset |=3D get_offset_msb(core, i);
> > > +           amvdec_dst_buf_done_idx(sess, buffer_index, offset, field=
);
> > > +   }
> > > +}
> > > +
> > > +static irqreturn_t codec_h264_threaded_isr(struct amvdec_session *se=
ss)
> > > +{
> > > +   struct amvdec_core *core =3D sess->core;
> > > +   u32 status;
> > > +   u32 size;
> > > +   u8 cmd;
> > > +
> > > +   status =3D amvdec_read_dos(core, AV_SCRATCH_0);
> > > +   cmd =3D status & CMD_MASK;
> > > +
> > > +   switch (cmd) {
> > > +   case CMD_SRC_CHANGE:
> > > +           codec_h264_src_change(sess);
> > > +           break;
> > > +   case CMD_FRAMES_READY:
> > > +           codec_h264_frames_ready(sess, status);
> > > +           break;
> > > +   case CMD_FATAL_ERROR:
> > > +           dev_err(core->dev, "H.264 decoder fatal error\n");
> > > +           goto abort;
> > > +   case CMD_BAD_WIDTH:
> > > +           size =3D (amvdec_read_dos(core, AV_SCRATCH_1) + 1) * 16;
> > > +           dev_err(core->dev, "Unsupported video width: %u\n", size)=
;
> > > +           goto abort;
> > > +   case CMD_BAD_HEIGHT:
> > > +           size =3D (amvdec_read_dos(core, AV_SCRATCH_1) + 1) * 16;
> > > +           dev_err(core->dev, "Unsupported video height: %u\n", size=
);
> > > +           goto abort;
> > > +   case 0: /* Unused but not worth printing for */
> > > +   case 9:
> > > +           break;
> > > +   default:
> > > +           dev_info(core->dev, "Unexpected H264 ISR: %08X\n", cmd);
> > > +           break;
> > > +   }
> > > +
> > > +   if (cmd && cmd !=3D CMD_SRC_CHANGE)
> > > +           amvdec_write_dos(core, AV_SCRATCH_0, 0);
> > > +
> > > +   /* Decoder has some SEI data for us ; ignore */
> > > +   if (amvdec_read_dos(core, AV_SCRATCH_J) & SEI_DATA_READY)
> > > +           amvdec_write_dos(core, AV_SCRATCH_J, 0);
> > > +
> > > +   return IRQ_HANDLED;
> > > +abort:
> > > +   amvdec_abort(sess);
> > > +   return IRQ_HANDLED;
> > > +}
> > > +
> > > +static irqreturn_t codec_h264_isr(struct amvdec_session *sess)
> > > +{
> > > +   struct amvdec_core *core =3D sess->core;
> > > +
> > > +   amvdec_write_dos(core, ASSIST_MBOX1_CLR_REG, 1);
> > > +
> > > +   return IRQ_WAKE_THREAD;
> > > +}
> > > +
> > > +struct amvdec_codec_ops codec_h264_ops =3D {
> > > +   .start =3D codec_h264_start,
> > > +   .stop =3D codec_h264_stop,
> > > +   .load_extended_firmware =3D codec_h264_load_extended_firmware,
> > > +   .isr =3D codec_h264_isr,
> > > +   .threaded_isr =3D codec_h264_threaded_isr,
> > > +   .can_recycle =3D codec_h264_can_recycle,
> > > +   .recycle =3D codec_h264_recycle,
> > > +   .eos_sequence =3D codec_h264_eos_sequence,
> > > +   .resume =3D codec_h264_resume,
> > > +};
> > > diff --git a/drivers/staging/media/meson/vdec/codec_h264.h b/drivers/=
staging/media/meson/vdec/codec_h264.h
> > > new file mode 100644
> > > index 000000000000..7cb4fb86ff36
> > > --- /dev/null
> > > +++ b/drivers/staging/media/meson/vdec/codec_h264.h
> > > @@ -0,0 +1,14 @@
> > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > +/*
> > > + * Copyright (C) 2019 BayLibre, SAS
> > > + * Author: Maxime Jourdan <mjourdan@baylibre.com>
> > > + */
> > > +
> > > +#ifndef __MESON_VDEC_CODEC_H264_H_
> > > +#define __MESON_VDEC_CODEC_H264_H_
> > > +
> > > +#include "vdec.h"
> > > +
> > > +extern struct amvdec_codec_ops codec_h264_ops;
> > > +
> > > +#endif
> > > diff --git a/drivers/staging/media/meson/vdec/vdec_platform.c b/drive=
rs/staging/media/meson/vdec/vdec_platform.c
> > > index accad8f8929a..025371ff8fae 100644
> > > --- a/drivers/staging/media/meson/vdec/vdec_platform.c
> > > +++ b/drivers/staging/media/meson/vdec/vdec_platform.c
> > > @@ -9,9 +9,22 @@
> > >
> > >  #include "vdec_1.h"
> > >  #include "codec_mpeg12.h"
> > > +#include "codec_h264.h"
> > >
> > >  static const struct amvdec_format vdec_formats_gxbb[] =3D {
> > >     {
> > > +           .pixfmt =3D V4L2_PIX_FMT_H264,
> > > +           .min_buffers =3D 2,
> > > +           .max_buffers =3D 24,
> > > +           .max_width =3D 1920,
> > > +           .max_height =3D 1080,
> > > +           .vdec_ops =3D &vdec_1_ops,
> > > +           .codec_ops =3D &codec_h264_ops,
> > > +           .firmware_path =3D "meson/vdec/gxbb_h264.bin",
> > > +           .pixfmts_cap =3D { V4L2_PIX_FMT_NV12M, 0 },
> > > +           .flags =3D V4L2_FMT_FLAG_COMPRESSED |
> > > +                    V4L2_FMT_FLAG_DYN_RESOLUTION,
> > > +   }, {
> > >             .pixfmt =3D V4L2_PIX_FMT_MPEG1,
> > >             .min_buffers =3D 8,
> > >             .max_buffers =3D 8,
> > > @@ -38,6 +51,18 @@ static const struct amvdec_format vdec_formats_gxb=
b[] =3D {
> > >
> > >  static const struct amvdec_format vdec_formats_gxl[] =3D {
> > >     {
> > > +           .pixfmt =3D V4L2_PIX_FMT_H264,
> > > +           .min_buffers =3D 2,
> > > +           .max_buffers =3D 24,
> > > +           .max_width =3D 3840,
> > > +           .max_height =3D 2160,
> > > +           .vdec_ops =3D &vdec_1_ops,
> > > +           .codec_ops =3D &codec_h264_ops,
> > > +           .firmware_path =3D "meson/vdec/gxl_h264.bin",
> > > +           .pixfmts_cap =3D { V4L2_PIX_FMT_NV12M, 0 },
> > > +           .flags =3D V4L2_FMT_FLAG_COMPRESSED |
> > > +                    V4L2_FMT_FLAG_DYN_RESOLUTION,
> > > +   }, {
> > >             .pixfmt =3D V4L2_PIX_FMT_MPEG1,
> > >             .min_buffers =3D 8,
> > >             .max_buffers =3D 8,
> > > @@ -64,6 +89,18 @@ static const struct amvdec_format vdec_formats_gxl=
[] =3D {
> > >
> > >  static const struct amvdec_format vdec_formats_gxm[] =3D {
> > >     {
> > > +           .pixfmt =3D V4L2_PIX_FMT_H264,
> > > +           .min_buffers =3D 2,
> > > +           .max_buffers =3D 24,
> > > +           .max_width =3D 3840,
> > > +           .max_height =3D 2160,
> > > +           .vdec_ops =3D &vdec_1_ops,
> > > +           .codec_ops =3D &codec_h264_ops,
> > > +           .firmware_path =3D "meson/vdec/gxm_h264.bin",
> > > +           .pixfmts_cap =3D { V4L2_PIX_FMT_NV12M, 0 },
> > > +           .flags =3D V4L2_FMT_FLAG_COMPRESSED |
> > > +                    V4L2_FMT_FLAG_DYN_RESOLUTION,
> > > +   }, {
> > >             .pixfmt =3D V4L2_PIX_FMT_MPEG1,
> > >             .min_buffers =3D 8,
> > >             .max_buffers =3D 8,
