Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 708281EA1FD
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2020 12:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbgFAKhs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jun 2020 06:37:48 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:35896 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725925AbgFAKhr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jun 2020 06:37:47 -0400
X-UUID: 394d6998af134c8690c692338d0e4123-20200601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=1ubZI9bQ8AA1BT1/8Z5X+IHX0+39sOSJHMhP1+hac8k=;
        b=N/SzcJgl397H4uuPS8/+6ws0a1tn3EbRswPKG1jFFR9xj6VlSf44jI6tsyRmMiaKkQdjK0op73bx2IqI1IVXOY2yxJkv0f2pvMvC/jGNt2zGGeWnIfZonzu4XeLN26fKCs9yWfF9N3iw27ZFmpKL8PWjfZIP5zxmAoHVAq5q1qE=;
X-UUID: 394d6998af134c8690c692338d0e4123-20200601
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <jerry-ch.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 966313528; Mon, 01 Jun 2020 18:37:44 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Jun 2020 18:37:42 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 1 Jun 2020 18:37:41 +0800
Message-ID: <1591007863.15207.1.camel@mtksdccf07>
Subject: Re: [RFC PATCH V4 4/4] platform: mtk-isp: Add Mediatek FD driver
From:   Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     Hans Verkuil <hverkuil@xs4all.nl>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pi-Hsun Shih <pihsun@chromium.org>, <yuzhao@chromium.org>,
        <zwisler@chromium.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg 
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Sean Cheng =?UTF-8?Q?=28=E9=84=AD=E6=98=87=E5=BC=98=29?= 
        <Sean.Cheng@mediatek.com>, "Sj Huang" <sj.huang@mediatek.com>,
        Christie Yu =?UTF-8?Q?=28=E6=B8=B8=E9=9B=85=E6=83=A0=29?= 
        <christie.yu@mediatek.com>,
        Frederic Chen =?UTF-8?Q?=28=E9=99=B3=E4=BF=8A=E5=85=83=29?= 
        <frederic.chen@mediatek.com>,
        Jungo Lin =?UTF-8?Q?=28=E6=9E=97=E6=98=8E=E4=BF=8A=29?= 
        <jungo.lin@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        linux-devicetree <devicetree@vger.kernel.org>
Date:   Mon, 1 Jun 2020 18:37:43 +0800
In-Reply-To: <CAAFQd5BBfapVv_3cwGte=p=6G8QXZQP=-ciZ8NBZZeSBGrHmCA@mail.gmail.com>
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
         <20191204124732.10932-5-Jerry-Ch.chen@mediatek.com>
         <20200521182825.GA249683@chromium.org>
         <1590156658.27807.84.camel@mtksdccf07>
         <CAAFQd5DodDfWsHkhQZP-M70k9_2sUwwb4zHtWfTx5EDyEKkwow@mail.gmail.com>
         <1590755163.23156.24.camel@mtksdccf07>
         <CAAFQd5BBfapVv_3cwGte=p=6G8QXZQP=-ciZ8NBZZeSBGrHmCA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gRnJpLCAyMDIwLTA1LTI5IGF0IDE0OjU5ICswMjAwLCBUb21hc3ogRmlnYSB3cm90ZToNCj4g
