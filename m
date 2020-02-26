Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDE9616F626
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 04:37:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726136AbgBZDho (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Feb 2020 22:37:44 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:44139 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725837AbgBZDho (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Feb 2020 22:37:44 -0500
X-UUID: cb4adbf983034f14ae17f8766bfb5544-20200226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=cgYMAr+8MfT+9oQtPueYQelaIVbakgIZFZ6xAha24GI=;
        b=EE2qQ4ih+yyplh5KiGUAW7VQMMHwO8xidoEakSebAS8yyyQ7AxAOjOSCjAKWbqbXlESd8L8lY9rR+A7A74jFGSLdZ55LyPhCuEhErXeM5t50x9rThcBcDGWKRXf8gvbfJ2M8vpPm0AvAtTzh8JhNKoj2Wa57+etjo4XLZk0sfIo=;
X-UUID: cb4adbf983034f14ae17f8766bfb5544-20200226
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <gtk_ruiwang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 2038693804; Wed, 26 Feb 2020 11:37:33 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 26 Feb 2020 11:36:43 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 26 Feb 2020 11:35:09 +0800
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
Date:   Wed, 26 Feb 2020 11:36:45 +0800
Message-ID: <20200226033646.20949-1-gtk_ruiwang@mediatek.com>
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
L2xpbnV4X2Z3X3ZwdS5naXQNCg0KZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGU1Y2Fm
N2IwZjU2MzUwNzA0ODM2ZWM2Mzg0NWQzOThhOWZhY2E1MDY6DQoNCiAgbWVkaWF0ZWs6IG1vdmUg
TVQ4MTczIFZQVSBGVyB0byBzdWJmb2xkZXIgKDIwMjAtMDItMjYgMTE6MDI6MDAgKzA4MDApDQoN
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0NCmd0a19ydWl3YW5nICgxKToNCiAgICAgIG1lZGlhdGVrOiBtb3ZlIE1UODE3MyBW
UFUgRlcgdG8gc3ViZm9sZGVyDQoNCiB2cHVfZC5iaW4gPT4gbWVkaWF0ZWsvbXQ4MTczL3ZwdV9k
LmJpbiB8IEJpbg0KIHZwdV9wLmJpbiA9PiBtZWRpYXRlay9tdDgxNzMvdnB1X3AuYmluIHwgQmlu
DQogMiBmaWxlcyBjaGFuZ2VkLCAwIGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pDQogcmVu
YW1lIHZwdV9kLmJpbiA9PiBtZWRpYXRlay9tdDgxNzMvdnB1X2QuYmluICgxMDAlKQ0KIHJlbmFt
ZSB2cHVfcC5iaW4gPT4gbWVkaWF0ZWsvbXQ4MTczL3ZwdV9wLmJpbiAoMTAwJSkNCg0K

