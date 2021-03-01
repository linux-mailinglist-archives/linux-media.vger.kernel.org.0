Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA0283277B9
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 07:46:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232002AbhCAGqQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 01:46:16 -0500
Received: from mailgw02.mediatek.com ([1.203.163.81]:50576 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231185AbhCAGqP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 01:46:15 -0500
X-UUID: 5cf60434c6cf4d4cb00d51f67e550a93-20210301
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=QVGn0n8BLUxEWDtnLqCxnMqkZncL3xMO0eBBB5gr4Yo=;
        b=a5mSJaCHnL866iShay96l+2mGVpoy9IQJ27a5k6kPX58pht2IzOkwi9UnC/v/lBYyWNNqoqtqObr77iiBUPEHHOKsgCWq1eDtjO+G8d+hLu0HL5gxnnsl5pziXyMvTNBEyDaQ4vEzQxWqibhpjZ32+1AF578npCdKQ6eOJfnQZs=;
X-UUID: 5cf60434c6cf4d4cb00d51f67e550a93-20210301
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1631696477; Mon, 01 Mar 2021 14:45:32 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 1 Mar
 2021 14:45:30 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 1 Mar 2021 14:45:29 +0800
Message-ID: <1614581129.14457.0.camel@mhfsdcap03>
Subject: Re: [PATCH 1/5] dt-bindings: media: mtk-vcodec: Add dma-ranges
 property
From:   Irui Wang <irui.wang@mediatek.com>
To:     Rob Herring <robh@kernel.org>
CC:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "Fritz Koenig" <frkoenig@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>
Date:   Mon, 1 Mar 2021 14:45:29 +0800
In-Reply-To: <20210210225323.GA2961490@robh.at.kernel.org>
References: <20210203083752.12586-1-irui.wang@mediatek.com>
         <20210203083752.12586-2-irui.wang@mediatek.com>
         <20210210225323.GA2961490@robh.at.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 62560B53CD9D2FC90A2C93FBF883E1ACB0740244722726113DF61E297D86CCD92000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gV2VkLCAyMDIxLTAyLTEwIGF0IDE2OjUzIC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gV2VkLCBGZWIgMDMsIDIwMjEgYXQgMDQ6Mzc6NDhQTSArMDgwMCwgSXJ1aSBXYW5nIHdyb3Rl
Og0KPiA+IEFkZHMgZG1hLXJhbmdlcyBwcm9wZXJ0eSBmb3IgRE1BIGFkZHJlc3NlcyB0cmFuc2xh
dGlvbi4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBJcnVpIFdhbmcgPGlydWkud2FuZ0BtZWRp
YXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZWRpYS9tZWRpYXRlay12Y29kZWMudHh0IHwgMiArKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay12Y29kZWMudHh0IGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLXZjb2RlYy50eHQNCj4gPiBpbmRl
eCBmODUyNzZlNjI5YmYuLmU0NjQ0ZjhjYWVlOSAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWstdmNvZGVjLnR4dA0KPiA+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay12Y29k
ZWMudHh0DQo+ID4gQEAgLTIzLDYgKzIzLDggQEAgUmVxdWlyZWQgcHJvcGVydGllczoNCj4gPiAg
LSBpb21tdXMgOiBzaG91bGQgcG9pbnQgdG8gdGhlIHJlc3BlY3RpdmUgSU9NTVUgYmxvY2sgd2l0
aCBtYXN0ZXIgcG9ydCBhcw0KPiA+ICAgIGFyZ3VtZW50LCBzZWUgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2lvbW11L21lZGlhdGVrLGlvbW11LnR4dA0KPiA+ICAgIGZvciBkZXRh
aWxzLg0KPiA+ICstIGRtYS1yYW5nZXMgOiBkZXNjcmliZXMgaG93IHRoZSBwaHlzaWNhbCBhZGRy
ZXNzIHNwYWNlIG9mIHRoZSBJT01NVSBtYXBzDQo+ID4gKyAgdG8gbWVtb3J5Lg0KPiANCj4gZG1h
LXJhbmdlcyBpcyBzdXBwb3NlZCB0byBiZSBpbiBhIGJ1cy9wYXJlbnQgbm9kZS4NCkRlYXIgUm9i
LA0KDQpUaGUgbXQ4MTkyIGlvbW11IHN1cHBvcnQgMH4xNkdCIGlvdmEuIFdlIHNlcGFyYXRlIGl0
IHRvIGZvdXIgYmFua3M6DQowfjRHOyA0R344RzsgOEd+MTJHOyAxMkd+MTZHLg0KDQpUaGUgImRt
YS1yYW5nZXMiIGNvdWxkIGJlIHVzZWQgdG8gYWRqdXN0IHRoZSBiYW5rIHdlIGxvY2F0ZS4NCklm
IHdlIGRvbid0IHNldCB0aGlzIHByb3BlcnR5LiBUaGUgZGVmYXVsdCByYW5nZSBhbHdheXMgaXMg
MH40Ry4NCg0KSGVyZSB3ZSBkb24ndCBoYXZlIGFjdHVhbCBidXMvcGFyZW50IGNvbmNlcHQgaGVy
ZS4gIEFuZCB0aGUgaW92YQ0KcmVxdWlyZW1lbnQgaXMgZm9yIG91ciBIVy4gVGh1cyBwdXQgdGhl
IHByb3BlcnR5IGluIG91ciBub2RlLg0KDQpJcyB0aGlzIE9LPyBJZiB0aGlzIGlzIG9rIGZvciB5
b3UsIEkgd2lsbCBwdXQgdGhpcyBtZXNzYWdlIGluIHRoZSBjb21taXQNCm1lc3NhZ2UgYW5kIGJp
bmRpbmcgaW4gbmV4dCB2ZXJzaW9uLg0KDQpSZWdhcmRzDQo+IA0KPiA+ICBPbmUgb2YgdGhlIHR3
byBmb2xsb3dpbmcgbm9kZXM6DQo+ID4gIC0gbWVkaWF0ZWssdnB1IDogdGhlIG5vZGUgb2YgdGhl
IHZpZGVvIHByb2Nlc3NvciB1bml0LCBpZiB1c2luZyBWUFUuDQo+ID4gIC0gbWVkaWF0ZWssc2Nw
IDogdGhlIG5vZGUgb2YgdGhlIFNDUCB1bml0LCBpZiB1c2luZyBTQ1AuDQo+ID4gLS0gDQo+ID4g
Mi4yNS4xDQo+ID4gDQoNCg==

