Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C50B6197BF5
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2020 14:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730189AbgC3Mgf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Mar 2020 08:36:35 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:31702 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730113AbgC3Mgf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Mar 2020 08:36:35 -0400
X-UUID: 83a5ff9aa7904a9e8519baaf0ebf3ca2-20200330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=5fynngkcfVP3y4nuFrJ+FfItuj0F2ovwQT443e47vAM=;
        b=S36tuLp5A9vckFlGPARidf9un053JVOXrFCQQFK2npj2KBo+afhhf8Kb3ajMyXf2MvThc9uV9YX6o38N77ucL7YKEAI7zzgr9DxdlUYHMmjhA3P+TBSgvdnRIyuhBFwnYOOFnOb9hGY3MeVgACzohMhcnSuCM89vOzo77uW7TkI=;
X-UUID: 83a5ff9aa7904a9e8519baaf0ebf3ca2-20200330
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1354835767; Mon, 30 Mar 2020 20:36:31 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Mar 2020 20:36:27 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 30 Mar 2020 20:36:26 +0800
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
Subject: [V4, 0/2] media: i2c: add support for DW9768 VCM driver
Date:   Mon, 30 Mar 2020 20:36:32 +0800
Message-ID: <20200330123634.363-1-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGVsbG8sDQoNCkhlcmUgaXMgdGhlIHVwZGF0ZWQgdmVyc2lvbiBvZiB0aGUgY2hhbmdlcyB0byBh
ZGQgRFQgYmluZGluZ3MgaW4gWUFNTA0KYW5kIFY0TDIgZHJpdmVyIGZvciB0aGUgRFc5NzY4IGxl
bnMgdm9pY2VlIGNvaWwgbW90b3IuDQpUaGlzIGlzIGEgMTAtYml0IERBQyB3aXRoIDEwMG1BIG91
dHB1dCBjdXJyZW50IHNpbmsgY2FwYWJpbGl0eSBmcm9tIERvbmd3b29uLA0KZGVzaWduZWQgZm9y
IGxpbmVhciBjb250cm9sIG9mIHZvaWNlIGNvaWwgbW90b3IsIGFuZCBjb250cm9sbGVkIHZpYQ0K
STJDIHNlcmlhbCBpbnRlcmZhY2UgdG8gc2V0IHRoZSBkZXNpcmVkIGZvY3VzLg0KDQpUaGUgRFc5
NzY4IGNvbnRyb2xzIHRoZSBwb3NpdGlvbiB3aXRoIDEwLWJpdCBEQUMgZGF0YSBEWzk6MF0gYW5k
IHNlcGVyYXRlcw0KdHdvIDgtYml0IHJlZ2lzdGVycyB0byBjb250cm9sIHRoZSBWQ00gcG9zaXRp
b24gYXMgYmVsb3dzLg0KREFDX01TQjogRFs5OjhdKEFERFI6IDB4MDMpOg0KICAgICArLS0tKy0t
LSstLS0rLS0tKy0tLSstLS0rLS0tKy0tLSsNCiAgICAgfC0tLXwtLS18LS0tfC0tLXwtLS18LS0t
fEQwOXxEMDh8DQogICAgICstLS0rLS0tKy0tLSstLS0rLS0tKy0tLSstLS0rLS0tKw0KREFDX0xT
QjogRFs3OjBdKEFERFI6IDB4MDQpOg0KICAgICArLS0tKy0tLSstLS0rLS0tKy0tLSstLS0rLS0t
Ky0tLSsNCiAgICAgfEQwN3xEMDZ8RDA1fEQwNHxEMDN8RDAyfEQwMXxEMDB8DQogICAgICstLS0r
LS0tKy0tLSstLS0rLS0tKy0tLSstLS0rLS0tKw0KDQpUaGlzIGRyaXZlciBzdXBwb3J0czoNCiAt
IHNldCBEVzk3NjggdG8gc3RhbmRieSBtb2RlIG9uY2Ugc3VzcGVuZCBhbmQgdHVybiBpdCBiYWNr
IHRvIGFjdGl2ZSBpZiByZXN1bWUNCiAtIHNldCB0aGUgZGVzaXJlZCBmb2N1cyB2aWEgVjRMMl9D
SURfRk9DVVNfQUJTT0xVVEUgY3RybA0KDQpQcmV2aW91cyB2ZXJzaW9ucyBvZiB0aGlzIHBhdGNo
LXNldCBjYW4gYmUgZm91bmQgaGVyZToNCnYzOiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3Jn
L2NvdmVyLzExNDEyNzE5Lw0KdjI6IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvY292ZXIv
MTExMzIyOTkvDQp2MTogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9jb3Zlci8xMTAzNDc5
Ny8NCg0KTWFpbmx5IGNoYW5nZXMgb2YgdjQgYXJlIGFkZHJlc3NpbmcgY29tbWVudHMgZnJvbSBS
b2IsIEFuZHksIFNha2FyaSwgVG9tYXN6Lg0KQ29tcGFyZWQgdG8gdjM6DQogLSBGaXggRFQgYmlu
ZGluZ3MgYW5kIE1BSU5UQUlORVJTIGNoZWNraW5nIGVycm9ycw0KIC0gVXNlIGkyY19zbWJ1c193
cml0ZV93b3JkX3N3YXBwZWQoKSB0byByZXBsYWNlIG9mIGkyY19zbWJ1c193cml0ZV93b3JkX2Rh
dGEoKQ0KIC0gUmVmaW5lIGRyaXZlciBtb3JlIHNpbXBseSBhbmQgY2xlYXINCiAtIEFkZCBhIGRl
cGVuZGVuY3kgdG8gQ09ORklHX1BNDQoNClBsZWFzZSByZXZpZXcuDQpUaGFua3MuDQoNCkRvbmdj
aHVuIFpodSAoMik6DQogIG1lZGlhOiBpMmM6IGR3OTc2ODogQWRkIERUIHN1cHBvcnQgYW5kIE1B
SU5UQUlORVJTIGVudHJ5DQogIG1lZGlhOiBpMmM6IEFkZCBEVzk3NjggVkNNIGRyaXZlcg0KDQog
Li4uL2JpbmRpbmdzL21lZGlhL2kyYy9kb25nd29vbixkdzk3NjgueWFtbCAgICAgICAgfCAgNjIg
KysrDQogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgIDggKw0KIGRyaXZlcnMvbWVkaWEvaTJjL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDExICsNCiBkcml2ZXJzL21lZGlhL2kyYy9NYWtlZmlsZSAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgMSArDQogZHJpdmVycy9tZWRpYS9pMmMvZHc5NzY4LmMgICAgICAgICAgICAg
ICAgICAgICAgICAgfCA0MzIgKysrKysrKysrKysrKysrKysrKysrDQogNSBmaWxlcyBjaGFuZ2Vk
LCA1MTQgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaTJjL2Rvbmd3b29uLGR3OTc2OC55YW1sDQogY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvaTJjL2R3OTc2OC5jDQoNCi0tIA0KMi45LjINCg==

