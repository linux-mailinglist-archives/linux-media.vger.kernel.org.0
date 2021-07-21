Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF6573D0B1F
	for <lists+linux-media@lfdr.de>; Wed, 21 Jul 2021 11:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236775AbhGUISs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Jul 2021 04:18:48 -0400
Received: from mail-eopbgr80082.outbound.protection.outlook.com ([40.107.8.82]:35100
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237262AbhGUINN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Jul 2021 04:13:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UtidmIw8C628AQHZTiUINcSp/VSznKeY9D9RHEiIm35jTRwATCNipGmIpCdmLy3y0o5bfIRBpgoHdettotyUi3Osei4QiOjWh3NvhJRIj/Ezs2+eYUdKpYHEEHmN/NUOKUkly/W/NK5qnktkUvgPey0N0/YzIGk1mshDKTlslONOshidZnfvYKs4WqXH22PMNvKE530ENVipR8n3H3+IRkPMpAxlUROiSYKM+rpGE88gdP9H1bgnR4514zP4NVS/5RftpIEV10sKVwL4QkKF8KHbuDaFrJr9cQCqdBCPPdsh3/J78Hs1mtUkcciY8BrqBPMASgOBN+uRajjUq8UsMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lp1vSxINIwqzLaqxy766CzOF01A+kg0mDqg39V/x4Mc=;
 b=Q0bdv/hvoVVbANK6XQAl19tF3d8x4u0y6oOe+BGLSAw6OuVKzEWhoTBcypmJ/GhfHk8UNSBE5vga9YxyS2vAaCIQ/XbQny+IKKtwZFxkmLvf29A+xvTsvgfFo91rz/0kKoym00bX0wffS3Z2ojVv9mAXykizMgz69jqyxCbqbddqD0x0lJ68VveXOSOkP6VDnGSQ/U+uI505F2V2YTLogeYl//yVR65HGMI/MrXRsnVZnWDs97vGAMmtcZIiNm2U9rOrEk9rHlp5e1ebd7eE9w08/GA28bDh6QDQmVtRHlixEtaPV9GW9ij50aYtxiuHSBL3ZeQvU4xrIPd9Zo9W1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lp1vSxINIwqzLaqxy766CzOF01A+kg0mDqg39V/x4Mc=;
 b=hQ/o/c26NSJ+2P7LUMM/V6RsNLXkBVDA6uRKC8wtNKDW4jH3AVYQrzrv8rD6/W2EgdgbUYjgJnk+Tr7AA6MttHeFarfQvsWTsOPrRrvubJTauckQBWq+0gYeiLuPsfEydz4/LrNq24fIEVJ1Tn7/rJo+4Fe/l5rWibCahZ+HQy4=
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB4136.eurprd04.prod.outlook.com (2603:10a6:209:4e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.28; Wed, 21 Jul
 2021 08:53:45 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::81e3:1e06:83ee:5db8]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::81e3:1e06:83ee:5db8%3]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 08:53:45 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
CC:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCH v4 00/13] imx8q video decoder/encoder driver
Thread-Topic: [EXT] Re: [PATCH v4 00/13] imx8q video decoder/encoder driver
Thread-Index: AQHXfQi0lSk/DPK7aEO+sSUr8Vl896tNC2EAgAAUIEA=
Date:   Wed, 21 Jul 2021 08:53:45 +0000
Message-ID: <AM6PR04MB634150E6B5663100069824D5E7E39@AM6PR04MB6341.eurprd04.prod.outlook.com>
References: <cover.1626743758.git.ming.qian@nxp.com>
 <66908d2b-d553-d982-3609-e0c6d0f7960c@xs4all.nl>
In-Reply-To: <66908d2b-d553-d982-3609-e0c6d0f7960c@xs4all.nl>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xs4all.nl; dkim=none (message not signed)
 header.d=none;xs4all.nl; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: acf20d80-986f-4f0d-1ce7-08d94c250ca9
