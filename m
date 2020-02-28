Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4DE71733A7
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2020 10:19:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbgB1JTw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Feb 2020 04:19:52 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:65069 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726207AbgB1JTw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Feb 2020 04:19:52 -0500
X-UUID: caab609a429849368284e83c25abd92c-20200228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=6zeC4yb1VQBu7ApncTTy8tf7CnDnABwjHUo57+LSsO8=;
        b=sObfravm74/bA6AytUYIAQBeFbeGeZ/0otXn+fYlZbbNA/h7vjLnFFHE7HrlJws4/KInkSIrQHMWoxXX7xuCHPJ/FPk09vAQxu/YO3qUxNp07A16o/21nq2HBHHMcmiUoLhC08rKtTmYQ++TTeaB44x2pmPVg4JXFfha1GoyLPA=;
X-UUID: caab609a429849368284e83c25abd92c-20200228
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw01.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1234426427; Fri, 28 Feb 2020 17:19:47 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 28 Feb 2020 17:18:48 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 28 Feb 2020 17:19:44 +0800
Message-ID: <1582881585.22475.0.camel@mtksdaap41>
Subject: Re: [PATCH v10 2/5] dt-bindings: mediatek: Update mmsys binding to
 reflect it is a system controller
From:   CK Hu <ck.hu@mediatek.com>
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
CC:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <p.zabel@pengutronix.de>, <airlied@linux.ie>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <ulrich.hecht+renesas@gmail.com>,
        <laurent.pinchart@ideasonboard.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        <rdunlap@infradead.org>, <dri-devel@lists.freedesktop.org>,
        Weiyi Lu <weiyi.lu@mediatek.com>,
        "Seiya Wang" <seiya.wang@mediatek.com>,
        <linux-clk@vger.kernel.org>,
        "Collabora Kernel ML" <kernel@collabora.com>,
        mtk01761 <wendell.lin@mediatek.com>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>, <wens@csie.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <sean.wang@mediatek.com>, <frank-w@public-files.de>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        <linux-mediatek@lists.infradead.org>, <hsinyi@chromium.org>,
        Matthias Brugger <mbrugger@suse.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Richard Fontana <rfontana@redhat.com>,
        <linux-kernel@vger.kernel.org>, <matthias.bgg@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Date:   Fri, 28 Feb 2020 17:19:45 +0800
In-Reply-To: <20200227180858.1514157-3-enric.balletbo@collabora.com>
References: <20200227180858.1514157-1-enric.balletbo@collabora.com>
         <20200227180858.1514157-3-enric.balletbo@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FC89D009C6FEBE11B57038010837F5A87B7460971BF352976EDF9382E63247B12000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksIEVucmljOg0KDQpPbiBUaHUsIDIwMjAtMDItMjcgYXQgMTk6MDggKzAxMDAsIEVucmljIEJh
bGxldGJvIGkgU2VycmEgd3JvdGU6DQo+IFRoZSBtbXN5cyBzeXN0ZW0gY29udHJvbGxlciBpcyBu
b3Qgb25seSBhIHB1cmUgY2xvY2sgY29udHJvbGxlciwgc28NCj4gdXBkYXRlIHRoZSBiaW5kaW5n
IGRvY3VtZW50YXRpb24gdG8gcmVmbGVjdCB0aGF0IGFwYXJ0IGZyb20gcHJvdmlkaW5nDQo+IGNs
b2NrcywgaXQgYWxzbyBwcm92aWRlcyByb3V0aW5nIGFuZCBtaXNjZWxsYW5lb3VzIGNvbnRyb2wg
cmVnaXN0ZXJzLg0KPiANCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+
DQoNCj4gU2lnbmVkLW9mZi1ieTogRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0
Ym9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQo+IA0KPiBDaGFuZ2VzIGluIHYxMDoNCj4gLSBVcGRh
dGUgdGhlIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIG1tc3lzIHN5c3RlbSBjb250cm9s
bGVyLg0KPiANCj4gQ2hhbmdlcyBpbiB2OTogTm9uZQ0KPiBDaGFuZ2VzIGluIHY4OiBOb25lDQo+
IENoYW5nZXMgaW4gdjc6IE5vbmUNCj4gDQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0v
bWVkaWF0ZWsvbWVkaWF0ZWssbW1zeXMudHh0ICAgIHwgNyArKysrLS0tDQo+ICAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWss
bW1zeXMudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRl
ay9tZWRpYXRlayxtbXN5cy50eHQNCj4gaW5kZXggMzAxZWVmYmUxNjE4Li44ZDZhOWQ5OGU3YTYg
MTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVk
aWF0ZWsvbWVkaWF0ZWssbW1zeXMudHh0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssbW1zeXMudHh0DQo+IEBAIC0xLDcgKzEs
OCBAQA0KPiAgTWVkaWF0ZWsgbW1zeXMgY29udHJvbGxlcg0KPiAgPT09PT09PT09PT09PT09PT09
PT09PT09PT09PQ0KPiAgDQo+IC1UaGUgTWVkaWF0ZWsgbW1zeXMgY29udHJvbGxlciBwcm92aWRl
cyB2YXJpb3VzIGNsb2NrcyB0byB0aGUgc3lzdGVtLg0KPiArVGhlIE1lZGlhdGVrIG1tc3lzIHN5
c3RlbSBjb250cm9sbGVyIHByb3ZpZGVzIGNsb2NrIGNvbnRyb2wsIHJvdXRpbmcgY29udHJvbCwN
Cj4gK2FuZCBtaXNjZWxsYW5lb3VzIGNvbnRyb2wgaW4gbW1zeXMgcGFydGl0aW9uLg0KPiAgDQo+
ICBSZXF1aXJlZCBQcm9wZXJ0aWVzOg0KPiAgDQo+IEBAIC0xNSwxMyArMTYsMTMgQEAgUmVxdWly
ZWQgUHJvcGVydGllczoNCj4gIAktICJtZWRpYXRlayxtdDgxODMtbW1zeXMiLCAic3lzY29uIg0K
PiAgLSAjY2xvY2stY2VsbHM6IE11c3QgYmUgMQ0KPiAgDQo+IC1UaGUgbW1zeXMgY29udHJvbGxl
ciB1c2VzIHRoZSBjb21tb24gY2xrIGJpbmRpbmcgZnJvbQ0KPiArRm9yIHRoZSBjbG9jayBjb250
cm9sLCB0aGUgbW1zeXMgY29udHJvbGxlciB1c2VzIHRoZSBjb21tb24gY2xrIGJpbmRpbmcgZnJv
bQ0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2Nsb2NrLWJpbmRp
bmdzLnR4dA0KPiAgVGhlIGF2YWlsYWJsZSBjbG9ja3MgYXJlIGRlZmluZWQgaW4gZHQtYmluZGlu
Z3MvY2xvY2svbXQqLWNsay5oLg0KPiAgDQo+ICBFeGFtcGxlOg0KPiAgDQo+IC1tbXN5czogY2xv
Y2stY29udHJvbGxlckAxNDAwMDAwMCB7DQo+ICttbXN5czogc3lzY29uQDE0MDAwMDAwIHsNCj4g
IAljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1tbXN5cyIsICJzeXNjb24iOw0KPiAgCXJl
ZyA9IDwwIDB4MTQwMDAwMDAgMCAweDEwMDA+Ow0KPiAgCSNjbG9jay1jZWxscyA9IDwxPjsNCg0K

