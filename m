Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 600A8173C5A
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2020 17:00:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbgB1QAO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Feb 2020 11:00:14 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:50645 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726974AbgB1QAN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Feb 2020 11:00:13 -0500
X-UUID: 38d14b891f67470cab55ab539973e9b9-20200229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=6GQzQmyAP4hZHov0w9Z++EkLKOgmoZgg7oFRSbDV/cs=;
        b=oF3/ZhXT0lsdOfiwc56cBMF6TTySj1OjKziRwyhm/UW9vtIFAEV+pAD0IUIzgBbyw3uYc+Y61h9pa8vF/pPGJ3qN6ltUfi7LcCIZUFV3dGvB7A+h68GhljnmhKxkFqZVMyUenI/wIMcRx6w1Mjqn8jFRaoGZf9cZZZ3Ng/Kyy4c=;
X-UUID: 38d14b891f67470cab55ab539973e9b9-20200229
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 2020456843; Sat, 29 Feb 2020 00:00:09 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 28 Feb 2020 23:59:03 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 28 Feb 2020 23:59:48 +0800
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
        <dongchun.zhu@mediatek.com>
Subject: [V3, 0/2] media: i2c: add support for DW9768 VCM driver
Date:   Fri, 28 Feb 2020 23:59:56 +0800
Message-ID: <20200228155958.20657-1-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGVsbG8sDQoNCkFkZCBEVCBiaW5kaW5ncyBpbiBZQU1MIGFuZCB2NGwyIGRyaXZlciBmb3IgRFc5
NzY4IGxlbnMgdm9pY2UgY29pbCBhY3R1YXRvci4NClRoaXMgaXMgYSAxMC1iaXQgREFDIHdpdGgg
MTAwbUEgb3V0cHV0IGN1cnJlbnQgc2luayBjYXBhYmlsaXR5IGZyb20gRG9uZ3dvb24sDQpkZXNp
Z25lZCBmb3IgbGluZWFyIGNvbnRyb2wgb2Ygdm9pY2UgY29pbCBtb3RvciwgYW5kIGNvbnRyb2xs
ZWQgdmlhIEkyQyBzZXJpYWwNCmludGVyZmFjZSB0byBzZXQgdGhlIGRlc2lyZWQgZm9jdXMgcG9z
aXRpb24uDQoNClRoZSBEVzk3NjggY29udHJvbHMgdGhlIHBvc2l0aW9uIHdpdGggMTAtYml0IERB
QyBkYXRhIERbOTowXSBhbmQgc2VwZXJhdGVzDQp0d28gOC1iaXQgcmVnaXN0ZXJzIHRvIGNvbnRy
b2wgdGhlIFZDTSBwb3NpdGlvbiBhcyBiZWxvd3MuDQpEQUNfTVNCOiBEWzk6OF0gKEFERDogMHgw
MykNCiAgICAgKy0tLSstLS0rLS0tKy0tLSstLS0rLS0tKy0tLSstLS0rDQogICAgIHwtLS18LS0t
fC0tLXwtLS18LS0tfC0tLXxEMDl8RDA4fA0KICAgICArLS0tKy0tLSstLS0rLS0tKy0tLSstLS0r
LS0tKy0tLSsNCkRBQ19MU0I6IERbNzowXSAoQUREOiAweDA0KQ0KICAgICArLS0tKy0tLSstLS0r
LS0tKy0tLSstLS0rLS0tKy0tLSsNCiAgICAgfEQwN3xEMDZ8RDA1fEQwNHxEMDN8RDAyfEQwMXxE
MDB8DQogICAgICstLS0rLS0tKy0tLSstLS0rLS0tKy0tLSstLS0rLS0tKw0KDQpUaGlzIGRyaXZl
ciBzdXBwb3J0czoNCiAtIHNldCBEVzk3NjggdG8gc3RhbmRieSBtb2RlIG9uY2Ugc3VzcGVuZCBh
bmQgdHVybiBpdCBiYWNrIHRvIGFjdGl2ZSBpZiByZXN1bWUNCiAtIHNldCB0aGUgcG9zaXRpb24g
dmlhIFY0TDJfQ0lEX0ZPQ1VTX0FCU09MVVRFIGN0cmwNCg0KQ2hhbmdlcyBvZiB2MyBhcmUgbWFp
bmx5IGFkZHJlc3NpbmcgY29tbWVudHMgZnJvbSBBbmR5LCBSb2IsIFNha2FyaSwgVG9tYXN6LA0K
Y29tcGFyZWQgdG8gdjI6DQogLSBSZWJhc2Ugb250byA1LjYtcmMxDQogLSBDb252ZXJ0IHRleHQg
ZG9jdW1lbnRhdGlvbiB0byBZQU1MIHNjaGVtYQ0KIC0gQWRkIGRvY3VtZW50cyBmb3IgdGhlIHJl
Z2lzdGVyIGFkZHJlc3NlcyBhbmQgYml0cyBpbiB0aGUgcmVnaXN0ZXJzDQogLSBNZXJnZSBfcG93
ZXJfb2ZmL29uIHdpdGggcnVudGltZSBQTSBzdXNwZW5kL3Jlc3VtZSBmdW5jdGlvbg0KIC0gRHJv
cCB0aGUgSTJDIElEIHRhYmxlDQogLSBSZWZpbmUgRFc5NzY4IHBvd2VyIHNlcXVlbmNpbmcgdGlt
aW5nDQogLSBVc2UgdGhlIHJlZ3VsYXRvciBidWxrIEFQSSB0byBlbmFibGUvZGlzYWJsZSByZWd1
bGF0b3JzDQogLSBDaGFuZ2UgaTJjX3NtYnVzX3dyaXRlX2Jsb2NrX2RhdGEoKSB0byBpMmNfc21i
dXNfd3JpdGVfd29yZF9kYXRhKCkNCiAtIEZpeHVwIGNvZGluZyBzdHlsZSBhbmQgaW1wcm92ZSBj
b2RlIHF1YWxpdHkNCiAtIEZpeCBvdGhlciByZXZpZXdlZCBpc3N1ZXMgaW4gVjINCg0KTWFpbmx5
IGNoYW5nZXMgb2YgdjIgYXJlIGFkZHJlc3NpbmcgdGhlIGNvbW1lbnRzIGZyb20gVG9tYXN6LCBC
aW5nYnUsIEFuZHksDQppbmNsdWRpbmcsDQogLSBVc2UgaTJjX3NtYnVzX3dyaXRlX2J5dGVfZGF0
YSB0byByZXBsYWNlIG9mIHRoZSBjdXN0b20gZHc5NzY4X2kyY193cml0ZQ0KIC0gVXNlIGkyY19z
bWJ1c193cml0ZV9ibG9ja19kYXRhIHRvIHNldCB2Y20gcG9zdGlvbg0KIC0gVXNlIHRoZSBydW50
aW1lIFBNIHN1c3BlbmQvcmVzdW1lIGNhbGxiYWNrcyB0byBwb3dlciBvZmYvb24NCiAtIENoZWNr
IHRoZSBQTSBydW50aW1lIHN0YXR1cyBiZWZvcmUgcG93ZXJpbmcgb2ZmIGluIGR3OTc2OF9yZW1v
dmUgZnVuY3Rpb24NCiAtIEFkZCBvbmUgbW9yZSByZWd1bGF0b3IgdmluIGZvciB0aGUgSTJDIGlu
dGVyZmFjZQ0KIC0gUmVtb3ZlIG9yIHJlZmluZSBsb2cgcHJpbnQNCiAtIEZpeCBvdGhlciByZXZp
ZXdlZCBpc3N1ZXMgaW4gdjENCg0KRG9uZ2NodW4gWmh1ICgyKToNCiAgbWVkaWE6IGkyYzogZHc5
NzY4OiBBZGQgRFQgc3VwcG9ydCBhbmQgTUFJTlRBSU5FUlMgZW50cnkNCiAgbWVkaWE6IGkyYzog
QWRkIERXOTc2OCBWQ00gZHJpdmVyDQoNCiAuLi4vYmluZGluZ3MvbWVkaWEvaTJjL2Rvbmd3b29u
LGR3OTc2OC55YW1sICAgICAgICB8ICA1NSArKysNCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgOCArDQogZHJpdmVycy9tZWRpYS9pMmMvS2Nv
bmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTAgKw0KIGRyaXZlcnMvbWVkaWEvaTJj
L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsNCiBkcml2ZXJzL21lZGlh
L2kyYy9kdzk3NjguYyAgICAgICAgICAgICAgICAgICAgICAgICB8IDQzNyArKysrKysrKysrKysr
KysrKysrKysNCiA1IGZpbGVzIGNoYW5nZWQsIDUxMSBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvZG9u
Z3dvb24sZHc5NzY4LnlhbWwNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9pMmMv
ZHc5NzY4LmMNCg0KLS0gDQoyLjkuMg0K

