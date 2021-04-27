Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0CEC36C706
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 15:30:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236347AbhD0Nas (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 09:30:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235875AbhD0Nas (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 09:30:48 -0400
Received: from ustc.edu.cn (email6.ustc.edu.cn [IPv6:2001:da8:d800::8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2346DC061574;
        Tue, 27 Apr 2021 06:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
        In-Reply-To:References:Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-ID; bh=ALd7aUrx9C59XSdS79bV6IteDhqku7qQ78rk
        F6VYWmo=; b=ZtGI+BiP9cZdhgHxtn3nU3w+pZZAPv/FQC4xqrheGqhpB28nV6O1
        EDwJCkmFo1Pn3cQZk2Eg2xosVhN2ZkwBZDav34aMRXq1E3HFGxpX1QjPW14WZOQW
        ZOQG9xIgEnNHE6cHhd5wjAGBDIaLBv1oDkR1/k2LIl3B45FVAuuDugY=
Received: by ajax-webmail-newmailweb.ustc.edu.cn (Coremail) ; Tue, 27 Apr
 2021 21:29:57 +0800 (GMT+08:00)
X-Originating-IP: [104.245.96.151]
Date:   Tue, 27 Apr 2021 21:29:57 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   lyl2019@mail.ustc.edu.cn
To:     "Sylwester Nawrocki" <snawrocki@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        s.nawrocki@samsung.com, mchehab@kernel.org, krzk@kernel.org
Subject: Re: Re: [PATCH v2] media:exynos4-is: Fix a use after free in
 isp_video_release
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT3.0.8 dev build
 20190610(cb3344cf) Copyright (c) 2002-2021 www.mailtech.cn ustc-xl
In-Reply-To: <a56d14d8-5be6-24ff-24f1-80274320dfe5@kernel.org>
References: <20210427060255.3318-1-lyl2019@mail.ustc.edu.cn>
 <a56d14d8-5be6-24ff-24f1-80274320dfe5@kernel.org>
X-SendMailWithSms: false
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <5233bec4.64281.1791385ab97.Coremail.lyl2019@mail.ustc.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: LkAmygB3L1TWEYhgeF1TAA--.11W
X-CM-SenderInfo: ho1ojiyrz6zt1loo32lwfovvfxof0/1tbiAQsEBlQhn6cqjwAIso
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQoNCg0KPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0tDQo+IOWPkeS7tuS6ujogIlN5bHdlc3RlciBO
YXdyb2NraSIgPHNuYXdyb2NraUBrZXJuZWwub3JnPg0KPiDlj5HpgIHml7bpl7Q6IDIwMjEtMDQt
MjcgMTg6MzY6NDggKOaYn+acn+S6jCkNCj4g5pS25Lu25Lq6OiAiTHYgWXVubG9uZyIgPGx5bDIw
MTlAbWFpbC51c3RjLmVkdS5jbj4NCj4g5oqE6YCBOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5v
cmcsIGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZywgbGludXgtc2Ftc3VuZy1z
b2NAdmdlci5rZXJuZWwub3JnLCBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnLCBzLm5hd3Jv
Y2tpQHNhbXN1bmcuY29tLCBtY2hlaGFiQGtlcm5lbC5vcmcsIGtyemtAa2VybmVsLm9yZw0KPiDk
uLvpopg6IFJlOiBbUEFUQ0ggdjJdIG1lZGlhOmV4eW5vczQtaXM6IEZpeCBhIHVzZSBhZnRlciBm
cmVlIGluIGlzcF92aWRlb19yZWxlYXNlDQo+IA0KPiBPbiAyNy4wNC4yMDIxIDA4OjAyLCBMdiBZ
dW5sb25nIHdyb3RlOg0KPiA+IEluIGlzcF92aWRlb19yZWxlYXNlLCBmaWxlLT5wcml2YXRlX2Rh
dGEgaXMgZnJlZWQgdmlhDQo+ID4gX3ZiMl9mb3BfcmVsZWFzZSgpLT52NGwyX2ZoX3JlbGVhc2Uo
KS4gQnV0IHRoZSBmcmVlZA0KPiA+IGZpbGUtPnByaXZhdGVfZGF0YSBpcyBzdGlsbCB1c2VkIGlu
IHY0bDJfZmhfaXNfc2luZ3VsYXJfZmlsZSgpDQo+ID4gLT52NGwyX2ZoX2lzX3Npbmd1bGFyKGZp
bGUtPnByaXZhdGVfZGF0YSksIHdoaWNoIGlzIGEgdXNlDQo+ID4gYWZ0ZXIgZnJlZSBidWcuDQo+
ID4gDQo+ID4gTXkgcGF0Y2ggc2V0IGZpbGUtPnByaXZhdGVfZGF0YSB0byBOVUxMIGFmdGVyIF92
YjJfZm9wX3JlbGVhc2UoKQ0KPiA+IHRvIGF2b2lkIHRoZSB1c2UgYWZ0ZXIgZnJlZS4NCj4gPiAN
Cj4gPiBGaXhlczogMzQ5NDdiOGFlYmUzZiAoIlttZWRpYV0gZXh5bm9zNC1pczogQWRkIHRoZSBG
SU1DLUlTIElTUCBjYXB0dXJlIERNQSBkcml2ZXIiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IEx2IFl1
bmxvbmcgPGx5bDIwMTlAbWFpbC51c3RjLmVkdS5jbj4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vZXh5bm9zNC1pcy9maW1jLWlzcC12aWRlby5jIHwgMyArKy0NCj4gPiAg
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiANCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9leHlub3M0LWlzL2ZpbWMtaXNw
LXZpZGVvLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2V4eW5vczQtaXMvZmltYy1pc3Atdmlk
ZW8uYw0KPiA+IGluZGV4IDYxMmI5ODcyYWZjOC4uMmUwNDU4OTA2OGI0IDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vZXh5bm9zNC1pcy9maW1jLWlzcC12aWRlby5jDQo+
ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9leHlub3M0LWlzL2ZpbWMtaXNwLXZpZGVv
LmMNCj4gPiBAQCAtMzE1LDcgKzMxNSw4IEBAIHN0YXRpYyBpbnQgaXNwX3ZpZGVvX3JlbGVhc2Uo
c3RydWN0IGZpbGUgKmZpbGUpDQo+ID4gICAJfQ0KPiA+ICAgDQo+ID4gICAJX3ZiMl9mb3BfcmVs
ZWFzZShmaWxlLCBOVUxMKTsNCj4gPiAtDQo+ID4gKwlmaWxlLT5wcml2YXRlX2RhdGEgPSBOVUxM
Ow0KPiANCj4gPiAgIAlpZiAodjRsMl9maF9pc19zaW5ndWxhcl9maWxlKGZpbGUpKSB7DQo+ID4g
ICAJCWZpbWNfcGlwZWxpbmVfY2FsbCgmaXZjLT52ZSwgY2xvc2UpOw0KPiA+ICAgDQo+IA0KPiBU
aGFuayB5b3UgZm9yIHRoZSBwYXRjaC4gVG8gZW5zdXJlIHRoZSBwaXBlbGluZSBzdG9wIGNhbGwg
aXMgZG9uZQ0KPiBvbmx5IHdoZW4gdGhlIGxhc3QgZmlsZSBoYW5kbGUgaXMgcmVsZWFzZWQgd2Ug
d291bGQgbmVlZCBzb21ldGhpbmcNCj4gYXMgYmVsb3cuDQo+IA0KPiAtLS0tLS0tLTg8LS0tLS0t
LS0tDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2V4eW5vczQtaXMvZmlt
Yy1pc3AtdmlkZW8uYyANCj4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2V4eW5vczQtaXMvZmlt
Yy1pc3AtdmlkZW8uYw0KPiBpbmRleCA2MTJiOTg3MmFmYzguLjMzMzVmZWM1MDljYiAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9leHlub3M0LWlzL2ZpbWMtaXNwLXZpZGVv
LmMNCj4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9leHlub3M0LWlzL2ZpbWMtaXNwLXZp
ZGVvLmMNCj4gQEAgLTMwNiwxNyArMzA2LDIwIEBAIHN0YXRpYyBpbnQgaXNwX3ZpZGVvX3JlbGVh
c2Uoc3RydWN0IGZpbGUgKmZpbGUpDQo+ICAgICAgICAgIHN0cnVjdCBmaW1jX2lzX3ZpZGVvICpp
dmMgPSAmaXNwLT52aWRlb19jYXB0dXJlOw0KPiAgICAgICAgICBzdHJ1Y3QgbWVkaWFfZW50aXR5
ICplbnRpdHkgPSAmaXZjLT52ZS52ZGV2LmVudGl0eTsNCj4gICAgICAgICAgc3RydWN0IG1lZGlh
X2RldmljZSAqbWRldiA9IGVudGl0eS0+Z3JhcGhfb2JqLm1kZXY7DQo+ICsgICAgICAgYm9vbCBp
c19zaW5ndWxhcl9maWxlOw0KPiANCj4gICAgICAgICAgbXV0ZXhfbG9jaygmaXNwLT52aWRlb19s
b2NrKTsNCj4gDQo+IC0gICAgICAgaWYgKHY0bDJfZmhfaXNfc2luZ3VsYXJfZmlsZShmaWxlKSAm
JiBpdmMtPnN0cmVhbWluZykgew0KPiArICAgICAgIGlzX3Npbmd1bGFyX2ZpbGUgPSB2NGwyX2Zo
X2lzX3Npbmd1bGFyX2ZpbGUoZmlsZSk7DQo+ICsNCj4gKyAgICAgICBpZiAoaXNfc2luZ3VsYXJf
ZmlsZSAmJiBpdmMtPnN0cmVhbWluZykgew0KPiAgICAgICAgICAgICAgICAgIG1lZGlhX3BpcGVs
aW5lX3N0b3AoZW50aXR5KTsNCj4gICAgICAgICAgICAgICAgICBpdmMtPnN0cmVhbWluZyA9IDA7
DQo+ICAgICAgICAgIH0NCj4gDQo+ICAgICAgICAgIF92YjJfZm9wX3JlbGVhc2UoZmlsZSwgTlVM
TCk7DQo+IA0KPiAtICAgICAgIGlmICh2NGwyX2ZoX2lzX3Npbmd1bGFyX2ZpbGUoZmlsZSkpIHsN
Cj4gKyAgICAgICBpZiAoaXNfc2luZ3VsYXJfZmlsZSkgew0KPiAgICAgICAgICAgICAgICAgIGZp
bWNfcGlwZWxpbmVfY2FsbCgmaXZjLT52ZSwgY2xvc2UpOw0KPiANCj4gICAgICAgICAgICAgICAg
ICBtdXRleF9sb2NrKCZtZGV2LT5ncmFwaF9tdXRleCk7DQo+IC0tLS0tLS0tODwtLS0tLS0tLS0N
Cj4gDQo+IFJlZ2FyZHMsDQo+IFN5bHdlc3Rlcg0KDQpPaywgdGhhbmtzIGZvciB5b3VyIHJldmll
dyBhbmQgaGVscC4NCkkgaGF2ZSBjb3JyZWN0ZWQgbXkgcGF0Y2ggYW5kIHNlbnQgdGhlIFBBVENI
IHYzIGZvciB5b3UgcmV2aWV3IGFnYWluLg0KDQpUaGFua3MuDQo=
