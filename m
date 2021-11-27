Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0E8545FC37
	for <lists+linux-media@lfdr.de>; Sat, 27 Nov 2021 03:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351364AbhK0CwO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 21:52:14 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:53750 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S234464AbhK0CuN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 21:50:13 -0500
X-UUID: 63097bdb89564466aacb8ffc82d8cb9c-20211127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=ujgxNDgOxn13iafpFO6sRZICJ73MLq1oFrLOiv1fYeY=;
        b=bPmANuoT3cfKXUNqiiCIKIBt36G5QsT5X1foyd6PeX8RDglm4eoXsdsdzOiQLfyxvLnjJUNQQ7x+RBMns+IqBm5AIbKu7ltcdy/u9XRkTjZNLyVeNg2nXZyZCj/z9wMAZRwagN5KI/8k1+yQZ73y7AJ7TWxNAecP+bhl8z43yow=;
X-UUID: 63097bdb89564466aacb8ffc82d8cb9c-20211127
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <yong.wu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1665839108; Sat, 27 Nov 2021 10:46:57 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 27 Nov 2021 10:46:55 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Sat, 27 Nov
 2021 10:46:55 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 27 Nov 2021 10:46:54 +0800
Message-ID: <afb46ad6ca9477a2bf71233858406caa6ccb1588.camel@mediatek.com>
Subject: Re: [PATCH 2/2] iommu/mediatek: always check runtime PM status in
 tlb flush range callback
From:   Yong Wu <yong.wu@mediatek.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        <iommu@lists.linux-foundation.org>
CC:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        <kernel@collabora.com>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:MEDIATEK IOMMU DRIVER" 
        <linux-mediatek@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list" <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>
Date:   Sat, 27 Nov 2021 10:46:54 +0800
In-Reply-To: <20211122104400.4160-3-dafna.hirschfeld@collabora.com>
References: <20211122104400.4160-1-dafna.hirschfeld@collabora.com>
         <20211122104400.4160-3-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gTW9uLCAyMDIxLTExLTIyIGF0IDEyOjQ0ICswMjAwLCBEYWZuYSBIaXJzY2hmZWxkIHdyb3Rl
