Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 081F36451C
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2019 12:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727163AbfGJKVC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jul 2019 06:21:02 -0400
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]:37092 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726097AbfGJKVB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jul 2019 06:21:01 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C8F07C299E;
        Wed, 10 Jul 2019 10:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1562754061; bh=6GiyGqXnyTYaMD2fvFKYMN7ZnrqDxQZxK9U/8tPkTYE=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=XLokQnJ05QtO2+558zXMWUOEkX986QuGBO674kX1LB+gxJpIxErt22lxSB9f8no7g
         OlNqgiGrtQSmARyBB/W78vjzS1XU1U8WVSq8Gm+rQsOnKmGLtDaklTb2Byi0gUXR76
         1PYj5+Bj3Y8+YQK+iVpqjY5trHB7r4Trx6PlDlCWeWsRSBXHgIgv6SuhaA6rPeRyWa
         MEpwE9ELLAavOv2XQjMB/GqboWEm6vS6ak7t3wpt2NKO+pufUaumQBpzLuEQTxTy0R
         X1h7ESomRRXbNdtuarTmNpVWZo/Cx7aKaOivpmxhscxWdmjM3xGMKGlxKR+6PhgpXg
         1Mij8rlqKgQ7A==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 5E259A0067;
        Wed, 10 Jul 2019 10:20:57 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 10 Jul 2019 03:20:57 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 10 Jul 2019 03:20:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mv+Ok7n9tYBJQZ8wiTSHw/lZLaNreP7TZIJbeOf0KJi1fLdEQgfZjN+cI02/L74lPLLZSFMotSzOxO2o3tIT6U19buQWmLbhLj+sK5Q3cR0shnInw0b4SYnyy8gfuUWeVTU/VK6JtcmWw8H4WGUmr3QbmF7gHPy5tgPJGw/25Wi7q7LT270cGeYn+btY2MyNP85/LpCrYaS4FYjLZ25CaIuQdSMYjMLj63OPnEPxyBsIWGUPrvzSZ6jT3+Yi0x9cPLGfix/pEk8ndbZYPLKgQJCAb8g7Hapq5QvCDa3hNA59Xk+7hXHAHHK3Ey8tu/N+Ij4K8e/ESrF9VpngiwiRtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXdfV/a4Pg9QCLE36JYzlUMnQ978Bjh5Mexubk67ezM=;
 b=ieMmbIXgvF9MoVhxjVc6DU19b5INiqrlVSp4V9duxaZvBFcbN8l242Hx6U6UifMxK+tceayYG9Q1m4Nb4sFBR8LpQFGhXNb6x6Rzw89/herMrcDMXQIz8ByZv0jxfivAZStkTlHZOQU0rkaItt1Z1h/K4v9gHZv3ISvzJtMp0HYFSft+/Jkd5iGmtLaHBJsw8tgJsbGfQ0c5Z8Sm9BFWRo/E/+vb8Wn64UmEJQi4iV4nXpTKL1b/xE7RcK3UbYGHOw/9WTjRE4ZYLQn59zboLZA+WSYfaOFxBMYXvRmlNjKZGu2t90rCFfAx9r6Sma502RAcsR7KR8RCe+52h9/LWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=synopsys.com;dmarc=pass action=none
 header.from=synopsys.com;dkim=pass header.d=synopsys.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXdfV/a4Pg9QCLE36JYzlUMnQ978Bjh5Mexubk67ezM=;
 b=oTw50La/Cepqn20o5S4Gl/k7G3HAD1ZX+zZAqX/zgkcy0aboFoIhQNp51K2OH/BvlU0cPTqgdiRCuP7dgDZVwVwTbu9q7lkxgU5ZAGPZgrqOuATgY/puounq821A8iWzkprrH1i5zYnKa9CA2BuTW9RtVVxXRjxUwLN0owZLd6M=
