Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C79D92AC7DD
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 22:59:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730554AbgKIV7n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 16:59:43 -0500
Received: from mail-eopbgr80074.outbound.protection.outlook.com ([40.107.8.74]:20449
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725946AbgKIV7n (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Nov 2020 16:59:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WAuLZ1+gcozMKPInztam9DTrLMbHahUBzwfsM0tD01EtIzTFO1APeYCx5Cd7RmQDmaYZ74rKsCJ7NBkA+A080kDEDedECSKSZEAJf+9F903CJCrfGNVUcX1TXEexpRjNJwu5v3hxg1RwPT3Jp74YhcS3dw0qZZfFmvLZmKFeTkVdOg7XS/PTKDJAreBmyxsj1vhCsKeMkeKJCAx1Ohe2RI8MMm46bXqyHLMQRLS4GEtGK2GeTZy89PEUkWLBM05UoYn+a8p4TScjApQVBbmgsSC4SKRlTmJmBndTWvzxvDKbrSGNtPBAVeDV2MBkq/ZgCDTEkVGt2CsskkxAJuqWLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yptG+qcdFVHAe44yIklrIMm0WkEpM6sfmgLImbg4zM0=;
 b=jfM6iTnALqvU/COQ+zuRnpmxFHvIiLJy6DcodB6h1BKUjHBbc9OV0iotUO7tY4807WKZAVcKcTR3r/xy3u41TEqCtn+krq9RVcY2j01deo+NZFGyHx6XDnl1ntmscJOzKjZ/gmiz9czmmh6DRaCtfXRm+lC1eN91E9ZwhlxcCwke4/69+9uETrfCJMpn6KY9bPWKPmijp5qIybrfeAUqDUAYKxqoAVXesjgyzuoM0s/cNi3ffDagV8dMJ9IBlGfSUcLLough9OShP4IdmBkxg6/aSgQk+AxWi74UuOQpCaXjMn66nzCytu9gZcAUFmOv2g+XPK9KYzbu0jY/VhZMAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yptG+qcdFVHAe44yIklrIMm0WkEpM6sfmgLImbg4zM0=;
 b=Xzj8/6REwBL7tOK6BT6Ubm9UsPtYNINRtiHXSPYGGTFCL/IU2kUsMMW3h0wQ+rNF0USQ1/QZYLunEhDgfrQQwN7U22pFzieR3B0FdVjtMBWOdA5ExjIJJfFLVnfte+1f0fGMgoiU4T1fiO3Z7KRntlImtb1v5fwAS9a/DPKvKaY=
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB5912.eurprd04.prod.outlook.com (2603:10a6:20b:ab::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Mon, 9 Nov
 2020 21:59:39 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3541.025; Mon, 9 Nov 2020
 21:59:39 +0000
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
To:     "robh@kernel.org" <robh@kernel.org>,
        "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
CC:     dl-linux-imx <linux-imx@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Subject: Re: [EXT] Re: [PATCH v4 03/11] media: dt-bindings: Add bindings for
 i.MX8QXP/QM JPEG driver
Thread-Topic: [EXT] Re: [PATCH v4 03/11] media: dt-bindings: Add bindings for
 i.MX8QXP/QM JPEG driver
Thread-Index: AQHWsMWmfOnIn5n4NkGFWKzzrOKPqam4lO2AgAfQwwA=
Date:   Mon, 9 Nov 2020 21:59:39 +0000
Message-ID: <a575cf6a7e75f87bc84fed72a5a24b7b9ce23245.camel@nxp.com>
References: <20201102030821.3049-1-mirela.rabulea@oss.nxp.com>
         <20201102030821.3049-4-mirela.rabulea@oss.nxp.com>
         <20201104223837.GA49021@bogus>
In-Reply-To: <20201104223837.GA49021@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [86.124.171.138]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: aeb58fd1-092f-43e7-f83a-08d884fac177
x-ms-traffictypediagnostic: AM6PR04MB5912:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB5912D4E7C7B7E2787457C4E88FEA0@AM6PR04MB5912.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kF7Kp6TANLOlnH6p0Tg1f9JSvOzgvXvKDSRW2GHpKi4dvq5vB2mSmWFd80XazaLMGD0/uwWv3A+BxBSNCaeSHmJ1TxQz/49Iedv+LXHW3bFUm3XcBQRxiMg+lUC+wPHoZjmoe8YlDZ6cOWB3CbJlLOBROHkGrsq4HSQbxLrYFXDW53Yn3Fnzg4nCk2OdvfTrPKQlfnSghF+olWpV458OjUgo+p0kN9rl1eYDe+TkXwhsMvD5y4NhFQNHiMc+RORc1KzPxnHT8ULyhtlTi6C6CKzrDkRo8cTCaxLJ1+KcqMfjtQPnMLZE6yzndYVBayKRSI9CozFXSEfYZtYzXDckJZt/JdmArpxMwK6u8AbuFOXOYA602Xj1ph2bCDnrLuba
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39850400004)(346002)(366004)(396003)(8676002)(36756003)(8936002)(2616005)(71200400001)(54906003)(2906002)(316002)(478600001)(186003)(6486002)(26005)(76116006)(66556008)(66476007)(66446008)(64756008)(66946007)(6512007)(44832011)(83380400001)(6506007)(4326008)(7416002)(110136005)(5660300002)(86362001)(91956017)(99106002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: FY4m2oQnhFzVuylz9UtabMOP4hWHp4VhNYxvjRWiEXHDnLfOY+zO95PZuGGEssSJcwAxBX+/n3ErOBk0xdQuJsDab0xI1bbugA28wrwrOWoDBPK27T+d4RBIUp5fvLKAEZkW32kJ0QTg49vvlPwSKBWwnVQ32W0H0zObBSa4keArCBnhXAInjxKYYv0PE/rQ+7yc3yw7h5xSo2a3oCZKxK78bPCUISaze9HrVqXAStmftZASiqZ1rp8QTItS5Y8arN40HQTHEUjEKSHzJp1o1O2NN37+19ZKxwZbx8F75Df5cGCPMUI+0Zhe/vLr1G1lQixcFO7ddRqIcxR7h9SDTiFRkawKXp0O7S3sqDJIJil4tc8bNehZ8MBc6rWzcT9xzQhb7lnjo2bc2gwS5VW/XQLi20jOyAl7kwspWxCwq3waiMV22qbl+Z62Oktz1ZrtBKJ8ec8r/hNUOAjO5DnkXIahR5lKgs1QSFE/CH7j95MzJtXjqY2nv6Qym9plR+rz7ygsJbCisK7M4I8ojRm8c6brX6nqr7/XGOI1oYBRao6bA8/BaPdbtwpgeWfcAptrUtQJY2+EjnWqk/KowMiFvJjssVb8OihHWF0hHAzSVOGJCp+Pd/Vajs5Y1kE1H/VzuK2SasZZdILEl4rmVLcPohHF1qxO7pwT5QWZAoYRpcvurpiGJcJ4Gf7Td0wQO9vJ8wmZPlLuRs6tmm/SjfdXAfksLxzPIwl/kxE/IEHViBZUUyhEiWRXvt7SuPeYcyAu0XlcszHWrq47DPrcDy7oG80GYjIUWpXZmGsQbR9QkoHRvGCcCeUuHEUMA+8LKBZ3W1Cg+xPGzH+2XtBUHzu8emftZbaKps6/xmjoq7yCRg1Yv0fpsdFbhXk4Mxu948rsvIUH4OV+5pQmU0eNFFd4UA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <F36B068107D0CE4AB6E746DFEAACBEE9@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb58fd1-092f-43e7-f83a-08d884fac177
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2020 21:59:39.4281
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f+rZ1xqCC46qDHkYFACD+Sl880Z6bdkvnrNyjAhNOz6fVfCncjL5qqph+4GeMOaDidiRS3FfG+yKIEksMl4Wrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5912
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksDQoNCk9uIFdlZCwgMjAyMC0xMS0wNCBhdCAxNjozOCAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6DQo+ID4gK3RpdGxlOiBpLk1YOFFYUC9RTSBKUEVHIGRlY29kZXIvZW5jb2RlciBEZXZpY2Ug
VHJlZSBCaW5kaW5ncw0KPiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4gKyAgLSBNaXJlbGEg
UmFidWxlYSA8bWlyZWxhLnJhYnVsZWFAbnhwLmNvbT4NCj4gPiArDQo+ID4gK2Rlc2NyaXB0aW9u
OiB8LQ0KPiA+ICsgIFRoZSBKUEVHIGRlY29kZXIvZW5jb2RlciBwcmVzZW50IGluLk1YUVhQL1FN
IFNvQyBpcyBhbg0KPiA+ICsgIElTTy9JRUMgMTA5MTgtMSBKUEVHIHN0YW5kYXJkIGNvbXBsaWFu
dCBkZWNvZGVyL2VuY29kZXIsIGZvcg0KPiA+IEJhc2VsaW5lDQo+ID4gKyAgYW5kIEV4dGVuZGVk
IFNlcXVlbnRpYWwgRENUIG1vZGVzLg0KPiA+ICsNCj4gPiArcHJvcGVydGllczoNCj4gPiArICBj
b21wYXRpYmxlOg0KPiA+ICsgICAgaXRlbXM6DQo+ID4gKyAgICAgIC0gZW51bToNCj4gPiArICAg
ICAgICAgICAgIyBKUEVHIGRlY29kZXINCj4gPiArICAgICAgICAgIC0gZnNsLGlteDgtanBnZGVj
DQo+ID4gKyAgICAgICAgICAgICMgSlBFRyBlbmNvZGVyDQo+ID4gKyAgICAgICAgICAtIGZzbCxp
bXg4LWpwZ2VuYw0KPiANCj4gV2hpY2ggaW14OD8gU2hvdWxkIGJlIFNvQyBzcGVjaWZpYy4NCg0K
VGhpcyBJUCBpcyBwcmVzZW50IGluIDIgU09DcywgaW14OHF4cCAmIGlteDhxbS4NCkZvciB0aGUg
bmV4dCB2ZXJzaW9uLCBJIG1vZGlmaWVkIHRoZSBjb21wYXRpYmxlcyB0byBueHAsaW14OHF4cC1q
cGdkZWMNCiYgbnhwLGlteDhxeHAtanBnZW5jLCBzaW5jZSBvbmx5IDhxeHAgd2FzIHRlc3RlZCB1
cHN0cmVhbS4NCkkga2VwdCB0aGUgbmFtZSBvZiB0aGUgeWFtbCBmaWxlIGdlbmVyaWMsIGJ1dCBt
b2RpZmllZCBpdCB0byBueHAsaW14OC0NCmpwZWcueWFtbC4gUG9zc2libHksIGluIHRoZSBmdXR1
cmUsIHRoaXMgZmlsZSB3aWxsIGFsc28gaG9zdCBpbXg4cW0NCmNvbXBhdGlibGVzLg0KQWxzbyBj
aGFuZ2VkIHRoZSBkdGIgJiBkcml2ZXIgYWNjb3JkaW5nbHkuDQoNCj4gDQo+ID4gKw0KPiA+ICsg
IHJlZzoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICsgIGludGVycnVwdHM6DQo+
ID4gKyAgICBkZXNjcmlwdGlvbjogfA0KPiA+ICsgICAgICBUaGVyZSBhcmUgNCBzbG90cyBhdmFp
bGFibGUgaW4gdGhlIElQDQo+ID4gKyAgICAgIElmIGEgY2VydGFpbiBzbG90IGlzIHVzZWQsIGl0
IHNob3VsZCBoYXZlIGFuIGFzc29jaWF0ZWQNCj4gPiBpbnRlcnJ1cHQNCj4gPiArICAgIG1pbkl0
ZW1zOiAxICAgICAgICAgICAgICAgIyBBdCBsZWFzdCBvbmUgc2xvdCBzaG91bGQgYmUNCj4gPiBh
dmFpbGFibGUNCj4gPiArICAgIG1heEl0ZW1zOiA0ICAgICAgICAgICAgICAgIyBUaGUgSVAgaGFz
IDQgc2xvdHMgYXZhaWxhYmxlIGZvcg0KPiA+IHVzZQ0KPiANCj4gWW91IGRvbid0IG5lZWQgdG8g
a25vdyB3aGljaCBzbG90IGlzIGF2YWlsYWJsZT8NCg0KTm8sIHRoZSBkcml2ZXIga2VlcHMgdHJh
Y2sgb2Ygd2hpY2ggc2xvdHMgYXJlIHVzZWQgKGFuZCwgZm9yIG5vdywgb25seQ0KdXNlcyBzbG90
IDApLg0KSXQgaXMgYWxzbyBwb3NzaWJsZSB0byBkZXRlcm1pbmUgd2hpY2ggaXMgdGhlIGN1cnJl
bnQgcnVubmluZyBzbG90IGJ5DQphY2Nlc3NpbmcgYSBzdGF0dXMgbWVtb3J5IG1hcHBlZCByZWdp
c3RlciAodGhlIElQIHJ1bnMgdGhlIGNvbmZpZ3VyZWQNCnNsb3RzIGluIGEgcm91bmQtcm9iaW4g
bWFubmVyLCBub3QgaW4gcGFyYWxsZWwpLg0KVGhlIGFzc3VtcHRpb24gaXMsIGhvd2V2ZXIsIHRo
YXQgaW4gdGhlIGRldmljZSBub2RlLCB0aGUgaW50ZXJydXB0IGkgaXMNCmZvciBzbG90IGkuIFNv
LCBJIHJlcGhyYXNlZCB0aGlzIHRvOg0KICBpbnRlcnJ1cHRzOg0KICAgIGRlc2NyaXB0aW9uOiB8
DQogICAgICBUaGVyZSBhcmUgNCBzbG90cyBhdmFpbGFibGUgaW4gdGhlIElQLCB3aGljaCB0aGUg
ZHJpdmVyIG1heSB1c2UNCiAgICAgIElmIGEgY2VydGFpbiBzbG90IGlzIHVzZWQsIGl0IHNob3Vs
ZCBoYXZlIGFuIGFzc29jaWF0ZWQgaW50ZXJydXB0DQogICAgICBUaGUgaW50ZXJydXB0IHdpdGgg
aW5kZXggaSBpcyBhc3N1bWVkIHRvIGJlIGZvciBzbG90IGkNCiAgICBtaW5JdGVtczogMSAgICAg
ICAgICAgICAgICMgQXQgbGVhc3Qgb25lIHNsb3QgaXMgbmVlZGVkIGJ5IHRoZQ0KZHJpdmVyDQog
ICAgbWF4SXRlbXM6IDQgICAgICAgICAgICAgICAjIFRoZSBJUCBoYXMgNCBzbG90cyBhdmFpbGFi
bGUgZm9yIHVzZQ0KDQoNClRoYW5rcywNCk1pcmVsYQ0KDQo=
