Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E216C19FB4A
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 19:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729404AbgDFRVB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 13:21:01 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33715 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728569AbgDFRVB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 13:21:01 -0400
Received: by mail-ot1-f65.google.com with SMTP id 22so170033otf.0;
        Mon, 06 Apr 2020 10:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MvhWWihKbea1kmk1rlHsrZn7779c/3cXb44g4kdQchI=;
        b=NUVw631dyotaSidRVM+IwLC4vgl1VZwNg9hSkl7L1jGfc0jH916/hNdfF2ixZnp5m5
         H/0lspQULcMRUYNvzfjsZjy5LSbIGVEbtXd7UoizmwtF9HtMRy4xCXF5Bjxok2hdIJ6C
         2Wnu4QerWzQJFRw6FiHybGUIAZFivvCffISo7Bsy/hslC2YTyj6mGljPpZfISHgTMSq/
         XxR4BwYbGyJ13+SXBrokq9Hb6wwrem0qBbG6R6YfzZ0d20o2fRKmuZGxV3pdg3xK6Rbq
         ug+Q8cGFeZR+9BvsUstgA7uFoiawW/7B16FeC1fxo5iO75bZ5ubnzDj63r2OzintxNHK
         lZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MvhWWihKbea1kmk1rlHsrZn7779c/3cXb44g4kdQchI=;
        b=MbzmjuKWsrU08/BNvpOCPsv4YoQXDgTSeAOjMT73ttyXCAsAy2+RA+3IU8xtdPeBFI
         DRJH8p9eVbRVFG0vd3ckWd+oilmDt29VdbKsNc6g6qccZm6EcjYRh8FqQ5g/H9T1qkqq
         sOmE439KyyKlGlEi53fIZ16Hj1iVJyZko9M+ORkr0vxM/HP14f7p9sqe5p/rcVAE5LsB
         MYwzJ2GzWzW0VPkKm1N7bto+FF52fp4+7wKPzBzkbb4qSn+YoIo16xZYOGxXfg+yC9tA
         JyQtNnS8WFSyCSli48pWZ5YJ1960YwKHukHiuF9ecRNEXnyPma/AQHBUTEBKKb0KXBM1
         n6wQ==
X-Gm-Message-State: AGi0PuaMVYfNK6o1Ir/W7/rIy5UyDuCCLwreSzqbOAs/Cv4kVqE/qZgD
        dQZTFDunrewUW8L2XcNT+3e7WGPtywCPGV6s7Po=
X-Google-Smtp-Source: APiQypLZEqKH/j4/sOJ6+EKOmiqj3CZ/zMGjtWQXpazbD4V0kD4yYZ+DZA2QQ5JSJhkVcufyyevNNfVOUjBDd+YfYDI=
X-Received: by 2002:a4a:d88b:: with SMTP id b11mr197968oov.42.1586193659608;
 Mon, 06 Apr 2020 10:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <1583838364-12932-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1583838364-12932-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200310124605.GO2975348@oden.dyn.berto.se> <OSBPR01MB35905FFB621C2F4222692832AAFF0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
 <20200310140625.GA88560@oden.dyn.berto.se> <CA+V-a8vsYGdx6AtgqwS0LXREn4hu-EjVh2D5Dp_rHmpazBYG5A@mail.gmail.com>
 <20200319150329.GB3192108@oden.dyn.berto.se> <CA+V-a8u8=H-6WfaYMLWH73zo5ehP8cu9D-tdGULk=Hkvq4KuAQ@mail.gmail.com>
 <20200330120745.GA3213219@oden.dyn.berto.se>
In-Reply-To: <20200330120745.GA3213219@oden.dyn.berto.se>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 6 Apr 2020 18:20:33 +0100
Message-ID: <CA+V-a8vbTc0DZ15y0zZ97PH6khwQVxz=M-8_kgx1AiKkdg5QaA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] media: rcar-vin: Add support for
 MEDIA_BUS_FMT_SRGGB8_1X8 format
To:     Niklas <niklas.soderlund@ragnatech.se>
Cc:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HI Niklas,