Received: from MN2PR12MB3710.namprd12.prod.outlook.com (10.255.236.23) by
 MN2PR12MB3982.namprd12.prod.outlook.com (10.255.238.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Wed, 10 Jul 2019 10:20:55 +0000
Received: from MN2PR12MB3710.namprd12.prod.outlook.com
 ([fe80::8025:feba:c9cf:ba9f]) by MN2PR12MB3710.namprd12.prod.outlook.com
 ([fe80::8025:feba:c9cf:ba9f%3]) with mapi id 15.20.2052.020; Wed, 10 Jul 2019
 10:20:55 +0000
From:   Luis de Oliveira <Luis.Oliveira@synopsys.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Luis de Oliveira <Luis.Oliveira@synopsys.com>
CC:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>,
        "robh@kernel.org" <robh@kernel.org>,
        "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
        "paulmck@linux.ibm.com" <paulmck@linux.ibm.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "kishon@ti.com" <kishon@ti.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>
Subject: RE: [v4 1/6] dt-bindings: media: Document bindings for DW MIPI CSI-2
 Host
Thread-Topic: [v4 1/6] dt-bindings: media: Document bindings for DW MIPI CSI-2
 Host
Thread-Index: AQHVIIrZEAgDFXEPAEq65DEFTPH6j6axNjgAgA/JhCCAAcZqAIABB4hw
Date:   Wed, 10 Jul 2019 10:20:55 +0000
Message-ID: <MN2PR12MB371026A6547B449EEC0439B1CBF00@MN2PR12MB3710.namprd12.prod.outlook.com>
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
 <1560280855-18085-2-git-send-email-luis.oliveira@synopsys.com>
 <20190628141326.swgl3kg4fj5pmlqx@valkosipuli.retiisi.org.uk>
 <MN2PR12MB37109D7AADCE4823CB458CB9CBF60@MN2PR12MB3710.namprd12.prod.outlook.com>
 <20190709182500.3x544axnrgy72aje@valkosipuli.retiisi.org.uk>
In-Reply-To: <20190709182500.3x544axnrgy72aje@valkosipuli.retiisi.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=lolivei@synopsys.com; 
x-originating-ip: [83.174.63.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 90b35444-ce15-4c0b-1b0a-08d705204b47
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MN2PR12MB3982;
x-ms-traffictypediagnostic: MN2PR12MB3982:
x-microsoft-antispam-prvs: <MN2PR12MB3982F00C0519618AC073687ACBF00@MN2PR12MB3982.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(136003)(39860400002)(376002)(366004)(396003)(199004)(189003)(54534003)(86362001)(7736002)(8936002)(66946007)(66446008)(76116006)(14454004)(81166006)(305945005)(66556008)(8676002)(81156014)(64756008)(110136005)(53936002)(316002)(446003)(25786009)(54906003)(68736007)(66476007)(9686003)(11346002)(71190400001)(476003)(71200400001)(6436002)(52536014)(5660300002)(4326008)(55016002)(2906002)(7696005)(6506007)(74316002)(76176011)(14444005)(486006)(478600001)(26005)(33656002)(256004)(6636002)(186003)(6116002)(66066001)(107886003)(6246003)(3846002)(99286004)(102836004)(229853002)(7416002);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR12MB3982;H:MN2PR12MB3710.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vtQQN/05UAC7yE+38plHnc+XVJyEscyDDNYW/BmCEw6Pa2uw6VcMPT3fZoENghC+y6r7U6EZsss3Bx2Z81tzDbVnEQiVW2Fpil7EkrvgTWnIlr3Cn7lUXN7hErHDVzanxo2jd+qbK8LWSU7nSVG/Ycz1mX/Ai4ez6nwD2SArrCV6kdofWnSDioZuMmXatOML/kbweWYhdxoYQoR5/fCNEp2SkkJVJEH4KsfjvARISmLiOhzcYMM/UXfFsrh4p04Lrxer4RJm6wRkMGIWl3hr0GsG+iFzPSSfGw7lVGcuSme86kAjPc+npJiG6MEvc+pec/jCneRmaIQWsXSBXKmXuxJG+fifj3A0kfQH643S6nzlKsdbXO44F5nnIuvFc7u77zk/+jLFfywWxZj9o00gbTfUSPkBw6dj65pdyURziHc=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b35444-ce15-4c0b-1b0a-08d705204b47
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 10:20:55.4878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lolivei@synopsys.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3982
X-OriginatorOrg: synopsys.com
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

From: Sakari Ailus <sakari.ailus@iki.fi>
Date: Tue, Jul 09, 2019 at 19:25:00

> Hi Luis,
>=20
> On Mon, Jul 08, 2019 at 03:21:50PM +0000, Luis de Oliveira wrote:
> > Hi Sakari,
> >=20
> > Thank you for your feedback.
> > I have my comments inline.
> >=20
> > From: Sakari Ailus <sakari.ailus@iki.fi>
> > Date: Fri, Jun 28, 2019 at 15:13:26
> >=20
> > > Hi Luis,
> > >=20
> > > Thank you for the patchset.
> > >=20
> > > On Tue, Jun 11, 2019 at 09:20:50PM +0200, Luis Oliveira wrote:
> > > > From: Luis Oliveira <lolivei@synopsys.com>
> > > >=20
> > > > Add bindings for Synopsys DesignWare MIPI CSI-2 host.
> > > >=20
> > > > Signed-off-by: Luis Oliveira <lolivei@synopsys.com>
> > > > ---
> > > > Changelog
> > > > v3-v4
> > > > - remove "plat" from the block name @rob @laurent
> > > > - remove "phy-names" when single-entry @rob
> > > > - remove "snps,output-type" -> went to the driver config @laurent
> > > >=20
> > > >  .../devicetree/bindings/media/snps,dw-csi.txt      | 41 ++++++++++=
++++++++++++
> > > >  1 file changed, 41 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/media/snps,dw=
-csi.txt
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/media/snps,dw-csi.tx=
t b/Documentation/devicetree/bindings/media/snps,dw-csi.txt
> > > > new file mode 100644
> > > > index 0000000..613b7f9
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/snps,dw-csi.txt
> > > > @@ -0,0 +1,41 @@
> > > > +Synopsys DesignWare CSI-2 Host controller
> > > > +
> > > > +Description
> > > > +-----------
> > > > +
> > > > +This HW block is used to receive image coming from an MIPI CSI-2 c=
ompatible
> > > > +camera.
> > > > +
> > > > +Required properties:
> > > > +- compatible		: shall be "snps,dw-csi"
> > > > +- reg			: physical base address and size of the device memory
> > > > +			  mapped registers;
> > > > +- interrupts		: DW CSI-2 Host interrupts
> > > > +- phys			: List of one PHY specifier (as defined in
> > > > +			  Documentation/devicetree/bindings/phy/phy-bindings.txt).
> > > > +			  This PHY is a MIPI DPHY working in RX mode.
> > > > +- resets		: Reference to a reset controller (optional)
> > > > +
> > > > +The per-board settings:
> > > > + - port sub-node describing a single endpoint connected to the cam=
era as
> > > > +   described in video-interfaces.txt[1].
> > >=20
> > > Which endpoint properties in video-interfaces.txt are relevant for th=
e
> > > hardware? Which values may they have?
> > >=20
> >=20
> > Currently I'm using only two properties "data-lanes" and "bus-width", b=
ut=20
> > I have plans to add blanking info also.
> > I will add more info.
>=20
> Isn't blanking defined by what the transmitter seneds? Or do you have
> hardware limitations on the receiver side?
>=20

When we use this IP in prototyping we configure blanking at the receiver=20
side.
Some cameras don't have blanking configuration capabilities so we=20
configure it on the RX side.

> I've only heard of one such case before, and it was a very old parallel
> receiver.
>=20
> If you have a CSI-2 receiver, bus-width isn't relevant --- it's for paral=
le
> interfaces only. Please add data-lanes to required endpoint properties.
>=20

I used bus-width property in the Synopsys IPI (Image Pixel Interface)=20
that enables direct video stream access.
This interface is an output that can be 16-bit or 48-bit, that's why I=20
used bus-width property.

> --=20
> Regards,
>=20
> Sakari Ailus

Thank you,
Luis

