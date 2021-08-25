Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD3B53F7344
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 12:28:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239928AbhHYK3Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 06:29:24 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:11043 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S239888AbhHYK3M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 06:29:12 -0400
X-UUID: d03e7707fe3e4856be758ec4a7b9bc5e-20210825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=ljYjhZk7xODYifRKLlNuoAeWY2WaxL/PB579A6YFENM=;
        b=bWqaWLmZ55cjGCFIOCVc4c8MHQaOnk+qyq/MJ4tQuzWkL4RB9P29PrpeU1A87iy7TdvQyRAizZQPTr93eW5ayRGrwVVG1W6jUQcpV6swy+FfKDGZq0As2I7CVJWfEFcAiMFuvMnTruVPDdD05wOFlFamgz6XFvF27sMoq02InYg=;
X-UUID: d03e7707fe3e4856be758ec4a7b9bc5e-20210825
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <houlong.wei@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 980542094; Wed, 25 Aug 2021 18:28:22 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 25 Aug
 2021 18:28:17 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 25 Aug 2021 18:28:16 +0800
Message-ID: <1629887296.13994.1.camel@mhfsdcap03>
Subject: Re: [PATCH v3] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
From:   houlong wei <houlong.wei@mediatek.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Alexandre Courbot" <acourbot@chromium.org>,
        "kernel@collabora.com" <kernel@collabora.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
        "dafna3@gmail.com" <dafna3@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        "Minghsiu Tsai =?UTF-8?Q?=28=E8=94=A1=E6=98=8E=E4=BF=AE=29?=" 
        <Minghsiu.Tsai@mediatek.com>,
        Andrew-CT Chen =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?= 
        <Andrew-CT.Chen@mediatek.com>,
        Tiffany Lin =?UTF-8?Q?=28=E6=9E=97=E6=85=A7=E7=8F=8A=29?= 
        <tiffany.lin@mediatek.com>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "courbot@chromium.org" <courbot@chromium.org>,
        "hsinyi@chromium.org" <hsinyi@chromium.org>,
        "eizan@chromium.org" <eizan@chromium.org>,
        <houlong.wei@mediatek.com>
Date:   Wed, 25 Aug 2021 18:28:16 +0800
In-Reply-To: <20210825101717.18075-1-dafna.hirschfeld@collabora.com>
References: <20210825101717.18075-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 01E81F49704AFDF79AFC70AA7CA2ACF2B7B250A311999B359EA670EF2614D5452000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gV2VkLCAyMDIxLTA4LTI1IGF0IDE4OjE3ICswODAwLCBEYWZuYSBIaXJzY2hmZWxkIHdyb3Rl
Og0KPiBGcm9tOiBBbGV4YW5kcmUgQ291cmJvdCA8YWNvdXJib3RAY2hyb21pdW0ub3JnPg0KPiAN
Cj4gV2hlbiBydW5uaW5nIG1lbWNweV90b2lvOg0KPiBtZW1jcHlfdG9pbyhzZW5kX29iai0+c2hh
cmVfYnVmLCBidWYsIGxlbik7DQo+IGl0IHdhcyBmb3VuZCB0aGF0IGVycm9ycyBhcHBlYXIgaWYg
bGVuIGlzIG5vdCBhIG11bHRpcGxlIG9mIDg6DQo+IA0KPiBbNTguMzUwODQxXSBtdGstbWRwIDE0
MDAxMDAwLnJkbWE6IHByb2Nlc3NpbmcgZmFpbGVkOiAtMjINCj4gDQo+IFRoaXMgcGF0Y2ggZW5z
dXJlcyB0aGUgY29weSBvZiBhIG11bHRpbGUgb2YgOCBzaXplIGJ5IGNhbGxpbmcNCj4gcm91bmRf
dXAobGVuLCA4KSB3aGVuIGNvcHlpbmcNCj4gDQo+IEZpeGVzOiBlNjU5OWFkZmFkMzAgKCJtZWRp
YTogbXRrLXZwdTogYXZvaWQgdW5hbGlnbmVkIGFjY2VzcyB0byBEVENNIGJ1ZmZlci4iKQ0KPiBT
aWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgQ291cmJvdCA8YWNvdXJib3RAY2hyb21pdW0ub3JnPg0K
PiBTaWduZWQtb2ZmLWJ5OiBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIDxlbnJpYy5iYWxsZXRib0Bj
b2xsYWJvcmEuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBEYWZuYSBIaXJzY2hmZWxkIDxkYWZuYS5o
aXJzY2hmZWxkQGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KDQpSZXZpZXdlZC1ieTogSG91bG9uZyBX
ZWkgPGhvdWxvbmcud2VpQG1lZGlhdGVrLmNvbT4NCg0KPiBjaGFuZ2VzIHNpbmNlIHYyOg0KPiAx
LiBkbyB0aGUgZXh0cmEgY29weSBvbmx5IGlmIGxlbiBpcyBub3QgbXVsdGlwbGUgb2YgOA0KPiAN
Cj4gY2hhbmdlcyBzaW5jZSB2MToNCj4gMS4gY2hhbmdlIHNpZ24tb2ZmLWJ5IHRhZ3MNCj4gMi4g
Y2hhbmdlIHZhbHVlcyB0byBtZW1zZXQNCj4gDQo+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210
ay12cHUvbXRrX3ZwdS5jIHwgMTEgKysrKysrKysrKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9tdGstdnB1L210a192cHUuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
bXRrLXZwdS9tdGtfdnB1LmMNCj4gaW5kZXggZWMyOTBkZGU1OWNmLi42NTgxNjFlZTNlNGUgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZwdS9tdGtfdnB1LmMNCj4g
KysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdnB1L210a192cHUuYw0KPiBAQCAtMzQ5
LDcgKzM0OSwxNiBAQCBpbnQgdnB1X2lwaV9zZW5kKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYsDQo+ICAJCX0NCj4gIAl9IHdoaWxlICh2cHVfY2ZnX3JlYWRsKHZwdSwgSE9TVF9UT19WUFUp
KTsNCj4gIA0KPiAtCW1lbWNweV90b2lvKHNlbmRfb2JqLT5zaGFyZV9idWYsIGJ1ZiwgbGVuKTsN
Cj4gKwlpZiAobGVuICUgOCAhPSAwKSB7DQo+ICsJCXVuc2lnbmVkIGNoYXIgZGF0YVtTSEFSRV9C
VUZfU0laRV07DQo+ICsNCj4gKwkJbWVtc2V0KGRhdGEgKyBsZW4sIDAsIHNpemVvZihkYXRhKSAt
IGxlbik7DQo+ICsJCW1lbWNweShkYXRhLCBidWYsIGxlbik7DQo+ICsJCW1lbWNweV90b2lvKHNl
bmRfb2JqLT5zaGFyZV9idWYsIGRhdGEsIHJvdW5kX3VwKGxlbiwgOCkpOw0KPiArCX0gZWxzZSB7
DQo+ICsJCW1lbWNweV90b2lvKHNlbmRfb2JqLT5zaGFyZV9idWYsIGJ1ZiwgbGVuKTsNCj4gKwl9
DQo+ICsNCj4gIAl3cml0ZWwobGVuLCAmc2VuZF9vYmotPmxlbik7DQo+ICAJd3JpdGVsKGlkLCAm
c2VuZF9vYmotPmlkKTsNCj4gIA0KDQo=