Og0KPiBGcm9tOiBTZWJhc3RpYW4gUmVpY2hlbCA8c2ViYXN0aWFuLnJlaWNoZWxAY29sbGFib3Jh
LmNvbT4NCj4gDQo+IEluIGNhc2Ugb2YgdjRsMl9yZXFidWZzKCkgaXQgaXMgcG9zc2libGUsIHRo
YXQgYSBUTEIgZmx1c2ggaXMgZG9uZQ0KPiB3aXRob3V0IHJ1bnRpbWUgUE0gYmVpbmcgZW5hYmxl
ZC4gSW4gdGhhdCBjYXNlIHRoZSAiUGFydGlhbCBUTEIgZmx1c2gNCj4gdGltZWQgb3V0LCBmYWxs
aW5nIGJhY2sgdG8gZnVsbCBmbHVzaCIgd2FybmluZyBpcyBwcmludGVkLg0KPiANCj4gQ29tbWl0
IGMwYjU3NTgxYjczYiAoImlvbW11L21lZGlhdGVrOiBBZGQgcG93ZXItZG9tYWluIG9wZXJhdGlv
biIpDQo+IGludHJvZHVjZWQgaGFzX3BtIGFzIG9wdGltaXphdGlvbiB0byBhdm9pZCBjaGVja2lu
ZyBydW50aW1lIFBNDQo+IHdoZW4gdGhlcmUgaXMgbm8gcG93ZXIgZG9tYWluIGF0dGFjaGVkLiBC
dXQgd2l0aG91dCB0aGUgUE0gZG9tYWluDQo+IHRoZXJlIGlzIHN0aWxsIHRoZSBkZXZpY2UgZHJp
dmVyJ3MgcnVudGltZSBQTSBzdXNwZW5kIGhhbmRsZXIsIHdoaWNoDQo+IGRpc2FibGVzIHRoZSBj
bG9jay4gVGh1cyBmbHVzaGluZyBzaG91bGQgYWxzbyBiZSBhdm9pZGVkIHdoZW4gdGhlcmUNCj4g
aXMgbm8gUE0gZG9tYWluIGludm9sdmVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2ViYXN0aWFu
IFJlaWNoZWwgPHNlYmFzdGlhbi5yZWljaGVsQGNvbGxhYm9yYS5jb20+DQo+IFJldmlld2VkLWJ5
OiBEYWZuYSBIaXJzY2hmZWxkIDxkYWZuYS5oaXJzY2hmZWxkQGNvbGxhYm9yYS5jb20+DQoNClJl
dmlld2VkLWJ5OiBZb25nIFd1IDx5b25nLnd1QG1lZGlhdGVrLmNvbT4NCg0KPiAtLS0NCj4gIGRy
aXZlcnMvaW9tbXUvbXRrX2lvbW11LmMgfCAxMCArKystLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvaW9tbXUvbXRrX2lvbW11LmMgYi9kcml2ZXJzL2lvbW11L210a19pb21tdS5jDQo+IGlu
ZGV4IDI4ZGM0Yjk1YjZkOS4uYjA1MzVmY2ZkMWQ3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2lv
bW11L210a19pb21tdS5jDQo+ICsrKyBiL2RyaXZlcnMvaW9tbXUvbXRrX2lvbW11LmMNCj4gQEAg
LTIyNywxNiArMjI3LDEzIEBAIHN0YXRpYyB2b2lkDQo+IG10a19pb21tdV90bGJfZmx1c2hfcmFu
Z2Vfc3luYyh1bnNpZ25lZCBsb25nIGlvdmEsIHNpemVfdCBzaXplLA0KPiAgCQkJCQkgICBzaXpl
X3QgZ3JhbnVsZSwNCj4gIAkJCQkJICAgc3RydWN0IG10a19pb21tdV9kYXRhICpkYXRhKQ0KPiAg
ew0KPiAtCWJvb2wgaGFzX3BtID0gISFkYXRhLT5kZXYtPnBtX2RvbWFpbjsNCj4gIAl1bnNpZ25l
ZCBsb25nIGZsYWdzOw0KPiAgCWludCByZXQ7DQo+ICAJdTMyIHRtcDsNCj4gIA0KPiAgCWZvcl9l
YWNoX200dShkYXRhKSB7DQo+IC0JCWlmIChoYXNfcG0pIHsNCj4gLQkJCWlmIChwbV9ydW50aW1l
X2dldF9pZl9pbl91c2UoZGF0YS0+ZGV2KSA8PSAwKQ0KPiAtCQkJCWNvbnRpbnVlOw0KPiAtCQl9
DQo+ICsJCWlmIChwbV9ydW50aW1lX2dldF9pZl9pbl91c2UoZGF0YS0+ZGV2KSA8PSAwKQ0KPiAr
CQkJY29udGludWU7DQo+ICANCj4gIAkJc3Bpbl9sb2NrX2lycXNhdmUoJmRhdGEtPnRsYl9sb2Nr
LCBmbGFncyk7DQo+ICAJCXdyaXRlbF9yZWxheGVkKEZfSU5WTERfRU4xIHwgRl9JTlZMRF9FTjAs
DQo+IEBAIC0yNjEsOCArMjU4LDcgQEAgc3RhdGljIHZvaWQNCj4gbXRrX2lvbW11X3RsYl9mbHVz
aF9yYW5nZV9zeW5jKHVuc2lnbmVkIGxvbmcgaW92YSwgc2l6ZV90IHNpemUsDQo+ICAJCXdyaXRl
bF9yZWxheGVkKDAsIGRhdGEtPmJhc2UgKyBSRUdfTU1VX0NQRV9ET05FKTsNCj4gIAkJc3Bpbl91
bmxvY2tfaXJxcmVzdG9yZSgmZGF0YS0+dGxiX2xvY2ssIGZsYWdzKTsNCj4gIA0KPiAtCQlpZiAo
aGFzX3BtKQ0KPiAtCQkJcG1fcnVudGltZV9wdXQoZGF0YS0+ZGV2KTsNCj4gKwkJcG1fcnVudGlt
ZV9wdXQoZGF0YS0+ZGV2KTsNCj4gIAl9DQo+ICB9DQo+ICANCg==

