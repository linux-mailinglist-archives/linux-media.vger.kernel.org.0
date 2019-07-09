Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB489637F8
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 16:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbfGIOdz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jul 2019 10:33:55 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:12323 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbfGIOdy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jul 2019 10:33:54 -0400
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: YXLTcWi0e2h+DO4PJuKKmgiNDuqHCb1dApaZA4DYie6hm0PuI+50hQsDFeQuqROoHBVusyAPFi
 JB7pjJfg51RxhPCOaMONi+0R8i9Fv3ueT2n8X+R/qb9Sj9JwVap30lSWOLUGnZ0U70RYe8lBoD
 toc6R3Oac+MHzLGrIPIV4RJ8SCt0ZvO0HhxJiTV1DE/gOIBEfBXQBtv0CO81F8EF011Jw5kmXw
 PtezdHjqWU9mXY8dTnkV0mzZtAK7E7D538sYFMP7EtH3b0Z8mHdr4s6WW43kFk03eDMKZ08taK
 rio=
X-IronPort-AV: E=Sophos;i="5.63,470,1557212400"; 
   d="scan'208";a="41997580"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Jul 2019 07:33:53 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex01.mchp-main.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 9 Jul 2019 07:33:51 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 9 Jul 2019 07:33:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hE/Ul7P1+wMCrlai3ezGF+cYt7TWxJsoViZB1y+gza+l78Y2Zv1K994o1abrBwRgExacV6oL/v/dTuoehLYJCIrdjULzeSHh/HchYbN+PGsJCGvYm1VC5K6NRZVTy4MQrUnO8bsD/wCPVyoldcNfmV0hBLufkczE1cpNklksMf4ZkfExq1PdlI3fuLLYK5duz25Pr09O68M8Y2/vu6mW6a/ExIqmGsDn1USBF1L2m1LrYOrm/oMsOfg1MuKT7uza6QHdSAlb6jarlUXQv/5ai5cSCPhnOM5J76Y+0Nobrkzk4ucsuGbtLSpFFZozWxtV7QHguUl3OU52munrPzrwmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3v29nQEKUH00NasYjzI8z1zuYS8/e4y3cOOoZu+lddg=;
 b=h4X9Ibtvvc3o4Q28fjwO2qpGtQAy7AUN8hVZPFacFg2OFZzwhZnIKCqwUN9DwN65m9YpdArfaL5qRIsW+vFHSFfuC5p0mDGcgkuVcInG0I5UBIERVlNTf6WN73LEvoFlZJmGC/7nkRaUBs/rr2fqxJjm8qGzHlMgQw4md8zYzZ4bzoNNsIdietsXjm7HqZz3ZZsTJeXYNPwaRlaCrU/tXG+VThy/4Kwjc2YVK/MVnt6t2nDwb7aiLoSUEYT7qA4VUPMDAo3Yoczb4xoJQF5FhfJ8nzprxL/yW8wBTUCc1IQiHWrowHGW/5YO8KKLnlwu+jUEGFdcxySVRgN7U/MnCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microchip.com;dmarc=pass action=none
 header.from=microchip.com;dkim=pass header.d=microchip.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3v29nQEKUH00NasYjzI8z1zuYS8/e4y3cOOoZu+lddg=;
 b=kldyq+X8NDvsTGXvqogZFyp6kAx+pmkRURWgRt+BIkwoLsaS397V0ULfWroccAO4UTov99AM9bT4uRnLi4LoW946ZjpvBgFHqB+j23pq4Z5Gt3boOpbu8ucTpmDce2AnBntDD7J3T3i4W067tX0rmPcpuSKQWCyXExJ8i+9FeKU=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB2043.namprd11.prod.outlook.com (10.168.105.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Tue, 9 Jul 2019 14:33:51 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::917d:f91d:9398:3925]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::917d:f91d:9398:3925%8]) with mapi id 15.20.2052.019; Tue, 9 Jul 2019
 14:33:51 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <Luis.Oliveira@synopsys.com>, <mchehab@kernel.org>,
        <davem@davemloft.net>, <gregkh@linuxfoundation.org>,
        <Jonathan.Cameron@huawei.com>, <robh@kernel.org>,
        <Nicolas.Ferre@microchip.com>, <paulmck@linux.ibm.com>,
        <mark.rutland@arm.com>, <kishon@ti.com>,
        <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <Joao.Pinto@synopsys.com>
Subject: Re: [v4 1/6] dt-bindings: media: Document bindings for DW MIPI CSI-2
 Host
Thread-Topic: [v4 1/6] dt-bindings: media: Document bindings for DW MIPI CSI-2
 Host
