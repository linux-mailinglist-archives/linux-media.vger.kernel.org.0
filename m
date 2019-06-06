Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8121D36F0B
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 10:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbfFFIrq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 04:47:46 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:43062 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbfFFIrq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jun 2019 04:47:46 -0400
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.63,558,1557212400"; 
   d="scan'208";a="36407845"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jun 2019 01:47:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex03.mchp-main.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 6 Jun 2019 01:47:41 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Thu, 6 Jun 2019 01:47:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRYRWqNzRt7RZlVdD3goChalYmPE57C7upY/ss/Rkpc=;
 b=BHpJcq9M+g4x58Oe5rSoXtEGJbhpetLwTg2tPEDxvdiCAWD82BhKUblUikO3pAbxmcCl4Ti4DLQXbDYk6VNg1Po01VAm4Bu8MjmOPc8ac+e5Ey3xVOe2ECZGN/hEQtS23UPZLflEI7aZl8sbvsioniEkMXELmibzS48TajgRUPE=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1962.namprd11.prod.outlook.com (10.175.88.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.13; Thu, 6 Jun 2019 08:47:38 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::2807:f606:3b7c:cce9]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::2807:f606:3b7c:cce9%9]) with mapi id 15.20.1965.011; Thu, 6 Jun 2019
 08:47:38 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <sakari.ailus@iki.fi>
CC:     <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] media: atmel: atmel-sama5d2-isc: fixed checkpatch
 warnings
Thread-Topic: [PATCH v3 2/2] media: atmel: atmel-sama5d2-isc: fixed checkpatch
 warnings
Thread-Index: AQHVHDuT5UCMUNFMLE2y7UE951xen6aOTL6AgAACmwA=
Date:   Thu, 6 Jun 2019 08:47:38 +0000
Message-ID: <e251dfc2-f646-fd61-ec6a-adbc984b4e18@microchip.com>
References: <1559806756-16683-1-git-send-email-eugen.hristev@microchip.com>
 <1559806756-16683-2-git-send-email-eugen.hristev@microchip.com>
 <20190606083407.av2ifw4lr5w3pdxi@valkosipuli.retiisi.org.uk>
