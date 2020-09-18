Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E7B026F8C2
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 10:56:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbgIRI4w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 04:56:52 -0400
Received: from mail-eopbgr30059.outbound.protection.outlook.com ([40.107.3.59]:12402
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726009AbgIRI4w (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 04:56:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CaLUAtS9iS6Kjo1GwBLnBH2pRzDHxZA839K3KgIzvDw6lULknMaM+JaIJ2ogNKkm7VM+Gi6mOtoqsHyTUDNksIEhWnGOME9X8eyrIC/2/AjcugbS3etzH/t60/5MbG0oMk+fUdPOsQOwWstPCxZKiEqmmlopZXOFHkDgOrK4J4lwsT9cPhFTLw/YWOSmDXSK8/NsGrk+eblpGQqZ1nNAz1Xy8RTT+gpe5vLEb8smQw92O1k3KQ09aer4nqUIjBEgWaf3xQQbNR0V3yXg6HjegQle6YOV/QrwzT9YoV94kpTMhOnEdnS+BrJa+dY2KGHwaofVm/bu6IzVa+mQH6+ckg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJ6WcDh5BXOYufTgP3MUtrxv/0W6oRTFLEAoTfNt9Uw=;
 b=QhJKNoRLN7Zo1A7aR3rygTM9Xq7vfuHVp6Nb2DfBKzJCDoPW/OV6nVOyZovP64HAc7M+dBQluFTlfjoNLKfomFR3+jlqzVf+hXyshdpM8bAp5Titrx6xaz5eydzyUlS/jtEA/beF/tmYvyOiJ5LjGb74Ok1RUDIscsBz4hUOOiv+uzdRQ8eIYpHb33xC5bM9Je3S9yPmN9BknVXfcL9PZRtpmZGtnmOnhL35ZpRIE7LPpkWXWgA0d5pWfUsjIRcpE13M6y6O4eEsvkhrixhXjv4QEI6tNkha9EH3NI/XUuIwxNB7+jVoVN64tay1NmlQYWBxMdKV5PYpeDhiR5Fr7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJ6WcDh5BXOYufTgP3MUtrxv/0W6oRTFLEAoTfNt9Uw=;
 b=Y2trcozqQtr5Vo0W1ttc6k+ck4gEHPNq1QE2xfEcxwoGNxr77PW/Qtcc9zefxRa6OUDtlo6yFa6lJD/2wdGbcxmf75Fpnvt+egl5RwflZjVAQc/F9e+wv2jz/s2ES9jaSr74NG+3yYeITR7iCU+xpCIh1u+WiPG1LQxR288Yovo=
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com (2603:10a6:10:fa::15)
 by DBBPR04MB6185.eurprd04.prod.outlook.com (2603:10a6:10:c9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Fri, 18 Sep
 2020 08:56:47 +0000
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68]) by DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68%8]) with mapi id 15.20.3391.011; Fri, 18 Sep 2020
 08:56:47 +0000
From:   Joakim Zhang <qiangqing.zhang@nxp.com>
To:     Sean Young <sean@mess.org>
CC:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH] media: rc: gpio-ir-recv: add QoS support for cpuidle
 system
Thread-Topic: [PATCH] media: rc: gpio-ir-recv: add QoS support for cpuidle
 system
Thread-Index: AQHWiy4MW1TKQEfe6k2eA6q7pgHUfqlpcD0AgAMT72CAAMvlAIAASn5ggAB5KQCAAAWWcA==
Date:   Fri, 18 Sep 2020 08:56:46 +0000
Message-ID: <DB8PR04MB6795E152DF55CE10E8E39B47E63F0@DB8PR04MB6795.eurprd04.prod.outlook.com>
References: <20200915150202.24165-1-qiangqing.zhang@nxp.com>
 <20200915093342.GA24139@gofer.mess.org>
 <DB8PR04MB6795CB9F519D2BD277654B29E63E0@DB8PR04MB6795.eurprd04.prod.outlook.com>
 <20200917204336.GA21441@gofer.mess.org>
 <DB8PR04MB6795D5228426C7D93AF08081E63F0@DB8PR04MB6795.eurprd04.prod.outlook.com>
 <20200918082352.GA32346@gofer.mess.org>
In-Reply-To: <20200918082352.GA32346@gofer.mess.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mess.org; dkim=none (message not signed)
 header.d=none;mess.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 57b25926-8a91-47ea-c28b-08d85bb0c64e
