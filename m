Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B443197C95
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2020 15:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730122AbgC3NOB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Mar 2020 09:14:01 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33657 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729995AbgC3NOB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Mar 2020 09:14:01 -0400
Received: by mail-ot1-f66.google.com with SMTP id 22so17942622otf.0;
        Mon, 30 Mar 2020 06:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lbt9jRdTvG/dqZDFfpXrgkGeRAeg0pVC23+EGyRmi4w=;
        b=iihphweFE/te2dTozr3IYju2zbuxnQZxtt5GR2nGNl1YP0ChxMqQVbh15oEanFomWS
         7KcQRN2ItoC1wJR7FDuevW8SL+24t29F0eJMFQOO+kyF+XVCoGwBn/+4Tf2c/pstxftk
         L7+HpNxFXX57nzkevMz8mVBcCbfdmtosHxMaQVjIYLRMFy96pPn1hpUsuBCTxULmSK1H
         IEDMoiIYh9CMyz/DOuzfYZnX+2HOzT+vgm7y+4qv0Rf2aqIZv3Ne+4hpZNINZNJKWU+P
         FcmXqoFqI+cu6wbz0mb7IntON11/6h0DK6OuZQWjGQKV1bOlessCmG490NzU6ZXcj6Ua
         1/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lbt9jRdTvG/dqZDFfpXrgkGeRAeg0pVC23+EGyRmi4w=;
        b=YYFQQx6XXad7m09XM2t8++MHo7bI6UIjL3xeBB5uyJ4fJFp+yPUXSpIrG2f7rCikDh
         ISj/v8tfBh1fkO+rDjc1MGNWJ7YQcRdqmz5SMWV9qituZqhN/RirZOQ/cC7qjods9isQ
         FZTE+s7XD+EcMcB3fkvE7ub7aeOUuw5yTPqTfXmGq7Yr1nuluY23koxtR2muc4cGFqGL
         Arfac5LY5PEDr5pwnA3xfm0Z6v54zOxgqhkpLARXJVMj9af2zR6QUef+Img5qjgmfSh1
         h2VJDT7BFVwk6/eoO+Xv2bcUShLYi0BCIvSnfA2Cnlv0BclM5yDwumwJojCCW3ryeumM
         0ioQ==
X-Gm-Message-State: ANhLgQ3Ns8HaBvJhFjERhtrGaE0QKkv8t/lXz+PgZntzmPf3gJKNUcNm
        3keSMxAvJrKmt+6sijw3f+I8365dqEOyE7dUGo8=
X-Google-Smtp-Source: ADFU+vsgXBgB+wnaslpu5aRRKpL2FGZrymcHL0xFskadU+m+iQM02AM0Z1cShdvzzyhezgTAZnNWe/vFGB9W0rVAQp0=
X-Received: by 2002:a9d:264a:: with SMTP id a68mr8756291otb.176.1585574039270;
 Mon, 30 Mar 2020 06:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <1583838364-12932-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1583838364-12932-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200310124605.GO2975348@oden.dyn.berto.se> <OSBPR01MB35905FFB621C2F4222692832AAFF0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
 <20200310140625.GA88560@oden.dyn.berto.se> <CA+V-a8vsYGdx6AtgqwS0LXREn4hu-EjVh2D5Dp_rHmpazBYG5A@mail.gmail.com>
 <20200319150329.GB3192108@oden.dyn.berto.se> <CA+V-a8u8=H-6WfaYMLWH73zo5ehP8cu9D-tdGULk=Hkvq4KuAQ@mail.gmail.com>
 <20200330120745.GA3213219@oden.dyn.berto.se>
