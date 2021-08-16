Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B61793ECC34
	for <lists+linux-media@lfdr.de>; Mon, 16 Aug 2021 03:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232210AbhHPBLQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Aug 2021 21:11:16 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:47929 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229926AbhHPBLQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Aug 2021 21:11:16 -0400
X-UUID: 670d81ca44984bed8cf7613711b4067c-20210816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=9kQBLZFj5ezpryuZ+bSvNEM9MjxNOcc+IorPW7rMt+o=;
        b=OiGSdtrPuvDuKrtAU8ivFqqPVpUqv9aa8pjJ4z+Wg7gqUbkeoeSrdXxBwvEvF9VDsQBLCtHSxTomjQXg0xe8cIMn6gBnLFWMDnLRLjTGOtjt2p1Vj7CbGhpC2cD1V3+turEWecxQxrDCZcSwfshBV0G95mS/ENIcU0FLPbtnmto=;
X-UUID: 670d81ca44984bed8cf7613711b4067c-20210816
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <houlong.wei@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 597104457; Mon, 16 Aug 2021 09:10:39 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 16 Aug
 2021 09:10:33 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 09:10:32 +0800
Message-ID: <bef757c4a081bfb87aa3b429970e628641bf95a5.camel@mediatek.com>
Subject: Re: [PATCH v6 4/9] media: mtk-mdp: don't pm_run_time_get/put for
 master comp in clock_on
From:   houlong wei <houlong.wei@mediatek.com>
To:     Eizan Miyamoto <eizan@chromium.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "wenst@chromium.org" <wenst@chromium.org>,
        "Yong Wu =?UTF-8?Q?=28=E5=90=B4=E5=8B=87=29?=" <Yong.Wu@mediatek.com>,
        "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
        "Andrew-CT Chen =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?=" 
        <Andrew-CT.Chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Minghsiu Tsai =?UTF-8?Q?=28=E8=94=A1=E6=98=8E=E4=BF=AE=29?=" 
        <Minghsiu.Tsai@mediatek.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>, <houlong.wei@mediatek.com>
Date:   Mon, 16 Aug 2021 09:10:33 +0800
In-Reply-To: <20210802220943.v6.4.Ifd87681955689a08cce4c65e72ee5e8c6d09af95@changeid>
References: <20210802121215.703023-1-eizan@chromium.org>
         <20210802220943.v6.4.Ifd87681955689a08cce4c65e72ee5e8c6d09af95@changeid>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0B2746CA6D771121B2563528A92B8BDB492B9CC0FE92280D4F162E39692BEA842000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gTW9uLCAyMDIxLTA4LTAyIGF0IDIwOjEyICswODAwLCBFaXphbiBNaXlhbW90byB3cm90ZToN
