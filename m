Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D96B15D263
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 07:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728775AbgBNGtO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 01:49:14 -0500
Received: from mailgw01.mediatek.com ([216.200.240.184]:43858 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbgBNGtN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 01:49:13 -0500
X-UUID: 591c4716f1504125897deed0562d9a34-20200213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=/ImEYpFQVkvneIwZfKMDBwsxecrbwupV35NVM4pulYY=;
        b=mTrMVMpkOfAblSD1+TYcE3jGCbNOEi5xgT/mzHXJEukclG3+tfWD4YGIjuvXNRuTn/Oci+hL0NTxTx6dAVwkMw6gQvDEC/2Gk3HBrWSz9WigdGUDip3tadfkrGzKcSsVcjVszgUHDLehkMazQIpSTJ7I9DMT0URVbDhm2ApnVIg=;
X-UUID: 591c4716f1504125897deed0562d9a34-20200213
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (musrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 2143336691; Thu, 13 Feb 2020 22:49:09 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 13 Feb 2020 22:43:12 -0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 14 Feb 2020 14:42:56 +0800
Message-ID: <1581662577.17949.3.camel@mtksdaap41>
Subject: Re: [PATCH v7 01/13] dt-bindings: arm: move mmsys description to
 display
From:   CK Hu <ck.hu@mediatek.com>
To:     <matthias.bgg@kernel.org>
CC:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <p.zabel@pengutronix.de>, <airlied@linux.ie>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <ulrich.hecht+renesas@gmail.com>,
        <laurent.pinchart@ideasonboard.com>,
        <enric.balletbo@collabora.com>, <devicetree@vger.kernel.org>,
        <drinkcat@chromium.org>, <frank-w@public-files.de>,
        <sean.wang@mediatek.com>, <linux-kernel@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <wens@csie.org>,
        <linux-mediatek@lists.infradead.org>, <rdunlap@infradead.org>,
        <hsinyi@chromium.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>,
        Matthias Brugger <mbrugger@suse.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Weiyi Lu <weiyi.lu@mediatek.com>,
        mtk01761 <wendell.lin@mediatek.com>
Date:   Fri, 14 Feb 2020 14:42:57 +0800
In-Reply-To: <20200213201953.15268-2-matthias.bgg@kernel.org>
References: <20200213201953.15268-1-matthias.bgg@kernel.org>
         <20200213201953.15268-2-matthias.bgg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksIE1hdHRoaWFzOg0KDQpPbiBUaHUsIDIwMjAtMDItMTMgYXQgMjE6MTkgKzAxMDAsIG1hdHRo
aWFzLmJnZ0BrZXJuZWwub3JnIHdyb3RlOg0KPiBGcm9tOiBNYXR0aGlhcyBCcnVnZ2VyIDxtYnJ1
Z2dlckBzdXNlLmNvbT4NCj4gDQo+IFRoZSBtbXN5cyBibG9jayBwcm92aWRlcyByZWdpc3RlcnMg
YW5kIGNsb2NrcyBmb3IgdGhlIGRpc3BsYXkNCj4gc3Vic3lzdGVtLiBUaGUgYmluZGluZyBkZXNj
cmlwdGlvbiBzaG91bGQgdGhlcmVmb3JlIGxpdmUgdG9nZXRoZXIgd2l0aA0KPiB0aGUgcmVzdCBv
ZiB0aGUgZGlzcGxheSBkZXNjcmlwdGlvbnMuIE1vdmUgaXQgdG8gZGlzcGxheS9tZWRpYXRlay4N
Cj4gDQoNClllcywgZm9yIHRoZSB1cHN0cmVhbWVkIGRyaXZlciwgb25seSBkaXNwbGF5IChEUk0p
IHVzZSBtbXN5cyBjbG9jay4gRm9yDQpzb21lIE1EUCBwYXRjaGVzIFsxXSBpbiBwcm9ncmVzcywg
TURQIGFsc28gdXNlIG1tc3lzIGNsb2NrLiBTbyB3ZSBqdXN0DQpjb25zaWRlciB3aGF0J3MgdXBz
dHJlYW1lZCBub3c/DQoNClsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEx
MTQwNzQ3Lw0KDQpSZWdhcmRzLA0KQ0sNCg0KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBCcnVn
Z2VyIDxtYnJ1Z2dlckBzdXNlLmNvbT4NCj4gDQo+IC0tLQ0KPiANCj4gQ2hhbmdlcyBpbiB2NzoN
Cj4gLSBtb3ZlIHRoZSBiaW5kaW5nIGRlc2NyaXB0aW9uDQo+IA0KPiBDaGFuZ2VzIGluIHY2OiBO
b25lDQo+IENoYW5nZXMgaW4gdjU6IE5vbmUNCj4gQ2hhbmdlcyBpbiB2NDogTm9uZQ0KPiBDaGFu
Z2VzIGluIHYzOiBOb25lDQo+IENoYW5nZXMgaW4gdjI6IE5vbmUNCj4gDQo+ICAuLi4vYmluZGlu
Z3Mve2FybSA9PiBkaXNwbGF5fS9tZWRpYXRlay9tZWRpYXRlayxtbXN5cy50eHQgICAgICAgICB8
IDANCj4gIDEgZmlsZSBjaGFuZ2VkLCAwIGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pDQo+
ICByZW5hbWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3thcm0gPT4gZGlzcGxh
eX0vbWVkaWF0ZWsvbWVkaWF0ZWssbW1zeXMudHh0ICgxMDAlKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWss
bW1zeXMudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVk
aWF0ZWsvbWVkaWF0ZWssbW1zeXMudHh0DQo+IHNpbWlsYXJpdHkgaW5kZXggMTAwJQ0KPiByZW5h
bWUgZnJvbSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrL21l
ZGlhdGVrLG1tc3lzLnR4dA0KPiByZW5hbWUgdG8gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbW1zeXMudHh0DQoNCg==

