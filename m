Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C4D245C7B
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2019 14:16:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727755AbfFNMPl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jun 2019 08:15:41 -0400
Received: from mail-eopbgr690077.outbound.protection.outlook.com ([40.107.69.77]:61147
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727217AbfFNMPk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jun 2019 08:15:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1qLZHAxoIPgDaN0R9PTRMroJWY9G3IFTnpk5jMBBas=;
 b=dan6Bv2yT0KCPeE+EgLoZff6n8zX+573P9vMhDaS6MJYQShPC2wU99lDcYiUQX46rZo3qklQgotZWHsOEw4PeFOLxQGWrmQHACoNAVGQlia7M9eiAwhDsRUmLycx3gnG2aNNTCs8BJ039eiklO08ZGphqHBiBtOk8DsL2q5vQxE=
Received: from CH2PR02MB6088.namprd02.prod.outlook.com (52.132.228.94) by
 CH2PR02MB6104.namprd02.prod.outlook.com (52.132.228.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Fri, 14 Jun 2019 12:15:25 +0000
Received: from CH2PR02MB6088.namprd02.prod.outlook.com
 ([fe80::d109:38a2:f2d5:b351]) by CH2PR02MB6088.namprd02.prod.outlook.com
 ([fe80::d109:38a2:f2d5:b351%7]) with mapi id 15.20.1965.017; Fri, 14 Jun 2019
 12:15:25 +0000
From:   Vishal Sagar <vsagar@xilinx.com>
To:     Joe Perches <joe@perches.com>, Hyun Kwon <hyunk@xilinx.com>,
        Vishal Sagar <vishal.sagar@xilinx.com>
CC:     Hyun Kwon <hyunk@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michal Simek <michals@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Dinesh Kumar <dineshk@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>
Subject: RE: [PATCH 2/2] media: v4l: xilinx: Add Xilinx UHD-SDI Rx Subsystem
 driver
Thread-Topic: [PATCH 2/2] media: v4l: xilinx: Add Xilinx UHD-SDI Rx Subsystem
 driver
Thread-Index: AQHVGt1y9b6kdvITzkGymcoGfLMXzqaaMmUAgAAHbgCAAOVkwA==
Date:   Fri, 14 Jun 2019 12:15:24 +0000
Message-ID: <CH2PR02MB60885E9B81D89073BC451FC9A7EE0@CH2PR02MB6088.namprd02.prod.outlook.com>
References: <1559656556-79174-1-git-send-email-vishal.sagar@xilinx.com>
         <1559656556-79174-3-git-send-email-vishal.sagar@xilinx.com>
         <20190613220507.GA2473@smtp.xilinx.com>
 <39e6c0f7d7529da9906a17450a8bcdf416297520.camel@perches.com>
In-Reply-To: <39e6c0f7d7529da9906a17450a8bcdf416297520.camel@perches.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsagar@xilinx.com; 
x-originating-ip: [149.199.50.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04d08cf7-2b67-406c-a44c-08d6f0c1fb0b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:CH2PR02MB6104;
x-ms-traffictypediagnostic: CH2PR02MB6104:
x-microsoft-antispam-prvs: <CH2PR02MB6104E6109DA90640F102DBB6A7EE0@CH2PR02MB6104.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0068C7E410
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(396003)(366004)(39860400002)(346002)(376002)(199004)(189003)(13464003)(64756008)(316002)(53936002)(68736007)(14454004)(486006)(55016002)(76176011)(74316002)(256004)(476003)(6436002)(229853002)(81156014)(66556008)(66476007)(66946007)(3846002)(6116002)(8676002)(76116006)(9686003)(446003)(81166006)(11346002)(73956011)(107886003)(8936002)(66066001)(86362001)(4326008)(102836004)(66446008)(478600001)(6506007)(7736002)(25786009)(186003)(52536014)(6246003)(7696005)(33656002)(5660300002)(110136005)(26005)(2906002)(54906003)(71190400001)(71200400001)(305945005)(99286004)(6636002)(53546011);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR02MB6104;H:CH2PR02MB6088.namprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Bhfp81peb5f47bl+Plj3rbPscpOjVDgBBv+dyqFPkfnSWwxwj34BqxtnkY+q+Rnmn3lrWlad2oj/cBgt1Y53QGZQ+7HiSfx2iefiuO8y9uru4Eev54QQ/S5y0TYCwbpa0TxA3cMSHDTh+c/9MVyO4WUR68bnyHRqVSxf4KixqgE82J86MpK4yL458V4WR/a4gWBXlHlCvh71DoRGc/gv6G/SlkKP16kXEwXE5tEyj2K1DlFzz+JKH6W5cW1HFV0PuvlJN36KAavlFHU3svu3ZmQyOO794uFc9XwM0PVBhyGjGDbQBDIfKzAuEguP97YEAedOBjmmFQK8eW6RGDBpP+dObJYKTwUSmz69Fp+hUJBVHCmG1ZZQ0yrBcqbZiw+P83nV+L8Ux7GEyT6QiILrCgJGvVOB753SGRyGH9Kuh6E=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d08cf7-2b67-406c-a44c-08d6f0c1fb0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2019 12:15:24.8683
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vsagar@xilinx.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6104
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Joe,

Thanks for reviewing.=20

> -----Original Message-----
> From: linux-media-owner@vger.kernel.org [mailto:linux-media-
> owner@vger.kernel.org] On Behalf Of Joe Perches
> Sent: Friday, June 14, 2019 4:02 AM
> To: Hyun Kwon <hyunk@xilinx.com>; Vishal Sagar <vishal.sagar@xilinx.com>
> Cc: Hyun Kwon <hyunk@xilinx.com>; Laurent Pinchart
> <laurent.pinchart@ideasonboard.com>; Mauro Carvalho Chehab
> <mchehab@kernel.org>; Michal Simek <michals@xilinx.com>; Rob Herring
> <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>; linux-
> kernel@vger.kernel.org; linux-media@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; devicetree@vger.kernel.org; Dinesh Kumar
> <dineshk@xilinx.com>; Sandip Kothari <sandipk@xilinx.com>
> Subject: Re: [PATCH 2/2] media: v4l: xilinx: Add Xilinx UHD-SDI Rx Subsys=
tem
> driver
>=20
> EXTERNAL EMAIL
>=20
> On Thu, 2019-06-13 at 15:05 -0700, Hyun Kwon wrote:
> > On Tue, 2019-06-04 at 06:55:56 -0700, Vishal Sagar wrote:
>=20
> trivia:
>=20
> > > diff --git a/drivers/media/platform/xilinx/xilinx-sdirxss.c
> b/drivers/media/platform/xilinx/xilinx-sdirxss.c
> []
> > > +static int xsdirx_get_stream_properties(struct xsdirxss_state *state=
)
> > > +{
> []
> > > +   if (valid & XSDIRX_ST352_VALID_DS1_MASK) {
> > > +           payload =3D xsdirxss_read(core, XSDIRX_ST352_DS1_REG);
> > > +           byte1 =3D (payload >> XST352_PAYLOAD_BYTE1_SHIFT) &
> > > +                           XST352_PAYLOAD_BYTE_MASK;
>=20
> Is XST352_PAYLOAD_BYTE_MASK correct ?
> Should it be XST352_PAYLOAD_BYTE1_MASK ?
>=20

I had thought of it to be a generic mask to extract a byte out of 4 bytes i=
n a ST352 packet.
Hence named it as XST352_PAYLOAD_BYTE_MASK

> > > +           active_luma =3D (payload &
> XST352_BYTE3_ACT_LUMA_COUNT_MASK) >>
> > > +                           XST352_BYTE3_ACT_LUMA_COUNT_OFFSET;
> > > +           pic_type =3D (payload & XST352_BYTE2_PIC_TYPE_MASK) >>
> > > +                           XST352_BYTE2_PIC_TYPE_OFFSET;
> > > +           framerate =3D (payload >> XST352_BYTE2_FPS_SHIFT) &
> > > +                           XST352_BYTE2_FPS_MASK;
> > > +           tscan =3D (payload & XST352_BYTE2_TS_TYPE_MASK) >>
> > > +                           XST352_BYTE2_TS_TYPE_OFFSET;
> >
> > Please align consistently throughout the patch. I believe the checkpatc=
h
> > --strict warns on these.
>=20
> I believe not.
>=20
> Another possibility would be to use a macro like:
>=20
> #define mask_and_shift(val, type)       \
>         ((val) & (XST352_ ## type ## _MASK)) >> (XST352_ ## type ## _OFFS=
ET))
>=20
> > > +           sampling =3D (payload & XST352_BYTE3_COLOR_FORMAT_MASK) >=
>
> > > +                      XST352_BYTE3_COLOR_FORMAT_OFFSET;
>=20
> So these could be something like:
>=20
>                 sampling =3D mask_and_shift(payload, BYTE3_COLOR_FORMAT);
>=20

This looks like a good way. I will modify this in v2.=20
I will also modify the XST352_PAYLOAD_BYTE_MASK to=20
XST352_PAYLOAD_BYTE1_MASK so that this aligns with the macro.

Regards
Vishal Sagar

