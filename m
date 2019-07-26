Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78E5076436
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2019 13:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbfGZLNj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jul 2019 07:13:39 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:28248 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbfGZLNi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jul 2019 07:13:38 -0400
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 9U96gCqX4CvcU6j5BO70tGRPSyInvWbGgyKLd7jXLesDYqxoKNbJ2DlMON7serwuvTkS+5ZmUS
 qpLVjEfMDIxSiUwMG1jxWDxCXiYjh3o9YS9OuRpWf+fWrGsA7c5qx9giTcKWVQXXPVfKOOqpPK
 ypL9uCyzcfZujTdqKweoNB54s/SBJ5yK45+sh/rXs5fC02vWnh6tk9Xdk2daYYcmCpfhtsVPrm
 9EGj5Uwz5N4mcIYJ+xtf21qQZDc2WfyRsEdA8ejgoZRbsSes1aNNPg32KgZN+Bjh+SltPuTxuA
 Np4=
X-IronPort-AV: E=Sophos;i="5.64,310,1559545200"; 
   d="scan'208";a="42085156"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Jul 2019 04:13:36 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 26 Jul 2019 04:13:29 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 26 Jul 2019 04:13:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PKDWL9Gj8dufZZI+Z5FlEzVf8PJmAfG7BEmrJeWyBSew57srHP+5uY/XtLF4b32T+Fi98KKin94+vT3d0d4umaYeEIiKS/G9Q3Z10qBO0hn7wvrkTjH1F6BOrUsNroiM5JkwXAQyR3DkVQNrpAKVxrWNOXfvUKyDU5Q6fnv+g6stc6zjuK9oBl/xzVa70FacY8eyvdNmthFpHDQacIDWXmgmngvELgAuhJa+bo8TfAxnmg5vPRqD0CFsrjJKMc2cYtkOlSD1qYyUEmxI39LmSgAdnWPUwnu7tAhwVgNcXKW/9CLmVhNIBJtkr9z1emXzrs/JPQ8Lf3EODk1b0jF/rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5s6x02YjJsZ6Ls21gQzK0R8KfOTE091bwvtXCS/ePN4=;
 b=nB3rO9H88l2eUsHdbXGPTKYG5Q2Llr1JpsQUoOyZaQS0JJUDypK00y2HP/z7atnnV8aOhsS/oTe8tyiWtU1aUb+43o7cwK1CaAkg3UOEYFnIzrJNDVQfPXPGD6nSoks7k2ORGlV0lpWOA6/N+cDYIPoGP9zxnaD671b+abEw4PHzE41I5ZmIWOQXO9kglV/MMlrImgpQ36Bl7krJDAxjnCEmGkZYHQEqdSoOkHI9cdfFyB2z2iHROXRKNh4fVgd0K43k0F8L3tnFg4tEm5UpHqJCMuNJVs8OdsK04PO30VkKFrcrfywdoWZhz+zwsRwNbEd5ZQstNZj08U/YxKm9wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microchip.com;dmarc=pass action=none
 header.from=microchip.com;dkim=pass header.d=microchip.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5s6x02YjJsZ6Ls21gQzK0R8KfOTE091bwvtXCS/ePN4=;
 b=PO6vS83HKhnxzPEzLCTQlZg4/3iv4Y9fXmWufwBiZloYkKOO8AYonruqcbUkq9wJIHLvyW6VuTQ4HHF6h+oMI8Xhnfi4bvCpjrjIHr4BA572Gc0e7HNlOb06KS8UXXPfYmueW9UkcObJc6rCuZtq+cine+aeoEBfA+gwQo+6kAs=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1243.namprd11.prod.outlook.com (10.168.102.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Fri, 26 Jul 2019 11:13:28 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6999:99b5:cb0c:e173]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6999:99b5:cb0c:e173%2]) with mapi id 15.20.2094.017; Fri, 26 Jul 2019
 11:13:27 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <Luis.Oliveira@synopsys.com>, <sakari.ailus@iki.fi>
CC:     <mchehab@kernel.org>, <davem@davemloft.net>,
        <gregkh@linuxfoundation.org>, <Jonathan.Cameron@huawei.com>,
        <robh@kernel.org>, <Nicolas.Ferre@microchip.com>,
        <paulmck@linux.ibm.com>, <mark.rutland@arm.com>, <kishon@ti.com>,
        <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <Joao.Pinto@synopsys.com>
Subject: Re: [v4 1/6] dt-bindings: media: Document bindings for DW MIPI CSI-2
 Host
Thread-Topic: [v4 1/6] dt-bindings: media: Document bindings for DW MIPI CSI-2
 Host
