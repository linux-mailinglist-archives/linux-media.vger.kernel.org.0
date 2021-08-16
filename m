Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B08C33ECDBC
	for <lists+linux-media@lfdr.de>; Mon, 16 Aug 2021 06:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbhHPE0z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Aug 2021 00:26:55 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:5472 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229485AbhHPE0z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Aug 2021 00:26:55 -0400
X-UUID: 9686e57aec0644c88bce80c319b74b2d-20210816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=75z41JHo4jjGziE47FcivuBdbVLRxrMx8X85H0Fok1E=;
        b=QG23s9iFvX+/HS6ezsX/KYUscQyV+keJ1+w3j6EZUC7SHd1BIykamo97NtsoDTnJzwYrBj0kFYTJ3r4gqS1W0Exf37A/QYzXRNB4O5xoQXS9G7XbuP3psYuRzK/SpANyMjhnXFVzywyBFpuY5SUtEmFMFIyxTcFjtsE6OaMuxic=;
X-UUID: 9686e57aec0644c88bce80c319b74b2d-20210816
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <houlong.wei@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1769316373; Mon, 16 Aug 2021 12:26:20 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 16 Aug
 2021 12:26:06 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 12:26:06 +0800
Message-ID: <484e199d23a09d79f121ea37eb9e7d95eabfd886.camel@mediatek.com>
Subject: Re: [PATCH] media: mtk-mdp: make mtk_mdp_comp_init static
From:   houlong wei <houlong.wei@mediatek.com>
To:     Eizan Miyamoto <eizan@chromium.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>,
        "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>,
        "Andrew-CT Chen =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?=" 
        <Andrew-CT.Chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Minghsiu Tsai =?UTF-8?Q?=28=E8=94=A1=E6=98=8E=E4=BF=AE=29?=" 
        <Minghsiu.Tsai@mediatek.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>, <houlong.wei@mediatek.com>
Date:   Mon, 16 Aug 2021 12:26:07 +0800
In-Reply-To: <20210811171512.1.I4a34d99ace27ad2fe55e22c90244d3bba2c29bab@changeid>
References: <20210811171512.1.I4a34d99ace27ad2fe55e22c90244d3bba2c29bab@changeid>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 67B8FCEFAC2E30AB80B2D6E2060C2D7B791BC54275D89F0FBD2475ECC40D88E32000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gV2VkLCAyMDIxLTA4LTExIGF0IDE1OjE1ICswODAwLCBFaXphbiBNaXlhbW90byB3cm90ZToN
Cj4gVGhpcyBmdW5jdGlvbiBpc24ndCBhbmQgZG9lc24ndCBuZWVkIHRvIGJlIHVzZWQgb3V0c2lk
ZSBvZg0KPiBtdGtfbWRwX2NvbXAuYw0KPiANCj4gVGhpcyBwYXRjaCBkZXBlbmRzIG9uIGFuZCBp
cyBhIGZvbGxvdy11cCB0bw0KPiANCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVj
dC9saW51eC1tZWRpYXRlay9saXN0Lz9zZXJpZXM9NTI0OTI5DQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBFaXphbiBNaXlhbW90byA8ZWl6YW5AY2hyb21pdW0ub3JnPg0KPiAtLS0NCg0KUmV2aWV3ZWQt
Ynk6IEhvdWxvbmcgV2VpIDxob3Vsb25nLndlaUBtZWRpYXRlay5jb20+DQoNCj4gIGRyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbXRrLW1kcC9tdGtfbWRwX2NvbXAuYyB8IDIgKy0NCj4gIGRyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbXRrLW1kcC9tdGtfbWRwX2NvbXAuaCB8IDIgLS0NCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstbWRwL210a19tZHBfY29tcC5jDQo+IGIvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstbWRwL210a19tZHBfY29tcC5jDQo+IGluZGV4IDk1Mjc2
NDlkZTk4ZS4uMmNmOGYxODY0ZjhjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL210ay1tZHAvbXRrX21kcF9jb21wLmMNCj4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9tdGstbWRwL210a19tZHBfY29tcC5jDQo+IEBAIC0yMzQsNyArMjM0LDcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBjb21wb25lbnRfb3BzDQo+IG10a19tZHBfY29tcG9uZW50X29wcyA9IHsNCj4g
IAkudW5iaW5kID0gbXRrX21kcF9jb21wX3VuYmluZCwNCj4gIH07DQo+ICANCj4gLWludCBtdGtf
bWRwX2NvbXBfaW5pdChzdHJ1Y3QgbXRrX21kcF9jb21wICpjb21wLCBzdHJ1Y3QgZGV2aWNlICpk
ZXYpDQo+ICtzdGF0aWMgaW50IG10a19tZHBfY29tcF9pbml0KHN0cnVjdCBtdGtfbWRwX2NvbXAg
KmNvbXAsIHN0cnVjdA0KPiBkZXZpY2UgKmRldikNCj4gIHsNCj4gIAlzdHJ1Y3QgZGV2aWNlX25v
ZGUgKmxhcmJfbm9kZTsNCj4gIAlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpsYXJiX3BkZXY7DQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1tZHAvbXRrX21kcF9jb21w
LmgNCj4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1tZHAvbXRrX21kcF9jb21wLmgNCj4g
aW5kZXggZTNkNmFlZjUyODY5Li5hYTY0NDJjYzhjMWQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbXRrLW1kcC9tdGtfbWRwX2NvbXAuaA0KPiArKysgYi9kcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL210ay1tZHAvbXRrX21kcF9jb21wLmgNCj4gQEAgLTIxLDggKzIxLDYgQEAg
c3RydWN0IG10a19tZHBfY29tcCB7DQo+ICAJc3RydWN0IGRldmljZQkJKmxhcmJfZGV2Ow0KPiAg
fTsNCj4gIA0KPiAtaW50IG10a19tZHBfY29tcF9pbml0KHN0cnVjdCBtdGtfbWRwX2NvbXAgKmNv
bXAsIHN0cnVjdCBkZXZpY2UNCj4gKmRldik7DQo+IC0NCj4gIGludCBtdGtfbWRwX2NvbXBfcG93
ZXJfb24oc3RydWN0IG10a19tZHBfY29tcCAqY29tcCk7DQo+ICBpbnQgbXRrX21kcF9jb21wX3Bv
d2VyX29mZihzdHJ1Y3QgbXRrX21kcF9jb21wICpjb21wKTsNCj4gIA0KPiAtLSANCj4gMi4zMi4w
LjYwNS5nOGRjZTlmMjQyMi1nb29nDQo+IA0K

