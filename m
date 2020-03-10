Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65CB417FEDA
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 14:42:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbgCJNm2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 09:42:28 -0400
Received: from mail-eopbgr1400127.outbound.protection.outlook.com ([40.107.140.127]:42677
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726269AbgCJNm2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 09:42:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBgZmaKayxoSxm0qpLHUtLBEMsQZ702nEvCVcMw7DsUelceh5KbbHe3dr5sqLLaDlceFT/bVrkSf2wna1R1ZSVnwvfMi63gsjHP2A8xIKn35P5HVD7GoPwoThXU90WEcK4zh/GxRGNCK+vwrsmxh4Z+AfiG1Kg4fN1310Wan7AInGIIUK6jPmzT/PQSZ3KkNuWxpw5LMs3mJLZxbcb228SJ7IRhIKyq7zl5k7TTI5xsxXjP1CFd/Vb5wyfMhsUfxXCPml/AlT6pE2u8Jm61QXzymO7iUxl0T91NMsxEJQbShj1itUKgz7Ohcrtahyqs5Thq4U7d2JEXj2g5ej5uIzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pabJzcK1Gnsm++spuq7DNClEvSj2MlMVVuyUFtCS8nc=;
 b=k0Burw40Yvmph0zoISl2Rz5Co4qlgpEDXiigvAA7vRrak0XVooM6VO4/7E+XoOkvmUuc75FdRIqV2RSkEvqLI0B2GqqnJ9r76k/s5cCGSLyhs9wxl1HthKmG30U0NhFxBCf3EspaUv+n8srcOnhAo5Zv5Uee7Lnr69nNTfJVVJNUokLo9dqkeRPrUIirvE96O57zNcFPjZCsxz14alqSiTfBg6Bo7SCeyrnMHcIsUswgu+31jJjJjg03XYw4O36mQxpjBaDki4nuZcU4a/BDDLcJg5QL9Aab8Kc1hx/ZYH+sThO7KWng72e+Ld3dG2ErGsJPxIZ/K0J9qMY0c0adCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pabJzcK1Gnsm++spuq7DNClEvSj2MlMVVuyUFtCS8nc=;
 b=PPadzhCjPi01NZRAiGdcxFejdlfh1RvE5PuoQw4Ut6FetYrdWdxMzSEh8RPlY7yMUfxWKaTRqigxWojGt4tSnLX02nmrhs1Tb6Fcbqc68QnyXsmpCHgWjVrkKqXIeXBr1Ya+KYDg+gw9EOa0kEQ+cgisPDBv0Qh+k3kKlfL1AKI=
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com (20.178.97.80) by
 OSBPR01MB2982.jpnprd01.prod.outlook.com (52.134.252.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.18; Tue, 10 Mar 2020 13:42:20 +0000
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::6df0:eb47:a259:b94b]) by OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::6df0:eb47:a259:b94b%7]) with mapi id 15.20.2793.018; Tue, 10 Mar 2020
 13:42:20 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Niklas <niklas.soderlund@ragnatech.se>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: RE: [PATCH v2 2/3] media: rcar-vin: Add support for
 MEDIA_BUS_FMT_SRGGB8_1X8 format
Thread-Topic: [PATCH v2 2/3] media: rcar-vin: Add support for
 MEDIA_BUS_FMT_SRGGB8_1X8 format
