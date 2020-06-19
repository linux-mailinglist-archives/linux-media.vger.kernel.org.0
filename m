Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F98920028C
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 09:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729975AbgFSHNj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 03:13:39 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:53475 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728109AbgFSHNi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 03:13:38 -0400
X-UUID: d6e89bb465a149788b5b552f2b6f28bf-20200619
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=Ge4Q1IGNmven9DEwI5s/AYTPPYmWkvgiVPEkL7m9LtI=;
        b=M9q2XpuUPKOgdGV049XKRskPDU9OY/g1aBHPIBEN+X6ADjyZR7Q3LoaSXElk2pylXOH0sCWRb0460ICYCNgEosZcpjvFOrRQBV94OMMBShz0HYfCbMd6sH6tc2jzpvraGNgMwEWC6tkfbkHbr5lryexkgIAW08MD3ZRpS7oczAo=;
X-UUID: d6e89bb465a149788b5b552f2b6f28bf-20200619
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <tiffany.lin@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 487082109; Fri, 19 Jun 2020 15:13:35 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Jun 2020 15:13:33 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 19 Jun 2020 15:13:33 +0800
Message-ID: <1592550813.23952.5.camel@mtksdaap41>
Subject: Re: [PATCH 09/10] media: dt-bindings: mtk-vcodec: specify SCP node
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
Date:   Fri, 19 Jun 2020 15:13:33 +0800
In-Reply-To: <20200520082723.96136-10-acourbot@chromium.org>
References: <20200520082723.96136-1-acourbot@chromium.org>
         <20200520082723.96136-10-acourbot@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4A4C11D294B15114B2E1BEFFA5738803A511605A5CDDAEB32273C11F7D27DE922000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gV2VkLCAyMDIwLTA1LTIwIGF0IDE3OjI3ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gVGhlIG1lZGlhdGVrIGNvZGVjcyBjYW4gdXNlIGVpdGhlciB0aGUgVlBVIG9yIHRoZSBT
Q1AgYXMgdGhlaXIgaW50ZXJmYWNlDQo+IHRvIGZpcm13YXJlLiBSZWZsZWN0IHRoaXMgaW4gdGhl
IERUIGJpbmRpbmdzLg0KPiANCkFja2VkLWJ5OiBUaWZmYW55IExpbiA8dGlmZmFueS5saW5AbWVk
aWF0ZWsuY29tPg0KDQoNCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIENvdXJib3QgPGFjb3Vy
Ym90QGNocm9taXVtLm9yZz4NCj4gLS0tDQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWVkaWEvbWVkaWF0ZWstdmNvZGVjLnR4dCB8IDQgKysrLQ0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay12Y29kZWMudHh0
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLXZjb2Rl
Yy50eHQNCj4gaW5kZXggYjZiNWRkZTZhYmQ4Li43YWVmMGE0ZmUyMDcgMTAwNjQ0DQo+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay12Y29kZWMu
dHh0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRp
YXRlay12Y29kZWMudHh0DQo+IEBAIC0xOSw3ICsxOSw5IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6
DQo+ICAtIGlvbW11cyA6IHNob3VsZCBwb2ludCB0byB0aGUgcmVzcGVjdGl2ZSBJT01NVSBibG9j
ayB3aXRoIG1hc3RlciBwb3J0IGFzDQo+ICAgIGFyZ3VtZW50LCBzZWUgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11L21lZGlhdGVrLGlvbW11LnR4dA0KPiAgICBmb3IgZGV0
YWlscy4NCj4gLS0gbWVkaWF0ZWssdnB1IDogdGhlIG5vZGUgb2YgdmlkZW8gcHJvY2Vzc29yIHVu
aXQNCj4gK09uZSBvZiB0aGUgdHdvIGZvbGxvd2luZyBub2RlczoNCj4gKy0gbWVkaWF0ZWssdnB1
IDogdGhlIG5vZGUgb2YgdGhlIHZpZGVvIHByb2Nlc3NvciB1bml0LCBpZiB1c2luZyBWUFUuDQo+
ICstIG1lZGlhdGVrLHNjcCA6IHRoZSBub29kZSBvZiB0aGUgU0NQIHVuaXQsIGlmIHVzaW5nIFND
UC4NCj4gIA0KPiANCj4gIEV4YW1wbGU6DQoNCg==