On Mon, Mar 30, 2020 at 1:07 PM Niklas <niklas.soderlund@ragnatech.se> wrote:
>
> Hi Lad,
>
> Thanks for your reply.
>
> On 2020-03-27 12:59:52 +0000, Lad, Prabhakar wrote:
> > Hi Niklas,
> >
> > On Thu, Mar 19, 2020 at 3:03 PM Niklas <niklas.soderlund@ragnatech.se> wrote:
> > >
> > > Hi Prabhakar,
> > >
> > > Thanks for the sample files, sorry I did not have time before now to
> > > look at them. After doing so I believe I know what is wrong, see bellow.
> > >
> > > On 2020-03-15 19:35:58 +0000, Lad, Prabhakar wrote:
> > > > Hi Niklas,
> > > >
> > > > On Tue, Mar 10, 2020 at 2:06 PM Niklas <niklas.soderlund@ragnatech.se> wrote:
> > > > >
> > > > > Hi Lad,
> > > > >
> > > > > On 2020-03-10 13:42:20 +0000, Prabhakar Mahadev Lad wrote:
> > > > > > Hi Niklas,
> > > > > >
> > > > > > Thank for the review.
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: Niklas <niklas.soderlund@ragnatech.se>
> > > > > > > Sent: 10 March 2020 12:46
> > > > > > > To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>; linux-
> > > > > > > media@vger.kernel.org; linux-renesas-soc@vger.kernel.org; linux-
> > > > > > > kernel@vger.kernel.org; Lad Prabhakar <prabhakar.csengg@gmail.com>
> > > > > > > Subject: Re: [PATCH v2 2/3] media: rcar-vin: Add support for
> > > > > > > MEDIA_BUS_FMT_SRGGB8_1X8 format
> > > > > > >
> > > > > > > Hi Lad,
> > > > > > >
> > > > > > > Thanks for your work.
> > > > > > >
> > > > > > > On 2020-03-10 11:06:03 +0000, Lad Prabhakar wrote:
> > > > > > > > Add support for MEDIA_BUS_FMT_SRGGB8_1X8 format in rcar-vin by
> > > > > > > setting
> > > > > > > > format type to RAW8 in VNMC register and appropriately setting the
> > > > > > > > bpp, bytesperline to enable V4L2_PIX_FMT_SRGGB8.
> > > > > > > >
> > > > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-
> > > > > > > lad.rj@bp.renesas.com>
> > > > > > > > ---
> > > > > > > >  drivers/media/platform/rcar-vin/rcar-core.c |  1 +
> > > > > > > > drivers/media/platform/rcar-vin/rcar-dma.c  |  9 ++++++++-
> > > > > > > > drivers/media/platform/rcar-vin/rcar-v4l2.c | 13 ++++++++++++-
> > > > > > > >  3 files changed, 21 insertions(+), 2 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/media/platform/rcar-vin/rcar-core.c
> > > > > > > > b/drivers/media/platform/rcar-vin/rcar-core.c
> > > > > > > > index 7440c89..76daf2f 100644
> > > > > > > > --- a/drivers/media/platform/rcar-vin/rcar-core.c
> > > > > > > > +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> > > > > > > > @@ -469,6 +469,7 @@ static int rvin_parallel_subdevice_attach(struct
> > > > > > > rvin_dev *vin,
> > > > > > > >  case MEDIA_BUS_FMT_UYVY8_2X8:
> > > > > > > >  case MEDIA_BUS_FMT_UYVY10_2X10:
> > > > > > > >  case MEDIA_BUS_FMT_RGB888_1X24:
> > > > > > > > +case MEDIA_BUS_FMT_SRGGB8_1X8:
> > > > > > > >  vin->mbus_code = code.code;
> > > > > > > >  vin_dbg(vin, "Found media bus format for %s: %d\n",
> > > > > > > >  subdev->name, vin->mbus_code);
> > > > > > > > diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c
> > > > > > > > b/drivers/media/platform/rcar-vin/rcar-dma.c
> > > > > > > > index 1a30cd0..1c1fafa 100644
> > > > > > > > --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> > > > > > > > +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> > > > > > > > @@ -85,6 +85,7 @@
> > > > > > > >  #define VNMC_INF_YUV8_BT601(1 << 16)
> > > > > > > >  #define VNMC_INF_YUV10_BT656(2 << 16)
> > > > > > > >  #define VNMC_INF_YUV10_BT601(3 << 16)
> > > > > > > > +#define VNMC_INF_RAW8(4 << 16)
> > > > > > > >  #define VNMC_INF_YUV16(5 << 16)
> > > > > > > >  #define VNMC_INF_RGB888(6 << 16)
> > > > > > > >  #define VNMC_VUP(1 << 10)
> > > > > > > > @@ -587,7 +588,6 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
> > > > > > > >  rvin_write(vin, vin->crop.top, VNSLPRC_REG);
> > > > > > > >  rvin_write(vin, vin->crop.top + vin->crop.height - 1, VNELPRC_REG);
> > > > > > > >
> > > > > > > > -
> > > > > > > >  /* TODO: Add support for the UDS scaler. */
> > > > > > > >  if (vin->info->model != RCAR_GEN3)
> > > > > > > >  rvin_crop_scale_comp_gen2(vin);
> > > > > > > > @@ -676,6 +676,9 @@ static int rvin_setup(struct rvin_dev *vin)
> > > > > > > >
> > > > > > > >  input_is_yuv = true;
> > > > > > > >  break;
> > > > > > > > +case MEDIA_BUS_FMT_SRGGB8_1X8:
> > > > > > > > +vnmc |= VNMC_INF_RAW8;
> > > > > > > > +break;
> > > > > > > >  default:
> > > > > > > >  break;
> > > > > > > >  }
> > > > > > > > @@ -737,6 +740,9 @@ static int rvin_setup(struct rvin_dev *vin)
> > > > > > > >  case V4L2_PIX_FMT_ABGR32:
> > > > > > > >  dmr = VNDMR_A8BIT(vin->alpha) | VNDMR_EXRGB |
> > > > > > > VNDMR_DTMD_ARGB;
> > > > > > > >  break;
> > > > > > > > +case V4L2_PIX_FMT_SRGGB8:
> > > > > > > > +dmr = 0;
> > > > > > > > +break;
> > > > > > > >  default:
> > > > > > > >  vin_err(vin, "Invalid pixelformat (0x%x)\n",
> > > > > > > >  vin->format.pixelformat);
> > > > > > > > @@ -1110,6 +1116,7 @@ static int rvin_mc_validate_format(struct
> > > > > > > rvin_dev *vin, struct v4l2_subdev *sd,
> > > > > > > >  case MEDIA_BUS_FMT_UYVY8_2X8:
> > > > > > > >  case MEDIA_BUS_FMT_UYVY10_2X10:
> > > > > > > >  case MEDIA_BUS_FMT_RGB888_1X24:
> > > > > > > > +case MEDIA_BUS_FMT_SRGGB8_1X8:
> > > > > > > >  vin->mbus_code = fmt.format.code;
> > > > > > > >  break;
> > > > > > > >  default:
> > > > > > > > diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > > > > > > > b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > > > > > > > index 5151a3c..4698099 100644
> > > > > > > > --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > > > > > > > +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > > > > > > > @@ -66,6 +66,10 @@ static const struct rvin_video_format rvin_formats[]
> > > > > > > = {
> > > > > > > >  .fourcc= V4L2_PIX_FMT_ABGR32,
> > > > > > > >  .bpp= 4,
> > > > > > > >  },
> > > > > > > > +{
> > > > > > > > +.fourcc= V4L2_PIX_FMT_SRGGB8,
> > > > > > > > +.bpp= 2,
> > > > > > >
> > > > > > > This does not look right, is not bytes-per-pixel 1 for a SRGGB8?
> > > > > > >
> > > > > > I guessed the bpp's were picked from VnIS table as I result I did the same.
> > > > > >
> > > > > > > > +},
> > > > > > > >  };
> > > > > > > >
> > > > > > > >  const struct rvin_video_format *rvin_format_from_pixel(struct
> > > > > > > > rvin_dev *vin, @@ -102,6 +106,7 @@ static u32
> > > > > > > > rvin_format_bytesperline(struct rvin_dev *vin,  {
> > > > > > > >  const struct rvin_video_format *fmt;
> > > > > > > >  u32 align;
> > > > > > > > +u8 div;
> > > > > > > >
> > > > > > > >  fmt = rvin_format_from_pixel(vin, pix->pixelformat);
> > > > > > > >
> > > > > > > > @@ -112,16 +117,22 @@ static u32 rvin_format_bytesperline(struct
> > > > > > > rvin_dev *vin,
> > > > > > > >  case V4L2_PIX_FMT_NV12:
> > > > > > > >  case V4L2_PIX_FMT_NV16:
> > > > > > > >  align = 0x20;
> > > > > > > > +div = 1;
> > > > > > > > +break;
> > > > > > > > +case V4L2_PIX_FMT_SRGGB8:
> > > > > > > > +align = 0x10;
> > > > > > > > +div = 2;
> > > > > > >
> > > > > > > Yes this does not look right at all, I think you should set bpp to 1 and drop the
> > > > > > > div handling here.
> > > > > > >
> > > > > > If I set bpp as 1 and drop the div VNIS_REG will be wrongly configured in
> > > > > > rvin_crop_scale_comp() and the image captured will be wrong.
> > > > > >
> > > > > > For example for 640x480:
> > > > > >
> > > > > > With the current patch bpp = 2:
> > > > > > bytesperline = 640
> > > > >
> > > > > This is wrong, if we have a line of 640 pixels and 2 bytes per pixel
> > > > > then bytesperline must be at least 1280 bytes right?
> > > > >
> > > > > > image size = 307200
> > > > > > stride = 320
> > > > >
> > > > > But this is incorrect, the VNIS_REG shall be at least the number of
> > > > > pixels in a line (EPPrC - SPPrC -> 640 - 0 = 640). Then we need to align
> > > > > it to the pixel unit (16, 32, 64, 128) depending on the output pixel
> > > > > format.
> > > > >
> > > > > This usually result in a stride that is larger then the line length.
> > > > > Thus you need a test application that knows the difference between width
> > > > > * bpp and bytesperline. I use qv4l2 without opengl support when I do quick
> > > > > tests and it does not support this hence I get a incorrect visual view
> > > > > of the stream when testing.
> > > > >
> > > > > How does the image capture fail with bpp = 1?
> > > > >
> > > > Attached is the captured bayer images 640x480 with bpp set to 1, for
> > > > file1bppstridediv1.raw
> > > > VNIS_REG stride set to 640 and for file file1bppstridediv2.raw
> > > > VNIS_REF stride  set to (640 * 1) / 2.
> > > > When the file1bppstridediv1.raw image is converted to png colors are incorrect
> > > > but whereas file1bppstridediv2.raw converted to png the picture is clear.
> > > >
> > > > Also while doing a loop-back to fbdevsink with the below pipeline:
> > > > gst-launch-1.0 -vvv v4l2src device=/dev/video0 io-mode=dmabuf ! 'video/x-bayer,
> > > > format=rggb,width=640,height=480,framerate=30/1' ! queue ! bayer2rgb !
> > > > videoconvert
> > > > ! fbdevsink sync=false
> > > >
> > > > width = 640 height = 480 bpp = 1, bytesperline = 640 stride = 320
> > > > works correctly
> > > > width = 640 height = 480 bpp = 1, bytesperline = 640 stride = 640
> > > > image displayed is incorrect
> > >
> > > It's very unlogical to have a stride that is less then the width, which
> > > got me interested why the second one gave you better results. I wrote a
> > > small python hack which converts the raw SRGGB8 to PNG without any
> > > debyaer, just rows of RGRGRG and BGBGBG.
> > >
> > Finally I have some information from the hardware team, the VIN process RAW8
> > in 2 pixel units as a result the stride for RAW8 needs to be
> > configured as bytesperline/2.
>
> Interesting, that is not how I have interpreted the datasheet. But
> rereading it now after our discussion I see how it could be so. I will
> dig into it during the week and see if I get make it all click in my
> head. Thanks for pointing this out.
>
Did you manage to get the required information on this ?

Cheers,
--Prabhakar
