Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7832112BFB
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2019 13:48:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727952AbfLDMrw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Dec 2019 07:47:52 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:54746 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727815AbfLDMrw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Dec 2019 07:47:52 -0500
X-UUID: 76f51c32e1ab4d3f9100b19ee2d8b9c3-20191204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Nl4e9sXBb0YIZeHa5uaTWki9jmH9c36DVKn4iu5IzsU=;
        b=jvU1ty21YIfj5F99k9L69k2ifyDx5VzXgyw6omcgEr7iK3nkr1eGOLDR9XM8CfzgyFqAe6Zz3Y3khxyaITsyjCIWQ3Jy9gXt0Ws12ZVvRHRLxgeTGydXHi4YwQmb8DIQNLp53uNdFLGVA3T0Dj6OhL1jpdPGnJOnQ+7Sfi2EffE=;
X-UUID: 76f51c32e1ab4d3f9100b19ee2d8b9c3-20191204
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw01.mediatek.com
        (envelope-from <jerry-ch.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 120516081; Wed, 04 Dec 2019 20:47:47 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Dec 2019 20:47:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 4 Dec 2019 20:46:51 +0800
From:   Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>
To:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>
CC:     <pihsun@chromium.org>, <yuzhao@chromium.org>,
        <zwisler@chromium.org>, <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <frederic.chen@mediatek.com>, <Jerry-ch.Chen@mediatek.com>,
        <jungo.lin@mediatek.com>, <Rynn.Wu@mediatek.com>,
        <linux-media@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <devicetree@vger.kernel.org>,
        Jerry-ch Chen <jerry-ch.chen@mediatek.com>
Subject: [RFC PATCH V4 3/4] dts: arm64: mt8183: Add FD nodes
Date:   Wed, 4 Dec 2019 20:47:31 +0800
Message-ID: <20191204124732.10932-4-Jerry-Ch.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RnJvbTogSmVycnktY2ggQ2hlbiA8amVycnktY2guY2hlbkBtZWRpYXRlay5jb20+DQoNClRoaXMg
cGF0Y2ggYWRkcyBub2RlcyBmb3IgRmFjZSBEZXRlY3Rpb24gKEZEKSB1bml0LiBGRCBpcyBlbWJl
ZGRlZA0KaW4gTWVkaWF0ZWsgU29DcyBhbmQgd29ya3Mgd2l0aCB0aGUgY28tcHJvY2Vzc29yIHRv
IHBlcmZvcm0gZmFjZQ0KZGV0ZWN0aW9uIG9uIHRoZSBpbnB1dCBkYXRhIGFuZCBpbWFnZSBhbmQg
b3V0cHV0IGRldGVjdGVkIGZhY2UgcmVzdWx0Lg0KDQpTaWduZWQtb2ZmLWJ5OiBKZXJyeS1jaCBD
aGVuIDxqZXJyeS1jaC5jaGVuQG1lZGlhdGVrLmNvbT4NCi0tLQ0KIGFyY2gvYXJtNjQvYm9vdC9k
dHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kgfCAxMyArKysrKysrKysrKysrDQogMSBmaWxlIGNoYW5n
ZWQsIDEzIGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
bWVkaWF0ZWsvbXQ4MTgzLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4
My5kdHNpDQppbmRleCBjM2E1MTZlNjMxNDEuLjZmMzFiNWY0YzE3YyAxMDA2NDQNCi0tLSBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kNCisrKyBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kNCkBAIC00MzIsNiArNDMyLDE5IEBADQogCQkJ
I2Nsb2NrLWNlbGxzID0gPDE+Ow0KIAkJfTsNCiANCisJCWZkOmZkQDE1MDJiMDAwIHsNCisJCQlj
b21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4My1mZCI7DQorCQkJbWVkaWF0ZWssc2NwID0gPCZz
Y3A+Ow0KKwkJCWlvbW11cyA9IDwmaW9tbXUgTTRVX1BPUlRfQ0FNX0ZEVlRfUlA+LA0KKwkJCQkg
PCZpb21tdSBNNFVfUE9SVF9DQU1fRkRWVF9XUj4sDQorCQkJCSA8JmlvbW11IE00VV9QT1JUX0NB
TV9GRFZUX1JCPjsNCisJCQlyZWcgPSA8MCAweDE1MDJiMDAwIDAgMHgxMDAwPjsNCisJCQlpbnRl
cnJ1cHRzID0gPEdJQ19TUEkgMjY5IElSUV9UWVBFX0xFVkVMX0xPVz47DQorCQkJY2xvY2tzID0g
PCZpbWdzeXMgQ0xLX0lNR19GRFZUPjsNCisJCQljbG9jay1uYW1lcyA9ICJmZCI7DQorCQkJcG93
ZXItZG9tYWlucyA9IDwmc2Nwc3lzIE1UODE4M19QT1dFUl9ET01BSU5fSVNQPjsNCisJCX07DQor
DQogCQl2ZGVjc3lzOiBzeXNjb25AMTYwMDAwMDAgew0KIAkJCWNvbXBhdGlibGUgPSAibWVkaWF0
ZWssbXQ4MTgzLXZkZWNzeXMiLCAic3lzY29uIjsNCiAJCQlyZWcgPSA8MCAweDE2MDAwMDAwIDAg
MHgxMDAwPjsNCi0tIA0KMi4xOC4wDQo=

