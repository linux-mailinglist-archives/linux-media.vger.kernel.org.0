Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAD4EFDDF6
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2019 13:35:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727349AbfKOMe6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Nov 2019 07:34:58 -0500
Received: from mail-eopbgr30077.outbound.protection.outlook.com ([40.107.3.77]:32401
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727272AbfKOMe6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Nov 2019 07:34:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kgHDV4dniX3PRtyIeLCnUEe5K7jktosDE976qxILeAMSTuekGDLRZaFxTLuGF6jKd8O20Q01V/FNp0NxcuPrkuKMFfBh24ijvWKvZkJNkZf6qidQA1zMfQ9fdoKVyWRiT/6fC61RGm1S2EutH72nPYQA87QYtk3D2vOzxhf75HsOcG/rfuDs5wbi9a/t0coKce0vyu53NTp1Jqi6koRoNirCfkhkJ0ofB+XljuVcGenBQRL6G8/7dU0Okg1gKmRQwEOZ9aK7FULsxgR51/ObFpAZ2ZUQlEIWkV/LRh/+exzooLrzwAixxV6Va/D/NJr3dNhOLr+kUXlzgfpTB9yLJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCsSqeTpHKGP67eGQZbd04WlSyZe7K7KWXcwiNaSVrY=;
 b=GvlCdvOnOzqKNgaFwnwfHC+3DVN0gjKwt5za5uEk/WfAMKqgskvh7rZ6zd+XlUWHRae4EkDXPNOx4c4i8NvqJ1FtFecPAA2OjNPqREly6VBr6/Ox3REWFvDsLOx+OpbLgUgfUZ4p4uhIGnFWP1RFAUS9cGnn0G9lre/lf7KVPIhR0Jr2hzkrz+QPVnRpGh++6d7823WvZ9NUCyKUx/D5mUztBKKqv5hcrIiMKnyAmHiA2C6f7BnS81uXKFMPwialfW0NWVdSJ1CBsMyZCIbrWzhx4D49cj/UmsWHGcjEI+ZWByDQ5/mBIHw0X7xET3dgCL0wsK2M/WE25WqwxvZK0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCsSqeTpHKGP67eGQZbd04WlSyZe7K7KWXcwiNaSVrY=;
 b=fKK3Wr37Sel1btqTpW//rTpWTsEdzs/9OKbBxMK3QTc9BpOGPAJE5Yp35N9162XCB3IqbW/rYChtdB1PS55J4sUUxofim21trG90ZY9ID94UBLXqOZnBwVlqY2HnHr4MsBT6feSOKRtGWyKHZBTbkUlP68sulE4Y1xFoLRjAgVc=
Received: from VI1PR0402MB3918.eurprd04.prod.outlook.com (52.134.16.148) by
 VI1PR0402MB2830.eurprd04.prod.outlook.com (10.175.21.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Fri, 15 Nov 2019 12:34:13 +0000
Received: from VI1PR0402MB3918.eurprd04.prod.outlook.com
 ([fe80::1d41:f7cc:ffa2:270c]) by VI1PR0402MB3918.eurprd04.prod.outlook.com
 ([fe80::1d41:f7cc:ffa2:270c%6]) with mapi id 15.20.2451.027; Fri, 15 Nov 2019
 12:34:13 +0000
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
To:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>
CC:     dl-linux-imx <linux-imx@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Subject: Re: [EXT] Re: [PATCH 0/5] Add V4L2 driver for i.MX8 JPEG
 Encoder/Decoder
Thread-Topic: [EXT] Re: [PATCH 0/5] Add V4L2 driver for i.MX8 JPEG
 Encoder/Decoder
Thread-Index: AQHVlLXLzR/BR8Qmu0iHDS94ZPyJ2qd+RrWAgAATH4CAAAH2AIAC7eQAgAAIUICACuaOAA==
Date:   Fri, 15 Nov 2019 12:34:13 +0000
Message-ID: <1573821252.16477.56.camel@nxp.com>
References: <1573053633-21437-1-git-send-email-mirela.rabulea@nxp.com>
         <87d80882-b032-f332-0808-d669600f844f@xs4all.nl>
         <1573058741.16477.18.camel@nxp.com>
         <2ad1718b-2556-ea7c-27e0-9e60445a5b71@xs4all.nl>
         <1573220200.16477.32.camel@nxp.com>
         <ffbc7501-bb56-b5f2-cd43-209f099be594@xs4all.nl>
In-Reply-To: <ffbc7501-bb56-b5f2-cd43-209f099be594@xs4all.nl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.18.5.2-0ubuntu3.2 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=mirela.rabulea@nxp.com; 
x-originating-ip: [92.121.36.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d047e3ac-e15f-4c91-7d33-08d769c81f67
x-ms-traffictypediagnostic: VI1PR0402MB2830:|VI1PR0402MB2830:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB2830D0FE990C2E5745BD1E228F700@VI1PR0402MB2830.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02229A4115
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(346002)(39860400002)(366004)(136003)(376002)(54094003)(189003)(199004)(2501003)(66476007)(64756008)(229853002)(44832011)(25786009)(478600001)(8676002)(7416002)(14454004)(966005)(99286004)(186003)(7736002)(11346002)(446003)(305945005)(4326008)(86362001)(91956017)(76116006)(6436002)(81166006)(2906002)(81156014)(316002)(486006)(476003)(54906003)(110136005)(26005)(6486002)(102836004)(36756003)(2616005)(6246003)(50226002)(76176011)(8936002)(6306002)(6512007)(71200400001)(71190400001)(5660300002)(256004)(6116002)(3846002)(103116003)(66446008)(66556008)(66946007)(6506007)(66066001)(99106002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR0402MB2830;H:VI1PR0402MB3918.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wpe2Rwgqcdx97TffiheBL+tpere7t4wS9zNn+Ahp7rTOHGLmNh4IAgcHhygJCCEIanSq09r0Rz6m81ACXseiKSjkhkhivXjoHYwuM6Tba4CLNx//I/lCJp6/44d0/PFm7SfyPwZ36VycTa0NA+K+Bb2Ul2JGJIIEptnqVkC6dfUKd8PTgVrWbAxgzvZZtozmwSqgDQYZbuEbCAKrYbg4dts0VThYCUtSC1PlPjZHzERdFmT80dDMw/UKozrgkkljT50y4tGj0SH8IGUehKvTPndkEjmBKi+scbKH2xNIP3qVFR18f9lr6PYj4ir4hikCfTZnZq/UJegjJSR37KLNHNQDLcMlMN5iu4kzS2l5dNdrChNjyN6OQbwxII4WDEEb3l3VbZ8RgB3y9MOyE/MY2VqbnXOKB9WnFQ9SIPaspzts+TUI2GzP8SD5si8ie4WK
Content-Type: text/plain; charset="utf-8"
Content-ID: <22084845BD3D9C439E03B5667CCDF4CE@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d047e3ac-e15f-4c91-7d33-08d769c81f67
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2019 12:34:13.5247
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OJIHgTkm4DN9Yj7dJVC8lTs1w2S8pIhN7aW4XQ3A/rFPZ3mSRtGVu0gFbg1DNPV/UmIOq6ALGcLxNZwXJFIfPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2830
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgSGFucywNCg0KT24gVmksIDIwMTktMTEtMDggYXQgMTU6MDYgKzAxMDAsIEhhbnMgVmVya3Vp
bCB3cm90ZToNCj4gPiBJcyB0aGVyZSBhICJnb29kIGV4YW1wbGUiIG9mIGEgdjRsIG0ybSBkcml2
ZXIgdGhhdCBwYXNzZXMgdGhlc2UNCj4gdmltMm0uIEFsc28gZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9tdGstanBlZy8gKGFsdGhvdWdoIEknbSBub3Qgc3VyZQ0KPiB3aGVuDQo+IGl0IHdhcyBsYXN0
IHRlc3RlZCB3aXRoIHY0bDItY29tcGxpYW5jZSwgc28gaXQgbWlnaHQgYmUgYSBiaXQgb3V0IG9m
DQo+IGRhdGUpLg0KPiANCj4gPiANCj4gPiBzdHJlYW1pbmcgdGVzdHM/IFRoYXQgd291bGQgc2F2
ZSBzb21lIHRpbWUgb24gbXkgc2lkZS4NCg0KVGhhbmtzIGEgbG90IGZvciB0aGUgZXhhbXBsZXMu
DQpJJ20gc2VuZGluZyBfdjIgb2YgdGhlIHBhdGNoLCB3aXRoIGZpeGVzIGZvciBzdHJlYW1pbmcg
dGVzdHMuDQpPbmUgbWVudGlvbiBoZXJlLCBJIGRyb3BwZWQgdGhlIHN1cHBvcnQgZm9yIFVTRVJQ
VFIgYnVmZmVycywgYmFzZWQgb24NCnRoaXM6DQpodHRwczovL2x3bi5uZXQvQXJ0aWNsZXMvNDQ3
NDM1Lw0KIlZCMl9VU0VSUFRSOiBidWZmZXJzIGFsbG9jYXRlZCBpbiB1c2VyIHNwYWNlLiBOb3Jt
YWxseSwgb25seSBkZXZpY2VzDQp3aGljaCBjYW4gZG8gc2NhdHRlci9nYXRoZXIgSS9PIGNhbiBk
ZWFsIHdpdGggdXNlci1zcGFjZSBidWZmZXJzLg0KSW50ZXJlc3RpbmdseSwgdmlkZW9idWYyIHN1
cHBvcnRzIGNvbnRpZ3VvdXMgYnVmZmVycyBhbGxvY2F0ZWQgYnkgdXNlcg0Kc3BhY2U7IHRoZSBv
bmx5IHdheSB0byBnZXQgdGhvc2UsIHRob3VnaCwgaXMgdG8gdXNlIHNvbWUgc29ydCBvZg0Kc3Bl
Y2lhbCBtZWNoYW5pc20gbGlrZSB0aGUgb3V0LW9mLXRyZWUgQW5kcm9pZCAicG1lbSIgZHJpdmVy
Lg0KQ29udGlndW91cyBJL08gdG8gaHVnZSBwYWdlcyBpcyBub3Qgc3VwcG9ydGVkLiINCg0KSSB3
b25kZXIgaWYgVkIyX1VTRVJQVFIgbWFrZSBzZW5zZSB0b2dldGhlcg0Kd2l0aMKgJnZiMl9kbWFf
Y29udGlnX21lbW9wcz8gSSBzZWUgYXQgbGVhc3QgMSBkcml2ZXIgd2l0aCB0aGlzDQpjb21iaW5h
dGlvbiAoczVwLWpwZWcpLCBJIHdvdWxkIGJlIHN1cnByaXNlZCBpZiB0aGF0IHBhc3NlcyB0aGUN
CnN0cmVhbWluZyB0ZXN0cy4NCg0KUmVnYXJkcywNCk1pcmVsYQ==
