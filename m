Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD3AA125AE8
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 06:50:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbfLSFuL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 00:50:11 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:27657 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726173AbfLSFuL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 00:50:11 -0500
X-UUID: d9f4e966cbe546afb137235b224ce03c-20191219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=u/vWTAbZlH4j2bhnD+Ag+oO8onBzT6jpu+qmICQf9Ow=;
        b=tr/nwbGqcaGoaE72kPiTaqCQU//ZnnqQGCiOssNfBUgW0Tyz6NFJkRL1M+BQrrzKOaYYJx4gm5waoYu+EPRnNhDVYpUwUsJl5jOmYKrOaKg4wQPkAoF9DI+VTbFvne4S0Zh+Z8ybOI3zWsJgIbDayqe1s49Iqx4ef4py+nbJxjU=;
X-UUID: d9f4e966cbe546afb137235b224ce03c-20191219
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1857245970; Thu, 19 Dec 2019 13:50:07 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 19 Dec 2019 13:49:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 19 Dec 2019 13:50:08 +0800
From:   Jungo Lin <jungo.lin@mediatek.com>
To:     <tfiga@chromium.org>, <hverkuil-cisco@xs4all.nl>,
        <laurent.pinchart@ideasonboard.com>, <matthias.bgg@gmail.com>,
        <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <ddavenport@chromium.org>, <robh@kernel.org>,
        <Sean.Cheng@mediatek.com>, <sj.huang@mediatek.com>,
        <frederic.chen@mediatek.com>, <Jerry-ch.Chen@mediatek.com>,
        <frankie.chiu@mediatek.com>, <ryan.yu@mediatek.com>,
        <Rynn.Wu@mediatek.com>, <yuzhao@chromium.org>,
        <zwisler@chromium.org>, <shik@chromium.org>,
        <suleiman@chromium.org>, <jungo.lin@mediatek.com>
Subject: [v6, 1/5] media: dt-bindings: mt8183: Added camera ISP Pass 1
Date:   Thu, 19 Dec 2019 13:49:26 +0800
Message-ID: <20191219054930.29513-2-jungo.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191219054930.29513-1-jungo.lin@mediatek.com>
References: <Jungo Lin <jungo.lin@mediatek.com>
 <20191219054930.29513-1-jungo.lin@mediatek.com>