x-ms-traffictypediagnostic: AM6PR04MB4136:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB413651E6FA3D0C27EF78AD02E7E39@AM6PR04MB4136.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9ocuqzztBPS2RfK1yCLK7N4xf8b/c9BH5wZMwBaBLkrl2Xe/VmUw/ezKUfGRGY9wJ8CC1LMv/RkUCAKWGcrOnjIKfslZHTAypnoP3T3GbidQfc6HeNN6WbO2r6FeW0JTV5wKM7ISqlvNo1DutKlwcErXQT0zxEXS2WNY+A3bbPTwYuRWjhLs4e9m5Pb/MnJdrDdV6BGfWs8pDSjU4NkFWWfNTf+nZT4T7L8ZYYxxml33eY71RzQFFJ42JZTpI34XRsso9oI+J9o5ubI4CEzd5/HVPzpH5OmKp6fujw/su8gki1nfBYDdwpj2EnQSfcD4T65hhnPoUTNo7vjgtGRgFCFlyE/HpqfmeVZPWl3cvO/tGsd0WuxMCaKhAKATYNwjVOP4NW1g2V1HjiT1IqP7tGMe03I8piYT4Z04MvKg3CqyOd6+WTnWjVZsthnWuMN8L3GeM2F9igYYcOUQohT6t/xOgdMO8OICzQgDklyZ2ZqhtR1XeOEJH5jTg9t85HqyNQShh/8CD7Afw8982AJcwIGBdhX/nTY4qMMomyLF2F8DueSnEoX1nIDFmDYk0B9F+Mig+hhHViIXxo6zDt5DD02nrVY30PjO3wxdy1V4A3DWy5MDrJw5No1Mn9kpJRok00Bm82JrUHOklmOhLjJ/pG++SFsgUUQgwMDPT5aS/fJr7+cenFgDyFlglp48JAMupB0b278Migo0MIMlSUH603/yNA7ruj7Zv51foV7bYpAxmmzV4amJ++Smgi0yKImce7k0+cuFFefsdfEhmDOjZ42Dr0HcImbOPUoAaI33uWj6FmdheaB8dJhsaXiqYUUB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(45080400002)(26005)(316002)(7416002)(54906003)(8936002)(478600001)(110136005)(86362001)(33656002)(8676002)(9686003)(71200400001)(83380400001)(44832011)(2906002)(5660300002)(52536014)(186003)(66446008)(64756008)(66476007)(66556008)(55016002)(7696005)(4326008)(76116006)(38100700002)(6506007)(30864003)(122000001)(53546011)(66946007)(32563001)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hafPSA+yyQ2sxZ/NfWIXXF+36OfNLHelF1n9ceEoxLS1LrBhZ6oimaLT581b?=
 =?us-ascii?Q?7RtEx1fV2KIqUzv8I6JoS35+VYHc+J1IY5lsyWUcGesiHFt24VpItToCqoU4?=
 =?us-ascii?Q?IyiQBkw7c9htiNrGdTzcaZbxea+RX7yYCwBqSWW9F/KW+3kZrbAqWfPkpZCC?=
 =?us-ascii?Q?Ojx7DpbkqEdaETSwjvX3eDYU9r0GMOIhxs3BDnfMNnD3SJdwulqolEwFgQyY?=
 =?us-ascii?Q?iNVh3PRBjiJULPjZaUCN8FcIQKoihlBMez4GefiNi4geNaM349pQmyVl3dqr?=
 =?us-ascii?Q?dKYaCPfeDYGs/B39vWsjODVozm2eTA+laOGk2LBzexIp9rWfXLx8Gs94+RAo?=
 =?us-ascii?Q?btUpRfotnyRtbImSp3FOimisBzbIEP1itx4bxwI9Go15+7r8W7ugxXRddA2i?=
 =?us-ascii?Q?FjYjelQryL01hTIA6RzhQQQ44qyqLg9QaemmFVkLxxoZUQ19aEMeNxB+eVFn?=
 =?us-ascii?Q?mm+bIM3aZ3ztFXCGoYLqFVzz3BWQbrZPmxWZdAg9r85IO557mVshoje5A5wX?=
 =?us-ascii?Q?PoJVXC3RZpizQ6/4jBfWgv6QlsYzNz5vllgnsKIt8i7SEFY3vh7A07o8Cp32?=
 =?us-ascii?Q?z/RZkoSsPt0A+oPLoAHDjkqmcekLavJz2Mx5q00Zcb+K7l2W2hfKO27qilFX?=
 =?us-ascii?Q?lx3GLE9rb9acB9L1/D53oMiTlXFeujNATwDM/itqRqyrBgvTlEByk0ZngpS6?=
 =?us-ascii?Q?SMuTBVY6ZVjnr1SZjNILJ8jTNWXK/Uhqj0GuEK2D6R9vXJkO49JNVvouhwLI?=
 =?us-ascii?Q?j+2cEi0yKgKofWkCqg7eWpfEei3OhtnjX4LHxF1A4pWH+GcogIhVyPzOLpWr?=
 =?us-ascii?Q?GtN91/glcmyBCj6HO5N2auHVPfm8jOtv4Aiuuh9OzNOBhNVLllLv55ibcdLF?=
 =?us-ascii?Q?HczbIx7w2VviyCUHXf7Hrb9tGRNTGN27xyiDNanLqe3t4zdFbpH2zLSrpiZW?=
 =?us-ascii?Q?/FU8svR5eZMesb2VJ+SjaqQCWWn0ihGrsb8quIhWzDaVpsASFyZFmAC3E+G/?=
 =?us-ascii?Q?nrR0guQNrcAMQG6EhSyNo3rF/TWVxO2ovbp7/mUcVrEdwTsFJJ9tPRpuz8zX?=
 =?us-ascii?Q?Kpi0TJqLzckLFg7WasfivwTupBO0gGJqDGaStfGriQrw3ziuTPmXgyyCg/fc?=
 =?us-ascii?Q?9lVnn6sBEES0dK0w/aaarrCG+vAIBvKNz/YRI6uii/kprY+iQYRIZyUjXX+V?=
 =?us-ascii?Q?9K0qLSbPTyDTSJRMFajp+WouCvq/hSD/noXWZLIoUACCJUzv0RigTcLzNv7e?=
 =?us-ascii?Q?cymXGobM2LISHtKtbeNo02AlcmFpP8zttCowEmse6/hEPLsqjFAYkRZFV7pS?=
 =?us-ascii?Q?QABOOHL0FssTxac5JPp+dmRe?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acf20d80-986f-4f0d-1ce7-08d94c250ca9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2021 08:53:45.8956
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OD7/TIDnykHMiutf6Hoa4jt/UAI878z1blHqhxl96xm9CfK8eSl2jOW6SMm4H8KwDdlwcg/k03sqxhjU4r27Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4136
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> Hi Ming Qian,
>=20
> Thank you for working on this.
>=20
> Some high-level comments:
>=20
> First of all, it looks like this series is based on a nxp-kernel. I notic=
ed references
> to e.g. V4L2_COLORSPACE_GENERIC_FILM which doesn't exist in the mainline
> kernel. The patch series really should be based on the mainline kernel, o=
r
> (preferred) the linux-media kernel
> (https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.=
linu
> xtv.org%2Fmedia_tree.git%2F&amp;data=3D04%7C01%7Cming.qian%40nxp.com
> %7C3b39b6df4e6746d5e5c308d94c19dd55%7C686ea1d3bc2b4c6fa92cd99c
> 5c301635%7C0%7C1%7C637624496237171229%7CUnknown%7CTWFpbGZs
> b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0
> %3D%7C2000&amp;sdata=3DFlBIfE5%2BT3vsO7urAeeic%2FslWCQIR0VhuUuhx8Z
> Xizk%3D&amp;reserved=3D0,
> master branch).

