Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5CF26F1357
	for <lists+linux-media@lfdr.de>; Fri, 28 Apr 2023 10:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345261AbjD1Iie (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Apr 2023 04:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbjD1Iid (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Apr 2023 04:38:33 -0400
Received: from mail6.msi.com (mail6.msi.com [114.30.40.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 680CF2717
        for <linux-media@vger.kernel.org>; Fri, 28 Apr 2023 01:38:30 -0700 (PDT)
Received: from mail2.msi.com (mail2.msi.com [220.130.147.42])
        by mail6.msi.com (Postfix) with ESMTPS id 2B85E5E06DD;
        Fri, 28 Apr 2023 16:38:29 +0800 (CST)
Received: from mail2.msi.com (localhost [127.0.0.1])
        by postfix.imss91 (Postfix) with ESMTP id AA7E0CC086C;
        Fri, 28 Apr 2023 16:38:28 +0800 (CST)
DKIM-Filter: OpenDKIM Filter v2.11.0 postfix.imss91 AA7E0CC086C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=msi.com; s=20220711;
        t=1682671108; bh=A9urXbuhdgWO/SeXzuoV03o0PvrjrGdrqmXSwUD6Yb8=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=lXp6wHJCQN9CtKew/+d2X8ufgiYqEmh1LdMoZr/q4IgIp7idIUA+mRPDI49rdRYW2
         Fj7f7HPwyNOwwM72VtWB6+LbOlYvyL3LT9EUTTt3ba/RAbvcExuuLzwo1UjK5zuPRJ
         KCsYd62bPREMz/4bODdNwoRRCZpoh6/sIgEayee+ggFqKnn5qwGQtM2Qa6ezAJklJT
         ZEbSrzqqiwDBUvqBjgLquNWP0Ro1n4YWVKmJ4oKnhP+hykBOyXBcnsrOQUn+PRw3Kc
         Rd6fCoe3OT2v45vb5rNGqVH8oOXYnnavnskCRdfaqc1aChFPHdjiEmStgY9Z9pfJXd
         qWV1UrOtfpbKQ==
Received: from EX2016D.msi.com.tw (unknown [172.16.0.57])
        by mail2.msi.com (Postfix) with ESMTPS id 9D3EBCC06D7;
        Fri, 28 Apr 2023 16:38:28 +0800 (CST)
Received: from EX2016A.msi.com.tw (172.16.0.54) by EX2016D.msi.com.tw
 (172.16.0.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 28 Apr
 2023 16:38:27 +0800
Received: from EX2016A.msi.com.tw ([::1]) by EX2016A.msi.com.tw
 ([fe80::cc96:ad54:6ca4:e0f4%5]) with mapi id 15.01.2507.023; Fri, 28 Apr 2023
 16:38:27 +0800
From:   =?utf-8?B?aGFyZHljaGVuZyjphK3mmJPmmJUp?= <hardycheng@msi.com>
To:     'Ricardo Ribalda' <ribalda@chromium.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: UVCIOC_CTRL_MAP not work
Thread-Topic: UVCIOC_CTRL_MAP not work
Thread-Index: AQHZeagKEx6yhHYjHUmDjx3JEMz4jq9AYskPgAABg6A=
Date:   Fri, 28 Apr 2023 08:38:27 +0000
Message-ID: <25bb11b5e14a49718d97156c614c90e1@msi.com>
References: <0477365efa0d45d7bddf9572d4f09c4c@msi.com>
 <CANiDSCsvuA4f8Kjzp27ncy+HXHft+chMeR5REFAjpj-G4Pc-JA@mail.gmail.com>
 <c19a2cb8f0d04f19bcc884f13b185261@msi.com>
 <CANiDSCuG+0w=8hRrcG-UPWhBJLL+As0j+KseShDrB=Dca9JXhw@mail.gmail.com>
In-Reply-To: <CANiDSCuG+0w=8hRrcG-UPWhBJLL+As0j+KseShDrB=Dca9JXhw@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.113.50]
Content-Type: multipart/mixed;
        boundary="_003_25bb11b5e14a49718d97156c614c90e1msicom_"
MIME-Version: 1.0
X-RCPT: <ribalda@chromium.org>, <linux-media@vger.kernel.org>
X-TM-AS-GCONF: 00
X-RCPT: <ribalda@chromium.org>, <internal@maedb.msi.com>, <linux-media@vger.kernel.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--_003_25bb11b5e14a49718d97156c614c90e1msicom_
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljYXJkbywNCg0KU28gSSBtb2RpZnkgdGhlIGB1dmNfeHVfY29udHJvbF9tYXBwaW5nYCBz
dHJ1Y3QgYXMgZm9sbG93czoNCihmdWxsIGNvZGUgcmVmZXJlbmNlIGF0dGFjaG1lbnQgYHV2Y194
dV92NGxfbWFwcGluZ19kZW1vLmNgKQ0Kc3RydWN0IHV2Y194dV9jb250cm9sX21hcHBpbmcgbWFw
cGluZyA9IHsNCiAgICAgICAgLmlkID0gMHgwMSwNCiAgICAgICAgLm5hbWUgPSAiTXkgRXh0ZW5z
aW9uIFVuaXQiLA0KICAgICAgICAuZW50aXR5ID0gezB4MTAsIDB4YmMsIDB4NDYsIDB4YmEsIDB4
MjgsIDB4NWEsIDB4NGQsIDB4N2IsIDB4OTcsIDB4MGUsIDB4ZmQsIDB4OTEsIDB4NDYsIDB4YTUs
IDB4MmYsIDB4MmR9LA0KICAgICAgICAuc2VsZWN0b3IgPSAweDAxLA0KICAgICAgICAuc2l6ZSA9
IDMyLA0KICAgICAgICAub2Zmc2V0ID0gMCwNCiAgICAgICAgLnY0bDJfdHlwZSA9IFY0TDJfQ1RS
TF9UWVBFX0lOVEVHRVIsDQogICAgICAgIC5kYXRhX3R5cGUgPSBVVkNfQ1RSTF9EQVRBX1RZUEVf
VU5TSUdORUQsDQogICAgICAgIC5tZW51X2luZm8gPSBOVUxMLA0KICAgICAgICAubWVudV9jb3Vu
dCA9IDAsDQogICAgICAgIC5yZXNlcnZlZCA9IHswfSwNCn07DQoNCkFuZCBJIGdvdCBkaWZmZXJl
bmNlIGVycm9yIG1lc3NhZ2UgYFVWQ0lPQ19DVFJMX01BUDogTm8gc3VjaCBmaWxlIG9yIGRpcmVj
dG9yeWANClBsZWFzZSBjaGVjayBhdHRhY2htZW50IGBzdHJhY2VfMjAyMzA0MjhfMi5sb2dgIGZv
ciBzdHJhY2Ugb3V0cHV0DQoNCg0KQmVzdCBSZWdhcmRzLA0KSGFyZHkNCg0KDQotLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUmljYXJkbyBSaWJhbGRhIDxyaWJhbGRhQGNocm9taXVt
Lm9yZz4gDQpTZW50OiBGcmlkYXksIEFwcmlsIDI4LCAyMDIzIDQ6MjYgUE0NClRvOiBoYXJkeWNo
ZW5nKOmEreaYk+aYlSkgPGhhcmR5Y2hlbmdAbXNpLmNvbT4NCkNjOiBsaW51eC1tZWRpYUB2Z2Vy
Lmtlcm5lbC5vcmcNClN1YmplY3Q6IFJlOiBVVkNJT0NfQ1RSTF9NQVAgbm90IHdvcmsNCg0KSGkg
SGFyZHkNCg0KU2VlbXMgbGlrZSB5b3UgY2FuIG9ubHkgYWRkIG1hcHBpbmdzIGZvciAgVjRMMl9D
VFJMX1RZUEVfSU5URUdFUiwgVjRMMl9DVFJMX1RZUEVfQk9PTEVBTjpWNEwyX0NUUkxfVFlQRV9C
VVRUT04gIGFuZCBWNEwyX0NUUkxfVFlQRV9NRU5VLg0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9t
ZWRpYS91c2IvdXZjL3V2Y192NGwyLmMjbjEzMA0KDQpZb3UgYXJlIHRyeWluZyB0byBhZGQgYSBt
YXAgZm9yIGEgVjRMMl9DVFJMX1RZUEVfU1RSSU5HDQoNClJlZ2FyZHMNCg0KT24gRnJpLCAyOCBB
cHIgMjAyMyBhdCAxMDoyMCwgaGFyZHljaGVuZyjphK3mmJPmmJUpIDxoYXJkeWNoZW5nQG1zaS5j
b20+IHdyb3RlOg0KPg0KPiBIaSBSaWNhcmRvLA0KPg0KPiBUaGFua3MgZm9yIHJlcGx5LA0KPg0K
PiBJIHJlcGxhY2UgYF9JT1dSKCd1JywgMHgyMCwgc3RydWN0IHV2Y194dV9jb250cm9sX21hcHBp
bmcpYCB0byBgIA0KPiBVVkNJT0NfQ1RSTF9NQVBgIGFuZCBnb3QgdGhlIHNhbWUgZXJyb3IsIFBs
ZWFzZSBjaGVjayBhdHRhY2htZW50IGZvciANCj4gY29tbWFuZCBvdXRwdXQgYHN0cmFjZSAtZiAu
L3V2Y194dV92NGxfbWFwcGluZ19kZW1vYA0KPg0KPiBCZXN0IFJlZ2FyZHMsDQo+IEhhcmR5DQo+
DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJpY2FyZG8gUmliYWxkYSA8
cmliYWxkYUBjaHJvbWl1bS5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgQXByaWwgMjgsIDIwMjMgNDow
NCBQTQ0KPiBUbzogaGFyZHljaGVuZyjphK3mmJPmmJUpIDxoYXJkeWNoZW5nQG1zaS5jb20+DQo+
IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFVWQ0lPQ19D
VFJMX01BUCBub3Qgd29yaw0KPg0KPiBIaSBIYXJkeQ0KPg0KPiBXaHkgYXJlIHlvdSB1c2luZzoN
Cj4NCj4gcmVzdWx0ID0gaW9jdGwoZmQsIF9JT1dSKCd1JywgMHgyMCwgc3RydWN0IHV2Y194dV9j
b250cm9sX21hcHBpbmcpLCANCj4gJm1hcHBpbmcpOw0KPg0KPiBpbnN0ZWFkIG9mDQo+DQo+IHJl
c3VsdCA9IGlvY3RsKGZkLCBVVkNJT0NfQ1RSTF9NQVAsICZtYXBwaW5nKTsNCj4NCj4gQ2FuIHlv
dSByZXR1cm4gdGhlIG91dHB1dCBvZjoNCj4NCj4gc3RyYWNlIC1mICB1dmNfeHVfdjRsX21hcHBp
bmdfZGVtbw0KPg0KPiBUaGFua3MhDQo+DQo+IE9uIEZyaSwgMjggQXByIDIwMjMgYXQgMDk6MTUs
IGhhcmR5Y2hlbmco6YSt5piT5piVKSA8aGFyZHljaGVuZ0Btc2kuY29tPiB3cm90ZToNCj4gPg0K
PiA+IEhpLA0KPiA+DQo+ID4gIyBFbnZpcm9ubWVudDoNCj4gPg0KPiA+IE9TID0gVWJ1bnR1IDIy
LjA0IExUUyAoTGludXggdmVyc2lvbiA1LjE5LjAtNDEtZ2VuZXJpYykgUHJvZ3JhbSANCj4gPiBM
YW5ndWFnZSA9IEMgTGFuZ3VhZ2UNCj4gPg0KPiA+ICMgT3ZlcnZpZXc6DQo+ID4NCj4gPiBXZSBw
bHVnIGluIG91ciBVVkMgY2FtZXJhIHRvIFBDLCBhbmQgdHJ5IHRvIHVzZSBgVVZDSU9DX0NUUkxf
TUFQYCANCj4gPiBmdW5jdGlvbiBvbiBQQyB0byBjcmVhdGUgdGhlIHY0bDIgY29udHJvbCBtYXBw
aW5nLCBidXQgd2UgZ290IGVycm9yDQo+ID4gYFVWQ0lPQ19DVFJMX01BUDogSW5hcHByb3ByaWF0
ZSBpb2N0bCBmb3IgZGV2aWNlYCBEZXZlbG9wbWVudCB3aXRoIA0KPiA+IGBDIGxhbmd1YWdlYCBp
biBgVWJ1bnR1IDIyLjA0IExUU2ANCj4gPg0KPiA+ICMgRGVzY3JpcHRpb246DQo+ID4NCj4gPiBX
ZSBoYXZlIGEgY3VzdG9tIFVWQyBjYW1lcmEgYW5kIHdlIGNhbiBtb2RpZnkgdGhlIGV4dGVuc2lv
biB1bml0KFhVKSANCj4gPiBieSBvdXJzZWxmLiAoVVNCIGRlc2NyaXB0aW9ucyByZWZlcmVuY2Ug
YXR0YWNobWVudHMgDQo+ID4gYHV2Y194dV9kZXNjcmlwdG9yLlBOR2AgJiBgdXNiX2RlY3JpcHRp
b25zLnR4dGApDQo+ID4NCj4gPiBXZSBtYWtlIHN1cmUgdGhhdCBVVkNJT0NfQ1RSTF9RVUVSWSBp
cyB3b3JrIHRvIGNvbnRyb2wgb3VyIFhVIGl0ZW0gDQo+ID4gKGRlbW8gY29kZSBpbiBhdHRhY2ht
ZW50IGB1dmNfeHVfaW9jdGxfZGVtby5jYCkNCj4gPg0KPiA+IGJ1dCBVVkNJT0NfQ1RSTF9NQVAg
ZnVuY3Rpb24gZmFpbCB3aXRoIGVycm9yIG1lc3NhZ2UgYFVWQ0lPQ19DVFJMX01BUDoNCj4gPiBJ
bmFwcHJvcHJpYXRlIGlvY3RsIGZvciBkZXZpY2VgIChkZW1vIGNvZGUgaW4gYXR0YWNobWVudA0K
PiA+IGB1dmNfeHVfdjRsX21hcHBpbmdfZGVtby5jYCkNCj4gPg0KPiA+ICMgUHJvYmxlbXM6DQo+
ID4NCj4gPiAxLiAgICAgIElzIFVWQ0lPQ19DVFJMX01BUCBmdW5jdGlvbiB1c2luZyBpbiB0aGUg
UEMgaG9zdD8NCj4gPiAyLiAgICAgIENhbiB5b3UgZm91bmQgYW55IHN5bnRheCBwcm9ibGVtIGlu
IG91ciBkZW1vIGNvZGUgYHV2Y194dV92NGxfbWFwcGluZ19kZW1vLmNgPw0KPiA+IDMuICAgICAg
SXMgdGhlcmUgYW55IHNhbXBsZSBjb2RlIGFib3V0IHN0cnVjdCBgdXZjX3h1X2NvbnRyb2xfbWFw
cGluZ2AgdXNpbmc/DQo+ID4NCj4gPiBMb29raW5nIGZvcndhcmQgdG8geW91ciByZXBseSwNCj4g
PiBCZXN0IFJlZ2FyZHMsDQo+ID4gSGFyZHkjMjM3NA0KPiA+DQo+ID4gKioqKipDT05GSURFTlRJ
QUwgSU5GT1JNQVRJT04qKioqKg0KPiA+DQo+ID4gVGhpcyBlbWFpbCBpcyBpbnRlbmRlZCBvbmx5
IGZvciB0aGUgdXNlIG9mIHRoZSBwZXJzb24gb3IgZW50aXR5IHRvIA0KPiA+IHdob20gaXQgaXMg
YWRkcmVzc2VkIGFuZCBjb250YWlucyBpbmZvcm1hdGlvbiB0aGF0IG1heSBiZSBzdWJqZWN0IHRv
IA0KPiA+IGFuZC9vciBtYXkgYmUgcmVzdHJpY3RlZCBmcm9tIGRpc2Nsb3N1cmUgYnkgY29udHJh
Y3Qgb3IgYXBwbGljYWJsZSANCj4gPiBsYXcuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCBy
ZWNpcGllbnQgb2YgdGhpcyBlbWFpbCwgYmUgYWR2aXNlZCANCj4gPiB0aGF0IGFueSBkaXNjbG9z
dXJlLCBjb3B5LCBkaXN0cmlidXRpb24gb3IgdXNlIG9mIHRoZSBjb250ZW50cyBvZiB0aGlzIG1l
c3NhZ2UgaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4NCj4gPiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50
ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZW1haWwsIHBsZWFzZSBub3RpZnkgDQo+ID4gdGhlIHNl
bmRlciB0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgaW4gZXJyb3IgYnkgcmVwbHlpbmcgdG8g
dGhpcyANCj4gPiBtZXNzYWdlLiBUaGVuLCBwbGVhc2UgZGVsZXRlIGl0IGZyb20geW91ciBzeXN0
ZW0uIE91ciBQcml2YWN5IFBvbGljeSANCj4gPiBpcyBhdmFpbGFibGUgaGVyZSBodHRwczovL3d3
dy5tc2kuY29tL3BhZ2UvcHJpdmFjeS1wb2xpY3kuIFRoYW5rIHlvdS4NCj4NCj4NCj4NCj4gLS0N
Cj4gUmljYXJkbyBSaWJhbGRhDQo+DQo+DQo+ICoqKioqQ09ORklERU5USUFMIElORk9STUFUSU9O
KioqKioNCj4NCj4gVGhpcyBlbWFpbCBpcyBpbnRlbmRlZCBvbmx5IGZvciB0aGUgdXNlIG9mIHRo
ZSBwZXJzb24gb3IgZW50aXR5IHRvIA0KPiB3aG9tIGl0IGlzIGFkZHJlc3NlZCBhbmQgY29udGFp
bnMgaW5mb3JtYXRpb24gdGhhdCBtYXkgYmUgc3ViamVjdCB0byANCj4gYW5kL29yIG1heSBiZSBy
ZXN0cmljdGVkIGZyb20gZGlzY2xvc3VyZSBieSBjb250cmFjdCBvciBhcHBsaWNhYmxlIA0KPiBs
YXcuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlbWFpbCwg
YmUgYWR2aXNlZCANCj4gdGhhdCBhbnkgZGlzY2xvc3VyZSwgY29weSwgZGlzdHJpYnV0aW9uIG9y
IHVzZSBvZiB0aGUgY29udGVudHMgb2YgdGhpcyBtZXNzYWdlIGlzIHN0cmljdGx5IHByb2hpYml0
ZWQuDQo+IElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlbWFp
bCwgcGxlYXNlIG5vdGlmeSB0aGUgDQo+IHNlbmRlciB0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRo
aXMgaW4gZXJyb3IgYnkgcmVwbHlpbmcgdG8gdGhpcyANCj4gbWVzc2FnZS4gVGhlbiwgcGxlYXNl
IGRlbGV0ZSBpdCBmcm9tIHlvdXIgc3lzdGVtLiBPdXIgUHJpdmFjeSBQb2xpY3kgDQo+IGlzIGF2
YWlsYWJsZSBoZXJlIGh0dHBzOi8vd3d3Lm1zaS5jb20vcGFnZS9wcml2YWN5LXBvbGljeS4gVGhh
bmsgeW91Lg0KDQoNCg0KLS0NClJpY2FyZG8gUmliYWxkYQ0KDQoNCioqKioqQ09ORklERU5USUFM
IElORk9STUFUSU9OKioqKioNCg0KVGhpcyBlbWFpbCBpcyBpbnRlbmRlZCBvbmx5IGZvciB0aGUg
dXNlIG9mIHRoZSBwZXJzb24gb3IgZW50aXR5IHRvIHdob20gaXQgaXMNCmFkZHJlc3NlZCBhbmQg
Y29udGFpbnMgaW5mb3JtYXRpb24gdGhhdCBtYXkgYmUgc3ViamVjdCB0byBhbmQvb3IgbWF5IGJl
DQpyZXN0cmljdGVkIGZyb20gZGlzY2xvc3VyZSBieSBjb250cmFjdCBvciBhcHBsaWNhYmxlIGxh
dy4gSWYgeW91IGFyZSBub3QgdGhlIA0KaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZW1haWws
IGJlIGFkdmlzZWQgdGhhdCBhbnkgZGlzY2xvc3VyZSwgY29weSwgDQpkaXN0cmlidXRpb24gb3Ig
dXNlIG9mIHRoZSBjb250ZW50cyBvZiB0aGlzIG1lc3NhZ2UgaXMgc3RyaWN0bHkgcHJvaGliaXRl
ZC4gDQpJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZW1haWws
IHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBp
biBlcnJvciBieSByZXBseWluZyB0byB0aGlzIG1lc3NhZ2UuIFRoZW4sIA0KcGxlYXNlIGRlbGV0
ZSBpdCBmcm9tIHlvdXIgc3lzdGVtLiBPdXIgUHJpdmFjeSBQb2xpY3kgaXMgYXZhaWxhYmxlIGhl
cmUgDQpodHRwczovL3d3dy5tc2kuY29tL3BhZ2UvcHJpdmFjeS1wb2xpY3kuIFRoYW5rIHlvdS4=

--_003_25bb11b5e14a49718d97156c614c90e1msicom_
Content-Type: text/plain; name="uvc_xu_v4l_mapping_demo.c"
Content-Description: uvc_xu_v4l_mapping_demo.c
Content-Disposition: attachment; filename="uvc_xu_v4l_mapping_demo.c";
	size=1020; creation-date="Fri, 28 Apr 2023 05:57:08 GMT";
	modification-date="Fri, 28 Apr 2023 08:31:14 GMT"
Content-Transfer-Encoding: base64

I2luY2x1ZGUgPHN0ZGlvLmg+CiNpbmNsdWRlIDxzdGRsaWIuaD4KI2luY2x1ZGUgPHN0cmluZy5o
PgojaW5jbHVkZSA8c3RkYm9vbC5oPgojaW5jbHVkZSA8ZmNudGwuaD4KI2luY2x1ZGUgPHVuaXN0
ZC5oPgojaW5jbHVkZSA8c3lzL2lvY3RsLmg+CiNpbmNsdWRlIDxsaW51eC91c2IvdmlkZW8uaD4K
I2luY2x1ZGUgPGxpbnV4L3V2Y3ZpZGVvLmg+CiNpbmNsdWRlIDxsaW51eC92aWRlb2RldjIuaD4K
CmludCBtYWluKCl7CiAgICBpbnQgcmVzdWx0OwogICAgaW50IGZkID0gb3BlbigiL2Rldi92aWRl
bzAiLCBPX1JEV1IpOwogICAgaWYoZmQgPCAwKSB7CiAgICAgICAgcGVycm9yKCJGaWxlIE9wZW4g
RmFpbCIpOwogICAgICAgIGdvdG8gY2xvc2U7CiAgICB9CgogICAgc3RydWN0IHV2Y194dV9jb250
cm9sX21hcHBpbmcgbWFwcGluZyA9IHsKICAgICAgICAuaWQgPSAweDAxLAogICAgICAgIC5uYW1l
ID0gIk15IEV4dGVuc2lvbiBVbml0IiwKICAgICAgICAuZW50aXR5ID0gezB4MTAsIDB4YmMsIDB4
NDYsIDB4YmEsIDB4MjgsIDB4NWEsIDB4NGQsIDB4N2IsIDB4OTcsIDB4MGUsIDB4ZmQsIDB4OTEs
IDB4NDYsIDB4YTUsIDB4MmYsIDB4MmR9LAogICAgICAgIC5zZWxlY3RvciA9IDB4MDEsCiAgICAg
ICAgLnNpemUgPSAzMiwKICAgICAgICAub2Zmc2V0ID0gMCwKICAgICAgICAudjRsMl90eXBlID0g
VjRMMl9DVFJMX1RZUEVfSU5URUdFUiwKICAgICAgICAuZGF0YV90eXBlID0gVVZDX0NUUkxfREFU
QV9UWVBFX1VOU0lHTkVELAogICAgICAgIC5tZW51X2luZm8gPSBOVUxMLAogICAgICAgIC5tZW51
X2NvdW50ID0gMCwKICAgICAgICAucmVzZXJ2ZWQgPSB7MH0sCiAgICB9OwoKICAgIHJlc3VsdCA9
IGlvY3RsKGZkLCBVVkNJT0NfQ1RSTF9NQVAsICZtYXBwaW5nKTsKICAgIGlmIChyZXN1bHQgIT0g
MCkgewogICAgICAgIHBlcnJvcigiVVZDSU9DX0NUUkxfTUFQIik7CiAgICAgICAgZ290byBjbG9z
ZTsKICAgIH0KCiAgICBjbG9zZToKICAgIGNsb3NlKGZkKTsKICAgIHJldHVybiAwOwp9

--_003_25bb11b5e14a49718d97156c614c90e1msicom_
Content-Type: application/octet-stream; name="strace_20230428_2.log"
Content-Description: strace_20230428_2.log
Content-Disposition: attachment; filename="strace_20230428_2.log"; size=3280;
	creation-date="Fri, 28 Apr 2023 08:32:58 GMT";
	modification-date="Fri, 28 Apr 2023 08:32:56 GMT"
Content-Transfer-Encoding: base64

cm9vdEB1YnVudHUyMjovbXM1NTQ4X3Rlc3QjIHN0cmFjZSAtZiAuL3V2Y194dV92NGxfbWFwcGlu
Z19kZW1vDQpleGVjdmUoIi4vdXZjX3h1X3Y0bF9tYXBwaW5nX2RlbW8iLCBbIi4vdXZjX3h1X3Y0
bF9tYXBwaW5nX2RlbW8iXSwgMHg3ZmZmOTE4NjcwZDggLyogNzYgdmFycyAqLykgPSAwDQpicmso
TlVMTCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPSAweDU1YTllM2JkNzAwMA0KYXJj
aF9wcmN0bCgweDMwMDEgLyogQVJDSF8/Pz8gKi8sIDB4N2ZmZGNiNjE5YzEwKSA9IC0xIEVJTlZB
TCAoSW52YWxpZCBhcmd1bWVudCkNCm1tYXAoTlVMTCwgODE5MiwgUFJPVF9SRUFEfFBST1RfV1JJ
VEUsIE1BUF9QUklWQVRFfE1BUF9BTk9OWU1PVVMsIC0xLCAwKSA9IDB4N2YyZGZmY2ZmMDAwDQph
Y2Nlc3MoIi9ldGMvbGQuc28ucHJlbG9hZCIsIFJfT0spICAgICAgPSAtMSBFTk9FTlQgKE5vIHN1
Y2ggZmlsZSBvciBkaXJlY3RvcnkpDQpvcGVuYXQoQVRfRkRDV0QsICIvZXRjL2xkLnNvLmNhY2hl
IiwgT19SRE9OTFl8T19DTE9FWEVDKSA9IDMNCm5ld2ZzdGF0YXQoMywgIiIsIHtzdF9tb2RlPVNf
SUZSRUd8MDY0NCwgc3Rfc2l6ZT02NTk4NywgLi4ufSwgQVRfRU1QVFlfUEFUSCkgPSAwDQptbWFw
KE5VTEwsIDY1OTg3LCBQUk9UX1JFQUQsIE1BUF9QUklWQVRFLCAzLCAwKSA9IDB4N2YyZGZmY2Vl
MDAwDQpjbG9zZSgzKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPSAwDQpvcGVuYXQo
QVRfRkRDV0QsICIvbGliL3g4Nl82NC1saW51eC1nbnUvbGliYy5zby42IiwgT19SRE9OTFl8T19D
TE9FWEVDKSA9IDMNCnJlYWQoMywgIlwxNzdFTEZcMlwxXDFcM1wwXDBcMFwwXDBcMFwwXDBcM1ww
PlwwXDFcMFwwXDBQXDIzN1wyXDBcMFwwXDBcMCIuLi4sIDgzMikgPSA4MzINCnByZWFkNjQoMywg
Ilw2XDBcMFwwXDRcMFwwXDBAXDBcMFwwXDBcMFwwXDBAXDBcMFwwXDBcMFwwXDBAXDBcMFwwXDBc
MFwwXDAiLi4uLCA3ODQsIDY0KSA9IDc4NA0KcHJlYWQ2NCgzLCAiXDRcMFwwXDAgXDBcMFwwXDVc
MFwwXDBHTlVcMFwyXDBcMFwzMDBcNFwwXDBcMFwzXDBcMFwwXDBcMFwwXDAiLi4uLCA0OCwgODQ4
KSA9IDQ4DQpwcmVhZDY0KDMsICJcNFwwXDBcMFwyNFwwXDBcMFwzXDBcMFwwR05VXDBpOFwyMzVI
WlwyMjdcMjIzXDMzM1wzNTBzXDM2MFwzNTIsXDIyM1wzNDAuIi4uLiwgNjgsIDg5NikgPSA2OA0K
bmV3ZnN0YXRhdCgzLCAiIiwge3N0X21vZGU9U19JRlJFR3wwNjQ0LCBzdF9zaXplPTIyMTYzMDQs
IC4uLn0sIEFUX0VNUFRZX1BBVEgpID0gMA0KcHJlYWQ2NCgzLCAiXDZcMFwwXDBcNFwwXDBcMEBc
MFwwXDBcMFwwXDBcMEBcMFwwXDBcMFwwXDBcMEBcMFwwXDBcMFwwXDBcMCIuLi4sIDc4NCwgNjQp
ID0gNzg0DQptbWFwKE5VTEwsIDIyNjA1NjAsIFBST1RfUkVBRCwgTUFQX1BSSVZBVEV8TUFQX0RF
TllXUklURSwgMywgMCkgPSAweDdmMmRmZmEwMDAwMA0KbW1hcCgweDdmMmRmZmEyODAwMCwgMTY1
ODg4MCwgUFJPVF9SRUFEfFBST1RfRVhFQywgTUFQX1BSSVZBVEV8TUFQX0ZJWEVEfE1BUF9ERU5Z
V1JJVEUsIDMsIDB4MjgwMDApID0gMHg3ZjJkZmZhMjgwMDANCm1tYXAoMHg3ZjJkZmZiYmQwMDAs
IDM2MDQ0OCwgUFJPVF9SRUFELCBNQVBfUFJJVkFURXxNQVBfRklYRUR8TUFQX0RFTllXUklURSwg
MywgMHgxYmQwMDApID0gMHg3ZjJkZmZiYmQwMDANCm1tYXAoMHg3ZjJkZmZjMTUwMDAsIDI0NTc2
LCBQUk9UX1JFQUR8UFJPVF9XUklURSwgTUFQX1BSSVZBVEV8TUFQX0ZJWEVEfE1BUF9ERU5ZV1JJ
VEUsIDMsIDB4MjE0MDAwKSA9IDB4N2YyZGZmYzE1MDAwDQptbWFwKDB4N2YyZGZmYzFiMDAwLCA1
MjgxNiwgUFJPVF9SRUFEfFBST1RfV1JJVEUsIE1BUF9QUklWQVRFfE1BUF9GSVhFRHxNQVBfQU5P
TllNT1VTLCAtMSwgMCkgPSAweDdmMmRmZmMxYjAwMA0KY2xvc2UoMykgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgID0gMA0KbW1hcChOVUxMLCAxMjI4OCwgUFJPVF9SRUFEfFBST1RfV1JJ
VEUsIE1BUF9QUklWQVRFfE1BUF9BTk9OWU1PVVMsIC0xLCAwKSA9IDB4N2YyZGZmY2ViMDAwDQph
cmNoX3ByY3RsKEFSQ0hfU0VUX0ZTLCAweDdmMmRmZmNlYjc0MCkgPSAwDQpzZXRfdGlkX2FkZHJl
c3MoMHg3ZjJkZmZjZWJhMTApICAgICAgICAgPSA2NjYyDQpzZXRfcm9idXN0X2xpc3QoMHg3ZjJk
ZmZjZWJhMjAsIDI0KSAgICAgPSAwDQpyc2VxKDB4N2YyZGZmY2VjMGUwLCAweDIwLCAwLCAweDUz
MDUzMDUzKSA9IDANCm1wcm90ZWN0KDB4N2YyZGZmYzE1MDAwLCAxNjM4NCwgUFJPVF9SRUFEKSA9
IDANCm1wcm90ZWN0KDB4NTVhOWUzMGExMDAwLCA0MDk2LCBQUk9UX1JFQUQpID0gMA0KbXByb3Rl
Y3QoMHg3ZjJkZmZkMzkwMDAsIDgxOTIsIFBST1RfUkVBRCkgPSAwDQpwcmxpbWl0NjQoMCwgUkxJ
TUlUX1NUQUNLLCBOVUxMLCB7cmxpbV9jdXI9ODE5MioxMDI0LCBybGltX21heD1STElNNjRfSU5G
SU5JVFl9KSA9IDANCm11bm1hcCgweDdmMmRmZmNlZTAwMCwgNjU5ODcpICAgICAgICAgICA9IDAN
Cm9wZW5hdChBVF9GRENXRCwgIi9kZXYvdmlkZW8wIiwgT19SRFdSKSA9IDMNCmlvY3RsKDMsIFVW
Q0lPQ19DVFJMX01BUCwgMHg3ZmZkY2I2MTljNTApID0gLTEgRU5PRU5UIChObyBzdWNoIGZpbGUg
b3IgZGlyZWN0b3J5KQ0KZHVwKDIpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID0g
NA0KZmNudGwoNCwgRl9HRVRGTCkgICAgICAgICAgICAgICAgICAgICAgID0gMHgyIChmbGFncyBP
X1JEV1IpDQpnZXRyYW5kb20oIlx4YWJceDFmXHgzNFx4MTVceGI4XHgwOVx4MjhceDc5IiwgOCwg
R1JORF9OT05CTE9DSykgPSA4DQpicmsoTlVMTCkgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgPSAweDU1YTllM2JkNzAwMA0KYnJrKDB4NTVhOWUzYmY4MDAwKSAgICAgICAgICAgICAgICAg
ICAgID0gMHg1NWE5ZTNiZjgwMDANCm5ld2ZzdGF0YXQoNCwgIiIsIHtzdF9tb2RlPVNfSUZDSFJ8
MDYyMCwgc3RfcmRldj1tYWtlZGV2KDB4ODgsIDApLCAuLi59LCBBVF9FTVBUWV9QQVRIKSA9IDAN
CndyaXRlKDQsICJVVkNJT0NfQ1RSTF9NQVA6IE5vIHN1Y2ggZmlsZSBvciIuLi4sIDQzVVZDSU9D
X0NUUkxfTUFQOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQopID0gNDMNCmNsb3NlKDQpICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICA9IDANCmNsb3NlKDMpICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICA9IDANCmV4aXRfZ3JvdXAoMCkgICAgICAgICAgICAgICAgICAgICAg
ICAgICA9ID8NCisrKyBleGl0ZWQgd2l0aCAwICsrKw==

--_003_25bb11b5e14a49718d97156c614c90e1msicom_--

