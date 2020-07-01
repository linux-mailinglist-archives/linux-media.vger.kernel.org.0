Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD961210288
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 05:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgGADag (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 23:30:36 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:19311 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725862AbgGADaf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 23:30:35 -0400
X-UUID: bf78afeb2d104bc2830bd126a97cacf8-20200701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=hMaB+50yOQw2HFn/LcuwEydwHyNKHncHsixDvcNbkVA=;
        b=YoLCiZxhQOYET+bqLy0fgGdz6hdx4/7WcJs+ulz07qLdqZuslI3mWJZS1CRY57+OJxEdM06pYUNtPyD+HphdHfpXAxPjQ34IooDBaD6N4r1Je7/iUczb2bQgG9Gx9sbY0kZUQx2XIsx/zWLyuUwr3gTxnmULtG8NXGcK7jiX4L0=;
X-UUID: bf78afeb2d104bc2830bd126a97cacf8-20200701
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <tiffany.lin@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1181170197; Wed, 01 Jul 2020 11:30:33 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jul 2020 11:30:30 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Jul 2020 11:30:30 +0800
Message-ID: <1593574231.1533.0.camel@mtksdaap41>
Subject: Re: [PATCH v2 10/18] Revert "media: mtk-vcodec: Remove extra area
 allocation in an input buffer on encoding"
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
Date:   Wed, 1 Jul 2020 11:30:31 +0800
In-Reply-To: <20200626080442.292309-11-acourbot@chromium.org>
References: <20200626080442.292309-1-acourbot@chromium.org>
         <20200626080442.292309-11-acourbot@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gRnJpLCAyMDIwLTA2LTI2IGF0IDE3OjA0ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gVGhpcyByZXZlcnRzIGNvbW1pdCA4MTczNWVjYjYyZjg4Mjg1M2EzN2E4YzE1NzQwN2Vj
NGFlZDQ0ZmQwLg0KPiANCj4gVGhlIGhhcmR3YXJlIG5lZWRzIGRhdGEgdG8gZm9sbG93IHRoZSBw
cmV2aW91cyBhbGlnbm1lbnQsIHNvIHRoaXMgZXh0cmENCj4gc3BhY2Ugd2FzIG5vdCBzdXBlcmZs
dW91cyBhZnRlciBhbGwuIEJlc2lkZXMsIHRoaXMgYWxzbyBtYWRlDQo+IHY0bDItY29tcGxpYW5j
ZSdzIEdfRk1UIGFuZCBTX0ZNVCB0ZXN0cyByZWdyZXNzLg0KPiANCkFja2VkLWJ5OiBUaWZmYW55
IExpbiA8dGlmZmFueS5saW5AbWVkaWF0ZWsuY29tPg0KDQo+IFNpZ25lZC1vZmYtYnk6IEFsZXhh
bmRyZSBDb3VyYm90IDxhY291cmJvdEBjaHJvbWl1bS5vcmc+DQo+IC0tLQ0KPiAgZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZW5jLmMgfCA5ICsrKysrKy0tLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2Rl
Y19lbmMuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2Vu
Yy5jDQo+IGluZGV4IDA1NzQzYTc0NWExMS4uZjJiYTE5YzMyNDAwIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19lbmMuYw0KPiArKysg
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19lbmMuYw0KPiBA
QCAtMjk5LDEyICsyOTksMTQgQEAgc3RhdGljIGludCB2aWRpb2NfdHJ5X2ZtdChzdHJ1Y3QgdjRs
Ml9mb3JtYXQgKmYsDQo+ICANCj4gIAkJcGl4X2ZtdF9tcC0+bnVtX3BsYW5lcyA9IGZtdC0+bnVt
X3BsYW5lczsNCj4gIAkJcGl4X2ZtdF9tcC0+cGxhbmVfZm10WzBdLnNpemVpbWFnZSA9DQo+IC0J
CQlwaXhfZm10X21wLT53aWR0aCAqIHBpeF9mbXRfbXAtPmhlaWdodDsNCj4gKwkJCQlwaXhfZm10
X21wLT53aWR0aCAqIHBpeF9mbXRfbXAtPmhlaWdodCArDQo+ICsJCQkJKChBTElHTihwaXhfZm10
X21wLT53aWR0aCwgMTYpICogMikgKiAxNik7DQo+ICAJCXBpeF9mbXRfbXAtPnBsYW5lX2ZtdFsw
XS5ieXRlc3BlcmxpbmUgPSBwaXhfZm10X21wLT53aWR0aDsNCj4gIA0KPiAgCQlpZiAocGl4X2Zt
dF9tcC0+bnVtX3BsYW5lcyA9PSAyKSB7DQo+ICAJCQlwaXhfZm10X21wLT5wbGFuZV9mbXRbMV0u
c2l6ZWltYWdlID0NCj4gLQkJCQkocGl4X2ZtdF9tcC0+d2lkdGggKiBwaXhfZm10X21wLT5oZWln
aHQpIC8gMjsNCj4gKwkJCQkocGl4X2ZtdF9tcC0+d2lkdGggKiBwaXhfZm10X21wLT5oZWlnaHQp
IC8gMiArDQo+ICsJCQkJKEFMSUdOKHBpeF9mbXRfbXAtPndpZHRoLCAxNikgKiAxNik7DQo+ICAJ
CQlwaXhfZm10X21wLT5wbGFuZV9mbXRbMl0uc2l6ZWltYWdlID0gMDsNCj4gIAkJCXBpeF9mbXRf
bXAtPnBsYW5lX2ZtdFsxXS5ieXRlc3BlcmxpbmUgPQ0KPiAgCQkJCQkJCXBpeF9mbXRfbXAtPndp
ZHRoOw0KPiBAQCAtMzEyLDcgKzMxNCw4IEBAIHN0YXRpYyBpbnQgdmlkaW9jX3RyeV9mbXQoc3Ry
dWN0IHY0bDJfZm9ybWF0ICpmLA0KPiAgCQl9IGVsc2UgaWYgKHBpeF9mbXRfbXAtPm51bV9wbGFu
ZXMgPT0gMykgew0KPiAgCQkJcGl4X2ZtdF9tcC0+cGxhbmVfZm10WzFdLnNpemVpbWFnZSA9DQo+
ICAJCQlwaXhfZm10X21wLT5wbGFuZV9mbXRbMl0uc2l6ZWltYWdlID0NCj4gLQkJCQkocGl4X2Zt
dF9tcC0+d2lkdGggKiBwaXhfZm10X21wLT5oZWlnaHQpIC8gNDsNCj4gKwkJCQkocGl4X2ZtdF9t
cC0+d2lkdGggKiBwaXhfZm10X21wLT5oZWlnaHQpIC8gNCArDQo+ICsJCQkJKChBTElHTihwaXhf
Zm10X21wLT53aWR0aCwgMTYpIC8gMikgKiAxNik7DQo+ICAJCQlwaXhfZm10X21wLT5wbGFuZV9m
bXRbMV0uYnl0ZXNwZXJsaW5lID0NCj4gIAkJCQlwaXhfZm10X21wLT5wbGFuZV9mbXRbMl0uYnl0
ZXNwZXJsaW5lID0NCj4gIAkJCQlwaXhfZm10X21wLT53aWR0aCAvIDI7DQoNCg==

