Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86E333FF8A9
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 03:32:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346712AbhICBdI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 21:33:08 -0400
Received: from mail-vi1eur05on2089.outbound.protection.outlook.com ([40.107.21.89]:45420
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1346653AbhICBdH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 Sep 2021 21:33:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+AftzFg4TrCpt0fIlqXWt6SMGZsxUUMJvVer5Bzk8sTeXs3cGIQOrANH+iw962WzqVWEn+mlm5Uki+p/iyk9//lMc8zo30J7V7PSb8gRODX8fIb4fbeSKMhjGef9rO8elM0zMh2p8hMN0vwea5AaLsu5oLKC4hPcRHJrops1gNAiYx0PSfR1DrHN32Jtnwgep1M4JO5bE379+edsZiNIHkdBxrVwpc5GY3SKcLGhJq9AGohrft2h1aw7lOsrNkiAgpw3b4rSZS36ttTGT/OiUjE3xBCvZLXYjYCTqdOewpPn8/x9yKXCoxDd3HMBMRtr3MiwRmIqtZEuMzH0OhyFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=FjcmcG3p4GTNZozTO5YJZZel73CnHrTdPLNYLpKEJjk=;
 b=AwUw0QKPOcWPvZI8MwmCV4r1sNM9I/YkuVvLdhGOG7r3Mq8uzWbSV+H0oM/nCNpXJzs0DlVhzqwDJC4bQZrrzmsFBdY4By5VSm6sXh+tLasQFQVCjoXv+5RfedO/MBZFW5AbjDEp7KAbIt+GsiOn5hybD52Y4QgS4u0kNQkbegaB0ZwllaljbU7yjGgUarAZiQr9Wvw1DVukusSDI7SF+2L5d7ULJiqbyLx9xVOb/avfqbiSE4k29hSguEFt8A6if1u2BTr7ZYxX77sEWsfu3Dmpw3+A6EabEkPlQrhws+UVagRxg6O9AvFYYtm0aR1lCxY47u2CQANmo4jn9QIYZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjcmcG3p4GTNZozTO5YJZZel73CnHrTdPLNYLpKEJjk=;
 b=Y1Isz5dREhIZdbyZsAd5lKRp1dJxbigPpzQKHQ2VQrCXUvAHwdndiEa1a4gn7GxwCYjq7OgSQZkEOXo7xSbojuwksDGr/p44ctxmguL113cdyV8w96/MuUyxQu+fs0t3tHZiQoA4X1MmUK6UbYxYpCjYCZoCBxh5SwjAsVbbXk0=
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB5336.eurprd04.prod.outlook.com (2603:10a6:209:4f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Fri, 3 Sep
 2021 01:32:05 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4%7]) with mapi id 15.20.4457.026; Fri, 3 Sep 2021
 01:32:05 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCH v7 00/14] imx8q video decoder/encoder driver
Thread-Topic: [EXT] Re: [PATCH v7 00/14] imx8q video decoder/encoder driver
Thread-Index: AQHXnhKsEXci7zFgvESuzHJbraaCJ6uQ9imAgACTltA=
Date:   Fri, 3 Sep 2021 01:32:05 +0000
Message-ID: <AM6PR04MB634115C587F0A55210E64AC1E7CF9@AM6PR04MB6341.eurprd04.prod.outlook.com>
References: <cover.1630377507.git.ming.qian@nxp.com>
 <CAAEAJfBO7disDg2==AUCiPUL4rAGfSaT4Wc-e8q=Po=t-FkmxQ@mail.gmail.com>
In-Reply-To: <CAAEAJfBO7disDg2==AUCiPUL4rAGfSaT4Wc-e8q=Po=t-FkmxQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vanguardiasur.com.ar; dkim=none (message not signed)
 header.d=none;vanguardiasur.com.ar; dmarc=none action=none
 header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83b35804-b847-4b7f-a627-08d96e7aa330
