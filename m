Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39207416990
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 03:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243785AbhIXBpA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Sep 2021 21:45:00 -0400
Received: from mail-eopbgr70055.outbound.protection.outlook.com ([40.107.7.55]:16134
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240863AbhIXBo7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Sep 2021 21:44:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fiBfl9mcprfkdZ5zDtuN/5ujoPvZ80fcwPZDsWCszIP9aqPTBS+Q+DMyuqbEWsh64ViYvWR92BLy26WRSOm+/v6IY1pyl1GdFvalp5JQQwmvY5irFFOVybvE4PHGL22IYY+sFmkeOg1IZEJzBIo+Rsz3TK0m3NdBi4SAJoTznphVe6QyTGw3gZHNzv4qR6LV78CQS8i1DNQSxgSVtcz0aecLTXFwTgMtNk81kTZg+xj3MSp2WJ2isbr+TZtha/SJOx4QfjHygJ5WCHV5GFEW38tMFjJnSFyqkzbg5JqMCevbONPpq6/oIQrIwbMf+gZ50NDH7vm+gZBOBPRZupROBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=6BJRd72TmMf8XuKWSL4v3dRi2vm4qxhn0rIERuf118o=;
 b=ZJgpzAzS6pBFk8Wjv8/OYPTaIiS6G6oXk8zlrnHQLO8+hh1w0RoCkZ9M84fsPYK+PLdo41vKejXQAxwygdnx00nkZo3PWPX0tBkqI2TuNc0bqMilUyKH2nq9swf2C2fKuFK3dStO+Vk/w/Exkr/RDV7o8XPYXHmfR7Ye1AuBoWfUERsbtD6Hs7khpYJBsN1w+10XOULL+gSEvixAbiA6OTW0gQLhiQplGZLsQbKR2LUbYDuxn7yWAS38Z246Dk3vGkotVGwhy2facyBXWPGLdpx6v4T5MIqJfTdvQXyMArGcTuLizPu26mr8CsO7QL3BfZ7XhCpajRNyW2J+aXLONQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6BJRd72TmMf8XuKWSL4v3dRi2vm4qxhn0rIERuf118o=;
 b=cHSoh+OZ2UmojQyJNCo9+Bq3vGmBXkXxCJz3P2We+UZGmc/cYcDjpXbKcby9JNmnUUifeRuZp6lnqKEzuQwKCzdprOn2JwQR70xmKbwZsxaRgbvcZIJf6K7Lirb8lu0yIVQIWa/FFmsQhQhdgOBsXxA6Ab+3HQMgv0VltPc4Rv8=
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB4071.eurprd04.prod.outlook.com (2603:10a6:209:47::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Fri, 24 Sep
 2021 01:43:24 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4%7]) with mapi id 15.20.4523.021; Fri, 24 Sep 2021
 01:43:24 +0000
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
Thread-Index: AQHXqHsJncmkW9L/EEiQfQa7MM7iRKuwJzOAgAFUd/CAADKvgIAAy2DQ
Date:   Fri, 24 Sep 2021 01:43:24 +0000
Message-ID: <AM6PR04MB6341B7D40D65671155CD555AE7A49@AM6PR04MB6341.eurprd04.prod.outlook.com>
References: <cover.1631521295.git.ming.qian@nxp.com>
         <7591d62b4aedb0ad789f09d90695c700c65df53d.camel@ndufresne.ca>
         <AM6PR04MB6341879E600E5673FB94F71AE7A39@AM6PR04MB6341.eurprd04.prod.outlook.com>
 <27ec66639de79216e9b887ee6977f35906e33a43.camel@ndufresne.ca>
In-Reply-To: <27ec66639de79216e9b887ee6977f35906e33a43.camel@ndufresne.ca>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ndufresne.ca; dkim=none (message not signed)
 header.d=none;ndufresne.ca; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc117880-97ca-444a-55b3-08d97efcb29c