Hi Hans,
   The patches are indeed based on linux-media kernel, and the V4L2_COLORSP=
ACE_GENERIC_FILM is added in the patch "media: v4l: add some definition of =
v4l2 colorspace/xfer_func/ycbcr_encoding", which is the second patch of the=
se series.

>=20
> On 20/07/2021 03:43, Ming Qian wrote:
> > Hi all,
> >
> > This patch series adds support for
> > the imx8q video encoder and decoder
> > via the VPU block present in imx8q platforms.
> > Currently, support for IMX8QXP and IMX8QM is included.
> >
> > It features decoding for the following formats:
> > - H.264
> > - HEVC
> > - MPEG4
> > - MPEG2
> > - MJPEG
> > - VC1
> > - VP8
> > - AVS
> >
> > It features encoding for the following formats:
> > - H.264
> >
> > The driver creates a separate device node for the encoder and decoder.
> >
> > Changelog:
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
> > v4l2-compliance SHA: not available
> > , 64 bits, 64-bit time_t
>=20
> Always compile v4l2-compliance from the git repo
> (https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.=
linu
> xtv.org%2Fv4l-utils.git%2F&amp;data=3D04%7C01%7Cming.qian%40nxp.com%7
> C3b39b6df4e6746d5e5c308d94c19dd55%7C686ea1d3bc2b4c6fa92cd99c5c3
> 01635%7C0%7C1%7C637624496237171229%7CUnknown%7CTWFpbGZsb3d
> 8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3
> D%7C2000&amp;sdata=3D%2FWh5ObGzfWN%2B2z4J9qhuM7bpA%2Fd6iaZbJw
> QhMI%2FdzFI%3D&amp;reserved=3D0).
> Otherwise I cannot tell whether it is a recent version or if it is old. S=
ince there is
> no SHA I'm going with old.
>=20

