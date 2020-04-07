Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E97C1A0564
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 05:52:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbgDGDwY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 23:52:24 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:64465 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726329AbgDGDwY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 23:52:24 -0400
X-UUID: b45d182d5408499d8689e947296ff7bd-20200407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=2aMRNqNHcycdMh8Gya/SUpbpAnyzbzqps6tELV3hW+k=;
        b=lNl07QVjGYX5g2XlI5AR+18+Pmc/3d9jAdxZEKDg5vK6LOxmER7K7ZcqnAFVeTM2lXE+1c3zkwPE5feldphaIm4hdtAqAOra1aqoa3YKVS+/CPqiTawHPz7NXr8BSc6nTgOdK6ak6XXGI5x+cM2iaKam82pCgLIaEwDT8pFYeLc=;
X-UUID: b45d182d5408499d8689e947296ff7bd-20200407
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <yingjoe.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1577399379; Tue, 07 Apr 2020 11:52:19 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Apr 2020 11:52:17 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Apr 2020 11:52:17 +0800
Message-ID: <1586231537.16269.2.camel@mtksdaap41>
Subject: Re: [PATCH v8 12/14] arm: dts: Add jpeg enc device tree node
From:   Yingjoe Chen <yingjoe.chen@mediatek.com>
To:     Xia Jiang <xia.jiang@mediatek.com>
CC:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Matthias Brugger" <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>,
        <maoguang.meng@mediatek.com>, <devicetree@vger.kernel.org>,
        <mojahsu@chromium.org>, <srv_heupstream@mediatek.com>,
        <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        <senozhatsky@chromium.org>, <sj.huang@mediatek.com>,
        <drinkcat@chromium.org>, <linux-mediatek@lists.infradead.org>,
        <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Date:   Tue, 7 Apr 2020 11:52:17 +0800
In-Reply-To: <20200403094033.8288-13-xia.jiang@mediatek.com>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
         <20200403094033.8288-13-xia.jiang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQoNClRoaXMgY2hhbmdlIG10MjcwMS5kdHNpIG9ubHksIHBsZWFzZSBhZGQgdGhhdCB0byBzdW1t
YXJ5IHByZWZpeDoNCg0KYXJtOmR0czogbXQyNzAxOiBhZGQganBlZyBlbmMgZGV2aWNlIHRyZWUg
bm9kZQ0KDQpKb2UuQw0KDQpPbiBGcmksIDIwMjAtMDQtMDMgYXQgMTc6NDAgKzA4MDAsIFhpYSBK
aWFuZyB3cm90ZToNCj4gQWRkIGpwZWcgZW5jIGRldmljZSB0cmVlIG5vZGUNCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IFhpYSBKaWFuZyA8eGlhLmppYW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQo+IHY4
OiBubyBjaGFuZ2VzDQo+IA0KPiB2Nzogbm8gY2hhbmdlcw0KPiANCj4gdjY6IG5vIGNoYW5nZXMN
Cj4gDQo+IHY1OiBubyBjaGFuZ2VzDQo+IA0KPiB2NDogbm8gY2hhbmdlcw0KPiANCj4gdjM6IGNo
YW5nZSBjb21wYXRpYmxlIHRvIFNvQyBzcGVjaWZpYyBjb21wYXRpYmxlDQo+IA0KPiB2Mjogbm8g
Y2hhbmdlcw0KPiAtLS0NCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL210MjcwMS5kdHNpIHwgMTMgKysr
KysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykNCj4gDQo+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9tdDI3MDEuZHRzaSBiL2FyY2gvYXJtL2Jvb3Qv
ZHRzL210MjcwMS5kdHNpDQo+IGluZGV4IDUxZTEzMDVjNjQ3MS4uZjJmOTIxNTBiM2ZiIDEwMDY0
NA0KPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9tdDI3MDEuZHRzaQ0KPiArKysgYi9hcmNoL2Fy
bS9ib290L2R0cy9tdDI3MDEuZHRzaQ0KPiBAQCAtNTY5LDYgKzU2OSwxOSBAQA0KPiAgCQkJIDwm
aW9tbXUgTVQyNzAxX000VV9QT1JUX0pQR0RFQ19CU0RNQT47DQo+ICAJfTsNCj4gIA0KPiArCWpw
ZWdlbmM6IGpwZWdlbmNAMTUwMGEwMDAgew0KPiArCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10
MjcwMS1qcGdlbmMiLA0KPiArCQkJICAgICAibWVkaWF0ZWssbXRrLWpwZ2VuYyI7DQo+ICsJCXJl
ZyA9IDwwIDB4MTUwMGEwMDAgMCAweDEwMDA+Ow0KPiArCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkg
MTQxIElSUV9UWVBFX0xFVkVMX0xPVz47DQo+ICsJCWNsb2NrcyA9ICA8JmltZ3N5cyBDTEtfSU1H
X1ZFTkM+Ow0KPiArCQljbG9jay1uYW1lcyA9ICJqcGdlbmMiOw0KPiArCQlwb3dlci1kb21haW5z
ID0gPCZzY3BzeXMgTVQyNzAxX1BPV0VSX0RPTUFJTl9JU1A+Ow0KPiArCQltZWRpYXRlayxsYXJi
ID0gPCZsYXJiMj47DQo+ICsJCWlvbW11cyA9IDwmaW9tbXUgTVQyNzAxX000VV9QT1JUX0pQR0VO
Q19SRE1BPiwNCj4gKwkJCSA8JmlvbW11IE1UMjcwMV9NNFVfUE9SVF9KUEdFTkNfQlNETUE+Ow0K
PiArCX07DQo+ICsNCj4gIAl2ZGVjc3lzOiBzeXNjb25AMTYwMDAwMDAgew0KPiAgCQljb21wYXRp
YmxlID0gIm1lZGlhdGVrLG10MjcwMS12ZGVjc3lzIiwgInN5c2NvbiI7DQo+ICAJCXJlZyA9IDww
IDB4MTYwMDAwMDAgMCAweDEwMDA+Ow0KDQo=

