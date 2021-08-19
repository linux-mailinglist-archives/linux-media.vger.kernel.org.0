Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 279E63F23A0
	for <lists+linux-media@lfdr.de>; Fri, 20 Aug 2021 01:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236479AbhHSXVA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 19:21:00 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:29802 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S233512AbhHSXVA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 19:21:00 -0400
X-UUID: 4fe051843262477f8a5670667e4230c6-20210820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=QfeDJW3m4L57kRx1ekiwSC66ZVnjMitRsEcL77yqUug=;
        b=h7lLzP6r8j9QVwh0abLzRZYUGWTNl1b5cM4qRCRgD364hb8GohNxIXYOYsk5tdb0Qeja+dyvrJ474JYdVZ0gMMOYTL1/Ownbt6GFuWGBVdl8pDp8874ArEWWFgoTeo7OazhTiqTQV/LTNgqEatWFGiDAQiZi91Wgi65EN64E7qM=;
X-UUID: 4fe051843262477f8a5670667e4230c6-20210820
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <houlong.wei@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 483222040; Fri, 20 Aug 2021 07:20:21 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 20 Aug
 2021 07:20:13 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 Aug 2021 07:20:12 +0800
Message-ID: <6cb09965bce5bffe97fc00faecfffae9d3b38b3d.camel@mediatek.com>
Subject: Re: [PATCH] media: mtk-vpu: Fix a resource leak in the error
 handling path of 'mtk_vpu_probe()'
From:   houlong wei <houlong.wei@mediatek.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Minghsiu Tsai =?UTF-8?Q?=28=E8=94=A1=E6=98=8E=E4=BF=AE=29?= 
        <Minghsiu.Tsai@mediatek.com>,
        Andrew-CT Chen =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?= 
        <Andrew-CT.Chen@mediatek.com>,
        Tiffany Lin =?UTF-8?Q?=28=E6=9E=97=E6=85=A7=E7=8F=8A=29?= 
        <tiffany.lin@mediatek.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        <houlong.wei@mediatek.com>
Date:   Fri, 20 Aug 2021 07:20:13 +0800
In-Reply-To: <3d4ba5d254044567653a006b18971658ec69560f.1629404378.git.christophe.jaillet@wanadoo.fr>
References: <3d4ba5d254044567653a006b18971658ec69560f.1629404378.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 814C1EEA859FBE07EB023142BB288BF8A660564BFC7F2A04322B36A3694EEE642000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gRnJpLCAyMDIxLTA4LTIwIGF0IDA0OjIxICswODAwLCBDaHJpc3RvcGhlIEpBSUxMRVQgd3Jv
dGU6DQo+IEEgc3VjY2Vzc2Z1bCAnY2xrX3ByZXBhcmUoKScgY2FsbCBzaG91bGQgYmUgYmFsYW5j
ZWQgYnkgYQ0KPiBjb3JyZXNwb25kaW5nDQo+ICdjbGtfdW5wcmVwYXJlKCknIGNhbGwgaW4gdGhl
IGVycm9yIGhhbmRsaW5nIHBhdGggb2YgdGhlIHByb2JlLCBhcw0KPiBhbHJlYWR5DQo+IGRvbmUg
aW4gdGhlIHJlbW92ZSBmdW5jdGlvbi4NCj4gDQo+IFVwZGF0ZSB0aGUgZXJyb3IgaGFuZGxpbmcg
cGF0aCBhY2NvcmRpbmdseS4NCj4gDQo+IEZpeGVzOiAzMDAzYTE4MGVmNmIgKCJbbWVkaWFdIFZQ
VTogbWVkaWF0ZWs6IHN1cHBvcnQgTWVkaWF0ZWsgVlBVIikNCj4gU2lnbmVkLW9mZi1ieTogQ2hy
aXN0b3BoZSBKQUlMTEVUIDxjaHJpc3RvcGhlLmphaWxsZXRAd2FuYWRvby5mcj4NCj4gLS0tDQo+
IA0KUmV2aWV3ZWQtYnk6IEhvdWxvbmcgV2VpIDxob3Vsb25nLndlaUBtZWRpYXRlay5jb20+DQoN
Cj4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZwdS9tdGtfdnB1LmMgfCA1ICsrKystDQo+
ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdnB1L210a192cHUuYw0KPiBi
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZwdS9tdGtfdnB1LmMNCj4gaW5kZXggZWMyOTBk
ZGU1OWNmLi43ZjE2NDdkYTBhZGUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbXRrLXZwdS9tdGtfdnB1LmMNCj4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGst
dnB1L210a192cHUuYw0KPiBAQCAtODQ4LDcgKzg0OCw4IEBAIHN0YXRpYyBpbnQgbXRrX3ZwdV9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlDQo+ICpwZGV2KQ0KPiAgCXZwdS0+d2R0LndxID0g
Y3JlYXRlX3NpbmdsZXRocmVhZF93b3JrcXVldWUoInZwdV93ZHQiKTsNCj4gIAlpZiAoIXZwdS0+
d2R0LndxKSB7DQo+ICAJCWRldl9lcnIoZGV2LCAiaW5pdGlhbGl6ZSB3ZHQgd29ya3F1ZXVlIGZh
aWxlZFxuIik7DQo+IC0JCXJldHVybiAtRU5PTUVNOw0KPiArCQlyZXQgPSAtRU5PTUVNOw0KPiAr
CQlnb3RvIGNsa191bnByZXBhcmU7DQo+ICAJfQ0KPiAgCUlOSVRfV09SSygmdnB1LT53ZHQud3Ms
IHZwdV93ZHRfcmVzZXRfZnVuYyk7DQo+ICAJbXV0ZXhfaW5pdCgmdnB1LT52cHVfbXV0ZXgpOw0K
PiBAQCAtOTQyLDYgKzk0Myw4IEBAIHN0YXRpYyBpbnQgbXRrX3ZwdV9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlDQo+ICpwZGV2KQ0KPiAgCXZwdV9jbG9ja19kaXNhYmxlKHZwdSk7DQo+ICB3
b3JrcXVldWVfZGVzdHJveToNCj4gIAlkZXN0cm95X3dvcmtxdWV1ZSh2cHUtPndkdC53cSk7DQo+
ICtjbGtfdW5wcmVwYXJlOg0KPiArCWNsa191bnByZXBhcmUodnB1LT5jbGspOw0KPiAgDQo+ICAJ
cmV0dXJuIHJldDsNCj4gIH0NCj4gLS0gDQo+IDIuMzAuMg0KPiANCg==

