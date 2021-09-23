Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB74415C28
	for <lists+linux-media@lfdr.de>; Thu, 23 Sep 2021 12:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240400AbhIWKqm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Sep 2021 06:46:42 -0400
Received: from mail-db8eur05on2088.outbound.protection.outlook.com ([40.107.20.88]:11232
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236299AbhIWKqm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Sep 2021 06:46:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6DtIre0xd+SNDTbJbnu7CDZg8XLcSgx6S/VgsyoUS5S0W+P4d27IFHSAnV84pz/1NkPbj+3HucKMR1y9m/wHPPmnFwuW08nK4LtjG9X7eknHBoGd2pUwtekX0/JbDfiB1cZLeXnzefEoNVWHhxOeQ9eCtZZbS+JaXYoa2u15t0p1Jg1HSfl245u1158+032QxZnzV8zKnwlut0gLs3qmEuFv4NnWRrakW7dlkp4g4aSOZY9Xn4aIAKV8i8Rmork8aFtyvZAed8RP3WXu3sFpnGG98R/uKUjvCd071XHomKpTwQL57nZhD291fk7xHqzLA/lRHFYAwjzgV9wf4LyHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=wLU8AXbGZvcai6tVo2sWaPXwiknTkwjsQsqrQiH6Hrc=;
 b=NN4SFhs3OC0ayFPCb/dxFp8lnO5gRtbL7zqQF/KE7/jR09m5K30uoseKKF+zGoObSpDx/f8ypbkRe9TCz5v3NLtv7pAZJT4nn6LDrniknxv3qhnmJGRryhi6W25UmOvlpz5FuxknO141pmJvAbfKi917gNUapgCanfV8YJ+Qoa8XHh5GfClxi/MPMf/rPiOg4v+BO15KgJT3SEqiwI7LBwtiIFyfqeWPSq9B4DQf3IygC9eKWQiw/FYHbfMekE5HOQwdwFxT7omVfcpSz8hNT0HUG/TGMk3Of/r5fGM/U57Gpo7awHSZ3M4qAYhnnc4MlObER2zWbZC0GUd/+Y5/UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLU8AXbGZvcai6tVo2sWaPXwiknTkwjsQsqrQiH6Hrc=;
 b=OGQvVidxeZcX8mB0ZeOxMjxQ78KA0VzfH4RVQWx9GU1iDs77fL2hWRSEW+1Pp6Wp02pOd7VVqnDDvqA0CRYtF8abNnqtArcEufYwSeEEaccWPKAYDLiY5iidMek8tE7Kps/Jtepw/v7GiL///qzG6g+Nh0akToDIrRjrCz9VECU=
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB5478.eurprd04.prod.outlook.com (2603:10a6:20b:97::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 23 Sep
 2021 10:45:06 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4%7]) with mapi id 15.20.4523.021; Thu, 23 Sep 2021
 10:45:06 +0000
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
Subject: RE: [EXT] Re: [PATCH v9 00/13] amphion video decoder/encoder driver
Thread-Topic: [EXT] Re: [PATCH v9 00/13] amphion video decoder/encoder driver
Thread-Index: AQHXqHsJncmkW9L/EEiQfQa7MM7iRKuwJzOAgAFUd/A=
Date:   Thu, 23 Sep 2021 10:45:06 +0000
Message-ID: <AM6PR04MB6341879E600E5673FB94F71AE7A39@AM6PR04MB6341.eurprd04.prod.outlook.com>
References: <cover.1631521295.git.ming.qian@nxp.com>
 <7591d62b4aedb0ad789f09d90695c700c65df53d.camel@ndufresne.ca>
In-Reply-To: <7591d62b4aedb0ad789f09d90695c700c65df53d.camel@ndufresne.ca>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ndufresne.ca; dkim=none (message not signed)
 header.d=none;ndufresne.ca; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b182b2a2-7c29-42bd-1ede-08d97e7f3543
