Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B98653872E2
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 09:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346952AbhERHLZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 03:11:25 -0400
Received: from mail-db8eur05on2049.outbound.protection.outlook.com ([40.107.20.49]:26464
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237714AbhERHLY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 03:11:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+YPDkFctQGsEXGP+UBaCcuYGnMO4m7LXhPf7coW5NbofLlW0S4iHtTPWJP7KDv6hZmIbbUxDnulaJw0YdOkQInWbbYWijlG7lVVROJN3aKWdF3dE+BnMZwm+vBJCOriWkMgRcfv5eLuucqFBSI5db6pSZ6gDT/lz7IeBQkWNHN7463jXepxOU3KlAUcJduPzFsBgr/jkJCqtjsZCcpRhyCjbjEl0oxcx7ycoU7Oo158jNrdfqE+thy/V/3WkGAg/ROq9eC0Q79ZwO78VwfHOmu6pYnHc3YminV9P36oNHMQ9j0klKHwfi7FmRhWOWJa3n/wU3Kf34S2IoYyzMWpZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xe+9gkYA2zs3oFiRFNsk8tEPkeST/bF7U0k0Rh9CP9s=;
 b=NPf3qmJpLF3On10RibgyTox9oh8jXSrlpGTCD8ZMbajFtKbXhNAOzllxUvdB57In2hpAqxngmjfZ9K+kliaTW6PMNlHTkCBBf5aqaRjGsdA8HNEjpyOKSx9qtuiOD9dNEYy3hkdTMw+DF2liZuTgOGddryvYqYJ22WNwcyBFl3QvbvWIWmW0luxWidUqtKFwIEm+77VOSPORCFMdYE1eq5U+/Z4X8Rtiw4sEDwLi/pl+zP8s0z5sPczHJv+HIRZMztn8Ly/vQp8RVWESJzQx7tYI9mbuVOqNXlXCuI59HHXq8lq/vQQTcblwEUjF8AztXJh44SGzWHkDha1Q+iQ39w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xe+9gkYA2zs3oFiRFNsk8tEPkeST/bF7U0k0Rh9CP9s=;
 b=hYBiza672vOfTw3Jc+dzM+dELrfJdm4nu6CoX/e1Bdhx2yHggvljrV+TkpXH8v6oA6CR0keqBqhOZY8CBuOY/uZtA8CJ5WKo02Wx8YylHsilEs3LHllEbVJRk7z7jCqemxNf0plAVNdAPCqVD6BzA+Qd+KPz4Ne9VOlXrgRXo8A=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB4327.eurprd04.prod.outlook.com (2603:10a6:209:40::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 07:10:02 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b%2]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 07:10:01 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>,
        "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "G.n. Zhou" <guoniu.zhou@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Peng Fan <peng.fan@nxp.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: RE: [PATCH v11] arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes
Thread-Topic: [PATCH v11] arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes
Thread-Index: AQHXOClx/EGs7P4PmkKRDSOc1GkfSqrhJaCAgAfSNPA=
Date:   Tue, 18 May 2021 07:10:01 +0000
Message-ID: <AM6PR04MB4966FC14F882215A3B9891D0802C9@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20210423101414.20068-1-mirela.rabulea@oss.nxp.com>
 <20210513073832.GS3425@dragon>
In-Reply-To: <20210513073832.GS3425@dragon>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3bcd6784-ddfd-48f6-4452-08d919cbf46e
x-ms-traffictypediagnostic: AM6PR04MB4327:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB43271A8A0FCB26587B73B9C9802C9@AM6PR04MB4327.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ezU1Y1VB/YcMsiApwFK4CVesKLfXpStrX3JLvaaKGuH1kHB1OoCWmWnLLK+BfghLetQdc+hXVcau8c7toirZiZFWjEPzAtMc7mVALmYOxVIJWkpczHkfHI07cjgXNk8DeQ47pAsN/fQzdx8h2mgezhPMjDuSWXHS/p1pMsAieHUH36dQ7zUrE8RpZOdcPI5LdmyjGhbcFaO3PL/Ib8X62l6FUumekIU7EWMThRPS5g4CntC4efEwGU4m5yvod6rveXBgOmhPEelQPcSL06rayZNXhJtBWxZi+xOnZe07axO3/BxMKMfo5roY/7NLgztJGBty+furlBgOvHIvcoVakpb7l18K+6A0yySJiJf0pvfJt7D84DC4GKIEAhERtNk08P5565bGDBEbWdWiVMGGJ+rEKd3EImtH1k7eKIl36mlD3cde+91J3BNkq/SrSlKr+na8Dz03QMnC8AjUN94KkMCn4z3o3c/HG66WOZ7dkWHyBv8xxWX6h3r49C5dI4hZRYVUITyg51zgZ3dNSPDkY+z0t7n6FJ/le/nOtyS7U00oWuknLVLzezfum391cT0NmbDvYNyCbhS9BDWsTqsauBdtcn2JCGWsi1xGYqoGb2Mtj2unDZKEQmSvgfednQ7yoT4MpunbsoJZAdtEAe1ssw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(8936002)(6506007)(316002)(4326008)(86362001)(5660300002)(110136005)(8676002)(7416002)(76116006)(7696005)(55016002)(66476007)(122000001)(52536014)(64756008)(66556008)(71200400001)(38100700002)(66446008)(9686003)(2906002)(54906003)(83380400001)(186003)(66946007)(33656002)(44832011)(26005)(478600001)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?UVBkY1NZMVJiVlBYZmFiV1pIQ1NuUnJlQW51ZnUvM0dVWVN2OTZIaHkvMXdD?=
 =?utf-8?B?VmhMRkhaM0lISlNPdzY2ODNxOXo1MTRpVzcrQW1ySlZqK3pMcUcwdk5EVmpi?=
 =?utf-8?B?aXMyVmNDQmR3R3lybEhacU85NHNVdld3YXVxVXdjMmJGRGtSUExiSlZ5b1FF?=
 =?utf-8?B?OC9mMVBCbHJEQ0lsZ3lZcGRsWTU0ZDVWSm5vQnJoam10K0tjeHJmejBJamlI?=
 =?utf-8?B?dGEvWG5QMXBnbVJzMlFPRkdXUDVMQXdmWHE1Rkxrem4zanNLZVUxUlkyUmRq?=
 =?utf-8?B?L1l1ZmZ6bU9QK24xNnc5ZXVDb0FQVk1kNlBIbmlOUVhObjd3dVJpcHlFNUZj?=
 =?utf-8?B?UVp5ZUNGVTVoRXltRGZjRE9DTGE2ZVgxdUprMDZFa1kxUVBQWnRkT25wYmlS?=
 =?utf-8?B?elpPV2RhTTJvUE5lTTN4WVZIRzJPbjFSUlRNZG9xUlZWMzJ4YWpWemdVS01m?=
 =?utf-8?B?c3JHLy9sYTBMUzBOWTBUek9UdUgvRjlnNnlTR0dhcGtuU1g1Tm9BZFZzUDc0?=
 =?utf-8?B?OEIvVjN3dk0zQ0dtQTN5dGpsYiswcVduUmtWblRKM2liSDY0RTMybXU0K2t6?=
 =?utf-8?B?Q1ZRbEthUzNDWnA2MEFYQm4raFZWN3dob1cwNHkyKytlNDVnanMyUmhTVWhK?=
 =?utf-8?B?RklVWGFCMHYxbHl0ZkpEc0hFdTFwbzJXUnNVZ0lEYy96ZXJwUnE4ZS8zOE1s?=
 =?utf-8?B?bUw1eEwxMTZEUjViL3pLQmRXVFpNTXpGdXN3cDZOTm5vdmtaaDRkcm1DbmJk?=
 =?utf-8?B?emFocFlybHVYUTU1RHZoM1RxUlhleDZFYXBONWJGelhsK1F5SDc4RmRDaGtz?=
 =?utf-8?B?YzkrU0Z2Z252bjZFUUZTaElUMWxtZldsL1pYWnQvNElNTlhmL2k5YUlqYUNK?=
 =?utf-8?B?SEtxMDRiOGdlUEJDUjUyWml1RFg5aU1VNlNPTEU5QzYyYkJVNXdvN05HQnpj?=
 =?utf-8?B?UnZEQndxWEtWYUtkQVE1alJod1VYWk9rV096c3VjT3FLdHpiMGVEdDFwM0pK?=
 =?utf-8?B?OXk1dWZUeHNkZ0dIZ0QzTjVieFR1V3JDQ3ppcExOYnRHQk1DOXlwVjZzdTZL?=
 =?utf-8?B?dTI4VHA5RkJFSk5UM3pCL0I2MHR4ZVpodjRnUjUrb1R6UXh1eFlDZ3pPSmxq?=
 =?utf-8?B?OFpTeFNRWUl5YkRONHE2WHVlb1dEejdhUmYyNy9EYkR2YVcyWndxVjJQVkNM?=
 =?utf-8?B?SlA5RW5UWVVHdWd6aUNYTmF3eXN1cmRkVDlaRmpMVlc3QUF4bE94ZmlGNWY4?=
 =?utf-8?B?eTdJdnZhMkdYSVdaMjAyQkdIZVZ6cVU1d29NbGVWOEZFR0ptd243ZVFZTEgy?=
 =?utf-8?B?SUhDNUhPdGVSSjJjV0orczFxTzZWUEhFQkVodjFibEFuekpwSGJGcnNVczFz?=
 =?utf-8?B?SG1QL2t2NGY3RFVSTmoycldDbXpnT0dOaDFVdGg4bm9wNWpEaXFUaHIrTkNZ?=
 =?utf-8?B?SHYwK3Z6Tmt4djYyT29YTElramZOOVFhMzVnS3hTNWhabFpWdzZZbkhJaWhX?=
 =?utf-8?B?cHZMc0dOUjFCalZVWDJrWEsrRXA3VlRROW5tVTM3eGN3ajFJM3llOFZ4bWhK?=
 =?utf-8?B?d3NHQllGR2dlUXBxeUM1ZDdMUlZvS01CRzh5UTdPZTdrT3hyTzNLZFBhYVQ1?=
 =?utf-8?B?WVpjRXhBMXhXRk1uc3BpOGFrb2NsdmpIMmtGb3Urb0JUc0VrdUVsZzZPbFc5?=
 =?utf-8?B?WWRCOHhjamppaXZKcjNoTFA0a0taTDdMRzhCMW1tdDhTZDRYaVFGK2JvWHhC?=
 =?utf-8?Q?z24nOcsKecCdIM6bxIdqAy5gttS9YljCEAfQyVl?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bcd6784-ddfd-48f6-4452-08d919cbf46e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2021 07:10:01.8788
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rJR2O5RLNoZlx6w3HqhlgYbohRQHuBdHOA+WHHaE8bpKCzyI3WZQKevkihX6ft5abK0VBHi2y3wAk1F+y8Ma3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4327
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PiBGcm9tOiBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5
LCBNYXkgMTMsIDIwMjEgMzozOSBQTQ0KPiANCj4gT24gRnJpLCBBcHIgMjMsIDIwMjEgYXQgMDE6
MTQ6MTRQTSArMDMwMCwgTWlyZWxhIFJhYnVsZWEgKE9TUykgd3JvdGU6DQo+ID4gRnJvbTogTWly
ZWxhIFJhYnVsZWEgPG1pcmVsYS5yYWJ1bGVhQG54cC5jb20+DQo+ID4NCj4gPiBBZGQgZHRzIGZv
ciBpbWFnaW5nIHN1YnN5dGVtLCBpbmNsdWRlIGpwZWcgbm9kZXMgaGVyZS4NCj4gPiBUZXN0ZWQg
b24gaW14OHF4cCBvbmx5LCBzaG91bGQgd29yayBvbiBpbXg4cW0sIGJ1dCBpdCB3YXMgbm90IHRl
c3RlZC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IE1pcmVsYSBSYWJ1bGVhIDxtaXJlbGEucmFi
dWxlYUBueHAuY29tPg0KPiANCj4gU28gdGhlIGJpbmRpbmdzIGFuZCBkcml2ZXIgcGFydHMgaGF2
ZSBiZWVuIGFjY2VwdGVkIGFscmVhZHk/DQo+IA0KPiA+IC0tLQ0KPiA+IENoYW5nZXMgaW4gdjEx
Og0KPiA+ICAgQWRyZXNzIGZlZWRiYWNrIGZyb20gQWlzaGVuZyBEb25nOg0KPiA+ICAgLSBSZW5h
bWUgaW1nX2pwZWdfZGVjX2Nsay9pbWdfanBlZ19lbmNfY2xrIHRvDQo+IGpwZWdfZGVjX2xwY2cv
anBlZ19lbmNfbHBjZyB0byBtYWtlIGl0IHZpc2libGUgaXQncyBscGNnIG5vdCBvdGhlciB0eXBl
IG9mIGNsaw0KPiA+ICAgLSBEcm9wIHRoZSBjYW1lcmFkZXYgbm9kZSwgbm90IG5lZWRlZCBmb3Ig
anBlZw0KPiA+ICAgLSBNYXRjaCBhc3NpZ25lZC1jbG9ja3MgJiBhc3NpZ25lZC1jbG9jay1yYXRl
cw0KPiA+DQo+ID4gIC4uLi9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OC1zcy1pbWcuZHRz
aSB8IDgyDQo+ICsrKysrKysrKysrKysrKysrKysNCj4gPiAgYXJjaC9hcm02NC9ib290L2R0cy9m
cmVlc2NhbGUvaW14OHF4cC5kdHNpICAgIHwgIDEgKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDgz
IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9k
dHMvZnJlZXNjYWxlL2lteDgtc3MtaW1nLmR0c2kNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4LXNzLWltZy5kdHNpDQo+IGIvYXJjaC9hcm02
NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OC1zcy1pbWcuZHRzaQ0KPiA+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5jNTA4ZTVkMGM5MmINCj4gPiAtLS0gL2Rl
di9udWxsDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OC1zcy1p
bWcuZHRzaQ0KPiA+IEBAIC0wLDAgKzEsODIgQEANCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjArDQo+ID4gKy8qDQo+ID4gKyAqIENvcHlyaWdodCAyMDE5LTIwMjEgTlhQ
DQo+ID4gKyAqIFpob3UgR3Vvbml1IDxndW9uaXUuemhvdUBueHAuY29tPg0KPiA+ICsgKi8NCj4g
PiAraW1nX3N1YnN5czogYnVzQDU4MDAwMDAwIHsNCj4gPiArCWNvbXBhdGlibGUgPSAic2ltcGxl
LWJ1cyI7DQo+ID4gKwkjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gPiArCSNzaXplLWNlbGxzID0g
PDE+Ow0KPiA+ICsJcmFuZ2VzID0gPDB4NTgwMDAwMDAgMHgwIDB4NTgwMDAwMDAgMHgxMDAwMDAw
PjsNCj4gPiArDQo+ID4gKwlpbWdfaXBnX2NsazogY2xvY2staW1nLWlwZyB7DQo+ID4gKwkJY29t
cGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7DQo+ID4gKwkJI2Nsb2NrLWNlbGxzID0gPDA+Ow0KPiA+
ICsJCWNsb2NrLWZyZXF1ZW5jeSA9IDwyMDAwMDAwMDA+Ow0KPiA+ICsJCWNsb2NrLW91dHB1dC1u
YW1lcyA9ICJpbWdfaXBnX2NsayI7DQo+ID4gKwl9Ow0KPiANCj4gSG1tLCBub3Qgc3VyZSBhIGZp
eGVkLWNsb2NrIHNob3VsZCBiZSBpbiB0aGUgc3Vic3lzdGVtLg0KDQpFYWNoIHN1YnN5c3RlbSBo
YXMgaXRzIG93biBmaXhlZCBjbG9jayBzbGljZS4gKEluZGVwZW5kZW50IHdpdGggDQpvdGhlciBz
dWJzeXN0ZW1zKS4gU28gd2UgcHV0IGl0IGluIHRoZSBzdWJzeXN0ZW0gZHRzaS4NCg0KUmVnYXJk
cw0KQWlzaGVuZw0K
