Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C971B762AB
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2019 11:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbfGZJu3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jul 2019 05:50:29 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.47.102]:42916 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725978AbfGZJu3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jul 2019 05:50:29 -0400
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com [10.12.135.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 459C9C0B82;
        Fri, 26 Jul 2019 09:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1564134628; bh=btrGY5b6k0EcBhQO75MnN7NWfkcdiISnPN0tpzdYprU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=i+/BWKDQ8slZAPZxDTqYgZ5Sy6hRyQINKBJjepU33EEzYmgzm9acc9/3T9FnVGOiJ
         1JaAgde34AjRK7RbGS5451Lqyq6OsuMSXe5hidQDOthb8kR2B6Ftz8MF5BgKrY31Jm
         Y8t1ZkDt7ipOwt6/u+WQUb00eh6L0+gz4FpVc/F9B/pR3W89p9OLHERRKXxVD+wZYl
         42D4OId4pt9ZuH8Q5J50ZvDBh36k6/PRzN+ITKj+z63jNpVs3FaLoyFGUFFdaCJr9t
         vvp1ZmmXPtIFGXtdVdW+QVIn3BPw2xM0nZ9KytzVhZkqhecVMdOoMAYRQ17AADkR64
         ZqX+hYqMG541w==
Received: from US01WEHTC2.internal.synopsys.com (us01wehtc2.internal.synopsys.com [10.12.239.237])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 1BDC6A00DB;
        Fri, 26 Jul 2019 09:50:25 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 26 Jul 2019 02:50:14 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 26 Jul 2019 02:50:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KQoDkL0x4Zl7Oruq8Ej9X+nYEyenktTx+ZInJJcea1Q2vIxJ1YA8BlGKsjIoLKEBo0oRRnXemQBBnm8qsBU/37y79pUmRIg85OJVjZacr98+YWYK6+HBhVdEsZeL6coGiiU8XSSrk5Rr+yaIVnH8cli839ZBmXsXYT1ZNs2cz5vcy5582aZ7uGjMbPpW44ejkK8C998cVK67mltWBBwE1XEx4qWZqGSLI/YXEQw+QwBtWkhBH7AvUuN6ywxZwyBdSrYW1v+5pI/PVSOctL5o3Yl+JfjO6xCwtIhC5SQYOJ9LKHbkIWAn5VhzYmVD2czsiE5Gyc8DMl8ivX+YTf3l+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85gcIwOO0iMKNlwtpth6fSBVLub+xSeor4aVo47d/3Y=;
 b=TuCBqoO9A2f9ILARzxuw1pDAQVL1aq184DkFwLChpVxOU2MOEgzzlxS+ce4PI7M3xl9IhSCRNK/rOgmdg6i2lUB8CjX/1ohPSywCYA/H+lJGEu+/WaXZpjp9A/KOfUgigmXIeVYzhwPmbIZs/CXPxvyH3qIg6Df+QkebSIBycmGhdttReOf5BJFodFIgMFVzXDZTdVF+45aMWMFTCGHDqkOUWEIyr4f/PydJpMAjh4x9DB2xK8JrIrBm3W8Nbi8sdFi6MLaDztyjHpa1Agsnvx+5KPRS2p5lEemE3Xao37WbrIC/bFEfmB+7zaslO7cjLLOg6v99ip5yauN5e26arw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=synopsys.com;dmarc=pass action=none
 header.from=synopsys.com;dkim=pass header.d=synopsys.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85gcIwOO0iMKNlwtpth6fSBVLub+xSeor4aVo47d/3Y=;
 b=Sl2IaYeOCpZJcfbVlw76BlsDm7BK0m9KAmqb3mRJfZRoeZHCQ7ECtaFoPQe7EdZFm1oOLVpZJygkMMay9mSmRh6g05ZFTeP031WmARnNgPYRa4KDNQCo7dzHc6ySHR9LtT+Ihm1JiG3Dx/knI5HiRy1T8Flx7XGDIiLrZU9vlao=
Received: from BY5PR12MB3699.namprd12.prod.outlook.com (10.255.139.144) by
 BY5PR12MB4163.namprd12.prod.outlook.com (52.135.52.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Fri, 26 Jul 2019 09:50:13 +0000
Received: from BY5PR12MB3699.namprd12.prod.outlook.com
 ([fe80::f9c9:7183:3ee0:495b]) by BY5PR12MB3699.namprd12.prod.outlook.com
 ([fe80::f9c9:7183:3ee0:495b%5]) with mapi id 15.20.2094.013; Fri, 26 Jul 2019
 09:50:12 +0000
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
Thread-Index: AQHVIIrZEAgDFXEPAEq65DEFTPH6j6axNjgAgA/JhCCAAcZqAIABB4hwgBg47YCAAOY2kA==
Date:   Fri, 26 Jul 2019 09:50:12 +0000
Message-ID: <BY5PR12MB3699CA09F7CDB0827434F786CBC00@BY5PR12MB3699.namprd12.prod.outlook.com>
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
 <1560280855-18085-2-git-send-email-luis.oliveira@synopsys.com>
 <20190628141326.swgl3kg4fj5pmlqx@valkosipuli.retiisi.org.uk>
 <MN2PR12MB37109D7AADCE4823CB458CB9CBF60@MN2PR12MB3710.namprd12.prod.outlook.com>
 <20190709182500.3x544axnrgy72aje@valkosipuli.retiisi.org.uk>
 <MN2PR12MB371026A6547B449EEC0439B1CBF00@MN2PR12MB3710.namprd12.prod.outlook.com>
 <20190725200211.GK1263@valkosipuli.retiisi.org.uk>
In-Reply-To: <20190725200211.GK1263@valkosipuli.retiisi.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=lolivei@synopsys.com; 
x-originating-ip: [83.174.63.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1135e944-4f7e-41c9-991e-08d711aea795
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BY5PR12MB4163;
x-ms-traffictypediagnostic: BY5PR12MB4163:
x-microsoft-antispam-prvs: <BY5PR12MB4163A715716985E42B67190CCBC00@BY5PR12MB4163.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(366004)(346002)(136003)(39850400004)(396003)(54534003)(199004)(189003)(71200400001)(33656002)(110136005)(486006)(54906003)(71190400001)(99286004)(316002)(14454004)(8676002)(68736007)(66066001)(81156014)(81166006)(6116002)(256004)(476003)(55016002)(76116006)(66476007)(6636002)(26005)(86362001)(305945005)(7736002)(446003)(11346002)(229853002)(7416002)(74316002)(14444005)(3846002)(7696005)(478600001)(9686003)(4326008)(25786009)(186003)(6246003)(107886003)(66946007)(66556008)(102836004)(5660300002)(2906002)(6436002)(6506007)(8936002)(66446008)(64756008)(76176011)(52536014)(53936002);DIR:OUT;SFP:1102;SCL:1;SRVR:BY5PR12MB4163;H:BY5PR12MB3699.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YpFMJJwukjPehaQzeJl1SOSo15ErKH5XQrqWGiK8iz/mIJtaXr99KPp1IEPFn8z2phXTnLJqLum4306cZYpVVkGB4FIijenvr6qEcyiZJjZJbXk6izd3IS0F8yD0dVLSg9dFgs2zbtPTe9XInTkB0OkPQ1lvbjPV0rObBeMqP0jY1EhQv+yzQSvm/0SZ58C7R2bNBOQRCz5AWoJWM7Txv7Z2zGeBQVcW6+vMEOspFXvZKcfwLmESS6ztiSpHTbn5x62f0XFlVe5Ej15iEvglHpejx/gmS6i1nhylYUA4aVVCDkLXR0ByQtkPhTCZRFlIZC/iiXMry6RtvauXhA+ieDPT5Jp3GaioQcj6Cj2qNnkM+BoczUddKvtUb6b5WxgZuBzkPl0LH28mhVcAF+kC8p8LtYqpLRkW+iSBZxtZUpI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1135e944-4f7e-41c9-991e-08d711aea795
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 09:50:12.6667
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lolivei@synopsys.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4163
X-OriginatorOrg: synopsys.com
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the review, my answers inline.

> From: Sakari Ailus <sakari.ailus@iki.fi>
> Date: Thu, Jul 25, 2019 at 21:02:11
>
> Hi Luis,
>=20
> On Wed, Jul 10, 2019 at 10:20:55AM +0000, Luis de Oliveira wrote:
> > Hi Sakari,
> >=20
> > From: Sakari Ailus <sakari.ailus@iki.fi>
> > Date: Tue, Jul 09, 2019 at 19:25:00
> >=20
> > > Hi Luis,
> > >=20
> > > On Mon, Jul 08, 2019 at 03:21:50PM +0000, Luis de Oliveira wrote:
> > > > Hi Sakari,
> > > >=20
> > > > Thank you for your feedback.
> > > > I have my comments inline.
> > > >=20
> > > > From: Sakari Ailus <sakari.ailus@iki.fi>
> > > > Date: Fri, Jun 28, 2019 at 15:13:26
> > > >=20
> > > > > Hi Luis,
> > > > >=20
> > > > > Thank you for the patchset.
> > > > >=20
> > > > > On Tue, Jun 11, 2019 at 09:20:50PM +0200, Luis Oliveira wrote:
> > > > > > From: Luis Oliveira <lolivei@synopsys.com>
> > > > > >=20
> > > > > > Add bindings for Synopsys DesignWare MIPI CSI-2 host.
> > > > > >=20
> > > > > > Signed-off-by: Luis Oliveira <lolivei@synopsys.com>
> > > > > > ---
> > > > > > Changelog
> > > > > > v3-v4
> > > > > > - remove "plat" from the block name @rob @laurent
> > > > > > - remove "phy-names" when single-entry @rob
> > > > > > - remove "snps,output-type" -> went to the driver config @laure=
nt
> > > > > >=20
> > > > > >  .../devicetree/bindings/media/snps,dw-csi.txt      | 41 ++++++=
++++++++++++++++
> > > > > >  1 file changed, 41 insertions(+)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/media/snp=
s,dw-csi.txt
> > > > > >=20
> > > > > > diff --git a/Documentation/devicetree/bindings/media/snps,dw-cs=
i.txt b/Documentation/devicetree/bindings/media/snps,dw-csi.txt
> > > > > > new file mode 100644
> > > > > > index 0000000..613b7f9
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/media/snps,dw-csi.txt
> > > > > > @@ -0,0 +1,41 @@
> > > > > > +Synopsys DesignWare CSI-2 Host controller
> > > > > > +
> > > > > > +Description
> > > > > > +-----------
> > > > > > +
> > > > > > +This HW block is used to receive image coming from an MIPI CSI=
-2 compatible
> > > > > > +camera.
> > > > > > +
> > > > > > +Required properties:
> > > > > > +- compatible		: shall be "snps,dw-csi"
> > > > > > +- reg			: physical base address and size of the device memory
> > > > > > +			  mapped registers;
> > > > > > +- interrupts		: DW CSI-2 Host interrupts
> > > > > > +- phys			: List of one PHY specifier (as defined in
> > > > > > +			  Documentation/devicetree/bindings/phy/phy-bindings.txt).
> > > > > > +			  This PHY is a MIPI DPHY working in RX mode.
> > > > > > +- resets		: Reference to a reset controller (optional)
> > > > > > +
> > > > > > +The per-board settings:
> > > > > > + - port sub-node describing a single endpoint connected to the=
 camera as
> > > > > > +   described in video-interfaces.txt[1].
> > > > >=20
> > > > > Which endpoint properties in video-interfaces.txt are relevant fo=
r the
> > > > > hardware? Which values may they have?
> > > > >=20
> > > >=20
> > > > Currently I'm using only two properties "data-lanes" and "bus-width=
", but=20
> > > > I have plans to add blanking info also.
> > > > I will add more info.
> > >=20
> > > Isn't blanking defined by what the transmitter seneds? Or do you have
> > > hardware limitations on the receiver side?
> > >=20
> >=20
> > When we use this IP in prototyping we configure blanking at the receive=
r=20
> > side.
> > Some cameras don't have blanking configuration capabilities so we=20
> > configure it on the RX side.
>=20
> I haven't come across a CSI-2 connected camera without some kind of
> blanking configuration capabilities. Even if there was one, you couldn't
> configure blanking from the receiver side.
>=20
> Please document that the data-lanes property is required, and which value=
s
> are possible.
>=20

Ok, I will add the data-lanes property to the Documentation.

> >=20
> > > I've only heard of one such case before, and it was a very old parall=
el
> > > receiver.
> > >=20
> > > If you have a CSI-2 receiver, bus-width isn't relevant --- it's for p=
aralle
> > > interfaces only. Please add data-lanes to required endpoint propertie=
s.
> > >=20
> >=20
> > I used bus-width property in the Synopsys IPI (Image Pixel Interface)=20
> > that enables direct video stream access.
> > This interface is an output that can be 16-bit or 48-bit, that's why I=
=20
> > used bus-width property.
>=20
> Does this device write the image data to system memory, or is it another
> device? If there's another one, then you should probably have another por=
t
> to describe that connection.
>=20

Yes, it is another. I can add that connection port also.=20


> --=20
> Kind regards,
>=20
> Sakari Ailus

Thank you,

Luis

