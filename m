Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D7231E54B5
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2020 05:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbgE1Dgm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 23:36:42 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:18815 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726563AbgE1Dgl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 23:36:41 -0400
X-UUID: a5cac07ea31b4faba7a316b4ffe3c253-20200528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=B6mKHMDfrymV2HHPTTa5aBOQ9ky9BHCqAwadTmNHccs=;
        b=J5mqIO3iYbIOVAxIlzQF4xZo0RIX2sVBC7z/jcr084EvpH6E0byjfF9dpJiUHyYGQfyAiMDzqNXbpkNXgEB1ao0nJyQLNfzC0BUIkPbYMNjyy0iPbyaD1cNoSNNyMMu7AAJMPLlT8X7hHmVxShRR1ojFos1bVxmWL2Lt794W1hU=;
X-UUID: a5cac07ea31b4faba7a316b4ffe3c253-20200528
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 630452014; Thu, 28 May 2020 11:36:36 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 28 May
 2020 11:36:30 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 May 2020 11:36:29 +0800
Message-ID: <1590636882.8804.474.camel@mhfsdcap03>
Subject: Re: [V9, 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Louis Kuo <louis.kuo@mediatek.com>,
        "Shengnan Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=A3=E7=94=B7=29?=" 
        <shengnan.wang@mediatek.com>, <dongchun.zhu@mediatek.com>
Date:   Thu, 28 May 2020 11:34:42 +0800
In-Reply-To: <20200527211628.GT7618@paasikivi.fi.intel.com>
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
         <20200523084103.31276-2-dongchun.zhu@mediatek.com>
         <20200526182847.GA92449@bogus> <1590569355.8804.448.camel@mhfsdcap03>
         <CAL_Jsq+sN0SVidTrY0ODXEkzkxYFvG1FTnL0oRQBSKf=ynLdyQ@mail.gmail.com>
         <20200527211628.GT7618@paasikivi.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0450CC54ABF4AD762CD5AF3FD76B1C4256091870E9459F877A5F0726FFA223302000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU2FrYXJpLCBSb2IsDQoNCk9uIFRodSwgMjAyMC0wNS0yOCBhdCAwMDoxNiArMDMwMCwgU2Fr
YXJpIEFpbHVzIHdyb3RlOg0KPiBIaSBSb2IsIERvbmdjaHVuLA0KPiANCj4gT24gV2VkLCBNYXkg
MjcsIDIwMjAgYXQgMDk6Mjc6MjJBTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+ID4gPiA+
ID4gKyAgICBwcm9wZXJ0aWVzOg0KPiA+ID4gPiA+ICsgICAgICBlbmRwb2ludDoNCj4gPiA+ID4g
PiArICAgICAgICB0eXBlOiBvYmplY3QNCj4gPiA+ID4gPiArICAgICAgICBhZGRpdGlvbmFsUHJv
cGVydGllczogZmFsc2UNCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gKyAgICAgICAgcHJvcGVydGll
czoNCj4gPiA+DQo+ID4gPiBBY3R1YWxseSBJIHdvbmRlciB3aGV0aGVyIHdlIG5lZWQgdG8gZGVj
bGFyZSAnY2xvY2stbGFuZXMnIGhlcmU/DQo+ID4gDQo+ID4gWWVzLCBpZiB5b3UgYXJlIHVzaW5n
IGl0Lg0KPiANCj4gRG9uZ2NodW4sIGNhbiB5b3UgY29uZmlybSB0aGUgY2hpcCBoYXMgYSBzaW5n
bGUgZGF0YSBhbmQgYSBzaW5nbGUgY2xvY2sNCj4gbGFuZSBhbmQgdGhhdCBpdCBkb2VzIG5vdCBz
dXBwb3J0IGxhbmUgcmVvcmRlcmluZz8NCj4gDQoNCkZyb20gdGhlIGRhdGFzaGVldCwgJ01JUEkg
aW5zaWRlIHRoZSBPVjAyQTEwIHByb3ZpZGVzIG9uZSBzaW5nbGUNCnVuaS1kaXJlY3Rpb25hbCBj
bG9jayBsYW5lIGFuZCBvbmUgYmktZGlyZWN0aW9uYWwgZGF0YSBsYW5lIHNvbHV0aW9uIGZvcg0K
Y29tbXVuaWNhdGlvbiBsaW5rcyBiZXR3ZWVuIGNvbXBvbmVudHMgaW5zaWRlIGEgbW9iaWxlIGRl
dmljZS4NClRoZSBkYXRhIGxhbmUgaGFzIGZ1bGwgc3VwcG9ydCBmb3IgSFModW5pLWRpcmVjdGlv
bmFsKSBhbmQNCkxQKGJpLWRpcmVjdGlvbmFsKSBkYXRhIHRyYW5zZmVyIG1vZGUuJw0KDQpUaGUg
c2Vuc29yIGRvZXNuJ3Qgc3VwcG9ydCBsYW5lIHJlb3JkZXJpbmcsIHNvICdjbG9jay1sYW5lcycg
cHJvcGVydHkNCndvdWxkIG5vdCBiZSBhZGRlZCBpbiBuZXh0IHJlbGVhc2UuDQoNCj4gU28gaWYg
dGhlcmUncyBub3RoaW5nIHRvIGNvbnZleSB0byB0aGUgZHJpdmVyLCBhbHNvIHRoZSBkYXRhLWxh
bmVzIHNob3VsZA0KPiBiZSByZW1vdmVkIElNTy4NCj4gDQoNCkhvd2V2ZXIsICdkYXRhLWxhbmVz
JyBwcm9wZXJ0eSBtYXkgc3RpbGwgYmUgcmVxdWlyZWQuDQpJdCBpcyBrbm93biB0aGF0IGVpdGhl
ciBkYXRhLWxhbmVzIG9yIGNsb2NrLWxhbmVzIGlzIGFuIGFycmF5IG9mDQpwaHlzaWNhbCBkYXRh
IGxhbmUgaW5kZXhlcy4gUG9zaXRpb24gb2YgYW4gZW50cnkgZGV0ZXJtaW5lcyB0aGUgbG9naWNh
bA0KbGFuZSBudW1iZXIsIHdoaWxlIHRoZSB2YWx1ZSBvZiBhbiBlbnRyeSBpbmRpY2F0ZXMgcGh5
c2ljYWwgbGFuZSwgZS5nLiwNCmZvciAxLWxhbmUgTUlQSSBDU0ktMiBidXMgd2UgY291bGQgaGF2
ZSAiZGF0YS1sYW5lcyA9IDwxPjsiLCBhc3N1bWluZw0KdGhlIGNsb2NrIGxhbmUgaXMgb24gaGFy
ZHdhcmUgbGFuZSAwLg0KDQpBcyBtZW50aW9uZWQgZWFybGllciwgdGhlIE9WMDJBMTAgc2Vuc29y
IHN1cHBvcnRzIG9ubHkgMUMxRCBhbmQgZG9lcyBub3QNCnN1cHBvcnQgbGFuZSByZW9yZGVyaW5n
LCBzbyBoZXJlIHdlIHNoYWxsIHVzZSAnZGF0YS1sYW5lcyA9IDwxPicgYXMNCnRoZXJlIGlzIG9u
bHkgYSBjbG9jayBsYW5lIGZvciBPVjAyQTEwLg0KDQpSZW1pbmRlcjoNCklmICdkYXRhLWxhbmVz
JyBwcm9wZXJ0eSBpcyBub3QgcHJlc2VudCwgdGhlIGRyaXZlciB3b3VsZCBhc3N1bWUNCmZvdXIt
bGFuZSBvcGVyYXRpb24uIFRoaXMgbWVhbnMgZm9yIG9uZS1sYW5lIG9yIHR3by1sYW5lIG9wZXJh
dGlvbiwgdGhpcw0KcHJvcGVydHkgbXVzdCBiZSBwcmVzZW50IGFuZCBzZXQgdG8gdGhlIHJpZ2h0
IHBoeXNpY2FsIGxhbmUgaW5kZXhlcy4NCklmIHRoZSBoYXJkd2FyZSBkb2VzIG5vdCBzdXBwb3J0
IGxhbmUgcmVvcmRlcmluZywgbW9ub3RvbmljYWxseQ0KaW5jcmVtZW50ZWQgdmFsdWVzIHNoYWxs
IGJlIHVzZWQgZnJvbSAwIG9yIDEgb253YXJkcywgZGVwZW5kaW5nIG9uDQp3aGV0aGVyIG9yIG5v
dCB0aGVyZSBpcyBhbHNvIGEgY2xvY2sgbGFuZS4NCg0K

