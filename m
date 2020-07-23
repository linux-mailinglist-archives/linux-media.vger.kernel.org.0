Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2A4922A5C1
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 05:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387926AbgGWDHQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 23:07:16 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:4236 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387821AbgGWDGm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 23:06:42 -0400
X-UUID: 4a81252e75b7441c8ada55f601a3335f-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=4tqaZlmuzHzLHRbfQy0Kl5EqMI7z5Q+KVtW+eUbkoi8=;
        b=rxlfhhnotBLEfXW9FWlbS8xK1F7jtgZYZM7f4rYXM9glGZh1NSTQSN7Q49LV980Uqmb0jfDYTteDp71BmZJdjAyCXEZm1ne94bwRBUiS4OtqBlYDdR/QGSGTo8hFB+knexvB/kfdeMmX2cfOAmx377598oB/IlMtx9r1/ZVrC0c=;
X-UUID: 4a81252e75b7441c8ada55f601a3335f-20200723
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1754562178; Thu, 23 Jul 2020 11:06:40 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 11:06:38 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 11:06:34 +0800
From:   Xia Jiang <xia.jiang@mediatek.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        <srv_heupstream@mediatek.com>, <senozhatsky@chromium.org>,
        <mojahsu@chromium.org>, <drinkcat@chromium.org>,
        <maoguang.meng@mediatek.com>, Xia Jiang <xia.jiang@mediatek.com>
Subject: [PATCH v10 23/28] media: dt-bindings: Add jpeg enc device tree node document
Date:   Thu, 23 Jul 2020 11:04:46 +0800
Message-ID: <20200723030451.5616-24-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200723030451.5616-1-xia.jiang@mediatek.com>
References: <20200723030451.5616-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

QWRkIGpwZWcgZW5jIGRldmljZSB0cmVlIG5vZGUgZG9jdW1lbnQuDQoNClJldmlld2VkLWJ5OiBS
b2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KU2lnbmVkLW9mZi1ieTogWGlhIEppYW5nIDx4
aWEuamlhbmdAbWVkaWF0ZWsuY29tPg0KLS0tDQp2MTA6IG5vIGNoYW5nZXMNCi0tLQ0KIC4uLi9i
aW5kaW5ncy9tZWRpYS9tZWRpYXRlay1qcGVnLWVuY29kZXIudHh0ICB8IDM1ICsrKysrKysrKysr
KysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWst
anBlZy1lbmNvZGVyLnR4dA0KDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLWpwZWctZW5jb2Rlci50eHQgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWstanBlZy1lbmNvZGVyLnR4dA0KbmV3
IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAwMDAwMC4uNzM2YmU3Y2FkMzg1DQotLS0g
L2Rldi9udWxsDQorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEv
bWVkaWF0ZWstanBlZy1lbmNvZGVyLnR4dA0KQEAgLTAsMCArMSwzNSBAQA0KKyogTWVkaWFUZWsg
SlBFRyBFbmNvZGVyDQorDQorTWVkaWFUZWsgSlBFRyBFbmNvZGVyIGlzIHRoZSBKUEVHIGVuY29k
ZSBoYXJkd2FyZSBwcmVzZW50IGluIE1lZGlhVGVrIFNvQ3MNCisNCitSZXF1aXJlZCBwcm9wZXJ0
aWVzOg0KKy0gY29tcGF0aWJsZSA6ICJtZWRpYXRlayxtdDI3MDEtanBnZW5jIg0KKyAgZm9sbG93
ZWQgYnkgIm1lZGlhdGVrLG10ay1qcGdlbmMiDQorLSByZWcgOiBwaHlzaWNhbCBiYXNlIGFkZHJl
c3Mgb2YgdGhlIEpQRUcgZW5jb2RlciByZWdpc3RlcnMgYW5kIGxlbmd0aCBvZg0KKyAgbWVtb3J5
IG1hcHBlZCByZWdpb24uDQorLSBpbnRlcnJ1cHRzIDogaW50ZXJydXB0IG51bWJlciB0byB0aGUg
aW50ZXJydXB0IGNvbnRyb2xsZXIuDQorLSBjbG9ja3M6IGRldmljZSBjbG9ja3MsIHNlZQ0KKyAg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2Nsb2NrLWJpbmRpbmdzLnR4
dCBmb3IgZGV0YWlscy4NCistIGNsb2NrLW5hbWVzOiBtdXN0IGNvbnRhaW4gImpwZ2VuYyIuIEl0
IGlzIHRoZSBjbG9jayBvZiBKUEVHIGVuY29kZXIuDQorLSBwb3dlci1kb21haW5zOiBhIHBoYW5k
bGUgdG8gdGhlIHBvd2VyIGRvbWFpbiwgc2VlDQorICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcG93ZXIvcG93ZXJfZG9tYWluLnR4dCBmb3IgZGV0YWlscy4NCistIG1lZGlhdGVr
LGxhcmI6IG11c3QgY29udGFpbiB0aGUgbG9jYWwgYXJiaXRlcnMgaW4gdGhlIGN1cnJlbnQgU29D
cywgc2VlDQorICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRy
b2xsZXJzL21lZGlhdGVrLHNtaS1sYXJiLnR4dA0KKyAgZm9yIGRldGFpbHMuDQorLSBpb21tdXM6
IHNob3VsZCBwb2ludCB0byB0aGUgcmVzcGVjdGl2ZSBJT01NVSBibG9jayB3aXRoIG1hc3RlciBw
b3J0IGFzDQorICBhcmd1bWVudCwgc2VlIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9pb21tdS9tZWRpYXRlayxpb21tdS50eHQNCisgIGZvciBkZXRhaWxzLg0KKw0KK0V4YW1wbGU6
DQorCWpwZWdlbmM6IGpwZWdlbmNAMTUwMGEwMDAgew0KKwkJY29tcGF0aWJsZSA9ICJtZWRpYXRl
ayxtdDI3MDEtanBnZW5jIiwNCisJCQkgICAgICJtZWRpYXRlayxtdGstanBnZW5jIjsNCisJCXJl
ZyA9IDwwIDB4MTUwMGEwMDAgMCAweDEwMDA+Ow0KKwkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDE0
MSBJUlFfVFlQRV9MRVZFTF9MT1c+Ow0KKwkJY2xvY2tzID0gIDwmaW1nc3lzIENMS19JTUdfVkVO
Qz47DQorCQljbG9jay1uYW1lcyA9ICJqcGdlbmMiOw0KKwkJcG93ZXItZG9tYWlucyA9IDwmc2Nw
c3lzIE1UMjcwMV9QT1dFUl9ET01BSU5fSVNQPjsNCisJCW1lZGlhdGVrLGxhcmIgPSA8JmxhcmIy
PjsNCisJCWlvbW11cyA9IDwmaW9tbXUgTVQyNzAxX000VV9QT1JUX0pQR0VOQ19SRE1BPiwNCisJ
CQkgPCZpb21tdSBNVDI3MDFfTTRVX1BPUlRfSlBHRU5DX0JTRE1BPjsNCisJfTsNCi0tIA0KMi4x
OC4wDQo=

