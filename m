Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26F8B1B21F3
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 10:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728340AbgDUIpN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 04:45:13 -0400
Received: from mail-bn8nam11on2041.outbound.protection.outlook.com ([40.107.236.41]:34048
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726018AbgDUIpM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 04:45:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zt54bysQmI1NtuNZ0q7MUybRvcTHQ16iD/q8X2ysoEdiWof+q3tlQTT+bR0rJxKd0zG8Klr5qupGsUzFS0IFUWIwpbBetdYeH8RAmvIggeCrzMIKnOj7SjNfyx5ZEn/1IfB7rLwvKxPdnTXEElRo4NLSMgBWzLL8fNHlnRLdAeoxAplyzll7F7u2qMF9KrdHR02S3SNJWEClRhBN/r69Prau7AO3xMH0u/607+VOwyqg9pgPeavYk1aKf4ZCDZYpizcDBnYjAqVvQqf2KkI1jy+kmi4xzTe+/UyAOb38bZ66F6wM6TwLUu9B/J0JWuHeXzxNGqxjxV84kcmtyEbUyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2VkeOcEZTJh9HImazIkFf7RW7kyhDkrMJc1sOwrhf4=;
 b=ExZcBQqA/Dk+UM8ytu9McVVdMnuqZ5cXVsmNL90tL2vSYJCsOzRu/7diE1Ctd7uBCsZ/SjpDJ0AiTAGBn3mIyX8txxaEVrK8RUDn5z2FSOZYqQql0kwsYtU5h5Ww0b2bcfasK+DtRgqVmQ2Rpdwo5lkERE+usfI4+2fYB/fu9XrtYqILj07qlBROD7r9vLKzOXvgt/oSYT2piOQubaIBtyv87vkf9a+xrhLbRvMJiAktGmiUzfeVQIouoCO2/6BnIwRl/aJlbNu/+0uRq5+RJepNyjys3kzmmr7rCZi0aqi1QfXpCFWT2CUMfxBqgy45Vtg9RgZCovZnfKBKH4w76Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2VkeOcEZTJh9HImazIkFf7RW7kyhDkrMJc1sOwrhf4=;
 b=bFUwqNVrH4xNsAzAFUgra4riuJwGv7tnOwYfrOuftdg9ugNuxxEQCMj7wcaKmCmx/JvGqvm/eh6IkeA7OsA4x9mbEPpmHZ9qkzucIIXOia9Geo01lVmX1JAu2EPev40sAMLvyUGAWOTT0/Zzq09rirAy9UBukQ45nQlWGHcNYRM=
Received: from DM6PR02MB6876.namprd02.prod.outlook.com (2603:10b6:5:22c::11)
 by DM6PR02MB5275.namprd02.prod.outlook.com (2603:10b6:5:49::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 08:45:07 +0000
Received: from DM6PR02MB6876.namprd02.prod.outlook.com
 ([fe80::ad68:d392:e519:f671]) by DM6PR02MB6876.namprd02.prod.outlook.com
 ([fe80::ad68:d392:e519:f671%8]) with mapi id 15.20.2921.030; Tue, 21 Apr 2020
 08:45:06 +0000
From:   Vishal Sagar <vsagar@xilinx.com>
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Hyun Kwon <hyunk@xilinx.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Michal Simek <michals@xilinx.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Dinesh Kumar <dineshk@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Jacopo Mondi <jacopo@jmondi.org>, Hyun Kwon <hyunk@xilinx.com>,
        Kondalarao Polisetti <kpolise@xilinx.com>
Subject: RE: [PATCH v11 2/2] media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx
 Subsystem driver
Thread-Topic: [PATCH v11 2/2] media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx
 Subsystem driver
Thread-Index: AQHWDqdoYfHJZJ7yyEOpsMzdPA1DraiAzAoAgAGpQYCAAAkrAIAAxgMAgAAMMXA=
Date:   Tue, 21 Apr 2020 08:45:06 +0000
Message-ID: <DM6PR02MB6876D34CB0F57DAAD2E57D27A7D50@DM6PR02MB6876.namprd02.prod.outlook.com>
References: <20200409194424.45555-1-vishal.sagar@xilinx.com>
 <20200409194424.45555-3-vishal.sagar@xilinx.com>
 <20200419180222.GB8117@pendragon.ideasonboard.com>
 <860c27da-eba0-ddcb-719b-52b2725bd9bf@lucaceresoli.net>
 <20200420195714.GB8195@pendragon.ideasonboard.com>
 <0a3ea86b-cb4c-a1db-664e-cfa555d8ccf8@lucaceresoli.net>
In-Reply-To: <0a3ea86b-cb4c-a1db-664e-cfa555d8ccf8@lucaceresoli.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsagar@xilinx.com; 
x-originating-ip: [149.199.50.130]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9b1d4d59-a0c2-4302-e12e-08d7e5d04af8
x-ms-traffictypediagnostic: DM6PR02MB5275:|DM6PR02MB5275:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR02MB527585745CD7E67DCF7C7D5DA7D50@DM6PR02MB5275.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 038002787A
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR02MB6876.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(107886003)(4326008)(71200400001)(478600001)(5660300002)(9686003)(186003)(55016002)(86362001)(6506007)(110136005)(33656002)(64756008)(66476007)(66946007)(53546011)(2906002)(316002)(52536014)(54906003)(76116006)(66446008)(7696005)(81156014)(66556008)(7416002)(8676002)(8936002)(26005);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CCk0I401H2AfyuR8GSM6BLHf/g3+k7tqOyrs/dOZR3G0SnWt0GVrl2WAAueo3ZnCIfycLhT2IkN8CXcQ5zkNCUWAuYGQ3Jtnt19x3dIgaTB4JrhUyqLuvX3L+DwIJSkueuPVfazylphZCLY6GECi84OqL5TX3WDizTNz7SX1YShwOGFXX9NMEj/gCijjYPqICc0dMq3c5g3lY6oIPY2Q8PAVlIFhXrPocuI/czYmqI5EstuyyTkAsdcri8kQKhgUVlTcRGXLzZBf2i+QTIfDAy+wAeWoE4uoEJ74B521MaGm5SaSqtdnQCphdokuPBjeYPTwTZRSjqDeNILChsIvRX9ABf8q/g+30jWMdggI9AXWK9lgY1W/7OmeLPtinCukDfSyrK2owjTDTpJ/FEzNPzvZA3dfLJsOMzOT6F3P9/CV5JLtnlonOJ/6qOkFrtSP
x-ms-exchange-antispam-messagedata: z8xXwwSA9cKj3URh1gNNRdU02gqoNUEoK2YE25DCywpoDqzGx9mtV6qXAwtmNwVMM/KLZxtJQY8NJKBtR935mEBgF/7BuNTKe9zlMtUL7RdktqreNxyT/Fd44IioB89qOW2E3Qbmn0zfajqEJmoUbg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b1d4d59-a0c2-4302-e12e-08d7e5d04af8
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2020 08:45:06.8752
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j4AO/3E4si5e74qh2JwnswzIFiKd6S1VUYnf9c/T3NIQ4xUbeRcod3Vd0f13ZUuKcwfQovlHVjyPeAgc4xcOmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5275
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgTHVjYSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMdWNhIENl
cmVzb2xpIDxsdWNhQGx1Y2FjZXJlc29saS5uZXQ+DQo+IFNlbnQ6IFR1ZXNkYXksIEFwcmlsIDIx
LCAyMDIwIDE6MTYgUE0NCj4gVG86IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRA
aWRlYXNvbmJvYXJkLmNvbT4NCj4gQ2M6IFZpc2hhbCBTYWdhciA8dnNhZ2FyQHhpbGlueC5jb20+
OyBIeXVuIEt3b24gPGh5dW5rQHhpbGlueC5jb20+Ow0KPiBtY2hlaGFiQGtlcm5lbC5vcmc7IHJv
YmgrZHRAa2VybmVsLm9yZzsgbWFyay5ydXRsYW5kQGFybS5jb207IE1pY2hhbA0KPiBTaW1layA8
bWljaGFsc0B4aWxpbnguY29tPjsgbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOw0KPiBkZXZp
Y2V0cmVlQHZnZXIua2VybmVsLm9yZzsgaGFucy52ZXJrdWlsQGNpc2NvLmNvbTsgbGludXgtYXJt
LQ0KPiBrZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZzsgRGluZXNoIEt1bWFyDQo+IDxkaW5lc2hrQHhpbGlueC5jb20+OyBTYW5kaXAgS290aGFy
aSA8c2FuZGlwa0B4aWxpbnguY29tPjsgSmFjb3BvIE1vbmRpDQo+IDxqYWNvcG9Aam1vbmRpLm9y
Zz47IEh5dW4gS3dvbiA8aHl1bmtAeGlsaW54LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
MTEgMi8yXSBtZWRpYTogdjRsOiB4aWxpbng6IEFkZCBYaWxpbnggTUlQSSBDU0ktMiBSeA0KPiBT
dWJzeXN0ZW0gZHJpdmVyDQo+IA0KPiBIaSBMYXVyZW50LA0KPiANCj4gT24gMjAvMDQvMjAgMjE6
NTcsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6DQo+ID4gSGkgTHVjYSwNCj4gPg0KPiA+IE9uIE1v
biwgQXByIDIwLCAyMDIwIGF0IDA5OjI0OjI1UE0gKzAyMDAsIEx1Y2EgQ2VyZXNvbGkgd3JvdGU6
DQo+ID4+IE9uIDE5LzA0LzIwIDIwOjAyLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOg0KPiA+PiBb
Li4uXQ0KPiA+Pj4+ICtzdGF0aWMgaXJxcmV0dXJuX3QgeGNzaTJyeHNzX2lycV9oYW5kbGVyKGlu
dCBpcnEsIHZvaWQgKmRldl9pZCkgew0KPiA+Pj4+ICsJc3RydWN0IHhjc2kycnhzc19zdGF0ZSAq
c3RhdGUgPSAoc3RydWN0IHhjc2kycnhzc19zdGF0ZSAqKWRldl9pZDsNCj4gPj4+PiArCXN0cnVj
dCB4Y3NpMnJ4c3NfY29yZSAqY29yZSA9ICZzdGF0ZS0+Y29yZTsNCj4gPj4+PiArCXUzMiBzdGF0
dXM7DQo+ID4+Pj4gKw0KPiA+Pj4+ICsJc3RhdHVzID0geGNzaTJyeHNzX3JlYWQoY29yZSwgWENT
SV9JU1JfT0ZGU0VUKSAmDQo+IFhDU0lfSVNSX0FMTElOVFJfTUFTSzsNCj4gPj4+PiArCWRldl9k
YmdfcmF0ZWxpbWl0ZWQoY29yZS0+ZGV2LCAiaW50ZXJydXB0IHN0YXR1cyA9IDB4JTA4eFxuIiwN
Cj4gPj4+PiArc3RhdHVzKTsNCj4gPj4+DQo+ID4+PiBBcyB0aGlzIGlzIGV4cGVjdGVkIHRvIG9j
Y3VyIGZvciBldmVyeSBmcmFtZSwgSSB3b3VsZCBkcm9wIHRoZQ0KPiA+Pj4gbWVzc2FnZSwgZXZl
biBpZiByYXRlLWxpbWl0ZWQuDQo+ID4+Pg0KPiA+Pj4+ICsNCj4gPj4+PiArCWlmICghc3RhdHVz
KQ0KPiA+Pj4+ICsJCXJldHVybiBJUlFfTk9ORTsNCj4gPj4+PiArDQo+ID4+Pj4gKwkvKiBSZWNl
aXZlZCBhIHNob3J0IHBhY2tldCAqLw0KPiA+Pj4+ICsJaWYgKHN0YXR1cyAmIFhDU0lfSVNSX1NQ
RklGT05FKSB7DQo+ID4+Pj4gKwkJZGV2X2RiZ19yYXRlbGltaXRlZChjb3JlLT5kZXYsICJTaG9y
dCBwYWNrZXQgPSAweCUwOHhcbiIsDQo+ID4+Pj4gKwkJCQkgICAgeGNzaTJyeHNzX3JlYWQoY29y
ZSwgWENTSV9TUEtUUl9PRkZTRVQpKTsNCj4gPj4+PiArCX0NCj4gPj4+DQo+ID4+PiBTYW1lIGhl
cmUsIHRoaXMgd2lsbCBvY2N1ciBhbGwgdGhlIHRpbWUsIEknZCByZW1vdmUgdGhpcyBtZXNzYWdl
Lg0KPiA+Pj4gWW91IG5lZWQgdG8gcmVhZCBYQ1NJX1NQS1RSX09GRlNFVCB0aG91Z2gsIGFuZCB5
b3Ugc2hvdWxkIGRvIHNvIGluIGENCj4gPj4+IGxvb3AgdW50aWwgdGhlIFhDU0lfQ1NSX1NQRklG
T05FIGluIFhDU0lfQ1NSX09GRlNFVCBpcyBjbGVhcmVkIGluDQo+ID4+PiBjYXNlIG11bHRpcGxl
IHNob3J0IHBhY2tldHMgYXJlIHJlY2VpdmVkIGJlZm9yZSB0aGUgaW50ZXJydXB0DQo+ID4+PiBo
YW5kbGVyIGV4ZWN1dGVzLg0KPiA+Pj4NCj4gPj4+IEkgYWxzbyB3b25kZXIgaWYgaXQgd291bGQg
bWFrZSBzZW5zZSB0byBleHRyYWN0IHRoZSBmcmFtZSBudW1iZXINCj4gPj4+IGZyb20gdGhlIEZT
IHNob3J0IHBhY2tldCwgYW5kIG1ha2UgaXQgYXZhaWxhYmxlIHRocm91Z2ggdGhlIHN1YmRldg0K
PiA+Pj4gQVBJLiBJIHRoaW5rIGl0IHNob3VsZCBiZSByZXBvcnRlZCB0aHJvdWdoIGEgVjRMMl9F
VkVOVF9GUkFNRV9TWU5DDQo+ID4+PiBldmVudC4gVGhpcyBjYW4gYmUgaW1wbGVtZW50ZWQgbGF0
ZXIuDQo+ID4+Pg0KPiA+Pj4+ICsNCj4gPj4+PiArCS8qIFNob3J0IHBhY2tldCBGSUZPIG92ZXJm
bG93ICovDQo+ID4+Pj4gKwlpZiAoc3RhdHVzICYgWENTSV9JU1JfU1BGSUZPRikNCj4gPj4+PiAr
CQlkZXZfZGJnX3JhdGVsaW1pdGVkKGNvcmUtPmRldiwgIlNob3J0IHBhY2tldCBGSUZPDQo+ID4+
Pj4gK292ZXJmbG93ZWRcbiIpOw0KPiA+Pj4+ICsNCj4gPj4+PiArCS8qDQo+ID4+Pj4gKwkgKiBT
dHJlYW0gbGluZSBidWZmZXIgZnVsbA0KPiA+Pj4+ICsJICogVGhpcyBtZWFucyB0aGVyZSBpcyBh
IGJhY2twcmVzc3VyZSBmcm9tIGRvd25zdHJlYW0gSVANCj4gPj4+PiArCSAqLw0KPiA+Pj4+ICsJ
aWYgKHN0YXR1cyAmIFhDU0lfSVNSX1NMQkYpIHsNCj4gPj4+PiArCQlkZXZfYWxlcnRfcmF0ZWxp
bWl0ZWQoY29yZS0+ZGV2LCAiU3RyZWFtIExpbmUgQnVmZmVyDQo+IEZ1bGwhXG4iKTsNCj4gPj4+
PiArCQl4Y3NpMnJ4c3Nfc3RvcF9zdHJlYW0oc3RhdGUpOw0KPiA+Pj4+ICsJCWlmIChjb3JlLT5y
c3RfZ3Bpbykgew0KPiA+Pj4+ICsJCQlncGlvZF9zZXRfdmFsdWUoY29yZS0+cnN0X2dwaW8sIDEp
Ow0KPiA+Pj4+ICsJCQkvKiBtaW5pbXVtIDQwIGRwaHlfY2xrXzIwME0gY3ljbGVzICovDQo+ID4+
Pj4gKwkJCW5kZWxheSgyNTApOw0KPiA+Pj4+ICsJCQlncGlvZF9zZXRfdmFsdWUoY29yZS0+cnN0
X2dwaW8sIDApOw0KPiA+Pj4+ICsJCX0NCj4gPj4+DQo+ID4+PiBJIGRvbid0IHRoaW5rIHlvdSBz
aG91bGQgc3RvcCB0aGUgY29yZSBoZXJlLiB4Y3NpMnJ4c3Nfc3RvcF9zdHJlYW0oKQ0KPiA+Pj4g
Y2FsbHMgdGhlIHNvdXJjZSAuc19zdHJlYW0oMCkgb3BlcmF0aW9uLCB3aGljaCB1c3VhbGx5IGlu
dm9sdmVzIEkyQw0KPiA+Pj4gd3JpdGVzIHRoYXQgd2lsbCBzbGVlcC4NCj4gPj4+DQo+ID4+PiBZ
b3Ugc2hvdWxkIGluc3RlYWQgcmVwb3J0IGFuIGV2ZW50IHRvIHVzZXJzcGFjZSAoaXQgbG9va3Mg
bGlrZSB3ZQ0KPiA+Pj4gaGF2ZSBubyBlcnJvciBldmVudCBkZWZpbmVkIGluIFY0TDIsIG9uZSBz
aG91bGQgYmUgYWRkZWQpLCBhbmQgcmVseQ0KPiA+Pj4gb24gdGhlIG5vcm1hbCBzdG9wIHByb2Nl
ZHVyZS4NCj4gPj4NCj4gPj4gRldJVywgc2luY2UgYSBsb25nIHRpbWUgSSd2ZSBiZWVuIHVzaW5n
IGEgbW9kaWZpZWQgdmVyc2lvbiBvZiB0aGlzDQo+ID4+IHJvdXRpbmUsIHdoZXJlIGFmdGVyIGEg
U3RyZWFtIExpbmUgQnVmZmVyIEZ1bGwgY29uZGl0aW9uIEkganVzdCBzdG9wDQo+ID4+IGFuZCBy
ZXN0YXJ0IHRoZSBjc2kycnggY29yZSBhbmQgdGhlIHN0cmVhbSBjb250aW51ZXMgYWZ0ZXIgYSBt
aW5pbWFsDQo+IGdsaXRjaC4NCj4gPj4gT3RoZXIgc3ViZGV2IGFyZSB1bmF3YXJlIHRoYXQgYW55
dGhpbmcgaGFzIGhhcHBlbmVkIGFuZCBrZWVwIG9uDQo+IHN0cmVhbWluZy4NCj4gPj4NCj4gPj4g
Tm90IHN1cmUgdGhpcyBpcyB0aGUgY29ycmVjdCB0aGluZyB0byBkbywgYnV0IGl0J3Mgd29ya2lu
ZyBmb3IgbWUuDQo+ID4+IEFsc28gSSBwcm9wb3NlZCB0aGlzIHRvcGljIGluIG9uZSBvZiB0aGUg
cHJldmlvdXMgaXRlcmF0aW9ucyBvZiB0aGlzDQo+ID4+IHBhdGNoLCBidXQgdGhlIHNpdHVhdGlv
biB3YXMgZGlmZmVyZW50IGJlY2F1c2UgdGhlIHN0cmVhbSBvbi9vZmYgd2FzDQo+ID4+IG5vdCBw
cm9wYWdhdGVkIGJhY2sgYXQgdGhhdCB0aW1lLg0KPiA+DQo+ID4gVGhhbmtzIGZvciB0aGUgZmVl
ZGJhY2suIEhvdyBvZnRlbiBkb2VzIHRoaXMgb2NjdXIgaW4gcHJhY3RpY2UgPw0KPiANCj4gUXVp
dGUgb2Z0ZW4gaW5kZWVkIGluIG15IGNhc2UsIGFzIHRoZSBNSVBJIHN0cmVhbSBjb21lcyBmcm9t
IGEgcmVtb3RlDQo+IHNlbnNvciB2aWEgYSB2aWRlbyBzZXJkZXMgY2hpcHNldCwgYW5kIGJvdGgg
dGhlIGNhYmxlIGFuZCB0aGUgcmVtb3RlIHNlbnNvcg0KPiBtb2R1bGUgYXJlIHN1YmplY3QgdG8g
aGVhdnkgRU1JLiBEZXBlbmRpbmcgb24gdGhlIHNldHVwIEkgb2JzZXJ2ZWQgU0xCRg0KPiBoYXBw
ZW5pbmcgdXAgdG8gNX4xMCB0aW1lcyBwZXIgaG91ci4NCj4gDQo+IC0tDQo+IEx1Y2ENCg0KVGhh
bmtzIGZvciBzaGFyaW5nIHlvdXIgb2JzZXJ2YXRpb24uDQpHZXR0aW5nIGEgc3RyZWFtIGxpbmUg
YnVmZmVyIGZ1bGwgY29uZGl0aW9uIGluZGljYXRlcyBhIGRlc2lnbiBpc3N1ZS4NClN0b3BwaW5n
LCByZXNldHRpbmcgdXNpbmcgdmlkZW9fYXJlc2V0biBhbmQgc3RhcnRpbmcgaXMgdmFsaWQgd2F5
IHRvIHN0YXJ0IE1JUEkgQ1NJLTIgUnggU1MgYnV0IG1hc2tzIHRoZSBpc3N1ZS4NCkhlbmNlIHRo
ZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIGlzIHRvIHdhcm4gYW5kIHN0b3Agc3RyZWFtaW5nLg0K
DQpSZWdhcmRzDQpWaXNoYWwgU2FnYXINCg0K
