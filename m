Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE42589A3C
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 11:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727773AbfHLJpU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 05:45:20 -0400
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]:51062 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727570AbfHLJpT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 05:45:19 -0400
Received: from mailhost.synopsys.com (dc2-mailhost1.synopsys.com [10.12.135.161])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CDE17C2143;
        Mon, 12 Aug 2019 09:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1565603119; bh=5M20aLwwE0S58trhDLEhLTGPI5PpcsoKXDaUPfUNc8Y=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=F0QhhuwKywf5xY2E6b/jhnTjnxU6AEk9hLnoFJa9TVe0zZUkv3wVAuJTrw9ZgANOI
         wMsxMZM+3Vl4xvpmLcdK82bpzIOiQtvgA1nBiSTzf+Nkd3cNw2fm7avbk4jn2eTaSp
         +BFuDYwtywMS/omQPOwNgFnmyv90XUGLLBFqCdGKPKzJESmjx7NxBn9s0vbFVLz017
         xPczYinO5oC39n7QOV9Ng7urDxVEc/LBqWhQolv6gMUUfZy5Iimexlf/KekBPYMSpU
         Sf07BfxlGkc5HUgnWhLg7jHoQ8ucbjW4EvQgoQ4VAFWpmS84DbapZyW7mDvyXQfX32
         N/DMfdyrXj4vQ==
