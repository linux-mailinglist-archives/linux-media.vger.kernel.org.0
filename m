Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 455A9374FEF
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 09:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233271AbhEFHUT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 03:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbhEFHUS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 May 2021 03:20:18 -0400
Received: from ustc.edu.cn (email6.ustc.edu.cn [IPv6:2001:da8:d800::8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BE833C061574;
        Thu,  6 May 2021 00:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
        In-Reply-To:References:Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-ID; bh=FBOZ4Wnj05nzGETLo6GOsoIxerikGh7kei6G
        4HU8i9A=; b=RscCmcbR6lVf4NOo87d/vCwLTBFJe7I3M9RDVDWIYauQ1WdQzkPB
        FnAGVz93PGpOrAJ50TFY3r3sPCTUlHLzXrgifeOliXMQKev4JgppKYX86xUsf+vw
        KPSdL1pRsR4WsKfOLYzZhPctWCjBZMvXZpGjxqaRr1jnAaeQkLBM9+g=
Received: by ajax-webmail-newmailweb.ustc.edu.cn (Coremail) ; Thu, 6 May
 2021 15:19:09 +0800 (GMT+08:00)
X-Originating-IP: [202.38.69.14]
Date:   Thu, 6 May 2021 15:19:09 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   lyl2019@mail.ustc.edu.cn
To:     "Hans Verkuil" <hverkuil@xs4all.nl>
Cc:     s.nawrocki@samsung.com, mchehab@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH v3] media:exynos4-is: Fix a use after free in
 isp_video_release
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT3.0.8 dev build
 20190610(cb3344cf) Copyright (c) 2002-2021 www.mailtech.cn ustc-xl
In-Reply-To: <44f264d9-e039-66b6-6e4b-1a5b3c386aa4@xs4all.nl>
References: <20210427132734.5212-1-lyl2019@mail.ustc.edu.cn>
 <44f264d9-e039-66b6-6e4b-1a5b3c386aa4@xs4all.nl>
X-SendMailWithSms: false
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <3f2f155c.72fa7.179408b6b2e.Coremail.lyl2019@mail.ustc.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: LkAmygAnLJxtmJNgpDWSAA--.3W
X-CM-SenderInfo: ho1ojiyrz6zt1loo32lwfovvfxof0/1tbiAQsNBlQhn6tCNwAAs1
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQoNCg0KPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0tDQo+IOWPkeS7tuS6ujogIkhhbnMgVmVya3Vp
bCIgPGh2ZXJrdWlsQHhzNGFsbC5ubD4NCj4g5Y+R6YCB5pe26Ze0OiAyMDIxLTA1LTA1IDE3OjMx
OjA0ICjmmJ/mnJ/kuIkpDQo+IOaUtuS7tuS6ujogIkx2IFl1bmxvbmciIDxseWwyMDE5QG1haWwu
dXN0Yy5lZHUuY24+LCBzLm5hd3JvY2tpQHNhbXN1bmcuY29tLCBtY2hlaGFiQGtlcm5lbC5vcmcs
IGtyemtAa2VybmVsLm9yZw0KPiDmioTpgIE6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZywg
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnLCBsaW51eC1zYW1zdW5nLXNvY0B2
Z2VyLmtlcm5lbC5vcmcsIGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4g5Li76aKYOiBS
ZTogW1BBVENIIHYzXSBtZWRpYTpleHlub3M0LWlzOiBGaXggYSB1c2UgYWZ0ZXIgZnJlZSBpbiBp
c3BfdmlkZW9fcmVsZWFzZQ0KPiANCj4gSGkgTHYgWXVubG9uZywNCj4gDQo+IE9uIDI3LzA0LzIw
MjEgMTU6MjcsIEx2IFl1bmxvbmcgd3JvdGU6DQo+ID4gSW4gaXNwX3ZpZGVvX3JlbGVhc2UsIGZp
bGUtPnByaXZhdGVfZGF0YSBpcyBmcmVlZCB2aWENCj4gPiBfdmIyX2ZvcF9yZWxlYXNlKCktPnY0
bDJfZmhfcmVsZWFzZSgpLiBCdXQgdGhlIGZyZWVkDQo+ID4gZmlsZS0+cHJpdmF0ZV9kYXRhIGlz
IHN0aWxsIHVzZWQgaW4gdjRsMl9maF9pc19zaW5ndWxhcl9maWxlKCkNCj4gPiAtPnY0bDJfZmhf
aXNfc2luZ3VsYXIoZmlsZS0+cHJpdmF0ZV9kYXRhKSwgd2hpY2ggaXMgYSB1c2UNCj4gPiBhZnRl
ciBmcmVlIGJ1Zy4NCj4gPiANCj4gPiBNeSBwYXRjaCBzZXRzIGZpbGUtPnByaXZhdGVfZGF0YSB0
byBOVUxMIGFmdGVyIF92YjJfZm9wX3JlbGVhc2UoKQ0KPiA+IHRvIGF2b2lkIHRoZSB1c2UgYWZ0
ZXIgZnJlZSwgYW5kIHVzZXMgYSB2YXJpYWJsZSAnaXNfc2luZ3VsYXJfZmlsZScNCj4gPiB0byBr
ZWVwIHRoZSBvcmlnaW5hbCBmdW5jdGlvbiB1bmNoYW5nZWQuDQo+IA0KPiBBY3R1YWxseSwgaXQg
aXMgdGhlIHVzZSBvZiAnaXNfc2luZ3VsYXJfZmlsZScgdGhhdCBmaXhlcyB0aGUgYnVnLA0KPiB0
aGUgJ2ZpbGUtPnByaXZhdGVfZGF0YSA9IE5VTEw7JyBpcyB1bm5lY2Vzc2FyeSBoZXJlLg0KPiAN
Cj4gVGhhdCBzYWlkLCBpdCB3b3VsZCBiZSBhIHJlYWxseSBnb29kIGlkZWEgaWYgaW4gYSBzZXBh
cmF0ZSBwYXRjaCB5b3UNCj4gbWFrZSB2NGwyX2ZoX3JlbGVhc2UoKSBtb3JlIHJvYnVzdCBieSBz
ZXR0aW5nIGZpbHAtPnByaXZhdGVfZGF0YSB0bw0KPiBOVUxMIGFmdGVyIHRoZSBrZnJlZShmaCku
DQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gCUhhbnMNCj4gDQo+ID4gDQo+ID4gRml4ZXM6IDM0OTQ3
YjhhZWJlM2YgKCJbbWVkaWFdIGV4eW5vczQtaXM6IEFkZCB0aGUgRklNQy1JUyBJU1AgY2FwdHVy
ZSBETUEgZHJpdmVyIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBMdiBZdW5sb25nIDxseWwyMDE5QG1h
aWwudXN0Yy5lZHUuY24+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vZXh5
bm9zNC1pcy9maW1jLWlzcC12aWRlby5jIHwgOCArKysrKystLQ0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2V4eW5vczQtaXMvZmltYy1pc3AtdmlkZW8uYyBiL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vZXh5bm9zNC1pcy9maW1jLWlzcC12aWRlby5jDQo+ID4gaW5k
ZXggNjEyYjk4NzJhZmM4Li5jMDdkY2IwYmNjYzIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9leHlub3M0LWlzL2ZpbWMtaXNwLXZpZGVvLmMNCj4gPiArKysgYi9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL2V4eW5vczQtaXMvZmltYy1pc3AtdmlkZW8uYw0KPiA+IEBAIC0z
MDYsMTcgKzMwNiwyMSBAQCBzdGF0aWMgaW50IGlzcF92aWRlb19yZWxlYXNlKHN0cnVjdCBmaWxl
ICpmaWxlKQ0KPiA+ICAJc3RydWN0IGZpbWNfaXNfdmlkZW8gKml2YyA9ICZpc3AtPnZpZGVvX2Nh
cHR1cmU7DQo+ID4gIAlzdHJ1Y3QgbWVkaWFfZW50aXR5ICplbnRpdHkgPSAmaXZjLT52ZS52ZGV2
LmVudGl0eTsNCj4gPiAgCXN0cnVjdCBtZWRpYV9kZXZpY2UgKm1kZXYgPSBlbnRpdHktPmdyYXBo
X29iai5tZGV2Ow0KPiA+ICsJYm9vbCBpc19zaW5ndWxhcl9maWxlOw0KPiA+ICANCj4gPiAgCW11
dGV4X2xvY2soJmlzcC0+dmlkZW9fbG9jayk7DQo+ID4gIA0KPiA+IC0JaWYgKHY0bDJfZmhfaXNf
c2luZ3VsYXJfZmlsZShmaWxlKSAmJiBpdmMtPnN0cmVhbWluZykgew0KPiA+ICsJaXNfc2luZ3Vs
YXJfZmlsZSA9IHY0bDJfZmhfaXNfc2luZ3VsYXJfZmlsZShmaWxlKTsNCj4gPiArDQo+ID4gKwlp
ZiAoaXNfc2luZ3VsYXJfZmlsZSAmJiBpdmMtPnN0cmVhbWluZykgew0KPiA+ICAJCW1lZGlhX3Bp
cGVsaW5lX3N0b3AoZW50aXR5KTsNCj4gPiAgCQlpdmMtPnN0cmVhbWluZyA9IDA7DQo+ID4gIAl9
DQo+ID4gIA0KPiA+ICAJX3ZiMl9mb3BfcmVsZWFzZShmaWxlLCBOVUxMKTsNCj4gPiArCWZpbGUt
PnByaXZhdGVfZGF0YSA9IE5VTEw7DQo+ID4gIA0KPiA+IC0JaWYgKHY0bDJfZmhfaXNfc2luZ3Vs
YXJfZmlsZShmaWxlKSkgew0KPiA+ICsJaWYgKGlzX3Npbmd1bGFyX2ZpbGUpIHsNCj4gPiAgCQlm
aW1jX3BpcGVsaW5lX2NhbGwoJml2Yy0+dmUsIGNsb3NlKTsNCj4gPiAgDQo+ID4gIAkJbXV0ZXhf
bG9jaygmbWRldi0+Z3JhcGhfbXV0ZXgpOw0KPiA+IA0KPiANCg0KDQpPaywgdGhhbmtzIGZvciB5
b3VyIHN1Z2dlc3Rpb24uDQoNCkRvIHlvdSBtZWFucyBpIG5lZWQgc3VibWl0IGEgbmV3IHBhdGgg
dG8gc2V0IGZpbHAtPnByaXZhdGVfZGF0YSA9IE5VTEwNCmFmdGVyIGtmcmVlKGZoKSBpbiB2NGwy
X2ZoX3JlbGVhc2UoKSA/DQoNCkx2IFl1bmxvbmc=