Thread-Index: AQHVIIsOR6hPk+qKFEm1tQz6OC6yVqbChBwA
Date:   Tue, 9 Jul 2019 14:33:50 +0000
Message-ID: <ae0ffeca-9305-b5a2-3480-da623d15ce67@microchip.com>
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
 <1560280855-18085-2-git-send-email-luis.oliveira@synopsys.com>
In-Reply-To: <1560280855-18085-2-git-send-email-luis.oliveira@synopsys.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0229.eurprd08.prod.outlook.com
 (2603:10a6:802:15::38) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190709172838359
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6aacc895-5bed-4287-600a-08d7047a75b3
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB2043;
x-ms-traffictypediagnostic: DM5PR11MB2043:
x-microsoft-antispam-prvs: <DM5PR11MB2043DF1730E1DCE067D9C180E8F10@DM5PR11MB2043.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(39860400002)(136003)(376002)(346002)(396003)(54534003)(199004)(189003)(486006)(2501003)(31696002)(81166006)(6436002)(11346002)(2616005)(81156014)(7736002)(6116002)(3846002)(446003)(229853002)(8676002)(478600001)(2201001)(256004)(6246003)(316002)(6512007)(36756003)(25786009)(476003)(86362001)(6486002)(7416002)(8936002)(53936002)(53546011)(99286004)(71190400001)(5660300002)(52116002)(31686004)(110136005)(73956011)(66476007)(66556008)(26005)(66946007)(4326008)(66446008)(64756008)(102836004)(305945005)(186003)(66066001)(68736007)(6506007)(386003)(71200400001)(14454004)(72206003)(76176011)(2906002)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB2043;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2GnQ6tF/SM6AMJRDqkh1yoKkJgApdvwvOrkADubgoLAOPg376uCSHCqQjOaPNNfwXChrTRyOi40+KfaWsrvHcWrfc84GGT+cIykDxITi5XPZLZmLsvFpoSZEzUx15URVHFVGGkQxZtwoGrfo9wa8+G9IVu7fExYb4JWScPR8I/d1dlseMpw6Sg5uKKIS1pwIfL1wnh1fQKL9tKcFkBGxSVYxrfozEop0YHo1ad5vNkV5WaUOBg6PCf3S7D7s4esEUs7JohfaX7X8vaxwjqVlN+Pi/6hNdlPtdpdVZwBh+K4pm7lrfEo05hDHXPEBA7wE7BlxFsGYzTzZrRLJl0oJiXoVnjtTyvhSRJSGzZPsJM4YFTBlFz1CX9teLxDwnt6hq5iFJ9QHRc0YYGMxcGQ+pkJPWmAs26et7QkqXu3Ak+I=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3BE40FD76FF0294F9215FEEF22FB1FC9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aacc895-5bed-4287-600a-08d7047a75b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 14:33:50.7198
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eugen.hristev@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB2043
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQoNCk9uIDExLjA2LjIwMTkgMjI6MjAsIEx1aXMgT2xpdmVpcmEgd3JvdGU6DQo+IEZyb206IEx1
aXMgT2xpdmVpcmEgPGxvbGl2ZWlAc3lub3BzeXMuY29tPg0KPiANCj4gQWRkIGJpbmRpbmdzIGZv
ciBTeW5vcHN5cyBEZXNpZ25XYXJlIE1JUEkgQ1NJLTIgaG9zdC4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEx1aXMgT2xpdmVpcmEgPGxvbGl2ZWlAc3lub3BzeXMuY29tPg0KPiAtLS0NCj4gQ2hhbmdl
bG9nDQo+IHYzLXY0DQo+IC0gcmVtb3ZlICJwbGF0IiBmcm9tIHRoZSBibG9jayBuYW1lIEByb2Ig
QGxhdXJlbnQNCj4gLSByZW1vdmUgInBoeS1uYW1lcyIgd2hlbiBzaW5nbGUtZW50cnkgQHJvYg0K
PiAtIHJlbW92ZSAic25wcyxvdXRwdXQtdHlwZSIgLT4gd2VudCB0byB0aGUgZHJpdmVyIGNvbmZp
ZyBAbGF1cmVudA0KPiANCj4gICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9zbnBzLGR3
LWNzaS50eHQgICAgICB8IDQxICsrKysrKysrKysrKysrKysrKysrKysNCj4gICAxIGZpbGUgY2hh
bmdlZCwgNDEgaW5zZXJ0aW9ucygrKQ0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvc25wcyxkdy1jc2kudHh0DQo+IA0KPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3NucHMsZHct
Y3NpLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9zbnBzLGR3
LWNzaS50eHQNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMC4uNjEzYjdm
OQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZWRpYS9zbnBzLGR3LWNzaS50eHQNCj4gQEAgLTAsMCArMSw0MSBAQA0KPiArU3lub3Bz
eXMgRGVzaWduV2FyZSBDU0ktMiBIb3N0IGNvbnRyb2xsZXINCj4gKw0KPiArRGVzY3JpcHRpb24N
Cj4gKy0tLS0tLS0tLS0tDQo+ICsNCj4gK1RoaXMgSFcgYmxvY2sgaXMgdXNlZCB0byByZWNlaXZl
IGltYWdlIGNvbWluZyBmcm9tIGFuIE1JUEkgQ1NJLTIgY29tcGF0aWJsZQ0KPiArY2FtZXJhLg0K
PiArDQo+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOg0KPiArLSBjb21wYXRpYmxlCQk6IHNoYWxsIGJl
ICJzbnBzLGR3LWNzaSINCj4gKy0gcmVnCQkJOiBwaHlzaWNhbCBiYXNlIGFkZHJlc3MgYW5kIHNp
emUgb2YgdGhlIGRldmljZSBtZW1vcnkNCj4gKwkJCSAgbWFwcGVkIHJlZ2lzdGVyczsNCj4gKy0g
aW50ZXJydXB0cwkJOiBEVyBDU0ktMiBIb3N0IGludGVycnVwdHMNCj4gKy0gcGh5cwkJCTogTGlz
dCBvZiBvbmUgUEhZIHNwZWNpZmllciAoYXMgZGVmaW5lZCBpbg0KPiArCQkJICBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L3BoeS1iaW5kaW5ncy50eHQpLg0KPiArCQkJICBU
aGlzIFBIWSBpcyBhIE1JUEkgRFBIWSB3b3JraW5nIGluIFJYIG1vZGUuDQo+ICstIHJlc2V0cwkJ
OiBSZWZlcmVuY2UgdG8gYSByZXNldCBjb250cm9sbGVyIChvcHRpb25hbCkNCj4gKw0KPiArVGhl
IHBlci1ib2FyZCBzZXR0aW5nczoNCj4gKyAtIHBvcnQgc3ViLW5vZGUgZGVzY3JpYmluZyBhIHNp
bmdsZSBlbmRwb2ludCBjb25uZWN0ZWQgdG8gdGhlIGNhbWVyYSBhcw0KPiArICAgZGVzY3JpYmVk
IGluIHZpZGVvLWludGVyZmFjZXMudHh0WzFdLg0KPiArDQo+ICtFeGFtcGxlOg0KPiArDQo+ICsJ
Y3NpMjogY3NpMkAzMDAwIHsNCj4gKwkJY29tcGF0aWJsZSA9ICJzbnBzLGR3LWNzaSI7DQo+ICsJ
CSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiArCQkjc2l6ZS1jZWxscyA9IDwwPjsNCj4gKwkJcmVn
ID0gPCAweDAzMDAwIDB4N0ZGPjsNCj4gKwkJcGh5cyA9IDwmbWlwaV9kcGh5X3J4PjsNCj4gKwkJ
cmVzZXRzID0gPCZkd19yc3QgMT47DQo+ICsJCWludGVycnVwdHMgPSA8Mj47DQo+ICsNCj4gKwkJ
cG9ydEAwIHsNCj4gKwkJCXJlZyA9IDwwPjsNCj4gKwkJCWNzaV9lcDE6IGVuZHBvaW50IHsNCj4g
KwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmNhbWVyYV8xPjsNCj4gKwkJCQlkYXRhLWxhbmVzID0g
PDEgMj47DQo+ICsJCQl9Ow0KDQpIZWxsbyBMdWlzLA0KDQpXaGljaCBpcyB0aGUgb3V0cHV0IHBv
cnQgKGVuZHBvaW50KSA6IGhvdyB0byBjb25uZWN0IHRoZSBvdXRwdXQgb2YgDQpjc2kyaG9zdCB0
byBhbm90aGVyIG5vZGUgPw0KSSBtZWFuLCB0aGUgc2Vjb25kIHBvcnQgb2YgdGhpcyBibG9jaywg
b3IsIGhvdyBpcyB0aGUgZGF0YSB0YWtlbiBmcm9tIA0KY3NpMmhvc3QgPw0KDQpUaGFua3MsDQoN
CkV1Z2VuDQoNCj4gKwkJfTsNCj4gKwl9Ow0KPiANCg==
