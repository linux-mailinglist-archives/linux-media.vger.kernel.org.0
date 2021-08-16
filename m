Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC313ECC30
	for <lists+linux-media@lfdr.de>; Mon, 16 Aug 2021 03:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232521AbhHPBIZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Aug 2021 21:08:25 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:51985 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230124AbhHPBIY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Aug 2021 21:08:24 -0400
X-UUID: 06330229aaaa4389b7d1e48571961cdf-20210816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=y5Wh78PwkWB3JvhOvjJ/925Vvejkr8c8LSWT0IjHL/Y=;
        b=CDszHtFXjlxOsHtoeoyCKP5IJs4a7wAiHobuysCFyHom1pGg4TAlvJoe8fCPM6nI0NVzgEdSQ1UOsJ34aK0MVF4EgJZcSsNXlsp92uy74TbufAq6ZZrLVv2qbIZ1E1eQQ9E94hiVvPBYRz/HAOijtqfEYhtQGpGsX+SvKelEmsU=;
X-UUID: 06330229aaaa4389b7d1e48571961cdf-20210816
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <houlong.wei@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 668228251; Mon, 16 Aug 2021 09:07:49 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 16 Aug
 2021 09:07:41 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 09:07:41 +0800
Message-ID: <ab83cb2c6fd8fa89b72a1cd215e8258c2b4d2c63.camel@mediatek.com>
Subject: Re: [PATCH v6 3/9] mtk-mdp: use pm_runtime in MDP component driver
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
Date:   Mon, 16 Aug 2021 09:07:42 +0800
In-Reply-To: <20210802220943.v6.3.I909f5375d930f5d0cc877128e30e2a67078b674c@changeid>
References: <20210802121215.703023-1-eizan@chromium.org>
         <20210802220943.v6.3.I909f5375d930f5d0cc877128e30e2a67078b674c@changeid>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9D1ED21E0FD494CF6658D2FCD6ABB133228369FEF32CB2241C9E514705F4B7992000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gTW9uLCAyMDIxLTA4LTAyIGF0IDIwOjEyICswODAwLCBFaXphbiBNaXlhbW90byB3cm90ZToN
Cj4gV2l0aG91dCB0aGlzIGNoYW5nZSwgdGhlIE1EUCBjb21wb25lbnRzIGFyZSBub3QgZnVsbHkg
aW50ZWdyYXRlZCBpbnRvDQo+IHRoZSBydW50aW1lIHBvd2VyIG1hbmFnZW1lbnQgc3Vic3lzdGVt
LCBhbmQgdGhlIE1EUCBkcml2ZXIgZG9lcyBub3QNCj4gd29yay4NCj4gDQo+IEZvciBlYWNoIG9m
IHRoZSBjb21wb25lbnQgZGV2aWNlIGRyaXZlcnMgdG8gYmUgYWJsZSB0byBjYWxsDQo+IHBtX3J1
bnRpbWVfZ2V0L3B1dF9zeW5jKCkgYSBwb2ludGVyIHRvIHRoZSBjb21wb25lbnQncyBkZXZpY2Ug
c3RydWN0DQo+IGhhZCB0byBiZSBhZGRlZCB0byBzdHJ1Y3QgbXRrX21kcF9jb21wLCBzZXQgYnkg
bXRrX21kcF9jb21wX2luaXQoKS4NCj4gDQo+IE5vdGUgdGhhdCB0aGUgZGV2IGFyZ3VtZW50IHRv
IG10a19tZHBfY29tcF9jbG9ja19vbi9vZmYoKSBoYXMgYmVlbg0KPiByZW1vdmVkLiBUaG9zZSBm
dW5jdGlvbnMgdXNlZCB0byBiZSBjYWxsZWQgZnJvbSB0aGUgIm1hc3RlciIgbWRwDQo+IGRyaXZl
cg0KPiBpbiBtdGtfbWRwX2NvcmUuYywgYnV0IHRoZSBjb21wb25lbnQncyBkZXZpY2UgcG9pbnRl
ciBubyBsb25nZXINCj4gY29ycmVzcG9uZHMgdG8gdGhlIG1kcCBtYXN0ZXIgZGV2aWNlIHBvaW50
ZXIsIHdoaWNoIGlzIG5vdCB0aGUgcmlnaHQNCj4gZGV2aWNlIHRvIHBhc3MgdG8gcG1fcnVudGlt
ZV9wdXQvZ2V0X3N5bmMoKSB3aGljaCB3ZSBoYWQgdG8gYWRkIHRvDQo+IGdldA0KPiB0aGUgZHJp
dmVyIHRvIHdvcmsgcHJvcGVybHkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBFaXphbiBNaXlhbW90
byA8ZWl6YW5AY2hyb21pdW0ub3JnPg0KPiAtLS0NCj4gDQoNClJldmlld2VkLWJ5OiBIb3Vsb25n
IFdlaSA8aG91bG9uZy53ZWlAbWVkaWF0ZWsuY29tPg0KDQo+IChubyBjaGFuZ2VzIHNpbmNlIHYx
KQ0KPiANClsuLi5dDQo=