Thread-Index: AQHV9sv/PTXFo4VdTUW4ogtsZKzv3qhBxiGAgAAM1rA=
Date:   Tue, 10 Mar 2020 13:42:20 +0000
Message-ID: <OSBPR01MB35905FFB621C2F4222692832AAFF0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
References: <1583838364-12932-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1583838364-12932-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200310124605.GO2975348@oden.dyn.berto.se>
In-Reply-To: <20200310124605.GO2975348@oden.dyn.berto.se>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 75ffa818-3d03-4aae-7a8a-08d7c4f8db0c
x-ms-traffictypediagnostic: OSBPR01MB2982:
x-microsoft-antispam-prvs: <OSBPR01MB2982C1BCAEE99251913870E3AAFF0@OSBPR01MB2982.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 033857D0BD
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(396003)(346002)(366004)(39860400002)(136003)(189003)(199004)(76116006)(86362001)(64756008)(8936002)(66476007)(66556008)(66946007)(6506007)(53546011)(186003)(5660300002)(26005)(52536014)(66446008)(2906002)(81156014)(66574012)(54906003)(8676002)(81166006)(316002)(33656002)(9686003)(4326008)(55016002)(71200400001)(7696005)(6916009)(478600001);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2982;H:OSBPR01MB3590.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zw2KL7LSxWQQSnv5NieZsSt9O3/Slfrh9RndMkGp7WxTTJM1lNJYTfIYzXmAPyiVw0wWkYAxYBuFzgjcuMoLywMzjx9l9px+6rbInMCg8FoG0QIemVfr+kWMFJqDFZo5F9IAmd40P+cFQDxuQ9br7/vdW9+HHL8TQ0AfyYx7TmBDGOC91CBcVAz/kPE9koon7px7K2SROyIffQOnXGmrFVCshQBbkHN9zCG9VN9KC3o3s+3vQSNcInZPDaLb1grwU/efsgENO8MpBM37XYJw5MzdnCc3YPvWC946uykiSvlYDRAN3IGoBLoHyY9retft1IWmxGUZUe+FFmU0K4KWIOsjD/wvvPaRhE0SSsutVPgKPy7bIV+FjOfxgb9thq8CP4qWngGqMTIFjSvg+BByE5Yx18D8eW9gWyf5AuaiDc+RoAe6pvYwra2jWnIWjxbl
x-ms-exchange-antispam-messagedata: ndzVIp4NRuS6sZgKsvC/wqnGGpWXtxktOjxxm9mn3BaO1yzdv1moQxLFV6iP77j0Ta43Nlyj6Wa0GTnRj1raYOJMhCVEnxPL3yyjHX/xzKeUY4sDidfIHOVKpbiFHNmCfcdbYM8lPJP1QCJBanxd3Q==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ffa818-3d03-4aae-7a8a-08d7c4f8db0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2020 13:42:20.0946
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +kZMrRH2XrgXq9SntP7rSZ4Mx5xwiJyTC42gPTgVL5MsyWzV18CKhXd6nsCLiIeeQ5C6oB9YggxfrH19zLt3NRnWGFyYfM3+ZvOzNLeuGrUyqh5zupV7n4RBSmpgwKG6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2982
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank for the review.