OK, I'll use the latest v4l2-compliance to test it again.

> >
> > Compliance test for vpu B0 device /dev/video0:
> >
> > Driver Info:
> >       Driver name      : vpu B0
> >       Card type        : imx vpu decoder
> >       Bus info         : platform: imx8q-vpu
> >       Driver version   : 5.10.35
> >       Capabilities     : 0x84204000
> >               Video Memory-to-Memory Multiplanar
> >               Streaming
> >               Extended Pix Format
> >               Device Capabilities
> >       Device Caps      : 0x04204000
> >               Video Memory-to-Memory Multiplanar
> >               Streaming
> >               Extended Pix Format
>=20
> Hmm, v4l2-compliance should have detected a stateful decoder here.

OK, I'll use the latest v4l2-compliance to test it again.

>=20
> >
> > Required ioctls:
> >       test VIDIOC_QUERYCAP: OK
> >
> > Allow for multiple opens:
> >       test second /dev/video0 open: OK
> >       test VIDIOC_QUERYCAP: OK
> >       test VIDIOC_G/S_PRIORITY: OK
> >       test for unlimited opens: OK
> >
> >       test invalid ioctls: OK
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
> >       Standard Controls: 3 Private Controls: 2
> >
> > Format ioctls:
> >       test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> >       test VIDIOC_G/S_PARM: OK (Not Supported)
> >       test VIDIOC_G_FBUF: OK (Not Supported)
> >       test VIDIOC_G_FMT: OK
> >       test VIDIOC_TRY_FMT: OK
> >       test VIDIOC_S_FMT: OK
> >       test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> >       test Cropping: OK
> >       test Composing: OK
> >       test Scaling: OK
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
> > Total for vpu b0 device /dev/video0: 45, Succeeded: 45, Failed: 0,
> > Warnings: 0
> >
> > # v4l2-compliance -d /dev/video1
> > v4l2-compliance SHA: not available
> > , 64 bits, 64-bit time_t
> >
> > Compliance test for imx vpu encoder device /dev/video1:
> >
> > Driver Info:
> >       Driver name      : imx vpu encoder
> >       Card type        : imx vpu encoder
> >       Bus info         : platform: imx8q-vpu
> >       Driver version   : 5.10.35
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
>=20
> Here it properly detects a stateful encoder.
>=20
> Regards,
>=20
>         Hans
>=20

OK, I'll use the latest v4l2-compliance to test it again.

