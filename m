Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5472D200259
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 08:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729580AbgFSG7e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 02:59:34 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:23341 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729508AbgFSG7d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 02:59:33 -0400
X-UUID: 6f4081d96ecf474797c54671b2c65c62-20200619
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=PCB8Qz7hOOk222bVQxjPpuUhXuN7LtCLPsnk9tCpO4M=;
        b=u0VcAhR6xsyiieTIQPVcjxbHrxRLWu5wsq2BVbZwk9QtooTM2z+UaWu6ktDonHhO4E8hHvYt739v2xZmiikORHwCaVC30lt1aZsMSu5jVy74122596hMUHOMAh5FqYUN47oYmOfzrPmShJbjPHebuOXBQybOXyBEpCpnK80OJPw=;
X-UUID: 6f4081d96ecf474797c54671b2c65c62-20200619
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <tiffany.lin@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1665357815; Fri, 19 Jun 2020 14:59:29 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Jun 2020 14:59:11 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 19 Jun 2020 14:59:12 +0800
Message-ID: <1592549952.23952.3.camel@mtksdaap41>
Subject: Re: [PATCH 07/10] media: mtk-vcodec: venc: remove redundant code
From:   Tiffany Lin <tiffany.lin@mediatek.com>
To:     Alexandre Courbot <acourbot@chromium.org>
CC:     Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rui Wang <gtk_ruiwang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        "Pi-Hsun Shih" <pihsun@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        <linux-media@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Date:   Fri, 19 Jun 2020 14:59:12 +0800
In-Reply-To: <20200520082723.96136-8-acourbot@chromium.org>
References: <20200520082723.96136-1-acourbot@chromium.org>
         <20200520082723.96136-8-acourbot@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7CCBF29C811E6FE35B861FCCF8B303D3C129E8FA0D985C43E6CCB2781D20C5BF2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gV2VkLCAyMDIwLTA1LTIwIGF0IDE3OjI3ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gdmlkaW9jX3RyeV9mbXQoKSBkb2VzIGNsYW1wIGhlaWdodCBhbmQgd2lkdGggd2hlbiBj