x-ms-traffictypediagnostic: AM6PR04MB4071:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB4071E9C9F2A37002F4D97AB4E7A49@AM6PR04MB4071.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fs/vZsr9AIHQjuoVOGKJcPFUNKXzlhsZRIBa/eLxThQHXGLJ8jM28Ulr8qxZTi9lOY3wHplUpk1zbdLulqSwVJPQXI7UqllRyasTvbWgh9aYIxj1FDTfFQnglFetK+90wTyBhbsuMOaYbg+3/lAhqUOHciRkKzkEs3vl/NEEJriHwZnb7iCWu1gHDHJsTnQFI7Vy7Vw3vWZjv+uOQ3Ny+5X/U/px8uFwo0pEsfnRAwvD5sI0gqaoN1eyx58x0Md0Tuo8K+Cj7upyXhWAGI08erIzvefn6+vkJqF3tI7urc9vwdKUztUCXKSz/TOK67i2OSVF8VEHbSlbeWInx2uyEq6cJ6EHu9cs++/LykCvmyy3GIDvU1gNxcZc3osqotYdjglb11oMwjniM/SvN8OeA1Z3oMKqRB/luUAwtLPW5LOTmZXVXV0esGg2rW/i3DcGBCPFF6P+4OpWBeeqwmom9SthoZK9WtXCtfPaiu7yfl8ahUF0XbYENDiYLIqzsN1/E7FTkusMjVq9O93JABMgOsaLl6e+FzZEqoKFfq4It1V6xPnec9GeV/5QU7iuZA3X93f4JdTxD2Mx05z1OsNaUlHAYJlpVDCIvnSncaxaozfE8oDDPhv76VORnpLylgwXCWhgDAK3V2+TnN4vI9R5G+d8sWR3qIw4oJgVrnu/IR0tw279T6X8S7kJBGM76Y50yUNTZp31XLP56Sy3H/9RekMO5iQWLef1EiiXNGAoNVGX5/tMkxMQqPYnNZtvccyYLIjaIR56Bt4bN9/3DKz99aBbsQGnVTek1iksbQNwOIo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(71200400001)(508600001)(8936002)(44832011)(55016002)(966005)(76116006)(66446008)(66946007)(66476007)(66556008)(64756008)(8676002)(45080400002)(83380400001)(4326008)(66574015)(122000001)(2906002)(52536014)(54906003)(110136005)(26005)(86362001)(186003)(30864003)(7696005)(316002)(6506007)(38100700002)(38070700005)(7416002)(33656002)(5660300002)(9686003)(53546011)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?EeBJEjqm3NcjBOVXLtjXsdOOy2L49Ic6UuQ5t7ps7y5Ayqvn9fTFZIhhAK?=
 =?iso-8859-1?Q?55usZrHlLaDvKSirEVk6yow2GxMSdxFzb+YG9sInM0Thks8GtGe4kLHzsV?=
 =?iso-8859-1?Q?sD20tvwZFAPKsIyNfbvJCDYjPTQtVhkloctoyrEBK8jk9qJB4tvEJZzBk2?=
 =?iso-8859-1?Q?umiIrJKCDPf9T6bhqbqGbPT2RbSc30Gw9F5869reUvQVdSCrnuzsovdp3V?=
 =?iso-8859-1?Q?faw3pKzR1tUK5qx1PBI6qWJrY0W0ZGoHGx9ejsQksFGSsuatXIGTBUJzwM?=
 =?iso-8859-1?Q?wDI8ZnCrwmARpqitLT1Oz9C6UE1fvchBv8133SbC250IfA0WqtTjJ5ZsEA?=
 =?iso-8859-1?Q?UEIgjz2QLARYCOL1tO/1d00KWXg9TvT7xERumz03JO2IGB8ScS0DRNAQci?=
 =?iso-8859-1?Q?cEbZHx4iTIAxXzFn40tE2S8MMl+0Rb74hPhiNiPIF8mHIkcPgcjTo8SKc8?=
 =?iso-8859-1?Q?qnxOAAgUN2/4mAIFh/bFuBNjAuXk/wknLlDC2euNVKTF8eqa3jbv7lbFmk?=
 =?iso-8859-1?Q?vwBZYpJEw/aoAm54jWYhazJOLsbIU7BU+GYMgKn/msh6OdsmXa9ORwjyED?=
 =?iso-8859-1?Q?HDedfCvgjiciOvytMF6CB4IW0cGzlk+W5wr7RJOJiC6qnYQpV1FCam+7+j?=
 =?iso-8859-1?Q?rz813V3tVP5OFfNRBb8rLE3thf5PwLkbg3Heh6fahHcb0OgUaKMf5J2vjz?=
 =?iso-8859-1?Q?3QLAg6LODSSJEjZKqpzL7faJyKkaLA87485eJ6ltkbr889DP47W1AqEytC?=
 =?iso-8859-1?Q?cQK17oYF3+yf/zLTCShsXtgOsyZ+O2m3kDsTexiM24lXAd7Kh943V3ZKQn?=
 =?iso-8859-1?Q?Oa1qkluuYnG1wXKVjE6Zjl+Hfeihq1XPFLXG050N2rpgqCd7LM523kcDT5?=
 =?iso-8859-1?Q?Kmy17ZyJvORW1mhbIHXRzAsZecPnf1mohKA9gZQ/iHCR84qFW5/AbEp9nI?=
 =?iso-8859-1?Q?X0EfcO/hpRXnvt17aqL1M30sptnRrbyqJWrb/zifnoRq6V8rrl7pW9dlQt?=
 =?iso-8859-1?Q?r1DzLtG3dmJjO1ufMRiFWM44FI322KimWCwSx5QvQs2dR5hB4UUof0wrLn?=
 =?iso-8859-1?Q?rn+z7JclV6p6ghECtUAS0+ZNBbreLl0jIlsAZfrofcmbQF791IAMVO7HQG?=
 =?iso-8859-1?Q?Mj7pkDEal+cNZmEqmC/XGMOyzvQj/WYnyV/YobP6AK5p9is/AjDQXl2+21?=
 =?iso-8859-1?Q?mZUyJvJDwrdFGd4Zqp6KSkOX180nx4xU4J1w6Hn+YCWG4wfW5d/P5Y7f4d?=
 =?iso-8859-1?Q?Ikm3JWew4EUUFilR66ojYTXegyvrBCEmtjCp9Srqk4CBfOeZZBWJIBAHJy?=
 =?iso-8859-1?Q?Ab9yNtLqjFR0pepZW44f+U2RsaJ8vdhzPotZFJPkq0tqFBqpy28uyeVd+b?=
 =?iso-8859-1?Q?ZFihl5jMtW?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc117880-97ca-444a-55b3-08d97efcb29c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2021 01:43:24.1295
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9K3Q2h9YZKNMGbfITlWEGXPwNTG6DUuuvEi71ZpYTMuiqoe6INSlfJBMwZu8s5OXgEq2+M+oYtRp2Ap9fBixpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4071
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> -----Original Message-----
> From: Nicolas Dufresne [mailto:nicolas@ndufresne.ca]
> Sent: Thursday, September 23, 2021 9:34 PM
> To: Ming Qian <ming.qian@nxp.com>; mchehab@kernel.org;
> shawnguo@kernel.org; robh+dt@kernel.org; s.hauer@pengutronix.de
> Cc: hverkuil-cisco@xs4all.nl; kernel@pengutronix.de; festevam@gmail.com;
> dl-linux-imx <linux-imx@nxp.com>; Aisheng Dong <aisheng.dong@nxp.com>;
> linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> Subject: Re: [EXT] Re: [PATCH v9 00/13] amphion video decoder/encoder dri=
ver
>=20
> Caution: EXT Email
>=20
> Le jeudi 23 septembre 2021 =E0 10:45 +0000, Ming Qian a =E9crit :
> > > -----Original Message-----
> > > From: Nicolas Dufresne [mailto:nicolas@ndufresne.ca]
> > > Sent: Wednesday, September 22, 2021 10:14 PM
> > > To: Ming Qian <ming.qian@nxp.com>; mchehab@kernel.org;
> > > shawnguo@kernel.org; robh+dt@kernel.org; s.hauer@pengutronix.de
> > > Cc: hverkuil-cisco@xs4all.nl; kernel@pengutronix.de;
> > > festevam@gmail.com; dl-linux-imx <linux-imx@nxp.com>; Aisheng Dong
> > > <aisheng.dong@nxp.com>; linux-media@vger.kernel.org;
> > > linux-kernel@vger.kernel.org; devicetree@vger.kernel.org;
> > > linux-arm-kernel@lists.infradead.org
> > > Subject: [EXT] Re: [PATCH v9 00/13] amphion video decoder/encoder
> > > driver
> > >
> > > Caution: EXT Email
> > >
> > > Hi Ming,
> > >
> > > Le lundi 13 septembre 2021 =E0 17:11 +0800, Ming Qian a =E9crit :
> > > > Hi all,
> > > >
> > > > This patch series adds support for the amphion video encoder and
> > > > decoder via the VPU block present in imx8q platforms.
> > > > Currently, support for IMX8QXP and IMX8QM is included.
> > >
> > > I've been trying to test this driver, based it on mainline 5.15-rc2
> > > in absence of recommendation here. There seems to be poor mainline
> > > support for this board, notably only 1 CPU come up. Finally, I could
> > > not test anything as the driver failed to boot the decoders and
> > > encoder cores:
> > >
> > > [   30.766160] [VPU CORE][0] decoder boot
> > > [   31.873175] [VPU CORE][0] decoder boot timeout
> > > [   31.878057] [VPU V4L2]there is no core for decoder
> > > [ 1766.495963] [VPU CORE][1] encoder boot [ 1767.524957] [VPU
> > > CORE][1] encoder boot timeout [ 1767.529724] [VPU V4L2]there is no
> > > core for encoder
> > >
> > > Please, let me know how I can get passed these issues. I have used
> > > firmwares referenced in Yocto tree:
> > >
> > >
> > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
w
> > >
> w.n%2F&amp;data=3D04%7C01%7Cming.qian%40nxp.com%7Cf8066eb5434d4a
> 21498e
> > >
> 08d97e96ce6e%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637
> 6800084
> > >
> 36565040%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi
> V2luMzI
> > >
> iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DGU%2BgJtTHlT5eiu
> xEc
> > > 52adXNorPWVwbbDycelOMut9Hs%3D&amp;reserved=3D0
> > >
> xp.com%2Flgfiles%2FNMG%2FMAD%2FYOCTO%2Ffirmware-imx-7.9.bin&amp
> > > ;data=3D04%7C01%7Cming.qian%40nxp.com%7Ce50ac93addb444f7cd9b08
> d97
> > >
> dd33c6e%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63767916
> > >
> 8483236134%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj
> > >
> oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DcM3%2F
> > > Go0MxD0RSDmS5ELr6yCdNe4EH%2FeTAFtcAcBArRo%3D&amp;reserved=3D0
> > >
> > > Firmware for this driver will also be a subject to tackle. In an
> > > ideal world, the "self extracted" script requirement to accept your
> > > EULA would need to be waved, and distribution of the firmware should
> > > go into linux-firmwares. I believe firmwares are still allowed to
> > > have some user agreement, but I suppose there must be guidelines,
> > > best is to ask there directly.
> > >
> > > regards,
> > > Nicolas
> > >
> >
> > Seems you use the wrong firmware, I will send the firmware to you.
> > My commit base is 9c3a0f285248899dfa81585bc5d5bc9ebdb8fead,
> > You can find it in the bottom of this cover.
> >
> > Would you please explain the linux-firmware issue in detail
>=20
> I believe that to merge a driver (non staging) that depends on a firmware=
 (I'll
> let Hans and others confirm), you need to submit this firmware, along wit=
h a
> non-interactive licence to be included in the linux-firmware project.
>=20
> NXP notably have an SDMA firmware in there, with a licence file. Perhaps
> these developers can assist in this regard. Often that takes time due to =
legal
> requirement of moving from an interactive EULA to a licence file.
>=20
> In later version, it would be nice to explain in the cover later the stat=
us of
> firmware distribution, and how to obtain the correct version of (speciall=
y if not
> yet in linux-firmware).
>=20
> Thanks for sending me the firmwares, I will see if I can do more tests.
>=20