In-Reply-To: <20200330120745.GA3213219@oden.dyn.berto.se>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 30 Mar 2020 14:13:32 +0100
Message-ID: <CA+V-a8vpOuSLet2os0COU2g=4dVtMM9Ym-Mf4Cb=JyPbUrP=jw@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Mon, Mar 30, 2020 at 1:07 PM Niklas <niklas.soderlund@ragnatech.se> wrot=
e:
>
> Hi Lad,
>
> Thanks for your reply.
>
> On 2020-03-27 12:59:52 +0000, Lad, Prabhakar wrote:
> > Hi Niklas,
> >
> > On Thu, Mar 19, 2020 at 3:03 PM Niklas <niklas.soderlund@ragnatech.se> =
wrote:
> > >
> > > Hi Prabhakar,
> > >
> > > Thanks for the sample files, sorry I did not have time before now to
> > > look at them. After doing so I believe I know what is wrong, see bell=
ow.
> > >
> > > On 2020-03-15 19:35:58 +0000, Lad, Prabhakar wrote:
> > > > Hi Niklas,
> > > >
> > > > On Tue, Mar 10, 2020 at 2:06 PM Niklas <niklas.soderlund@ragnatech.=
se> wrote:
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
> > > > > > > To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesa=
s.com>
> > > > > > > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>; linux-
> > > > > > > media@vger.kernel.org; linux-renesas-soc@vger.kernel.org; lin=
ux-
> > > > > > > kernel@vger.kernel.org; Lad Prabhakar <prabhakar.csengg@gmail=
.com>
> > > > > > > Subject: Re: [PATCH v2 2/3] media: rcar-vin: Add support for
> > > > > > > MEDIA_BUS_FMT_SRGGB8_1X8 format
> > > > > > >
> > > > > > > Hi Lad,
> > > > > > >
> > > > > > > Thanks for your work.
> > > > > > >
> > > > > > > On 2020-03-10 11:06:03 +0000, Lad Prabhakar wrote:
> > > > > > > > Add support for MEDIA_BUS_FMT_SRGGB8_1X8 format in rcar-vin=
 by
