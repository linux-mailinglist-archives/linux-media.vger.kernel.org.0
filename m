Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B54E7416996
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 03:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243774AbhIXBt1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Sep 2021 21:49:27 -0400
Received: from mail-eopbgr70078.outbound.protection.outlook.com ([40.107.7.78]:13981
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240863AbhIXBt0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Sep 2021 21:49:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GawNRSbqzboaa2RZ5+QcvZfCHTTTa5HU7EaXx+S3p2hJxhBGdLqr8JJLdmbORNLOs7DZMnTzFHjLgJjpLNT3T5xosyXpycPe2Hhm+2pL6spLbKsKNw7V/PQhVjMwZIwRe11IDE/CEqHkA27VbIqOHB+HeiJAx7mFnlLvm59Bt2TIrOiELiq8Rt1mIm1qlenUYDKMfr9CYtMmfoRr9X8rHRWCMQtz48pUoNk1SHGt6fv1oNadcF5S3xsy+Q5YwtIhvSKbgTue73FgZPleUZqqcQcvMOy+hF4iZyilbhJjEplKBYwPhE7zTUxttLVaX8Ht+hTZM3glpt+lKspBgZTvwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=qLaIAP3cSzgDzivnfbn2nhSkd/fr5zE/ocJSPxrA2zU=;
 b=J4FbmnzHIueZwTW0e7BxHnl3DuT5hjesD2ZLC4VD1WLHSZZGlAX1lEwHNKVkHa0H7LmfpKwmLISLpCeCxIXV4HjNtHXKoYJwYA6dT2yJ9IdOCHTwJYjkpT8m/wkbNGSSOvAM7VaQe+U53Je5v8BWyDkx6LhNd8S0q9wagu0se9BpzFsIEbvsItu+C7PSrtHPNdbmemSCr8HGN9VJqqQahCcy7holsAwb/6+ETv17i3q+rOqjq+3bmLcxq2xZR11fphnoKgsUuz+LVCpPfrCu9QD0ayzF//y84Zjlm2H6uZ3WgLIy4FGy4safc6cS3SX8zKxQgRrj7EdzAAt7r3QJMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLaIAP3cSzgDzivnfbn2nhSkd/fr5zE/ocJSPxrA2zU=;
 b=lIoSK1syaKO8arlK/DLIH3EQ8G4H0SkuziiPZCLl28lHRdQU6uU0lPplAW2Zky7dg/zl5HBzsMtW50mfMm19nvpUNEYCfSVT0tmfa6bSY+BEgKbqq/HvXMYb4l1blxkFTjx64e7TYQmhaatSnC2+mygEpjMIXB01YcC2+FldFBM=
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB4071.eurprd04.prod.outlook.com (2603:10a6:209:47::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Fri, 24 Sep
 2021 01:47:52 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4%7]) with mapi id 15.20.4523.021; Fri, 24 Sep 2021
 01:47:51 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
CC:     "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCH v9 07/13] media: amphion: add v4l2 m2m vpu
 encoder stateful driver
Thread-Topic: [EXT] Re: [PATCH v9 07/13] media: amphion: add v4l2 m2m vpu
 encoder stateful driver
Thread-Index: AQHXqHsPw4ZkAjhGc0+9RfYHlaE+MKuxu+4AgAC/G2A=
Date:   Fri, 24 Sep 2021 01:47:51 +0000
Message-ID: <AM6PR04MB6341F798765924998642258BE7A49@AM6PR04MB6341.eurprd04.prod.outlook.com>
References: <cover.1631521295.git.ming.qian@nxp.com>
         <aab3d7bd0632dab4c41ee9be3eb49c2a4f9de31d.1631521295.git.ming.qian@nxp.com>
 <f39555c5f6ef46eed95462fec80012767e0cb136.camel@ndufresne.ca>
In-Reply-To: <f39555c5f6ef46eed95462fec80012767e0cb136.camel@ndufresne.ca>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ndufresne.ca; dkim=none (message not signed)
 header.d=none;ndufresne.ca; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a504df4d-4f41-4f48-746f-08d97efd5216
