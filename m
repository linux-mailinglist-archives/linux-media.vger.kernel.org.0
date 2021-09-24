Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC984169A1
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 03:52:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243805AbhIXBxn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Sep 2021 21:53:43 -0400
Received: from mail-eopbgr00082.outbound.protection.outlook.com ([40.107.0.82]:60151
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240863AbhIXBxf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Sep 2021 21:53:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSkiS1/P819KjmbsYwKe0yKBbMPTlkxcPAN5bBQlBnIxvnaQ3PVK5Abej+bT5k/uDGn882XIPDBjk5Vw9H6c/HzyjUMqV9Xx4WgJtXWnp/ipxxT68ymrMo0+vVc0PRFuCp/rwPLLcvxtKxXvbSi4LE+N/9PSwi0gaLphdfWKw+b1SXrMsRwMB3bqv0XLqtEX5riEG1W3+inU1RtoJUbjoK3y3w/k+DCqcmwlbbtZdf5t0h2BsLYfyETyGkSVhd2c6OKITQhiv9hunRsdqjumhaVZhruQsb75eAuUjcikHoxtw7lrQDmBkii/W70a7mNdp89T9LjWxZi/o0/IgfS67g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=7WllGwmiPw/2bw7PnekEgFzothjRWY70sPBsV0FQTdc=;
 b=hxmSpISCOFiAbHpHIHIGWYFM8tyIpawwt7wptfXKBer2B+Fgj/0ca+Gtfsma+DpOCPKmhp+utM5w/fBslHCf3PVMu2Qnyg1PDfhF1M465T8cudrYXZZpE1ZzkZK42NA6HlqCSQdOnbBuxD2WgmcSnbzVdEZgl2+zr51A3Hc5JB1RW730u0FI4aKpT4GTVEt95QV3zFgZkyxHZwBRgbqRyICVhUH+kqmkezHurijyZMSJURjMdK6slAiLsxCfr4lqyOmJ7fPGq968ZgNaMHs1OVI+uLZqDdt55P7+zgI0NIVN8uxlsqVaHPyQCpc3MGPC6APTmEdiTsRgXAqERXrdGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WllGwmiPw/2bw7PnekEgFzothjRWY70sPBsV0FQTdc=;
 b=AIE7eQxq4deEG+oPZb87PBzqVjnBMNogYXCOCUnw6xCzbaUqHVK+56//HKTs5OKGt8rq3+swqZnFYMNl23pgQA5RlaIi/OjGY2zoQXvmZC0GPhPF1nVxqCRW0Axn1XahH1/GThWtzBi6zDjrhE17cypygwzklgkGcCRnOCq3VsA=
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB4071.eurprd04.prod.outlook.com (2603:10a6:209:47::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Fri, 24 Sep
 2021 01:52:00 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4%7]) with mapi id 15.20.4523.021; Fri, 24 Sep 2021
 01:52:00 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
CC:     "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCH v9 04/13] media: amphion: add vpu core driver
Thread-Topic: [EXT] Re: [PATCH v9 04/13] media: amphion: add vpu core driver
Thread-Index: AQHXqHsNkdGwBy7DL0qWKc3F+U3xwauxvUaAgAC+WQA=
Date:   Fri, 24 Sep 2021 01:52:00 +0000
Message-ID: <AM6PR04MB6341B2AAA269B1FC2FD191ACE7A49@AM6PR04MB6341.eurprd04.prod.outlook.com>
References: <cover.1631521295.git.ming.qian@nxp.com>
         <51ba61663ce92a9fe71343578689a0e196d0dfea.1631521295.git.ming.qian@nxp.com>
 <d49c5a614fb80f1a7f073e398db72c0d8b63c32b.camel@ndufresne.ca>
In-Reply-To: <d49c5a614fb80f1a7f073e398db72c0d8b63c32b.camel@ndufresne.ca>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ndufresne.ca; dkim=none (message not signed)
 header.d=none;ndufresne.ca; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53236c2d-de9b-4757-f967-08d97efde674