YWxsZWQgb24gdGhlIE9VVFBVVA0KPiBxdWV1ZSwgc28gY2xhbXBpbmcgdGhlbSBwcmlvciB0byBj
YWxsaW5nIHRoaXMgZnVuY3Rpb24gaXMgcmVkdW5kYW50LiBTZXQNCj4gdGhlIHF1ZXVlJ3MgcGFy
YW1ldGVycyBhZnRlciBjYWxsaW5nIHZpZGlvY190cnlfZm10KCkgc28gd2UgY2FuIHVzZSB0aGUN
Cj4gdmFsdWVzIGl0IGNvbXB1dGVkLg0KPiANCg0KdmlkaW9jX3RyeV9mbXQgY2xhbXBzIGhlaWdo
dCBhbmQgd2lkdGggb25seSB3aGVuIGYtPnR5cGUgPT0NClY0TDJfQlVGX1RZUEVfVklERU9fT1VU
UFVUX01QTEFORQ0KDQpEb2VzIHRoaXMgY2xlYW51cCBwYXNzIHY0bDIgY29tcGxpYW5jZSB0ZXN0
Pw0KSSByZWNhbGwgY29tcGxpYW5jZSB0ZXN0IHdpbGwgdHJ5IGRpZmZlcmVudCBmbXQgYW5kIG1h
a2Ugc3VyZSBkcml2ZXINCnJlc3BvbnNlIGVub3VnaCBpbmZvcm1hdGlvbj8NCg0KDQo+IFNpZ25l
ZC1vZmYtYnk6IEFsZXhhbmRyZSBDb3VyYm90IDxhY291cmJvdEBjaHJvbWl1bS5vcmc+DQo+IC0t
LQ0KPiAgLi4uL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19lbmMuYyAgIHwg
MTYgKysrKy0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MTIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9tdGstdmNvZGVjL210a192Y29kZWNfZW5jLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210
ay12Y29kZWMvbXRrX3Zjb2RlY19lbmMuYw0KPiBpbmRleCAwNTc0M2E3NDVhMTEuLmYwYWY3OGYx
MTJkYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210
a192Y29kZWNfZW5jLmMNCj4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVj
L210a192Y29kZWNfZW5jLmMNCj4gQEAgLTQ0OSw3ICs0NDksNiBAQCBzdGF0aWMgaW50IHZpZGlv
Y192ZW5jX3NfZm10X291dChzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCAqcHJpdiwNCj4gIAlzdHJ1
Y3QgbXRrX3FfZGF0YSAqcV9kYXRhOw0KPiAgCWludCByZXQsIGk7DQo+ICAJY29uc3Qgc3RydWN0
IG10a192aWRlb19mbXQgKmZtdDsNCj4gLQlzdHJ1Y3QgdjRsMl9waXhfZm9ybWF0X21wbGFuZSAq
cGl4X2ZtdF9tcCA9ICZmLT5mbXQucGl4X21wOw0KPiAgDQo+ICAJdnEgPSB2NGwyX20ybV9nZXRf
dnEoY3R4LT5tMm1fY3R4LCBmLT50eXBlKTsNCj4gIAlpZiAoIXZxKSB7DQo+IEBAIC00NzQsMjAg
KzQ3MywxMyBAQCBzdGF0aWMgaW50IHZpZGlvY192ZW5jX3NfZm10X291dChzdHJ1Y3QgZmlsZSAq
ZmlsZSwgdm9pZCAqcHJpdiwNCj4gIAkJZi0+Zm10LnBpeC5waXhlbGZvcm1hdCA9IGZtdC0+Zm91
cmNjOw0KPiAgCX0NCj4gIA0KPiAtCXBpeF9mbXRfbXAtPmhlaWdodCA9IGNsYW1wKHBpeF9mbXRf
bXAtPmhlaWdodCwNCj4gLQkJCQlNVEtfVkVOQ19NSU5fSCwNCj4gLQkJCQlNVEtfVkVOQ19NQVhf
SCk7DQo+IC0JcGl4X2ZtdF9tcC0+d2lkdGggPSBjbGFtcChwaXhfZm10X21wLT53aWR0aCwNCj4g
LQkJCQlNVEtfVkVOQ19NSU5fVywNCj4gLQkJCQlNVEtfVkVOQ19NQVhfVyk7DQo+IC0NCj4gLQlx
X2RhdGEtPnZpc2libGVfd2lkdGggPSBmLT5mbXQucGl4X21wLndpZHRoOw0KPiAtCXFfZGF0YS0+
dmlzaWJsZV9oZWlnaHQgPSBmLT5mbXQucGl4X21wLmhlaWdodDsNCj4gLQlxX2RhdGEtPmZtdCA9
IGZtdDsNCj4gLQlyZXQgPSB2aWRpb2NfdHJ5X2ZtdChmLCBxX2RhdGEtPmZtdCk7DQo+ICsJcmV0
ID0gdmlkaW9jX3RyeV9mbXQoZiwgZm10KTsNCj4gIAlpZiAocmV0KQ0KPiAgCQlyZXR1cm4gcmV0
Ow0KPiAgDQo+ICsJcV9kYXRhLT5mbXQgPSBmbXQ7DQo+ICsJcV9kYXRhLT52aXNpYmxlX3dpZHRo
ID0gZi0+Zm10LnBpeF9tcC53aWR0aDsNCj4gKwlxX2RhdGEtPnZpc2libGVfaGVpZ2h0ID0gZi0+
Zm10LnBpeF9tcC5oZWlnaHQ7DQo+ICAJcV9kYXRhLT5jb2RlZF93aWR0aCA9IGYtPmZtdC5waXhf
bXAud2lkdGg7DQo+ICAJcV9kYXRhLT5jb2RlZF9oZWlnaHQgPSBmLT5mbXQucGl4X21wLmhlaWdo
dDsNCj4gIA0KDQo=

