Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32628258CFC
	for <lists+linux-media@lfdr.de>; Tue,  1 Sep 2020 12:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbgIAKqT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Sep 2020 06:46:19 -0400
Received: from mail-eopbgr1410128.outbound.protection.outlook.com ([40.107.141.128]:61455
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725848AbgIAKqR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Sep 2020 06:46:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X14qSZhFC3xcLrxrTsJ40DXsObkKOFoMSTkkePxFTNO81VkuNzi3sFSfLrB/XMUAqEWMdFTbsDMn8rXJ4cdLxGa5UJDU/i7pi0lE5lk/4YmXfTGlHiceuKJUclSjhaM69bQuk0lAQFUuaZZqyoZeqmUfwD5uZdyNdeR8o7WkVO9ZE2KkNosnz4ZBpeY5r2ErIcgoqtCvu9/c5tonB3O8ZS2mwyI4Spy64P9zSUxiABV8ZiLqg6Lk73nRsBJSFX0q5WqSQkZeJccBZmF45syYavuPoJdkt5DkdisZHu82n9XSXu3/vZrjq9NyI15Q24IhC9WY1qeNVVrVuf0XcstlzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XnEwbxqUaw5nwEXXXOkDLqx1Jo+sJ4GSEX7VIS21a5U=;
 b=XIKVjnGnAUKQVwWFfLY73DJ3pm5FFvc9hz+JbDDnJzuR/FLTRXpN+SdyIz/FoAQnfm2ORkKGJISgucpDStNgQHMS8i30tgq0IFtjjygCeHfMqDXqt3SA7CjmruaYsEcC9oBhPA/0DKN2i/Id3e9uVwRD+ktmWazdBl2okCinehss2g2ssCCl4YUQTvT3OLxT2PtEVTLnjxA1QY2L8i6ykf9fccHtgdo0tbmTxr8R6Am9vRkSVMFKNSQ6lN3NOo3bI/XFC4RSenkYFiybr6xboNjYD3GwBkybTILIc38UwJAu61Nd+WfxUZXOzn2I8cYa5o2jrRCsEI2yrrv0OtsBDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XnEwbxqUaw5nwEXXXOkDLqx1Jo+sJ4GSEX7VIS21a5U=;
 b=nqY1rYhpB9X9hJF4PktNgIltYa3fG8TLgpf3OdxMZIH3wdxZe/tz7ynoqlWdlqNsYfDj8NCnOwBcilobXzHIJHa4akBjclSeeCmBL9P+DOdWy0HfLSxBKCx9kaOaRWUsePVm8oAefA+Ntr4A6D6PQyC/TSbR7lb3DlWiyHPTEm4=
Received: from OSAPR01MB2385.jpnprd01.prod.outlook.com (2603:1096:603:37::20)
 by OSAPR01MB5106.jpnprd01.prod.outlook.com (2603:1096:604:6d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Tue, 1 Sep
 2020 10:46:10 +0000
Received: from OSAPR01MB2385.jpnprd01.prod.outlook.com
 ([fe80::60d8:7724:48c2:acfb]) by OSAPR01MB2385.jpnprd01.prod.outlook.com
 ([fe80::60d8:7724:48c2:acfb%6]) with mapi id 15.20.3326.025; Tue, 1 Sep 2020
 10:46:10 +0000
From:   Chris Paterson <Chris.Paterson2@renesas.com>
To:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        =?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: RE: [PATCH 0/5] media: Fix asd dynamic allocation
Thread-Topic: [PATCH 0/5] media: Fix asd dynamic allocation
Thread-Index: AQHWcCJl/U4lq3/ayUuvTiGTFTVH9alSvhcAgAD7L7A=
Date:   Tue, 1 Sep 2020 10:46:09 +0000
Message-ID: <OSAPR01MB2385DABC0957AE1A7B8F6622B72E0@OSAPR01MB2385.jpnprd01.prod.outlook.com>
References: <20200811205939.19550-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAJWpUEe4VwOL_TQ1WwjG1WT17_GPFpNO+-h92dRfj0jW8pb5wg@mail.gmail.com>
In-Reply-To: <CAJWpUEe4VwOL_TQ1WwjG1WT17_GPFpNO+-h92dRfj0jW8pb5wg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: renesas.com; dkim=none (message not signed)
 header.d=none;renesas.com; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [86.185.97.58]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8aed9387-c1e2-49f2-ab15-08d84e643d17
x-ms-traffictypediagnostic: OSAPR01MB5106:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB51061E2F565B3BF2A42D3A55B72E0@OSAPR01MB5106.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: smMiSDkbQqCZNkpOiWdB194Frgm1lg8TH+d0e49Kp6LJQWvh3bjlFgMTXRfcqbm7KYUR8rF1WYvAwoNrW60hZZWEhLgxZheWbuSNNK7SYJYtsyhcIe5xiWG/YdMYzhJgknDcx5tzmeGxwJmfkOCDf2SOvTVOK9nX4I+/k5pOocdsydI3iow4wIQhgDRxKV92zYuuSf3nqV6ylu808PvfimwE4o9JFqXA2owz75WaMMejV4LimqYx8qZVsKJB3zOosCaXLRxAFx1t+gNwp0gG9qEkzZl2iJ3feLCQcEx4qCrVoM0Qjmn50PAq0za8TrLwqK4KGxQK8lUcevdkFwvJ9w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2385.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(4326008)(52536014)(110136005)(2906002)(316002)(55016002)(71200400001)(478600001)(33656002)(83380400001)(9686003)(86362001)(54906003)(186003)(26005)(6506007)(76116006)(5660300002)(7696005)(64756008)(66556008)(66446008)(8676002)(66476007)(66946007)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: /BJfn0694BEtLhzlnjSAnqYIGA7qLwAqD0R9h/TFT3uiTEB9uHiHw2BAVLFoA/aAUWuBWeNcw2bPjO1Db4iKBBuMaC5IYsyLQdfE9N4cXgOohd4SyyJatsx86SE9lr+zZrEuQBsO6AViCVe4y12mU1ZQme9dV4TVN2lctZA0di6Wc1N/obF7gBHObM/esIxd+oVmP9SIg5CVhbajM0DksjQA4w0uWfpMCj+/Fe0L73wmhKM454dFcDBRxQyCQC7DlBA5mYKddP8kC2s9VyNm5dDLfYEx1JB23zNQIsPzm90siDvn/Jc4eFKoJ3fc3B10vgpkEIF+/j780KYhtEi/iKecAeXUiQErmJFtBia79CSvVJds8XvZpnHQcbweWckTaSxEdHpnuIQrdfcFI5YaGp8Eow96rtzWcxL5NMzl2ZFxJAZbppwBN05GEzMt7QnVwATUj6UC9SgDDzxqY7MZV9sZhOMZEpY2ViOJ1/JddaAT93/jonyMiMy5K91qnLHuLT4HKNnUQ2w5+zr1C6eHgFIBZ4G2Hw4Y65SFFup6Ugx9Cgqut+rl2x5c6MuxkWVPLatT76Fw79/m4eObpoaz5DTkRQQpb8maBe32SjchqKOmJYWOzYDgFkZUTWM+Xx+tbu83LRlTcRMHXhlcsClMmw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2385.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aed9387-c1e2-49f2-ab15-08d84e643d17
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2020 10:46:10.0013
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uDKXhrxRgtmbwJFvrZWjY2ENW9rT6BrN3EIIRbjZVs37ukN10dGF4X9YNDmy6NtPUCvyrIiHUcjbNoWQBpptRGILJX3RN5K8LzKQD9X4P6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB5106
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGVsbG8sDQoNCj4gRnJvbTogUmFtZXNoIFNoYW5tdWdhc3VuZGFyYW0gPHJhc2hhbm11QGdtYWls
LmNvbT4NCj4gU2VudDogMzEgQXVndXN0IDIwMjAgMjA6NDUNCj4gDQo+IEhpIExhdXJlbnQsDQo+
IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBmaXguIFNvcnJ5IGFib3V0IHRoZSBsYXRlIHJlcGx5Lg0K
PiANCj4gPiBUaGlzIHNtYWxsIHBhdGNoIHNlcmllcyBhZGRyZXNzZXMgYSBidWcgcmVsYXRlZCB0
byB0aGUgdXNhZ2Ugb2YNCj4gPiB2NGwyX2FzeW5jX25vdGlmaWVyX2FkZF9zdWJkZXYoKSB0aGF0
IGlzIHdpZGVzcHJlYWQgYW1vbmcgZHJpdmVycy4NCj4gPg0KPiA+IFRoZSBpc3N1ZSBpcyBleHBs
YWluZWQgaW4gMS80LCB3aGljaCBpbXByb3ZlcyB0aGUgZG9jdW1lbnRhdGlvbiBvZiB0aGUNCj4g
PiB2NGwyX2FzeW5jX25vdGlmaWVyX2FkZF9zdWJkZXYoKSBmdW5jdGlvbiBieSBzdGF0aW5nIGV4
cGxpY2l0bHkgdGhhdCB0aGUNCj4gPiBhc2QgYXJndW1lbnQgbmVlZHMgdG8gYmUgYWxsb2NhdGVk
IGR5bmFtaWNhbGx5LiBBbW9uZyB0aGUgMTMgZHJpdmVycw0KPiA+IHRoYXQgdXNlIHRoYXQgZnVu
Y3Rpb24sIG9ubHkgb25lIGdldHMgaXQgcmlnaHQuDQo+ID4NCj4gPiBUaGUgcmVzdCBvZiB0aGUg
cGF0Y2hlcyBmaXggdGhlIHByb2JsZW0gaW4gc2V2ZXJhbCBSZW5lc2FzLXJlbGF0ZWQNCj4gPiBk
cml2ZXJzLCB3aXRoIGFuIHVucmVsYXRlZCBmd25vZGUgcmVmZXJlbmNlIGxlYWsgZml4IGZvciB0
aGUgcmNhci1kcmlmDQo+ID4gZHJpdmVyIGluIDIvNSB0aGF0IG1hZGUgdGhlIHY0bDJfYXN5bmNf
bm90aWZpZXJfYWRkX3N1YmRldigpIGZpeCBlYXNpZXINCj4gPiB0byBpbXBsZW1lbnQgaW4gdGhh
dCBkcml2ZXIuDQo+ID4NCj4gPiBJJ20gbGFja2luZyBoYXJkd2FyZSB0byB0ZXN0IDIvNSBhbmQg
My81LiBSYW1lc2gsIHdvdWxkIHlvdSBiZSBhYmxlIHRvDQo+ID4gdGVzdCB0aGF0ID8gV2hhdCBk
ZXZlbG9wbWVudCBib2FyZCBkbyB5b3UgdXNlIHRvIHRlc3QgdGhlIERSSUYgZHJpdmVyID8NCj4g
PiBJIGRvbid0IHNlZSBhbnkgRFQgaW50ZWdyYXRpb24gdXBzdHJlYW0uDQo+IA0KPiBJJ20gYWZy
YWlkIEkgbWF5IG5vdCBiZSBhYmxlIHRvIHRlc3QgaXQgYXMgSSBkbyBub3QgaGF2ZSB0aGUgaGFy
ZHdhcmUuDQo+IEkgaGF2ZSBjb3BpZWQgQ2hyaXMgUCBpZiBoZSBjYW4gaGVscCBvdXQuDQoNClRo
YW5rcyBSYW1lc2guDQoNCkZhYnJpemlvIHdpbGwgdGFrZSBhIGxvb2sgYXMgaGUncyB3b3JraW5n
IG9uIERSSUYgY3VycmVudGx5Lg0KV2UnbGwgYWxzbyBnZXQgaGltIGFkZGVkIHRvIHRoZSBtYWlu
dGFpbmVycyBmaWxlLg0KDQpLaW5kIHJlZ2FyZHMsIENocmlzDQoNCj4gDQo+IEkgaGF2ZSB0ZXN0
ZWQgRFJJRiBkcml2ZXIgb24gYSBIMy9NMyBTYWx2YXRvci1YL1Mgd2l0aCBhIGFkZC1vbiBib2Fy
ZA0KPiBmcm9tIE1heGltIGhhdmluZyB0d28gTUFYMjE3NSB0dW5lcnMgKE1BWDIxNzUgZXZhbHVh
dGlvbiBraXQpLiBUaGlzDQo+IGFkZC1vbiBib2FyZCB3YXMgYSBwcm90b3R5cGUgYXQgdGhhdCB0
aW1lLiBIZW5jZSwgdGhlIERUIHVwZGF0ZXMgd2VyZQ0KPiBtYWludGFpbmVkIGludGVybmFsbHku
DQo+IA0KPiBUaGFua3MsDQo+IFJhbWVzaA0KPiANCj4gPiBJIGFsc28gaGF2ZW4ndCBkdWcgdXAg
bXkgTUFYOTI4NiBkZXZlbG9wbWVudCBraXQgdG8gdGVzdCA1LzUuIEkgd291bGQNCj4gPiB0aHVz
IGFwcHJlY2lhdGUgaWYgc29tZW9uZSBjb3VsZCB0ZXN0IGl0LCBidXQgd29yc3QgY2FzZSBJIGNh
biBkbyBzbw0KPiA+IG15c2VsZi4NCj4gPg0KPiA+IExhdXJlbnQgUGluY2hhcnQgKDUpOg0KPiA+
ICAgbWVkaWE6IHY0bDItYXN5bmM6IERvY3VtZW50IGFzZCBhbGxvY2F0aW9uIHJlcXVpcmVtZW50
cw0KPiA+ICAgbWVkaWE6IHJjYXJfZHJpZjogRml4IGZ3bm9kZSByZWZlcmVuY2UgbGVhayB3aGVu
IHBhcnNpbmcgRFQNCj4gPiAgIG1lZGlhOiByY2FyX2RyaWY6IEFsbG9jYXRlIHY0bDJfYXN5bmNf
c3ViZGV2IGR5bmFtaWNhbGx5DQo+ID4gICBtZWRpYTogcmNhci1jc2kyOiBBbGxvY2F0ZSB2NGwy
X2FzeW5jX3N1YmRldiBkeW5hbWljYWxseQ0KPiA+ICAgbWVkaWE6IGkyYzogbWF4OTI4NjogQWxs
b2NhdGUgdjRsMl9hc3luY19zdWJkZXYgZHluYW1pY2FsbHkNCj4gPg0KPiA+ICBkcml2ZXJzL21l
ZGlhL2kyYy9tYXg5Mjg2LmMgICAgICAgICAgICAgICAgIHwgMzggKysrKysrKysrKystLS0tLS0t
LS0tDQo+ID4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmNhci12aW4vcmNhci1jc2kyLmMgfCAy
NCArKysrKystLS0tLS0tDQo+ID4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmNhcl9kcmlmLmMg
ICAgICAgICAgfCAzMCArKysrKy0tLS0tLS0tLS0tDQo+ID4gIGluY2x1ZGUvbWVkaWEvdjRsMi1h
c3luYy5oICAgICAgICAgICAgICAgICAgfCAgNSArLS0NCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCA0
MiBpbnNlcnRpb25zKCspLCA1NSBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IC0tDQo+ID4gUmVnYXJk
cywNCj4gPg0KPiA+IExhdXJlbnQgUGluY2hhcnQNCj4gPg0K
