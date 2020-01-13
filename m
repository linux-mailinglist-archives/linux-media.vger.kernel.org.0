Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4D1D1389F2
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 04:52:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387460AbgAMDw3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Jan 2020 22:52:29 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:23713 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387415AbgAMDw2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Jan 2020 22:52:28 -0500
X-UUID: 755dcea4cc3b43c48f8b3cab63487c60-20200113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=GEn5TTMvrgKaWqCbybjZ0pxAsz0JFNP9RC57YNtlclc=;
        b=errFA5cA0MqrasLeU2c7EgGO/8aV41Ke1aMqrEVxSbItW5deywTZf6OhH7Aj6Vpbf4oyN0XR1MwIXCiq4eCtIrzRWcMAWL/5QChr8p24FK2uV+ENWfkVi8pPoEMTf2+Zfw5rrq5ughg55vaIJ5TzKdmP2teiU2RokAsHpboH7Yk=;
X-UUID: 755dcea4cc3b43c48f8b3cab63487c60-20200113
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <maoguang.meng@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1495602143; Mon, 13 Jan 2020 11:52:21 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 13 Jan 2020 11:51:06 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 13 Jan 2020 11:52:35 +0800
From:   <maoguang.meng@mediatek.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>
CC:     Yong Wu <yong.wu@mediatek.com>, Xia Jiang <xia.jiang@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>
Subject: [PATCH 1/1] media: platform: VIDEO_MEDIATEK_JPEG can also depend on MTK_IOMMU
Date:   Mon, 13 Jan 2020 11:52:02 +0800
Message-ID: <20200113035202.7797-1-maoguang.meng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 6669261D4D362FA0B90A9D2C43FB1733D5513E1AEFCDD470B21449EB489B41AA2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RnJvbTogTWFvZ3VhbmcgTWVuZyA8bWFvZ3VhbmcubWVuZ0BtZWRpYXRlay5jb20+DQoNCm1lZGlh
dGVrIGpwZWcgY29kZWMgZHJpdmVyIGNhbiBkZXBlbmQgb24gTVRLX0lPTU1VIG9yIE1US19JT01N
VV9WMQ0KDQpDaGFuZ2UtSWQ6IEk3ODk3OWFmOTI0ZDRmZDUyYTM2NDFlZmYxNDYzYTEwZDZlMWQ0
NjVmDQpTaWduZWQtb2ZmLWJ5OiBNYW9ndWFuZyBNZW5nIDxtYW9ndWFuZy5tZW5nQG1lZGlhdGVr
LmNvbT4NCi0tLQ0KIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vS2NvbmZpZyB8IDIgKy0NCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vS2NvbmZpZyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
S2NvbmZpZw0KaW5kZXggZTg0ZjM1ZDNhNjhlLi44NTM3N2M4OGU5MWEgMTAwNjQ0DQotLS0gYS9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL0tjb25maWcNCisrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vS2NvbmZpZw0KQEAgLTIwMCw3ICsyMDAsNyBAQCBjb25maWcgVklERU9fSU1YX1BYUA0KIA0K
IGNvbmZpZyBWSURFT19NRURJQVRFS19KUEVHDQogCXRyaXN0YXRlICJNZWRpYXRlayBKUEVHIENv
ZGVjIGRyaXZlciINCi0JZGVwZW5kcyBvbiBNVEtfSU9NTVVfVjEgfHwgQ09NUElMRV9URVNUDQor
CWRlcGVuZHMgb24gTVRLX0lPTU1VX1YxIHx8IE1US19JT01NVSB8fCBDT01QSUxFX1RFU1QNCiAJ
ZGVwZW5kcyBvbiBWSURFT19ERVYgJiYgVklERU9fVjRMMg0KIAlkZXBlbmRzIG9uIEFSQ0hfTUVE
SUFURUsgfHwgQ09NUElMRV9URVNUDQogCXNlbGVjdCBWSURFT0JVRjJfRE1BX0NPTlRJRw0KLS0g
DQoyLjE4LjANCg==

