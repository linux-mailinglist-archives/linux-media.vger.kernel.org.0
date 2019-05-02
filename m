Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F87211A18
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2019 15:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbfEBNYR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 May 2019 09:24:17 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:2440 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbfEBNYR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 May 2019 09:24:17 -0400
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
X-IronPort-AV: E=Sophos;i="5.60,421,1549954800"; 
   d="scan'208";a="31756325"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA; 02 May 2019 06:24:15 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.106) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Thu, 2 May 2019 06:24:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzwzmfzeZZZJGdJwV8yIHcCSpmJ5GNr/OLMrfbXAvPA=;
 b=zSlejMrt6fQKno6I2PstRRfh9D2BB779Axt6br+DpPa3Hqnow5uoj2W1sPM9MoxhdLTRzVlzNxCkFRRTOsly5rL8GqBOYZOFj9a3uZAIK0339mNYQw8phuh9TQEIVtBjrWxcNjYntnntq2BYU3LEGNB4ltRW8eZwcSN9qOzbDH4=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1289.namprd11.prod.outlook.com (10.168.103.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Thu, 2 May 2019 13:24:12 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::e0e3:1d51:9e3e:6dc]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::e0e3:1d51:9e3e:6dc%3]) with mapi id 15.20.1856.008; Thu, 2 May 2019
 13:24:12 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>
