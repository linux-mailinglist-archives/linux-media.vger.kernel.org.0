Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D611B1C6C03
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 10:41:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728943AbgEFIlg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 04:41:36 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:22122 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728475AbgEFIlf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 May 2020 04:41:35 -0400
X-UUID: ff5e5475aeeb4475820515b1c4f681d3-20200506
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=9mo0KK2pekNHH+R5fI35YInu1I3bC2TpqDtV05+qjyA=;
        b=ILC/ja6Azn9CQqyqsAd169EqGNjlBu1Wl8iEYYbJ/YD6VJt5ciz2Hgyvlq5hHy3PyrcTC/VRdEt3uYZm0VlfJ1k9E5SBRHUtHESH4U9bPPbBPOw5rJLVTxMeHetDp+gWEdDPhEGkSFDpnv7iBSehmSPy0xf428LYeHO2hATnk74=;
X-UUID: ff5e5475aeeb4475820515b1c4f681d3-20200506
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <jerry-ch.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1282518738; Wed, 06 May 2020 16:41:28 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 May 2020 16:41:26 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 May 2020 16:41:26 +0800
Message-ID: <1588754487.16825.5.camel@mtksdccf07>
Subject: Re: [RFC PATCH V4 2/4] dt-bindings: mt8183: Added FD dt-bindings
From:   Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
To:     Rob Herring <robh@kernel.org>
CC:     "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "pihsun@chromium.org" <pihsun@chromium.org>,
        "yuzhao@chromium.org" <yuzhao@chromium.org>,
        "zwisler@chromium.org" <zwisler@chromium.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Sean Cheng =?UTF-8?Q?=28=E9=84=AD=E6=98=87=E5=BC=98=29?= 
        <Sean.Cheng@mediatek.com>,
        "Sj Huang =?UTF-8?Q?=28=E9=BB=83=E4=BF=A1=E7=92=8B=29?=" 
        <sj.huang@mediatek.com>,
        Christie Yu =?UTF-8?Q?=28=E6=B8=B8=E9=9B=85=E6=83=A0=29?= 
        <christie.yu@mediatek.com>,
        Frederic Chen =?UTF-8?Q?=28=E9=99=B3=E4=BF=8A=E5=85=83=29?= 
        <Frederic.Chen@mediatek.com>,
        Jungo Lin =?UTF-8?Q?=28=E6=9E=97=E6=98=8E=E4=BF=8A=29?= 
        <jungo.lin@mediatek.com>,
        Rynn Wu =?UTF-8?Q?=28=E5=90=B3=E8=82=B2=E6=81=A9=29?= 
        <Rynn.Wu@mediatek.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Date:   Wed, 6 May 2020 16:41:27 +0800
In-Reply-To: <20191204185813.GA23184@bogus>
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
         <20191204124732.10932-3-Jerry-Ch.chen@mediatek.com>
         <20191204185813.GA23184@bogus>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgUm9iLA0KDQpPbiBUaHUsIDIwMTktMTItMDUgYXQgMDI6NTggKzA4MDAsIFJvYiBIZXJyaW5n
IHdyb3RlOg0KPiBPbiBXZWQsIDQgRGVjIDIwMTkgMjA6NDc6MzAgKzA4MDAsIEplcnJ5LWNoIENo
ZW4gd3JvdGU6DQo+ID4gRnJvbTogSmVycnktY2ggQ2hlbiA8amVycnktY2guY2hlbkBtZWRpYXRl
ay5jb20+DQo+ID4gDQo+ID4gVGhpcyBwYXRjaCBhZGRzIERUIGJpbmRpbmcgZG9jdW1lbnRhdGlv
biBmb3IgdGhlIEZhY2UgRGV0ZWN0aW9uIChGRCkNCj4gPiB1bml0IG9mIHRoZSBNZWRpYXRlaydz
IG10ODE4MyBTb0MuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSmVycnktY2ggQ2hlbiA8amVy
cnktY2guY2hlbkBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9iaW5kaW5ncy9tZWRp
YS9tZWRpYXRlayxtdDgxODMtZmQudHh0ICAgICB8IDM0ICsrKysrKysrKysrKysrKysrKysNCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtdDgx
ODMtZmQudHh0DQo+ID4gDQo+IA0KPiBQbGVhc2UgYWRkIEFja2VkLWJ5L1Jldmlld2VkLWJ5IHRh
Z3Mgd2hlbiBwb3N0aW5nIG5ldyB2ZXJzaW9ucy4gSG93ZXZlciwNCj4gdGhlcmUncyBubyBuZWVk
IHRvIHJlcG9zdCBwYXRjaGVzICpvbmx5KiB0byBhZGQgdGhlIHRhZ3MuIFRoZSB1cHN0cmVhbQ0K
PiBtYWludGFpbmVyIHdpbGwgZG8gdGhhdCBmb3IgYWNrcyByZWNlaXZlZCBvbiB0aGUgdmVyc2lv
biB0aGV5IGFwcGx5Lg0KPiANCj4gSWYgYSB0YWcgd2FzIG5vdCBhZGRlZCBvbiBwdXJwb3NlLCBw
bGVhc2Ugc3RhdGUgd2h5IGFuZCB3aGF0IGNoYW5nZWQuDQoNClNvcnJ5IGZvciBtaXNzaW5nIHRo
ZSB0YWdzLA0KSSB3aWxsIGFkZCBpdCBiYWNrIGluIG5leHQgdmVyc2lvbi4NCg0KVGhhbmtzIGFu
ZCBCZXN0IFJlZ2FyZHMsDQpKZXJyeQ0K

