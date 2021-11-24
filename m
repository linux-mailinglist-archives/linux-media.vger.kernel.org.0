Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA0145B70B
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 10:00:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232034AbhKXJD0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 04:03:26 -0500
Received: from mail-eopbgr80057.outbound.protection.outlook.com ([40.107.8.57]:60792
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229566AbhKXJDZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 04:03:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RdeKN8Wz09dtkeWg+6tY6Ni939FeXKxxZwgK1/73pXAGBqTmBH0PieJDoXKWTiK8A9zsIiFTnlFqXrNq3BSbRTojhI30C9j3SkmsEXXaQWx6b7mxyxGoSYNiduI3XhyCGMTaySSoiMsYghL9AmE7wQEQsIDMsP6cWmBzNkgyxcxFYHj5KGvEI3KKjK5cGt/wgFW2W7dfjCKHsXSo/CNsc5J/aACxYbGxKZ6NyhyLIaqE/SFDdVmX2eXAK0H4MkjpTwufy0fUrDyvF3wmPnxxBvvmIr9n28ULMIvToKbLskISzWH/vSkoH5DNF8IubXR4m4LlaCSYOGCLINNyY1l6FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQ8kbscrDLuRIkK3HUx6kUsOnaridIIc7oVGWeXMy7E=;
 b=NMhHgoKxv3Y/wJHXlUSjk3bo3L9KaRgpmVXxGd9NzRBpD3U3K9VakYyt5GPJdxg+gRZ0Au7G5Uwa3AG9hSvxAbUxPhIpZIreY+At5c7bgD0QCHfzveJW3A7i5n7UB/Fqw77t1VNxISTIHXBCKS2jY4HQYipQ1W8pe30WEmeA4jeAe11a376CKhO0lqTFV6Tw+cxKZKea+3ropley2zU1TGLwjbZ7LexDRlwvWCFiZPOOtX+73pDId5ufQQRPC7+ATsfqfqHcr48+zgqAkHv4mlyRR0ozyPsgq1Z+whSe1wqOWcoNTWSW1ilxuAczmVO1+620fLdaYpgFb09FNPJy7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQ8kbscrDLuRIkK3HUx6kUsOnaridIIc7oVGWeXMy7E=;
 b=S14CywsGgDnLv4Aqk51slBbWK9xV0E5nfzfbwpVHaWMSSR7iuB4bd9ydlRjBxu9hPOiJ7Hj9BEsL1dhAQp5S1C8vw2xYc3bz+blBFu8f2NpPUFabqFlW4lk+iv7aOXqX2dEPL1NoIZ4yHF80o99fTTCwMWlUHluP2SF3Awc6/v8=
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM5PR04MB3267.eurprd04.prod.outlook.com (2603:10a6:206:d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Wed, 24 Nov
 2021 09:00:12 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886%5]) with mapi id 15.20.4713.025; Wed, 24 Nov 2021
 09:00:12 +0000
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
Subject: RE: [EXT] Re: [PATCH v12 00/13] amphion video decoder/encoder driver
Thread-Topic: [EXT] Re: [PATCH v12 00/13] amphion video decoder/encoder driver
Thread-Index: AQHX1UX9FZgXdhHdu0aj4y6UzYn6WqwRlHeAgADanLA=
Date:   Wed, 24 Nov 2021 09:00:12 +0000
Message-ID: <AM6PR04MB6341BF1FB2A839961DBADF4EE7619@AM6PR04MB6341.eurprd04.prod.outlook.com>
References: <cover.1636445575.git.ming.qian@nxp.com>
 <9947131322e034bb6336802e5afb4b6132ca5071.camel@ndufresne.ca>