x-ms-traffictypediagnostic: AM6PR04MB4071:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB407193D84C25FA760C5D4BE0E7A49@AM6PR04MB4071.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RqVEBn0kDf8RZio8Na2B/592ALpxt7B1D6OgYSEKtP5FLaPi0W1BeYMq+b3QsGjS1oCGSSmrq8kYxxL6oYUv3GPHBntmAc6/ef7FQrATC579oW1aE4ESljAHTANkGLxMUr0x8VrkCGFwI4aGYgX+/LxBVJ83lOUckEFcJr0dhrCsSZNDNT1GC1PkCFJSmcNMt+yN+BtEc5UnwCS4T+oC/HC2In/MBKpWZs4S2UZEecgnaJ6/f9466V5qQyNfc7KfGLrZQK+6SfKSFtatpOgTQ0gFX/xnG9XrOklQQR6L7XBZT9dtGphS1JGKRDX11CEJQ2Z5hV7leVSbSbk02hvAAnGG25a+TCIPXGYJ4xkbOQw9U9WEMma9W+ggu1xUM0ADWNAfmwiwz4EQ7gr7blJycUSeXnuG7UkF0VKYiqjOYKF3Xd74f/haioHTT2SSduW4mbbEn1vR7fd7R/DQaXstI4cRHl6WIqQxSqQKzam6LGpv/mPDUvdRRLavkhFLZmGEQ+MEaPEbqo85MYVVXWqiuBi9hrYBL3TR9UgHibNX7a+xMZ810gH6jWKo0B/9j4QO+OdzjSFXb3/uiOYZ8rD6vnobalg0CByCANUVZiHWM2PHwFeSYlSzNKRl2Vhgi9KFCXxIIc4AUJKlIrHPYluoLfSQhMcNbN153oGRffpfXWiYyE8TUrgKVgDmhBYA0n44V1/6eUsZKIfG7atsE2JnBA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(71200400001)(508600001)(8936002)(44832011)(55016002)(76116006)(66446008)(66946007)(66476007)(66556008)(64756008)(8676002)(45080400002)(83380400001)(4326008)(66574015)(122000001)(2906002)(52536014)(54906003)(110136005)(26005)(86362001)(186003)(7696005)(316002)(6506007)(38100700002)(38070700005)(7416002)(33656002)(5660300002)(9686003)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sk5BNUdxMEZVczNwb3lYN3hMSnd4SFNrTkxWWGpaTzBoZVdtblNWNU1ieXZq?=
 =?utf-8?B?emJ3bkFYVHFhT1hGOFduQ0duV2F3YTBUUndvL2piSzczR0Z2UXhhMGNMUUxO?=
 =?utf-8?B?MmNVTHdmWVcrWVNqNFdlb2VTQnRIeDZrbWhSTTZkTzFTeFhmWlpNY0M0NkI5?=
 =?utf-8?B?c2pHem5ZMlRzdG1CNnpWTHc0dXV6ZVJmdjFNbHBJWWY0QmhMUk5ia29WK1V2?=
 =?utf-8?B?MGpzd3NuS1dpMjUvZmE4NUFxNjBteVV0WFg3QjY3TFpaN1premtobmREa2pp?=
 =?utf-8?B?T2VNR3pneklrYVlZRUtiMEtlbmFZQi83dGU1NnJSSk16eHZzZEU4RHA4QkpZ?=
 =?utf-8?B?SklzbHMva1hOazJDRGVmdlpta3BQdjJYMldBRWh4Ry9YR1ZDelJMRERZcmJL?=
 =?utf-8?B?SXpGa0RrZlRPWFZ6TXZXK3RNTHFaNjdqYWJ0L2N4ZXAvM1JKT2hmUUR0S3NQ?=
 =?utf-8?B?S2lDTElXQjZYV1ZRV2JObk9HSGhoY21SVGVSUTIvYyt2blVSb05GTmluMjd3?=
 =?utf-8?B?TUt5b3FJUThQY0hObmN0enVvbVNVYW15aEhIUEFtbXhINllmS2hVWGFlb21p?=
 =?utf-8?B?b2FwOWY3S3FPMWhhUk5TNU1TUVA0VHZRVWNZaWpoT1dYUllZTEJMY3YzK24w?=
 =?utf-8?B?cHo1bVM3WUgwSmE4d3pCdUUxM2MxMW0rb0tWUjZYQkNmaEtaSjFvRXFBZXd0?=
 =?utf-8?B?SjQ4bGdZNXREQzE4d1RId2hGZmc5R0p3SFhEd1ptVEt6SjRhZ1B1U1BHZEZ0?=
 =?utf-8?B?SXBUY25BTDhmMml6ZzlnTlhSUk9MMGdXWndOWTlwWVRmZVgwYmVzZi9WbGd5?=
 =?utf-8?B?VEVMSGYxd0FNQ0hZbzNNbUNKUE0zY2llWWhZd0NORGVTYnNKTkhwSmNBc2hO?=
 =?utf-8?B?Z1lSWGNicUx3bWJacHdiNDhwemtlcENMaFordXFlVGVoaGpIcWc2UUZ2U1hN?=
 =?utf-8?B?czdCd1paWWpNSVhucDdzQyt5bndKbEQ5TGZGcEFyRUNBWjRkbEsvMUVtUVFH?=
 =?utf-8?B?amhzcWdrcnpTVng0Qmp0N25rSTV2MWVsakVRNitOR2g3YXd5ZFJlZ0gvRjN3?=
 =?utf-8?B?RHFsODRDQ2xtZEgwL3JTZWFRUXRnc1JOd0VmbGFDYTc4bUpsWFVBV3BlNWcy?=
 =?utf-8?B?YjRTRkpXblpJQjZvQ0ZxVHhxUlIzMGVKWlhIUm5qcWsvVnppVUFQUFZkY1Iv?=
 =?utf-8?B?ZnBhQnR6UU9jQXUvS0xoWTVqUHZrV2VPdUx2NUlwUisyeklpdFo0bDYwSXZx?=
 =?utf-8?B?Qmh6aFpsZCtyRVRuaGNwSTNRelZjRGpwNmRHRGFIQ1ErOWtpcnlsMTdaellM?=
 =?utf-8?B?eFJRZWRJeHdIcmovRmE2bCtFWmZwUUhEY2hycVc2TnhZZmRvVUlWSHJBSWQw?=
 =?utf-8?B?bmlnNHhWU2FmSElhNGc2TEpWdXZYVy9aUkUrNFEwWWV3Tks1YWl6eXN2WStr?=
 =?utf-8?B?M2xXQXpncWx2SEplSUNjL2tkNTRoTlBMUkZBRU50TmkwRGsrRmxyQjRNUE8y?=
 =?utf-8?B?Q3VlSzltRXdZUWtHM2NldTcxaysxNUNEWEhlaHE2NmRYWi9JUFIvSjlRQTRU?=
 =?utf-8?B?M3NNVWVXYUR1VlhwVktJWjh6SlRNS3lJNGdvL1hDRWNrZXFrWmZLcGkvWjVt?=
 =?utf-8?B?L0RYWDBuZVJJYjFGTUZ2Rm54Q3FybDhqeHd1NnlhMVVwKzNzVlpIZS9FZytY?=
 =?utf-8?B?Qjh6Y2llUlZENm5kb1BoWjMyb09RcDBZV3pLdG1ncDUrUUlCSWVNQzVuSG5p?=
 =?utf-8?Q?7Hg6w2j+66luFIrb2wGOTPWByRBsADzP1bAgWBa?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53236c2d-de9b-4757-f967-08d97efde674
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2021 01:52:00.6837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /kUx1qYUVPDzU44rT6Ph9wXemm3UYHq9fbhWIknmb3i3tXT3rcN9/nCzYwR455c4w9i66Fp8efiNGIMQVDv7rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4071
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBOaWNvbGFzIER1ZnJlc25lIFtt
YWlsdG86bmljb2xhc0BuZHVmcmVzbmUuY2FdDQo+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIg
MjMsIDIwMjEgMTA6MjcgUE0NCj4gVG86IE1pbmcgUWlhbiA8bWluZy5xaWFuQG54cC5jb20+OyBt
Y2hlaGFiQGtlcm5lbC5vcmc7DQo+IHNoYXduZ3VvQGtlcm5lbC5vcmc7IHJvYmgrZHRAa2VybmVs
Lm9yZzsgcy5oYXVlckBwZW5ndXRyb25peC5kZQ0KPiBDYzogaHZlcmt1aWwtY2lzY29AeHM0YWxs
Lm5sOyBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IGZlc3RldmFtQGdtYWlsLmNvbTsNCj4gZGwtbGlu
dXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT47IEFpc2hlbmcgRG9uZyA8YWlzaGVuZy5kb25nQG54
cC5jb20+Ow0KPiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2Vy
bmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gU3ViamVjdDogW0VYVF0gUmU6IFtQQVRDSCB2OSAw
NC8xM10gbWVkaWE6IGFtcGhpb246IGFkZCB2cHUgY29yZSBkcml2ZXINCj4gDQo+IENhdXRpb246
IEVYVCBFbWFpbA0KPiANCj4gTGUgbHVuZGkgMTMgc2VwdGVtYnJlIDIwMjEgw6AgMTc6MTEgKzA4
MDAsIE1pbmcgUWlhbiBhIMOpY3JpdCA6DQo+ID4gVGhlIHZwdSBzdXBwb3J0cyBlbmNvZGVyIGFu
ZCBkZWNvZGVyLg0KPiA+IGl0IG5lZWRzIG11IGNvcmUgdG8gaGFuZGxlIGl0Lg0KPiA+IGNvcmUg
d2lsbCBydW4gZWl0aGVyIGVuY29kZXIgb3IgZGVjb2RlciBmaXJtd2FyZS4NCj4gPg0KPiA+IFRo
aXMgZHJpdmVyIGlzIGZvciBzdXBwb3J0IHRoZSB2cHUgY29yZS4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IE1pbmcgUWlhbiA8bWluZy5xaWFuQG54cC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTog
U2hpamllIFFpbiA8c2hpamllLnFpbkBueHAuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFpob3Ug
UGVuZyA8ZWFnbGUuemhvdUBueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL2FtcGhpb24vdnB1X2NvZGVjLmggfCAgNjggKysNCj4gPiAgZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9hbXBoaW9uL3ZwdV9jb3JlLmMgIHwgOTAxDQo+ICsrKysrKysrKysrKysrKysrKysr
Kw0KPiA+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL2FtcGhpb24vdnB1X2NvcmUuaCAgfCAgMTYg
Kw0KPiA+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL2FtcGhpb24vdnB1X2RiZy5jICAgfCA0OTYg
KysrKysrKysrKysrDQo+ID4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYW1waGlvbi92cHVfbG9n
LmggICB8ICA0NCArDQo+ID4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYW1waGlvbi92cHVfcnBj
LmMgICB8IDI2MyArKysrKysNCj4gPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hbXBoaW9uL3Zw
dV9ycGMuaCAgIHwgNDYzICsrKysrKysrKysrDQo+ID4gIDcgZmlsZXMgY2hhbmdlZCwgMjI1MSBp
bnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL3BsYXRm
b3JtL2FtcGhpb24vdnB1X2NvZGVjLmgNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vYW1waGlvbi92cHVfY29yZS5jDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL2FtcGhpb24vdnB1X2NvcmUuaA0KPiA+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hbXBoaW9uL3ZwdV9kYmcuYw0KPiA+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hbXBoaW9uL3ZwdV9s
b2cuaA0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hbXBo
aW9uL3ZwdV9ycGMuYw0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9hbXBoaW9uL3ZwdV9ycGMuaA0KPiA+DQo+ID4gK3N0YXRpYyBpbnQgdnB1X2NvcmVfcmVt
b3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gK3sNCj4gPiArICAgICBzdHJ1
Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Ow0KPiA+ICsgICAgIHN0cnVjdCB2cHVfY29yZSAq
Y29yZSA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOw0KPiA+ICsgICAgIGludCByZXQ7DQo+
ID4gKw0KPiA+ICsgICAgIHZwdV9jb3JlX3JlbW92ZV9kYmdmc19maWxlKGNvcmUpOw0KPiANCj4g
VGhpcyBjcmFzaCB3aGVuIHRoZSBtb2R1bGUgdXMgdW5sb2FkZWQuDQo+IA0KPiBbIDEwNTEuMTk4
MjkwXSBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgYXQg
dmlydHVhbA0KPiBhZGRyZXNzIDAwMDAwMDAwMDAwMDAwYTANCj4gWyAxMDUxLjIwNzY1M10gTWVt
IGFib3J0IGluZm86DQo+IFsgMTA1MS4yMjIxMzBdICAgRVNSID0gMHg5NjAwMDAwNA0KPiBbIDEw
NTEuMjI3NTQzXSAgIEVDID0gMHgyNTogREFCVCAoY3VycmVudCBFTCksIElMID0gMzIgYml0cw0K
PiBbIDEwNTEuMjMzMzU0XSAgIFNFVCA9IDAsIEZuViA9IDANCj4gWyAxMDUxLjIzNjYwNF0gICBF
QSA9IDAsIFMxUFRXID0gMA0KPiBbIDEwNTEuMjM5ODM3XSAgIEZTQyA9IDB4MDQ6IGxldmVsIDAg
dHJhbnNsYXRpb24gZmF1bHQNCj4gWyAxMDUxLjI0NTE3NV0gRGF0YSBhYm9ydCBpbmZvOg0KPiBb
IDEwNTEuMjQ4NDgwXSAgIElTViA9IDAsIElTUyA9IDB4MDAwMDAwMDQNCj4gWyAxMDUxLjI1MzYw
Nl0gICBDTSA9IDAsIFduUiA9IDANCj4gWyAxMDUxLjI1NzAzOV0gdXNlciBwZ3RhYmxlOiA0ayBw
YWdlcywgNDgtYml0IFZBcywgcGdkcD0wMDAwMDAwODgyNmI0MDAwDQo+IFsgMTA1MS4yNzE3NTZd
IFswMDAwMDAwMDAwMDAwMGEwXSBwZ2Q9MDAwMDAwMDAwMDAwMDAwMCwNCj4gcDRkPTAwMDAwMDAw
MDAwMDAwMDANCj4gWyAxMDUxLjI4NjkwOF0gSW50ZXJuYWwgZXJyb3I6IE9vcHM6IDk2MDAwMDA0
IFsjMV0gUFJFRU1QVCBTTVANCj4gWyAxMDUxLjI5MjUzNl0gTW9kdWxlcyBsaW5rZWQgaW46IGFt
cGhpb25fdnB1X2NvcmUoLSkgdjRsMl9tZW0ybWVtDQo+IHZpZGVvYnVmMl92bWFsbG9jIHZpZGVv
YnVmMl9kbWFfY29udGlnIHZpZGVvYnVmMl9tZW1vcHMgdmlkZW9idWYyX3Y0bDINCj4gdmlkZW9i
dWYyX2NvbW1vbiBjcmN0MTBkaWZfY2UgaW14X3NjX3dkdCBpbXhfc2NfdGhlcm1hbCBpbXhfc2Nf
a2V5DQo+IHJ0Y19pbXhfc2MNCj4gZnNsX2lteDhfZGRyX3BlcmYgbXBsMzExNSBpbmR1c3RyaWFs
aW9fdHJpZ2dlcmVkX2J1ZmZlciBrZmlmb19idWYgaXNsMjkwMTgNCj4gdmlkZW9kZXYgbWMgZHJt
IGZ1c2UgaXBfdGFibGVzIHhfdGFibGVzIGlwdjYgW2xhc3QgdW5sb2FkZWQ6DQo+IGFtcGhpb25f
dnB1X2Rldl0NCj4gWyAxMDUxLjMyNDg1Nl0gQ1BVOiAwIFBJRDogNDkxIENvbW06IHJtbW9kIE5v
dCB0YWludGVkDQo+IDUuMTUuMC1yYzItaW14OHF4cCsgIzINCj4gWyAxMDUxLjMzMTc0OF0gSGFy
ZHdhcmUgbmFtZTogRnJlZXNjYWxlIGkuTVg4UVhQIE1FSyAoRFQpDQo+IFsgMTA1MS4zMzY4OThd
IHBzdGF0ZTogNjAwMDAwMDUgKG5aQ3YgZGFpZiAtUEFOIC1VQU8gLVRDTyAtRElUIC1TU0JTDQo+
IEJUWVBFPS0tKQ0KPiBbIDEwNTEuMzQzODc1XSBwYyA6IGRvd25fcmVhZF9pbnRlcnJ1cHRpYmxl
KzB4ZWMvMHgyMDANCj4gWyAxMDUxLjM0ODc3Ml0gbHIgOiBzaW1wbGVfcmVjdXJzaXZlX3JlbW92
YWwrMHg0Yy8weDI5Yw0KPiBbIDEwNTEuMzUzNzUyXSBzcCA6IGZmZmY4MDAwMTMwMmJiZDANCj4g
WyAxMDUxLjM1NzA2OV0geDI5OiBmZmZmODAwMDEzMDJiYmQwIHgyODogZmZmZjAwMDgwNzNkMjMw
MCB4Mjc6DQo+IGZmZmYwMDA4MDczZDIzNTgNCj4gWyAxMDUxLjM2NDIyOV0geDI2OiAwMDAwMDAw
MDAwMDAwMDAwIHgyNTogMDAwMDAwMDAwMDAwMDBhMCB4MjQ6DQo+IDAwMDAwMDAwMDAwMDAwMDAN
Cj4gWyAxMDUxLjM3MTM4N10geDIzOiBmZmZmMDAwODAwMTQ1MDkwIHgyMjogMDAwMDAwMDAwMDAw
MDAwMCB4MjE6DQo+IGZmZmY4MDAwMTI1OGVkM2MNCj4gWyAxMDUxLjM3ODU0NV0geDIwOiBmZmZm
ODAwMDEyNThlZDQwIHgxOTogZmZmZjAwMDgwNzNkMjMwMCB4MTg6DQo+IGZmZmY4MDAwMTI1NzNm
NTQNCj4gWyAxMDUxLjM4NTcwNF0geDE3OiAwMDAwMDAwMDAwMDAwMDAwIHgxNjogMDAwMDAwMDAw
MDAwMDAwZCB4MTU6DQo+IDAwMDAxMDRjYTE5YWZmMTANCj4gWyAxMDUxLjM5Mjg2M10geDE0OiAw
MDAwMDAwMDAwMDAwMGFkIHgxMzogMDAwMDAwMDAwMDAwMDAwMSB4MTI6DQo+IDAwMDAwMDAwMDAw
MDAwMDANCj4gWyAxMDUxLjQwMDAyM10geDExOiAwMDAwMDAwMDAwMDAwMDAwIHgxMDogMDAwMDAw
MDAwMDAwMDk5MCB4OSA6DQo+IGZmZmY4MDAwMTMwMmI4NjANCj4gWyAxMDUxLjQwNzE3OV0geDgg
OiAwMTAxMDEwMTAxMDEwMTAxIHg3IDogN2Y3ZjdmN2Y3ZjdmN2Y3ZiB4NiA6DQo+IDAwMDAwMDAw
MDAwMDEyNmUNCj4gWyAxMDUxLjQxNDMzOF0geDUgOiAwMDAwMDAwMDAwMDAwMDAwIHg0IDogMDAw
MDAwMDAwMDAwMDAwMCB4MyA6DQo+IDAwMDAwMDAwMDAwMDAwYTANCj4gWyAxMDUxLjQyMTQ5Nl0g
eDIgOiAwMDAwMDAwMDAwMDAwMDAxIHgxIDogMDAwMDAwMDAwMDAwMDAwMCB4MCA6DQo+IDAwMDAw
MDAwMDAwMDAwYTANCj4gWyAxMDUxLjQyODY1OV0gQ2FsbCB0cmFjZToNCj4gWyAxMDUxLjQzMTEx
M10gIGRvd25fcmVhZF9pbnRlcnJ1cHRpYmxlKzB4ZWMvMHgyMDANCj4gWyAxMDUxLjQzNTY1NV0g
IGRlYnVnZnNfcmVtb3ZlKzB4NWMvMHg4MA0KPiBbIDEwNTEuNDM5MzI5XSAgdnB1X2NvcmVfcmVt
b3ZlX2RiZ2ZzX2ZpbGUrMHgyNC8weDUwDQo+IFthbXBoaW9uX3ZwdV9jb3JlXQ0KPiBbIDEwNTEu
NDQ1NzM0XSAgdnB1X2NvcmVfcmVtb3ZlKzB4MjQvMHgxNTAgW2FtcGhpb25fdnB1X2NvcmVdDQo+
IFsgMTA1MS40NTEyNjFdICBwbGF0Zm9ybV9yZW1vdmUrMHgyYy8weDYwDQo+IFsgMTA1MS40NTUw
MjhdICBfX2RldmljZV9yZWxlYXNlX2RyaXZlcisweDE4OC8weDIzNA0KPiBbIDEwNTEuNDU5NjU5
XSAgZHJpdmVyX2RldGFjaCsweGM0LzB4MTUwDQo+IFsgMTA1MS40NjMzMzVdICBidXNfcmVtb3Zl
X2RyaXZlcisweDYwLzB4ZTANCj4gWyAxMDUxLjQ2NzI3MF0gIGRyaXZlcl91bnJlZ2lzdGVyKzB4
MzQvMHg2NA0KPiBbIDEwNTEuNDcxMjA0XSAgcGxhdGZvcm1fZHJpdmVyX3VucmVnaXN0ZXIrMHgx
OC8weDI0DQo+IFsgMTA1MS40NzU5MjJdICBhbXBoaW9uX3ZwdV9jb3JlX2RyaXZlcl9leGl0KzB4
MjAvMHgyYw0KPiBbYW1waGlvbl92cHVfY29yZV0NCj4gWyAxMDUxLjQ4MjQ5NF0gIF9fYXJtNjRf
c3lzX2RlbGV0ZV9tb2R1bGUrMHgxOTQvMHgyNWMNCj4gWyAxMDUxLjQ4NzMwM10gIGludm9rZV9z
eXNjYWxsKzB4NDgvMHgxMTQNCj4gWyAxMDUxLjQ5MTA2M10gIGVsMF9zdmNfY29tbW9uLmNvbnN0
cHJvcC4wKzB4NDQvMHhmYw0KPiBbIDEwNTEuNDk1NzgxXSAgZG9fZWwwX3N2YysweDJjLzB4OTQN
Cj4gWyAxMDUxLjQ5OTEwN10gIGVsMF9zdmMrMHgyOC8weDgwDQo+IFsgMTA1MS41MDIxNzZdICBl
bDB0XzY0X3N5bmNfaGFuZGxlcisweGE4LzB4MTMwDQo+IFsgMTA1MS41MDY0NThdICBlbDB0XzY0
X3N5bmMrMHgxYTAvMHgxYTQNCj4gWyAxMDUxLjUxMDE0MV0gQ29kZTogYzgwNDdjNjIgMzVmZmZm
ODQgMTdmZmZlNjMgZjk4MDAwNzEgKGM4NWZmYzYwKQ0KPiBbIDEwNTEuNTE2MjQ3XSAtLS1bIGVu
ZCB0cmFjZSAzODcxMGQ0MjQyMjEyOGRjIF0tLS0NCj4gDQo+IA0KSSdtIHNvcnJ5IHRoYXQgSSBk
aWRuJ3QgdGVzdCB0aGUgcm1tb2QgaW4gcmVjZW50IHZlcnNpb24sIEknbGwgZml4IGl0IGluIHRo
ZSBuZXh0IHZlcnNpb24uDQo+IA0KPiANCj4gPiArICAgICByZXQgPSBwbV9ydW50aW1lX2dldF9z
eW5jKGRldik7DQo+ID4gKyAgICAgV0FSTl9PTihyZXQgPCAwKTsNCj4gPiArDQo+ID4gKyAgICAg
dnB1X2NvcmVfc2h1dGRvd24oY29yZSk7DQo+ID4gKyAgICAgcG1fcnVudGltZV9wdXRfc3luYyhk
ZXYpOw0KPiA+ICsgICAgIHBtX3J1bnRpbWVfZGlzYWJsZShkZXYpOw0KPiA+ICsNCj4gPiArICAg
ICB2cHVfY29yZV91bnJlZ2lzdGVyKGNvcmUtPnBhcmVudCwgY29yZSk7DQo+ID4gKyAgICAgaW91
bm1hcChjb3JlLT5mdy52aXJ0KTsNCj4gPiArICAgICBpb3VubWFwKGNvcmUtPnJwYy52aXJ0KTsN
Cj4gPiArICAgICBtdXRleF9kZXN0cm95KCZjb3JlLT5sb2NrKTsNCj4gPiArICAgICBtdXRleF9k
ZXN0cm95KCZjb3JlLT5jbWRfbG9jayk7DQo+ID4gKw0KPiA+ICsgICAgIHJldHVybiAwOw0KPiA+
ICt9DQo+ID4gKw0KDQo=