Reply-To: Jungo Lin <jungo.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 3424BFE6CB592FD6D869534D12E758F930287C42C4EAF56ABF1438AC5279C5E72000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VGhpcyBwYXRjaCBhZGRzIERUIGJpbmRpbmcgZG9jdW1lbnQgZm9yIHRoZSBQYXNzIDEgKFAxKSB1
bml0DQppbiBNZWRpYXRlaydzIGNhbWVyYSBJU1Agc3lzdGVtLiBUaGUgUGFzcyAxIHVuaXQgZ3Jh
YnMgdGhlIHNlbnNvcg0KZGF0YSBvdXQgZnJvbSB0aGUgc2Vuc29yIGludGVyZmFjZSwgYXBwbGll
cyBJU1AgaW1hZ2UgZWZmZWN0cw0KZnJvbSB0dW5pbmcgZGF0YSBhbmQgb3V0cHV0cyB0aGUgaW1h
Z2UgZGF0YSBvciBzdGF0aXN0aWNzIGRhdGEgdG8gRFJBTS4NCg0KUmV2aWV3ZWQtYnk6IFJvYiBI
ZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+DQpTaWduZWQtb2ZmLWJ5OiBKdW5nbyBMaW4gPGp1bmdv
LmxpbkBtZWRpYXRlay5jb20+DQotLS0NCkNoYW5nZXMgZnJvbSB2NjoNCiAtIEFkZCBwb3J0IG5v
ZGUgZGVzY3JpcHRpb24gaW4gdGhlIGR0LWJpbmRpbmcgZG9jdW1lbnQuDQotLS0NCiAuLi4vYmlu
ZGluZ3MvbWVkaWEvbWVkaWF0ZWssY2FtaXNwLnR4dCAgICAgICAgfCA4MyArKysrKysrKysrKysr
KysrKysrDQogMSBmaWxlIGNoYW5nZWQsIDgzIGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAx
MDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLGNh
bWlzcC50eHQNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZWRpYS9tZWRpYXRlayxjYW1pc3AudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21lZGlhL21lZGlhdGVrLGNhbWlzcC50eHQNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQpp
bmRleCAwMDAwMDAwMDAwMDAuLmE4NWYzN2MwYjg3ZA0KLS0tIC9kZXYvbnVsbA0KKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLGNhbWlzcC50eHQN
CkBAIC0wLDAgKzEsODMgQEANCisqIE1lZGlhdGVrIEltYWdlIFNpZ25hbCBQcm9jZXNzb3IgUGFz
cyAxIChJU1AgUDEpDQorDQorVGhlIFBhc3MgMSB1bml0IG9mIE1lZGlhdGVrJ3MgY2FtZXJhIElT
UCBzeXN0ZW0gZ3JhYnMgdGhlIHNlbnNvciBkYXRhIG91dA0KK2Zyb20gdGhlIHNlbnNvciBpbnRl
cmZhY2UsIGFwcGxpZXMgSVNQIGVmZmVjdHMgZnJvbSB0dW5pbmcgZGF0YSBhbmQgb3V0cHV0cw0K
K3RoZSBpbWFnZSBkYXRhIGFuZCBzdGF0aXN0aWNzIGRhdGEgdG8gRFJBTS4gRnVydGhlcm1vcmUs
IFBhc3MgMSB1bml0IGhhcw0KK3RoZSBhYmlsaXR5IHRvIG91dHB1dCB0d28gZGlmZmVyZW50IHJl
c29sdXRpb25zIGZyYW1lcyBhdCB0aGUgc2FtZSB0aW1lIHRvDQoraW5jcmVhc2UgdGhlIHBlcmZv
cm1hbmNlIG9mIHRoZSBjYW1lcmEgYXBwbGljYXRpb24uDQorDQorUmVxdWlyZWQgcHJvcGVydGll
czoNCistIGNvbXBhdGlibGU6IE11c3QgYmUgIm1lZGlhdGVrLG10ODE4My1jYW1pc3AiIGZvciBN
VDgxODMuDQorLSByZWc6IFBoeXNpY2FsIGJhc2UgYWRkcmVzcyBvZiB0aGUgY2FtZXJhIGZ1bmN0
aW9uIGJsb2NrIHJlZ2lzdGVyIGFuZA0KKyAgbGVuZ3RoIG9mIG1lbW9yeSBtYXBwZWQgcmVnaW9u
LiBNdXN0IGNvbnRhaW4gYW4gZW50cnkgZm9yIGVhY2ggZW50cnkNCisgIGluIHJlZy1uYW1lcy4N
CistIHJlZy1uYW1lczogTXVzdCBpbmNsdWRlIHRoZSBmb2xsb3dpbmcgZW50cmllczoNCisgICJj
YW1fc3lzIjogQ2FtZXJhIGJhc2UgZnVuY3Rpb24gYmxvY2sNCisgICJjYW1fdW5pIjogQ2FtZXJh
IFVOSSBmdW5jdGlvbiBibG9jaw0KKyAgImNhbV9hIjogQ2FtZXJhIElTUCBQMSBoYXJkd2FyZSB1
bml0IEENCisgICJjYW1fYiI6IENhbWVyYSBJU1AgUDEgaGFyZHdhcmUgdW5pdCBCDQorICAiY2Ft
X2MiOiBDYW1lcmEgSVNQIFAxIGhhcmR3YXJlIHVuaXQgQw0KKy0gaW50ZXJydXB0czogTXVzdCBj
b250YWluIGFuIGVudHJ5IGZvciBlYWNoIGVudHJ5IGluIGludGVycnVwdC1uYW1lcy4NCistIGlu
dGVycnVwdC1uYW1lcyA6IE11c3QgaW5jbHVkZSB0aGUgZm9sbG93aW5nIGVudHJpZXM6DQorICAi
Y2FtX3VuaSI6IENhbWVyYSBVTkkgaW50ZXJydXB0DQorICAiY2FtX2EiOiBDYW1lcmEgdW5pdCBB
IGludGVycnVwdA0KKyAgImNhbV9iIjogQ2FtZXJhIHVuaXQgQiBpbnRlcnJ1cHQNCisgICJjYW1f
YyI6IENhbWVyYSB1bml0IEMgaW50ZXJydXB0DQorLSBpb21tdXM6IFNoYWxsIHBvaW50IHRvIHRo
ZSByZXNwZWN0aXZlIElPTU1VIGJsb2NrIHdpdGggbWFzdGVyIHBvcnQNCisgIGFzIGFyZ3VtZW50
LCBzZWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11L21lZGlhdGVrLGlv
bW11LnR4dA0KKyAgZm9yIGRldGFpbHMuDQorLSBjbG9ja3M6IEEgbGlzdCBvZiBwaGFuZGxlIGFu
ZCBjbG9jayBzcGVjaWZpZXIgcGFpcnMgYXMgbGlzdGVkDQorICBpbiBjbG9jay1uYW1lcyBwcm9w
ZXJ0eSwgc2VlDQorICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svY2xv
Y2stYmluZGluZ3MudHh0IGZvciBkZXRhaWxzLg0KKy0gY2xvY2stbmFtZXM6IE11c3QgYmUgImNh
bXN5c19jYW1fY2dwZG4iIGFuZCAiY2Ftc3lzX2NhbXRnX2NncGRuIi4NCistIG1lZGlhdGVrLGxh
cmI6IE11c3QgY29udGFpbiB0aGUgbG9jYWwgYXJiaXRlcnMgaW4gdGhlIGN1cnJlbnQgU29Dcywg
c2VlDQorICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xs
ZXJzL21lZGlhdGVrLHNtaS1sYXJiLnR4dA0KKyAgZm9yIGRldGFpbHMuDQorLSBwb3dlci1kb21h
aW5zOiBhIHBoYW5kbGUgdG8gdGhlIHBvd2VyIGRvbWFpbiwgc2VlDQorICBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXIvcG93ZXJfZG9tYWluLnR4dCBmb3IgZGV0YWlscy4N
CistIG1lZGlhdGVrLHNjcDogVGhlIG5vZGUgb2Ygc3lzdGVtIGNvbnRyb2wgcHJvY2Vzc29yIChT
Q1ApLCBzZWUNCisgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9j
L210ayxzY3AudHh0IGZvciBkZXRhaWxzLg0KKy0gcG9ydDogY2hpbGQgcG9ydCBub2RlIGNvcnJl
c3BvbmRpbmcgdG8gdGhlIGRhdGEgaW5wdXQsIGluIGFjY29yZGFuY2Ugd2l0aA0KKyAgdGhlIHZp
ZGVvIGludGVyZmFjZSBiaW5kaW5ncyBkZWZpbmVkIGluDQorICBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWVkaWEvdmlkZW8taW50ZXJmYWNlcy50eHQuIFRoZSBwb3J0DQorICBu
b2RlIG11c3QgY29udGFpbiBhdCBsZWFzdCBvbmUgZW5kcG9pbnQuDQorDQorRXhhbXBsZToNCitT
b0Mgc3BlY2lmaWMgRFQgZW50cnk6DQorDQorCWNhbWlzcDogY2FtaXNwQDFhMDAwMDAwIHsNCisJ
CWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTgzLWNhbWlzcCI7DQorCQlyZWcgPSA8MCAweDFh
MDAwMDAwIDAgMHgxMDAwPiwNCisJCQkJPDAgMHgxYTAwMzAwMCAwIDB4MTAwMD4sDQorCQkJCTww
IDB4MWEwMDQwMDAgMCAweDIwMDA+LA0KKwkJCQk8MCAweDFhMDA2MDAwIDAgMHgyMDAwPiwNCisJ
CQkJPDAgMHgxYTAwODAwMCAwIDB4MjAwMD47DQorCQlyZWctbmFtZXMgPSAiY2FtX3N5cyIsDQor
CQkJCSJjYW1fdW5pIiwNCisJCQkJImNhbV9hIiwNCisJCQkJImNhbV9iIiwNCisJCQkJImNhbV9j
IjsNCisJCWludGVycnVwdHMgPSA8R0lDX1NQSSAyNTMgSVJRX1RZUEVfTEVWRUxfTE9XPiwNCisJ
CQkJPEdJQ19TUEkgMjU0IElSUV9UWVBFX0xFVkVMX0xPVz4sDQorCQkJCTxHSUNfU1BJIDI1NSBJ
UlFfVFlQRV9MRVZFTF9MT1c+LA0KKwkJCQk8R0lDX1NQSSAyNTYgSVJRX1RZUEVfTEVWRUxfTE9X
PjsNCisJCWludGVycnVwdC1uYW1lcyA9ICJjYW1fdW5pIiwNCisJCQkJImNhbV9hIiwNCisJCQkJ
ImNhbV9iIiwNCisJCQkJImNhbV9jIjsNCisJCWlvbW11cyA9IDwmaW9tbXUgTTRVX1BPUlRfQ0FN
X0lNR08+Ow0KKwkJY2xvY2tzID0gPCZjYW1zeXMgQ0xLX0NBTV9DQU0+LA0KKwkJCQk8JmNhbXN5
cyBDTEtfQ0FNX0NBTVRHPjsNCisJCWNsb2NrLW5hbWVzID0gImNhbXN5c19jYW1fY2dwZG4iLA0K
KwkJCQkiY2Ftc3lzX2NhbXRnX2NncGRuIjsNCisJCW1lZGlhdGVrLGxhcmIgPSA8JmxhcmIzPiwN
CisJCQkJPCZsYXJiNj47DQorCQlwb3dlci1kb21haW5zID0gPCZzY3BzeXMgTVQ4MTgzX1BPV0VS
X0RPTUFJTl9DQU0+Ow0KKwkJbWVkaWF0ZWssc2NwID0gPCZzY3A+Ow0KKw0KKwkJcG9ydCB7DQor
CQkJY2FtaXNwX2VuZHBvaW50OiBlbmRwb2ludCB7DQorCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwm
c2VuaW5mX2NhbWlzcF9lbmRwb2ludD47DQorCQkJfTsNCisJCX07DQorCX07DQotLSANCjIuMTgu
MA0K