x-ms-traffictypediagnostic: AM6PR04MB5478:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB547808E9CBB1582F369A5370E7A39@AM6PR04MB5478.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Biff9NEkwkbqqABdayrZmk5sU4lk4honagxIq9YeDhigI1zdmUKWV0YHSKFndXqRr8TWdIqVduhHi4SrF9DwJY42G0VQdkN4mLH9lnT3l6DgZbsiaXLRgulvMEAfnCpKJE510vm+HubB2pnMvumeKgJ2uK0eloxlnn/7cQa3Z+8WHL1kmJohaHrlEiRFKTo5Um/K9cI0LUFaMxT5JDLMoVCoLJCrcfbtKlVOgVDt4ILUdueeFuI4QEt5C4shpXxsWOGr6KxsnWZC3XUtZyQJI+qd4BM9MbJYKs/2qSJxvfTGzzI60FV/aqfrVLjUFgTuxQqP8j0p6RcBeNySqAKlNswgW3R+A2SwKA0o27a4ZJxv5rJPYwJTnZ/UBz6ja8GgXK7qSUcOlzSvFIrG9sAktyBb2BiZrAgP7mP/tezx/i6kBfg5HhxYLnSvhJ0v0EN5gInu/xGYXWk16NiHxzE8SxGrb4lUW0luYyLmt+G+IYZ63ofmRaeedKqiBUwOppP2pE5a5t9K9QyYSzaHLxHELxlTxnsE3kb4PUM9xB3B4CtPYCUVDblQevu5hTysV1XIdvqiifKdUmi0WFZv3HeAKlX3sxAt/JzN2r0CzhhZWEVys8rAwBv9rZ73zF/7dEeNaobZUyBCPemIe4ldJjF/RzyD1tWAYPyoD/aM2gvoXpLSbeKHbRKC3yxstHbuW8Fp2K+IrcaStNg7M5493NRZqXJl4vN7xNBv5Eh8FquxDteVGK7yvgoHBK+odDFpbseYX2zw1hpO0e2DR92Pw5klPFWX9K+AZLoy1x6zoZCvqnk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(7416002)(44832011)(76116006)(7696005)(53546011)(66574015)(6506007)(71200400001)(83380400001)(8676002)(54906003)(8936002)(508600001)(186003)(110136005)(66446008)(2906002)(966005)(5660300002)(64756008)(66556008)(52536014)(66476007)(66946007)(4326008)(45080400002)(26005)(9686003)(38070700005)(86362001)(55016002)(316002)(30864003)(33656002)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?XZa1+vjUSi+f6DlqjPquFmpCWGdVTnh9h0SV5KvANDbUvMEUS+hg9a9Rod?=
 =?iso-8859-1?Q?LpNMFEElhkGghJjcVZDHsibRrxLWv7b7GHrVO+ExIfrWX0BPNCvFQ4ThKL?=
 =?iso-8859-1?Q?jI3qwCo8U3uL9DINEgPDvm5AAIYuUYXDG2KoZIKSMywYoWJl0eU38k1DQX?=
 =?iso-8859-1?Q?PXPwD1ekg/1UylAfc63gbvMvopCBWhUC+S7YFdL/XsSMBPozM7QnQ4Gu27?=
 =?iso-8859-1?Q?HrShSV0BJTBDksZZL0Xk5fxciiwc+wBUXCNLnupV8rnwzvEQFAjmPR9YE0?=
 =?iso-8859-1?Q?W1I9KERtyyyHMhqU2QgOnbuuj6pIeuSfAUW7cAOY0TX3EjM8IZe22iXjzI?=
 =?iso-8859-1?Q?8HQmQhB3rVzvaOWJPvK0jvvWNwGsNMfC9eVhJTPyDEeZz3X2ZpePUcYtWT?=
 =?iso-8859-1?Q?4ZcaPaZ57vYaFlAj6nuzsCNVop7OXGbREBMGoyf4yjDF4FpP8CcBztelAr?=
 =?iso-8859-1?Q?C0sonawQj11qLM1h8u36fooTywOo6z3yJundBO+03Wn1Hg2H9NbJGQVxqC?=
 =?iso-8859-1?Q?8ajqm7d4saoZ9P6WjlrxFpI9mctPshzgIsN20EJuBLHHGvqPoUd72dnB+F?=
 =?iso-8859-1?Q?VmdV9tLYsrNp3iBSCi1WPL35JeraRcDlx6OWqWuMVwUomqp8TqO3ytEbZ4?=
 =?iso-8859-1?Q?kPhPHs5JROGAsFtxGADLp4MBIqmpzqJv+Um47bTwJ85a9HOgNl1o3mrmvb?=
 =?iso-8859-1?Q?DajtJ+5qPrlBXZtOHBU+2fRVifAepdkY9e83vGSKNvLDNSN2lfps4fnp+v?=
 =?iso-8859-1?Q?SYvfFMRHSZYzBkD3HWNcZoUdDOVlFpDjki09Yd0qaYTnhGrirRrf+xbl2J?=
 =?iso-8859-1?Q?lxaEDrrq7k+zNa/rDYv3/hZ9BtFwXy0QU4Xg2PnIQSRE7Uj/2S6A99wl+N?=
 =?iso-8859-1?Q?dnTlHT0j3/9iQQ1ubHS6OwmHeYYzFwRPMi7JAnen8gJ0M04eveF9IQ86iB?=
 =?iso-8859-1?Q?DkrkjpVQWNcILcF71tjxpYlqWwnCTFY9NIYD1lY4sMAovSvFouPwTmNRSM?=
 =?iso-8859-1?Q?AsimSyjE2zdEpp9iIxO6eHbxUnTT2b0wxrhMpKCjXat/0AcpM9eGlraF4k?=
 =?iso-8859-1?Q?wqUWnFkw/GgGBvYJrEuxp0Ss1V2WY3lxmuCbuaBVwJi9wsvTHuoa/2y9yu?=
 =?iso-8859-1?Q?qshJzoCvd8OCElluZHlQvcVylKFh8TCThb+3jY+0lRubw+zDr3g1HFUYzZ?=
 =?iso-8859-1?Q?uvRA9JLBu+/uGcz+kjE7qy53ZJ0kuul2JgzW13xCUSjp9Czehmb+M4Gx8E?=
 =?iso-8859-1?Q?haypuDRU7EwycGPHXK4kZs+vWyXb2X+ChdK7NlJVfswLCMJsQTS94Tmya3?=
 =?iso-8859-1?Q?QZveSfqm1BmHiX2KJxJf5dqNehO2ce5rTs2d+FEJ3yfOK/5fxy3IfY69qY?=
 =?iso-8859-1?Q?V/KBkUfB3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b182b2a2-7c29-42bd-1ede-08d97e7f3543
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2021 10:45:06.7214
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IFe3ssJfjM0QrdlwPU4yVLbDElaDcE1IBYYmuX5p3OpCBy+gdqedb7LAXjgJLa9Jx/11lMMdZvj7FX/hVwE0iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5478
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> -----Original Message-----
> From: Nicolas Dufresne [mailto:nicolas@ndufresne.ca]
> Sent: Wednesday, September 22, 2021 10:14 PM
> To: Ming Qian <ming.qian@nxp.com>; mchehab@kernel.org;
> shawnguo@kernel.org; robh+dt@kernel.org; s.hauer@pengutronix.de
> Cc: hverkuil-cisco@xs4all.nl; kernel@pengutronix.de; festevam@gmail.com;
> dl-linux-imx <linux-imx@nxp.com>; Aisheng Dong <aisheng.dong@nxp.com>;
> linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> Subject: [EXT] Re: [PATCH v9 00/13] amphion video decoder/encoder driver
>=20
> Caution: EXT Email
>=20
> Hi Ming,
>=20
> Le lundi 13 septembre 2021 =E0 17:11 +0800, Ming Qian a =E9crit :
> > Hi all,
> >
> > This patch series adds support for
> > the amphion video encoder and decoder
> > via the VPU block present in imx8q platforms.
> > Currently, support for IMX8QXP and IMX8QM is included.
>=20
> I've been trying to test this driver, based it on mainline 5.15-rc2 in ab=
sence of
> recommendation here. There seems to be poor mainline support for this boa=
rd,
> notably only 1 CPU come up. Finally, I could not test anything as the dri=
ver
> failed to boot the decoders and encoder cores:
>=20
> [   30.766160] [VPU CORE][0] decoder boot
> [   31.873175] [VPU CORE][0] decoder boot timeout
> [   31.878057] [VPU V4L2]there is no core for decoder
> [ 1766.495963] [VPU CORE][1] encoder boot [ 1767.524957] [VPU CORE][1]
> encoder boot timeout [ 1767.529724] [VPU V4L2]there is no core for encode=
r
>=20
> Please, let me know how I can get passed these issues. I have used firmwa=
res
> referenced in Yocto tree:
>=20
>=20
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.n
> xp.com%2Flgfiles%2FNMG%2FMAD%2FYOCTO%2Ffirmware-imx-7.9.bin&amp
> ;data=3D04%7C01%7Cming.qian%40nxp.com%7Ce50ac93addb444f7cd9b08d97
> dd33c6e%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63767916
> 8483236134%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj
> oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DcM3%2F
> Go0MxD0RSDmS5ELr6yCdNe4EH%2FeTAFtcAcBArRo%3D&amp;reserved=3D0
>=20
> Firmware for this driver will also be a subject to tackle. In an ideal wo=
rld, the
> "self extracted" script requirement to accept your EULA would need to be
> waved, and distribution of the firmware should go into linux-firmwares. I
> believe firmwares are still allowed to have some user agreement, but I su=
ppose
> there must be guidelines, best is to ask there directly.
>=20
> regards,
> Nicolas
>=20