T24gRnJpLCBNYXkgMjksIDIwMjAgYXQgMjoyNiBQTSBKZXJyeS1jaCBDaGVuDQo+IDxKZXJyeS1j
aC5DaGVuQG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIaSBUb21hc3osDQo+ID4NCj4g
PiBJIEFwcHJlY2lhdGUgeW91ciByZXZpZXcgY29tbWVudHMsIGhlcmUncyB0aGUgcmVwbHkuDQo+
ID4NCj4gPiBPbiBNb24sIDIwMjAtMDUtMjUgYXQgMTQ6MjQgKzAyMDAsIFRvbWFzeiBGaWdhIHdy
b3RlOg0KPiA+ID4gcg0KPiA+ID4NCj4gPiA+IE9uIEZyaSwgTWF5IDIyLCAyMDIwIGF0IDQ6MTEg
UE0gSmVycnktY2ggQ2hlbg0KPiA+ID4gPEplcnJ5LWNoLkNoZW5AbWVkaWF0ZWsuY29tPiB3cm90
ZToNCj4gPiA+ID4NCj4gPiA+ID4gSGkgVG9tYXN6LA0KPiA+ID4gPg0KPiA+ID4gPiBPbiBUaHUs
IDIwMjAtMDUtMjEgYXQgMTg6MjggKzAwMDAsIFRvbWFzeiBGaWdhIHdyb3RlOg0KPiA+ID4gPiA+
IEhpIEplcnJ5LA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gT24gV2VkLCBEZWMgMDQsIDIwMTkgYXQg
MDg6NDc6MzJQTSArMDgwMCwgSmVycnktY2ggQ2hlbiB3cm90ZToNCj4gW3NuaXBdDQo+ID4gPiBJ
c24ndCBzdGlsbCBhIG5lZWQgdG8gY2xhbXAoKSB3aWR0aCBhbmQgaGVpZ2h0IHRvIG1pbi9tYXgs
IHRob3VnaD8NCj4gPiBZZXMsIEknbGwgYWRkIHRoZW0gYmFjay4NCj4gPg0KPiA+IFRoaXMgZnVu
Y3Rpb24gd2lsbCBiZSByZWZpbmVkIGFzIDoNCj4gPg0KPiA+IHN0YXRpYyB2b2lkIG10a19mZF9m
aWxsX3BpeGZtdF9tcChzdHJ1Y3QgdjRsMl9waXhfZm9ybWF0X21wbGFuZSAqZGZtdCwNCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTMyIHBpeGZtdCkNCj4gPiB7DQo+ID4g
ICAgICAgICB2NGwyX2ZpbGxfcGl4Zm10X21wKGRmbXQsIHBpeGZtdCwgZGZtdC0+d2lkdGgsIGRm
bXQtPmhlaWdodCk7DQo+ID4NCj4gPiAgICAgICAgIGRmbXQtPmZpZWxkID0gVjRMMl9GSUVMRF9O
T05FOw0KPiA+ICAgICAgICAgZGZtdC0+Y29sb3JzcGFjZSA9IFY0TDJfQ09MT1JTUEFDRV9CVDIw
MjA7DQo+ID4gICAgICAgICBkZm10LT55Y2Jjcl9lbmMgPSBWNEwyX1lDQkNSX0VOQ19ERUZBVUxU
Ow0KPiA+ICAgICAgICAgZGZtdC0+cXVhbnRpemF0aW9uID0gVjRMMl9RVUFOVElaQVRJT05fREVG
QVVMVDsNCj4gPiAgICAgICAgIGRmbXQtPnhmZXJfZnVuYyA9IFY0TDJfTUFQX1hGRVJfRlVOQ19E
RUZBVUxUKGRmbXQtPmNvbG9yc3BhY2UpOw0KPiA+DQo+ID4gICAgICAgICAvKiBLZWVwIHVzZXIg
c2V0dGluZyBhcyBwb3NzaWJsZSAqLw0KPiA+ICAgICAgICAgZGZtdC0+d2lkdGggPSBjbGFtcChk
Zm10LT53aWR0aCwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTVRLX0ZEX09VVFBV
VF9NSU5fV0lEVEgsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1US19GRF9PVVRQ
VVRfTUFYX1dJRFRIKTsNCj4gPiAgICAgICAgIGRmbXQtPmhlaWdodCA9IGNsYW1wKGRmbXQtPmhl
aWdodCwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1US19GRF9PVVRQVVRfTUlO
X0hFSUdIVCwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1US19GRF9PVVRQVVRf
TUFYX0hFSUdIVCk7DQo+IA0KPiBOb3RlIHRoYXQgdGhpcyB3b3VsZCBjYXVzZSB0aGUgb3RoZXIg
ZmllbGRzIG9mIGRmbXQgdG8gYmUgaW5jb25zaXN0ZW50DQo+IHdpdGggd2lkdGggYW5kIGhlaWdo
dC4gVGhlIGNvcnJlY3Qgd2F5IHRvIGRvIHRoaXMgd291bGQgYmUgdG8gZmlyc3QNCj4gY2xhbXAg
YW5kIHRoZW4gY2FsbCB2NGwyX2ZpbGxfcGl4Zm10X21wKCkuDQo+IA0KT2ssIEkgd2lsbCBmaXgg
aXQuDQoNClRoYW5rcyBhbmQgQmVzdCByZWdhcmRzLA0KSmVycnkNCj4gQmVzdCByZWdhcmRzLA0K
PiBUb21hc3oNCg0K

