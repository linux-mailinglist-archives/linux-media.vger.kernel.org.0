Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6124E45FC35
	for <lists+linux-media@lfdr.de>; Sat, 27 Nov 2021 03:48:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349492AbhK0CwE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 21:52:04 -0500
Received: from mailgw01.mediatek.com ([60.244.123.138]:42996 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230193AbhK0CuD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 21:50:03 -0500
X-UUID: 424fd6bf6977401d9759dd1f4bd3dce0-20211127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=Xwnnc0yRrgLNUO+A6mfKrlsVJTbuBikrg6HCN5kbh9s=;
        b=iL1hYK/BhAnlDgiIzvxlvV+71SQQZX5rbpFfOcCt6YAA3hR33ZYtF56/IjCI8vMAHfSho9F7612Hh2MY0yDJvQLNUjXUcfImDmC9mfDWCBlKEZelsgJQQ9mGO3fyEuoeUiC8DvP+KSYfi7EAjXKfstFF8Yab8FQZdvb41B0ThUs=;
X-UUID: 424fd6bf6977401d9759dd1f4bd3dce0-20211127
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <yong.wu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 2108519851; Sat, 27 Nov 2021 10:46:46 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Sat, 27 Nov 2021 10:46:45 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 27 Nov 2021 10:46:44 +0800
Message-ID: <6abef78f6447c626b737fd35688f421c29871f43.camel@mediatek.com>
Subject: Re: [PATCH 1/2] iommu/mediatek: Always tlb_flush_all when each PM
 resume
From:   Yong Wu <yong.wu@mediatek.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
CC:     <kernel@collabora.com>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:MEDIATEK IOMMU DRIVER" 
        <linux-mediatek@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <sebastian.reichel@collabora.com>,
        <iommu@lists.linux-foundation.org>
Date:   Sat, 27 Nov 2021 10:46:44 +0800
In-Reply-To: <20211122104400.4160-2-dafna.hirschfeld@collabora.com>
References: <20211122104400.4160-1-dafna.hirschfeld@collabora.com>
         <20211122104400.4160-2-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgRGFmbmEsDQoNClNvcnJ5IGZvciByZXBseSBsYXRlLg0KDQpPbiBNb24sIDIwMjEtMTEtMjIg
YXQgMTI6NDMgKzAyMDAsIERhZm5hIEhpcnNjaGZlbGQgd3JvdGU6DQo+IEZyb206IFlvbmcgV3Ug
PHlvbmcud3VAbWVkaWF0ZWsuY29tPg0KPiANCj4gUHJlcGFyZSBmb3IgMiBIV3MgdGhhdCBzaGFy
aW5nIHBndGFibGUgaW4gZGlmZmVyZW50IHBvd2VyLWRvbWFpbnMuDQo+IA0KPiBXaGVuIHRoZXJl
IGFyZSAyIE00VSBIV3MsIGl0IG1heSBoYXMgcHJvYmxlbSBpbiB0aGUgZmx1c2hfcmFuZ2UgaW4N
Cj4gd2hpY2gNCj4gd2UgZ2V0IHRoZSBwbV9zdGF0dXMgdmlhIHRoZSBtNHUgZGV2LCBCVVQgdGhh
dCBmdW5jdGlvbiBkb24ndCByZWZsZWN0DQo+IHRoZQ0KPiByZWFsIHBvd2VyLWRvbWFpbiBzdGF0
dXMgb2YgdGhlIEhXIHNpbmNlIHRoZXJlIG1heSBiZSBvdGhlciBIVyBhbHNvDQo+IHVzZQ0KPiB0
aGF0IHBvd2VyLWRvbWFpbi4NCj4gDQo+IFRoZSBmdW5jdGlvbiBkbWFfYWxsb2NfYXR0cnMgaGVs
cCBhbGxvY2F0ZSB0aGUgaW9tbXUgYnVmZmVyIHdoaWNoDQo+IG5lZWQgdGhlIGNvcnJlc3BvbmRp
bmcgcG93ZXIgZG9tYWluIHNpbmNlIHRsYiBmbHVzaCBpcyBuZWVkZWQgd2hlbg0KPiBwcmVwYXJp
bmcgaW92YS4gQlVUIHRoaXMgZnVuY3Rpb24gb25seSBpcyBmb3IgYWxsb2NhdGluZyBidWZmZXIs
DQo+IHdlIGhhdmUgbm8gZ29vZCByZWFzb24gdG8gcmVxdWVzdCB0aGUgdXNlciBhbHdheXMgY2Fs
bCBwbV9ydW50aW1lX2dldA0KPiBiZWZvcmUgY2FsbGluZyBkbWFfYWxsb2NfeHh4LiBUaGVyZWZv
cmUsIHdlIGFkZCBhIHRsYl9mbHVzaF9hbGwNCj4gaW4gdGhlIHBtX3J1bnRpbWVfcmVzdW1lIHRv
IG1ha2Ugc3VyZSB0aGUgdGxiIGFsd2F5cyBpcyBjbGVhbi4NCj4gDQo+IEFub3RoZXIgc29sdXRp
b24gaXMgYWx3YXlzIGNhbGwgcG1fcnVudGltZV9nZXQgaW4gdGhlDQo+IHRsYl9mbHVzaF9yYW5n
ZS4NCj4gVGhpcyB3aWxsIHRyaWdnZXIgcG0gcnVudGltZSByZXN1bWUvYmFja3VwIHNvIG9mdGVu
IHdoZW4gdGhlIGlvbW11DQo+IHBvd2VyIGlzIG5vdCBhY3RpdmUgYXQgc29tZSB0aW1lKG1lYW5z
IHVzZXIgZG9uJ3QgY2FsbCBwbV9ydW50aW1lX2dldA0KPiBiZWZvcmUgY2FsbGluZyBkbWFfYWxs
b2NfeHh4KSwgVGhpcyBtYXkgY2F1c2UgdGhlIHBlcmZvcm1hbmNlIGRyb3AuDQo+IHRodXMgd2Ug
ZG9uJ3QgdXNlIHRoaXMuDQo+IA0KPiBJbiBvdGhlciBjYXNlLCB0aGUgaW9tbXUncyBwb3dlciBz
aG91bGQgYWx3YXlzIGJlIGFjdGl2ZSB2aWEgZGV2aWNlDQo+IGxpbmsgd2l0aCBzbWkuDQo+IA0K
PiBUaGUgcHJldmlvdXMgU29DIGRvbid0IGhhdmUgUE0gZXhjZXB0IG10ODE5Mi4gdGhlIG10ODE5
MiBJT01NVSBpcw0KPiBkaXNwbGF5J3MNCj4gcG93ZXItZG9tYWluIHdoaWNoIG5lYXJseSBhbHdh
eXMgaXMgZW5hYmxlZC4gdGh1cyBubyBuZWVkIGZpeCB0YWdzDQo+IGhlcmUuDQo+IFByZXBhcmUg
Zm9yIG10ODE5NS4NCg0KSW4gdGhpcyBwYXRjaHNldCwgdGhpcyBtZXNzYWdlIHNob3VsZCBiZSBu
b3QgcHJvcGVyLiBJIHRoaW5rIHlvdSBjb3VsZA0KYWRkIHRoZSBjb21tZW50IHdoeSB0aGlzIHBh
dGNoIGlzIG5lZWRlZCBpbiBtdDgxNzMuDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFlvbmcgV3Ug
PHlvbmcud3VAbWVkaWF0ZWsuY29tPg0KPiBbaW1wb3J2aWUgaW5saW5lIGRvY10NCj4gU2lnbmVk
LW9mZi1ieTogRGFmbmEgSGlyc2NoZmVsZCA8ZGFmbmEuaGlyc2NoZmVsZEBjb2xsYWJvcmEuY29t
Pg0KPiAtLS0NCj4gIGRyaXZlcnMvaW9tbXUvbXRrX2lvbW11LmMgfCA3ICsrKysrKysNCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2lvbW11L210a19pb21tdS5jIGIvZHJpdmVycy9pb21tdS9tdGtfaW9tbXUuYw0KPiBpbmRleCAy
NWI4MzQxMDQ3OTAuLjI4ZGM0Yjk1YjZkOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9pb21tdS9t
dGtfaW9tbXUuYw0KPiArKysgYi9kcml2ZXJzL2lvbW11L210a19pb21tdS5jDQo+IEBAIC05NjQs
NiArOTY0LDEzIEBAIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQNCj4gbXRrX2lvbW11X3J1bnRp
bWVfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gIAkJcmV0dXJuIHJldDsNCj4gIAl9DQo+
ICANCj4gKwkvKg0KPiArCSAqIFVzZXJzIG1heSBhbGxvY2F0ZSBkbWEgYnVmZmVyIGJlZm9yZSB0
aGV5IGNhbGwNCj4gcG1fcnVudGltZV9nZXQsDQo+ICsJICogaW4gd2hpY2ggY2FzZSBpdCB3aWxs
IGxhY2sgdGhlIG5lY2Vzc2FyeSB0bGIgZmx1c2guDQo+ICsJICogVGh1cywgbWFrZSBzdXJlIHRv
IHVwZGF0ZSB0aGUgdGxiIGFmdGVyIGVhY2ggUE0gcmVzdW1lLg0KPiArCSAqLw0KPiArCW10a19p
b21tdV90bGJfZmx1c2hfYWxsKGRhdGEpOw0KDQpUaGlzIHNob3VsZCBub3Qgd29yay4gc2luY2Ug
Y3VycmVudCB0aGUgKl90bGJfZmx1c2hfYWxsIGNhbGwNCnBtX3J1bnRpbWVfZ2V0X2lmX2luX3Vz
ZSB3aGljaCB3aWxsIGFsd2F5cyByZXR1cm4gMCB3aGVuIGl0IGNhbGxlZCBmcm9tDQp0aGlzIHJ1
bnRpbWVfY2IgaW4gbXkgdGVzdC4gdGh1cywgSXQgd29uJ3QgZG8gdGhlIHRsYl9mbHVzaF9hbGwN
CmFjdHVhbGx5Lg0KDQpJIGd1ZXNzIHRoaXMgYWxzbyBkZXBlbmQgb24gdGhlc2UgdHdvIHBhdGNo
ZXMgb2YgbXQ4MTk1IHYzLg0KW1BBVENIIHYzIDA5LzMzXSBpb21tdS9tZWRpYXRlazogUmVtb3Zl
IGZvcl9lYWNoX200dSBpbiB0bGJfc3luY19hbGwNCltQQVRDSCB2MyAxMC8zM10gaW9tbXUvbWVk
aWF0ZWs6IEFkZCB0bGJfbG9jayBpbiB0bGJfZmx1c2hfYWxsDQoNCmxpa2UgaW4gWzEwLzMzXSwg
SSBhZGRlZCBhIG10a19pb21tdV90bGJfZG9fZmx1c2hfYWxsIHdoaWNoIGRvbid0IGhhdmUNCnRo
ZSBwbSBvcGVyYXRpb24uDQoNClRoaXMgbG9va3MgaGFzIGEgZGVwZW5kZW5jZS4gTGV0IG1lIGtu
b3cgaWYgSSBjYW4gaGVscCB0aGlzLg0KDQo+ICsNCj4gIAkvKg0KPiAgCSAqIFVwcG9uIGZpcnN0
IHJlc3VtZSwgb25seSBlbmFibGUgdGhlIGNsayBhbmQgcmV0dXJuLCBzaW5jZQ0KPiB0aGUgdmFs
dWVzIG9mIHRoZQ0KPiAgCSAqIHJlZ2lzdGVycyBhcmUgbm90IHlldCBzZXQuDQo=

