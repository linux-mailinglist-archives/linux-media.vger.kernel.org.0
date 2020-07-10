Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8F221B31E
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 12:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726933AbgGJKTm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 06:19:42 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:63182 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726496AbgGJKTl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 06:19:41 -0400
X-UUID: 6556c6b5225b4e2fad2239bdccab265c-20200710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=CqFYCV4H7t0aImWcS2mYr0/XneJOwb8BbgC6yqbQIlM=;
        b=Cow9P2Hfqh8FBFlc43D21u3PJDFRr5q3nqoM5OCyH8TJoVYMyEYphklqYRKvHHA8FdzPvyr6DsKoLO1mwr45hLMWd2kZU9bfJGpWc8VKR1JK71lqzCZo3j68YftsVje+Ck4TtIa+v9As6nQwKXb0i8XppGh5E+ZHhfAbo/xA6F0=;
X-UUID: 6556c6b5225b4e2fad2239bdccab265c-20200710
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 754923263; Fri, 10 Jul 2020 18:19:36 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Jul 2020 18:19:34 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 10 Jul 2020 18:19:33 +0800
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <sakari.ailus@linux.intel.com>, <drinkcat@chromium.org>,
        <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
        <bingbu.cao@intel.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <shengnan.wang@mediatek.com>,
        <dongchun.zhu@mediatek.com>, <1095088256@qq.com>,
        <matrix.zhu@aliyun.com>
