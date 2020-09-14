Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8F62688AE
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 11:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbgINJm1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 05:42:27 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:26329 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726355AbgINJmZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 05:42:25 -0400
X-UUID: d08c180bc3314fe2974c175af6ce0ff1-20200914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=bQUXUzbFriOSQ+r1Po0//r4PBP6F9rJZE9cWHJ8VvZM=;
        b=gJHGt4LaCju5NNB6YbRj+x8Zgc9Pl/jRH6LAfCy+XTy4H1UWTgRoQYyBvE4MdL6ud87oCtn1Bu1Pag8SipaL9yyJH6dbkUmpWO6Twy90DmNdljIy7U1Ia+LQzfsDuk0MG75fetNq+O/cULYehF+3xBbw5eHPUYGXilHxLF+4Awg=;
X-UUID: d08c180bc3314fe2974c175af6ce0ff1-20200914
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <maoguang.meng@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 855825856; Mon, 14 Sep 2020 17:42:19 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Sep 2020 17:42:16 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Sep 2020 17:42:16 +0800
From:   <maoguang.meng@mediatek.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <tfiga@chromium.org>,
        <yong.wu@mediatek.com>, <sj.huang@mediatek.com>
CC:     <linux-media@vger.kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
        <xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>
Subject: [PATCH] arm64: dts: add jpeg enc node for mt8183
Date:   Mon, 14 Sep 2020 17:40:12 +0800
Message-ID: <20200914094012.5817-1-maoguang.meng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RnJvbTogTWFvZ3VhbmcgTWVuZyA8bWFvZ3VhbmcubWVuZ0BtZWRpYXRlay5jb20+DQoNCmFkZCBq
cGVnIGVuYyBkZXZpY2UgdHJlZSBub2RlDQoNClNpZ25lZC1vZmYtYnk6IE1hb2d1YW5nIE1lbmcg
PG1hb2d1YW5nLm1lbmdAbWVkaWF0ZWsuY29tPg0KLS0tDQpSZWJhc2Ugb24gdjUuOS1yYzEuDQog
ICBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3BhdGNoLzExNjQ3NDYvDQog
ICBbMl0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTcwMzI5OS8NCiAgIFsz
XSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMjgzNzczLw0KLS0tDQoNCiBh
cmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My5kdHNpIHwgMTEgKysrKysrKysrKysN
CiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvYXJjaC9h
cm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
bWVkaWF0ZWsvbXQ4MTgzLmR0c2kNCmluZGV4IDhkOGY0MjdkYjAzMC4uMWU3MjYyNWYxNjE1IDEw
MDY0NA0KLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaQ0KKysr
IGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaQ0KQEAgLTk2MSw2ICs5
NjEsMTcgQEANCiAJCQlwb3dlci1kb21haW5zID0gPCZzY3BzeXMgTVQ4MTgzX1BPV0VSX0RPTUFJ
Tl9WRU5DPjsNCiAJCX07DQogDQorCQl2ZW5jX2pwZ0AxNzAzMDAwMCB7DQorCQkJY29tcGF0aWJs
ZSA9ICJtZWRpYXRlayxtdDgxODMtanBnZW5jIiwgIm1lZGlhdGVrLG10ay1qcGdlbmMiOw0KKwkJ
CXJlZyA9IDwwIDB4MTcwMzAwMDAgMCAweDEwMDA+Ow0KKwkJCWludGVycnVwdHMgPSA8R0lDX1NQ
SSAyNDkgSVJRX1RZUEVfTEVWRUxfTE9XPjsNCisJCQlpb21tdXMgPSA8JmlvbW11IE00VV9QT1JU
X0pQR0VOQ19SRE1BPiwNCisJCQkJIDwmaW9tbXUgTTRVX1BPUlRfSlBHRU5DX0JTRE1BPjsNCisJ
CQlwb3dlci1kb21haW5zID0gPCZzY3BzeXMgTVQ4MTgzX1BPV0VSX0RPTUFJTl9WRU5DPjsNCisJ
CQljbG9ja3MgPSA8JnZlbmNzeXMgQ0xLX1ZFTkNfSlBHRU5DPjsNCisJCQljbG9jay1uYW1lcyA9
ICJqcGdlbmMiOw0KKwkJfTsNCisNCiAJCWlwdV9jb25uOiBzeXNjb25AMTkwMDAwMDAgew0KIAkJ
CWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTgzLWlwdV9jb25uIiwgInN5c2NvbiI7DQogCQkJ
cmVnID0gPDAgMHgxOTAwMDAwMCAwIDB4MTAwMD47DQotLSANCjIuMTguMA0K

