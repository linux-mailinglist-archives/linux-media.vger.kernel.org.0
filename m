Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D72866F1741
	for <lists+linux-media@lfdr.de>; Fri, 28 Apr 2023 14:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345934AbjD1MIB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Apr 2023 08:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232147AbjD1MH7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Apr 2023 08:07:59 -0400
Received: from mail6.msi.com (mail6.msi.com [114.30.40.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C38D5FDE
        for <linux-media@vger.kernel.org>; Fri, 28 Apr 2023 05:07:34 -0700 (PDT)
Received: from mail9.msi.com (mail9.msi.com [220.130.147.43])
        by mail6.msi.com (Postfix) with ESMTPS id B05895E0488;
        Fri, 28 Apr 2023 20:06:49 +0800 (CST)
Received: from mail9.msi.com (localhost [127.0.0.1])
        by postfix.imss91 (Postfix) with ESMTP id 7EA42F807A7;
        Fri, 28 Apr 2023 20:06:49 +0800 (CST)
DKIM-Filter: OpenDKIM Filter v2.11.0 postfix.imss91 7EA42F807A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=msi.com; s=20220711;
        t=1682683609; bh=NYadJ1SF1C6dwWbqiRsl8WFL4JPJzUoCgDnM3rr2gyQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Ma4dQ6Ma6/qki9d8LwZwxRlucXplQkvSHtxykCs4nOF0VtorllkWzXY6txPis4RFf
         NFvLWZJz1c3dyEPOE15S5aqXsHiTpcOh8vE2X1K2wJDQGOtnuZsO7YmSC07Wcj9uPh
         IzO0XEwPp8Km5HKjd3OCAGC95305BTaU3M2EzCPOisuWoMsF6B4Ldw51D1Abt1G/+F
         sMC5LXG3/gYIofho6SQwJsbOjrs85IMqOyQp3m1bFGX0XeF0UUC7djB0RGptjdMKsc
         oU/+c5rN3K2yJ2ZpZDUC3597oI+nl1TGtT+jYKKm9TH2hyvc21FjB+2L3PfNBg+hEm
         6iCHgCHddQBOg==
Received: from EX2016A.msi.com.tw (unknown [172.16.0.54])
        by mail9.msi.com (Postfix) with ESMTPS id 716D7F8069C;
        Fri, 28 Apr 2023 20:06:49 +0800 (CST)
Received: from EX2016A.msi.com.tw (172.16.0.54) by EX2016A.msi.com.tw
 (172.16.0.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 28 Apr
 2023 20:06:49 +0800
Received: from EX2016A.msi.com.tw ([::1]) by EX2016A.msi.com.tw
 ([fe80::cc96:ad54:6ca4:e0f4%5]) with mapi id 15.01.2507.023; Fri, 28 Apr 2023
 20:06:49 +0800
From:   =?utf-8?B?aGFyZHljaGVuZyjphK3mmJPmmJUp?= <hardycheng@msi.com>
To:     'Ricardo Ribalda' <ribalda@chromium.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: UVCIOC_CTRL_MAP not work
Thread-Topic: UVCIOC_CTRL_MAP not work
Thread-Index: AQHZeagKEx6yhHYjHUmDjx3JEMz4jq9AYskPgAAFT8qAAAPLqoAAARMggAAyoTA=
Date:   Fri, 28 Apr 2023 12:06:49 +0000
Message-ID: <c79d08a32dfd4e85a3e23059805058f3@msi.com>
References: <0477365efa0d45d7bddf9572d4f09c4c@msi.com>
 <CANiDSCsvuA4f8Kjzp27ncy+HXHft+chMeR5REFAjpj-G4Pc-JA@mail.gmail.com>
 <c19a2cb8f0d04f19bcc884f13b185261@msi.com>
 <CANiDSCuG+0w=8hRrcG-UPWhBJLL+As0j+KseShDrB=Dca9JXhw@mail.gmail.com>
 <25bb11b5e14a49718d97156c614c90e1@msi.com>
 <CANiDSCtRp2DZQ4=FCDp+BGMO6S4=-ukkL7bKFUF5Hp36m4aSog@mail.gmail.com>
 <f1f6c629d5184119b8bf1bb8172c5ac7@msi.com>
 <CANiDSCuBBgxWg=wffyQ-AB0u3rr4-secLWudpjC5iyypBn+Ryg@mail.gmail.com>
 <72f03a2b961f462f89fe592d684121d8@msi.com>
In-Reply-To: <72f03a2b961f462f89fe592d684121d8@msi.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.113.50]
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: base64
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

SGkgUmljYXJkbywNCg0KSSBuZWVkIHRvIHNpbmNlcmVseSBhcG9sb2dpemUgdG8geW91IGZvciBt
eSBtaXN0YWtlIG9mIGltcGxhbnRpbmcgdGhlIHdyb25nIEdVSUQsIHdoaWNoIHJlc3VsdGVkIGlu
IHRoZSBkZXZpY2Ugbm90IGJlaW5nIGZvdW5kLiANClRoaXMgd2FzIGEgZm9vbGlzaCBlcnJvciBv
biBteSBwYXJ0IGFuZCBJIGFtIHNvcnJ5IGZvciB0YWtpbmcgdXAgeW91ciB2YWx1YWJsZSB0aW1l
Lg0KDQpUaGFuayB5b3UgYWdhaW4gZm9yIHlvdXIgaGVscC4NCg0KQmVzdCBSZWdhcmRzLA0KSGFy
ZHkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGhhcmR5Y2hlbmco6YSt5piT
5piVKSANClNlbnQ6IEZyaWRheSwgQXByaWwgMjgsIDIwMjMgNToxMCBQTQ0KVG86IFJpY2FyZG8g
UmliYWxkYSA8cmliYWxkYUBjaHJvbWl1bS5vcmc+DQpDYzogbGludXgtbWVkaWFAdmdlci5rZXJu
ZWwub3JnDQpTdWJqZWN0OiBSRTogVVZDSU9DX0NUUkxfTUFQIG5vdCB3b3JrDQoNCkhpIFJpY2Fy
ZG8sDQoNClNlZW1zIGxpa2Ugbm8gbW9yZSBtZXNzYWdlIG9mIFhVIGNvbnRyb2xzLCBJIHJ1biBt
eSBwcm9ncmFtIGluIHRpbWUgWzEwMjQ2LjU1NzQ2Ml0sIHRoZSByZWxldmFudCBtZXNzYWdlIGlz
IGFzIGZvbGxvd3M6DQpbMTAyNDYuNTU3NDYyXSB1c2IgMS0xOiB1dmNfdjRsMl9vcGVuDQpbMTAy
NDYuNjI1MjYwXSB1c2IgMS0xOiBSZXN1bWluZyBpbnRlcmZhY2UgMCBbMTAyNDYuNjI1MjY2XSB1
c2IgMS0xOiBSZXN1bWluZyBpbnRlcmZhY2UgMSBbMTAyNDYuNjQ1NTE1XSB1c2IgMS0xOiB1dmNf
djRsMl9yZWxlYXNlDQoNClBsZWFzZSBjaGVjayBhdHRhY2htZW50IG9mIGRtc2VnIG91dHB1dCBg
ZG1lc2dfMjAyMzA0MjgubG9nYA0KDQoNCkJlc3QgUmVnYXJkcywNCkhhcmR5IzIzNzQNCg0KDQot
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUmljYXJkbyBSaWJhbGRhIDxyaWJhbGRh
QGNocm9taXVtLm9yZz4NClNlbnQ6IEZyaWRheSwgQXByaWwgMjgsIDIwMjMgNDo1OCBQTQ0KVG86
IGhhcmR5Y2hlbmco6YSt5piT5piVKSA8aGFyZHljaGVuZ0Btc2kuY29tPg0KQ2M6IGxpbnV4LW1l
ZGlhQHZnZXIua2VybmVsLm9yZw0KU3ViamVjdDogUmU6IFVWQ0lPQ19DVFJMX01BUCBub3Qgd29y
aw0KDQpXaGF0IGFib3V0Og0KDQpybW1vZCB1dmN2aWRlbw0KbW9kcHJvYmUgdXZjdmlkZW8gdHJh
Y2U9MHhmZmZmZmZmZg0KDQp0aGVuIHJ1biB5b3VyIHByb2dyYW0NCg0KWW91IG1pZ2h0IGJlIGFi
bGUgdG8gZmlndXJlIG91dCB3aGF0IHh1IGNvbnRyb2xzIGFyZSBkaXNjb3ZlcmVkLg0KDQoNCk9u
IEZyaSwgMjggQXByIDIwMjMgYXQgMTA6NTAsIGhhcmR5Y2hlbmco6YSt5piT5piVKSA8aGFyZHlj
aGVuZ0Btc2kuY29tPiB3cm90ZToNCj4NCj4gSGkgUmljYXJkbywNCj4NCj4gVGhhbmsgeW91IGZv
ciBzdWNoIGEgcXVpY2sgcmVwbHkuDQo+IEZvbGxvdyB5b3VyIGFkdmljZSwgYnV0IEkganVzdCBn
b3QgZmV3IGxvZ3MgaW4gZG1lc2cNCj4NCj4gWyA5NDUyLjY3NzMzN10gdXNiIDEtMTogdXZjX3Y0
bDJfb3Blbg0KPiBbIDk0NTIuNzI1MjU0XSB1c2IgMS0xOiBSZXN1bWluZyBpbnRlcmZhY2UgMCBb
IDk0NTIuNzI1MjU4XSB1c2IgMS0xOiANCj4gUmVzdW1pbmcgaW50ZXJmYWNlIDEgWyA5NDUyLjc1
MTk3MV0gdXNiIDEtMTogdXZjX3Y0bDJfcmVsZWFzZSBbIA0KPiA5NDU1LjIzNjk3M10gdXNiIDEt
MTogU3VzcGVuZGluZyBpbnRlcmZhY2UgMSBbIDk0NTUuMjM2OTc3XSB1c2IgMS0xOg0KPiBTdXNw
ZW5kaW5nIGludGVyZmFjZSAwDQo+DQo+IElzIHRoZXJlIGFueSB3YXkgdG8gZ2V0IG1vcmUgZGVi
dWcgbWVzc2FnZSBhYm91dCB0aGlzIGlzc3VlPw0KPg0KPg0KPiBCZXN0IFJlZ2FyZHMsDQo+IEhh
cmR5IzIzNzQNCj4NCj4NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmlj
YXJkbyBSaWJhbGRhIDxyaWJhbGRhQGNocm9taXVtLm9yZz4NCj4gU2VudDogRnJpZGF5LCBBcHJp
bCAyOCwgMjAyMyA0OjQ1IFBNDQo+IFRvOiBoYXJkeWNoZW5nKOmEreaYk+aYlSkgPGhhcmR5Y2hl
bmdAbXNpLmNvbT4NCj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0
OiBSZTogVVZDSU9DX0NUUkxfTUFQIG5vdCB3b3JrDQo+DQo+IEhpIEhhcmR5DQo+DQo+IHRyeSBy
dW5uaW5nOg0KPg0KPiBlY2hvIDB4ZmZmZmZmZmYgPiAvc3lzL21vZHVsZS91dmN2aWRlby9wYXJh
bWV0ZXJzL3RyYWNlDQo+DQo+IGFuZCB0aGVuIHlvdXIgcHJvZ3JhbQ0KPg0KPiBhbmQgdGhlbiBk
bWVzZw0KPg0KPiBJdCB3aWxsIHRlbGwgeW91IHdoZXJlIGl0IGdvdCBzdG9jaw0KPg0KPiBSZWdh
cmRzIQ0KPg0KPiBPbiBGcmksIDI4IEFwciAyMDIzIGF0IDEwOjM4LCBoYXJkeWNoZW5nKOmEreaY
k+aYlSkgPGhhcmR5Y2hlbmdAbXNpLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIaSBSaWNhcmRvLA0K
PiA+DQo+ID4gU28gSSBtb2RpZnkgdGhlIGB1dmNfeHVfY29udHJvbF9tYXBwaW5nYCBzdHJ1Y3Qg
YXMgZm9sbG93czoNCj4gPiAoZnVsbCBjb2RlIHJlZmVyZW5jZSBhdHRhY2htZW50IGB1dmNfeHVf
djRsX21hcHBpbmdfZGVtby5jYCkgc3RydWN0IA0KPiA+IHV2Y194dV9jb250cm9sX21hcHBpbmcg
bWFwcGluZyA9IHsNCj4gPiAgICAgICAgIC5pZCA9IDB4MDEsDQo+ID4gICAgICAgICAubmFtZSA9
ICJNeSBFeHRlbnNpb24gVW5pdCIsDQo+ID4gICAgICAgICAuZW50aXR5ID0gezB4MTAsIDB4YmMs
IDB4NDYsIDB4YmEsIDB4MjgsIDB4NWEsIDB4NGQsIDB4N2IsIDB4OTcsIDB4MGUsIDB4ZmQsIDB4
OTEsIDB4NDYsIDB4YTUsIDB4MmYsIDB4MmR9LA0KPiA+ICAgICAgICAgLnNlbGVjdG9yID0gMHgw
MSwNCj4gPiAgICAgICAgIC5zaXplID0gMzIsDQo+ID4gICAgICAgICAub2Zmc2V0ID0gMCwNCj4g
PiAgICAgICAgIC52NGwyX3R5cGUgPSBWNEwyX0NUUkxfVFlQRV9JTlRFR0VSLA0KPiA+ICAgICAg
ICAgLmRhdGFfdHlwZSA9IFVWQ19DVFJMX0RBVEFfVFlQRV9VTlNJR05FRCwNCj4gPiAgICAgICAg
IC5tZW51X2luZm8gPSBOVUxMLA0KPiA+ICAgICAgICAgLm1lbnVfY291bnQgPSAwLA0KPiA+ICAg
ICAgICAgLnJlc2VydmVkID0gezB9LA0KPiA+IH07DQo+ID4NCj4gPiBBbmQgSSBnb3QgZGlmZmVy
ZW5jZSBlcnJvciBtZXNzYWdlIGBVVkNJT0NfQ1RSTF9NQVA6IE5vIHN1Y2ggZmlsZSBvciANCj4g
PiBkaXJlY3RvcnlgIFBsZWFzZSBjaGVjayBhdHRhY2htZW50IGBzdHJhY2VfMjAyMzA0MjhfMi5s
b2dgIGZvciANCj4gPiBzdHJhY2Ugb3V0cHV0DQo+ID4NCj4gPg0KPiA+IEJlc3QgUmVnYXJkcywN
Cj4gPiBIYXJkeQ0KPiA+DQo+ID4NCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+
IEZyb206IFJpY2FyZG8gUmliYWxkYSA8cmliYWxkYUBjaHJvbWl1bS5vcmc+DQo+ID4gU2VudDog
RnJpZGF5LCBBcHJpbCAyOCwgMjAyMyA0OjI2IFBNDQo+ID4gVG86IGhhcmR5Y2hlbmco6YSt5piT
5piVKSA8aGFyZHljaGVuZ0Btc2kuY29tPg0KPiA+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5l
bC5vcmcNCj4gPiBTdWJqZWN0OiBSZTogVVZDSU9DX0NUUkxfTUFQIG5vdCB3b3JrDQo+ID4NCj4g
PiBIaSBIYXJkeQ0KPiA+DQo+ID4gU2VlbXMgbGlrZSB5b3UgY2FuIG9ubHkgYWRkIG1hcHBpbmdz
IGZvciAgVjRMMl9DVFJMX1RZUEVfSU5URUdFUiwgVjRMMl9DVFJMX1RZUEVfQk9PTEVBTjpWNEwy
X0NUUkxfVFlQRV9CVVRUT04gIGFuZCBWNEwyX0NUUkxfVFlQRV9NRU5VLg0KPiA+IGh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4Lmdp
dC90DQo+ID4gcmUNCj4gPiBlL2RyaXZlcnMvbWVkaWEvdXNiL3V2Yy91dmNfdjRsMi5jI24xMzAN
Cj4gPg0KPiA+IFlvdSBhcmUgdHJ5aW5nIHRvIGFkZCBhIG1hcCBmb3IgYSBWNEwyX0NUUkxfVFlQ
RV9TVFJJTkcNCj4gPg0KPiA+IFJlZ2FyZHMNCj4gPg0KPiA+IE9uIEZyaSwgMjggQXByIDIwMjMg
YXQgMTA6MjAsIGhhcmR5Y2hlbmco6YSt5piT5piVKSA8aGFyZHljaGVuZ0Btc2kuY29tPiB3cm90
ZToNCj4gPiA+DQo+ID4gPiBIaSBSaWNhcmRvLA0KPiA+ID4NCj4gPiA+IFRoYW5rcyBmb3IgcmVw
bHksDQo+ID4gPg0KPiA+ID4gSSByZXBsYWNlIGBfSU9XUigndScsIDB4MjAsIHN0cnVjdCB1dmNf
eHVfY29udHJvbF9tYXBwaW5nKWAgdG8gYCANCj4gPiA+IFVWQ0lPQ19DVFJMX01BUGAgYW5kIGdv
dCB0aGUgc2FtZSBlcnJvciwgUGxlYXNlIGNoZWNrIGF0dGFjaG1lbnQgDQo+ID4gPiBmb3IgY29t
bWFuZCBvdXRwdXQgYHN0cmFjZSAtZiAuL3V2Y194dV92NGxfbWFwcGluZ19kZW1vYA0KPiA+ID4N
Cj4gPiA+IEJlc3QgUmVnYXJkcywNCj4gPiA+IEhhcmR5DQo+ID4gPg0KPiA+ID4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IFJpY2FyZG8gUmliYWxkYSA8cmliYWxkYUBj
aHJvbWl1bS5vcmc+DQo+ID4gPiBTZW50OiBGcmlkYXksIEFwcmlsIDI4LCAyMDIzIDQ6MDQgUE0N
Cj4gPiA+IFRvOiBoYXJkeWNoZW5nKOmEreaYk+aYlSkgPGhhcmR5Y2hlbmdAbXNpLmNvbT4NCj4g
PiA+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcNCj4gPiA+IFN1YmplY3Q6IFJlOiBV
VkNJT0NfQ1RSTF9NQVAgbm90IHdvcmsNCj4gPiA+DQo+ID4gPiBIaSBIYXJkeQ0KPiA+ID4NCj4g
PiA+IFdoeSBhcmUgeW91IHVzaW5nOg0KPiA+ID4NCj4gPiA+IHJlc3VsdCA9IGlvY3RsKGZkLCBf
SU9XUigndScsIDB4MjAsIHN0cnVjdCANCj4gPiA+IHV2Y194dV9jb250cm9sX21hcHBpbmcpLCAm
bWFwcGluZyk7DQo+ID4gPg0KPiA+ID4gaW5zdGVhZCBvZg0KPiA+ID4NCj4gPiA+IHJlc3VsdCA9
IGlvY3RsKGZkLCBVVkNJT0NfQ1RSTF9NQVAsICZtYXBwaW5nKTsNCj4gPiA+DQo+ID4gPiBDYW4g
eW91IHJldHVybiB0aGUgb3V0cHV0IG9mOg0KPiA+ID4NCj4gPiA+IHN0cmFjZSAtZiAgdXZjX3h1
X3Y0bF9tYXBwaW5nX2RlbW8NCj4gPiA+DQo+ID4gPiBUaGFua3MhDQo+ID4gPg0KPiA+ID4gT24g
RnJpLCAyOCBBcHIgMjAyMyBhdCAwOToxNSwgaGFyZHljaGVuZyjphK3mmJPmmJUpIDxoYXJkeWNo
ZW5nQG1zaS5jb20+IHdyb3RlOg0KPiA+ID4gPg0KPiA+ID4gPiBIaSwNCj4gPiA+ID4NCj4gPiA+
ID4gIyBFbnZpcm9ubWVudDoNCj4gPiA+ID4NCj4gPiA+ID4gT1MgPSBVYnVudHUgMjIuMDQgTFRT
IChMaW51eCB2ZXJzaW9uIDUuMTkuMC00MS1nZW5lcmljKSBQcm9ncmFtIA0KPiA+ID4gPiBMYW5n
dWFnZSA9IEMgTGFuZ3VhZ2UNCj4gPiA+ID4NCj4gPiA+ID4gIyBPdmVydmlldzoNCj4gPiA+ID4N
Cj4gPiA+ID4gV2UgcGx1ZyBpbiBvdXIgVVZDIGNhbWVyYSB0byBQQywgYW5kIHRyeSB0byB1c2Ug
DQo+ID4gPiA+IGBVVkNJT0NfQ1RSTF9NQVBgIGZ1bmN0aW9uIG9uIFBDIHRvIGNyZWF0ZSB0aGUg
djRsMiBjb250cm9sIA0KPiA+ID4gPiBtYXBwaW5nLCBidXQgd2UgZ290IGVycm9yDQo+ID4gPiA+
IGBVVkNJT0NfQ1RSTF9NQVA6IEluYXBwcm9wcmlhdGUgaW9jdGwgZm9yIGRldmljZWAgRGV2ZWxv
cG1lbnQgDQo+ID4gPiA+IHdpdGggYEMgbGFuZ3VhZ2VgIGluIGBVYnVudHUgMjIuMDQgTFRTYA0K
PiA+ID4gPg0KPiA+ID4gPiAjIERlc2NyaXB0aW9uOg0KPiA+ID4gPg0KPiA+ID4gPiBXZSBoYXZl
IGEgY3VzdG9tIFVWQyBjYW1lcmEgYW5kIHdlIGNhbiBtb2RpZnkgdGhlIGV4dGVuc2lvbg0KPiA+
ID4gPiB1bml0KFhVKSBieSBvdXJzZWxmLiAoVVNCIGRlc2NyaXB0aW9ucyByZWZlcmVuY2UgYXR0
YWNobWVudHMgDQo+ID4gPiA+IGB1dmNfeHVfZGVzY3JpcHRvci5QTkdgICYgYHVzYl9kZWNyaXB0
aW9ucy50eHRgKQ0KPiA+ID4gPg0KPiA+ID4gPiBXZSBtYWtlIHN1cmUgdGhhdCBVVkNJT0NfQ1RS
TF9RVUVSWSBpcyB3b3JrIHRvIGNvbnRyb2wgb3VyIFhVIA0KPiA+ID4gPiBpdGVtIChkZW1vIGNv
ZGUgaW4gYXR0YWNobWVudCBgdXZjX3h1X2lvY3RsX2RlbW8uY2ApDQo+ID4gPiA+DQo+ID4gPiA+
IGJ1dCBVVkNJT0NfQ1RSTF9NQVAgZnVuY3Rpb24gZmFpbCB3aXRoIGVycm9yIG1lc3NhZ2UgYFVW
Q0lPQ19DVFJMX01BUDoNCj4gPiA+ID4gSW5hcHByb3ByaWF0ZSBpb2N0bCBmb3IgZGV2aWNlYCAo
ZGVtbyBjb2RlIGluIGF0dGFjaG1lbnQNCj4gPiA+ID4gYHV2Y194dV92NGxfbWFwcGluZ19kZW1v
LmNgKQ0KPiA+ID4gPg0KPiA+ID4gPiAjIFByb2JsZW1zOg0KPiA+ID4gPg0KPiA+ID4gPiAxLiAg
ICAgIElzIFVWQ0lPQ19DVFJMX01BUCBmdW5jdGlvbiB1c2luZyBpbiB0aGUgUEMgaG9zdD8NCj4g
PiA+ID4gMi4gICAgICBDYW4geW91IGZvdW5kIGFueSBzeW50YXggcHJvYmxlbSBpbiBvdXIgZGVt
byBjb2RlIGB1dmNfeHVfdjRsX21hcHBpbmdfZGVtby5jYD8NCj4gPiA+ID4gMy4gICAgICBJcyB0
aGVyZSBhbnkgc2FtcGxlIGNvZGUgYWJvdXQgc3RydWN0IGB1dmNfeHVfY29udHJvbF9tYXBwaW5n
YCB1c2luZz8NCj4gPiA+ID4NCj4gPiA+ID4gTG9va2luZyBmb3J3YXJkIHRvIHlvdXIgcmVwbHks
DQo+ID4gPiA+IEJlc3QgUmVnYXJkcywNCj4gPiA+ID4gSGFyZHkjMjM3NA0KPiA+ID4gPg0KPiA+
ID4gPiAqKioqKkNPTkZJREVOVElBTCBJTkZPUk1BVElPTioqKioqDQo+ID4gPiA+DQo+ID4gPiA+
IFRoaXMgZW1haWwgaXMgaW50ZW5kZWQgb25seSBmb3IgdGhlIHVzZSBvZiB0aGUgcGVyc29uIG9y
IGVudGl0eSANCj4gPiA+ID4gdG8gd2hvbSBpdCBpcyBhZGRyZXNzZWQgYW5kIGNvbnRhaW5zIGlu
Zm9ybWF0aW9uIHRoYXQgbWF5IGJlIA0KPiA+ID4gPiBzdWJqZWN0IHRvIGFuZC9vciBtYXkgYmUg
cmVzdHJpY3RlZCBmcm9tIGRpc2Nsb3N1cmUgYnkgY29udHJhY3QgDQo+ID4gPiA+IG9yIGFwcGxp
Y2FibGUgbGF3LiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMg
DQo+ID4gPiA+IGVtYWlsLCBiZSBhZHZpc2VkIHRoYXQgYW55IGRpc2Nsb3N1cmUsIGNvcHksIGRp
c3RyaWJ1dGlvbiBvciB1c2Ugb2YgdGhlIGNvbnRlbnRzIG9mIHRoaXMgbWVzc2FnZSBpcyBzdHJp
Y3RseSBwcm9oaWJpdGVkLg0KPiA+ID4gPiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVj
aXBpZW50IG9mIHRoaXMgZW1haWwsIHBsZWFzZSANCj4gPiA+ID4gbm90aWZ5IHRoZSBzZW5kZXIg
dGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGluIGVycm9yIGJ5IA0KPiA+ID4gPiByZXBseWlu
ZyB0byB0aGlzIG1lc3NhZ2UuIFRoZW4sIHBsZWFzZSBkZWxldGUgaXQgZnJvbSB5b3VyIA0KPiA+
ID4gPiBzeXN0ZW0uIE91ciBQcml2YWN5IFBvbGljeSBpcyBhdmFpbGFibGUgaGVyZSBodHRwczov
L3d3dy5tc2kuY29tL3BhZ2UvcHJpdmFjeS1wb2xpY3kuIFRoYW5rIHlvdS4NCj4gPiA+DQo+ID4g
Pg0KPiA+ID4NCj4gPiA+IC0tDQo+ID4gPiBSaWNhcmRvIFJpYmFsZGENCj4gPiA+DQo+ID4gPg0K
PiA+ID4gKioqKipDT05GSURFTlRJQUwgSU5GT1JNQVRJT04qKioqKg0KPiA+ID4NCj4gPiA+IFRo
aXMgZW1haWwgaXMgaW50ZW5kZWQgb25seSBmb3IgdGhlIHVzZSBvZiB0aGUgcGVyc29uIG9yIGVu
dGl0eSB0byANCj4gPiA+IHdob20gaXQgaXMgYWRkcmVzc2VkIGFuZCBjb250YWlucyBpbmZvcm1h
dGlvbiB0aGF0IG1heSBiZSBzdWJqZWN0IA0KPiA+ID4gdG8gYW5kL29yIG1heSBiZSByZXN0cmlj
dGVkIGZyb20gZGlzY2xvc3VyZSBieSBjb250cmFjdCBvciANCj4gPiA+IGFwcGxpY2FibGUgbGF3
LiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgDQo+ID4gPiBl
bWFpbCwgYmUgYWR2aXNlZCB0aGF0IGFueSBkaXNjbG9zdXJlLCBjb3B5LCBkaXN0cmlidXRpb24g
b3IgdXNlIG9mIHRoZSBjb250ZW50cyBvZiB0aGlzIG1lc3NhZ2UgaXMgc3RyaWN0bHkgcHJvaGli
aXRlZC4NCj4gPiA+IElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhp
cyBlbWFpbCwgcGxlYXNlIG5vdGlmeSANCj4gPiA+IHRoZSBzZW5kZXIgdGhhdCB5b3UgaGF2ZSBy
ZWNlaXZlZCB0aGlzIGluIGVycm9yIGJ5IHJlcGx5aW5nIHRvIA0KPiA+ID4gdGhpcyBtZXNzYWdl
LiBUaGVuLCBwbGVhc2UgZGVsZXRlIGl0IGZyb20geW91ciBzeXN0ZW0uIE91ciBQcml2YWN5IA0K
PiA+ID4gUG9saWN5IGlzIGF2YWlsYWJsZSBoZXJlIGh0dHBzOi8vd3d3Lm1zaS5jb20vcGFnZS9w
cml2YWN5LXBvbGljeS4gVGhhbmsgeW91Lg0KPiA+DQo+ID4NCj4gPg0KPiA+IC0tDQo+ID4gUmlj
YXJkbyBSaWJhbGRhDQo+ID4NCj4gPg0KPiA+ICoqKioqQ09ORklERU5USUFMIElORk9STUFUSU9O
KioqKioNCj4gPg0KPiA+IFRoaXMgZW1haWwgaXMgaW50ZW5kZWQgb25seSBmb3IgdGhlIHVzZSBv
ZiB0aGUgcGVyc29uIG9yIGVudGl0eSB0byANCj4gPiB3aG9tIGl0IGlzIGFkZHJlc3NlZCBhbmQg
Y29udGFpbnMgaW5mb3JtYXRpb24gdGhhdCBtYXkgYmUgc3ViamVjdCB0byANCj4gPiBhbmQvb3Ig
bWF5IGJlIHJlc3RyaWN0ZWQgZnJvbSBkaXNjbG9zdXJlIGJ5IGNvbnRyYWN0IG9yIGFwcGxpY2Fi
bGUgDQo+ID4gbGF3LiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRo
aXMgZW1haWwsIGJlIGFkdmlzZWQgDQo+ID4gdGhhdCBhbnkgZGlzY2xvc3VyZSwgY29weSwgZGlz
dHJpYnV0aW9uIG9yIHVzZSBvZiB0aGUgY29udGVudHMgb2YgdGhpcyBtZXNzYWdlIGlzIHN0cmlj
dGx5IHByb2hpYml0ZWQuDQo+ID4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVu
dCBvZiB0aGlzIGVtYWlsLCBwbGVhc2Ugbm90aWZ5IA0KPiA+IHRoZSBzZW5kZXIgdGhhdCB5b3Ug
aGF2ZSByZWNlaXZlZCB0aGlzIGluIGVycm9yIGJ5IHJlcGx5aW5nIHRvIHRoaXMgDQo+ID4gbWVz
c2FnZS4gVGhlbiwgcGxlYXNlIGRlbGV0ZSBpdCBmcm9tIHlvdXIgc3lzdGVtLiBPdXIgUHJpdmFj
eSBQb2xpY3kgDQo+ID4gaXMgYXZhaWxhYmxlIGhlcmUgaHR0cHM6Ly93d3cubXNpLmNvbS9wYWdl
L3ByaXZhY3ktcG9saWN5LiBUaGFuayB5b3UuDQo+DQo+DQo+DQo+IC0tDQo+IFJpY2FyZG8gUmli
YWxkYQ0KPg0KPg0KPiAqKioqKkNPTkZJREVOVElBTCBJTkZPUk1BVElPTioqKioqDQo+DQo+IFRo
aXMgZW1haWwgaXMgaW50ZW5kZWQgb25seSBmb3IgdGhlIHVzZSBvZiB0aGUgcGVyc29uIG9yIGVu
dGl0eSB0byANCj4gd2hvbSBpdCBpcyBhZGRyZXNzZWQgYW5kIGNvbnRhaW5zIGluZm9ybWF0aW9u
IHRoYXQgbWF5IGJlIHN1YmplY3QgdG8gDQo+IGFuZC9vciBtYXkgYmUgcmVzdHJpY3RlZCBmcm9t
IGRpc2Nsb3N1cmUgYnkgY29udHJhY3Qgb3IgYXBwbGljYWJsZSANCj4gbGF3LiBJZiB5b3UgYXJl
IG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZW1haWwsIGJlIGFkdmlzZWQgDQo+
IHRoYXQgYW55IGRpc2Nsb3N1cmUsIGNvcHksIGRpc3RyaWJ1dGlvbiBvciB1c2Ugb2YgdGhlIGNv
bnRlbnRzIG9mIHRoaXMgbWVzc2FnZSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLg0KPiBJZiB5b3Ug
YXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZW1haWwsIHBsZWFzZSBub3Rp
ZnkgdGhlIA0KPiBzZW5kZXIgdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGluIGVycm9yIGJ5
IHJlcGx5aW5nIHRvIHRoaXMgDQo+IG1lc3NhZ2UuIFRoZW4sIHBsZWFzZSBkZWxldGUgaXQgZnJv
bSB5b3VyIHN5c3RlbS4gT3VyIFByaXZhY3kgUG9saWN5IA0KPiBpcyBhdmFpbGFibGUgaGVyZSBo
dHRwczovL3d3dy5tc2kuY29tL3BhZ2UvcHJpdmFjeS1wb2xpY3kuIFRoYW5rIHlvdS4NCg0KDQoN
Ci0tDQpSaWNhcmRvIFJpYmFsZGENCg0KDQoqKioqKkNPTkZJREVOVElBTCBJTkZPUk1BVElPTioq
KioqDQoNClRoaXMgZW1haWwgaXMgaW50ZW5kZWQgb25seSBmb3IgdGhlIHVzZSBvZiB0aGUgcGVy
c29uIG9yIGVudGl0eSB0byB3aG9tIGl0IGlzDQphZGRyZXNzZWQgYW5kIGNvbnRhaW5zIGluZm9y
bWF0aW9uIHRoYXQgbWF5IGJlIHN1YmplY3QgdG8gYW5kL29yIG1heSBiZQ0KcmVzdHJpY3RlZCBm
cm9tIGRpc2Nsb3N1cmUgYnkgY29udHJhY3Qgb3IgYXBwbGljYWJsZSBsYXcuIElmIHlvdSBhcmUg
bm90IHRoZSANCmludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGVtYWlsLCBiZSBhZHZpc2VkIHRo
YXQgYW55IGRpc2Nsb3N1cmUsIGNvcHksIA0KZGlzdHJpYnV0aW9uIG9yIHVzZSBvZiB0aGUgY29u
dGVudHMgb2YgdGhpcyBtZXNzYWdlIGlzIHN0cmljdGx5IHByb2hpYml0ZWQuIA0KSWYgeW91IGFy
ZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGVtYWlsLCBwbGVhc2Ugbm90aWZ5
IHRoZSBzZW5kZXIgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgaW4gZXJyb3IgYnkgcmVw
bHlpbmcgdG8gdGhpcyBtZXNzYWdlLiBUaGVuLCANCnBsZWFzZSBkZWxldGUgaXQgZnJvbSB5b3Vy
IHN5c3RlbS4gT3VyIFByaXZhY3kgUG9saWN5IGlzIGF2YWlsYWJsZSBoZXJlIA0KaHR0cHM6Ly93
d3cubXNpLmNvbS9wYWdlL3ByaXZhY3ktcG9saWN5LiBUaGFuayB5b3Uu