> -----Original Message-----
> From: Niklas <niklas.soderlund@ragnatech.se>
> Sent: 10 March 2020 12:46
> To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>; linux-
> media@vger.kernel.org; linux-renesas-soc@vger.kernel.org; linux-
> kernel@vger.kernel.org; Lad Prabhakar <prabhakar.csengg@gmail.com>
> Subject: Re: [PATCH v2 2/3] media: rcar-vin: Add support for
> MEDIA_BUS_FMT_SRGGB8_1X8 format
>
> Hi Lad,
>
> Thanks for your work.
>
> On 2020-03-10 11:06:03 +0000, Lad Prabhakar wrote:
> > Add support for MEDIA_BUS_FMT_SRGGB8_1X8 format in rcar-vin by
> setting
> > format type to RAW8 in VNMC register and appropriately setting the
> > bpp, bytesperline to enable V4L2_PIX_FMT_SRGGB8.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-
> lad.rj@bp.renesas.com>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-core.c |  1 +
> > drivers/media/platform/rcar-vin/rcar-dma.c  |  9 ++++++++-
> > drivers/media/platform/rcar-vin/rcar-v4l2.c | 13 ++++++++++++-
> >  3 files changed, 21 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/rcar-vin/rcar-core.c
> > b/drivers/media/platform/rcar-vin/rcar-core.c
> > index 7440c89..76daf2f 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-core.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> > @@ -469,6 +469,7 @@ static int rvin_parallel_subdevice_attach(struct
> rvin_dev *vin,
> >  case MEDIA_BUS_FMT_UYVY8_2X8:
> >  case MEDIA_BUS_FMT_UYVY10_2X10:
> >  case MEDIA_BUS_FMT_RGB888_1X24:
> > +case MEDIA_BUS_FMT_SRGGB8_1X8:
> >  vin->mbus_code =3D code.code;
> >  vin_dbg(vin, "Found media bus format for %s: %d\n",
> >  subdev->name, vin->mbus_code);
> > diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c
> > b/drivers/media/platform/rcar-vin/rcar-dma.c
> > index 1a30cd0..1c1fafa 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> > @@ -85,6 +85,7 @@
> >  #define VNMC_INF_YUV8_BT601(1 << 16)
> >  #define VNMC_INF_YUV10_BT656(2 << 16)
> >  #define VNMC_INF_YUV10_BT601(3 << 16)
> > +#define VNMC_INF_RAW8(4 << 16)
> >  #define VNMC_INF_YUV16(5 << 16)
> >  #define VNMC_INF_RGB888(6 << 16)
> >  #define VNMC_VUP(1 << 10)
> > @@ -587,7 +588,6 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
> >  rvin_write(vin, vin->crop.top, VNSLPRC_REG);
> >  rvin_write(vin, vin->crop.top + vin->crop.height - 1, VNELPRC_REG);
> >
> > -
> >  /* TODO: Add support for the UDS scaler. */
> >  if (vin->info->model !=3D RCAR_GEN3)
> >  rvin_crop_scale_comp_gen2(vin);
> > @@ -676,6 +676,9 @@ static int rvin_setup(struct rvin_dev *vin)
> >
> >  input_is_yuv =3D true;
> >  break;
> > +case MEDIA_BUS_FMT_SRGGB8_1X8:
> > +vnmc |=3D VNMC_INF_RAW8;
> > +break;
> >  default:
> >  break;
> >  }
> > @@ -737,6 +740,9 @@ static int rvin_setup(struct rvin_dev *vin)
> >  case V4L2_PIX_FMT_ABGR32:
> >  dmr =3D VNDMR_A8BIT(vin->alpha) | VNDMR_EXRGB |
> VNDMR_DTMD_ARGB;
> >  break;
> > +case V4L2_PIX_FMT_SRGGB8:
> > +dmr =3D 0;
> > +break;
> >  default:
> >  vin_err(vin, "Invalid pixelformat (0x%x)\n",
> >  vin->format.pixelformat);
> > @@ -1110,6 +1116,7 @@ static int rvin_mc_validate_format(struct
> rvin_dev *vin, struct v4l2_subdev *sd,
> >  case MEDIA_BUS_FMT_UYVY8_2X8:
> >  case MEDIA_BUS_FMT_UYVY10_2X10:
> >  case MEDIA_BUS_FMT_RGB888_1X24:
> > +case MEDIA_BUS_FMT_SRGGB8_1X8:
> >  vin->mbus_code =3D fmt.format.code;
> >  break;
> >  default:
> > diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > index 5151a3c..4698099 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > @@ -66,6 +66,10 @@ static const struct rvin_video_format rvin_formats[]
> =3D {
> >  .fourcc=3D V4L2_PIX_FMT_ABGR32,
> >  .bpp=3D 4,
> >  },
> > +{
> > +.fourcc=3D V4L2_PIX_FMT_SRGGB8,
> > +.bpp=3D 2,
>
> This does not look right, is not bytes-per-pixel 1 for a SRGGB8?
>
I guessed the bpp's were picked from VnIS table as I result I did the same.

> > +},
> >  };
> >
> >  const struct rvin_video_format *rvin_format_from_pixel(struct
> > rvin_dev *vin, @@ -102,6 +106,7 @@ static u32
> > rvin_format_bytesperline(struct rvin_dev *vin,  {
> >  const struct rvin_video_format *fmt;
> >  u32 align;
> > +u8 div;
> >
> >  fmt =3D rvin_format_from_pixel(vin, pix->pixelformat);
> >
> > @@ -112,16 +117,22 @@ static u32 rvin_format_bytesperline(struct
> rvin_dev *vin,
> >  case V4L2_PIX_FMT_NV12:
> >  case V4L2_PIX_FMT_NV16:
> >  align =3D 0x20;
> > +div =3D 1;
> > +break;
> > +case V4L2_PIX_FMT_SRGGB8:
> > +align =3D 0x10;
> > +div =3D 2;
>
> Yes this does not look right at all, I think you should set bpp to 1 and =
drop the
> div handling here.
>
If I set bpp as 1 and drop the div VNIS_REG will be wrongly configured in
rvin_crop_scale_comp() and the image captured will be wrong.

For example for 640x480:

With the current patch bpp =3D 2:
bytesperline =3D 640
image size =3D 307200
stride =3D 320

And with bpp =3D 1 and div removed
bytesperline =3D 640
image size =3D 307200
stride =3D 640

Cheers,
--Prabhakar

> >  break;
> >  default:
> >  align =3D 0x10;
> > +div =3D 1;
> >  break;
> >  }
> >
> >  if (V4L2_FIELD_IS_SEQUENTIAL(pix->field))
> >  align =3D 0x80;
> >
> > -return ALIGN(pix->width, align) * fmt->bpp;
> > +return ALIGN(pix->width / div, align) * fmt->bpp;
> >  }
> >
> >  static u32 rvin_format_sizeimage(struct v4l2_pix_format *pix)
> > --
> > 2.7.4
> >
>
> --
> Regards,
> Niklas S=F6derlund


Renesas Electronics Europe GmbH, Geschaeftsfuehrer/President: Carsten Jauch=
, Sitz der Gesellschaft/Registered office: Duesseldorf, Arcadiastrasse 10, =
40472 Duesseldorf, Germany, Handelsregister/Commercial Register: Duesseldor=
f, HRB 3708 USt-IDNr./Tax identification no.: DE 119353406 WEEE-Reg.-Nr./WE=
EE reg. no.: DE 14978647
