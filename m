Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 121DB3BB806
	for <lists+linux-media@lfdr.de>; Mon,  5 Jul 2021 09:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbhGEHok (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Jul 2021 03:44:40 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:63072 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230014AbhGEHoj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Jul 2021 03:44:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1625470921; x=1628062921;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=oN+CmVlIu09UCTNk0mqedlRbCDwPGEkJq9dVFVaU894=;
        b=rwCrZmA9xBEwFtBK3DyjCjnaHtzoroEt5PJ2dIwfCgH80xExiclxJDsxQuErArb0
        9IhRHh+pf/hwdHsd5hKFNRlQgwb/fiUbnW3Bdqjb1kyCSMLMIOusi4OBccbIshs9
        JxwPFmHofuHOOdzkLRfSOWIoRcz9R3kbLDEEliLuWGA=;
X-AuditID: c39127d2-a9fbd70000001c5e-35-60e2b7c9ac0e
Received: from berlix.phytec.de (Berlix.phytec.de [172.16.0.117])
        (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 3C.9C.07262.9C7B2E06; Mon,  5 Jul 2021 09:42:01 +0200 (CEST)
Received: from Berlix.phytec.de (172.16.0.117) by Berlix.phytec.de
 (172.16.0.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 5 Jul 2021
 09:42:01 +0200
Received: from Berlix.phytec.de ([fe80::343f:7618:c7ce:97c9]) by
 berlix.phytec.de ([fe80::343f:7618:c7ce:97c9%3]) with mapi id 15.01.2176.009;
 Mon, 5 Jul 2021 09:42:01 +0200
From:   =?utf-8?B?U3RlZmFuIFJpZWRtw7xsbGVy?= <S.Riedmueller@phytec.de>
To:     "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
CC:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "enrico.scholz@sigma-chemnitz.de" <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH v3 1/6] media: mt9p031: Read back the real clock rate
Thread-Topic: [PATCH v3 1/6] media: mt9p031: Read back the real clock rate
Thread-Index: AQHXbyjvr3JmbrJuK0Kpw6M9Mr9fS6sz2rqAgAAH6IA=
Date:   Mon, 5 Jul 2021 07:42:01 +0000
Message-ID: <a1380e68485ace5125031c1123896355936372d1.camel@phytec.de>
References: <20210702095922.118614-1-s.riedmueller@phytec.de>
         <20210702095922.118614-2-s.riedmueller@phytec.de>
         <20210705071343.GR3@paasikivi.fi.intel.com>
In-Reply-To: <20210705071343.GR3@paasikivi.fi.intel.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.0.116]
Content-Type: text/plain; charset="utf-8"
Content-ID: <833BD82E0235884898280C8D021A28D5@phytec.de>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRmVeSWpSXmKPExsWyRoChVPfk9kcJBl/faVnMP3KO1WLvsQss
        Fp0Tl7BbXN41h82iZ8NWVotlm/4wWbTuPcJu8WnLNyYHDo/ZHTNZPTat6mTzmHcy0GPFyv9M
        Hp83yQWwRnHZpKTmZJalFunbJXBlNMzpZiz4JFcxodm6gbFHrouRk0NCwETi1pbjbF2MXBxC
        AsuZJGZs3MsI4TxglPh5o50FwtnIKHFp01NWkBY2AReJz23f2EBsEQFHiVnPv7CCFDELrGSW
        +Ph7BhNIQljAU+LquvNA3RxARV4SfSukIOqtJBZunswIEmYRUJF4vVQYJMwr4CZx6uQvZohd
        Cxklft27yQyS4BSwkPg4qYEFxGYUkJXobHgHNp5ZQFxi07PvrBAvCEgs2XOeGcIWlXj5+B9U
        XEGiraeTCWQXs4CmxPpd+hCmhUTPzRqIKYoSU7ofskOcIChxcuYTlgmM4rOQLJiF0DwLoXkW
        kuZZSJoXMLKuYhTKzUzOTi3KzNYryKgsSU3WS0ndxAiM3MMT1S/tYOyb43GIkYmD8RCjBAez
        kgivyJRHCUK8KYmVValF+fFFpTmpxYcYpTlYlMR5N/CWhAkJpCeWpGanphakFsFkmTg4pRoY
        OR6wBKys7zmS0Pjy5tFHVToTanRrPtwNlZZ5GXHiCEuL5bTFrc1ev5Z2uDGsb4/a9z5XwOiu
        9MFUy/LpD5YLR9QLflcovz1t/fJsae6kyZESOhwn5xz9mjilyfIW6xpvTn2J+a9Z4gRUZ/5f
        7Oo8M1Sx6+c05jKRc37+Kls1Vbpn7ri9Ku+xEktxRqKhFnNRcSIAjhG0tMoCAAA=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU2FrYXJpLA0KDQpPbiBNb24sIDIwMjEtMDctMDUgYXQgMTA6MTMgKzAzMDAsIFNha2FyaSBB
aWx1cyB3cm90ZToNCj4gSGkgRW5yaWNvLA0KPiANCj4gT24gRnJpLCBKdWwgMDIsIDIwMjEgYXQg
MTE6NTk6MTdBTSArMDIwMCwgU3RlZmFuIFJpZWRtdWVsbGVyIHdyb3RlOg0KPiA+IEZyb206IEVu
cmljbyBTY2hvbHogPGVucmljby5zY2hvbHpAc2lnbWEtY2hlbW5pdHouZGU+DQo+ID4gDQo+ID4g
VGhlIHJlYWwgYW5kIHJlcXVlc3RlZCBjbG9jayBjYW4gZGlmZmVyIGFuZCBiZWNhdXNlIGl0IGlz
IHVzZWQgdG8NCj4gPiBjYWxjdWxhdGUgUExMIHZhbHVlcywgdGhlIHJlYWwgY2xvY2sgcmF0ZSBz
aG91bGQgYmUgcmVhZC4NCj4gDQo+IERvIHlvdSBoYXZlIGEgc3lzdGVtIHdoZXJlIHRoaXMgaGFw
cGVucz8gVGhhdCBzdWdnZXN0cyB0aGVyZSdzIGEgd3JvbmcNCj4gdmFsdWUgaW4gRFQuDQoNClRo
ZSB1c2UgY2FzZSBoZXJlIGlzIHdoZW4gdGhlIGNsb2NrIGlzIHN1cHBsaWVkIGJ5IG9uZSBvZiB0
aGUgY2xvY2sgb3V0cHV0cyBvZg0KYSBTT0Mgd2hpY2ggbWlnaHQgbm90IGhpdCB0aGUgcmVxdWVz
dGVkIGZyZXF1ZW5jeSBleGFjdGx5IGR1ZSB0byBpbnRlcm5hbCBQTEwNCmNvbmZpZ3VyYXRpb24u
IFNvIHRvIGdldCBhIGJldHRlciBwaXhlbCBjbG9jayB0aGUgYWN0dWFsIGNsb2NrIHJhdGUgaXMg
cmVhZCB0bw0KY2FsY3VsYXRlIHRoZSBQTEwgcGFyYW1ldGVycyBvbiB0aGUgc2Vuc29yLiBBdCBs
ZWFzdCB0aGF0J3MgdGhlIGlkZWEuDQoNClJlZ2FyZHMsDQpTdGVmYW4NCg0KPiANCj4gVGhlIHBy
ZWZlcmVuY2Ugbm93YWRheXMgaXMgdG8gcmVseSBvbiBhc3NpZ25lZC1jbG9jay1yYXRlcywgZXZl
biB0aG91Z2gNCj4gaXQncyBpbmhlcmVudGx5IHNvbWV3aGF0IHVucmVsaWFibGUsIGp1c3QgYXMg
Y2xrX3NldF9yYXRlKCkuIFRoaXMgaXMgYW4NCj4gZXhpc3RpbmcgZHJpdmVyIHRob3VnaC4gVGhl
IG9sZCBvbmVzIGNvdWxkIGJlIGtlcHQgZm9yIGNvbXBhdGliaWxpdHkgd2l0aA0KPiBvbGRlciBE
VCBiaW5hcmllcy4NCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogRW5yaWNvIFNjaG9seiA8ZW5yaWNv
LnNjaG9sekBzaWdtYS1jaGVtbml0ei5kZT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gUmll
ZG11ZWxsZXIgPHMucmllZG11ZWxsZXJAcGh5dGVjLmRlPg0KPiA+IFJldmlld2VkLWJ5OiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+ID4gLS0t
DQo+ID4gIGRyaXZlcnMvbWVkaWEvaTJjL210OXAwMzEuYyB8IDkgKysrKysrLS0tDQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvaTJjL210OXAwMzEuYyBiL2RyaXZlcnMvbWVkaWEv
aTJjL210OXAwMzEuYw0KPiA+IGluZGV4IDc3NTY3MzQxZWM5OC4uM2VhYWE4ZDQ0NTIzIDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvaTJjL210OXAwMzEuYw0KPiA+ICsrKyBiL2RyaXZl
cnMvbWVkaWEvaTJjL210OXAwMzEuYw0KPiA+IEBAIC0yNTUsNiArMjU1LDcgQEAgc3RhdGljIGlu
dCBtdDlwMDMxX2Nsa19zZXR1cChzdHJ1Y3QgbXQ5cDAzMSAqbXQ5cDAzMSkNCj4gPiAgDQo+ID4g
IAlzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50ID0gdjRsMl9nZXRfc3ViZGV2ZGF0YSgmbXQ5cDAz
MS0+c3ViZGV2KTsNCj4gPiAgCXN0cnVjdCBtdDlwMDMxX3BsYXRmb3JtX2RhdGEgKnBkYXRhID0g
bXQ5cDAzMS0+cGRhdGE7DQo+ID4gKwl1bnNpZ25lZCBsb25nIGV4dF9mcmVxOw0KPiA+ICAJaW50
IHJldDsNCj4gPiAgDQo+ID4gIAltdDlwMDMxLT5jbGsgPSBkZXZtX2Nsa19nZXQoJmNsaWVudC0+
ZGV2LCBOVUxMKTsNCj4gPiBAQCAtMjY1LDEzICsyNjYsMTUgQEAgc3RhdGljIGludCBtdDlwMDMx
X2Nsa19zZXR1cChzdHJ1Y3QgbXQ5cDAzMQ0KPiA+ICptdDlwMDMxKQ0KPiA+ICAJaWYgKHJldCA8
IDApDQo+ID4gIAkJcmV0dXJuIHJldDsNCj4gPiAgDQo+ID4gKwlleHRfZnJlcSA9IGNsa19nZXRf
cmF0ZShtdDlwMDMxLT5jbGspOw0KPiA+ICsNCj4gPiAgCS8qIElmIHRoZSBleHRlcm5hbCBjbG9j
ayBmcmVxdWVuY3kgaXMgb3V0IG9mIGJvdW5kcyBmb3IgdGhlIFBMTCB1c2UNCj4gPiB0aGUNCj4g
PiAgCSAqIHBpeGVsIGNsb2NrIGRpdmlkZXIgb25seSBhbmQgZGlzYWJsZSB0aGUgUExMLg0KPiA+
ICAJICovDQo+ID4gLQlpZiAocGRhdGEtPmV4dF9mcmVxID4gbGltaXRzLmV4dF9jbG9ja19tYXgp
IHsNCj4gPiArCWlmIChleHRfZnJlcSA+IGxpbWl0cy5leHRfY2xvY2tfbWF4KSB7DQo+ID4gIAkJ
dW5zaWduZWQgaW50IGRpdjsNCj4gPiAgDQo+ID4gLQkJZGl2ID0gRElWX1JPVU5EX1VQKHBkYXRh
LT5leHRfZnJlcSwgcGRhdGEtPnRhcmdldF9mcmVxKTsNCj4gPiArCQlkaXYgPSBESVZfUk9VTkRf
VVAoZXh0X2ZyZXEsIHBkYXRhLT50YXJnZXRfZnJlcSk7DQo+ID4gIAkJZGl2ID0gcm91bmR1cF9w
b3dfb2ZfdHdvKGRpdikgLyAyOw0KPiA+ICANCj4gPiAgCQltdDlwMDMxLT5jbGtfZGl2ID0gbWlu
X3QodW5zaWduZWQgaW50LCBkaXYsIDY0KTsNCj4gPiBAQCAtMjgwLDcgKzI4Myw3IEBAIHN0YXRp
YyBpbnQgbXQ5cDAzMV9jbGtfc2V0dXAoc3RydWN0IG10OXAwMzEgKm10OXAwMzEpDQo+ID4gIAkJ
cmV0dXJuIDA7DQo+ID4gIAl9DQo+ID4gIA0KPiA+IC0JbXQ5cDAzMS0+cGxsLmV4dF9jbG9jayA9
IHBkYXRhLT5leHRfZnJlcTsNCj4gPiArCW10OXAwMzEtPnBsbC5leHRfY2xvY2sgPSBleHRfZnJl
cTsNCj4gPiAgCW10OXAwMzEtPnBsbC5waXhfY2xvY2sgPSBwZGF0YS0+dGFyZ2V0X2ZyZXE7DQo+
ID4gIAltdDlwMDMxLT51c2VfcGxsID0gdHJ1ZTsNCj4gPiAgDQo=