Seems you use the wrong firmware, I will send the firmware to you.
My commit base is 9c3a0f285248899dfa81585bc5d5bc9ebdb8fead,=20
You can find it in the bottom of this cover.

Would you please explain the linux-firmware issue in detail

> >
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
> > v9
> > - drop V4L2_BUF_FLAG_CODECCONFIG
> > - drop V4L2_EVENT_CODEC_ERROR
> > - drop V4L2_EVENT_SKIP
> > - use the v4l2_buffer.sequence counter
> > - fix some build warnings with W=3D1 reported by kernel test robot
> >
> > v8
> > - move driver from driver/media/platform/imx/vpu-8q to
> >   driver/media/platform/amphion
> > - rename driver name to amphion
> > - remove imx_vpu.h
> > - move the definition of V4L2_EVENT_CODEC_ERROR to videodev2.h
> > - move the definition of V4L2_EVENT_SKIP to videodev2.h
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
> > Compliance test for amphion-vpu device /dev/video0:
> >
> > Driver Info:
> >       Driver name      : amphion-vpu
> >       Card type        : amphion vpu decoder
> >       Bus info         : platform: amphion-vpu
> >       Driver version   : 5.14.0
> >       Capabilities     : 0x84204000
> >               Video Memory-to-Memory Multiplanar
> >               Streaming
> >               Extended Pix Format
> >               Device Capabilities
> >       Device Caps      : 0x04204000
> >               Video Memory-to-Memory Multiplanar
> >               Streaming
> >               Extended Pix Format
> >       Detected Stateful Decoder
> >
> > Required ioctls:
> >       test VIDIOC_QUERYCAP: OK
> >       test invalid ioctls: OK
> >
> > Allow for multiple opens:
> >       test second /dev/video0 open: OK
> >       test VIDIOC_QUERYCAP: OK
> >       test VIDIOC_G/S_PRIORITY: OK
> >       test for unlimited opens: OK
> >
> > Debug ioctls:
> >       test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> >       test VIDIOC_LOG_STATUS: OK (Not Supported)
> >
> > Input ioctls:
> >       test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> >       test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >       test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> >       test VIDIOC_ENUMAUDIO: OK (Not Supported)
> >       test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> >       test VIDIOC_G/S_AUDIO: OK (Not Supported)
> >       Inputs: 0 Audio Inputs: 0 Tuners: 0
> >
> > Output ioctls:
> >       test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> >       test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >       test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> >       test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> >       test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> >       Outputs: 0 Audio Outputs: 0 Modulators: 0
> >
> > Input/Output configuration ioctls:
> >       test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> >       test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> >       test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> >       test VIDIOC_G/S_EDID: OK (Not Supported)
> >
> > Control ioctls:
> >       test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> >       test VIDIOC_QUERYCTRL: OK
> >       test VIDIOC_G/S_CTRL: OK
> >       test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> >       test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> >       test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> >       Standard Controls: 3 Private Controls: 0
> >
> > Format ioctls:
> >       test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> >       test VIDIOC_G/S_PARM: OK (Not Supported)
> >       test VIDIOC_G_FBUF: OK (Not Supported)
> >       test VIDIOC_G_FMT: OK
> >       test VIDIOC_TRY_FMT: OK
> >       test VIDIOC_S_FMT: OK
> >       test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> >       test Cropping: OK (Not Supported)
> >       test Composing: OK
> >       test Scaling: OK (Not Supported)
> >
> > Codec ioctls:
> >       test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> >       test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> >       test VIDIOC_(TRY_)DECODER_CMD: OK
> >
> > Buffer ioctls:
> >       test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> >       test VIDIOC_EXPBUF: OK
> >       test Requests: OK (Not Supported)
> >
> > Total for amphion-vpu device /dev/video0: 45, Succeeded: 45, Failed:
> > 0, Warnings: 0
> >
> > # v4l2-compliance -d /dev/video1
> > v4l2-compliance 1.21.0-4838, 64 bits, 64-bit time_t v4l2-compliance
> > SHA: 22466798f9a9 2021-08-25 11:05:21
> >
> > Compliance test for amphion-vpu device /dev/video1:
> >
> > Driver Info:
> >       Driver name      : amphion-vpu
> >       Card type        : amphion vpu encoder
> >       Bus info         : platform: amphion-vpu
> >       Driver version   : 5.14.0
> >       Capabilities     : 0x84204000
> >               Video Memory-to-Memory Multiplanar
> >               Streaming
> >               Extended Pix Format
> >               Device Capabilities
> >       Device Caps      : 0x04204000
> >               Video Memory-to-Memory Multiplanar
> >               Streaming
> >               Extended Pix Format
> >       Detected Stateful Encoder
> >
> > Required ioctls:
> >       test VIDIOC_QUERYCAP: OK
> >       test invalid ioctls: OK
> >
> > Allow for multiple opens:
> >       test second /dev/video1 open: OK
> >       test VIDIOC_QUERYCAP: OK
> >       test VIDIOC_G/S_PRIORITY: OK
> >       test for unlimited opens: OK
> >
> > Debug ioctls:
> >       test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> >       test VIDIOC_LOG_STATUS: OK (Not Supported)
> >
> > Input ioctls:
> >       test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> >       test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >       test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> >       test VIDIOC_ENUMAUDIO: OK (Not Supported)
> >       test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> >       test VIDIOC_G/S_AUDIO: OK (Not Supported)
> >       Inputs: 0 Audio Inputs: 0 Tuners: 0
> >
> > Output ioctls:
> >       test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> >       test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >       test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> >       test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> >       test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> >       Outputs: 0 Audio Outputs: 0 Modulators: 0
> >
> > Input/Output configuration ioctls:
> >       test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> >       test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> >       test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> >       test VIDIOC_G/S_EDID: OK (Not Supported)
> >
> > Control ioctls:
> >       test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> >       test VIDIOC_QUERYCTRL: OK
> >       test VIDIOC_G/S_CTRL: OK
> >       test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> >       test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> >       test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> >       Standard Controls: 20 Private Controls: 0
> >
> > Format ioctls:
> >       test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> >       test VIDIOC_G/S_PARM: OK
> >       test VIDIOC_G_FBUF: OK (Not Supported)
> >       test VIDIOC_G_FMT: OK
> >       test VIDIOC_TRY_FMT: OK
> >       test VIDIOC_S_FMT: OK
> >       test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> >       test Cropping: OK
> >       test Composing: OK (Not Supported)
> >       test Scaling: OK (Not Supported)
> >
> > Codec ioctls:
> >       test VIDIOC_(TRY_)ENCODER_CMD: OK
> >       test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> >       test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> >
> > Buffer ioctls:
> >       test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> >       test VIDIOC_EXPBUF: OK
> >       test Requests: OK (Not Supported)
> >
> > Total for amphion-vpu device /dev/video1: 45, Succeeded: 45, Failed:
> > 0, Warnings: 0
> >
> > Ming Qian (13):
> >   dt-bindings: media: amphion: add amphion video codec bindings
> >   media:Add nt8 and nt10 video format.
> >   media: amphion: add amphion vpu device driver
> >   media: amphion: add vpu core driver
> >   media: amphion: implement vpu core communication based on mailbox
> >   media: amphion: add vpu v4l2 m2m support
> >   media: amphion: add v4l2 m2m vpu encoder stateful driver
> >   media: amphion: add v4l2 m2m vpu decoder stateful driver
> >   media: amphion: implement windsor encoder rpc interface
> >   media: amphion: implement malone decoder rpc interface
> >   ARM64: dts: freescale: imx8q: add imx vpu codec entries
> >   firmware: imx: scu-pd: imx8q: add vpu mu resources
> >   MAINTAINERS: add AMPHION VPU CODEC V4L2 driver entry
> >
> >  .../bindings/media/amphion,vpu.yaml           |  178 ++
> >  .../media/v4l/pixfmt-yuv-planar.rst           |   15 +
> >  MAINTAINERS                                   |    9 +
> >  .../arm64/boot/dts/freescale/imx8-ss-vpu.dtsi |   72 +
> >  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |   17 +
> >  arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   24 +
> >  drivers/firmware/imx/scu-pd.c                 |    4 +
> >  drivers/media/platform/Kconfig                |   19 +
> >  drivers/media/platform/Makefile               |    2 +
> >  drivers/media/platform/amphion/Makefile       |   23 +
> >  drivers/media/platform/amphion/vdec.c         | 1652
> ++++++++++++++++
> >  drivers/media/platform/amphion/venc.c         | 1382
> ++++++++++++++
> >  drivers/media/platform/amphion/vpu.h          |  333 ++++
> >  drivers/media/platform/amphion/vpu_cmds.c     |  435 +++++
> >  drivers/media/platform/amphion/vpu_cmds.h     |   25 +
> >  drivers/media/platform/amphion/vpu_codec.h    |   68 +
> >  drivers/media/platform/amphion/vpu_color.c    |  192 ++
> >  drivers/media/platform/amphion/vpu_core.c     |  901 +++++++++
> >  drivers/media/platform/amphion/vpu_core.h     |   16 +
> >  drivers/media/platform/amphion/vpu_dbg.c      |  496 +++++
> >  drivers/media/platform/amphion/vpu_defs.h     |  186 ++
> >  .../media/platform/amphion/vpu_dev_imx8q.c    |   72 +
> >  drivers/media/platform/amphion/vpu_drv.c      |  215 +++
> >  drivers/media/platform/amphion/vpu_helpers.c  |  453 +++++
> >  drivers/media/platform/amphion/vpu_helpers.h  |   72 +
> >  drivers/media/platform/amphion/vpu_imx8q.c    |  218 +++
> >  drivers/media/platform/amphion/vpu_imx8q.h    |  116 ++
> >  drivers/media/platform/amphion/vpu_log.h      |   44 +
> >  drivers/media/platform/amphion/vpu_malone.c   | 1683
> +++++++++++++++++
> >  drivers/media/platform/amphion/vpu_malone.h   |   42 +
> >  drivers/media/platform/amphion/vpu_mbox.c     |  126 ++
> >  drivers/media/platform/amphion/vpu_mbox.h     |   16 +
> >  drivers/media/platform/amphion/vpu_msgs.c     |  413 ++++
> >  drivers/media/platform/amphion/vpu_msgs.h     |   14 +
> >  drivers/media/platform/amphion/vpu_rpc.c      |  263 +++
> >  drivers/media/platform/amphion/vpu_rpc.h      |  463 +++++
> >  drivers/media/platform/amphion/vpu_v4l2.c     |  625 ++++++
> >  drivers/media/platform/amphion/vpu_v4l2.h     |   53 +
> >  drivers/media/platform/amphion/vpu_windsor.c  | 1244 ++++++++++++
> >  drivers/media/platform/amphion/vpu_windsor.h  |   39 +
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
> >  include/uapi/linux/videodev2.h                |    4 +
> >  42 files changed, 12226 insertions(+)  create mode 100644
> > Documentation/devicetree/bindings/media/amphion,vpu.yaml
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi
> >  create mode 100644 drivers/media/platform/amphion/Makefile
> >  create mode 100644 drivers/media/platform/amphion/vdec.c
> >  create mode 100644 drivers/media/platform/amphion/venc.c
> >  create mode 100644 drivers/media/platform/amphion/vpu.h
> >  create mode 100644 drivers/media/platform/amphion/vpu_cmds.c
> >  create mode 100644 drivers/media/platform/amphion/vpu_cmds.h
> >  create mode 100644 drivers/media/platform/amphion/vpu_codec.h
> >  create mode 100644 drivers/media/platform/amphion/vpu_color.c
> >  create mode 100644 drivers/media/platform/amphion/vpu_core.c
> >  create mode 100644 drivers/media/platform/amphion/vpu_core.h
> >  create mode 100644 drivers/media/platform/amphion/vpu_dbg.c
> >  create mode 100644 drivers/media/platform/amphion/vpu_defs.h
> >  create mode 100644 drivers/media/platform/amphion/vpu_dev_imx8q.c
> >  create mode 100644 drivers/media/platform/amphion/vpu_drv.c
> >  create mode 100644 drivers/media/platform/amphion/vpu_helpers.c
> >  create mode 100644 drivers/media/platform/amphion/vpu_helpers.h
> >  create mode 100644 drivers/media/platform/amphion/vpu_imx8q.c
> >  create mode 100644 drivers/media/platform/amphion/vpu_imx8q.h
> >  create mode 100644 drivers/media/platform/amphion/vpu_log.h
> >  create mode 100644 drivers/media/platform/amphion/vpu_malone.c
> >  create mode 100644 drivers/media/platform/amphion/vpu_malone.h
> >  create mode 100644 drivers/media/platform/amphion/vpu_mbox.c
> >  create mode 100644 drivers/media/platform/amphion/vpu_mbox.h
> >  create mode 100644 drivers/media/platform/amphion/vpu_msgs.c
> >  create mode 100644 drivers/media/platform/amphion/vpu_msgs.h
> >  create mode 100644 drivers/media/platform/amphion/vpu_rpc.c
> >  create mode 100644 drivers/media/platform/amphion/vpu_rpc.h
> >  create mode 100644 drivers/media/platform/amphion/vpu_v4l2.c
> >  create mode 100644 drivers/media/platform/amphion/vpu_v4l2.h
> >  create mode 100644 drivers/media/platform/amphion/vpu_windsor.c
> >  create mode 100644 drivers/media/platform/amphion/vpu_windsor.h
> >
> >
> > base-commit: 9c3a0f285248899dfa81585bc5d5bc9ebdb8fead
>=20

