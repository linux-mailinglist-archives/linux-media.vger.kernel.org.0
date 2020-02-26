Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0098416F665
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 05:20:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbgBZEUS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Feb 2020 23:20:18 -0500
Received: from mailgw02.mediatek.com ([1.203.163.81]:18831 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725788AbgBZEUR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Feb 2020 23:20:17 -0500
X-UUID: ccb90562774a4957965dd6b0554db47b-20200226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=u2ArnXEG5GlsbquUkMe3Hv7WnxknMQJct50ufoK4Bzk=;
        b=W4ZcjTIpIOuv27uaZDxf7RgFFDqU5JjZfVXZCnuaL6E1UkDca92Ob2ImU/5rVd5H+nyL9ceTSItGlu9yhdxDNeoq/QempOEi6ZULBSKwvSb44ac28m2Ghvhy4ngaskCg6M4EdH1QedBOtIvfyYBFRG/iV+GiIaZsx/HZwPzxB2Q=;
X-UUID: ccb90562774a4957965dd6b0554db47b-20200226
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <gtk_ruiwang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 358245205; Wed, 26 Feb 2020 12:19:56 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Wed, 26 Feb
 2020 12:18:38 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 26 Feb 2020 12:18:31 +0800
Message-ID: <1582690790.6276.19.camel@mhfsdcap03>
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
Date:   Wed, 26 Feb 2020 12:19:50 +0800
In-Reply-To: <CAPBb6MWN6bXfYvpBJ6XyPCuvJSpdxNOf4Z9RbY0jbnB5=JX_sQ@mail.gmail.com>
References: <20200226033646.20949-1-gtk_ruiwang@mediatek.com>
         <20200226033646.20949-2-gtk_ruiwang@mediatek.com>
         <CAPBb6MWN6bXfYvpBJ6XyPCuvJSpdxNOf4Z9RbY0jbnB5=JX_sQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D348BF505CE6650B3B5516AF264460E956BF2F030360665364A932DB0EF629EA2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RGVhciBBbGV4LA0KDQpEbyB5b3UgbWVhbiB0byBjcmVhdGUgdHdvIHN5bWJvbGljIGxpbms/DQoN
Cmxyd3hyd3hyd3ggIDEgZ3RrX3J1aXdhbmcgZ3RrX3J1aXdhbmcgICAgICAyNSBGZWIgMjYgMTE6
NTIgdnB1X2QuYmluIC0+DQptZWRpYXRlay9tdDgxNzMvdnB1X2QuYmluDQpscnd4cnd4cnd4ICAx
IGd0a19ydWl3YW5nIGd0a19ydWl3YW5nICAgICAgMjUgRmViIDI2IDExOjUyIHZwdV9wLmJpbiAt
Pg0KbWVkaWF0ZWsvbXQ4MTczL3ZwdV9wLmJpbg0KDQp3ZSBjcmVhdGUgdGhlbSBhdCB0aGUgbGlu
dXgtZmlybXdhcmUgcm9vdCBmb2xkZXIuDQoNClRoYW5rcw0KQmVzdCBSZWdhcmRzDQoNCk9uIFdl
ZCwgMjAyMC0wMi0yNiBhdCAxMjo0MSArMDkwMCwgQWxleGFuZHJlIENvdXJib3Qgd3JvdGU6DQo+
IE9uIFdlZCwgRmViIDI2LCAyMDIwIGF0IDEyOjM4IFBNIDxndGtfcnVpd2FuZ0BtZWRpYXRlay5j
b20+IHdyb3RlOg0KPiA+DQo+ID4gRnJvbTogZ3RrX3J1aXdhbmcgPGd0a19ydWl3YW5nQG1lZGlh
dGVrLmNvbT4NCj4gPg0KPiA+IEN1cnJlbnRseSB2cHVfZC5iaW4gYW5kIHZwdV9wLmJpbiBhcmUg
YXQgdGhlIHJvb3Qgb2YNCj4gPiBsaW51eC1maXJtd2FyZSBnaXQgdHJlZSwgaXQncyBub3QgYXBw
cm9wcmlhdGUgc28gd2UgbW92ZQ0KPiA+IHRoZW0gdG8gc3ViZm9sZGVyIG1lZGlhdGVrL210ODE3
Mw0KPiA+DQo+ID4gUmVsZWFzZSBWZXJzaW9uOiAxLjEuNA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogUnVpIFdhbmcgPGd0a19ydWl3YW5nQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgdnB1
X2QuYmluID0+IG1lZGlhdGVrL210ODE3My92cHVfZC5iaW4gfCBCaW4NCj4gPiAgdnB1X3AuYmlu
ID0+IG1lZGlhdGVrL210ODE3My92cHVfcC5iaW4gfCBCaW4NCj4gPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAwIGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pDQo+ID4gIHJlbmFtZSB2cHVfZC5iaW4g
PT4gbWVkaWF0ZWsvbXQ4MTczL3ZwdV9kLmJpbiAoMTAwJSkNCj4gPiAgcmVuYW1lIHZwdV9wLmJp
biA9PiBtZWRpYXRlay9tdDgxNzMvdnB1X3AuYmluICgxMDAlKQ0KPiANCj4gVGhpcyBpcyBuaWNl
IGFzIGl0IHJlbW92ZXMgc29tZSBzdHVmZiBmcm9tIHRoZSByb290LCBidXQgZm9yDQo+IGNvbXBh
dGliaWxpdHkgd2l0aCBvbGRlciBrZXJuZWxzIHRoYXQgZG9uJ3Qga25vdyBhYm91dCB0aGUgbmV3
IHBhdGgNCj4gc2hvdWxkbid0IHdlIGF0IGxlYXN0IHRlbXBvcmFyaWx5IGNyZWF0ZSBhIHN5bWJv
bGljIGxpbmsgYmV0d2VlbiB0aGUNCj4gb2xkIGxvY2F0aW9uIGFuZCB0aGUgbmV3IG9uZT8NCg0K