CC:     <p.zabel@pengutronix.de>
Subject: Re: [GIT PULL FOR v5.3] atmel-isc and coda enhancements
Thread-Topic: [GIT PULL FOR v5.3] atmel-isc and coda enhancements
Thread-Index: AQHVAOkoAwQ3gjMhGUST5QLthQS+1qZX0X0A
Date:   Thu, 2 May 2019 13:24:12 +0000
Message-ID: <9d5fbba6-0835-8665-9e47-9fbc17ca6022@microchip.com>
References: <1fc4f310-aa97-fa5f-ed1b-1253caabb003@xs4all.nl>
In-Reply-To: <1fc4f310-aa97-fa5f-ed1b-1253caabb003@xs4all.nl>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0701CA0042.eurprd07.prod.outlook.com
 (2603:10a6:800:90::28) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190502161922650
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e3839bc-ad2c-466e-3c4a-08d6cf0176f1
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:DM5PR11MB1289;
x-ms-traffictypediagnostic: DM5PR11MB1289:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR11MB1289B1891B8CE9092A1F45A8E8340@DM5PR11MB1289.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1060;
x-forefront-prvs: 0025434D2D
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(39860400002)(346002)(366004)(376002)(396003)(189003)(199004)(73956011)(66946007)(102836004)(66446008)(64756008)(66476007)(66556008)(53936002)(4326008)(6436002)(31696002)(6506007)(6246003)(229853002)(6486002)(6512007)(386003)(68736007)(36756003)(71200400001)(6306002)(53546011)(66066001)(71190400001)(6116002)(3846002)(86362001)(26005)(186003)(25786009)(2906002)(81156014)(2616005)(305945005)(446003)(966005)(486006)(316002)(72206003)(476003)(14444005)(76176011)(256004)(11346002)(7736002)(110136005)(8936002)(8676002)(81166006)(14454004)(5660300002)(52116002)(31686004)(478600001)(99286004);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1289;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: epV9KmuNMBpOCXumW1A17u/TBBXjlUGMs55FXG7qLOK1ukBdRLkXoVkvI8l6jkEek2iBIOfIdy3EmnQwxV8WAwOs6/wPH7UK+Q7guUdH/e7JVCWHjpZBc8DPVUcOLhoPUjZPDpdGWskGBfr55gvCxOil45MCOT0ZCnboCgqFoBcR0JYiGORcMsFt5K9lazm57Am9mLn5OXdfRZgcnMTEoa70b8y6XTblLxXm0KOIiHH8AUnPcwrdLTCIDWorOX2qzEqz5NqLOTuxpvtFfJj+l8ndcN8eMRbwigWetx/zojtsITIW3PmDMbQJ4wLSjRgOC5U6wlQWiKCl3c9Iy7+PyA6BLGXiGTAZnY+3u/xt21Qfer8wZyxu7q2kzhI/1mjQpAf1+YOtuIUT1H86gxk7UOcSnxSUaKIOMxwFBSInJzE=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F8EFC3D0C010724F9750E50D3CB2B736@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e3839bc-ad2c-466e-3c4a-08d6cf0176f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2019 13:24:12.3547
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1289
X-OriginatorOrg: microchip.com
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGVsbG8gSGFucywNCg0KV291bGQgYmUgZ3JlYXQgaWYgeW91IGNvdWxkIGF0IGxlYXN0IGdldCB0
aGlzIGludG8gNS4yIDoNCg0KbWVkaWE6IGF0bWVsOiBhdG1lbC1pc2M6IG1ha2UgdHJ5X2ZtdCBl
cnJvciBsZXNzIHZlcmJvc2UNCg0KSSBub3RpY2VkIHNldmVyYWwgc2Vuc29yIGRyaXZlcnMgYWN0
IGluIGEgd2F5IHRoYXQgbWFrZXMgdGhpcyBtZXNzYWdlIA0KYXBwZWFyIGEgbG90LCB3aGVuIHRo
ZSBzZW5zb3JzIGFjdHVhbGx5IHdvcmsgZmluZS4gVGhleSBqdXN0IHJldHVybiANCmVycm9ycyBp
biB0cnlfZm10IGlmIHRoZSBmb3JtYXQgaXMgbm90IHN1cHBvcnRlZCwgd2hpY2ggaXMgbm90IGEg
cHJvcGVyIA0Kd2F5IHRvIGRvIGl0LCBidXQgb2ggd2VsbCwgd2UgaGF2ZSB0byBjb3BlIHdpdGgg
dGhhdCBpbiB0aGUgY2FsbGVyLg0KQXBwbGljYXRpb25zIGxpa2UgZ3N0cmVhbWVyIHdpbGwgY2Fs
bCB0aGlzIG1hbnkgdGltZXMgZnJvbSBzb21ldGhpbmcgDQpsaWtlIGFuIGVudW1fZm10IGl0ZXJh
dGlvbiwgd2hpY2ggd2lsbCBldmVudHVhbGx5IHdvcmssIGJ1dCwgdGhlIA0KYXRtZWxfaXNjIHdp
bGwga2VlcCBwcmludGluZyBmYXVsdHkgbWVzc2FnZXMsIHdoaWNoIGlzIG5vdCBleGFjdGx5IA0K
c29tZXRoaW5nIGRlc2lyZWQgaW4gdGhpcyBzaXR1YXRpb24uDQoNCihvciBpZiBpdCdzIG5vdCBw
b3NzaWJsZSBub3cgdGhlbiBtYXliZSBhcyAtcmMgcGF0Y2ggbGF0ZXIgb24uLi4pDQoNClRoYW5r
cywNCkV1Z2VuDQoNCk9uIDAyLjA1LjIwMTkgMTY6MTMsIEhhbnMgVmVya3VpbCB3cm90ZToNCg0K
PiBUaGlzIHByZXZpb3VzIFBSIGh0dHBzOi8vcGF0Y2h3b3JrLmxpbnV4dHYub3JnL3BhdGNoLzU1
ODE4LyBpcyBub3cgc3BsaXQNCj4gaW4gdHdvLCBvbmUgd2l0aCBwYXRjaGVzIGZvciA1LjIgYW5k
IG9uZSB3aXRoIHN0dWZmIHRoYXQgY2FuIGdvIGludG8gNS4zLg0KPiANCj4gVGhpcyBQUiBjb250
YWlucyB0aGUgcGF0Y2hlcyB3aXRoIG5ldyBmZWF0dXJlcyBmb3IgNS4zLg0KPiANCj4gUmVnYXJk
cywNCj4gDQo+IAlIYW5zDQo+IA0KPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0
IDdhZmE4ZGIzMjNlMzdiOTE3NGNmNzhhMWM5YWIwYWU3YTlmNWU3ZGQ6DQo+IA0KPiAgICBtZWRp
YTogdnNwMTogQWRkIHN1cHBvcnQgZm9yIG1pc3NpbmcgMTYtYml0IFJHQjU1NSBmb3JtYXRzICgy
MDE5LTA0LTI1IDExOjA3OjA1IC0wNDAwKQ0KPiANCj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0
IHJlcG9zaXRvcnkgYXQ6DQo+IA0KPiAgICBnaXQ6Ly9saW51eHR2Lm9yZy9odmVya3VpbC9tZWRp
YV90cmVlLmdpdCB0YWdzL2JyLXY1LjNhDQo+IA0KPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMg
dXAgdG8gNzNkMTM1MWZiN2Q3ZGFmZDg4ZDE1ODQ4YmZhY2ZlOWYxNmIxMzM1MToNCj4gDQo+ICAg
IG1lZGlhOiBjb2RhOiB1c2UgdjRsMl9tMm1fYnVmX2NvcHlfbWV0YWRhdGEgKDIwMTktMDUtMDIg
MTU6MDQ6NTMgKzAyMDApDQo+IA0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IFRhZyBicmFuY2gNCj4gDQo+IC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0NCj4gRXVnZW4gSHJpc3RldiAoNCk6DQo+ICAgICAgICBtZWRpYTogYXRtZWw6IGF0bWVsLWlz
YzogcmV3b3JrZWQgd2hpdGUgYmFsYW5jZSBmZWF0dXJlDQo+ICAgICAgICBtZWRpYTogdjRsMi1j
dHJsOiBmaXggZmxhZ3MgZm9yIERPX1dISVRFX0JBTEFOQ0UNCj4gICAgICAgIG1lZGlhOiBhdG1l
bDogYXRtZWwtaXNjOiBhZGQgc3VwcG9ydCBmb3IgRE9fV0hJVEVfQkFMQU5DRQ0KPiAgICAgICAg
bWVkaWE6IGF0bWVsOiBhdG1lbC1pc2M6IG1ha2UgdHJ5X2ZtdCBlcnJvciBsZXNzIHZlcmJvc2UN
Cj4gDQo+IFBoaWxpcHAgWmFiZWwgKDEyKToNCj4gICAgICAgIG1lZGlhOiBjb2RhOiBtb3ZlIHJl
Z2lzdGVyIGRlYnVnZ2luZyB0byBjb2RhX2RlYnVnIGxldmVsIDMNCj4gICAgICAgIG1lZGlhOiBj
b2RhOiBtb3ZlIGpvYiByZWFkeSBtZXNzYWdlIHRvIGNvZGFfZGVidWcgbGV2ZWwgMg0KPiAgICAg
ICAgbWVkaWE6IGNvZGE6IGFkZCBjb2RhX2ZyYW1lX3R5cGVfY2hhciBoZWxwZXINCj4gICAgICAg
IG1lZGlhOiBjb2RhOiBpbXByb3ZlIGRlY29kZXIgam9iIGZpbmlzaGVkIGRlYnVnIG1lc3NhZ2UN
Cj4gICAgICAgIG1lZGlhOiBjb2RhOiBkZW1vdGUgc19jdHJsIGRlYnVnIG1lc3NhZ2VzIHRvIGxl
dmVsIDINCj4gICAgICAgIG1lZGlhOiBjb2RhOiBhZGQgbWVudSBzdHJpbmdzIHRvIHNfY3RybCBk
ZWJ1ZyBvdXRwdXQNCj4gICAgICAgIG1lZGlhOiBjb2RhOiB1cGRhdGUgcHJvZmlsZSBhbmQgbGV2
ZWwgY29udHJvbHMgYWZ0ZXIgc2VxdWVuY2UgaW5pdGlhbGl6YXRpb24NCj4gICAgICAgIG1lZGlh
OiBjb2RhOiBhZGQgZGVjb2RlciBNUEVHLTQgcHJvZmlsZSBhbmQgbGV2ZWwgY29udHJvbHMNCj4g
ICAgICAgIG1lZGlhOiB2NGwyLWN0cmw6IGFkZCBNUEVHLTIgcHJvZmlsZSBhbmQgbGV2ZWwgY29u
dHJvbHMNCj4gICAgICAgIG1lZGlhOiBjb2RhOiBhZGQgZGVjb2RlciBNUEVHLTIgcHJvZmlsZSBh
bmQgbGV2ZWwgY29udHJvbHMNCj4gICAgICAgIG1lZGlhOiBjb2RhOiBhZGQgbG9ja2RlcCBhc3Nl
cnRzDQo+ICAgICAgICBtZWRpYTogY29kYTogdXNlIHY0bDJfbTJtX2J1Zl9jb3B5X21ldGFkYXRh
DQo+IA0KPiAgIERvY3VtZW50YXRpb24vbWVkaWEvdWFwaS92NGwvZXh0LWN0cmxzLWNvZGVjLnJz
dCB8ICA1NiArKysrKysrKysrKysrKysrKysrDQo+ICAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9h
dG1lbC9hdG1lbC1pc2MtcmVncy5oICAgIHwgICA2ICsrLQ0KPiAgIGRyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vYXRtZWwvYXRtZWwtaXNjLmMgICAgICAgICB8IDI2MyArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLQ0KPiAgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY29kYS9NYWtlZmlsZSAg
ICAgICAgICAgICB8ICAgMiArLQ0KPiAgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY29kYS9jb2Rh
LWJpdC5jICAgICAgICAgICB8ICA2OSArKysrKysrKysrKysrKysrKysrLS0tLS0NCj4gICBkcml2
ZXJzL21lZGlhL3BsYXRmb3JtL2NvZGEvY29kYS1jb21tb24uYyAgICAgICAgfCAxMjkgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0NCj4gICBkcml2ZXJzL21lZGlh
L3BsYXRmb3JtL2NvZGEvY29kYS1tcGVnMi5jICAgICAgICAgfCAgNDQgKysrKysrKysrKysrKysr
DQo+ICAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jb2RhL2NvZGEtbXBlZzQuYyAgICAgICAgIHwg
IDQ4ICsrKysrKysrKysrKysrKysrDQo+ICAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jb2RhL2Nv
ZGEuaCAgICAgICAgICAgICAgIHwgIDE0ICsrKysrDQo+ICAgZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9jb2RhL2NvZGFfcmVncy5oICAgICAgICAgIHwgICAyICstDQo+ICAgZHJpdmVycy9tZWRpYS92
NGwyLWNvcmUvdjRsMi1jdHJscy5jICAgICAgICAgICAgIHwgIDI0ICsrKysrKysrKw0KPiAgIGlu
Y2x1ZGUvdWFwaS9saW51eC92NGwyLWNvbnRyb2xzLmggICAgICAgICAgICAgICB8ICAxOCArKysr
KysrDQo+ICAgMTIgZmlsZXMgY2hhbmdlZCwgNTk3IGluc2VydGlvbnMoKyksIDc4IGRlbGV0aW9u
cygtKQ0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL2NvZGEv
Y29kYS1tcGVnMi5jDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vY29kYS9jb2RhLW1wZWc0LmMNCj4gDQo=