x-ms-traffictypediagnostic: AM6PR04MB5336:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB5336CB2F168475D38276716DE7CF9@AM6PR04MB5336.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q47PlTjJLmoji2MKarn30SUJumBX5inozGmBvLsosCeqWYK7OrfgCOZvaaerieb65YBGhmSCpCmzuDnjoEh0naCQdzMcoV2v8TEZC9I1wNS+fKlaE7XV2jkdt3SRDCHg8I94mjdNu0MZOyTxreAn7citwXghOvr4nInlMhLhwipHGeUlQrNdOD5/ej5S/WwdmIfElH1iUELG6v8arixdKBafbERjd4d7IXzYleIV4WW0300zY95iUU3eiI0LouO9ZsjoQRr+4lh0R7OV1OK11QRCTNzM/0No+Oms1vqw2NB5h9f84QEbo+0cmcKHV4wyUGm/VL0wziQq6jwNFb+sW0ILwroHwXgeqtJaH5gKWYChsto7dAf91VOsqVINEWEjWkGbcllXOK7xIeyUoCJdDsFyUvuKIltI7bSZGiqc6W9EnpKEFGOKnSTG43UBOomkQi4VJQRpNNodTI1OyTniOdexU1AfcYA7qfNkeePTYXTmw3ctwuHR448eJHWai+YoQBECKcnlwzLhCaetL0eNcx4n4XczSRUPUeb8Kv+Z1+hTUTWP8No0e4Xjd1QF2X9O8gg8+4vLzhRYdxyBA/lFspj3j1VcOolOJYG08fzSGoPMeVT8GE2o3W/9ueEMwyZiLTTisWNSd25upbvpvIbLWbOAkNwBexFW1idODNuGBAPp5PLyFeghDaKQDM0XcmhNxzB8adZrzumldVJ54DRY44IGYt5bCmPJZwClAMT8KnEFcom8Gkx0AOJ6F+apAXRr/4t5arqvRGwsBV332BsdqoCUlW/F55SdAE00VINRgr4l8Mrh3813zS0tqgpy/4F3
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(966005)(26005)(186003)(44832011)(4326008)(64756008)(478600001)(66446008)(66556008)(76116006)(86362001)(7416002)(5660300002)(8936002)(122000001)(38100700002)(71200400001)(66946007)(66476007)(38070700005)(8676002)(54906003)(33656002)(7696005)(30864003)(52536014)(6506007)(6916009)(53546011)(45080400002)(2906002)(316002)(55016002)(83380400001)(9686003)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tVUxX/fwsZ6i37TqmdkvVBARF5lNF/JrccrcPRRrHvwvzvlquX40cqrL/gYD?=
 =?us-ascii?Q?Zg71/l386sktvLg3j8w3wV15HvW1Okr88z1jwdiJHPFSnxRQ5wMUEJd4AItT?=
 =?us-ascii?Q?zitqufaQ9tK3PUXGYUMx6gjgqwglPgsHuIIJ8aiO3vbe5Aje+uM9jngbw5T/?=
 =?us-ascii?Q?A3tmnrxZslz9lT6ryEoEpRUmODLvoO1ffJOqSaoB15yweiiAha5y7Nqv0xdJ?=
 =?us-ascii?Q?8L5/kKb9NHHeF9rqkuiFsRfSLTHvpFRvtZr4BnDmIMRNZw+5ZgQ5ZRF/lQDE?=
 =?us-ascii?Q?FgXoUKbZIcC2QAHRNAwafSuhTE/u7JcAc2684nIrwM9JJjbslFu4cszSxTa+?=
 =?us-ascii?Q?qM/uzwMRgtShhKxfX494HpzallnWT360Q5Moc9fTZVUMC+61npxsgDVcvhjh?=
 =?us-ascii?Q?JpFkZ6vtzYlJPF/ZVfGgxNnfCHOAWJ50U6GJyW2Djiq7mBARbd019XmzLiFD?=
 =?us-ascii?Q?+HCSVLBfZsZqD5aqWnqw2MQy31LenrdEWo+rkBWdUnIhXsGAMzfH2N7OypQn?=
 =?us-ascii?Q?krmjzv+EXPvp44dlJDgXuMF6yQ4Tr6DVHPHUG0bhSFbuUV6VU7OlAxhNyajN?=
 =?us-ascii?Q?1Vw+jpq/iOUEkwtnAd1Xzc6B4T9efU9DFT+PamkK7+Jv+79YYMs29Ih0P/BT?=
 =?us-ascii?Q?X+PnQlwszrdAV6f+KQJphxsnKFuPP+l6LLRHFubKjE0/I1lTN7edvi3qx+nG?=
 =?us-ascii?Q?l/PMNqCUBd6tzTOU8lHp56hrryu8U0F/S7qBIYKWZiWXjt3P8Co7fzu/m/WH?=
 =?us-ascii?Q?8+gQ/Vti7mczXfJzdfPZSKSwUcSr9bDt8HQrsooW32uhrqbxgqoUx5CojXn8?=
 =?us-ascii?Q?b0Cz8Gz9YZRzem+37j4bqcwPP+71fG2f4+cMAIdeuqGzB4OHRBWIf58+4Ta1?=
 =?us-ascii?Q?SdgowyXS2QVb+p8XwYBcZp74AZ/XKHKIxZeF0T7VP3N+NpgBrslRyKDgL4xA?=
 =?us-ascii?Q?oJBwyZcYTwcZrcbXFKHF4HgFWHBeNHfhQmnnkj1XZhCerW4IO6T5tp7OBrf6?=
 =?us-ascii?Q?uoFcYtRUzBJAIThRLojq+QTC2q0p0qyd3WyjV5cYvVWco7yz/6YM5x4bDKo3?=
 =?us-ascii?Q?z2eEbkk+fwQMljw5eWpMQ3jqXMHZL6qFJzAq9wcLEjiQ9mXZ/uTgdaLGd6+8?=
 =?us-ascii?Q?a43zlXFR49zeWXpKn8cyJcVohchztQ+VfUU8NQEMMoQOMOl4hx04g8d1lq3Z?=
 =?us-ascii?Q?L9/X0hXzy+Fm2/gp4fZWqUjn0xI2Vb5sERzr9zZWXKNYXE3fk2/m3U59PZsx?=
 =?us-ascii?Q?uUOb970FjlC8HVybOINgwD+QSJkm/5V5w6BVb+n5rxAS4FZspqh44MAcXfA9?=
 =?us-ascii?Q?dCw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83b35804-b847-4b7f-a627-08d96e7aa330
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2021 01:32:05.1016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U+YbrAAuotdWL+K8o4HCQoVKc85XB296NZCl6rR9bq8QM0LgLtw4b7MSZcZSwFZLLmjM5szkHI+9c9OKZOerVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5336
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> -----Original Message-----
> From: Ezequiel Garcia [mailto:ezequiel@vanguardiasur.com.ar]
> Sent: Friday, September 3, 2021 12:40 AM
> To: Ming Qian <ming.qian@nxp.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>; Shawn Guo
> <shawnguo@kernel.org>; Rob Herring <robh+dt@kernel.org>; Sascha Hauer
> <s.hauer@pengutronix.de>; Hans Verkuil <hverkuil-cisco@xs4all.nl>;
> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> <festevam@gmail.com>; dl-linux-imx <linux-imx@nxp.com>; Aisheng Dong
> <aisheng.dong@nxp.com>; linux-media <linux-media@vger.kernel.org>; Linux
> Kernel Mailing List <linux-kernel@vger.kernel.org>; devicetree
> <devicetree@vger.kernel.org>; linux-arm-kernel
> <linux-arm-kernel@lists.infradead.org>
> Subject: [EXT] Re: [PATCH v7 00/14] imx8q video decoder/encoder driver
>=20
> Caution: EXT Email
>=20
> Hi Ming,
>=20
> On Tue, 31 Aug 2021 at 00:00, Ming Qian <ming.qian@nxp.com> wrote:
> >
> > Hi all,
> >
> > This patch series adds support for
> > the imx8q video encoder and decoder
> > via the VPU block present in imx8q platforms.
> > Currently, support for IMX8QXP and IMX8QM is included.
> >
>=20
> NAK.
>=20
> Nicolas gave you important feedback on your first version, and you have
> ignored that, as far as I can see.
>=20
> It seems very rude to do that, please avoid ignoring feedback from review=
ers
> and maintainers.
>=20
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.s=
p
> inics.net%2Flists%2Flinux-media%2Fmsg196342.html&amp;data=3D04%7C01%7
> Cming.qian%40nxp.com%7Cda963fd033af4be5503e08d96e305256%7C686ea
> 1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637661976084265356%7CUn
> known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik
> 1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DbE2hiMc6mgDlXbZs76dWEe
> Hg2NJnyCGeZ1uFc8NOE%2FY%3D&amp;reserved=3D0
>=20
> Please move the driver to drivers/media/platform/amphion, rename the driv=
er
> name, compatible, etc. This is the same case as CODA driver, Hantro drive=
r, etc.
>=20
> I sincerely hope you will not ignore this, and then send a v8 version ;-)
>=20
> Thanks!
> Ezequiel