Subject: [PATCH v13 0/2] media: i2c: Add support for OV02A10 sensor
Date:   Fri, 10 Jul 2020 18:18:48 +0800
Message-ID: <20200710101850.4604-1-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGVsbG8sDQoNClRoaXMgc2VyaWVzIGFkZHMgWUFNTCBEVCBiaW5kaW5nIGFuZCBWNEwyIHN1Yi1k
ZXZpY2UgZHJpdmVyIGZvciBPbW5pdmlzaW9uJ3MNCk9WMDJBMTAgMi1tZWdhcGl4ZWwgMTAtYml0
IFJBVyBDTU9TIDEvNSIgc2Vuc29yLCB3aGljaCBoYXMgYSBzaW5nbGUgTUlQSSBsYW5lDQppbnRl
cmZhY2UgYW5kIHVzZXMgdGhlIEkyQyBidXMgZm9yIGNvbnRyb2wgYW5kIHRoZSBDU0ktMiBidXMg
Zm9yIGRhdGEuDQoNClRoZSBkcml2ZXIgaXMgaW1wbGVtZW50ZWQgd2l0aCBWNEwyIGZyYW1ld29y
ay4NCiAtIEFzeW5jIHJlZ2lzdGVyZWQgYXMgYSBWNEwyIHN1Yi1kZXZpY2UuDQogLSBBcyB0aGUg
Zmlyc3QgY29tcG9uZW50IG9mIGNhbWVyYSBzeXN0ZW0gaW5jbHVkaW5nIFNlbmluZiwgSVNQIHBp
cGVsaW5lLg0KIC0gQSBtZWRpYSBlbnRpdHkgdGhhdCBwcm92aWRlcyBvbmUgc291cmNlIHBhZCBp
biBjb21tb24gYW5kIHR3byBmb3IgZHVhbC1jYW0uDQogLSBVc2VkIGluIGNhbWVyYSBmZWF0dXJl
cyBvbiBDck9TIGFwcGxpY2F0aW9uLg0KDQpBbHNvIHRoaXMgZHJpdmVyIHN1cHBvcnRzIGZvbGxv
d2luZyBmZWF0dXJlczoNCiAtIG1hbnVhbCBleHBvc3VyZSBhbmQgYW5hbG9nIGdhaW4gY29udHJv
bCBzdXBwb3J0DQogLSB2ZXJ0aWNhbCBibGFua2luZyBjb250cm9sIHN1cHBvcnQNCiAtIHRlc3Qg
cGF0dGVybiBzdXBwb3J0DQogLSBtZWRpYSBjb250cm9sbGVyIHN1cHBvcnQNCiAtIHJ1bnRpbWUg
UE0gc3VwcG9ydA0KIC0gc3VwcG9ydCByZXNvbHV0aW9uOiAxNjAweDEyMDAgYXQgMzBGUFMNCiAN
ClByZXZpb3VzIHZlcnNpb25zIG9mIHRoaXMgcGF0Y2gtc2V0IGNhbiBiZSBmb3VuZCBoZXJlOg0K
IHYxMjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWEvMjAyMDA3MDIxMTUyMjMu
MjE1MDctMS1kb25nY2h1bi56aHVAbWVkaWF0ZWsuY29tLw0KIHYxMTogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtbWVkaWEvMjAyMDA2MzAwMjQ5NDIuMjA4OTEtMS1kb25nY2h1bi56aHVA
bWVkaWF0ZWsuY29tLw0KIHYxMDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWEv
MjAyMDA2MTUxMjI5MzcuMTg5NjUtMy1kb25nY2h1bi56aHVAbWVkaWF0ZWsuY29tLw0KIHYwOTog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWEvMjAyMDA1MjMwODQxMDMuMzEyNzYt
MS1kb25nY2h1bi56aHVAbWVkaWF0ZWsuY29tLw0KIHYwODogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtbWVkaWEvMjAyMDA1MDkwODA2MjcuMjMyMjItMS1kb25nY2h1bi56aHVAbWVkaWF0
ZWsuY29tLw0KIHYwNzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWEvMjAyMDA0
MzAwODA5MjQuMTE0MC0xLWRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20vDQogdjA2OiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRpYS8yMDE5MTIxMTExMjg0OS4xNjcwNS0xLWRvbmdj
aHVuLnpodUBtZWRpYXRlay5jb20vDQogdjA1OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1tZWRpYS8yMDE5MTEwNDEwNTcxMy4yNDMxMS0xLWRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20v
DQogdjA0OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRpYS8yMDE5MDkwNzA5Mjcy
OC4yMzg5Ny0xLWRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20vDQogdjAzOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1tZWRpYS8yMDE5MDgxOTAzNDMzMS4xMzA5OC0xLWRvbmdjaHVuLnpo
dUBtZWRpYXRlay5jb20vDQogdjAyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRp
YS8yMDE5MDcwNDA4NDY1MS4zMTA1LTEtZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbS8NCiB2MDE6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhLzIwMTkwNTIzMTAyMjA0LjI0MTEy
LTEtZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbS8NCg0KQ2hhbmdlcyBvZiB2MTMgbWFpbmx5IGFk
ZHJlc3MgY29tbWVudHMgZnJvbSBSb2IuDQpDb21wYXJlZCB0byB2MTI6DQogLSBBZGQgcmV2aWV3
ZWQtYnkgZm9yIHNlbnNvciBkcml2ZXINCiAtIEZpeCBhIGJ1aWxkLXdhcm5pbmcgYW5kIHRoZSB3
YXJuaW5nIHdoZW4gYXBwbHlpbmcgdGhlIHBhdGNoIHdpdGggZ2l0IGFtDQoNClBsZWFzZSByZXZp
ZXcuDQpUaGFua3MuDQoNCkRvbmdjaHVuIFpodSAoMik6DQogIG1lZGlhOiBkdC1iaW5kaW5nczog
bWVkaWE6IGkyYzogRG9jdW1lbnQgT1YwMkExMCBiaW5kaW5ncw0KICBtZWRpYTogaTJjOiBBZGQg
T1YwMkExMCBpbWFnZSBzZW5zb3IgZHJpdmVyDQoNCiAuLi4vYmluZGluZ3MvbWVkaWEvaTJjL292
dGksb3YwMmExMC55YW1sICAgICAgICAgICB8ICAxNzIgKysrKw0KIE1BSU5UQUlORVJTICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgOCArDQogZHJpdmVycy9tZWRp
YS9pMmMvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEzICsNCiBkcml2ZXJz
L21lZGlhL2kyYy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDEgKw0KIGRy
aXZlcnMvbWVkaWEvaTJjL292MDJhMTAuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgMTA1MCAr
KysrKysrKysrKysrKysrKysrKw0KIDUgZmlsZXMgY2hhbmdlZCwgMTI0NCBpbnNlcnRpb25zKCsp
DQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZWRpYS9pMmMvb3Z0aSxvdjAyYTEwLnlhbWwNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9t
ZWRpYS9pMmMvb3YwMmExMC5jDQoNCi0tIA0KMi45LjINCg==