Thank you for the detailed explanation, I'll check the Linux firmware

> >
> > > >
> > > > It features decoding for the following formats:
> > > > - H.264
> > > > - HEVC
> > > > - MPEG4
> > > > - MPEG2
> > > > - VC1
> > > > - VP8
> > > >
> > > > It features encoding for the following formats:
> > > > - H.264
> > > >
> > > > The driver creates a separate device node for the encoder and decod=
er.
> > > >
> > > > Changelog:
> > > >
> > > > v9
> > > > - drop V4L2_BUF_FLAG_CODECCONFIG
> > > > - drop V4L2_EVENT_CODEC_ERROR
> > > > - drop V4L2_EVENT_SKIP
> > > > - use the v4l2_buffer.sequence counter
> > > > - fix some build warnings with W=3D1 reported by kernel test robot
> > > >
> > > > v8
> > > > - move driver from driver/media/platform/imx/vpu-8q to
> > > >   driver/media/platform/amphion
> > > > - rename driver name to amphion
> > > > - remove imx_vpu.h
> > > > - move the definition of V4L2_EVENT_CODEC_ERROR to videodev2.h
> > > > - move the definition of V4L2_EVENT_SKIP to videodev2.h
> > > >
> > > > v7
> > > > - fix build warnings with W=3D1 reported by kernel test robot
> > > >
> > > > v6:
> > > > - rename V4L2_PIX_FMT_NT8 to V4L2_PIX_FMT_NV12_8L128
> > > > - rename V4L2_PIX_FMT_NT10 to V4L2_PIX_FMT_NV12_10BE_8L128
> > > >
> > > > v5:
> > > > - move some definition from imx_vph.h to videodev2.h
> > > > - remove some unnecessary content
> > > > - add some documentation descriptions
> > > > - pass the lateset v4l2-compliance test
> > > >
> > > > v4:
> > > > - redefine the memory-region in devicetree bindings documentation
> > > > - use v4l2's mechanism to implement synchronize queuing ioctl
> > > > - remove the unnecessary mutex ioctl_sync
> > > > - don't notify source change event if the parameters are same as
> > > > previously established
> > > > - add flag V4L2_FMT_FLAG_DYN_RESOLUTION to decoder's capture
> > > > format
> > > >
> > > > v3:
> > > > - don't make vpu device node a simple-bus
> > > > - trigger probing vpu core in the driver
> > > > - remove unnecessary vpu core index property
> > > >
> > > > v2:
> > > > - fix dt bindings build error
> > > > - split driver patch into several parts to avoid exceeding bytes
> > > > limit
> > > >
> > > > Compliance
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > # v4l2-compliance -d /dev/video0
> > > > v4l2-compliance 1.21.0-4838, 64 bits, 64-bit time_t
> > > > v4l2-compliance
> > > > SHA: 22466798f9a9 2021-08-25 11:05:21
> > > >
> > > > Compliance test for amphion-vpu device /dev/video0:
> > > >
> > > > Driver Info:
> > > >       Driver name      : amphion-vpu
> > > >       Card type        : amphion vpu decoder
> > > >       Bus info         : platform: amphion-vpu
> > > >       Driver version   : 5.14.0
> > > >       Capabilities     : 0x84204000
> > > >               Video Memory-to-Memory Multiplanar
> > > >               Streaming
> > > >               Extended Pix Format
> > > >               Device Capabilities
> > > >       Device Caps      : 0x04204000
> > > >               Video Memory-to-Memory Multiplanar
> > > >               Streaming
> > > >               Extended Pix Format
> > > >       Detected Stateful Decoder
> > > >
> > > > Required ioctls:
> > > >       test VIDIOC_QUERYCAP: OK
> > > >       test invalid ioctls: OK
> > > >
> > > > Allow for multiple opens:
> > > >       test second /dev/video0 open: OK
> > > >       test VIDIOC_QUERYCAP: OK
> > > >       test VIDIOC_G/S_PRIORITY: OK
> > > >       test for unlimited opens: OK
> > > >
> > > > Debug ioctls:
> > > >       test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > > >       test VIDIOC_LOG_STATUS: OK (Not Supported)
> > > >
> > > > Input ioctls:
> > > >       test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not
> Supported)
> > > >       test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > >       test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > > >       test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > > >       test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> > > >       test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > > >       Inputs: 0 Audio Inputs: 0 Tuners: 0
> > > >
> > > > Output ioctls:
> > > >       test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > > >       test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > >       test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > > >       test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > > >       test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > > >       Outputs: 0 Audio Outputs: 0 Modulators: 0
> > > >
> > > > Input/Output configuration ioctls:
> > > >       test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > > >       test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not
> Supported)
> > > >       test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > > >       test VIDIOC_G/S_EDID: OK (Not Supported)
> > > >
> > > > Control ioctls:
> > > >       test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> > > >       test VIDIOC_QUERYCTRL: OK
> > > >       test VIDIOC_G/S_CTRL: OK
> > > >       test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> > > >       test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> > > >       test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > > >       Standard Controls: 3 Private Controls: 0
> > > >
> > > > Format ioctls:
> > > >       test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > > >       test VIDIOC_G/S_PARM: OK (Not Supported)
> > > >       test VIDIOC_G_FBUF: OK (Not Supported)
> > > >       test VIDIOC_G_FMT: OK
> > > >       test VIDIOC_TRY_FMT: OK
> > > >       test VIDIOC_S_FMT: OK
> > > >       test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > > >       test Cropping: OK (Not Supported)
> > > >       test Composing: OK
> > > >       test Scaling: OK (Not Supported)
> > > >
> > > > Codec ioctls:
> > > >       test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > > >       test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > > >       test VIDIOC_(TRY_)DECODER_CMD: OK
> > > >
> > > > Buffer ioctls:
> > > >       test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > > >       test VIDIOC_EXPBUF: OK
> > > >       test Requests: OK (Not Supported)
> > > >
> > > > Total for amphion-vpu device /dev/video0: 45, Succeeded: 45, Failed=
:
> > > > 0, Warnings: 0
> > > >
> > > > # v4l2-compliance -d /dev/video1
> > > > v4l2-compliance 1.21.0-4838, 64 bits, 64-bit time_t
> > > > v4l2-compliance
> > > > SHA: 22466798f9a9 2021-08-25 11:05:21
> > > >
> > > > Compliance test for amphion-vpu device /dev/video1:
> > > >
> > > > Driver Info:
> > > >       Driver name      : amphion-vpu
> > > >       Card type        : amphion vpu encoder
> > > >       Bus info         : platform: amphion-vpu
> > > >       Driver version   : 5.14.0
> > > >       Capabilities     : 0x84204000
> > > >               Video Memory-to-Memory Multiplanar
> > > >               Streaming
> > > >               Extended Pix Format
> > > >               Device Capabilities
> > > >       Device Caps      : 0x04204000
> > > >               Video Memory-to-Memory Multiplanar
> > > >               Streaming
> > > >               Extended Pix Format
> > > >       Detected Stateful Encoder
> > > >
> > > > Required ioctls:
> > > >       test VIDIOC_QUERYCAP: OK
> > > >       test invalid ioctls: OK
> > > >
> > > > Allow for multiple opens:
> > > >       test second /dev/video1 open: OK
> > > >       test VIDIOC_QUERYCAP: OK
> > > >       test VIDIOC_G/S_PRIORITY: OK
> > > >       test for unlimited opens: OK
> > > >
> > > > Debug ioctls:
> > > >       test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > > >       test VIDIOC_LOG_STATUS: OK (Not Supported)
> > > >
> > > > Input ioctls:
> > > >       test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not
> Supported)
> > > >       test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > >       test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > > >       test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > > >       test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> > > >       test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > > >       Inputs: 0 Audio Inputs: 0 Tuners: 0
> > > >
> > > > Output ioctls:
> > > >       test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > > >       test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > >       test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > > >       test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > > >       test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > > >       Outputs: 0 Audio Outputs: 0 Modulators: 0
> > > >
> > > > Input/Output configuration ioctls:
> > > >       test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > > >       test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not
> Supported)
> > > >       test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > > >       test VIDIOC_G/S_EDID: OK (Not Supported)
> > > >
> > > > Control ioctls:
> > > >       test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> > > >       test VIDIOC_QUERYCTRL: OK
> > > >       test VIDIOC_G/S_CTRL: OK
> > > >       test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> > > >       test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> > > >       test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > > >       Standard Controls: 20 Private Controls: 0
> > > >
> > > > Format ioctls:
> > > >       test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > > >       test VIDIOC_G/S_PARM: OK
> > > >       test VIDIOC_G_FBUF: OK (Not Supported)
> > > >       test VIDIOC_G_FMT: OK
> > > >       test VIDIOC_TRY_FMT: OK
> > > >       test VIDIOC_S_FMT: OK
> > > >       test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > > >       test Cropping: OK
> > > >       test Composing: OK (Not Supported)
> > > >       test Scaling: OK (Not Supported)
> > > >
> > > > Codec ioctls:
> > > >       test VIDIOC_(TRY_)ENCODER_CMD: OK
> > > >       test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > > >       test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > > >
> > > > Buffer ioctls:
> > > >       test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > > >       test VIDIOC_EXPBUF: OK
> > > >       test Requests: OK (Not Supported)
> > > >
> > > > Total for amphion-vpu device /dev/video1: 45, Succeeded: 45, Failed=
:
> > > > 0, Warnings: 0
> > > >
> > > > Ming Qian (13):
> > > >   dt-bindings: media: amphion: add amphion video codec bindings
> > > >   media:Add nt8 and nt10 video format.
> > > >   media: amphion: add amphion vpu device driver
> > > >   media: amphion: add vpu core driver
> > > >   media: amphion: implement vpu core communication based on
> mailbox
> > > >   media: amphion: add vpu v4l2 m2m support
> > > >   media: amphion: add v4l2 m2m vpu encoder stateful driver
> > > >   media: amphion: add v4l2 m2m vpu decoder stateful driver
> > > >   media: amphion: implement windsor encoder rpc interface
> > > >   media: amphion: implement malone decoder rpc interface
> > > >   ARM64: dts: freescale: imx8q: add imx vpu codec entries
> > > >   firmware: imx: scu-pd: imx8q: add vpu mu resources
> > > >   MAINTAINERS: add AMPHION VPU CODEC V4L2 driver entry
> > > >
> > > >  .../bindings/media/amphion,vpu.yaml           |  178 ++
> > > >  .../media/v4l/pixfmt-yuv-planar.rst           |   15 +
> > > >  MAINTAINERS                                   |    9 +
> > > >  .../arm64/boot/dts/freescale/imx8-ss-vpu.dtsi |   72 +
> > > >  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |   17 +
> > > >  arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   24 +
> > > >  drivers/firmware/imx/scu-pd.c                 |    4 +
> > > >  drivers/media/platform/Kconfig                |   19 +
> > > >  drivers/media/platform/Makefile               |    2 +
> > > >  drivers/media/platform/amphion/Makefile       |   23 +
> > > >  drivers/media/platform/amphion/vdec.c         | 1652
> > > ++++++++++++++++
> > > >  drivers/media/platform/amphion/venc.c         | 1382
> > > ++++++++++++++
> > > >  drivers/media/platform/amphion/vpu.h          |  333 ++++
> > > >  drivers/media/platform/amphion/vpu_cmds.c     |  435 +++++
> > > >  drivers/media/platform/amphion/vpu_cmds.h     |   25 +
> > > >  drivers/media/platform/amphion/vpu_codec.h    |   68 +
> > > >  drivers/media/platform/amphion/vpu_color.c    |  192 ++
> > > >  drivers/media/platform/amphion/vpu_core.c     |  901 +++++++++
> > > >  drivers/media/platform/amphion/vpu_core.h     |   16 +
> > > >  drivers/media/platform/amphion/vpu_dbg.c      |  496 +++++
> > > >  drivers/media/platform/amphion/vpu_defs.h     |  186 ++
> > > >  .../media/platform/amphion/vpu_dev_imx8q.c    |   72 +
> > > >  drivers/media/platform/amphion/vpu_drv.c      |  215 +++
> > > >  drivers/media/platform/amphion/vpu_helpers.c  |  453 +++++
> > > >  drivers/media/platform/amphion/vpu_helpers.h  |   72 +
> > > >  drivers/media/platform/amphion/vpu_imx8q.c    |  218 +++
> > > >  drivers/media/platform/amphion/vpu_imx8q.h    |  116 ++
> > > >  drivers/media/platform/amphion/vpu_log.h      |   44 +
> > > >  drivers/media/platform/amphion/vpu_malone.c   | 1683
> > > +++++++++++++++++
> > > >  drivers/media/platform/amphion/vpu_malone.h   |   42 +
> > > >  drivers/media/platform/amphion/vpu_mbox.c     |  126 ++
> > > >  drivers/media/platform/amphion/vpu_mbox.h     |   16 +
> > > >  drivers/media/platform/amphion/vpu_msgs.c     |  413 ++++
> > > >  drivers/media/platform/amphion/vpu_msgs.h     |   14 +
> > > >  drivers/media/platform/amphion/vpu_rpc.c      |  263 +++
> > > >  drivers/media/platform/amphion/vpu_rpc.h      |  463 +++++
> > > >  drivers/media/platform/amphion/vpu_v4l2.c     |  625 ++++++
> > > >  drivers/media/platform/amphion/vpu_v4l2.h     |   53 +
> > > >  drivers/media/platform/amphion/vpu_windsor.c  | 1244
> ++++++++++++
> > > >  drivers/media/platform/amphion/vpu_windsor.h  |   39 +
> > > >  drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
> > > >  include/uapi/linux/videodev2.h                |    4 +
> > > >  42 files changed, 12226 insertions(+)  create mode 100644
> > > > Documentation/devicetree/bindings/media/amphion,vpu.yaml
> > > >  create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi
> > > >  create mode 100644 drivers/media/platform/amphion/Makefile
> > > >  create mode 100644 drivers/media/platform/amphion/vdec.c
> > > >  create mode 100644 drivers/media/platform/amphion/venc.c
> > > >  create mode 100644 drivers/media/platform/amphion/vpu.h
> > > >  create mode 100644 drivers/media/platform/amphion/vpu_cmds.c
> > > >  create mode 100644 drivers/media/platform/amphion/vpu_cmds.h
> > > >  create mode 100644 drivers/media/platform/amphion/vpu_codec.h
> > > >  create mode 100644 drivers/media/platform/amphion/vpu_color.c
> > > >  create mode 100644 drivers/media/platform/amphion/vpu_core.c
> > > >  create mode 100644 drivers/media/platform/amphion/vpu_core.h
> > > >  create mode 100644 drivers/media/platform/amphion/vpu_dbg.c
> > > >  create mode 100644 drivers/media/platform/amphion/vpu_defs.h
> > > >  create mode 100644
> drivers/media/platform/amphion/vpu_dev_imx8q.c
> > > >  create mode 100644 drivers/media/platform/amphion/vpu_drv.c
> > > >  create mode 100644 drivers/media/platform/amphion/vpu_helpers.c
> > > >  create mode 100644 drivers/media/platform/amphion/vpu_helpers.h
> > > >  create mode 100644 drivers/media/platform/amphion/vpu_imx8q.c
> > > >  create mode 100644 drivers/media/platform/amphion/vpu_imx8q.h
> > > >  create mode 100644 drivers/media/platform/amphion/vpu_log.h
> > > >  create mode 100644 drivers/media/platform/amphion/vpu_malone.c
> > > >  create mode 100644 drivers/media/platform/amphion/vpu_malone.h
> > > >  create mode 100644 drivers/media/platform/amphion/vpu_mbox.c
> > > >  create mode 100644 drivers/media/platform/amphion/vpu_mbox.h
> > > >  create mode 100644 drivers/media/platform/amphion/vpu_msgs.c
> > > >  create mode 100644 drivers/media/platform/amphion/vpu_msgs.h
> > > >  create mode 100644 drivers/media/platform/amphion/vpu_rpc.c
> > > >  create mode 100644 drivers/media/platform/amphion/vpu_rpc.h
> > > >  create mode 100644 drivers/media/platform/amphion/vpu_v4l2.c
> > > >  create mode 100644 drivers/media/platform/amphion/vpu_v4l2.h
> > > >  create mode 100644 drivers/media/platform/amphion/vpu_windsor.c
> > > >  create mode 100644 drivers/media/platform/amphion/vpu_windsor.h
> > > >
> > > >
> > > > base-commit: 9c3a0f285248899dfa81585bc5d5bc9ebdb8fead
> > >
> >
>=20

