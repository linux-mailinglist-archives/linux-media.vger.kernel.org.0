Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95DCD624C2
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2019 17:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391288AbfGHPpr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jul 2019 11:45:47 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.61.142]:39862 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387856AbfGHPV7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Jul 2019 11:21:59 -0400
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com [10.13.135.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 436DDC128B;
        Mon,  8 Jul 2019 15:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1562599318; bh=SJGiGY8mo54iZifF0dY59tUKAPDrjB089FRLCoZl11k=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=avRCNku1IIvPu0FGl3/m8sqv3BjUlsGQcJGHDUccpvo9JlJfNYx6FS7dKhDL5gIyK
         F/GWyYeZS/hmwfxkz5D2Y5ZVTHeMAEFtU1CyupQ/DsxVWy0RxDGG7x3gdOkOFdMW+7
         G87W5ngh6vZyPVUAr/ng42uwZpGRgnxrfuiIHfTYskUGfivegyo5D5HAcs9wB+iSr3
         lhmQIJXIBostedVcR4asFJicW6nRLPr9HrdooV7VnzWIYe8AfeLScvKziSROTipaGi
         GPXSXv0fcTgTFJULZ0Cpm59+kOC9dPE7lhlyskGfFzVskDj7T3FeuUZN73zOsFB3K7
         ON2JCa5zfAnkg==
Received: from US01WEHTC2.internal.synopsys.com (us01wehtc2.internal.synopsys.com [10.12.239.237])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 2FDE3A023B;
        Mon,  8 Jul 2019 15:21:54 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 8 Jul 2019 08:21:54 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 8 Jul 2019 08:21:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLDhmtNxRC4cz+iepvzmvSyotoLklznICVEPsbKJ2rQ=;
 b=jsuOKxjR9K5R7ifFy+Xih0GVpYDlIOqSuLZpXL0zG+lg/pBTXLvhj1MPdQmYC0aEDruzezrKjfrhEH4sXecG2U6ORrcS3+mCDWe/fC1EKxrGyEPRZda5Mz2lTu50hTu+km9NXQZpRmOaVpLiVsr7cC8NIydEsQqC7DADdtI08gg=
Received: from MN2PR12MB3710.namprd12.prod.outlook.com (10.255.236.23) by
 MN2PR12MB3021.namprd12.prod.outlook.com (20.178.240.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Mon, 8 Jul 2019 15:21:50 +0000
Received: from MN2PR12MB3710.namprd12.prod.outlook.com
 ([fe80::8025:feba:c9cf:ba9f]) by MN2PR12MB3710.namprd12.prod.outlook.com
 ([fe80::8025:feba:c9cf:ba9f%3]) with mapi id 15.20.2052.020; Mon, 8 Jul 2019
 15:21:50 +0000
From:   Luis de Oliveira <Luis.Oliveira@synopsys.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Luis Oliveira <Luis.Oliveira@synopsys.com>
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
Thread-Index: AQHVIIrZEAgDFXEPAEq65DEFTPH6j6axNjgAgA/JhCA=
Date:   Mon, 8 Jul 2019 15:21:50 +0000
Message-ID: <MN2PR12MB37109D7AADCE4823CB458CB9CBF60@MN2PR12MB3710.namprd12.prod.outlook.com>
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
 <1560280855-18085-2-git-send-email-luis.oliveira@synopsys.com>
 <20190628141326.swgl3kg4fj5pmlqx@valkosipuli.retiisi.org.uk>
In-Reply-To: <20190628141326.swgl3kg4fj5pmlqx@valkosipuli.retiisi.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=lolivei@synopsys.com; 
x-originating-ip: [83.174.63.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 22fefc13-fe9d-4997-b628-08d703b80004
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MN2PR12MB3021;
x-ms-traffictypediagnostic: MN2PR12MB3021:
x-microsoft-antispam-prvs: <MN2PR12MB3021F195389780B2C9F3E4EDCBF60@MN2PR12MB3021.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00922518D8
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(346002)(39860400002)(376002)(396003)(199004)(189003)(54534003)(68736007)(229853002)(9686003)(6636002)(53936002)(316002)(14454004)(2906002)(86362001)(6506007)(25786009)(74316002)(6436002)(55016002)(4326008)(3846002)(110136005)(81166006)(81156014)(8676002)(5660300002)(102836004)(446003)(76116006)(66066001)(66476007)(64756008)(66446008)(73956011)(66946007)(71200400001)(66556008)(52536014)(76176011)(26005)(476003)(71190400001)(11346002)(7696005)(7736002)(478600001)(6116002)(486006)(7416002)(305945005)(6246003)(54906003)(107886003)(186003)(8936002)(256004)(99286004)(33656002);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR12MB3021;H:MN2PR12MB3710.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Tt9EAYzkcC7lsAzjstxk4BFEtHmm+9gh+Xfnyv675/n1Twidmk2XvCz/ngbJt1fK/bvUYeGtySSBb1ZBKz7MywaUdZh0eUzOXZ6du20fklZavlWE2WiM2NCt+J1z+xSHLAozR+RNUdcqutWunIDUYoU9r/IBsf9djV+n/UcOQcF00n/IwxRkJfzW8/924OnjXuNrUsFqxa283fF6Qz00VTr73EgxaJmdMrc+VSpUJlrvYQ0isYGXlk+6cor7uw6IZz/BOz3qXNx8WyPkisdxpXye57tD8g1kSENbszcthcYTuXugnAR6vKF/UfI3Cw2OHUu7XGBM/cXGkAkSXjqpZ66kEd0ZqOFmMm69SlkbKD8n+OvQYHdiicbJx5KfUgRSOOVdpuqhLNcaUXwPFjerGA3+3knfzFqPG/388AmWlEc=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 22fefc13-fe9d-4997-b628-08d703b80004
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2019 15:21:50.2980
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lolivei@synopsys.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3021
X-OriginatorOrg: synopsys.com
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for your feedback.
I have my comments inline.

From: Sakari Ailus <sakari.ailus@iki.fi>
Date: Fri, Jun 28, 2019 at 15:13:26

> Hi Luis,
>=20
> Thank you for the patchset.
>=20
> On Tue, Jun 11, 2019 at 09:20:50PM +0200, Luis Oliveira wrote:
> > From: Luis Oliveira <lolivei@synopsys.com>
> >=20
> > Add bindings for Synopsys DesignWare MIPI CSI-2 host.
> >=20
> > Signed-off-by: Luis Oliveira <lolivei@synopsys.com>
> > ---
> > Changelog
> > v3-v4
> > - remove "plat" from the block name @rob @laurent
> > - remove "phy-names" when single-entry @rob
> > - remove "snps,output-type" -> went to the driver config @laurent
> >=20
> >  .../devicetree/bindings/media/snps,dw-csi.txt      | 41 ++++++++++++++=
++++++++
> >  1 file changed, 41 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/snps,dw-csi=
.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/snps,dw-csi.txt b/=
Documentation/devicetree/bindings/media/snps,dw-csi.txt
> > new file mode 100644
> > index 0000000..613b7f9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/snps,dw-csi.txt
> > @@ -0,0 +1,41 @@
> > +Synopsys DesignWare CSI-2 Host controller
> > +
> > +Description
> > +-----------
> > +
> > +This HW block is used to receive image coming from an MIPI CSI-2 compa=
tible
> > +camera.
> > +
> > +Required properties:
> > +- compatible		: shall be "snps,dw-csi"
> > +- reg			: physical base address and size of the device memory
> > +			  mapped registers;
> > +- interrupts		: DW CSI-2 Host interrupts
> > +- phys			: List of one PHY specifier (as defined in
> > +			  Documentation/devicetree/bindings/phy/phy-bindings.txt).
> > +			  This PHY is a MIPI DPHY working in RX mode.
> > +- resets		: Reference to a reset controller (optional)
> > +
> > +The per-board settings:
> > + - port sub-node describing a single endpoint connected to the camera =
as
> > +   described in video-interfaces.txt[1].
>=20
> Which endpoint properties in video-interfaces.txt are relevant for the
> hardware? Which values may they have?
>=20

Currently I'm using only two properties "data-lanes" and "bus-width", but=20
I have plans to add blanking info also.
I will add more info.

> > +
> > +Example:
> > +
> > +	csi2: csi2@3000 {
> > +		compatible =3D "snps,dw-csi";
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		reg =3D < 0x03000 0x7FF>;
>=20
> reg =3D <0x03000 0x7FF>;

Yes, I've missed that.

>=20
> > +		phys =3D <&mipi_dphy_rx>;
> > +		resets =3D <&dw_rst 1>;
> > +		interrupts =3D <2>;
> > +
> > +		port@0 {
> > +			reg =3D <0>;
>=20
> You can drop "@0" and the reg property.

Ok thank you.
>=20
> > +			csi_ep1: endpoint {
> > +				remote-endpoint =3D <&camera_1>;
> > +				data-lanes =3D <1 2>;
> > +			};
> > +		};
> > +	};
>=20
> --=20
> Kind regards,
>=20
> Sakari Ailus

Best regards,
Luis

