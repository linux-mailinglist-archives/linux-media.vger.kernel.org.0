Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4453463963
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 18:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbfGIQ3A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jul 2019 12:29:00 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.61.142]:46274 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726133AbfGIQ3A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Jul 2019 12:29:00 -0400
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com [10.13.135.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 308A7C0AB7;
        Tue,  9 Jul 2019 16:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1562689739; bh=2IhwzNuNB6HXD+1HYQxA9ktwRDmurQSfRhGM3RNPKdI=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=hs5puVX82OrGjg6Tik00A/iLL2OkmsqdJAP1ChnVYbDxUWkQeWqrMxw7vq1wXxVLw
         mXKP30EPEaqO1gjvOi9oPIOvANn7oCd9ReGYmmAzjwZibdJUDpP1YI189zJGMlRPtD
         2QPe/565YJ9SgXvWFBvCKRi6MCdVhON2UgC4NWnEs1msbC05fjp/pIZRqOPIBnb5lB
         C/6k/D/39qUT2j6ubMPmiSTnkNJMepVeNl4IL/CcCh8KK5mxns5E57NIUq3mZG2tlQ
         CEi8UyLJi04kKVXkRqeuQqESO2cWkTMlxgMabCVk/5lnFReEe0jwQvAVFRxybzKRoh
         lyGT7E/LKz3Aw==
Received: from US01WXQAHTC1.internal.synopsys.com (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id E3806A023B;
        Tue,  9 Jul 2019 16:28:56 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 9 Jul 2019 09:28:56 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 9 Jul 2019 09:28:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jHodtPCKW4lG5ec5ctvQo8TDuZobDBFlBE5m3AbeBk=;
 b=r3DDkcFtVvYn6K8CJTP7dMYfLCn8n+/xuNJ1z4KZCNR02BBPE6h5S4f+KuXLK9zMBC48BdMZJ8cCn5RQ8BAMB180X++Y4jpqbAG6fIrbyGiQhxqvItfbFDD6DS4RJ77iAC/agBOi6PGnVHX0zF6N4+pchy3pe2iYtOR5y5ZhXNk=
Received: from MN2PR12MB3710.namprd12.prod.outlook.com (10.255.236.23) by
 MN2PR12MB4013.namprd12.prod.outlook.com (10.255.239.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Tue, 9 Jul 2019 16:28:53 +0000
Received: from MN2PR12MB3710.namprd12.prod.outlook.com
 ([fe80::8025:feba:c9cf:ba9f]) by MN2PR12MB3710.namprd12.prod.outlook.com
 ([fe80::8025:feba:c9cf:ba9f%3]) with mapi id 15.20.2052.020; Tue, 9 Jul 2019
 16:28:53 +0000
From:   Luis de Oliveira <Luis.Oliveira@synopsys.com>
To:     Rob Herring <robh@kernel.org>,
        Luis Oliveira <Luis.Oliveira@synopsys.com>
CC:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>,
        "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
        "paulmck@linux.ibm.com" <paulmck@linux.ibm.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "kishon@ti.com" <kishon@ti.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>
Subject: RE: [v4 4/6] dt-bindings: phy: Document the Synopsys MIPI DPHY Rx
 bindings
Thread-Topic: [v4 4/6] dt-bindings: phy: Document the Synopsys MIPI DPHY Rx
 bindings
Thread-Index: AQHVIIrbGpD0veQjy0+HLtFBwQGIX6bCgbIAgAAhX5A=
Date:   Tue, 9 Jul 2019 16:28:53 +0000
Message-ID: <MN2PR12MB371024C55C5B48A91EECE7A0CBF10@MN2PR12MB3710.namprd12.prod.outlook.com>
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
 <1560280855-18085-5-git-send-email-luis.oliveira@synopsys.com>
 <20190709142000.GA995@bogus>
In-Reply-To: <20190709142000.GA995@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=lolivei@synopsys.com; 
x-originating-ip: [188.83.227.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a2686e4-48cc-4859-2bfb-08d7048a8852
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MN2PR12MB4013;
x-ms-traffictypediagnostic: MN2PR12MB4013:
x-microsoft-antispam-prvs: <MN2PR12MB4013A6C8F80CFB4E691A5C88CBF10@MN2PR12MB4013.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(376002)(346002)(366004)(39860400002)(396003)(199004)(189003)(54534003)(81156014)(81166006)(68736007)(486006)(66556008)(66476007)(64756008)(256004)(110136005)(54906003)(76176011)(8676002)(66446008)(6506007)(5660300002)(73956011)(4326008)(66946007)(9686003)(76116006)(14454004)(2906002)(8936002)(476003)(508600001)(6116002)(3846002)(6636002)(53936002)(33656002)(11346002)(229853002)(71190400001)(6246003)(25786009)(74316002)(26005)(316002)(86362001)(71200400001)(186003)(107886003)(55016002)(99286004)(52536014)(102836004)(6436002)(66066001)(305945005)(7416002)(7736002)(446003)(7696005);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR12MB4013;H:MN2PR12MB3710.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hHLlRHvfWQm3B68peU+kjdYwsfqTcmqnGJB/4O9hQCPtg9R8SUWvO7WMLIilnLgz+0Z47IPbghaRYdlIfx3f59KkItyJ4fMWJOU8Mg5DsiufHAw6N4m6i3RWxC9VKH8foXO25YUx3KjXZqy9wUaB9eqXoNw/sb3ayMb+lNE0vKSJBeJ8Yf7KkKn9jLUXOzGH4JA0hnimSHSVZMUarcTwg/wqj8om/xW0gOYcaMDXMnwSy4Sc3LVibpQoDmLrT4sXJn2kHcUUMXpKfDD5EH1skJeu//uslMK6cvELUPocAP4EK9rFMrSevNsz2Nv3gTegoI7/s7Ieqe90mhm/jkZWMg7JS0KN18KdXXpt/fkZEHFniMdNIiIOnmnx/iEsHo+Ttn2jUskCHmKBPFmrRl70BOsoag1AZhZ6l8TN+IUWsIs=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a2686e4-48cc-4859-2bfb-08d7048a8852
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 16:28:53.3660
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lolivei@synopsys.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4013
X-OriginatorOrg: synopsys.com
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Rob Herring <robh@kernel.org>
Date: Tue, Jul 09, 2019 at 15:20:00

> On Tue, Jun 11, 2019 at 09:20:53PM +0200, Luis Oliveira wrote:
> > Add device-tree bindings documentation for SNPS DesignWare MIPI D-PHY i=
n
> > RX mode.
> >=20
> > Signed-off-by: Luis Oliveira <luis.oliveira@synopsys.com>
> > ---
> > Changelog
> > v3-v4
> > - @Laurent I know I told you I could remove the snps,dphy-frequency on =
V3 but
> >   it is really useful for me here. I removed all other the proprietary
> >   properties except this one. Do you still think it must be removed?
> > - Frequency units @Rob
>=20
> Frequency units means append '-khz' to the property name. That also=20
> makes the 'frequency' part redundant, so maybe name it more around what=20
> the frequency is. The frequency for what?
>=20
> Rob
>=20

This is the D-PHY high speed frequency configuration that corresponds to=20
the high speed data transfer of the bus.
Basically is the transmission speed per lane.
Do you think I can use "link-frequencies" (present in=20
video-interfaces.txt) with one frequency?


> >=20
> >  .../devicetree/bindings/phy/snps,dw-dphy-rx.txt    | 29 ++++++++++++++=
++++++++
> >  1 file changed, 29 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/snps,dw-dphy-=
rx.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/phy/snps,dw-dphy-rx.txt =
b/Documentation/devicetree/bindings/phy/snps,dw-dphy-rx.txt
> > new file mode 100644
> > index 0000000..50603e6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/snps,dw-dphy-rx.txt
> > @@ -0,0 +1,29 @@
> > +Synopsys DesignWare MIPI Rx D-PHY block details
> > +
> > +Description
> > +-----------
> > +
> > +The Synopsys MIPI D-PHY controller supports MIPI-DPHY in receiver mode=
.
> > +Please refer to phy-bindings.txt for more information.
> > +
> > +Required properties:
> > +- compatible		: Shall be "snps,dw-dphy-rx".
> > +- #phy-cells		: Must be 1.
> > +- bus-width		: Size of the test interface data bus (8 bits->8 or
> > +			  12bits->12).
> > +- snps,dphy-frequency	: Frequency at which D-PHY should start, configu=
rable.
> > +			  Check Synopsys databook. (-kHz)
> > +- reg			: Test interface register. This correspondes to the
> > +			  physical base address of the controller and size of
> > +			  the device memory mapped registers; Check Synopsys
> > +			  databook.
> > +
> > +Example:
> > +
> > +	mipi_dphy_rx1: dphy@d00003040 {
> > +		compatible =3D "snps,dw-dphy-rx";
> > +		#phy-cells =3D <1>;
> > +		bus-width =3D <12>;
> > +		snps,dphy-frequency =3D <300000>;
> > +		reg =3D <0xd0003040 0x20>;
> > +	};
> > --=20
> > 2.7.4
> >=20

Thank you Rob,
Luis

