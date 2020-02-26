Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2986116F74D
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 06:32:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbgBZFcA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 00:32:00 -0500
Received: from Mailgw01.mediatek.com ([1.203.163.78]:15925 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725890AbgBZFcA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 00:32:00 -0500
X-UUID: 7c124bf777db4e95b6cad6f47f4dd953-20200226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=JCK+t8ISBOj7yWNmdTukq+mypW1MjFgO15pFBPhk7bk=;
        b=TIkEoJF2SM4l0QsxZT2iazuppWT5V7ItVlo85vmM74EdGP5w4F4oqgVNqoWxhIQ/pY6mzM661VAOTQRmidgQCysQ9/DB9yA+dWulGdfEBKuen2rS6bL7gY478KuFCGDsRUr8GGhXBs1z1mjjeKGAbkaJkJ7qpyYNe3nJhqEbPxQ=;
X-UUID: 7c124bf777db4e95b6cad6f47f4dd953-20200226
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <gtk_ruiwang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1646308909; Wed, 26 Feb 2020 13:31:46 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Wed, 26 Feb
 2020 13:30:29 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 26 Feb 2020 13:30:22 +0800
Message-ID: <1582695101.6276.21.camel@mhfsdcap03>
Subject: Re: [PATCH] mediatek: move MT8173 VPU FW to subfolder
From:   gtk_ruiwang <gtk_ruiwang@mediatek.com>
To:     Alexandre Courbot <acourbot@chromium.org>
CC:     <linux-firmware@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, Tomasz Figa <tfiga@chromium.org>,
        <PoChun.Lin@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>
Date:   Wed, 26 Feb 2020 13:31:41 +0800
In-Reply-To: <CAPBb6MWcoSjvxj5tHvWTiQWqY5CdgTemCmyhmio0yZMEq-4VWQ@mail.gmail.com>
References: <20200226033646.20949-1-gtk_ruiwang@mediatek.com>
         <20200226033646.20949-2-gtk_ruiwang@mediatek.com>
         <CAPBb6MWN6bXfYvpBJ6XyPCuvJSpdxNOf4Z9RbY0jbnB5=JX_sQ@mail.gmail.com>
         <1582690790.6276.19.camel@mhfsdcap03>
         <CAPBb6MWcoSjvxj5tHvWTiQWqY5CdgTemCmyhmio0yZMEq-4VWQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9A0097486F9233037774B591F3A3B223952FD4F850E57BBE71392346B1574B372000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RGVhciBBbGV4LA0KDQp3ZSBoYXZlIHN1Ym1pdCBhIG5ldyBwYXRjaCB0byBsaW51eC1maXJtd2Fy
ZSwgYW5kIHVwZGF0ZSBXSEVOQ0UgZmlsZS4NCg0KcGxlYXNlIGtpbmRseSBoZWxwIHRvIHJldmll
dyBpdC4NCg0KVGhhbmtzDQpCZXN0IFJlZ2FyZHMNCg0KT24gV2VkLCAyMDIwLTAyLTI2IGF0IDEz
OjQ1ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90ZToNCj4gT24gV2VkLCBGZWIgMjYsIDIw
MjAgYXQgMToyMCBQTSBndGtfcnVpd2FuZyA8Z3RrX3J1aXdhbmdAbWVkaWF0ZWsuY29tPiB3cm90
ZToNCj4gPg0KPiA+IERlYXIgQWxleCwNCj4gPg0KPiA+IERvIHlvdSBtZWFuIHRvIGNyZWF0ZSB0
d28gc3ltYm9saWMgbGluaz8NCj4gPg0KPiA+IGxyd3hyd3hyd3ggIDEgZ3RrX3J1aXdhbmcgZ3Rr
X3J1aXdhbmcgICAgICAyNSBGZWIgMjYgMTE6NTIgdnB1X2QuYmluIC0+DQo+ID4gbWVkaWF0ZWsv
bXQ4MTczL3ZwdV9kLmJpbg0KPiA+IGxyd3hyd3hyd3ggIDEgZ3RrX3J1aXdhbmcgZ3RrX3J1aXdh
bmcgICAgICAyNSBGZWIgMjYgMTE6NTIgdnB1X3AuYmluIC0+DQo+ID4gbWVkaWF0ZWsvbXQ4MTcz
L3ZwdV9wLmJpbg0KPiANCj4gWWVzLCBvdGhlcndpc2Ugb2xkZXIga2VybmVscyB3aWxsIGJlY29t
ZSB1bmFibGUgdG8gdXNlIHRoZSBmaXJtd2FyZS4gSQ0KPiBkb24ndCBrbm93IHdoZXRoZXIgdGhl
c2UgYXJlIHN1cHBvc2VkIHRvIHN0YXkgZm9yZXZlciBvciB3aGV0aGVyIHdlDQo+IGNhbiByZW1v
dmUgdGhlbSBhZnRlciBhIHdoaWxlLi4uIHByZXN1bWFibHkgdGhlIGZvcm1lci4NCj4gDQo+IEFs
c28gdGhlIFdIRU5DRSBmaWxlIHNob3VsZCBwcm9iYWJseSBiZSB1cGRhdGVkIHRvIGxpc3QgdGhl
IG5ldyBmaWxlcy4NCj4gDQo+ID4NCj4gPiB3ZSBjcmVhdGUgdGhlbSBhdCB0aGUgbGludXgtZmly
bXdhcmUgcm9vdCBmb2xkZXIuDQo+ID4NCj4gPiBUaGFua3MNCj4gPiBCZXN0IFJlZ2FyZHMNCj4g
Pg0KPiA+IE9uIFdlZCwgMjAyMC0wMi0yNiBhdCAxMjo0MSArMDkwMCwgQWxleGFuZHJlIENvdXJi
b3Qgd3JvdGU6DQo+ID4gPiBPbiBXZWQsIEZlYiAyNiwgMjAyMCBhdCAxMjozOCBQTSA8Z3RrX3J1
aXdhbmdAbWVkaWF0ZWsuY29tPiB3cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4gRnJvbTogZ3RrX3J1
aXdhbmcgPGd0a19ydWl3YW5nQG1lZGlhdGVrLmNvbT4NCj4gPiA+ID4NCj4gPiA+ID4gQ3VycmVu
dGx5IHZwdV9kLmJpbiBhbmQgdnB1X3AuYmluIGFyZSBhdCB0aGUgcm9vdCBvZg0KPiA+ID4gPiBs
aW51eC1maXJtd2FyZSBnaXQgdHJlZSwgaXQncyBub3QgYXBwcm9wcmlhdGUgc28gd2UgbW92ZQ0K
PiA+ID4gPiB0aGVtIHRvIHN1YmZvbGRlciBtZWRpYXRlay9tdDgxNzMNCj4gPiA+ID4NCj4gPiA+
ID4gUmVsZWFzZSBWZXJzaW9uOiAxLjEuNA0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBSdWkgV2FuZyA8Z3RrX3J1aXdhbmdAbWVkaWF0ZWsuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+
ID4gIHZwdV9kLmJpbiA9PiBtZWRpYXRlay9tdDgxNzMvdnB1X2QuYmluIHwgQmluDQo+ID4gPiA+
ICB2cHVfcC5iaW4gPT4gbWVkaWF0ZWsvbXQ4MTczL3ZwdV9wLmJpbiB8IEJpbg0KPiA+ID4gPiAg
MiBmaWxlcyBjaGFuZ2VkLCAwIGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pDQo+ID4gPiA+
ICByZW5hbWUgdnB1X2QuYmluID0+IG1lZGlhdGVrL210ODE3My92cHVfZC5iaW4gKDEwMCUpDQo+
ID4gPiA+ICByZW5hbWUgdnB1X3AuYmluID0+IG1lZGlhdGVrL210ODE3My92cHVfcC5iaW4gKDEw
MCUpDQo+ID4gPg0KPiA+ID4gVGhpcyBpcyBuaWNlIGFzIGl0IHJlbW92ZXMgc29tZSBzdHVmZiBm
cm9tIHRoZSByb290LCBidXQgZm9yDQo+ID4gPiBjb21wYXRpYmlsaXR5IHdpdGggb2xkZXIga2Vy
bmVscyB0aGF0IGRvbid0IGtub3cgYWJvdXQgdGhlIG5ldyBwYXRoDQo+ID4gPiBzaG91bGRuJ3Qg
d2UgYXQgbGVhc3QgdGVtcG9yYXJpbHkgY3JlYXRlIGEgc3ltYm9saWMgbGluayBiZXR3ZWVuIHRo
ZQ0KPiA+ID4gb2xkIGxvY2F0aW9uIGFuZCB0aGUgbmV3IG9uZT8NCj4gPg0KDQo=