In-Reply-To: <9947131322e034bb6336802e5afb4b6132ca5071.camel@ndufresne.ca>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71775651-c560-41ad-7124-08d9af28d350
x-ms-traffictypediagnostic: AM5PR04MB3267:
x-microsoft-antispam-prvs: <AM5PR04MB32673202524C5041C40DA86FE7619@AM5PR04MB3267.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:79;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VrRVkWOAk/sOkFc3p2jdByFWniRId+Mc5t0/0bhAE4Ixdk7Mod4XuIKz1vbX1ZcdlZlCpdDrLsjEA75LTsFW9QSOJ3SL/3j2YYJpStVxJfLhOGqPzgl5R004BH7z5ZTzsrRRzjbnDZRktU25NeHGPoSQfl031Gthm/G+L2w0tGxXpgBpAE4dXSwWhKcwLkeKZ379AOAH6x7CHCigfcmmZ5yDRm1rd4FHI1UU3FwAvrNdEsyE8iGn62fRj1dNyyhsOgcSGW+mmAcWhWFdgUqqdWfeDXQC5QFV3XupPodXVxeK6XTZEX4lfxMlTzTptCO8mt7bhj9pOLGpqLvBUBhltCU4lYH7Esj6ujm7SY49HXhkDR53qbpoDTX3m1KJ4gvTKnwYAQKMgUJm8x0k7m636aiejcnTNjF88PWztzFsUjQagmoSw8WvTfPBua72L9TnavdglmZTjGBW1Xj5tC5kV7ISlSilSA7mvdcelRHnRzGG2FWFz+b9l5F4qh06BsNoFVJS6OaVKK2w9ehVunJ2KqbE7RfKKzJUu276VsjFVKv2FPN8nq/1pMewcS+9kYX0VKP8x1nK9rDP7YvPDPGYD1dyQM5bb+SqabdJ5J1UqyQOL7WQqCJG5i+60KhyiOmRRVACER9FU7Vk8kp0egR0rj8WwMv+9iZhZvx6AzvVHmRXDRlQaew/gn03yMJcK4aM63QCVFOt1sc2MIAWKlaSpHqZRZ1dt2tKHBx8bCxGsOEktnuQBD9/slLg3cIUQMXpIQnQiyV3uKg47qXeD/c6KA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(83380400001)(44832011)(66476007)(7416002)(9686003)(64756008)(66946007)(66446008)(66556008)(38100700002)(7696005)(122000001)(316002)(45080400002)(110136005)(86362001)(54906003)(26005)(52536014)(76116006)(4326008)(38070700005)(71200400001)(6506007)(8936002)(8676002)(33656002)(19627235002)(53546011)(508600001)(966005)(55016003)(5660300002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OUA9qt8oNb1v2nVpBgnVOEQZ2L+9eTlXy0BC31+MyFd9xtD9JTIHB8cqHcD0?=
 =?us-ascii?Q?nsdVNHnBbMH8b0CxFC1glofrrS8CWfabYHFLJEFvapsw8F+yopNSorIPBFJO?=
 =?us-ascii?Q?sVec5VtSDxcY3iLB+Z57PDSBCShQgmM65V6AQN6gAQI9wYqxCO4laECI1w0G?=
 =?us-ascii?Q?zxn9t7PErNDjop04PWbDkr4V3r6o/ysM1i4ppzeoCbZra52vvwbxZWaqguHJ?=
 =?us-ascii?Q?RzzB3sIGecfiF9U2pGrhOGdw5wIFmIAo4dX9yb7BH7kdP78hkMaHOmoYlQz+?=
 =?us-ascii?Q?Qj33JHev3OdG4KsgkODLt6aMZz8eIHc1dQZzN1dxGex29zZ13LFgkBawZfCW?=
 =?us-ascii?Q?64mnYonH7D1d4HW0YMBU+iuIkI8vyORHAjKIMaLtXol3tS8p4cv6Xy/4NzwZ?=
 =?us-ascii?Q?NTrfxHRciweQMXgwxNRnvLlZXAkHo5ovMkoNByXxjHmTMZe6DyvGJc12UApP?=
 =?us-ascii?Q?+PJo8SZ0tqWm2ty7SS6xtNBxUkr2rYQ+WgboLhfVL3AaCdhpRKGRdrySADUl?=
 =?us-ascii?Q?tlywlSeES404gK+QGS8xUXlX7dgQzEPzjSL6AkvSzshxp1s8Lxvj88mRVSF0?=
 =?us-ascii?Q?4eCpEo1mT7Nbl1HlPjVGfmyEY9Y9Qa9dNqSJKiP7xyuwVIjRzgc+nvhPcuOm?=
 =?us-ascii?Q?1SL/vHo6/LYC7IMLdduzgJEetvnyy7YHNU9desNsMAeJh5jH9yFrp+7Lw/zd?=
 =?us-ascii?Q?tne2NbE53OfawLRT5lwCTZopkzw0lGEPSQNuGE2gbBD84S5OUlICHkDfSHni?=
 =?us-ascii?Q?8rWLfr39xR1YZVVgxkxYerqDxHsCYPY4ZMCosaqiMXMKAiJqowSfMi0jquz6?=
 =?us-ascii?Q?mn6su7YH5ARY0Hk4aBzJOpC4EAQGNQI5Sf/BdKNkL2oXVGQDL8TYPnZ0f1ci?=
 =?us-ascii?Q?kgBHJOnFPulqX47yDTO1mXvGf+QYYh3Dl9SjzyXPsmgoW/nWBwYYA+zZTRUR?=
 =?us-ascii?Q?H0wm9VLg2ojawessEGPfr94AZ2CHcyXiTSYaQvVyDWLg1GRenRb/3Or3EdeA?=
 =?us-ascii?Q?66aJuCwhmsffKKBKvuMtglMq0DvoYoVbNW+NMTpG4QA2K5lcdxX2mpekzv7t?=
 =?us-ascii?Q?YJhTonp+RWrBT5MyJI1O5JTp/Q8XwliajTCDs/9yX8qoyLcBNOKAQk3rb/24?=
 =?us-ascii?Q?fPq5sihxVFWTnRaxD7iIA7yPz0Gg1H7tdmsJGwQet614dZAEump8K0qz05II?=
 =?us-ascii?Q?GP1P5O4jivzdJEAiTG3897YCyEqHwYvFuQG1jBlAk/z7YJo6gZfIH5/cHzhU?=
 =?us-ascii?Q?KB6BYiTD38dAqQtScSalXSOJAuMxB6jBH4WBlf5DYYZJmgsjxk/PAioD+Y6c?=
 =?us-ascii?Q?Flw3XrJ5152Crvay7VOzvmaUP1ONyfNimVSFUGezaof8HEkpoZ1N+bAb7gX9?=
 =?us-ascii?Q?HcFHBVnlR4rnq3LFXBhcsVhTYhpl37YxxmrbVrOPJ8A0vGJXqhqlTMLKMMKd?=
 =?us-ascii?Q?SVFoGSB+MWArR9X4La5M2o9MmYJ7rFDEqLlvd09fU7OW5I1b8aDEjh2zaKs2?=
 =?us-ascii?Q?OHYSOUcEtgx0mhJu2ft9rE69zNqZJjMT8MoPzstYrMNTYSDRNRty7k0YxyoL?=
 =?us-ascii?Q?wth60vLyQFpPQ7BmsSJK/y39GHWC5KCvDHDO2ckbJImeeW9Nt5HY8ekUNzRM?=
 =?us-ascii?Q?/g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71775651-c560-41ad-7124-08d9af28d350
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2021 09:00:12.7373
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: znG0CifXYDooNQWM6F7rrOhYVwl2wCj8HXuM1qaYMkuAKFR1dQIiP/rNCUZZXFXTAVTEYk7PVFbDWBotV7aBxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3267
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> -----Original Message-----
> From: Nicolas Dufresne [mailto:nicolas@ndufresne.ca]
> Sent: Wednesday, November 24, 2021 3:23 AM
> To: Ming Qian <ming.qian@nxp.com>; mchehab@kernel.org;
> shawnguo@kernel.org; robh+dt@kernel.org; s.hauer@pengutronix.de
> Cc: hverkuil-cisco@xs4all.nl; kernel@pengutronix.de; festevam@gmail.com;
> dl-linux-imx <linux-imx@nxp.com>; Aisheng Dong <aisheng.dong@nxp.com>;
> linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> Subject: [EXT] Re: [PATCH v12 00/13] amphion video decoder/encoder driver
>=20
> Caution: EXT Email
>=20
> Hi Ming,
>=20
> For the patchset:
>=20
> Tested-By: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>=20
> I've validated encoding manually with GStreamer:
>=20
>   gst-launch-1.0 videotestsrc num-buffers=3D100 ! v4l2h264enc !
> video/x-h264,profile=3Dmain,level=3D\(string\)2 ! h264parse ! qtmux ! fil=
esink
> location=3Dtest.mov
>=20
> I've also verify the that the number of frames was exactly 100, this is c=
ommon
> issue with V4L2 encoders. Then I have validated VP8, H.264 and H.265
> decoders
> using fluster [0] with this PR [1] applied. You can find full summary at =
the end
> of this email. Markdown report didn't get generated, I will have to check=
 with
> upstream fluster if there is a regression.
>=20
> $> ./fluster.py run -s -so amphion-imx8qxp-conformance.md -d
> GStreamer-VP8-V4L2-Gst1.0 GStreamer-H.264-V4L2-Gst1.0
> GStreamer-H.265-V4L2-Gst1.0
>=20
> VP8:   Ran 59/61 tests successfully               in 131.788 secs
> H.264: Ran 75/135 tests successfully               in 501.206 secs
> H.265: Ran 126/147 tests successfully               in 1131.933 secs
>=20
> Note that in mainline, only 1 core get fired and is kept at its lowest po=
ssible
> frequency, so perhaps it may cause some of the timeout seen. The driver i=
s
> overall functional, and I would like to thank you for this extra work. Al=
so,
> note that this very first time I run Fluster over the stateful CODEC wrap=
pers. I
> will need to run this on more platforms to locate the GStreamer specific =
fail.
>=20
> VP8 note, conformance vector vp80-03-segmentation-1425 cause a hang but i=
t
> then
> recover:
>=20
> [ 8264.851841] amphion-vpu-core 2d040000.vpu_core: [0] sync session
> timeout
> [ 8264.858634] amphion-vpu-core 2d040000.vpu_core: [0] send cmd(0x2) fail
> [ 8264.867992] amphion-vpu-core 2d040000.vpu_core: [0] start fail
> [ 8264.905173] amphion-vpu-core 2d040000.vpu_core: reset hang core
>=20

HI Nicolas

    There is a bug in firmware that if send a command to firmware too close=
 after stop cmd,
The firmware may enter wfi wrong, and led to hang issue you met in vp80-03-=
segmentation-1425.
I'll add a workaround in driver that add a delay after send stop cmd to fir=
mware in next version.

    Because the amphion's vpu doesn't support to output i420, so the test w=
ill convert nv12_8l128 to i420 by videoconvert, it leds to most of timeout =
failure.

    The FM1_BT_B.h264 can't be decoded by amphion's vpu, the vpu is keeping=
 parse sequence header, and it led to timeout failure.

    I run the test and change the timeout to 300, then most of timeout fail=
ures are gone. Besides that, my result is almost as same as yours.

    The failures of assertion error means that the vpu's output is differen=
t from the pattern, I think it should be the vpu's limitation.

>=20
> See comments about your GStreamer MR below...
>=20
> [0]
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.
> com%2Ffluendo%2Ffluster&amp;data=3D04%7C01%7Cming.qian%40nxp.com%7
> C45d33490bfe546aa8e1408d9aeb6a822%7C686ea1d3bc2b4c6fa92cd99c5c3
> 01635%7C0%7C0%7C637732921809373007%7CUnknown%7CTWFpbGZsb3d
> 8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3
> D%7C3000&amp;sdata=3DbBqADaZ9ZN00SbCPalQE5fN740hB2bMUxHDL4QEki
> mg%3D&amp;reserved=3D0
> [1]
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.
> com%2Ffluendo%2Ffluster%2Fpull%2F98&amp;data=3D04%7C01%7Cming.qian
> %40nxp.com%7C45d33490bfe546aa8e1408d9aeb6a822%7C686ea1d3bc2b4c
> 6fa92cd99c5c301635%7C0%7C0%7C637732921809382989%7CUnknown%7C
> TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC
> JXVCI6Mn0%3D%7C3000&amp;sdata=3D90dUC%2FNzK%2BcFNSMwY7bgQ0iD8
> ctBwU%2FMhyrLoBBEf4g%3D&amp;reserved=3D0
>=20
>=20
> [...]
> > encoder is tested with gstreamer
> > decoder is tested with gstreamer, but the following patches are require=
d:
>=20
> GStreamer is now a single repo (and using main branch instead of master),=
 I
> have
> migrated your 3 MRs into 2 MRs.

Thank you very much.
>=20
> >
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitla=
b.fr
> eedesktop.org%2Fgstreamer%2Fgst-plugins-base%2F-%2Fmerge_requests%2F
> 1252&amp;data=3D04%7C01%7Cming.qian%40nxp.com%7C45d33490bfe546aa
> 8e1408d9aeb6a822%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7
> C637732921809382989%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw
> MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sda
> ta=3DG4PnqxRsnPjQtV%2FUcp4dkoz9fAGxkOv%2FzKR47RaHtu0%3D&amp;reser
> ved=3D0
> >
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitla=
b.fr
> eedesktop.org%2Fgstreamer%2Fgst-plugins-good%2F-%2Fmerge_requests%2F
> 1098&amp;data=3D04%7C01%7Cming.qian%40nxp.com%7C45d33490bfe546aa
> 8e1408d9aeb6a822%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7
> C637732921809382989%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw
> MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sda
> ta=3Dh6nEISAaiG54NPz9Xw0MiSNDx2QxWsNWyG7FLSAaLgI%3D&amp;reserved
> =3D0
>=20
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitla=
b.fr
> eedesktop.org%2Fgstreamer%2Fgstreamer%2F-%2Fmerge_requests%2F1379&
> amp;data=3D04%7C01%7Cming.qian%40nxp.com%7C45d33490bfe546aa8e140
> 8d9aeb6a822%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6377
> 32921809382989%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL
> CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DPFe
> Db4v%2BmiksgvJ08KgncRjZEt7GdMO7gV8hV0DD0uY%3D&amp;reserved=3D0
>=20
> >
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitla=
b.fr
> eedesktop.org%2Fgstreamer%2Fgst-plugins-good%2F-%2Fmerge_requests%2F
> 1099&amp;data=3D04%7C01%7Cming.qian%40nxp.com%7C45d33490bfe546aa
> 8e1408d9aeb6a822%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7
> C637732921809382989%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw
> MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sda
> ta=3De6hSDpiP2scLN5C0f8Fb%2FoMbt8k4zC45qWPrQpG%2Fe5A%3D&amp;rese
> rved=3D0
>=20
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitla=
b.fr
> eedesktop.org%2Fgstreamer%2Fgstreamer%2F-%2Fmerge_requests%2F1381&
> amp;data=3D04%7C01%7Cming.qian%40nxp.com%7C45d33490bfe546aa8e140
> 8d9aeb6a822%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6377
> 32921809382989%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL
> CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DxkX
> WjCsgVaLb0wZgfaXDMiBchtbJBNnwtZNhKe42k5o%3D&amp;reserved=3D0
>=20
>=20
> regards,
> Nicolas
>=20
> [JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) FM1_BT_B                 ...
> Timeout
The vpu can't decode this stream.

> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> AMP_D_Hisilicon_3               ... Timeout
Performance issue of videoconvert
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> AMP_E_Hisilicon_3               ... Timeout
Performance issue of videoconvert
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> AMP_F_Hisilicon_3               ... Timeout
Performance issue of videoconvert
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> BUMPING_A_ericsson_1            ... Fail
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> CONFWIN_A_Sony_1                ... Fail
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> DELTAQP_A_BRCM_4                ... Timeout
Performance issue of videoconvert
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> MVDL1ZERO_A_docomo_4            ... Timeout
Performance issue of videoconvert
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> NoOutPrior_A_Qualcomm_1         ... Fail
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> NoOutPrior_B_Qualcomm_1         ... Fail
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> NUT_A_ericsson_5                ... Fail
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> PICSIZE_A_Bossen_1              ... Error
The size is 1056x8440, vpu doesn't support it
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> PICSIZE_B_Bossen_1              ... Error
The size is 8440x1056, vpu doesn't support it
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> PICSIZE_C_Bossen_1              ... Fail
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> PICSIZE_D_Bossen_1              ... Fail
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> RAP_B_Bossen_2                  ... Fail
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> SAODBLK_A_MainConcept_4         ... Timeout
Performance issue of videoconvert
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> SAODBLK_B_MainConcept_4         ... Timeout
Performance issue of videoconvert
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> TILES_A_Cisco_2                 ... Timeout
Performance issue of videoconvert
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> TILES_B_Cisco_1                 ... Timeout
Performance issue of videoconvert, but assert fail
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> TSUNEQBD_A_MAIN10_Technicolor_2 ... Fail
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0)
> VPSSPSPPS_A_MainConcept_1       ... Error
Gstream report error:
ERROR Error from element /GstPlayBin:playbin/GstURIDecodeBin:uridecodebin0/=
GstDecodeBin:decodebin0/v4l2h265dec:v4l2h265dec0: Could not read from resou=
rce.
Could not read from resource.
../sys/v4l2/gstv4l2bufferpool.c(1155): gst_v4l2_buffer_pool_poll (): /GstPl=
ayBin:playbin/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/v4l2h26=
5dec:v4l2h265dec0:
poll error 1: Success (0) for /mnt/fluster/resources/JCT-VC-HEVC_V1/VPSSPSP=
PS_A_MainConcept_1/VPSSPSPPS_A_MainConcept_1.bin
=20
> [VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0)
> vp80-03-segmentation-1425 ... Timeout
Firmware bug, after apply driver workaround, assert fail
> [VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0)
> vp80-03-segmentation-1436 ... Fail
>=20
>