x-ms-traffictypediagnostic: AM6PR04MB4071:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB40711512C717ED41D38FEF96E7A49@AM6PR04MB4071.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wL6aD6NCanIyeASneVcN7/IfG9Pu+sKoj/3mq256UVR8U48o3TFvqhGbChMiCyZFylmGc01wbCaU3PPyQ8m0o4gmub3lIIPopfPYzOv5vXP/S91oUaOIUrW5ujJFZkGTym1hGWSIGISlL5EjN3/EhfF9Xhyg1pc79/eEPScecHwQr0qFYvFLNS6kQ3LXyuUn5sxizZOHls4jeQPL2dwdGMkdQVoigvnIBR3HMFrUZGMicGyyumC1J1VKCgadGCXr0FcGdYZGb8Vz8fi/3vocRaE90HY65//Aw5SDJ6Xv1bqiA68ztHktRxsVmsihgBYJXMeUDa3GeiMAtKJiW62nYYTuUyhdMiPoViTq+B0+EwdPb0P/8Zd6+/cI6pFkkDRpGV3QizYrTdyoQ+Qwb8Xf8Tt1duP/zwAufyTJPGk0jl6ZTBS/AdIXtR3XxY1UBpK5FynBsbhiF9oOWwqGlYN1NE5QGmWh19Q+ivJmPb1sN164oBGx1m2r3gRiM2hVDFBTQVz3kmMRmMHN+Mt054nT3R51FobCu1+Ec751b0i8CR1RTpat+VkvFbSZCKS0YDHAvcur+lsQ07B10NPqHxrrpLYvQQIYEWFcebqDe/ElKJ2k6E0l2g4a/bnGu0sUqHpF3zOanFsBMpJnoghoGT+qAUMwIOTNAoTgSttRGbbN00/gOAN3drlZTB3dQphnn7PiDAPsA9FoW2fgIhwl+hwheiQnN0nAaNWVX/+4y4Lx7bq9WCApnE6sfz5CC7XNpjyKG0RWE5eYGkBFq5946/Y6IqIlbIgCByT07dORlJzPwZc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(71200400001)(508600001)(8936002)(44832011)(55016002)(966005)(76116006)(66446008)(66946007)(66476007)(66556008)(64756008)(8676002)(45080400002)(83380400001)(4326008)(66574015)(122000001)(2906002)(52536014)(54906003)(110136005)(26005)(86362001)(186003)(7696005)(316002)(6506007)(38100700002)(38070700005)(7416002)(33656002)(5660300002)(9686003)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?QtMwCLNKq/nXokQouUG02qOffBBE0NS6XtJeltNCI15tP/KCwyaLxHBgZc?=
 =?iso-8859-1?Q?1RJDahghjmj/S2u/kV0RkrR4O78SuXU2q+2cmeStnUedu/JPtzQ3C15MFb?=
 =?iso-8859-1?Q?g7bYLOwnKLCXD3oWWUBfI9ogOuDDyuAtCa4eoAXMDZ50ZtEpGaNOiwwQwm?=
 =?iso-8859-1?Q?fs7FSjVm/xTLRZMPT/nbYNvwyC9ZGJN3WWOMsclB79AJHVR/+q3NO59ZiB?=
 =?iso-8859-1?Q?QlxS59norXZyB34udbIxPVfOzsdgMX5RgRwprSM5+I9ZSrXO/QKQRAu1Lw?=
 =?iso-8859-1?Q?rbqgPKcG99M26Gyxxls1/ZCM12OWF1phfcaSqRSNI3v/s6ERoGWPOZHD5/?=
 =?iso-8859-1?Q?aSPrQJmO+35hLBl21B5LiE6ah8vYMDAonBnQT+q0VMXm8aF3GzPe/kSsHF?=
 =?iso-8859-1?Q?yNWTXmey3cjJb4yjeGlOwTOezf+h+5ywusg2Ih82NWW2U4xweczk5hun+i?=
 =?iso-8859-1?Q?9Zy45TMhLuj5ddkmBXoZdJQzgSEHLxPGT+8PppySWtEkkbHr9EuWylm56X?=
 =?iso-8859-1?Q?X+zBRFLnq95QhgOSesM5aH0E5mJWcm/4XTV2Wtu5OtcwVZEYR7sTNF+02e?=
 =?iso-8859-1?Q?ZRefgqa9Ssr2yvZV8mVIrFyWFz4LjiHL+TETCPeJeYvsA4HUbaEobVDjco?=
 =?iso-8859-1?Q?lhdr/U1qzqo6c4gqbO42r6CQQe3Qq0HwwKRPHUSPIOsbK2hWIPhd4mbKPz?=
 =?iso-8859-1?Q?HH3ZtwVwOzPvedWMum49xfgwKqa1b7qNZxnt8gO5xgF9DbWWLrJfkxDtTo?=
 =?iso-8859-1?Q?XNlhSv4YUJpZ18HPegD+yEWIEZgmP69v7YvRDKk3tRWWsa1zEvjrRmM7HH?=
 =?iso-8859-1?Q?chtLr4Mts9ZBtRlGE18wk6LM9J0a3ws9J8cXPP4mBPe01MFkBCcmV9Zb1M?=
 =?iso-8859-1?Q?FaFfFhwD6FBEndz/De4ILJ4BUBBlNAhhB1psQ3E3PKzhaP/e8QhnwgsuN1?=
 =?iso-8859-1?Q?JEVJItunOBLs+yVoT/kiLlcjfVIrZt8e1ZOpj8zSskpOhrprvDcMRAUEzf?=
 =?iso-8859-1?Q?qzAY7qgaweC/LFEvtmzNm6rdRllF7dq2VNJbpelH8MZtvmHU0UdTVyEmZj?=
 =?iso-8859-1?Q?cGVTJRtggofcdESY2ho3oS1CN+FNCtYCVKlabpt1ibjlmhcPlqzDmEOJ6L?=
 =?iso-8859-1?Q?XsqwlZ1vFtiUh/KMQIUsvq5MzQUCoi8Ejf8liD7lMzj44kPN2y+knZgLUQ?=
 =?iso-8859-1?Q?d2ThOzpJgbYDV6iUDN3A8iTL+DQFIhqD0xHj415e/v65YBuEzelSjfSZZ5?=
 =?iso-8859-1?Q?lHWMnEYAPNoxFGXNusHJTFoyaUET3JfAKlVt5FFybBJTXPTN/3bMJN1sYN?=
 =?iso-8859-1?Q?QbFg93jfaXeyejSZaTOvJ9E0kH7nZK3cfvUzB+NXIr0evx+Vo/UXdOlvpv?=
 =?iso-8859-1?Q?fJ66pI8NCR?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a504df4d-4f41-4f48-746f-08d97efd5216
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2021 01:47:51.7285
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 03AiIcPZv2McGDM3vazlN8m0h1uGkAMBSAEDeRwPd3DGAwIuVaTqUSo23FVDyvPXiFzu2acNWItXWF41UH3qkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4071
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> -----Original Message-----
> From: Nicolas Dufresne [mailto:nicolas@ndufresne.ca]
> Sent: Thursday, September 23, 2021 10:23 PM
> To: Ming Qian <ming.qian@nxp.com>; mchehab@kernel.org;
> shawnguo@kernel.org; robh+dt@kernel.org; s.hauer@pengutronix.de
> Cc: hverkuil-cisco@xs4all.nl; kernel@pengutronix.de; festevam@gmail.com;
> dl-linux-imx <linux-imx@nxp.com>; Aisheng Dong <aisheng.dong@nxp.com>;
> linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> Subject: [EXT] Re: [PATCH v9 07/13] media: amphion: add v4l2 m2m vpu
> encoder stateful driver
>=20
> Caution: EXT Email
>=20
> Le lundi 13 septembre 2021 =E0 17:11 +0800, Ming Qian a =E9crit :
> > This consists of video encoder implementation plus encoder controls.
> >
> > Signed-off-by: Ming Qian <ming.qian@nxp.com>
> > Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
> > Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
> > ---
> >  drivers/media/platform/amphion/venc.c | 1382
> > +++++++++++++++++++++++++
> >  1 file changed, 1382 insertions(+)
> >  create mode 100644 drivers/media/platform/amphion/venc.c
> >
> > diff --git a/drivers/media/platform/amphion/venc.c
> > b/drivers/media/platform/amphion/venc.c
> > new file mode 100644
> > index 000000000000..fdc9a59009ba
> > --- /dev/null
> > +++ b/drivers/media/platform/amphion/venc.c
> > @@ -0,0 +1,1382 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright 2020-2021 NXP
> > + */
> > +
> > +#define TAG          "ENC"
> > +
> > +#include <linux/init.h>
> > +#include <linux/interconnect.h>
> > +#include <linux/ioctl.h>
> > +#include <linux/list.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/delay.h>
> > +#include <linux/videodev2.h>
> > +#include <linux/ktime.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-event.h>
> > +#include <media/v4l2-mem2mem.h>
> > +#include <media/v4l2-ioctl.h>
> > +#include <media/videobuf2-v4l2.h>
> > +#include <media/videobuf2-dma-contig.h> #include
> > +<media/videobuf2-vmalloc.h> #include "vpu.h"
> > +#include "vpu_defs.h"
> > +#include "vpu_core.h"
> > +#include "vpu_helpers.h"
> > +#include "vpu_v4l2.h"
> > +#include "vpu_cmds.h"
> > +#include "vpu_rpc.h"
> > +#include "vpu_log.h"
> > +
> > +#define VENC_OUTPUT_ENABLE   (1 << 0)
> > +#define VENC_CAPTURE_ENABLE  (1 << 1)
> > +#define VENC_ENABLE_MASK     (VENC_OUTPUT_ENABLE |
> VENC_CAPTURE_ENABLE)
> > +#define VENC_MAX_BUF_CNT     8
> > +
> > +struct venc_t {
> > +     struct vpu_encode_params params;
> > +     u32 request_key_frame;
> > +     u32 input_ready;
> > +     u32 cpb_size;
> > +     bool bitrate_change;
> > +
> > +     struct vpu_buffer enc[VENC_MAX_BUF_CNT];
> > +     struct vpu_buffer ref[VENC_MAX_BUF_CNT];
> > +     struct vpu_buffer act[VENC_MAX_BUF_CNT];
> > +     struct list_head frames;
> > +     u32 frame_count;
> > +     u32 encode_count;
> > +     u32 ready_count;
> > +     u32 enable;
> > +     u32 stopped;
> > +
> > +     u32 skipped_count;
> > +     u32 skipped_bytes;
> > +
> > +     wait_queue_head_t wq;
> > +};
> > +
> > +struct venc_frame_t {
> > +     struct list_head list;
> > +     struct vpu_enc_pic_info info;
> > +     u32 bytesused;
> > +     s64 timestamp;
> > +};
> > +
> > +static const struct vpu_format venc_formats[] =3D {
> > +     {
> > +             .pixfmt =3D V4L2_PIX_FMT_NV12,
> > +             .num_planes =3D 2,
> > +             .type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
>=20
> pixmp->num_planes is the number of allocation. V4L2_PIX_FMT_NV12 must
> pixmp->come with
> 1 allocation and [0] V4L2_PIX_FMT_NV12M must come with 2 allocations.
>=20
> [0]
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.k=
e
> rnel.org%2Fdoc%2Fhtml%2Fv4.10%2Fmedia%2Fuapi%2Fv4l%2Fpixfmt-nv12m
> .html&amp;data=3D04%7C01%7Cming.qian%40nxp.com%7Cb1b9aac4f17a446f1
> cf008d97e9d975d%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6
> 37680037585331278%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM
> DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata
> =3DAlH44y9iNomGKenkm4%2F1sfowhqX%2Fivc3z4FTlCgilfA%3D&amp;reserved
> =3D0
>=20
> This currently confuses GStreamer and prevent encoding.
>=20
OK, I'll try to support V4L2_PIX_FMT_NV12M in the next version
