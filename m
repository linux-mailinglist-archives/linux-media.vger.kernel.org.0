Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47B3A468E8B
	for <lists+linux-media@lfdr.de>; Mon,  6 Dec 2021 02:22:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230344AbhLFBZY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Dec 2021 20:25:24 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:60140 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230037AbhLFBZX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Dec 2021 20:25:23 -0500
X-UUID: 9d0db40ee91b4d1b9233c69eb6189875-20211206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=tX7cN3ukbg0v43Eh/yJy9TmMVbRaEEVkwV5mEsEmSiQ=;
        b=rW9PPy3azK1jLN6kzLd1Gq1ky86rz6EnGoctWB7UIA8rwN2Kj3VDkUjPCN+sv46i2LF0YEGMNWmvhFu+/fcIiaYm598j5tLCoycS7ryoPkYTfNiUKJCO+nC96UlI5ZUErS/LHi/I5EO1ID3VXaEoMRZcvrKqi0+PA4tUMdkyc18=;
X-UUID: 9d0db40ee91b4d1b9233c69eb6189875-20211206
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
        (envelope-from <houlong.wei@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 2070294718; Mon, 06 Dec 2021 09:21:51 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 6 Dec 2021 09:21:50 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 6 Dec 2021 09:21:49 +0800
Message-ID: <aee15e0fae71436c0e75e2b7cea0638da5d8b707.camel@mediatek.com>
Subject: Re: [PATCH v5] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
From:   houlong wei <houlong.wei@mediatek.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     Alexandre Courbot <acourbot@chromium.org>,
        "kernel@collabora.com" <kernel@collabora.com>,
        "dafna3@gmail.com" <dafna3@gmail.com>,
        Tiffany Lin =?UTF-8?Q?=28=E6=9E=97=E6=85=A7=E7=8F=8A=29?= 
        <tiffany.lin@mediatek.com>,
        Andrew-CT Chen =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?= 
        <Andrew-CT.Chen@mediatek.com>,
        Minghsiu Tsai =?UTF-8?Q?=28=E8=94=A1=E6=98=8E=E4=BF=AE=29?= 
        <Minghsiu.Tsai@mediatek.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
        <houlong.wei@mediatek.com>, <irui.wang@mediatek.com>
Date:   Mon, 6 Dec 2021 09:21:43 +0800
In-Reply-To: <20211204144732.13472-1-dafna.hirschfeld@collabora.com>
References: <20211204144732.13472-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Y2MgbXRrLXZwdSBleHBlcnQgaXJ1aS53YW5nLg0KDQpPbiBTYXQsIDIwMjEtMTItMDQgYXQgMjI6
NDcgKzA4MDAsIERhZm5hIEhpcnNjaGZlbGQgd3JvdGU6DQo+IEZyb206IEFsZXhhbmRyZSBDb3Vy
Ym90IDxhY291cmJvdEBjaHJvbWl1bS5vcmc+DQo+IA0KPiBXaGVuIHJ1bm5pbmcgbWVtY3B5X3Rv
aW86DQo+IG1lbWNweV90b2lvKHNlbmRfb2JqLT5zaGFyZV9idWYsIGJ1ZiwgbGVuKTsNCj4gaXQg
d2FzIGZvdW5kIHRoYXQgZXJyb3JzIGFwcGVhciBpZiBsZW4gaXMgbm90IGEgbXVsdGlwbGUgb2Yg
ODoNCj4gDQo+IFs1OC4zNTA4NDFdIG10ay1tZHAgMTQwMDEwMDAucmRtYTogcHJvY2Vzc2luZyBm
YWlsZWQ6IC0yMg0KPiANCj4gVGhpcyBpcyBiZWNhdXNlIGluIEFSTTY0LCBtZW1jcHlfdG9pbyBk
b2VzIGJ5dGUtc2l6ZSBhY2Nlc3MNCj4gd2hlbiB0aGUgbGVuZ3RoIGlzIG5vdCBhIG11bHRpcGxl
IG9mIDggd2hpbGUgYWNjZXNzIHRvIHRoZQ0KPiB2cHUgaW9tZW0gbXVzdCBiZSA0IGFsaWduZWQu
DQo+IA0KPiBUaGlzIHBhdGNoIGVuc3VyZXMgdGhlIGNvcHkgb2YgYSBtdWx0aXBsZSBvZiA4IHNp
emUgYnkgY2FsbGluZw0KPiByb3VuZF91cChsZW4sIDgpIHdoZW4gY29weWluZw0KPiANCj4gRml4
ZXM6IGU2NTk5YWRmYWQzMCAoIm1lZGlhOiBtdGstdnB1OiBhdm9pZCB1bmFsaWduZWQgYWNjZXNz
IHRvIERUQ00NCj4gYnVmZmVyLiIpDQo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBDb3VyYm90
IDxhY291cmJvdEBjaHJvbWl1bS5vcmc+DQo+IFNpZ25lZC1vZmYtYnk6IERhZm5hIEhpcnNjaGZl
bGQgPGRhZm5hLmhpcnNjaGZlbGRAY29sbGFib3JhLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEhvdWxv
bmcgV2VpIDxob3Vsb25nLndlaUBtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiBjaGFuZ2VzIHNpbmNl
IHY0Og0KPiAxLiByZXBsYWNlIGRhdGFbU0hBUkVfQlVGX1NJWkVdOyB3aXRoIGRhdGFbc2l6ZW9m
KHNlbmRfb2JqLQ0KPiA+c2hhcmVfYnVmKV0NCj4gMi4gQWRkIHRoZSBleHBsYW5hdGlvbiBmb3Ig
dGhlIGZhaWx1cmUgaW4gY29tbWl0IGxvZyBhbmQgaW5saW5lIGRvYw0KPiANCj4gY2hhbmdlcyBz
aW5jZSB2MzoNCj4gMS4gbXVsdGlsZSAtPiBtdWx0aXBsZQ0KPiAyLiBhZGQgaW5saW5lIGRvYw0K
PiANCj4gY2hhbmdlcyBzaW5jZSB2MjoNCj4gMS4gZG8gdGhlIGV4dHJhIGNvcHkgb25seSBpZiBs
ZW4gaXMgbm90IG11bHRpcGxlIG9mIDgNCj4gDQo+IGNoYW5nZXMgc2luY2UgdjE6DQo+IDEuIGNo
YW5nZSBzaWduLW9mZi1ieSB0YWdzDQo+IDIuIGNoYW5nZSB2YWx1ZXMgdG8gbWVtc2V0DQo+IA0K
PiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdnB1L210a192cHUuYyB8IDE3ICsrKysrKysr
KysrKysrKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZwdS9t
dGtfdnB1LmMNCj4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12cHUvbXRrX3ZwdS5jDQo+
IGluZGV4IDdmMTY0N2RhMGFkZS4uMmVmOTNkYjIzOWI5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL210ay12cHUvbXRrX3ZwdS5jDQo+ICsrKyBiL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vbXRrLXZwdS9tdGtfdnB1LmMNCj4gQEAgLTM0OSw3ICszNDksMjIgQEAgaW50IHZw
dV9pcGlfc2VuZChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LA0KPiAgCQl9DQo+ICAJfSB3
aGlsZSAodnB1X2NmZ19yZWFkbCh2cHUsIEhPU1RfVE9fVlBVKSk7DQo+ICANCj4gLQltZW1jcHlf
dG9pbyhzZW5kX29iai0+c2hhcmVfYnVmLCBidWYsIGxlbik7DQo+ICsJLyoNCj4gKwkgKiBPbiBB
cm02NCwgdGhlIG1lbWNweV90b2lvIGRvZXMgYnl0ZS1zaXplIGFjY2VzcyBhcyBsb25nIGFzDQo+
IGFkZHJlc3Mgb3IgbGVuZ3RoIGFyZQ0KPiArCSAqIG5vdCA4IGFsaWduZWQuIEFjY2VzcyB0byB0
aGUgdnB1IGlvbWVtIG11c3QgYmUgNCBhbGlnbmVkLg0KPiBCeXRlLXNpemUgYWNjZXNzIGlzDQo+
ICsJICogbm90IGFsbG93ZWQgYW5kIGNhdXNlIHByb2Nlc3NpbmcgdG8gZmFpbC4gVGhlcmVmb3Jl
IG1ha2UNCj4gc3VyZSB0aGUgbGVuZ3RoDQo+ICsJICogc2VudCB0byBtZW1jcHlfdG9pbyBpcyBh
IG11bHRpcGx5IG9mIDguDQo+ICsJICovDQo+ICsJaWYgKGxlbiAlIDggIT0gMCkgew0KPiArCQl1
bnNpZ25lZCBjaGFyIGRhdGFbc2l6ZW9mKHNlbmRfb2JqLT5zaGFyZV9idWYpXTsNCj4gKw0KPiAr
CQltZW1zZXQoZGF0YSArIGxlbiwgMCwgc2l6ZW9mKGRhdGEpIC0gbGVuKTsNCj4gKwkJbWVtY3B5
KGRhdGEsIGJ1ZiwgbGVuKTsNCj4gKwkJbWVtY3B5X3RvaW8oc2VuZF9vYmotPnNoYXJlX2J1Ziwg
ZGF0YSwgcm91bmRfdXAobGVuLA0KPiA4KSk7DQo+ICsJfSBlbHNlIHsNCj4gKwkJbWVtY3B5X3Rv
aW8oc2VuZF9vYmotPnNoYXJlX2J1ZiwgYnVmLCBsZW4pOw0KPiArCX0NCj4gKw0KPiAgCXdyaXRl
bChsZW4sICZzZW5kX29iai0+bGVuKTsNCj4gIAl3cml0ZWwoaWQsICZzZW5kX29iai0+aWQpOw0K
PiAgDQo+IC0tIA0KPiAyLjE3LjENCj4gDQo=