x-ms-traffictypediagnostic: DBBPR04MB6185:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBBPR04MB6185A9F34800019BD31F8C01E63F0@DBBPR04MB6185.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lFhxp+fo7g2gni7nnt0ul7aW4ne/dIimqJ1b1xGHUyfWixh/id+I1OcUKwLkaiFO6Bf8y6Z0Rt0E7LPIOriK/IJMrI9jhPLieJnGwLBdIkWGVYVnNKSj7UsYr5bSp67/UQ6olYEnY+wiE9isvD2F5jsy+ks8H8ZHEr4Fg0+vcA+DOy0ko0pYNmzy8E1i8VE2oxvGG/LqMqcfDfDNIFNNn3VeAL1Bl/tE2ZlK7UUATAz+4OE36lnkaYsPo5Qx2f2aPUXBeDvQONxhXEdKb/WiO2KPODat0BKRV0GCXQPYG1GzIudF4s8iuRgZW5HhSMkiggdTgy8bl+SGs/ONJWnxkw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6795.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(9686003)(64756008)(71200400001)(2906002)(76116006)(66946007)(66446008)(55016002)(6916009)(66476007)(66556008)(4326008)(83380400001)(86362001)(6506007)(8936002)(8676002)(33656002)(52536014)(5660300002)(316002)(7696005)(26005)(53546011)(186003)(478600001)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ibpBJmO+tbr3PmRIvZFOfeB+jWK9OcmnOp2WL4WxRE2obTZbN6jW4rXrSLS/mBYPbAjcZ3kj5ktR41vKRyOEDRzoslpQDEeNUX4F9J2a1+EJlG69jIucJu1XyFZtuKsRggxSNoeNOnt5Wwubv+b0AJ82W7RD3/e6eR+8nOyk3He+US/J4aJ1FgVgnaQcFvHUrmOBkLC/fizjIS1TWxarUHgJDIahOP3XRj/t2WNVT3tHcdXgSzqJPvzBOHnxX558LlSsNWSZpUmZ0KhN0IakL+/W0GVa5EJ/ARu16YFjpvnKcjS+TB1vThZyMnLxCRvwWNA0w92t4hjceNDgDa1UM8ALArbjedJ+TQwirXeUTXpQfWG/1JZEgDYyQG7yfBQEzoswFWqYkhLTFFWvAqdYiqIdbZw9cL7tm69WM9Mku9n8HNf8vc1ewm7Cnk487jEPimF3HHPSC5F9gtR9WukEDdzQOH6yvvbUU4h6Gk4tpGS6DDqiqDKOyLHtlaD8bi4ha6T9VPmuD9kE4x6LjZpUB+f40U+BFfjGdhrhjqwZVnu4w+/XEtTRnY1PzXw5dJdwla7zoBxYIdLBtlP58HQvw/1XWxXnbI/9z+xM28jDJudc3tfbuUTgfbT3pato8ZCEwj0uydYtdwxONz/QYcLDdg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57b25926-8a91-47ea-c28b-08d85bb0c64e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2020 08:56:47.0754
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yvmxtyqNU1Y6WUmq5+5VEzPbGfEO1YZmqnz6dHWLZKW4jHbKuMDXM4dvoshb9+yyk1HH/LY7cMe6mAsaMlE1GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6185
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQpIaSBTZWFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFNlYW4g
WW91bmcgPHNlYW5AbWVzcy5vcmc+DQo+IFNlbnQ6IDIwMjDlubQ55pyIMTjml6UgMTY6MjQNCj4g
VG86IEpvYWtpbSBaaGFuZyA8cWlhbmdxaW5nLnpoYW5nQG54cC5jb20+DQo+IENjOiBtY2hlaGFi
QGtlcm5lbC5vcmc7IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZzsgZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT4NCj4gU3Vi
amVjdDogUmU6IFtQQVRDSF0gbWVkaWE6IHJjOiBncGlvLWlyLXJlY3Y6IGFkZCBRb1Mgc3VwcG9y
dCBmb3IgY3B1aWRsZQ0KPiBzeXN0ZW0NCj4gDQo+IEhpIEpvYWtpbSwNCj4gDQo+IE9uIEZyaSwg
U2VwIDE4LCAyMDIwIGF0IDAxOjQyOjE1QU0gKzAwMDAsIEpvYWtpbSBaaGFuZyB3cm90ZToNCj4g
PiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBTZWFuIFlvdW5nIDxz
ZWFuQG1lc3Mub3JnPg0KPiA+ID4gU2VudDogMjAyMOW5tDnmnIgxOOaXpSA0OjQ0DQo+ID4gPiBU
bzogSm9ha2ltIFpoYW5nIDxxaWFuZ3FpbmcuemhhbmdAbnhwLmNvbT4NCj4gPiA+IENjOiBtY2hl
aGFiQGtlcm5lbC5vcmc7IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsNCj4gPiA+IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+
DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIXSBtZWRpYTogcmM6IGdwaW8taXItcmVjdjogYWRk
IFFvUyBzdXBwb3J0IGZvcg0KPiA+ID4gY3B1aWRsZSBzeXN0ZW0NCj4gDQo+IC1zbmlwLQ0KPiAN
Cj4gPiA+ID4gQXV0b3N1c3BlbmQgZGVsYXkgc2hvdWxkIGJlIGZpeGVkIHZhbHVlLCBzaG91bGQg
YmUgc2V0IHRvIGdwaW8NCj4gPiA+ID4gZGV2aWNlIHRpbWVvdXQNCj4gPiA+IHZhbHVlLCB3aGlj
aCBpcyAxMjVtcy4NCj4gPiA+DQo+ID4gPiBTbyB0aGUgaWRlYSB3YXMgdGhhdCBjcHVpZGxlIGlz
IG9ubHkgZW5hYmxlZCB3aGlsZSBJUiBmcmFtZXMgYXJlDQo+ID4gPiBiZWluZyByZWNlaXZlZCwg
dGhhdCdzIHdoeSBJIHN1Z2dlc3RlZCBpdC4NCj4gPg0KPiA+IE1heSBiZSBhIHR5cG8sICJjcHVp
ZGxlIGlzIG9ubHkgRElTQUJMRUQgd2hpbGUgSVIgZnJhbWVzIGFyZSBiZWluZyByZWNlaXZlLCIs
DQo+IHRoaXMgaXMgbm90IEkgd2FudCB0byBpbXBsZW1lbnQsIGV4cGVyaW1lbnRzIGhhdmUgYWxz
byBzaG93biBwb29yIHJlc3VsdHMuDQo+IA0KPiBTb3JyeSwgeWVzIEkgZ290IHRoaXMgd3Jvbmcu
IFlvdSBhcmUgcmlnaHQuDQo+IA0KPiA+ID4gSWYgeW91IHNldCB0aGUgYXV0b3N1c3BlbmQgZGVs
YXkgdG8gMTI1bXMsIHRoZW4gdGhlIGNwdWlkbGUgd2lsbCBub3QNCj4gPiA+IGJlIGVuYWJsZWQg
YmV0d2VlbiBJUiBmcmFtZXMuIE1heWJlIHRoaXMgaXMgd2hhdCB5b3Ugd2FudCwgYnV0IGl0DQo+
ID4gPiBkb2VzIG1lYW4gY3B1aWRsZSBpcyB0b3RhbGx5IHN1c3BlbmRlZCB3aGlsZSBhbnlvbmUg
aXMgcHJlc3NpbmcgYnV0dG9ucyBvbg0KPiBhIHJlbW90ZS4NCj4gPg0KPiA+IFllcywgdGhpcyBp
cyB3aGF0IEkgd2FudCwgY3B1aWRsZSBpcyB0b3RhbGx5IGRpc2FibGVkIHdoaWxlIHByZXNzaW5n
IGJ1dHRvbnMsDQo+IGRpc2FibGUgY3B1aWRsZSBhdCB0aGUgZmlyc3QgZnJhbWUgdGhlbiBrZWVw
IGRpc2FibGVkIHVudGlsIHRoZXJlIGlzIG5vIGFjdGl2aXR5IGZvcg0KPiBhIHdoaWxlLg0KPiA+
IFNvIHRoYXQgd2Ugb25seSBjYW4gbm90IGRlY29kZSB0aGUgZmlyc3QgZnJhbWUsIHN1Y2ggYXMs
IGlmIHRyYW5zbWl0dGluZyA0DQo+IGZyYW1lcyBvbmNlLCB3ZSBjYW4gY29ycmVjdGx5IGRlY29k
ZSAzIHRpbWVzLg0KPiA+DQo+ID4gSSBhbHNvIHRyeSB5b3VyIHN1Z2dlc3Rpb24sIHNldCBhdXRv
c3VzcGVuZCBkZWxheSB0aW1lIHRvIHByb3RvY29sJ3MNCj4gPiB0aW1lb3V0IHZhbHVlLCBidXQg
dGhlIHJlc3VsdCBpcyB0ZXJyaWJsZS4gSWYgdHJhbnNtaXR0aW5nIDQgZnJhbWVzIG9uY2UsIHdl
DQo+IGNhbid0IGNvcnJlY3RseSBkZWNvZGUgMyB0aW1lcywgZXZlbiBjYW4ndCBkZWNvZGUgaXQg
c29tZXRpbWUuIFRoZSBzZXF1ZW5jZSBpcywNCj4gY3B1IGluIGlkbGUgc3RhdGUgd2hlbiB0aGUg
Zmlyc3QgZnJhbWUgY29taW5nLCB0aGVuIGRpc2FibGUgY3B1IGlkbGUgdW50aWwNCj4gcHJvdG9j
b2xzJyB0aW1lb3V0LCBjcHUgaW4gaWRsZSBzdGF0ZSBhZ2FpbiwgdGhlIGZpcnN0IGZyYW1lIGNh
bid0IGJlIGRlY29kZWQuDQo+ID4gVGhlIHNlY29uZCBmcmFtZSBjb21pbmcsIGl0IHdpbGwgcmVw
ZWF0IHRoZSBiZWhhdmlvciBvZiB0aGUgZmlyc3QgZnJhbWUsIG1heQ0KPiBjYXVzZSB0aGUgc2Vj
b25kIGZyYW1lIGNhbid0IGJlIGRlY29kZS4uLi4uLg0KPiA+DQo+ID4gQ2FuIHlvdSB0YWtlIGFj
Y291bnQgb2YgSSBoYXZlIGRvbmUgaW4gdGhlIGZpcnN0IHZlcnNpb24sIGF1dG9zdXNwZW5kIGRl
bGF5DQo+IHRpbWUgaXMgc2V0IHRvIDEyNW1zPw0KPiANCj4gWWVzLCBpbiByZXRyb3NwZWN0IHlv
dSBhcmUgcmlnaHQuIFRyeWluZyB0byBzaG9ydGVuIHRoZSBjcHVpZGxlIHN1c3BlbmRlZCBwZXJp
b2QNCj4gd2lsbCBub3Qgd29yay4gSSBhbSBzb3JyeSBhYm91dCB0aGlzLg0KPiANCj4gSG93IGFi
b3V0IHNldHRpbmcgdGhlIGF1dG9zdXNwZW5kIHBlcmlvZCBpbiBkZXZpY2V0cmVlLCBhbmQgMCB3
aWxsIHR1cm4gdGhpcw0KPiBmZWF0dXJlIG9mZiBjb21wbGV0ZWx5Pw0KDQpPZiBjb3Vyc2UsIHdl
IGNhbiBkbyB0aGlzLiBTdWNoIGFzIGFkZCBhIGxpbnV4LGRlbGF5dGltZSBwcm9wZXJ0eToNCkZv
ciB0aG9zZSBzeXN0ZW1zIHRoYXQgZG9uJ3Qgc3VmZmVyIHRoaXMgaXNzdWUsIG5lZWQgbm90IGFk
ZCB0aGlzIHByb3BlcnR5LCBpbnN0ZWFkIG9mIGNoZWNrIHRoZSB2YWx1ZSBpcyAwIGFzIHlvdSBz
dWdnZXN0ZWQuDQpGb3IgdGhvc2Ugc3lzdGVtcyB0aGF0IHdvdWxkIHN1ZmZlciB0aGlzIGlzc3Vl
LCBuZWVkIGFkZCB0aGlzIHByb3BlcnR5IGFuZCB0aGVuIGdpdmUgYSBhcHByb3ByaWF0ZSB2YWx1
ZQ0KDQpTbyB0aGF0IHVzZXJzIGNhbiBjaGFuZ2UgdGhlIGF1dG9zdXNwZW5kIGRlbGF5IHRpbWUg
dmlhIGRldmljZSB0cmVlLCBpdCBpcyBtb3JlIGZsZXhpYmxlIGZvciBkaWZmZXJlbnQgc3lzdGVt
cy4gSWYgeW91IGFncmVlIHdpdGggaXQsIEkgd2lsbCBzZW5kIGEgVjIuDQoNCkJlc3QgUmVnYXJk
cywNCkpvYWtpbSBaaGFuZw0KPiBUaGFua3MsDQo+IA0KPiBTZWFuDQo=