In-Reply-To: <20190606083407.av2ifw4lr5w3pdxi@valkosipuli.retiisi.org.uk>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR03CA0073.eurprd03.prod.outlook.com
 (2603:10a6:803:50::44) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190606114326204
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3756d70-5126-40aa-de6e-08d6ea5ba0ea
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1962;
x-ms-traffictypediagnostic: DM5PR11MB1962:
x-microsoft-antispam-prvs: <DM5PR11MB19625D0E36897BC721769A7BE8170@DM5PR11MB1962.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(136003)(396003)(366004)(39860400002)(189003)(51234002)(199004)(71200400001)(71190400001)(66066001)(4326008)(36756003)(186003)(53936002)(6246003)(81156014)(31696002)(3846002)(7736002)(54906003)(478600001)(6116002)(305945005)(2906002)(86362001)(25786009)(81166006)(8676002)(72206003)(446003)(8936002)(14444005)(64756008)(102836004)(229853002)(99286004)(6512007)(14454004)(26005)(66946007)(73956011)(5660300002)(66556008)(66476007)(6486002)(68736007)(31686004)(6436002)(52116002)(6916009)(316002)(53546011)(6506007)(386003)(2616005)(476003)(11346002)(66446008)(76176011)(256004)(486006);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1962;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +8CJYGsE46SgshbjnpGHuNwSK7epa8CYB5zEHF4c6b6Ssw5FqascErDoQ4hVx3uK8Ep5YQu/fPdpPZEDNFZN4k4NeKScFiOkSmnLSo3T/5QstVluYLXA//aU3AVgRGbYkW50Baf0QYKq3ENFRtnNOFx4J8tXFOH1Nom/4Ctk4WZVNReWhcYq7bChaoWgfa7G55UmBW88ONgZQwVcAzsa99O1l199NFFRmxmhNyyuPpgMM6SfGxUKDJjZ/IlxScBzYj0a8QosNavOPY1QnHilkblJRQP5ZWnN6HOeiMkEr4wIYLJK5a+MgZVFsZw4Byl2vYaqGl6G7SkWkqFw61vO83EM6afrXCGdrczE9j+5Cb0MDiemXcaEMN3x+Ia53OxOuWY2SR11nst3A9D74l5nRmgnUKAaLWy4Pp7x9lYb6DA=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E3C8BA26E91D034B8E14F6AC0DD9DD8C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c3756d70-5126-40aa-de6e-08d6ea5ba0ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 08:47:38.4346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eugen.hristev@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1962
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQoNCk9uIDA2LjA2LjIwMTkgMTE6MzQsIFNha2FyaSBBaWx1cyB3cm90ZToNCg0KPiBIaSBFdWdl
biwNCj4gDQo+IE9uIFRodSwgSnVuIDA2LCAyMDE5IGF0IDA3OjQzOjQ3QU0gKzAwMDAsIEV1Z2Vu
LkhyaXN0ZXZAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+IEZyb206IEV1Z2VuIEhyaXN0ZXYgPGV1
Z2VuLmhyaXN0ZXZAbWljcm9jaGlwLmNvbT4NCj4+DQo+PiBDaGVja3BhdGNoIGNvbXBsYWluaW5n
IHRoYXQgbG9ja3MgZG8gbm90IGhhdmUgY29tbWVudHMsDQo+PiB1bmFsaWduZWQgY29kZSBhbmQg
bWFjcm8gcmV1c2Ugb2Ygc2FtZSBhcmd1bWVudCBpbiB0b19pc2NfY2xrLg0KPj4gRml4ZWQgdGhl
bSBieSByZW5hbWluZywgcmVhbGlnbmluZyBhbmQgYWRkaW5nIHN0cnVjdCBjb21tZW50cw0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IEV1Z2VuIEhyaXN0ZXYgPGV1Z2VuLmhyaXN0ZXZAbWljcm9jaGlw
LmNvbT4NCj4+IC0tLQ0KPj4gQ2hhbmdlcyBpbiB2MzoNCj4+IC0gbmV3IHBhdGNoLCBhZGRyZXNz
ZXMgdGhlIGNoZWNrcGF0Y2ggaXNzdWVzIHRoYXQgSGFucyBhc2tlZCB0byBmaXgNCj4+DQo+PiAg
IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYXRtZWwvYXRtZWwtaXNjLmggICAgICAgICB8IDUxICsr
KysrKysrKysrKysrKysrKysrKy0tLQ0KPj4gICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVs
L2F0bWVsLXNhbWE1ZDItaXNjLmMgfCAgNCArLQ0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDQ4IGlu
c2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vYXRtZWwvYXRtZWwtaXNjLmggYi9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L2F0bWVsL2F0bWVsLWlzYy5oDQo+PiBpbmRleCAwYmQ1ZGZmLi42ZmY5ZmE4IDEwMDY0NA0KPj4g
LS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1pc2MuaA0KPj4gKysrIGIv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1pc2MuaA0KPj4gQEAgLTI0LDE0ICsy
NCwxNCBAQCBzdHJ1Y3QgaXNjX2NsayB7DQo+PiAgIAlzdHJ1Y3QgY2xrX2h3ICAgaHc7DQo+PiAg
IAlzdHJ1Y3QgY2xrICAgICAgKmNsazsNCj4+ICAgCXN0cnVjdCByZWdtYXAgICAqcmVnbWFwOw0K
Pj4gLQlzcGlubG9ja190CWxvY2s7DQo+PiArCXNwaW5sb2NrX3QJbG9jazsJLyogc3luY2hyb25p
emUgYWNjZXNzIHRvIGNsb2NrIHJlZ2lzdGVycyAqLw0KPiANCj4gWW91IHByb2JhYmx5IHdhbnQg
dG8gc2VyaWFsaXNlIHRoZSBhY2Nlc3MsIG5vdCBzeW5jaHJvbmlzZSBpdCAoaS5lLiBoYXBwZW4N
Cj4gYXQgdGhlIHNhbWUgdGltZSkuIFNvLCBzL3N5bmNocm9uaXNlL3NlcmlhbGlzZS8gPw0KDQpI
ZWxsbyBTYWthcmksDQoNCkZvciBzdXJlLCB3aGF0IEkgbWVhbnQgaXMgdG8gdXNlIGFjY2VzcyBz
eW5jaHJvbml6YXRpb24gOiBkbyBub3QgYWNjZXNzIA0KaW4gdGhlIHNhbWUgdGltZSAoc3luY2hy
b25pemUgb25lIHdpdGggYW5vdGhlciB0byBhdm9pZCBjb3JydXB0aW9uIG9mIA0KZGF0YSwgZXRj
LikNCg0KWW91IGJlbGlldmUgc2VyaWFsaXplIGlzIGEgYmV0dGVyIHRlcm0gPyBJIGNvbnNpZGVy
ZWQgJ3N5bmNocm9uaXphdGlvbicgDQp0byBiZSBtb3JlIGdlbmVyaWMgOiB0aGlzIGRlZmluaXRp
b24gd2hpY2ggSSBmb3VuZCBvbmxpbmUgOg0KRGF0YSBzeW5jaHJvbml6YXRpb24gaXMgdGhlIHBy
b2Nlc3Mgb2YgbWFpbnRhaW5pbmcgdGhlIGNvbnNpc3RlbmN5IGFuZCANCnVuaWZvcm1pdHkgb2Yg
ZGF0YSBpbnN0YW5jZXMgYWNyb3NzIGFsbCBjb25zdW1pbmcgYXBwbGljYXRpb25zIGFuZCANCnN0
b3JpbmcgZGV2aWNlcy4gSXQgZW5zdXJlcyB0aGF0IHRoZSBzYW1lIGNvcHkgb3IgdmVyc2lvbiBv
ZiBkYXRhIGlzIA0KdXNlZCBpbiBhbGwgZGV2aWNlcyAtIGZyb20gc291cmNlIHRvIGRlc3RpbmF0
aW9uLg0KDQpJZiB5b3UgdGhpbmsgc2VyaWFsaXplIGlzIGJldHRlciBJIGNhbiBjaGFuZ2UgaXQN
Cg0KRXVnZW4NCj4gDQo+IFNhbWUgb24gdGhlIGlzY19kZXZpY2UgZmllbGRzIGJlbG93Lg0KPiAN
Cj4gV2l0aCB0aGF0LA0KPiANCj4gQWNrZWQtYnk6IFNha2FyaSBBaWx1cyA8c2FrYXJpLmFpbHVz
QGxpbnV4LmludGVsLmNvbT4NCj4gDQo+PiAgIAl1OAkJaWQ7DQo+PiAgIAl1OAkJcGFyZW50X2lk
Ow0KPj4gICAJdTMyCQlkaXY7DQo+PiAgIAlzdHJ1Y3QgZGV2aWNlCSpkZXY7DQo+PiAgIH07DQo+
PiAgIA0KPj4gLSNkZWZpbmUgdG9faXNjX2NsayhodykgY29udGFpbmVyX29mKGh3LCBzdHJ1Y3Qg
aXNjX2NsaywgaHcpDQo+PiArI2RlZmluZSB0b19pc2NfY2xrKHYpIGNvbnRhaW5lcl9vZih2LCBz
dHJ1Y3QgaXNjX2NsaywgaHcpDQo+PiAgIA0KPj4gICBzdHJ1Y3QgaXNjX2J1ZmZlciB7DQo+PiAg
IAlzdHJ1Y3QgdmIyX3Y0bDJfYnVmZmVyICB2YjsNCj4+IEBAIC0xNDYsNiArMTQ2LDQ3IEBAIHN0
cnVjdCBpc2NfY3RybHMgew0KPj4gICANCj4+ICAgI2RlZmluZSBJU0NfUElQRV9MSU5FX05PREVf
TlVNCTExDQo+PiAgIA0KPj4gKy8qDQo+PiArICogc3RydWN0IGlzY19kZXZpY2UgLSBJU0MgZGV2
aWNlIGRyaXZlciBkYXRhL2NvbmZpZyBzdHJ1Y3QNCj4+ICsgKiBAcmVnbWFwOgkJUmVnaXN0ZXIg
bWFwDQo+PiArICogQGhjbG9jazoJCUhjbG9jayBjbG9jayBpbnB1dCAocmVmZXIgZGF0YXNoZWV0
KQ0KPj4gKyAqIEBpc3BjazoJCWlzY3BjayBjbG9jayAocmVmZXIgZGF0YXNoZWV0KQ0KPj4gKyAq
IEBpc2NfY2xrczoJCUlTQyBjbG9ja3MNCj4+ICsgKg0KPj4gKyAqIEBkZXY6CQlSZWdpc3RlcmVk
IGRldmljZSBkcml2ZXINCj4+ICsgKiBAdjRsMl9kZXY6CQl2NGwyIHJlZ2lzdGVyZWQgZGV2aWNl
DQo+PiArICogQHZpZGVvX2RldjoJCXJlZ2lzdGVyZWQgdmlkZW8gZGV2aWNlDQo+PiArICoNCj4+
ICsgKiBAdmIyX3ZpZHE6CQl2aWRlbyBidWZmZXIgMiB2aWRlbyBxdWV1ZQ0KPj4gKyAqIEBkbWFf
cXVldWVfbG9jazoJbG9jayB0byBzeW5jaHJvbml6ZSB0aGUgZG1hIGJ1ZmZlciBxdWV1ZQ0KPj4g
KyAqIEBkbWFfcXVldWU6CQl0aGUgcXVldWUgZm9yIGRtYSBidWZmZXJzDQo+PiArICogQGN1cl9m
cm06CQljdXJyZW50IGlzYyBmcmFtZS9idWZmZXINCj4+ICsgKiBAc2VxdWVuY2U6CQljdXJyZW50
IGZyYW1lIG51bWJlcg0KPj4gKyAqIEBzdG9wOgkJdHJ1ZSBpZiBpc2MgaXMgbm90IHN0cmVhbWlu
ZywgZmFsc2UgaWYgc3RyZWFtaW5nDQo+PiArICogQGNvbXA6CQljb21wbGV0aW9uIHJlZmVyZW5j
ZSB0aGF0IHNpZ25hbHMgZnJhbWUgY29tcGxldGlvbg0KPj4gKyAqDQo+PiArICogQGZtdDoJCWN1
cnJlbnQgdjQybCBmb3JtYXQNCj4+ICsgKiBAdXNlcl9mb3JtYXRzOglsaXN0IG9mIGZvcm1hdHMg
dGhhdCBhcmUgc3VwcG9ydGVkIGFuZCBhZ3JlZWQgd2l0aCBzZA0KPj4gKyAqIEBudW1fdXNlcl9m
b3JtYXRzOglob3cgbWFueSBmb3JtYXRzIGFyZSBpbiB1c2VyX2Zvcm1hdHMNCj4+ICsgKg0KPj4g
KyAqIEBjb25maWc6CQljdXJyZW50IElTQyBmb3JtYXQgY29uZmlndXJhdGlvbg0KPj4gKyAqIEB0
cnlfY29uZmlnOgkJdGhlIGN1cnJlbnQgSVNDIHRyeSBmb3JtYXQgLCBub3QgeWV0IGFjdGl2YXRl
ZA0KPj4gKyAqDQo+PiArICogQGN0cmxzOgkJaG9sZHMgaW5mb3JtYXRpb24gYWJvdXQgSVNDIGNv
bnRyb2xzDQo+PiArICogQGRvX3diX2N0cmw6CQljb250cm9sIHJlZ2FyZGluZyB0aGUgRE9fV0hJ
VEVfQkFMQU5DRSBidXR0b24NCj4+ICsgKiBAYXdiX3dvcms6CQl3b3JrcXVldWUgcmVmZXJlbmNl
IGZvciBhdXRvd2hpdGViYWxhbmNlIGhpc3RvZ3JhbQ0KPj4gKyAqCQkJYW5hbHlzaXMNCj4+ICsg
Kg0KPj4gKyAqIEBsb2NrOgkJbG9jayBmb3Igc3luY2hyb25pemluZyB1c2Vyc3BhY2UgZmlsZSBv
cGVyYXRpb25zDQo+PiArICoJCQl3aXRoIElTQyBvcGVyYXRpb25zDQo+PiArICogQGF3Yl9sb2Nr
OgkJbG9jayBmb3Igc3luY2hyb25pemluZyBhd2Igd29yayBxdWV1ZSBvcGVyYXRpb25zDQo+PiAr
ICoJCQl3aXRoIERNQS9idWZmZXIgb3BlcmF0aW9ucw0KPj4gKyAqDQo+PiArICogQHBpcGVsaW5l
OgkJY29uZmlndXJhdGlvbiBvZiB0aGUgSVNDIHBpcGVsaW5lDQo+PiArICoNCj4+ICsgKiBAY3Vy
cmVudF9zdWJkZXY6CWN1cnJlbnQgc3ViZGV2aWNlOiB0aGUgc2Vuc29yDQo+PiArICogQHN1YmRl
dl9lbnRpdGllczoJbGlzdCBvZiBzdWJkZXZpY2UgZW50aXRpdGVzDQo+PiArICovDQo+PiAgIHN0
cnVjdCBpc2NfZGV2aWNlIHsNCj4+ICAgCXN0cnVjdCByZWdtYXAJCSpyZWdtYXA7DQo+PiAgIAlz
dHJ1Y3QgY2xrCQkqaGNsb2NrOw0KPj4gQEAgLTE1Nyw3ICsxOTgsNyBAQCBzdHJ1Y3QgaXNjX2Rl
dmljZSB7DQo+PiAgIAlzdHJ1Y3QgdmlkZW9fZGV2aWNlCXZpZGVvX2RldjsNCj4+ICAgDQo+PiAg
IAlzdHJ1Y3QgdmIyX3F1ZXVlCXZiMl92aWRxOw0KPj4gLQlzcGlubG9ja190CQlkbWFfcXVldWVf
bG9jazsNCj4+ICsJc3BpbmxvY2tfdAkJZG1hX3F1ZXVlX2xvY2s7IC8qIHN5bmMgYWNjZXNzIHRv
IGRtYSBxdWV1ZSAqLw0KPj4gICAJc3RydWN0IGxpc3RfaGVhZAlkbWFfcXVldWU7DQo+PiAgIAlz
dHJ1Y3QgaXNjX2J1ZmZlcgkqY3VyX2ZybTsNCj4+ICAgCXVuc2lnbmVkIGludAkJc2VxdWVuY2U7
DQo+PiBAQCAtMTc1LDggKzIxNiw4IEBAIHN0cnVjdCBpc2NfZGV2aWNlIHsNCj4+ICAgCXN0cnVj
dCB2NGwyX2N0cmwJKmRvX3diX2N0cmw7DQo+PiAgIAlzdHJ1Y3Qgd29ya19zdHJ1Y3QJYXdiX3dv
cms7DQo+PiAgIA0KPj4gLQlzdHJ1Y3QgbXV0ZXgJCWxvY2s7DQo+PiAtCXNwaW5sb2NrX3QJCWF3
Yl9sb2NrOw0KPj4gKwlzdHJ1Y3QgbXV0ZXgJCWxvY2s7IC8qIHN5bmMgYWNjZXNzIHRvIGZpbGUg
b3BlcmF0aW9ucyAqLw0KPj4gKwlzcGlubG9ja190CQlhd2JfbG9jazsgLyogc3luYyBhY2Nlc3Mg
dG8gRE1BIGJ1ZmZlcnMgZnJvbSBhd2Igd29yayBxdWV1ZSAqLw0KPj4gICANCj4+ICAgCXN0cnVj
dCByZWdtYXBfZmllbGQJKnBpcGVsaW5lW0lTQ19QSVBFX0xJTkVfTk9ERV9OVU1dOw0KPj4gICAN
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLXNhbWE1
ZDItaXNjLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLXNhbWE1ZDItaXNj
LmMNCj4+IGluZGV4IDY5ZmFhYWYuLjI5OTI0M2YgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLXNhbWE1ZDItaXNjLmMNCj4+ICsrKyBiL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vYXRtZWwvYXRtZWwtc2FtYTVkMi1pc2MuYw0KPj4gQEAgLTg3LDggKzg3
LDggQEAgc3RhdGljIGludCBpc2NfcGFyc2VfZHQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3Qg
aXNjX2RldmljZSAqaXNjKQ0KPj4gICAJCQlicmVhazsNCj4+ICAgCQl9DQo+PiAgIA0KPj4gLQkJ
c3ViZGV2X2VudGl0eSA9IGRldm1fa3phbGxvYyhkZXYsDQo+PiAtCQkJCQkgIHNpemVvZigqc3Vi
ZGV2X2VudGl0eSksIEdGUF9LRVJORUwpOw0KPj4gKwkJc3ViZGV2X2VudGl0eSA9IGRldm1fa3ph
bGxvYyhkZXYsIHNpemVvZigqc3ViZGV2X2VudGl0eSksDQo+PiArCQkJCQkgICAgIEdGUF9LRVJO
RUwpOw0KPj4gICAJCWlmICghc3ViZGV2X2VudGl0eSkgew0KPj4gICAJCQlvZl9ub2RlX3B1dChy
ZW0pOw0KPj4gICAJCQlyZXQgPSAtRU5PTUVNOw0KPj4gLS0gDQo+PiAyLjcuNA0KPj4NCj4gDQo=