> > > > > > > setting
> > > > > > > > format type to RAW8 in VNMC register and appropriately sett=
ing the
> > > > > > > > bpp, bytesperline to enable V4L2_PIX_FMT_SRGGB8.
> > > > > > > >
> > > > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-
> > > > > > > lad.rj@bp.renesas.com>
> > > > > > > > ---
> > > > > > > >  drivers/media/platform/rcar-vin/rcar-core.c |  1 +
> > > > > > > > drivers/media/platform/rcar-vin/rcar-dma.c  |  9 ++++++++-
> > > > > > > > drivers/media/platform/rcar-vin/rcar-v4l2.c | 13 ++++++++++=
++-
> > > > > > > >  3 files changed, 21 insertions(+), 2 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/media/platform/rcar-vin/rcar-core.c
> > > > > > > > b/drivers/media/platform/rcar-vin/rcar-core.c
> > > > > > > > index 7440c89..76daf2f 100644
> > > > > > > > --- a/drivers/media/platform/rcar-vin/rcar-core.c
> > > > > > > > +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> > > > > > > > @@ -469,6 +469,7 @@ static int rvin_parallel_subdevice_atta=
ch(struct
> > > > > > > rvin_dev *vin,
> > > > > > > >  case MEDIA_BUS_FMT_UYVY8_2X8:
> > > > > > > >  case MEDIA_BUS_FMT_UYVY10_2X10:
> > > > > > > >  case MEDIA_BUS_FMT_RGB888_1X24:
> > > > > > > > +case MEDIA_BUS_FMT_SRGGB8_1X8:
> > > > > > > >  vin->mbus_code =3D code.code;
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
> > > > > > > > @@ -587,7 +588,6 @@ void rvin_crop_scale_comp(struct rvin_d=
ev *vin)
> > > > > > > >  rvin_write(vin, vin->crop.top, VNSLPRC_REG);
> > > > > > > >  rvin_write(vin, vin->crop.top + vin->crop.height - 1, VNEL=
PRC_REG);
> > > > > > > >
> > > > > > > > -
> > > > > > > >  /* TODO: Add support for the UDS scaler. */
> > > > > > > >  if (vin->info->model !=3D RCAR_GEN3)
> > > > > > > >  rvin_crop_scale_comp_gen2(vin);
> > > > > > > > @@ -676,6 +676,9 @@ static int rvin_setup(struct rvin_dev *=
vin)
> > > > > > > >
> > > > > > > >  input_is_yuv =3D true;
> > > > > > > >  break;
> > > > > > > > +case MEDIA_BUS_FMT_SRGGB8_1X8:
> > > > > > > > +vnmc |=3D VNMC_INF_RAW8;
> > > > > > > > +break;
> > > > > > > >  default:
> > > > > > > >  break;
> > > > > > > >  }
> > > > > > > > @@ -737,6 +740,9 @@ static int rvin_setup(struct rvin_dev *=
vin)
> > > > > > > >  case V4L2_PIX_FMT_ABGR32:
> > > > > > > >  dmr =3D VNDMR_A8BIT(vin->alpha) | VNDMR_EXRGB |
> > > > > > > VNDMR_DTMD_ARGB;
> > > > > > > >  break;
> > > > > > > > +case V4L2_PIX_FMT_SRGGB8:
> > > > > > > > +dmr =3D 0;
> > > > > > > > +break;
> > > > > > > >  default:
> > > > > > > >  vin_err(vin, "Invalid pixelformat (0x%x)\n",
> > > > > > > >  vin->format.pixelformat);
> > > > > > > > @@ -1110,6 +1116,7 @@ static int rvin_mc_validate_format(st=
ruct
> > > > > > > rvin_dev *vin, struct v4l2_subdev *sd,
> > > > > > > >  case MEDIA_BUS_FMT_UYVY8_2X8:
> > > > > > > >  case MEDIA_BUS_FMT_UYVY10_2X10:
> > > > > > > >  case MEDIA_BUS_FMT_RGB888_1X24:
> > > > > > > > +case MEDIA_BUS_FMT_SRGGB8_1X8:
> > > > > > > >  vin->mbus_code =3D fmt.format.code;
> > > > > > > >  break;
> > > > > > > >  default:
> > > > > > > > diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > > > > > > > b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > > > > > > > index 5151a3c..4698099 100644
> > > > > > > > --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > > > > > > > +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > > > > > > > @@ -66,6 +66,10 @@ static const struct rvin_video_format rv=
in_formats[]
> > > > > > > =3D {
> > > > > > > >  .fourcc=3D V4L2_PIX_FMT_ABGR32,
> > > > > > > >  .bpp=3D 4,
> > > > > > > >  },
> > > > > > > > +{
> > > > > > > > +.fourcc=3D V4L2_PIX_FMT_SRGGB8,
> > > > > > > > +.bpp=3D 2,
> > > > > > >
> > > > > > > This does not look right, is not bytes-per-pixel 1 for a SRGG=
B8?
> > > > > > >
> > > > > > I guessed the bpp's were picked from VnIS table as I result I d=
id the same.
> > > > > >
> > > > > > > > +},
> > > > > > > >  };
> > > > > > > >
> > > > > > > >  const struct rvin_video_format *rvin_format_from_pixel(str=
uct
> > > > > > > > rvin_dev *vin, @@ -102,6 +106,7 @@ static u32
> > > > > > > > rvin_format_bytesperline(struct rvin_dev *vin,  {
> > > > > > > >  const struct rvin_video_format *fmt;
> > > > > > > >  u32 align;
> > > > > > > > +u8 div;
> > > > > > > >
> > > > > > > >  fmt =3D rvin_format_from_pixel(vin, pix->pixelformat);
> > > > > > > >
> > > > > > > > @@ -112,16 +117,22 @@ static u32 rvin_format_bytesperline(s=
truct
> > > > > > > rvin_dev *vin,
> > > > > > > >  case V4L2_PIX_FMT_NV12:
> > > > > > > >  case V4L2_PIX_FMT_NV16:
> > > > > > > >  align =3D 0x20;
> > > > > > > > +div =3D 1;
> > > > > > > > +break;
> > > > > > > > +case V4L2_PIX_FMT_SRGGB8:
> > > > > > > > +align =3D 0x10;
> > > > > > > > +div =3D 2;
> > > > > > >
> > > > > > > Yes this does not look right at all, I think you should set b=
pp to 1 and drop the
> > > > > > > div handling here.
> > > > > > >
> > > > > > If I set bpp as 1 and drop the div VNIS_REG will be wrongly con=
figured in
> > > > > > rvin_crop_scale_comp() and the image captured will be wrong.
> > > > > >
> > > > > > For example for 640x480:
> > > > > >
> > > > > > With the current patch bpp =3D 2:
> > > > > > bytesperline =3D 640
> > > > >
> > > > > This is wrong, if we have a line of 640 pixels and 2 bytes per pi=
xel
> > > > > then bytesperline must be at least 1280 bytes right?
> > > > >
> > > > > > image size =3D 307200
> > > > > > stride =3D 320
> > > > >
> > > > > But this is incorrect, the VNIS_REG shall be at least the number =
of
> > > > > pixels in a line (EPPrC - SPPrC -> 640 - 0 =3D 640). Then we need=
 to align
> > > > > it to the pixel unit (16, 32, 64, 128) depending on the output pi=
xel
> > > > > format.
> > > > >
> > > > > This usually result in a stride that is larger then the line leng=
th.
> > > > > Thus you need a test application that knows the difference betwee=
n width
> > > > > * bpp and bytesperline. I use qv4l2 without opengl support when I=
 do quick
> > > > > tests and it does not support this hence I get a incorrect visual=
 view
> > > > > of the stream when testing.
> > > > >
> > > > > How does the image capture fail with bpp =3D 1?
> > > > >
> > > > Attached is the captured bayer images 640x480 with bpp set to 1, fo=
r
> > > > file1bppstridediv1.raw
> > > > VNIS_REG stride set to 640 and for file file1bppstridediv2.raw
> > > > VNIS_REF stride  set to (640 * 1) / 2.
> > > > When the file1bppstridediv1.raw image is converted to png colors ar=
e incorrect
> > > > but whereas file1bppstridediv2.raw converted to png the picture is =
clear.
> > > >
> > > > Also while doing a loop-back to fbdevsink with the below pipeline:
> > > > gst-launch-1.0 -vvv v4l2src device=3D/dev/video0 io-mode=3Ddmabuf !=
 'video/x-bayer,
> > > > format=3Drggb,width=3D640,height=3D480,framerate=3D30/1' ! queue ! =
bayer2rgb !
> > > > videoconvert
> > > > ! fbdevsink sync=3Dfalse
> > > >
> > > > width =3D 640 height =3D 480 bpp =3D 1, bytesperline =3D 640 stride=
 =3D 320
> > > > works correctly
> > > > width =3D 640 height =3D 480 bpp =3D 1, bytesperline =3D 640 stride=
 =3D 640
> > > > image displayed is incorrect
> > >
> > > It's very unlogical to have a stride that is less then the width, whi=
ch
> > > got me interested why the second one gave you better results. I wrote=
 a
> > > small python hack which converts the raw SRGGB8 to PNG without any
> > > debyaer, just rows of RGRGRG and BGBGBG.
> > >
> > Finally I have some information from the hardware team, the VIN process=
 RAW8
> > in 2 pixel units as a result the stride for RAW8 needs to be
> > configured as bytesperline/2.
>
> Interesting, that is not how I have interpreted the datasheet. But
> rereading it now after our discussion I see how it could be so. I will
> dig into it during the week and see if I get make it all click in my
> head. Thanks for pointing this out.
>
Great, In that case Ill wait before I post a V4.

> >
> > The python script which you attached doesn't seem to do the right
> > conversion. I discovered
> > that Shotwell Viewer on Ubuntu can open raw files. I also confirmed
> > this by bayer2rg [1]
>
> Oops, you are right. My bad sorry for sending you down that path.
>
That gave me an opportunity to explore a bit :)

Cheers,
--Prabhakar

> >
> > # ./bayer2rgb --input=3Dfile1bppstridediv1.raw --output=3Dfile1.tiff
> > --width=3D640 --height=3D480 --bpp=3D8 --first=3DRGGB --method=3DBILINE=
AR --tiff
> > # ./bayer2rgb --input=3Dfile1bppstridediv2.raw --output=3Dfile2.tiff
> > --width=3D640 --height=3D480 --bpp=3D8 --first=3DRGGB --method=3DBILINE=
AR --tiff
> >
> > # convert file1.tiff file1bppstridediv1.png
> > # convert file2.tiff file1bppstridediv2.png
> >
> > Attached are the png images for reference.
> >
> > > Looking at the output of that seems your sensor is not sending frames=
 of
> > > 640x480 but 480x640. Both the raw files you sent have holes in them.
> > > The first line is always 480 pixels of data and then there are sectio=
ns
> > > of no data, followed by good data. Some rows are chopped and some hav=
e
> > > their 480 bytes of good data on the "left" and some on the "right" si=
de
> > > of the frame.
> > >
> > I can confirm the sensor is sending 640x480 as the support for same
> > was added recently in IMX219 driver
> > and  was  was tested on raspi by the maintainer.
> >
> > [1] https://github.com/jdthomas/bayer2rgb
> >
> > Cheers,
> > --Prabhakar
> >
> > > So for rcar-vin I think the following settings are what you want,
> > >
> > >     width =3D 480 height =3D 640 bpp =3D 1, bytesperline =3D 480* str=
ide =3D 480
> > >     * =3D I have not checked if this fits with alignment for VNIS
> > >
> > > I have attached the python hack and the two generated png files from
> > > your raw files so you can play with them yourself.
> > >
> > > >
> > > > Cheers,
> > > > --Prabhakar
> > > >
> > > > > >
> > > > > > And with bpp =3D 1 and div removed
> > > > > > bytesperline =3D 640
> > > > > > image size =3D 307200
> > > > > > stride =3D 640
> > > > >
> > > > >
> > > > > >
> > > > > > Cheers,
> > > > > > --Prabhakar
> > > > > >
> > > > > > > >  break;
> > > > > > > >  default:
> > > > > > > >  align =3D 0x10;
> > > > > > > > +div =3D 1;
> > > > > > > >  break;
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  if (V4L2_FIELD_IS_SEQUENTIAL(pix->field))
> > > > > > > >  align =3D 0x80;
> > > > > > > >
> > > > > > > > -return ALIGN(pix->width, align) * fmt->bpp;
> > > > > > > > +return ALIGN(pix->width / div, align) * fmt->bpp;
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  static u32 rvin_format_sizeimage(struct v4l2_pix_format *p=
ix)
> > > > > > > > --
> > > > > > > > 2.7.4
> > > > > > > >
> > > > > > >
> > > > > > > --
> > > > > > > Regards,
> > > > > > > Niklas S=C3=B6derlund
> > > > > >
> > > > > >
> > > > > > Renesas Electronics Europe GmbH, Geschaeftsfuehrer/President: C=
arsten Jauch, Sitz der Gesellschaft/Registered office: Duesseldorf, Arcadia=
strasse 10, 40472 Duesseldorf, Germany, Handelsregister/Commercial Register=
: Duesseldorf, HRB 3708 USt-IDNr./Tax identification no.: DE 119353406 WEEE=
-Reg.-Nr./WEEE reg. no.: DE 14978647
> > > > >
> > > > > --
> > > > > Regards,
> > > > > Niklas S=C3=B6derlund
> > >
> > >
> > >
> > >
> > > --
> > > Regards,
> > > Niklas S=C3=B6derlund
>
>
>
>
> --
> Regards,
> Niklas S=C3=B6derlund
