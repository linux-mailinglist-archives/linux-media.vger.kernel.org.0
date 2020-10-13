Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8875928CEE1
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 15:05:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387565AbgJMNFP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 09:05:15 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:38768 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387546AbgJMNFN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 09:05:13 -0400
X-UUID: cea8e0db39b14872b768a720a4baa583-20201013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Ma35HvnVMPv2Mtqmq10T4yH5J23SnKvh3FQUK91VnMk=;
        b=MK+dSZvaqg/95XMe0bYgxpJiDWXwFicA+0EVpEiroI6Gt8BC/kAuF6UcCXYQ34jrmXn9YlsE7bY3edHr2i0eUeuxLTw00PdOeepkOEXGnnb45Qtfq2l31qhnlgaWNOnNOZqtDFl3RSwq8R3oP8xTurEpEgEGgrUmNSx8C3qQYcI=;
X-UUID: cea8e0db39b14872b768a720a4baa583-20201013
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1278656683; Tue, 13 Oct 2020 21:05:09 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Oct 2020 21:05:08 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 13 Oct 2020 21:05:07 +0800
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
Subject: [PATCH v15 0/2] media: i2c: Add support for OV02A10 sensor
Date:   Tue, 13 Oct 2020 21:05:01 +0800
Message-ID: <20201013130503.2412-1-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGVsbG8sDQoNCk9taW5pVmlzaW9uIE9WMDJBMTAgaXMgYSAyLW1lZ2FwaXhlbCAxMC1iaXQgUkFX
IENNT1MgMS81IiBzZW5zb3Igd2hpY2ggaGFzDQphIHNpbmdsZSBNSVBJIGxhbmUgaW50ZXJmYWNl
LiBUaGlzIGlzIGEgY2FtZXJhIHNlbnNvciB1c2luZyB0aGUgSTJDIGJ1cw0KZm9yIGNvbnRyb2wg
YW5kIHRoZSBDU0ktMiBidXMgZm9yIGRhdGEuIA0KDQpUaGUgZHJpdmVyIGlzIGltcGxlbWVudGVk
IHdpdGggVjRMMiBmcmFtZXdvcmsuDQogLSBBc3luYyByZWdpc3RlcmVkIGFzIGEgVjRMMiBzdWIt
ZGV2aWNlLg0KIC0gQXMgdGhlIGZpcnN0IGNvbXBvbmVudCBvZiBjYW1lcmEgc3lzdGVtIGluY2x1
ZGluZyBJU1AgcGlwZWxpbmUuDQogLSBBIG1lZGlhIGVudGl0eSBwcm92aWRpbmcgb25lIHNvdXJj
ZSBwYWQgaW4gY29tbW9uIGFuZCB0d28gZm9yIGR1YWwtY2FtLg0KDQpBbHNvIHRoaXMgZHJpdmVy
IHN1cHBvcnRzIGZvbGxvd2luZyBmZWF0dXJlczoNCiAtIE1hbnVhbCBleHBvc3VyZSBhbmQgYW5h
bG9nIGdhaW4gY29udHJvbCBzdXBwb3J0DQogLSBWZXJ0aWNhbCBibGFua2luZyBjb250cm9sIHN1
cHBvcnQNCiAtIFRlc3QgcGF0dGVybiBzdXBwb3J0DQogLSBNZWRpYSBjb250cm9sbGVyIHN1cHBv
cnQNCiAtIFJ1bnRpbWUgUE0gc3VwcG9ydA0KIC0gU3VwcG9ydCByZXNvbHV0aW9uOiAxNjAweDEy
MDAgYXQgMzBGUFMNCg0KQ2hhbmdlcyBvZiB2MTUgbWFpbmx5IGFkZHJlc3MgY29tbWVudHMgZnJv
bSBSb2IsIEFuZHksIFRvbWFzeiBhbmQgU2FrYXJpLg0KQ29tcGFyZWQgdG8gdjE0Og0KIC0gRml4
IGltcGVyZmVjdGlvbnMgaW4gRFQNCiAtIFVzZSBkZXZfZXJyX3Byb2JlKCkgQVBJIGluIHByb2Jl
DQogLSBVc2UgaTJjX3NtYnVzX3JlYWRfd29yZF9zd2FwcGVkKCkgQVBJIHRvIHJlYWQgMTYtYml0
IGRhdGEuDQogLSBGaXggb3RoZXIgcmV2aWV3IGNvbW1lbnRzIHRvIGltcHJvdmUgcmVhZGFiaWxp
dHkuDQoNClBsZWFzZSByZXZpZXcuDQpUaGFua3MuDQoNCkRvbmdjaHVuIFpodSAoMik6DQogIG1l
ZGlhOiBkdC1iaW5kaW5nczogbWVkaWE6IGkyYzogRG9jdW1lbnQgT1YwMkExMCBiaW5kaW5ncw0K
ICBtZWRpYTogaTJjOiBBZGQgT1YwMkExMCBpbWFnZSBzZW5zb3IgZHJpdmVyDQoNCiAuLi4vYmlu
ZGluZ3MvbWVkaWEvaTJjL292dGksb3YwMmExMC55YW1sICAgICAgICAgICB8ICAxNjIgKysrDQog
TUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA4
ICsNCiBkcml2ZXJzL21lZGlhL2kyYy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgMTMgKw0KIGRyaXZlcnMvbWVkaWEvaTJjL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgICAgMSArDQogZHJpdmVycy9tZWRpYS9pMmMvb3YwMmExMC5jICAgICAgICAgICAgICAg
ICAgICAgICAgfCAxMDU4ICsrKysrKysrKysrKysrKysrKysrDQogNSBmaWxlcyBjaGFuZ2VkLCAx
MjQyIGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9vdnRpLG92MDJhMTAueWFtbA0KIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL21lZGlhL2kyYy9vdjAyYTEwLmMNCg0KLS0gDQoyLjkuMg0K