> >
> > Required ioctls:
> >       test VIDIOC_QUERYCAP: OK
> >
> > Allow for multiple opens:
> >       test second /dev/video1 open: OK
> >       test VIDIOC_QUERYCAP: OK
> >       test VIDIOC_G/S_PRIORITY: OK
> >       test for unlimited opens: OK
> >
> >       test invalid ioctls: OK
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
> > Total for imx vpu encoder device /dev/video1: 45, Succeeded: 45,
> > Failed: 0, Warnings: 0
> >
> > Ming Qian (13):
> >   dt-bindings: media: imx8q: add imx video codec bindings
> >   media: v4l: add some definition of v4l2
> >     colorspace/xfer_func/ycbcr_encoding
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
> >  MAINTAINERS                                   |   10 +
> >  .../arm64/boot/dts/freescale/imx8-ss-vpu.dtsi |   72 +
> >  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |   17 +
> >  arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   26 +
> >  drivers/firmware/imx/scu-pd.c                 |    4 +
> >  drivers/media/platform/Kconfig                |    2 +
> >  drivers/media/platform/Makefile               |    2 +
> >  drivers/media/platform/imx/Kconfig            |   19 +
> >  drivers/media/platform/imx/Makefile           |    1 +
> >  drivers/media/platform/imx/vpu-8q/Makefile    |   23 +
> >  drivers/media/platform/imx/vpu-8q/vdec.c      | 1817
> +++++++++++++++++
> >  drivers/media/platform/imx/vpu-8q/venc.c      | 1395 +++++++++++++
> >  drivers/media/platform/imx/vpu-8q/vpu.h       |  343 ++++
> >  drivers/media/platform/imx/vpu-8q/vpu_cmds.c  |  446 ++++
> >  drivers/media/platform/imx/vpu-8q/vpu_cmds.h  |   34 +
> >  drivers/media/platform/imx/vpu-8q/vpu_codec.h |   77 +
> >  drivers/media/platform/imx/vpu-8q/vpu_color.c |  201 ++
> > drivers/media/platform/imx/vpu-8q/vpu_core.c  |  919 +++++++++
> >  drivers/media/platform/imx/vpu-8q/vpu_core.h  |   25 +
> >  drivers/media/platform/imx/vpu-8q/vpu_dbg.c   |  505 +++++
> >  drivers/media/platform/imx/vpu-8q/vpu_defs.h  |  194 ++
> >  .../media/platform/imx/vpu-8q/vpu_dev_imx8q.c |   82 +
> >  drivers/media/platform/imx/vpu-8q/vpu_drv.c   |  225 ++
> >  .../media/platform/imx/vpu-8q/vpu_helpers.c   |  405 ++++
> >  .../media/platform/imx/vpu-8q/vpu_helpers.h   |   80 +
> >  drivers/media/platform/imx/vpu-8q/vpu_imx8q.c |  227 ++
> > drivers/media/platform/imx/vpu-8q/vpu_imx8q.h |  125 ++
> >  drivers/media/platform/imx/vpu-8q/vpu_log.h   |   53 +
> >  .../media/platform/imx/vpu-8q/vpu_malone.c    | 1744
> ++++++++++++++++
> >  .../media/platform/imx/vpu-8q/vpu_malone.h    |   51 +
> >  drivers/media/platform/imx/vpu-8q/vpu_mbox.c  |  135 ++
> >  drivers/media/platform/imx/vpu-8q/vpu_mbox.h  |   25 +
> >  drivers/media/platform/imx/vpu-8q/vpu_msgs.c  |  420 ++++
> >  drivers/media/platform/imx/vpu-8q/vpu_msgs.h  |   23 +
> >  drivers/media/platform/imx/vpu-8q/vpu_rpc.c   |  266 +++
> >  drivers/media/platform/imx/vpu-8q/vpu_rpc.h   |  472 +++++
> >  drivers/media/platform/imx/vpu-8q/vpu_v4l2.c  |  662 ++++++
> >  drivers/media/platform/imx/vpu-8q/vpu_v4l2.h  |   53 +
> >  .../media/platform/imx/vpu-8q/vpu_windsor.c   | 1253 ++++++++++++
> >  .../media/platform/imx/vpu-8q/vpu_windsor.h   |   48 +
> >  include/linux/imx_vpu.h                       |   19 +
> >  include/uapi/linux/imx_vpu.h                  |  120 ++
> >  include/uapi/linux/videodev2.h                |   30 +
> >  44 files changed, 12828 insertions(+)  create mode 100644
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

