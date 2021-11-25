Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEBB745D44E
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 06:27:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238956AbhKYFaz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 00:30:55 -0500
Received: from mail-eopbgr20042.outbound.protection.outlook.com ([40.107.2.42]:20610
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238940AbhKYF2y (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 00:28:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0/LqL5ZrQXxPKG019Vh5Pf8QgTEszU0OZm4CEawwLxOLr2mbpoIvV6nDSBEY5kw34gxf3LFQu/uKWPcRH9o/c+orMQruvEGL18vWqIQT+qo6QEM3qbPuwBNvNJFKFF/3iixHboT7wLzAeZzMFXuonNMQUKWUlNKhTwfO0U0VWRsh/F9exNQFN9xsNwWC1vofk2MWb+bvyI1rettBPijIWE+t3Sbuq8eb/jd5m1eGeuTFXhhkn382R3XBZpIUTeXVwyDMzK32bmVifGvD0eT+NRBmuFhYNwMTLBRvtukPSmo/2TY4fGNWN4GHsthv1xs12tFx/E5rHrypNRp8IuUEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kljB5bmK5LeFLgYTL4KoBahPJKU65GRYZ9+fzkCIvFo=;
 b=i6UT3jAfYpGhdgtHm6ClFLFD/sqrMc1hT/Ehj/i+FKiY2XmZzDBbh3WS3NAKpKOStAZTX3KxHv2pe0LYVXdX/8wuLdgEKVP1Q6pJfld8wN6TfslJILBWFyTorInq0qIKa5MMkY7sTqyP5tfno66PE7wndJKjMuOCQfB2VFEIW/z2lZed9nfQ1/VwXLHF5ESXzpLMJLabqaxGgezeBOppYXxN6xUUmDmKfsJ3AFQfYJJ9QyLQmhk9p6WlHk2vGijm6ZIQQ+e7R99VQanlVG6BYmILYGXqsfoImyOxQv9RfW8C8dnXw9Xc0QOYP+2OWpynZuO2sIq+6ZijMVlfKAi4ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kljB5bmK5LeFLgYTL4KoBahPJKU65GRYZ9+fzkCIvFo=;
 b=r5B1E0rHTxD3IozgpED5DyFF3iW+/9zADnOUB92UNfsUB4J1d4AouWoYdqsdlE8lwqmuK1nSrJNf3PAYIA04SCr73RmVFn76Rxq/4UdF049glDsMbeR3tCSlrmOLm+1dr1MhioCFjFKEYB8RPa82TZdLAyskH6IyN9SNO6GFeiw=
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM7PR04MB7126.eurprd04.prod.outlook.com (2603:10a6:20b:117::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 25 Nov
 2021 05:25:41 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886%5]) with mapi id 15.20.4713.025; Thu, 25 Nov 2021
 05:25:41 +0000
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
Thread-Index: AQHX1UX9FZgXdhHdu0aj4y6UzYn6WqwRlHeAgADanLCAAG2egIAA8C0g
Date:   Thu, 25 Nov 2021 05:25:41 +0000
Message-ID: <AM6PR04MB6341F599A97253C1BA812467E7629@AM6PR04MB6341.eurprd04.prod.outlook.com>
References: <cover.1636445575.git.ming.qian@nxp.com>
         <9947131322e034bb6336802e5afb4b6132ca5071.camel@ndufresne.ca>
         <AM6PR04MB6341BF1FB2A839961DBADF4EE7619@AM6PR04MB6341.eurprd04.prod.outlook.com>
 <9b7fd6802c89c5d3bb6a42b44f13a90f6c3caf22.camel@ndufresne.ca>
In-Reply-To: <9b7fd6802c89c5d3bb6a42b44f13a90f6c3caf22.camel@ndufresne.ca>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 772b71a0-6103-45d5-0a52-08d9afd405d6
x-ms-traffictypediagnostic: AM7PR04MB7126:
x-microsoft-antispam-prvs: <AM7PR04MB7126C4AFEA6A3C5670495485E7629@AM7PR04MB7126.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Zs5PFuUtkzjj/tTTU2pH0S7ULPnyJz47OA/lEzQJ4hU84Xsot9w1rqqrvs2U2WP6gIAprfJ8UIWXRoPCbHKnSWCpEz9449ELKmD3cGTWYiEvPNzc078lI2fC2IXr68YsIcvcMQqAXk8VvI9ZWigOkpbHrCmTMBaPhu9bMvVQs0Quu0fYDzeB8JPT94IobaXcqXD1BUgXotUhPBWhX83ec5J+scTCt25/QnsyA3+xT/XUDgdDFjw318xt7ZftMhYqQ7WQo7+kNvEQtqcvHKa9G+H0h5RhQQr7PWjA/0ZEDD6kdEUlVNXlQHvne5UbW+cT24h+Red7/QvRPIc7vFLP/aAzjE9sPUaBip8x2wc2MTByMcA6KgTmCI5KpWhdPMGFbGSBoA47Oq72vsBTOfBdz5cq7/a8ZVB90khBMT9pu3xzAw8cb2SzqnLLSsYEE05EFz3cHt+VXzpHZLh+ST0PzxJMWeEMEx29PbMmG/sxtHKop5e6bX1Iupalxktl7i6h0ARehjKw4j/cDOBbG2hk05Qwb+9rY1zX8fpl3WuP3rOtHD8YHi9B8z8WBuHC6BSE+sf39pTrWvisJGjyLQ+IHqiKDBgvlFzu5WgD7d1of0kR8B6zVgmGMUs91NAMNVbZDtnzHuwtBdW1OpsCs00Qt0zgMComtqGzOR/mUPu8yw5NToFF4pUIP7CNrsnzyC2XzxF6wWJ+B/V9f3lcBrXLIg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(7696005)(54906003)(38070700005)(83380400001)(66946007)(55016003)(71200400001)(9686003)(66574015)(2906002)(33656002)(110136005)(6506007)(53546011)(86362001)(316002)(52536014)(44832011)(122000001)(7416002)(186003)(38100700002)(5660300002)(64756008)(66556008)(66476007)(8936002)(66446008)(76116006)(8676002)(4326008)(26005)(508600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?jUXvyzy8BOOWalOrELEd7/8UL8IqUPuIahOtkWkoq5JienWsL/jWv3h18J?=
 =?iso-8859-1?Q?EaIhM8XSUY+WeM+ZOc/6a8G0Ncx65hbVyQPNC07Vmcs6d0231N7w2RRoRY?=
 =?iso-8859-1?Q?7lfwQMREVpCxsfz5I8abyhhWY8Hh4TKLDpzVjKCzt6pEksXUwIrUANziUI?=
 =?iso-8859-1?Q?PJXTBi75IoZtpAbiwkVW7VQXHEo4KjIDdPsBkdhUc1ftvcZliv/3qy1Lft?=
 =?iso-8859-1?Q?EbWqyeOe1GvJ8ECTpyy+IeNJH2+sYqz+kGpekjTUTpaD4UQqWjzyVToaMq?=
 =?iso-8859-1?Q?NjgTi8YhH1z1ek+64WdgU0qa7nWsfSa/c8v7tgCQQh5cYnptIkrGNJHsbP?=
 =?iso-8859-1?Q?Wvxu/JtyWZbf3f1qpJKgqi0CSnbfBwH0f/8x7lyzCn9/vyMQM0lqqrIkUc?=
 =?iso-8859-1?Q?22TgaA1N/CueunbnjfphYbigCUv40RkYimOEjmig3wbsx2oErjgijdz4+t?=
 =?iso-8859-1?Q?CblXxBw40XSxVXYIQyIC8sfoj8l5r0L7Tt41tl6TYQ7VJkE4/Urhj3YTtA?=
 =?iso-8859-1?Q?bBh0FSE9ksvwe7jICT/cGEgYZbwBCRjXHaVZT2PHy0OGYpOWfGXAZSfrDx?=
 =?iso-8859-1?Q?dxupQxqVVvfH4U8Z/x23opPnUda9Fx3otroDIOdQ+ISaDzGSBx6yFWuPfi?=
 =?iso-8859-1?Q?Nv8cB8NXM4E5MHEaLu8KiDKcZ8TtcEOviDFO/pLKBVMZed5dMSB78Hy6jp?=
 =?iso-8859-1?Q?7RBQRf0dgCp4EY/JTSvUstXpqjdOBEyqMUV17Ktpx47L3U12q/0PnggTPB?=
 =?iso-8859-1?Q?6t1MrpaJjIsy2TfOyl6hqnyFbQnb/QMbibwLAbiDLDD/C88Oi5M5BCFeIX?=
 =?iso-8859-1?Q?Aywre4h2bKWiPg7GfchSOFdGsXK2bVKwN7/ifcFqEB8/zPnAbYUt1Vgw8z?=
 =?iso-8859-1?Q?N4bmS6xdPjU8yIiXIh6vKQ+fQFL0znE2kgwjhtg+i8jHMG7BxNhcju4FKX?=
 =?iso-8859-1?Q?pmhUwelcJmRNvP+EKpRFgWPOuwvxeZGYxKQiwSMcCwnU+x8mGYPQhgiaF3?=
 =?iso-8859-1?Q?29OBJqPEpH4SYkb3YKFYf0X58FBwl3/P3ZFsZcFAdODf608ndKVJMk0B8X?=
 =?iso-8859-1?Q?Zq6VH7dbXgxNU9AD6ifT+Kyl5um1LHJsYliNEh7RdU+6gIc8THC2NoWGDv?=
 =?iso-8859-1?Q?kbD0XQqsd4ffeWnkkMJmKJl6XCHY83xqWMAqm4udszSnDeYW04v876wurk?=
 =?iso-8859-1?Q?oOyAXzUDIscV4qB9gRXu7Dpl5LTAwTO8qP7o8wwKIHP0PF9WxW+qaqSE/m?=
 =?iso-8859-1?Q?ylKcT6AeyuN+pduXc87Mq24fZ860v/XR0dMHYi2/SvHNNuzyZZabvRyR5f?=
 =?iso-8859-1?Q?iuStHqlEq796b+2zx5YpOA8nBhTbYkTPZMWxY6iz+9OEBvvrfjiawCIQ1n?=
 =?iso-8859-1?Q?gFiTuDMzBdfOmGfmSOVnCSFLdG4MsNGqqXCYt3YsEyyET+JBBIYQZwF4Rg?=
 =?iso-8859-1?Q?fy1HTykpBuM7jdia6Zb/7eq4cGF0/qCg2qQHtgSl4rnbeChe4S/2w8t7OD?=
 =?iso-8859-1?Q?6qnPXiXOE6jxg9Jb184fMaBpMNO/cqGekAEcbQHhBbqmWYzL1ISkcm0THN?=
 =?iso-8859-1?Q?Hj3AHK5f+jOLTjvKIkGzuwKqrr2IUSBAbZ/dpg8y8k2+T78LPSOVxU6Ohm?=
 =?iso-8859-1?Q?WVHE9KHb9eQOc1CrLRk2kslvKl6LDnyg40gS/4nEfLVTYaZYAGXzbGsQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 772b71a0-6103-45d5-0a52-08d9afd405d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2021 05:25:41.4847
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2XRP5m4p8dcMoKoaLhXDpT3yIKQAnj0pK4JgNwuyE66sDj67YRfd1FEtgLfP0/Nk0J6pLc7g7jxloMw1NPdrSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7126
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> -----Original Message-----
> From: Nicolas Dufresne [mailto:nicolas@ndufresne.ca]
> Sent: Wednesday, November 24, 2021 10:58 PM
> To: Ming Qian <ming.qian@nxp.com>; mchehab@kernel.org;
> shawnguo@kernel.org; robh+dt@kernel.org; s.hauer@pengutronix.de
> Cc: hverkuil-cisco@xs4all.nl; kernel@pengutronix.de; festevam@gmail.com;
> dl-linux-imx <linux-imx@nxp.com>; Aisheng Dong <aisheng.dong@nxp.com>;
> linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> Subject: Re: [EXT] Re: [PATCH v12 00/13] amphion video decoder/encoder
> driver
>=20
> Caution: EXT Email
>=20
> Le mercredi 24 novembre 2021 =E0 09:00 +0000, Ming Qian a =E9crit :
> > > -----Original Message-----
> > > From: Nicolas Dufresne [mailto:nicolas@ndufresne.ca]
> > > Sent: Wednesday, November 24, 2021 3:23 AM
> > > To: Ming Qian <ming.qian@nxp.com>; mchehab@kernel.org;
> > > shawnguo@kernel.org; robh+dt@kernel.org; s.hauer@pengutronix.de
> > > Cc: hverkuil-cisco@xs4all.nl; kernel@pengutronix.de;
> > > festevam@gmail.com; dl-linux-imx <linux-imx@nxp.com>; Aisheng Dong
> > > <aisheng.dong@nxp.com>; linux-media@vger.kernel.org;
> > > linux-kernel@vger.kernel.org; devicetree@vger.kernel.org;
> > > linux-arm-kernel@lists.infradead.org
> > > Subject: [EXT] Re: [PATCH v12 00/13] amphion video decoder/encoder
> > > driver
> > >
> > > Caution: EXT Email
> > >
> > > Hi Ming,
> > >
> > > For the patchset:
> > >
> > > Tested-By: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > >
> > > I've validated encoding manually with GStreamer:
> > >
> > >   gst-launch-1.0 videotestsrc num-buffers=3D100 ! v4l2h264enc !
> > > video/x-h264,profile=3Dmain,level=3D\(string\)2 ! h264parse ! qtmux !
> > > filesink location=3Dtest.mov
> > >
> > > I've also verify the that the number of frames was exactly 100, this
> > > is common issue with V4L2 encoders. Then I have validated VP8, H.264
> > > and H.265 decoders using fluster [0] with this PR [1] applied. You
> > > can find full summary at the end of this email. Markdown report
> > > didn't get generated, I will have to check with upstream fluster if
> > > there is a regression.
> > >
> > > $> ./fluster.py run -s -so amphion-imx8qxp-conformance.md -d
> > > GStreamer-VP8-V4L2-Gst1.0 GStreamer-H.264-V4L2-Gst1.0
> > > GStreamer-H.265-V4L2-Gst1.0
> > >
> > > VP8:   Ran 59/61 tests successfully               in 131.788 secs
> > > H.264: Ran 75/135 tests successfully               in 501.206 secs
> > > H.265: Ran 126/147 tests successfully               in 1131.933 secs
> > >
> > > Note that in mainline, only 1 core get fired and is kept at its
> > > lowest possible frequency, so perhaps it may cause some of the
> > > timeout seen. The driver is overall functional, and I would like to
> > > thank you for this extra work. Also, note that this very first time
> > > I run Fluster over the stateful CODEC wrappers. I will need to run
> > > this on more platforms to locate the GStreamer specific fail.
> > >
> > > VP8 note, conformance vector vp80-03-segmentation-1425 cause a hang
> > > but it then
> > > recover:
> > >
> > > [ 8264.851841] amphion-vpu-core 2d040000.vpu_core: [0] sync session
> > > timeout [ 8264.858634] amphion-vpu-core 2d040000.vpu_core: [0] send
> > > cmd(0x2) fail [ 8264.867992] amphion-vpu-core 2d040000.vpu_core: [0]
> > > start fail [ 8264.905173] amphion-vpu-core 2d040000.vpu_core: reset
> > > hang core
> > >
> >
> > HI Nicolas
> >
> >     There is a bug in firmware that if send a command to firmware too
> > close after stop cmd, The firmware may enter wfi wrong, and led to
> > hang issue you met in vp80-03- segmentation-1425.
> > I'll add a workaround in driver that add a delay after send stop cmd
> > to firmware in next version.
> >
> >     Because the amphion's vpu doesn't support to output i420, so the
> > test will convert nv12_8l128 to i420 by videoconvert, it leds to most
> > of timeout failure.
> >
> >     The FM1_BT_B.h264 can't be decoded by amphion's vpu, the vpu is
> > keeping parse sequence header, and it led to timeout failure.
> >
> >     I run the test and change the timeout to 300, then most of timeout
> > failures are gone. Besides that, my result is almost as same as yours.
>=20
> Oh my bad, I forgot about the short timeout, with a single core on top of=
 all
> this, that makes sense.
>=20
> >
> >     The failures of assertion error means that the vpu's output is
> > different from the pattern, I think it should be the vpu's limitation.
>=20
> Most likely, best way to know is to keep the results (--keep) and visuall=
y look at
> the result. My expectation with this is that we get decent results and th=
at none
> of the issue render the VPU or the system unusable. Each company is then
> responsible for their CODEC conformance, specially with stateful, there i=
s very
> little that userspace will be responsible with. Though if you do find iss=
ue that is
> clearly caused by GStreaner, let me know, I'll be more then happy to fix.
> Most VPU providers will also buy proprietary conformance suite (like Alle=
gro),
> which covers much more then basic conformance.
>=20

For test [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) VPSSPSPPS_A_MainCon=
cept_1,
The vpu report an unsupported message to driver, so driver report pollerr t=
o gstreamer.
But this stream can be decoded using the amphion vpu when I test it using o=
ur unit test,
I checked the difference, there are many vps, sps and pps at the beginning,=
=20
gstreamer will skip the first vpu and two pps, totally skip 56 bytes. It le=
ds to vpu can't decode
And our unit test won't skip anthing, so the vpu can decode the stream.