Hi Ezequiel,
   I'm sorry that I missed the message,  I'll check and make the adjustment=
s

Thanks
Ming

>=20
> > It features decoding for the following formats:
> > - H.264
> > - HEVC
> > - MPEG4
> > - MPEG2
> > - VC1
> > - VP8
> >
> > It features encoding for the following formats:
> > - H.264
> >
> > The driver creates a separate device node for the encoder and decoder.
> >
> > Changelog:
> >
> > v7
> > - fix build warnings with W=3D1 reported by kernel test robot
> >
> > v6:
> > - rename V4L2_PIX_FMT_NT8 to V4L2_PIX_FMT_NV12_8L128
> > - rename V4L2_PIX_FMT_NT10 to V4L2_PIX_FMT_NV12_10BE_8L128
> >
> > v5:
> > - move some definition from imx_vph.h to videodev2.h
> > - remove some unnecessary content
> > - add some documentation descriptions
> > - pass the lateset v4l2-compliance test
> >
> > v4:
> > - redefine the memory-region in devicetree bindings documentation
> > - use v4l2's mechanism to implement synchronize queuing ioctl
> > - remove the unnecessary mutex ioctl_sync
> > - don't notify source change event if the parameters are same as
> > previously established
> > - add flag V4L2_FMT_FLAG_DYN_RESOLUTION to decoder's capture format
> >
> > v3:
> > - don't make vpu device node a simple-bus
> > - trigger probing vpu core in the driver
> > - remove unnecessary vpu core index property
> >
> > v2:
> > - fix dt bindings build error
> > - split driver patch into several parts to avoid exceeding bytes limit
> >
> > Compliance
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > # v4l2-compliance -d /dev/video0
> > v4l2-compliance 1.21.0-4838, 64 bits, 64-bit time_t v4l2-compliance
> > SHA: 22466798f9a9 2021-08-25 11:05:21
> >
> > Compliance test for imx8q-vpu device /dev/video0:
> >
> > Driver Info:
> >         Driver name      : imx8q-vpu
> >         Card type        : imx8q vpu decoder
> >         Bus info         : platform: imx8q-vpu
> >         Driver version   : 5.14.0
> >         Capabilities     : 0x84204000
> >                 Video Memory-to-Memory Multiplanar
> >                 Streaming
> >                 Extended Pix Format
> >                 Device Capabilities
> >         Device Caps      : 0x04204000
> >                 Video Memory-to-Memory Multiplanar
> >                 Streaming
> >                 Extended Pix Format
> >         Detected Stateful Decoder
> >
> > Required ioctls:
> >         test VIDIOC_QUERYCAP: OK
> >         test invalid ioctls: OK
> >
> > Allow for multiple opens:
> >         test second /dev/video0 open: OK
> >         test VIDIOC_QUERYCAP: OK
> >         test VIDIOC_G/S_PRIORITY: OK
> >         test for unlimited opens: OK
> >
> > Debug ioctls:
> >         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> >         test VIDIOC_LOG_STATUS: OK (Not Supported)
> >
> > Input ioctls:
> >         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> >         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> >         test VIDIOC_ENUMAUDIO: OK (Not Supported)
> >         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> >         test VIDIOC_G/S_AUDIO: OK (Not Supported)
> >         Inputs: 0 Audio Inputs: 0 Tuners: 0
> >
> > Output ioctls:
> >         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> >         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> >         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> >         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> >         Outputs: 0 Audio Outputs: 0 Modulators: 0
> >
> > Input/Output configuration ioctls:
> >         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> >         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> >         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> >         test VIDIOC_G/S_EDID: OK (Not Supported)
> >
> > Control ioctls:
> >         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> >         test VIDIOC_QUERYCTRL: OK
> >         test VIDIOC_G/S_CTRL: OK
> >         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> >         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> >         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> >         Standard Controls: 3 Private Controls: 0
> >
> > Format ioctls:
> >         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> >         test VIDIOC_G/S_PARM: OK (Not Supported)
> >         test VIDIOC_G_FBUF: OK (Not Supported)
> >         test VIDIOC_G_FMT: OK
> >         test VIDIOC_TRY_FMT: OK
> >         test VIDIOC_S_FMT: OK
> >         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> >         test Cropping: OK (Not Supported)
> >         test Composing: OK
> >         test Scaling: OK (Not Supported)
> >
> > Codec ioctls:
> >         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> >         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> >         test VIDIOC_(TRY_)DECODER_CMD: OK
> >
> > Buffer ioctls:
> >         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> >         test VIDIOC_EXPBUF: OK
> >         test Requests: OK (Not Supported)
> >
> > Total for imx8q-vpu device /dev/video0: 45, Succeeded: 45, Failed: 0,
> > Warnings: 0
> >
> > # v4l2-compliance -d /dev/video1
> > v4l2-compliance 1.21.0-4838, 64 bits, 64-bit time_t v4l2-compliance
> > SHA: 22466798f9a9 2021-08-25 11:05:21
> >
> > Compliance test for imx8q-vpu device /dev/video1:
> >
> > Driver Info:
> >         Driver name      : imx8q-vpu
> >         Card type        : imx8q vpu encoder
> >         Bus info         : platform: imx8q-vpu
> >         Driver version   : 5.14.0
> >         Capabilities     : 0x84204000
> >                 Video Memory-to-Memory Multiplanar
> >                 Streaming
> >                 Extended Pix Format
> >                 Device Capabilities
> >         Device Caps      : 0x04204000
> >                 Video Memory-to-Memory Multiplanar
> >                 Streaming
> >                 Extended Pix Format
> >         Detected Stateful Encoder
> >
> > Required ioctls:
> >         test VIDIOC_QUERYCAP: OK
> >         test invalid ioctls: OK
> >
> > Allow for multiple opens:
> >         test second /dev/video1 open: OK
> >         test VIDIOC_QUERYCAP: OK
> >         test VIDIOC_G/S_PRIORITY: OK
> >         test for unlimited opens: OK
> >
> > Debug ioctls:
> >         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> >         test VIDIOC_LOG_STATUS: OK (Not Supported)
> >
> > Input ioctls:
> >         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> >         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> >         test VIDIOC_ENUMAUDIO: OK (Not Supported)
> >         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> >         test VIDIOC_G/S_AUDIO: OK (Not Supported)
> >         Inputs: 0 Audio Inputs: 0 Tuners: 0
> >
> > Output ioctls:
> >         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> >         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> >         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> >         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> >         Outputs: 0 Audio Outputs: 0 Modulators: 0
> >
> > Input/Output configuration ioctls:
> >         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> >         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> >         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> >         test VIDIOC_G/S_EDID: OK (Not Supported)
> >
> > Control ioctls:
> >         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> >         test VIDIOC_QUERYCTRL: OK
> >         test VIDIOC_G/S_CTRL: OK
> >         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> >         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> >         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> >         Standard Controls: 20 Private Controls: 0
> >
> > Format ioctls:
> >         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> >         test VIDIOC_G/S_PARM: OK
> >         test VIDIOC_G_FBUF: OK (Not Supported)
> >         test VIDIOC_G_FMT: OK
> >         test VIDIOC_TRY_FMT: OK
> >         test VIDIOC_S_FMT: OK
> >         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> >         test Cropping: OK
> >         test Composing: OK (Not Supported)
> >         test Scaling: OK (Not Supported)
> >
> > Codec ioctls:
> >         test VIDIOC_(TRY_)ENCODER_CMD: OK
> >         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> >         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> >
> > Buffer ioctls:
> >         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> >         test VIDIOC_EXPBUF: OK
> >         test Requests: OK (Not Supported)
> >
> > Total for imx8q-vpu device /dev/video1: 45, Succeeded: 45, Failed: 0,
> > Warnings: 0
> >
> > Ming Qian (14):
> >   dt-bindings: media: imx8q: add imx video codec bindings
> >   media:Add nt8 and nt10 video format.
> >   media:Add v4l2 buf flag codec data.
> >   media: imx: imx8q: add imx8q vpu device driver
> >   media: imx: imx8q: add vpu core driver
> >   media: imx: imx8q: implement vpu core communication based on
> mailbox
> >   media: imx: imx8q: add vpu v4l2 m2m support
> >   media: imx: imx8q: add v4l2 m2m vpu encoder stateful driver
> >   media: imx: imx8q: add v4l2 m2m vpu decoder stateful driver
> >   media: imx: imx8q: implement windsor encoder rpc interface
> >   media: imx: imx8q: implement malone decoder rpc interface
> >   ARM64: dts: freescale: imx8q: add imx vpu codec entries
> >   firmware: imx: scu-pd: imx8q: add vpu mu resources
> >   MAINTAINERS: add NXP IMX8Q VPU CODEC V4L2 driver entry
> >
> >  .../bindings/media/nxp,imx8q-vpu.yaml         |  178 ++
> >  .../userspace-api/media/v4l/buffer.rst        |    7 +
> >  .../media/v4l/pixfmt-yuv-planar.rst           |   15 +
> >  .../media/v4l/vidioc-dqevent.rst              |   12 +
> >  MAINTAINERS                                   |   10 +
> >  .../arm64/boot/dts/freescale/imx8-ss-vpu.dtsi |   72 +
> >  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |   17 +
> >  arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   24 +
> >  drivers/firmware/imx/scu-pd.c                 |    4 +
> >  drivers/media/platform/Kconfig                |    2 +
> >  drivers/media/platform/Makefile               |    2 +
> >  drivers/media/platform/imx/Kconfig            |   19 +
> >  drivers/media/platform/imx/Makefile           |    1 +
> >  drivers/media/platform/imx/vpu-8q/Makefile    |   23 +
> >  drivers/media/platform/imx/vpu-8q/vdec.c      | 1684
> +++++++++++++++++
> >  drivers/media/platform/imx/vpu-8q/venc.c      | 1383
> ++++++++++++++
> >  drivers/media/platform/imx/vpu-8q/vpu.h       |  333 ++++
> >  drivers/media/platform/imx/vpu-8q/vpu_cmds.c  |  435 +++++
> >  drivers/media/platform/imx/vpu-8q/vpu_cmds.h  |   25 +
> >  drivers/media/platform/imx/vpu-8q/vpu_codec.h |   68 +
> >  drivers/media/platform/imx/vpu-8q/vpu_color.c |  192 ++
> > drivers/media/platform/imx/vpu-8q/vpu_core.c  |  911 +++++++++
> >  drivers/media/platform/imx/vpu-8q/vpu_core.h  |   16 +
> >  drivers/media/platform/imx/vpu-8q/vpu_dbg.c   |  496 +++++
> >  drivers/media/platform/imx/vpu-8q/vpu_defs.h  |  186 ++
> >  .../media/platform/imx/vpu-8q/vpu_dev_imx8q.c |   72 +
> >  drivers/media/platform/imx/vpu-8q/vpu_drv.c   |  217 +++
> >  .../media/platform/imx/vpu-8q/vpu_helpers.c   |  453 +++++
> >  .../media/platform/imx/vpu-8q/vpu_helpers.h   |   72 +
> >  drivers/media/platform/imx/vpu-8q/vpu_imx8q.c |  218 +++
> > drivers/media/platform/imx/vpu-8q/vpu_imx8q.h |  116 ++
> >  drivers/media/platform/imx/vpu-8q/vpu_log.h   |   44 +
> >  .../media/platform/imx/vpu-8q/vpu_malone.c    | 1683
> ++++++++++++++++
> >  .../media/platform/imx/vpu-8q/vpu_malone.h    |   42 +
> >  drivers/media/platform/imx/vpu-8q/vpu_mbox.c  |  126 ++
> >  drivers/media/platform/imx/vpu-8q/vpu_mbox.h  |   16 +
> >  drivers/media/platform/imx/vpu-8q/vpu_msgs.c  |  413 ++++
> >  drivers/media/platform/imx/vpu-8q/vpu_msgs.h  |   14 +
> >  drivers/media/platform/imx/vpu-8q/vpu_rpc.c   |  257 +++
> >  drivers/media/platform/imx/vpu-8q/vpu_rpc.h   |  463 +++++
> >  drivers/media/platform/imx/vpu-8q/vpu_v4l2.c  |  654 +++++++
> >  drivers/media/platform/imx/vpu-8q/vpu_v4l2.h  |   44 +
> >  .../media/platform/imx/vpu-8q/vpu_windsor.c   | 1244 ++++++++++++
> >  .../media/platform/imx/vpu-8q/vpu_windsor.h   |   39 +
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
> >  include/linux/imx_vpu.h                       |   11 +
> >  include/uapi/linux/imx_vpu.h                  |   18 +
> >  include/uapi/linux/videodev2.h                |    5 +
> >  48 files changed, 12338 insertions(+)  create mode 100644
> > Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi
> >  create mode 100644 drivers/media/platform/imx/Kconfig
> >  create mode 100644 drivers/media/platform/imx/Makefile
> >  create mode 100644 drivers/media/platform/imx/vpu-8q/Makefile
> >  create mode 100644 drivers/media/platform/imx/vpu-8q/vdec.c
> >  create mode 100644 drivers/media/platform/imx/vpu-8q/venc.c
> >  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu.h
> >  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_cmds.c
> >  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_cmds.h
> >  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_codec.h
> >  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_color.c
> >  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_core.c
> >  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_core.h
> >  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_dbg.c
> >  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_defs.h
> >  create mode 100644
> drivers/media/platform/imx/vpu-8q/vpu_dev_imx8q.c
> >  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_drv.c
> >  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_helpers.c
> >  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_helpers.h
> >  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_imx8q.c
> >  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_imx8q.h
> >  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_log.h
> >  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_malone.c
> >  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_malone.h
> >  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_mbox.c
> >  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_mbox.h
> >  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_msgs.c
> >  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_msgs.h
> >  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_rpc.c
> >  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_rpc.h
> >  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_v4l2.c
> >  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_v4l2.h
> >  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_windsor.c
> >  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_windsor.h
> >  create mode 100644 include/linux/imx_vpu.h  create mode 100644
> > include/uapi/linux/imx_vpu.h
> >
> >
> > base-commit: 9c3a0f285248899dfa81585bc5d5bc9ebdb8fead
> > --
> > 2.32.0
> >
