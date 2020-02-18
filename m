Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5009162429
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2020 11:04:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgBRKEg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Feb 2020 05:04:36 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:14384 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726293AbgBRKEg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Feb 2020 05:04:36 -0500
X-UUID: 4613f0bc78d645359a74d63740bdfa03-20200218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=dehudLvz3II1sCqB8R/3Ho6QWR8DegTmoPcH9t7ygyw=;
        b=Ckxo9I9AQCc3Xt+CF1yxVsj/43z4ZjbCgDxovy5XdVFZsxcGqVrbXhK0uK+4KOjFIntQbR4JLM/dyjYwUYWA+B1e/+Fv3W3Hmgyrgyuf2LOcOGab8cVK8YWI7mmt92GMRGgmUHH+UewIFocWAxKqq6gLdOkl/xyuosZLYIibxns=;
X-UUID: 4613f0bc78d645359a74d63740bdfa03-20200218
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <gtk_ruiwang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1196039402; Tue, 18 Feb 2020 18:04:23 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 18 Feb 2020 18:03:36 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 18 Feb 2020 18:04:03 +0800
From:   <gtk_ruiwang@mediatek.com>
To:     <linux-firmware@kernel.org>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        <PoChun.Lin@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        <gtk_ruiwang@mediatek.com>
Subject: pull request: linux-firmware: Update Mediatek MT8173 VPU firmware
Date:   Tue, 18 Feb 2020 18:03:57 +0800
Message-ID: <20200218100358.2015-1-gtk_ruiwang@mediatek.com>
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
aW5jZSBjb21taXQgNmY4OTczNTgwMGZlM2FmNzYxMTA0ZGVmZGI4MWI1MGI2ZDY0MDJmMDoNCg0K
ICBydGxfbmljOiB1cGRhdGUgZmlybXdhcmUgZm9yIFJUTDgxNTNBICgyMDIwLTAyLTA3IDA4OjMw
OjM3IC0wNTAwKQ0KDQphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoNCg0K
ICBodHRwczovL2dpdGh1Yi5jb20vcnVpd2FuZy1tdGsvbGludXhfZndfdnB1X3YxLjEuNC5naXQN
Cg0KZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDBiZDk2NWQ1ZTRiMGQyNGUyZmMwNTRh
OTMzZmVhM2E4YzIyYWY5MmI6DQoNCiAgbWVkaWF0ZWs6IHVwZGF0ZSBNVDgxNzMgVlBVIGZpcm13
YXJlIHRvIHYxLjEuNCAoMjAyMC0wMi0xOCAxNzoyNzozMCArMDgwMCkNCg0KLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KZ3Rr
X3J1aXdhbmcgKDEpOg0KICAgICAgbWVkaWF0ZWs6IHVwZGF0ZSBNVDgxNzMgVlBVIGZpcm13YXJl
IHRvIHYxLjEuNA0KDQogdnB1X2QuYmluIHwgQmluIDI5NzcxMzYgLT4gMjk3NzE4NCBieXRlcw0K
IHZwdV9wLmJpbiB8IEJpbiAxMzExODAgLT4gMTMxMTgwIGJ5dGVzDQogMiBmaWxlcyBjaGFuZ2Vk
LCAwIGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pDQoNCg==