Thread-Index: AQHVIIsOR6hPk+qKFEm1tQz6OC6yVqaxNjcAgA/KbQCAAcWCAIABCxSAgBg1YICAAOdYAIAAFcqA
Date:   Fri, 26 Jul 2019 11:13:27 +0000
Message-ID: <4380ca66-efbe-3e89-6f4c-6e3f0617fbc9@microchip.com>
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
 <1560280855-18085-2-git-send-email-luis.oliveira@synopsys.com>
 <20190628141326.swgl3kg4fj5pmlqx@valkosipuli.retiisi.org.uk>
 <MN2PR12MB37109D7AADCE4823CB458CB9CBF60@MN2PR12MB3710.namprd12.prod.outlook.com>
 <20190709182500.3x544axnrgy72aje@valkosipuli.retiisi.org.uk>
 <MN2PR12MB371026A6547B449EEC0439B1CBF00@MN2PR12MB3710.namprd12.prod.outlook.com>
 <20190725200211.GK1263@valkosipuli.retiisi.org.uk>
 <BY5PR12MB3699CA09F7CDB0827434F786CBC00@BY5PR12MB3699.namprd12.prod.outlook.com>
In-Reply-To: <BY5PR12MB3699CA09F7CDB0827434F786CBC00@BY5PR12MB3699.namprd12.prod.outlook.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0154.eurprd08.prod.outlook.com
 (2603:10a6:800:d5::32) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190726140811743
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f81abd09-f5d6-4cf1-5f39-08d711ba488d
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1243;
x-ms-traffictypediagnostic: DM5PR11MB1243:
x-microsoft-antispam-prvs: <DM5PR11MB1243892EBA507ED23834C59FE8C00@DM5PR11MB1243.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(366004)(39860400002)(396003)(136003)(189003)(54534003)(199004)(52116002)(66556008)(31696002)(6436002)(386003)(64756008)(2616005)(66066001)(86362001)(186003)(478600001)(7736002)(66946007)(53936002)(102836004)(2906002)(6506007)(71200400001)(53546011)(229853002)(66446008)(4326008)(14444005)(31686004)(7416002)(99286004)(256004)(81166006)(6512007)(110136005)(6486002)(486006)(68736007)(476003)(36756003)(5660300002)(54906003)(305945005)(81156014)(316002)(71190400001)(26005)(14454004)(6116002)(8936002)(6246003)(446003)(8676002)(3846002)(11346002)(25786009)(76176011)(66476007);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1243;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2KuyY7Kbv+bSS/NY862grEgFkIBBKQOkT66HOF/KacFIv7VySc3CK3LLadFXcMv68Gb46L8QNjNFLLvyrE5m2sgvna+9MlCYnVLkcEbbp4/HnB9etzGhDZ08qa7kTy5sgGttpRPFf4zbKi6oU9hGVYv1I98epDPyN3XyX7Piyuh2f+Rrnu0QtxYe9XGtrEjqL8rJvBnFX6+Zbzi3PhX85lvKwFCG+M8o0RuteQPdISlH7b1xhiBLn1KfMrv+RtHI0Ar36qz0Ffako/q/nl5w9BF6BGfv9/Chah96q8MOh1UIUN8z5wgGrkt58lmiy1VelKKUgrDSkwH4rUOp8sbBYYoTVvp087GHyMNMgHPf2UKyqoB6lbW8pviyxrMpyB1ry8bSOfKK5ImiPehsUCrXFHewBT5VFYKh9Y9UQPrlSEQ=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F8742809330D3F429CE30E2A58008F9F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f81abd09-f5d6-4cf1-5f39-08d711ba488d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 11:13:27.8721
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eugen.hristev@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1243
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQoNCk9uIDI2LjA3LjIwMTkgMTI6NTAsIEx1aXMgZGUgT2xpdmVpcmEgd3JvdGU6DQo+IEhpIFNh
a2FyaSwNCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIHJldmlldywgbXkgYW5zd2VycyBpbmxpbmUu
DQo+IA0KPj4gRnJvbTogU2FrYXJpIEFpbHVzIDxzYWthcmkuYWlsdXNAaWtpLmZpPg0KPj4gRGF0
ZTogVGh1LCBKdWwgMjUsIDIwMTkgYXQgMjE6MDI6MTENCj4+DQo+PiBIaSBMdWlzLA0KPj4NCj4+
IE9uIFdlZCwgSnVsIDEwLCAyMDE5IGF0IDEwOjIwOjU1QU0gKzAwMDAsIEx1aXMgZGUgT2xpdmVp
cmEgd3JvdGU6DQo+Pj4gSGkgU2FrYXJpLA0KPj4+DQo+Pj4gRnJvbTogU2FrYXJpIEFpbHVzIDxz
YWthcmkuYWlsdXNAaWtpLmZpPg0KPj4+IERhdGU6IFR1ZSwgSnVsIDA5LCAyMDE5IGF0IDE5OjI1
OjAwDQo+Pj4NCj4+Pj4gSGkgTHVpcywNCj4+Pj4NCj4+Pj4gT24gTW9uLCBKdWwgMDgsIDIwMTkg
YXQgMDM6MjE6NTBQTSArMDAwMCwgTHVpcyBkZSBPbGl2ZWlyYSB3cm90ZToNCj4+Pj4+IEhpIFNh
a2FyaSwNCj4+Pj4+DQo+Pj4+PiBUaGFuayB5b3UgZm9yIHlvdXIgZmVlZGJhY2suDQo+Pj4+PiBJ
IGhhdmUgbXkgY29tbWVudHMgaW5saW5lLg0KPj4+Pj4NCj4+Pj4+IEZyb206IFNha2FyaSBBaWx1
cyA8c2FrYXJpLmFpbHVzQGlraS5maT4NCj4+Pj4+IERhdGU6IEZyaSwgSnVuIDI4LCAyMDE5IGF0
IDE1OjEzOjI2DQo+Pj4+Pg0KPj4+Pj4+IEhpIEx1aXMsDQo+Pj4+Pj4NCj4+Pj4+PiBUaGFuayB5
b3UgZm9yIHRoZSBwYXRjaHNldC4NCj4+Pj4+Pg0KPj4+Pj4+IE9uIFR1ZSwgSnVuIDExLCAyMDE5
IGF0IDA5OjIwOjUwUE0gKzAyMDAsIEx1aXMgT2xpdmVpcmEgd3JvdGU6DQo+Pj4+Pj4+IEZyb206
IEx1aXMgT2xpdmVpcmEgPGxvbGl2ZWlAc3lub3BzeXMuY29tPg0KPj4+Pj4+Pg0KPj4+Pj4+PiBB
ZGQgYmluZGluZ3MgZm9yIFN5bm9wc3lzIERlc2lnbldhcmUgTUlQSSBDU0ktMiBob3N0Lg0KPj4+
Pj4+Pg0KPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBMdWlzIE9saXZlaXJhIDxsb2xpdmVpQHN5bm9w
c3lzLmNvbT4NCj4+Pj4+Pj4gLS0tDQo+Pj4+Pj4+IENoYW5nZWxvZw0KPj4+Pj4+PiB2My12NA0K
Pj4+Pj4+PiAtIHJlbW92ZSAicGxhdCIgZnJvbSB0aGUgYmxvY2sgbmFtZSBAcm9iIEBsYXVyZW50
DQo+Pj4+Pj4+IC0gcmVtb3ZlICJwaHktbmFtZXMiIHdoZW4gc2luZ2xlLWVudHJ5IEByb2INCj4+
Pj4+Pj4gLSByZW1vdmUgInNucHMsb3V0cHV0LXR5cGUiIC0+IHdlbnQgdG8gdGhlIGRyaXZlciBj
b25maWcgQGxhdXJlbnQNCj4+Pj4+Pj4NCj4+Pj4+Pj4gICAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZWRpYS9zbnBzLGR3LWNzaS50eHQgICAgICB8IDQxICsrKysrKysrKysrKysrKysrKysrKysN
Cj4+Pj4+Pj4gICAxIGZpbGUgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKQ0KPj4+Pj4+PiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEv
c25wcyxkdy1jc2kudHh0DQo+Pj4+Pj4+DQo+Pj4+Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvc25wcyxkdy1jc2kudHh0IGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3NucHMsZHctY3NpLnR4dA0KPj4+Pj4+PiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4+Pj4+PiBpbmRleCAwMDAwMDAwLi42MTNiN2Y5DQo+Pj4+
Pj4+IC0tLSAvZGV2L251bGwNCj4+Pj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21lZGlhL3NucHMsZHctY3NpLnR4dA0KPj4+Pj4+PiBAQCAtMCwwICsxLDQxIEBA
DQo+Pj4+Pj4+ICtTeW5vcHN5cyBEZXNpZ25XYXJlIENTSS0yIEhvc3QgY29udHJvbGxlcg0KPj4+
Pj4+PiArDQo+Pj4+Pj4+ICtEZXNjcmlwdGlvbg0KPj4+Pj4+PiArLS0tLS0tLS0tLS0NCj4+Pj4+
Pj4gKw0KPj4+Pj4+PiArVGhpcyBIVyBibG9jayBpcyB1c2VkIHRvIHJlY2VpdmUgaW1hZ2UgY29t
aW5nIGZyb20gYW4gTUlQSSBDU0ktMiBjb21wYXRpYmxlDQo+Pj4+Pj4+ICtjYW1lcmEuDQo+Pj4+
Pj4+ICsNCj4+Pj4+Pj4gK1JlcXVpcmVkIHByb3BlcnRpZXM6DQo+Pj4+Pj4+ICstIGNvbXBhdGli
bGUJCTogc2hhbGwgYmUgInNucHMsZHctY3NpIg0KPj4+Pj4+PiArLSByZWcJCQk6IHBoeXNpY2Fs
IGJhc2UgYWRkcmVzcyBhbmQgc2l6ZSBvZiB0aGUgZGV2aWNlIG1lbW9yeQ0KPj4+Pj4+PiArCQkJ
ICBtYXBwZWQgcmVnaXN0ZXJzOw0KPj4+Pj4+PiArLSBpbnRlcnJ1cHRzCQk6IERXIENTSS0yIEhv
c3QgaW50ZXJydXB0cw0KPj4+Pj4+PiArLSBwaHlzCQkJOiBMaXN0IG9mIG9uZSBQSFkgc3BlY2lm
aWVyIChhcyBkZWZpbmVkIGluDQo+Pj4+Pj4+ICsJCQkgIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9waHkvcGh5LWJpbmRpbmdzLnR4dCkuDQo+Pj4+Pj4+ICsJCQkgIFRoaXMgUEhZ
IGlzIGEgTUlQSSBEUEhZIHdvcmtpbmcgaW4gUlggbW9kZS4NCj4+Pj4+Pj4gKy0gcmVzZXRzCQk6
IFJlZmVyZW5jZSB0byBhIHJlc2V0IGNvbnRyb2xsZXIgKG9wdGlvbmFsKQ0KPj4+Pj4+PiArDQo+
Pj4+Pj4+ICtUaGUgcGVyLWJvYXJkIHNldHRpbmdzOg0KPj4+Pj4+PiArIC0gcG9ydCBzdWItbm9k
ZSBkZXNjcmliaW5nIGEgc2luZ2xlIGVuZHBvaW50IGNvbm5lY3RlZCB0byB0aGUgY2FtZXJhIGFz
DQo+Pj4+Pj4+ICsgICBkZXNjcmliZWQgaW4gdmlkZW8taW50ZXJmYWNlcy50eHRbMV0uDQo+Pj4+
Pj4NCj4+Pj4+PiBXaGljaCBlbmRwb2ludCBwcm9wZXJ0aWVzIGluIHZpZGVvLWludGVyZmFjZXMu
dHh0IGFyZSByZWxldmFudCBmb3IgdGhlDQo+Pj4+Pj4gaGFyZHdhcmU/IFdoaWNoIHZhbHVlcyBt
YXkgdGhleSBoYXZlPw0KPj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4gQ3VycmVudGx5IEknbSB1c2luZyBv
bmx5IHR3byBwcm9wZXJ0aWVzICJkYXRhLWxhbmVzIiBhbmQgImJ1cy13aWR0aCIsIGJ1dA0KPj4+
Pj4gSSBoYXZlIHBsYW5zIHRvIGFkZCBibGFua2luZyBpbmZvIGFsc28uDQo+Pj4+PiBJIHdpbGwg
YWRkIG1vcmUgaW5mby4NCj4+Pj4NCj4+Pj4gSXNuJ3QgYmxhbmtpbmcgZGVmaW5lZCBieSB3aGF0
IHRoZSB0cmFuc21pdHRlciBzZW5lZHM/IE9yIGRvIHlvdSBoYXZlDQo+Pj4+IGhhcmR3YXJlIGxp
bWl0YXRpb25zIG9uIHRoZSByZWNlaXZlciBzaWRlPw0KPj4+Pg0KPj4+DQo+Pj4gV2hlbiB3ZSB1
c2UgdGhpcyBJUCBpbiBwcm90b3R5cGluZyB3ZSBjb25maWd1cmUgYmxhbmtpbmcgYXQgdGhlIHJl
Y2VpdmVyDQo+Pj4gc2lkZS4NCj4+PiBTb21lIGNhbWVyYXMgZG9uJ3QgaGF2ZSBibGFua2luZyBj
b25maWd1cmF0aW9uIGNhcGFiaWxpdGllcyBzbyB3ZQ0KPj4+IGNvbmZpZ3VyZSBpdCBvbiB0aGUg
Ulggc2lkZS4NCj4+DQo+PiBJIGhhdmVuJ3QgY29tZSBhY3Jvc3MgYSBDU0ktMiBjb25uZWN0ZWQg
Y2FtZXJhIHdpdGhvdXQgc29tZSBraW5kIG9mDQo+PiBibGFua2luZyBjb25maWd1cmF0aW9uIGNh
cGFiaWxpdGllcy4gRXZlbiBpZiB0aGVyZSB3YXMgb25lLCB5b3UgY291bGRuJ3QNCj4+IGNvbmZp
Z3VyZSBibGFua2luZyBmcm9tIHRoZSByZWNlaXZlciBzaWRlLg0KPj4NCj4+IFBsZWFzZSBkb2N1
bWVudCB0aGF0IHRoZSBkYXRhLWxhbmVzIHByb3BlcnR5IGlzIHJlcXVpcmVkLCBhbmQgd2hpY2gg
dmFsdWVzDQo+PiBhcmUgcG9zc2libGUuDQo+Pg0KPiANCj4gT2ssIEkgd2lsbCBhZGQgdGhlIGRh
dGEtbGFuZXMgcHJvcGVydHkgdG8gdGhlIERvY3VtZW50YXRpb24uDQo+IA0KPj4+DQo+Pj4+IEkn
dmUgb25seSBoZWFyZCBvZiBvbmUgc3VjaCBjYXNlIGJlZm9yZSwgYW5kIGl0IHdhcyBhIHZlcnkg
b2xkIHBhcmFsbGVsDQo+Pj4+IHJlY2VpdmVyLg0KPj4+Pg0KPj4+PiBJZiB5b3UgaGF2ZSBhIENT
SS0yIHJlY2VpdmVyLCBidXMtd2lkdGggaXNuJ3QgcmVsZXZhbnQgLS0tIGl0J3MgZm9yIHBhcmFs
bGUNCj4+Pj4gaW50ZXJmYWNlcyBvbmx5LiBQbGVhc2UgYWRkIGRhdGEtbGFuZXMgdG8gcmVxdWly
ZWQgZW5kcG9pbnQgcHJvcGVydGllcy4NCj4+Pj4NCj4+Pg0KPj4+IEkgdXNlZCBidXMtd2lkdGgg
cHJvcGVydHkgaW4gdGhlIFN5bm9wc3lzIElQSSAoSW1hZ2UgUGl4ZWwgSW50ZXJmYWNlKQ0KPj4+
IHRoYXQgZW5hYmxlcyBkaXJlY3QgdmlkZW8gc3RyZWFtIGFjY2Vzcy4NCj4+PiBUaGlzIGludGVy
ZmFjZSBpcyBhbiBvdXRwdXQgdGhhdCBjYW4gYmUgMTYtYml0IG9yIDQ4LWJpdCwgdGhhdCdzIHdo
eSBJDQo+Pj4gdXNlZCBidXMtd2lkdGggcHJvcGVydHkuDQo+Pg0KPj4gRG9lcyB0aGlzIGRldmlj
ZSB3cml0ZSB0aGUgaW1hZ2UgZGF0YSB0byBzeXN0ZW0gbWVtb3J5LCBvciBpcyBpdCBhbm90aGVy
DQo+PiBkZXZpY2U/IElmIHRoZXJlJ3MgYW5vdGhlciBvbmUsIHRoZW4geW91IHNob3VsZCBwcm9i
YWJseSBoYXZlIGFub3RoZXIgcG9ydA0KPj4gdG8gZGVzY3JpYmUgdGhhdCBjb25uZWN0aW9uLg0K
Pj4NCj4gDQo+IFllcywgaXQgaXMgYW5vdGhlci4gSSBjYW4gYWRkIHRoYXQgY29ubmVjdGlvbiBw
b3J0IGFsc28uDQoNClllcyBwbGVhc2UuIEl0IGlzIGludGVyZXN0aW5nIGZvciBtZSB0byBzZWUg
aG93IHRvIGNvbm5lY3QgdGhlIG91dHB1dCBvZiANCnRoaXMgZGV2aWNlIHRvIGFub3RoZXIgbWVk
aWEgZGV2aWNlLCBhbmQgaG93IHRvIHNwZWNpZnkgdGhlIGJ1cyBpbiB0aGlzIA0Kc2l0dWF0aW9u
Lg0KDQpUaGFua3MsDQpFdWdlbg0KDQo+IA0KPiANCj4+IC0tIA0KPj4gS2luZCByZWdhcmRzLA0K
Pj4NCj4+IFNha2FyaSBBaWx1cw0KPiANCj4gVGhhbmsgeW91LA0KPiANCj4gTHVpcw0KPiANCj4g
DQo=