Cj4gVGhlIG9yaWdpbmFsIGludGVudCBvZiBjb21taXQgODY2OThiOTUwNWJiYyAoIm1lZGlhOiBt
dGstbWRwOiBjb252ZXJ0DQo+IG10a19tZHBfZGV2LmNvbXAgYXJyYXkgdG8gbGlzdCIpIHdhcyB0
byBjcmVhdGUgYSBsaXN0IHRvIHRyYWNrIGFsbA0KPiB0aGUNCj4gTURQIGNvbXBvbmVudHMgdGhh
dCBuZWVkZWQgdG8gaGF2ZSB0aGVpciBjbG9ja3MgZW5hYmxlZC9kaXNhYmxlZCB3aGVuDQo+IGNh
bGxpbmcgbXRrX21kcF9jb21wX2Nsb2NrX29uL29mZi4gSG93ZXZlciwgdGhlcmUgd2FzIGEgYnVn
IGluc2lkZQ0KPiBtdGtfbWRwX3JlZ2lzdGVyX2NvbXBvbmVudCB3aGVyZSB0aGUgYXJncyB0byBh
IGNhbGwgdG8gbGlzdF9hZGQgd2VyZQ0KPiBzd2FwcGVkLiBUaGUgcmVzdWx0IGlzIHRoYXQgb25s
eSBvbmUgY29tcG9uZW50IHdhcyBhZGRlZCB0bw0KPiBtdGtfbWRwX2Rldi5jb21wX2xpc3QgYmVj
YXVzZSBjb21wX2xpc3Qgd2FzIGluc3RlYWQgYmVpbmcNCj4gcmVwZWF0ZWRseSBhZGRlZCB0byB0
aGUgc2luZ2xlIGVsZW1lbnQgbGlzdHMgaGVhZGVkIGJ5IGVhY2gNCj4gbXRrX21kcF9jb21wLg0K
PiANCj4gVGhlIG9yZGVyIG9mIHRoZSBhcmdzIHRvIGxpc3RfYWRkIGluIG10a19tZHBfcmVnaXN0
ZXJfY29tcG9uZW50IHdhcw0KPiBmaXhlZCBpbiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3Jn
L3BhdGNoLzExNzQyODk1LyAoRml4IE51bGwNCj4gcG9pbnRlcg0KPiBkZXJlZmVyZW5jZSB3aGVu
IGNhbGxpbmcgbGlzdF9hZGQpLg0KPiANCj4gVGhlbiwgYXMgYSByZXN1bHQgb2YgaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTUzMDc2OS8NCj4gKG10ay1tZHA6IHVzZSBwbV9y
dW50aW1lIGluIE1EUCBjb21wb25lbnQgZHJpdmVyKSBpZiBhbGwgdGhlDQo+IGNvbXBvbmVudHMN
Cj4gYXJlIGFkZGVkIHRvIHRoZSBjb21wb25lbnQgbGlzdCwgdGhlIG1kcCAibWFzdGVyIiAvIHJk
bWEwIGNvbXBvbmVudA0KPiBlbmRzIHVwIGhhdmluZyBwbV9ydW50aW1lX2dldF9zeW5jKCkgY2Fs
bGVkIG9uIGl0IHR3aWNlIHJlY3Vyc2l2ZWx5Og0KPiANCj4gICAgIHJwbV9yZXN1bWUrMHg2OTQv
MHg4ZjgNCj4gICAgIF9fcG1fcnVudGltZV9yZXN1bWUrMHg3Yy8weGEwICoqKk5PVEUqKioNCj4g
ICAgIG10a19tZHBfY29tcF9jbG9ja19vbisweDQ4LzB4MTA0IFttdGtfbWRwXQ0KPiAgICAgbXRr
X21kcF9wbV9yZXN1bWUrMHgyYy8weDQ0IFttdGtfbWRwXQ0KPiAgICAgcG1fZ2VuZXJpY19ydW50
aW1lX3Jlc3VtZSsweDM0LzB4NDgNCj4gICAgIF9fZ2VucGRfcnVudGltZV9yZXN1bWUrMHg2Yy8w
eDgwDQo+ICAgICBnZW5wZF9ydW50aW1lX3Jlc3VtZSsweDEwNC8weDFhYw0KPiAgICAgX19ycG1f
Y2FsbGJhY2srMHgxMjAvMHgyMzgNCj4gICAgIHJwbV9jYWxsYmFjaysweDM0LzB4OGMNCj4gICAg
IHJwbV9yZXN1bWUrMHg3YTAvMHg4ZjgNCj4gICAgIF9fcG1fcnVudGltZV9yZXN1bWUrMHg3Yy8w
eGEwICoqKk5PVEUqKioNCj4gICAgIG10a19tZHBfbTJtX3N0YXJ0X3N0cmVhbWluZysweDJjLzB4
M2MgW210a19tZHBdDQo+IA0KPiAoVGhlIGNhbGxzIHRvIHBtX3J1bnRpbWVfZ2V0X3N5bmMgYXJl
IGlubGluZWQgYW5kIGNvcnJlc3BvbmQgdG8gdGhlDQo+IGNhbGxzIHRvIF9fcG1fcnVudGltZV9y
ZXN1bWUpLiBJdCBpcyBub3QgY29ycmVjdCB0byBoYXZlDQo+IHBtX3J1bnRpbWVfZ2V0X3N5bmMg
Y2FsbGVkIHJlY3Vyc2l2ZWx5IGFuZCB0aGUgc2Vjb25kIGNhbGwgd2lsbCBibG9jaw0KPiBpbmRl
ZmluaXRlbHkuDQo+IA0KPiBBcyBhIHJlc3VsdCBvZiBhbGwgdGhhdCwgdGhpcyBjaGFuZ2UgZmFj
dG9ycw0KPiBtdGtfbWRwX2NvbXBfY2xvY2tfb24vb2ZmDQo+IGludG8gbXRrX21kcF9jb21wX3Bv
d2VyX29uL29mZiBhbmQgbW92ZXMgdGhlIGNhbGxzIHRvDQo+IHBtX3J1bnRpbWVfZ2V0L3B1dCBp
bnRvIHRoZSBwb3dlcl9vbi9vZmYgZnVuY3Rpb25zLg0KPiANCj4gVGhpcyBjaGFuZ2UgdGhlbiBz
cGVjaWFsLWNhc2VzIHRoZSBtYXN0ZXIvcmRtYTAgTURQIGNvbXBvbmVudCBhbmQNCj4gZG9lcw0K
PiB0aGVzZSB0aGluZ3M6DQo+IC0gdGhlIG1hc3Rlci9yZG1hMCBjb21wb25lbnQgaXMgbm90IGFk
ZGVkIHRvIG10a19tZHBfZGV2LmNvbXBfbGlzdA0KPiAtIHRoZSBtYXN0ZXIvcmRtYTAgY29tcG9u
ZW50IGhhcyBpdHMgY2xvY2tzICgqYnV0IG5vdCBwb3dlciopIHRvZ2dsZWQNCj4gICBieSBtdGtf
bXBkX2NvbXBfY2xvY2tfb24vb2ZmIGluc2lkZSBtdGtfbWRwX2Nsb2NrX29uL29mZi4NCj4gLSB0
aGUgb3RoZXIgY29tcG9uZW50cyBoYXZlIHRoZWlyIGNsb2NrcyAqYW5kKiBwb3dlciB0b2dnbGVk
IHdpdGgNCj4gICBtdGtfbWRwX2NvbXBfcG93ZXJfb24vb2ZmLg0KPiANCj4gVGhpcyBjaGFuZ2Ug
aW50cm9kdWNlcyB0aGUgYXNzdW1wdGlvbiB0aGF0IG10a19tZHBfcG1fcmVzdW1lIHdpbGwNCj4g
YWx3YXlzIGJlIGNhbGxlZCB0aG91Z2ggYSBjYWxsYmFjayBmcm9tIHBtX3J1bnRpbWVfZ2V0X3N5
bmMgbWFkZSBvbg0KPiB0aGUNCj4gbWFzdGVyIC8gcmRtYTAgY29tcG9uZW50Lg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogRWl6YW4gTWl5YW1vdG8gPGVpemFuQGNocm9taXVtLm9yZz4NCj4gLS0tDQo+
IA0KDQpSZXZpZXdlZC1ieTogSG91bG9uZyBXZWkgPGhvdWxvbmcud2VpQG1lZGlhdGVrLmNvbT4N
Cg0KPiAobm8gY2hhbmdlcyBzaW5jZSB2MSkNCj4gDQpbLi4uXQ0K

