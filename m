Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3D6316F732
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 06:26:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbgBZF0S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 00:26:18 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:56195 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725890AbgBZF0S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 00:26:18 -0500
X-UUID: 0b727d7bc378477da6077d4dd771285e-20200226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=49qv1PxTKA63h58GMIBjrRHNQLNwM95yAfup8dmCDng=;
        b=VgGBkqS/lhx8aHza6srnTlOWVCXAAb7gqgzRHJMqS5XGY73XeIxi/bCMdr5TIYF660EOvYMF+OB+BLUXGndf5lm7cvKx3ReY7GK/fkziBEs5prVwCB5Cr+4JwVsXdXVEWmphC7e2LQq+ZRibouGG8a4onXEHYBixO5uBlLIn+fo=;
X-UUID: 0b727d7bc378477da6077d4dd771285e-20200226
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <gtk_ruiwang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 641813501; Wed, 26 Feb 2020 13:26:12 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 26 Feb 2020 13:25:18 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 26 Feb 2020 13:23:53 +0800
From:   <gtk_ruiwang@mediatek.com>
To:     <linux-firmware@kernel.org>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>, <PoChun.Lin@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        <gtk_ruiwang@mediatek.com>
Subject: pull request: linux-firmware: move MT8173 VPU FW to subfolder 
Date:   Wed, 26 Feb 2020 13:26:02 +0800
Message-ID: <20200226052603.22768-1-gtk_ruiwang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgbGludXgtZmlybXdhcmUgbWFpbnRhaW5lcnMsDQoNClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBz
aW5jZSBjb21taXQgZWZjZmEwM2FlNjEwMGRmZTUyM2ViZjYxMmUwM2MzYTkwZmM0Yzc5NDoNCg0K
ICBsaW51eC1maXJtd2FyZTogVXBkYXRlIGZpcm13YXJlIGZpbGUgZm9yIEludGVsIEJsdWV0b290
aCBBWDIwMSAoMjAyMC0wMi0yNCAwNzo0Mzo0MiAtMDUwMCkNCg0KYXJlIGF2YWlsYWJsZSBpbiB0
aGUgR2l0IHJlcG9zaXRvcnkgYXQ6DQoNCiAgaHR0cHM6Ly9naXRodWIuY29tL3J1aXdhbmctbXRr
L2xpbnV4X2Z3X3ZwdS5naXQNCg0KZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGE4YTE4
ZDFjZTU5MjBiYzBjZmNmMzIwNzQ3MTYzY2YxMzgwNmI1Njg6DQoNCiAgbWVkaWF0ZWs6IG1vdmUg
TVQ4MTczIFZQVSBGVyB0byBzdWJmb2xkZXIgKDIwMjAtMDItMjYgMTM6MDg6MTUgKzA4MDApDQoN
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0NCmd0a19ydWl3YW5nICgxKToNCiAgICAgIG1lZGlhdGVrOiBtb3ZlIE1UODE3MyBW
UFUgRlcgdG8gc3ViZm9sZGVyDQoNCiBXSEVOQ0UgICAgICAgICAgICAgICAgICAgIHwgICA2ICsr
KystLQ0KIG1lZGlhdGVrL210ODE3My92cHVfZC5iaW4gfCBCaW4gMCAtPiAyOTc3MTg0IGJ5dGVz
DQogbWVkaWF0ZWsvbXQ4MTczL3ZwdV9wLmJpbiB8IEJpbiAwIC0+IDEzMTE4MCBieXRlcw0KIHZw
dV9kLmJpbiAgICAgICAgICAgICAgICAgfCBCaW4gMjk3NzE4NCAtPiAyNSBieXRlcw0KIHZwdV9w
LmJpbiAgICAgICAgICAgICAgICAgfCBCaW4gMTMxMTgwIC0+IDI1IGJ5dGVzDQogNSBmaWxlcyBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQogY3JlYXRlIG1vZGUgMTAw
NjQ0IG1lZGlhdGVrL210ODE3My92cHVfZC5iaW4NCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWVkaWF0
ZWsvbXQ4MTczL3ZwdV9wLmJpbg0KIG1vZGUgY2hhbmdlIDEwMDY0NCA9PiAxMjAwMDAgdnB1X2Qu
YmluDQogbW9kZSBjaGFuZ2UgMTAwNjQ0ID0+IDEyMDAwMCB2cHVfcC5iaW4NCg0K