Received: from us01wehtc1.internal.synopsys.com (us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 72888A008B;
        Mon, 12 Aug 2019 09:45:17 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 us01wehtc1.internal.synopsys.com (10.12.239.231) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 12 Aug 2019 02:45:16 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 12 Aug 2019 02:45:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gsU0sjbS9/8ydqKsapPrU9gMzr+lI8RfH1RQcYKkWaVRDbrHznYTyQL8nuk5ZXWLM/O3nZ4FjT6VSNRYf4uM6yKRkw3XyOOfVhk2M3VFx99viF/3rrGBQWmw6U0/nXdtd5BNkvUJu465RUk/Qt6A1ReVq6MRgbqEnyqKkfHsxhZD+LG/w+QBJgeLOjdvmQX/eOlRQm57gCQml3gc5bPZluXVIARgA2b1BVOKJZa8SJTqEZYGUqMN3JZTEOJWAfTvvMHmI97aGJsh4c/LmjAGZtHNNc2rqyj216DMGASZa2Rl4g5fczA6/5Hvsv6CJJhWzdtIfsATHxRUuv9cA2Txgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5M20aLwwE0S58trhDLEhLTGPI5PpcsoKXDaUPfUNc8Y=;
 b=DZD2izbT72/fCZfRcIPJWlhVZmsxDiAAmfN1MSBM+0bhpu9sU7Dbv9FGnuiNEXhCIO2/LCCBvb9h+2/23OoDwgyO+QE0WYcYhH1D9qrc9Tu275RKSWuGv3vnhDEWSXgRB68ZgyOEKL6+BaH+LK/GIgT9JcFyWCP7mpH8idYg+6c0dRSF6+rEQwgocz/Xb2TcMtzK0fYlPNmyp3YUetE0c8DYtGVR3KmP8//QKMdszzGlGymTbq2kuIbDQoK519oJ+SL035NdxzpWfYKCoIMRHA5aaPE3xkeBrDPI4+pJKaac7LVuAkHPbb0CfmDlNRnGPMidgvKIKXZuiQyUgGgGZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5M20aLwwE0S58trhDLEhLTGPI5PpcsoKXDaUPfUNc8Y=;
 b=MGuxSvwVmjFyA/m/K9dPx/aQZ14tRiFi5LlwEuJ5HhuLhhNB9dGXMz17vooo4rCrH7VxvL9wE1dxJ9HszZ75QzExtd0pW3ssbtRh8x2hvR1BLtwrl0w1fa+5KTCWWRdBgchH2hedT5X9lsxIq1SIsQEbbnteKQV3IiplIHJrpag=
Received: from MN2PR12MB3710.namprd12.prod.outlook.com (10.255.236.23) by
 MN2PR12MB2941.namprd12.prod.outlook.com (20.179.80.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Mon, 12 Aug 2019 09:45:15 +0000
Received: from MN2PR12MB3710.namprd12.prod.outlook.com
 ([fe80::f50c:562b:fdc0:c2dd]) by MN2PR12MB3710.namprd12.prod.outlook.com
 ([fe80::f50c:562b:fdc0:c2dd%3]) with mapi id 15.20.2157.022; Mon, 12 Aug 2019
 09:45:15 +0000
From:   Luis de Oliveira <Luis.Oliveira@synopsys.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
CC:     Luis Oliveira <Luis.Oliveira@synopsys.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Rob Herring <robh@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        "paulmck@linux.ibm.com" <paulmck@linux.ibm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "Kishon Vijay Abraham I" <kishon@ti.com>,
        devicetree <devicetree@vger.kernel.org>,
        "Linux Media Mailing List" <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Joao Pinto <Joao.Pinto@synopsys.com>
Subject: RE: [v4 2/6] media: platform: dwc: Add MIPI CSI-2 controller driver
Thread-Topic: [v4 2/6] media: platform: dwc: Add MIPI CSI-2 controller driver
Thread-Index: AQHVIIralF2QFkL0vUS66ixvvrgUPKbzNy0AgAGBY4CAAueZkA==
Date:   Mon, 12 Aug 2019 09:45:15 +0000
Message-ID: <MN2PR12MB3710E54A1E4BA4FD3AD77B87CBD30@MN2PR12MB3710.namprd12.prod.outlook.com>
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
 <1560280855-18085-3-git-send-email-luis.oliveira@synopsys.com>
 <20190809141000.GB864@valkosipuli.retiisi.org.uk>
 <CAHp75VeutP=W43GHtY+FKvVGjBnQrF+nKbdaq_QXy8ZCoS=k1g@mail.gmail.com>
In-Reply-To: <CAHp75VeutP=W43GHtY+FKvVGjBnQrF+nKbdaq_QXy8ZCoS=k1g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=lolivei@synopsys.com; 
x-originating-ip: [83.174.63.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fcc866d3-569f-413f-bcb9-08d71f09c73e
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MN2PR12MB2941;
x-ms-traffictypediagnostic: MN2PR12MB2941:|MN2PR12MB2941:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB29412CF3B77D0D33DE062E56CBD30@MN2PR12MB2941.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(136003)(366004)(396003)(39850400004)(199004)(189003)(7736002)(186003)(305945005)(229853002)(26005)(25786009)(3846002)(5660300002)(6116002)(74316002)(71190400001)(107886003)(66066001)(6246003)(71200400001)(99286004)(52536014)(316002)(8676002)(9686003)(7416002)(7696005)(76176011)(54906003)(2906002)(81156014)(110136005)(53936002)(81166006)(478600001)(102836004)(55016002)(8936002)(86362001)(53546011)(6506007)(6436002)(14454004)(486006)(446003)(11346002)(66446008)(476003)(76116006)(64756008)(66556008)(66476007)(4326008)(66946007)(14444005)(33656002)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR12MB2941;H:MN2PR12MB3710.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lgMxGqFpC3jvf78AyF94Z0zkEqqGy/FIZihqzuujAztM4CyuqNoIaZKG1BuoaWe/dJLGcyii/jbPF0wNTUJHKWV85iP0DOLpATeWEvbuA0bPgiko+9QAJIQAkJBGIYl2OjcdZnBbeu2OF4FepFFGQrn2tm3D1QRiu0u4PM+PoRsPtDo/RyN2IuxdKTT+sT15STDPhR+HszmCP1mz9ba/SdHcSbRF6Y2d8azhT2URaS1MKPi+pnGJC2PQlR5f5y1C6BHzYDkxbX+D0WKu7WY7hyPtZ3AZmSGLk34C76BMGNb8va2O73hr9aDDk2QW3fwXB7Y9jGvs0X0bjSM6re8uuCc3XMJeyylY7fhcpfnBZufASMX9pHcUEH5l3m2r9LE1t5RQDgkcFOT+S+a8hbPvmTgBM6Az5OEd0M+3QYKjzis=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc866d3-569f-413f-bcb9-08d71f09c73e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 09:45:15.2149
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: muaALApS8mDAoX8wqrTmhU2VrY01R7UAsAsnnDG9Nith+xZmte2jjSxnv6Q8foO/uPzEmAZXFrsI93vez1LLJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2941
X-OriginatorOrg: synopsys.com
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU2FrYXJpLCBBbmR5LA0KDQpGcm9tOiBBbmR5IFNoZXZjaGVua28gPGFuZHkuc2hldmNoZW5r
b0BnbWFpbC5jb20+DQpEYXRlOiBTYXQsIEF1ZyAxMCwgMjAxOSBhdCAxNDowOToyMQ0KDQo+IE9u
IEZyaSwgQXVnIDksIDIwMTkgYXQgNTozOCBQTSBTYWthcmkgQWlsdXMgPHNha2FyaS5haWx1c0Bp
a2kuZmk+IHdyb3RlOg0KPiA+IE9uIFR1ZSwgSnVuIDExLCAyMDE5IGF0IDA5OjIwOjUxUE0gKzAy
MDAsIEx1aXMgT2xpdmVpcmEgd3JvdGU6DQo+ID4gPiBBZGQgdGhlIFN5bm9wc3lzIE1JUEkgQ1NJ
LTIgY29udHJvbGxlciBkcml2ZXIuIFRoaXMNCj4gPiA+IGNvbnRyb2xsZXIgZHJpdmVyIGlzIGRp
dmlkZWQgaW4gcGxhdGZvcm0gZnVuY3Rpb25zIGFuZCBjb3JlIGZ1bmN0aW9ucy4NCj4gPiA+IFRo
aXMgd2F5IGl0IHNlcnZlcyBhcyBwbGF0Zm9ybSBmb3IgZnV0dXJlIERlc2lnbldhcmUgZHJpdmVy
cy4NCj4gDQo+ID4gPiArY29uc3Qgc3RydWN0IG1pcGlfZHQgY3NpX2R0W10gPSB7DQo+ID4NCj4g
PiBNYWtlIHRoaXMgc3RhdGljIG9yIHVzZSBhIGNvbW1vbiBwcmVmaXggdGhhdCBzb21laG93IHJl
c2VtYmxlcyB0aGUgbmFtZQ0KPiA+IG5hbWUgb2YgdGhlIGRyaXZlci4NCg0KSSB3aWxsIGRvIGl0
Lg0KDQo+ID4NCj4gPiA+ICsgICAgIHsNCj4gPiA+ICsgICAgICAgICAgICAgLmhleCA9IENTSV8y
X1lVVjQyMF84LA0KPiA+ID4gKyAgICAgICAgICAgICAubmFtZSA9ICJZVVY0MjBfOGJpdHMiLA0K
PiA+ID4gKyAgICAgfSwgew0KPiA+ID4gKyAgICAgICAgICAgICAuaGV4ID0gQ1NJXzJfWVVWNDIw
XzEwLA0KPiA+ID4gKyAgICAgICAgICAgICAubmFtZSA9ICJZVVY0MjBfMTBiaXRzIiwNCj4gPiA+
ICsgICAgIH0sIHsNCj4gPiA+ICsgICAgICAgICAgICAgLmhleCA9IENTSV8yX1lVVjQyMF84X0xF
RywNCj4gPiA+ICsgICAgICAgICAgICAgLm5hbWUgPSAiWVVWNDIwXzhiaXRzX0xFR0FDWSIsDQo+
ID4gPiArICAgICB9LCB7DQo+ID4gPiArICAgICAgICAgICAgIC5oZXggPSBDU0lfMl9ZVVY0MjBf
OF9TSElGVCwNCj4gPiA+ICsgICAgICAgICAgICAgLm5hbWUgPSAiWVVWNDIwXzhiaXRzX1NISUZU
IiwNCj4gPiA+ICsgICAgIH0sIHsNCj4gPiA+ICsgICAgICAgICAgICAgLmhleCA9IENTSV8yX1lV
VjQyMF8xMF9TSElGVCwNCj4gPiA+ICsgICAgICAgICAgICAgLm5hbWUgPSAiWVVWNDIwXzEwYml0
c19TSElGVCIsDQo+ID4gPiArICAgICB9LCB7DQo+ID4gPiArICAgICAgICAgICAgIC5oZXggPSBD
U0lfMl9ZVVY0MjJfOCwNCj4gPiA+ICsgICAgICAgICAgICAgLm5hbWUgPSAiWVVWNDQyXzhiaXRz
IiwNCj4gPiA+ICsgICAgIH0sIHsNCj4gPiA+ICsgICAgICAgICAgICAgLmhleCA9IENTSV8yX1lV
VjQyMl8xMCwNCj4gPiA+ICsgICAgICAgICAgICAgLm5hbWUgPSAiWVVWNDQyXzEwYml0cyIsDQo+
ID4gPiArICAgICB9LCB7DQo+ID4gPiArICAgICAgICAgICAgIC5oZXggPSBDU0lfMl9SR0I0NDQs
DQo+ID4gPiArICAgICAgICAgICAgIC5uYW1lID0gIlJHQjQ0NCIsDQo+ID4gPiArICAgICB9LCB7
DQo+ID4gPiArICAgICAgICAgICAgIC5oZXggPSBDU0lfMl9SR0I1NTUsDQo+ID4gPiArICAgICAg
ICAgICAgIC5uYW1lID0gIlJHQjU1NSIsDQo+ID4gPiArICAgICB9LCB7DQo+ID4gPiArICAgICAg
ICAgICAgIC5oZXggPSBDU0lfMl9SR0I1NjUsDQo+ID4gPiArICAgICAgICAgICAgIC5uYW1lID0g
IlJHQjU2NSIsDQo+ID4gPiArICAgICB9LCB7DQo+ID4gPiArICAgICAgICAgICAgIC5oZXggPSBD
U0lfMl9SR0I2NjYsDQo+ID4gPiArICAgICAgICAgICAgIC5uYW1lID0gIlJHQjY2NiIsDQo+ID4g
PiArICAgICB9LCB7DQo+ID4gPiArICAgICAgICAgICAgIC5oZXggPSBDU0lfMl9SR0I4ODgsDQo+
ID4gPiArICAgICAgICAgICAgIC5uYW1lID0gIlJHQjg4OCIsDQo+ID4gPiArICAgICB9LCB7DQo+
ID4gPiArICAgICAgICAgICAgIC5oZXggPSBDU0lfMl9SQVc2LA0KPiA+ID4gKyAgICAgICAgICAg
ICAubmFtZSA9ICJSQVc2IiwNCj4gPiA+ICsgICAgIH0sIHsNCj4gPiA+ICsgICAgICAgICAgICAg
LmhleCA9IENTSV8yX1JBVzcsDQo+ID4gPiArICAgICAgICAgICAgIC5uYW1lID0gIlJBVzciLA0K
PiA+ID4gKyAgICAgfSwgew0KPiA+ID4gKyAgICAgICAgICAgICAuaGV4ID0gQ1NJXzJfUkFXOCwN
Cj4gPiA+ICsgICAgICAgICAgICAgLm5hbWUgPSAiUkFXOCIsDQo+ID4gPiArICAgICB9LCB7DQo+
ID4gPiArICAgICAgICAgICAgIC5oZXggPSBDU0lfMl9SQVcxMCwNCj4gPiA+ICsgICAgICAgICAg
ICAgLm5hbWUgPSAiUkFXMTAiLA0KPiA+ID4gKyAgICAgfSwgew0KPiA+ID4gKyAgICAgICAgICAg
ICAuaGV4ID0gQ1NJXzJfUkFXMTIsDQo+ID4gPiArICAgICAgICAgICAgIC5uYW1lID0gIlJBVzEy
IiwNCj4gPiA+ICsgICAgIH0sIHsNCj4gPiA+ICsgICAgICAgICAgICAgLmhleCA9IENTSV8yX1JB
VzE0LA0KPiA+ID4gKyAgICAgICAgICAgICAubmFtZSA9ICJSQVcxNCIsDQo+ID4gPiArICAgICB9
LCB7DQo+ID4gPiArICAgICAgICAgICAgIC5oZXggPSBDU0lfMl9SQVcxNiwNCj4gPiA+ICsgICAg
ICAgICAgICAgLm5hbWUgPSAiUkFXMTYiLA0KPiA+ID4gKyAgICAgfSwNCj4gPiA+ICt9Ow0KPiAN
Cj4gT25lIG1heSB1dGlsaXplIF9fc3RyaW5naWZ5KCkgbWFjcm8gYW5kIGRvIHNvbWVsaWtlDQo+
IA0KPiAjZGVmaW5lIENTSV9GTVRfREVTQyhmbXQpIFwNCj4gIHsgLmhleCA9IENTSV8yXyMjZm10
LCAubmFtZSA9IF9fc3RyaW5naWZ5KGZtdCksIH0NCj4gDQo+IEFuZCBkbw0KPiANCj4gIENTSV9G
TVRfREVTQyhSQVcxNiksDQo+IA0KPiBldGMuDQo+IA0KDQpHcmVhdCwgdGhhbmtzISANCg0KPiA+
ID4gKyAgICAgICAgICAgICByZXR1cm4gY2ZnID8gdjRsMl9zdWJkZXZfZ2V0X3RyeV9mb3JtYXQo
JmRldi0+c2QsDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjZmcsDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAwKSA6IE5VTEw7DQo+IA0KPiBUaGlzIGluZGVudGF0aW9u
IGxvb2tzIHVnbHkuDQo+IEkgd291bGQgcmF0aGVyIHB1dCB0aGlzIG9uIG9uZSBsaW5lLg0KPiAN
Cj4gPiA+ICsgICAgIGRldl9kYmcoZGV2LT5kZXYsDQo+ID4gPiArICAgICAgICAgICAgICIlcyBn
b3QgdjRsMl9tYnVzX3BpeGVsY29kZS4gMHgleFxuIiwgX19mdW5jX18sDQo+ID4gPiArICAgICAg
ICAgICAgIGRldi0+Zm9ybWF0LmNvZGUpOw0KPiA+ID4gKyAgICAgZGV2X2RiZyhkZXYtPmRldiwN
Cj4gPiA+ICsgICAgICAgICAgICAgIiVzIGdvdCB3aWR0aC4gMHgleFxuIiwgX19mdW5jX18sDQo+
ID4gPiArICAgICAgICAgICAgIGRldi0+Zm9ybWF0LndpZHRoKTsNCj4gPiA+ICsgICAgIGRldl9k
YmcoZGV2LT5kZXYsDQo+ID4gPiArICAgICAgICAgICAgICIlcyBnb3QgaGVpZ2h0LiAweCV4XG4i
LCBfX2Z1bmNfXywNCj4gPiA+ICsgICAgICAgICAgICAgZGV2LT5mb3JtYXQuaGVpZ2h0KTsNCj4g
DQo+IF9fZnVuY19fIGlzIHVzdWFsbHkgcmVkdW5kYW50IChpZiBEeW5hbWljIERlYnVnIGluIHVz
ZSBpdCBjYW4gYmUNCj4gc3dpdGNoZWQgYXQgcnVuLXRpbWUpLg0KPiANCg0KVGhhdCdzIHRydWUs
IEkgZG9uJ3QgbmVlZCBpdC4NCg0KPiA+IEknZCBqdXN0IG9taXQgdGhlc2UgZGVidWcgcHJpbnRz
IGluIGEgZHJpdmVyLiBCdXQgYWRkaW5nIHRoZW0gdG8gdGhlDQo+ID4gZnJhbWV3b3JrIG1pZ2h0
IG1ha2Ugc2Vuc2UuIFdlIGRvbid0IGhhdmUgYSBsb3Qgb2YgZGVidWcgcHJpbnRzIGRlYWxpbmcN
Cj4gPiB3aXRoIHVzZXIgcGFyYW1ldGVycyBpbiB0aGVyZS4gT1RPSCB0aGUgY29tbW9uIHRlc3Qg
cHJvZ3JhbXMgbGFyZ2VseSBkbyB0aGUNCj4gPiBzYW1lIGFscmVhZHkuDQo+IA0KPiBJIHdvdWxk
IHJhdGhlciBzZWUgdHJhY2Vwb2ludHMgaW5zdGVhZCBvZiBkZWJ1ZyBwcmludHMgaWYgd2UgYXJl
DQo+IHRhbGtpbmcgYWJvdXQgZ2VuZXJpYyBzb2x1dGlvbiBmb3IgZW50aXJlIGZyYW1ld29yay4N
Cj4gDQoNCkkgd2lsbCBjaGVjayB0aGF0Lg0KDQo+ID4NCj4gPiA+ICsgICAgIHJldHVybiAmZGV2
LT5mb3JtYXQ7DQo+ID4gPiArfQ0KPiANCj4gPiA+ICsgICAgIHN0cnVjdCBtaXBpX2ZtdCAqZGV2
X2ZtdDsNCj4gDQo+IFRoaXMgaXMgc2ltcGxlIGJhZCBuYW1lLiBXZSBoYXZlIGRldl9mbXQoKSBt
YWNyby4gSSB3b3VsZCByYXRoZXIgYXZvaWQNCj4gcG90ZW50aWFsIGNvbGxpc2lvbnMuDQoNClRy
dWUsIEkgd2lsbCBjaGFuZ2UgdGhlIG5hbWUuDQoNCj4gDQo+ID4gPiArICAgICBzdHJ1Y3QgdjRs
Ml9tYnVzX2ZyYW1lZm10ICptZjsNCj4gPiA+ICsNCj4gPiA+ICsgICAgIG1mID0gZHdfbWlwaV9j
c2lfZ2V0X2Zvcm1hdChkZXYsIGNmZywgZm10LT53aGljaCk7DQo+ID4gPiArICAgICBpZiAoIW1m
KQ0KPiA+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gDQo+IENhbid0IHlvdSBy
YXRoZXIgcmV0dXJuIGFuIGVycm9yIHBvaW50ZXIgaW4gdGhpcyBhbmQgc2ltaWxhciBjYXNlcz8N
Cj4gDQoNClllcywgb2ZjLg0KDQo+ID4gPiArICAgICBkZXZfdmRiZyhkZXYtPmRldiwgIiVzOiBv
bj0lZFxuIiwgX19mdW5jX18sIG9uKTsNCj4gDQo+IFRoaXMgaXMgbm9pc2UuIElmIHlvdSB3b3Vs
ZCBsaWtlIHRvIGRlYnVnIEZ1bmN0aW9uIFRyYWNlciBpcyBhIGdvb2Qgc3RhcnQuDQo+IA0KDQpP
ay4NCg0KPiA+ID4gKyAgICAgb2ZfaWQgPSBvZl9tYXRjaF9ub2RlKGR3X21pcGlfY3NpX29mX21h
dGNoLCBkZXYtPm9mX25vZGUpOw0KPiA+ID4gKyAgICAgaWYgKCFvZl9pZCkNCj4gPiA+ICsgICAg
ICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+IA0KPiBJcyBpdCBwb3NzaWJsZSB0byBoYXZlIHRo
aXMgYXNzZXJ0ZWQ/DQo+IA0KDQpJIHdpbGwgcmVtb3ZlIGl0Lg0KIA0KPiA+ID4gKyAgICAgcmVz
ID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsNCj4gDQo+
ID4gPiArICAgICBpZiAoIXJlcykNCj4gPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FTlhJTzsN
Cj4gDQo+IFJlZHVuZGFudC4gQmVsb3cgZG9lcyB0aGUgY2hlY2sgZm9yIHlvdS4NCj4gDQoNClll
cCwgdGhhbmtzLg0KDQo+ID4gPiArDQo+ID4gPiArICAgICBjc2ktPmJhc2VfYWRkcmVzcyA9IGRl
dm1faW9yZW1hcF9yZXNvdXJjZShkZXYsIHJlcyk7DQo+ID4gPiArICAgICBpZiAoSVNfRVJSKGNz
aS0+YmFzZV9hZGRyZXNzKSkgew0KPiANCj4gPiA+ICsgICAgICAgICAgICAgZGV2X2VycihkZXYs
ICJCYXNlIGFkZHJlc3Mgbm90IHNldC5cbiIpOw0KPiANCj4gUmVkdW5kYW50LiBBYm92ZSBkb2Vz
IHByaW50IGFuIGVycm9yIG1lc3NhZ2UgZm9yIHlvdS4NCj4gDQoNCk9rLg0KDQo+ID4gPiArICAg
ICAgICAgICAgIHJldHVybiBQVFJfRVJSKGNzaS0+YmFzZV9hZGRyZXNzKTsNCj4gPiA+ICsgICAg
IH0NCj4gDQo+IE1vcmVvdmVyLCB1c2UgZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKCkg
aW5zdGVhZCBvZiBib3RoLg0KPiANCg0KTmljZSwgdGhhbmtzLg0KDQo+ID4gPiArICAgICBjc2kt
PmN0cmxfaXJxX251bWJlciA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7DQo+ID4gPiArICAg
ICBpZiAoY3NpLT5jdHJsX2lycV9udW1iZXIgPCAwKSB7DQo+IA0KPiA+ID4gKyAgICAgICAgICAg
ICBkZXZfZXJyKGRldiwgImlycSBudW1iZXIgJWQgbm90IHNldC5cbiIsIGNzaS0+Y3RybF9pcnFf
bnVtYmVyKTsNCj4gDQo+IFJlZHVuZGFudCBzaW5jZSB0aGlzIGN5Y2xlICh2NS40KS4NCj4gDQoN
Ck9rLA0KDQo+ID4gPiArICAgICAgICAgICAgIHJldCA9IGNzaS0+Y3RybF9pcnFfbnVtYmVyOw0K
PiANCj4gQmV0dGVyIHRvIGRvIHRoZSBvcHBvc2l0ZQ0KPiANCj4gcmV0ID0gcGxhdGZvcm1fZ2V0
X2lycSgpOw0KPiBpZiAocmV0KQ0KPiAgZ290byBlbmQ7DQo+IC4uLiA9IHJldDsNCj4gDQo+ID4g
PiArICAgICAgICAgICAgIGdvdG8gZW5kOw0KPiA+ID4gKyAgICAgfQ0KPiANCj4gPiA+ICsgICAg
IHJldCA9IGRldm1fcmVxdWVzdF9pcnEoZGV2LCBjc2ktPmN0cmxfaXJxX251bWJlciwNCj4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgZHdfbWlwaV9jc2lfaXJxMSwgSVJRRl9TSEFS
RUQsDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRldl9uYW1lKGRldiksIGNz
aSk7DQo+ID4gPiArICAgICBpZiAocmV0KSB7DQo+ID4gPiArICAgICAgICAgICAgIGRldl9lcnIo
ZGV2LCAiaXJxIGNzaSAlcyBmYWlsZWRcbiIsIG9mX2lkLT5uYW1lKTsNCj4gPiA+ICsNCj4gPiA+
ICsgICAgICAgICAgICAgZ290byBlbmQ7DQo+ID4gPiArICAgICB9DQo+IA0KPiBkZXZtXyppcnEo
KSBtaWdodCBiZSBhIGJhZCBpZGVhLiBJcyBpdCByYWNlIGZyZWUgaW4geW91ciBkcml2ZXI/DQo+
IA0KDQpJIG5ldmVyIHRob3VnaHQgYWJvdXQgaXQgbGlrZSB0aGF0LiBTaG91bGQgSSB1c2UgcmVx
dWVzdF9pcnEgYW5kIA0KZnJlZV9pcnE/IA0KDQo+ID4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBv
Zl9kZXZpY2VfaWQgZHdfbWlwaV9jc2lfb2ZfbWF0Y2hbXSA9IHsNCj4gPiA+ICsgICAgIHsgLmNv
bXBhdGlibGUgPSAic25wcyxkdy1jc2kiIH0sDQo+IA0KPiA+ID4gKyAgICAge30sDQo+IA0KPiBC
ZXR0ZXIgd2l0aG91dCBjb21tYS4gVGVybWluYXRvciBtYXkgdGVybWluYXRlIGV2ZW4gYXQgY29t
cGlsZSB0aW1lLg0KPiANCg0KT2suDQo+ID4gPiArfTsNCj4gDQo+ID4gPiArc3RhdGljIHNzaXpl
X3QgY29yZV92ZXJzaW9uX3Nob3coc3RydWN0IGRldmljZSAqZGV2LA0KPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLA0KPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNoYXIgKmJ1ZikNCj4gPiA+ICt7DQo+
ID4gPiArICAgICBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2ID0gdG9fcGxhdGZvcm1fZGV2
aWNlKGRldik7DQo+ID4gPiArICAgICBzdHJ1Y3QgdjRsMl9zdWJkZXYgKnNkID0gcGxhdGZvcm1f
Z2V0X2RydmRhdGEocGRldik7DQo+ID4gPiArICAgICBzdHJ1Y3QgZHdfY3NpICpjc2lfZGV2ID0g
c2RfdG9fbWlwaV9jc2lfZGV2KHNkKTsNCj4gDQo+ID4gPiArDQo+ID4gPiArICAgICBjaGFyIGJ1
ZmZlclsxMF07DQo+ID4gPiArDQo+ID4gPiArICAgICBzbnByaW50ZihidWZmZXIsIDEwLCAidi4l
ZC4lZCpcbiIsIGNzaV9kZXYtPmh3X3ZlcnNpb25fbWFqb3IsDQo+ID4gPiArICAgICAgICAgICAg
ICBjc2lfZGV2LT5od192ZXJzaW9uX21pbm9yKTsNCj4gPiA+ICsNCj4gPiA+ICsgICAgIHJldHVy
biBzdHJsY3B5KGJ1ZiwgYnVmZmVyLCBQQUdFX1NJWkUpOw0KPiANCj4gT2gsIGNhbid0IHlvdSBz
aW1wbGUgd2l0aG91dCBhbnkgdGVtcHJvcmFyeSB1c2VsZXNzIGJ1ZmZlcnM/DQo+ICBzcHJpbnRm
KGJ1ZiwgLi4uKT8NCj4gKFllcywgbm90ZSBfYWJzZW5jZV8gb2YgKm4qIHRoZXJlKQ0KDQpZb3Ug
YXJlIHJpZ2h0Lg0KPiANCj4gPiA+ICt9DQo+IA0KPiA+ID4gK3N0YXRpYyBzc2l6ZV90IG5fbGFu
ZXNfc3RvcmUoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0
ciwNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKmJ1Ziwgc2l6
ZV90IGNvdW50KQ0KPiA+ID4gK3sNCj4gPiA+ICsgICAgIGludCByZXQ7DQo+ID4gPiArICAgICB1
bnNpZ25lZCBsb25nIGxhbmVzOw0KPiANCj4gPiA+ICsNCj4gDQo+IE1vcmUgYmxhbmsgbGluZXMh
IFdlIG5lZWQgdGhlbSENCj4gDQoNCk9rLg0KDQo+ID4gPiArICAgICBzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2ID0gdG9fcGxhdGZvcm1fZGV2aWNlKGRldik7DQo+ID4gPiArICAgICBzdHJ1
Y3QgdjRsMl9zdWJkZXYgKnNkID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7DQo+ID4gPiAr
ICAgICBzdHJ1Y3QgZHdfY3NpICpjc2lfZGV2ID0gc2RfdG9fbWlwaV9jc2lfZGV2KHNkKTsNCj4g
PiA+ICsNCj4gPiA+ICsgICAgIHJldCA9IGtzdHJ0b3VsKGJ1ZiwgMTAsICZsYW5lcyk7DQo+ID4g
PiArICAgICBpZiAocmV0IDwgMCkNCj4gPiA+ICsgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4g
DQo+IENhbiBpdCByZXR1cm4gcG9zaXRpdmUgbnVtYmVyPw0KPiANCj4gPiA+ICsgICAgIGRldl9p
bmZvKGRldiwgIkxhbmVzICVsdVxuIiwgbGFuZXMpOw0KPiANCj4gTm9pc2UuDQo+IFRoZSB1c2Vy
IGdldHMgaXQsIHdoeSB0byBzcGFtIGtlcm5lbCBsb2c/Pz8NCj4gDQpPay4NCg0KPiA+ID4gKyAg
ICAgY3NpX2Rldi0+aHcubnVtX2xhbmVzID0gbGFuZXM7DQo+ID4gPiArDQo+ID4gPiArICAgICBy
ZXR1cm4gY291bnQ7DQo+ID4gPiArfQ0KPiANCj4gSSB0b2xkIG9uY2UsIGNhbiByZXBlYXQgYWdh
aW4uIFN5bm9wc3lzIHBlcmhhcHMgbmVlZHMgYmV0dGVyIHJldmlld3MNCj4gaW5zaWRlIGNvbXBh
bnkuIEVhY2ggdGltZSBJIHNlZSB0aGUgY29kZSwgaXQgcmVwZWF0cyBzYW1lIG1pc3Rha2VzDQo+
IG92ZXIgYW5kIG92ZXIuIEhhdmUgeW91LCBndXlzLCBkbyBzb21ldGhpbmcgYWJvdXQgaXQ/DQoN
CldlIGFyZSB3b3JraW5nIG9uIGl0LiBJdCB3aWxsIGdldCBiZXR0ZXIsIHNvcnJ5Lg0KPiANCj4g
LS0gDQo+IFdpdGggQmVzdCBSZWdhcmRzLA0KPiBBbmR5IFNoZXZjaGVua28NCg0KVGhhbmtzLA0K
THVpcw0K
