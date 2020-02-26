Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48A5A16F62C
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 04:38:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbgBZDiX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Feb 2020 22:38:23 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:35447 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725837AbgBZDiW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Feb 2020 22:38:22 -0500
X-UUID: 8aaae59155ea46189d8202b9f9185cf0-20200226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nh2s25XhkWJkMUS7wIRow/JMcFuv2C5dPCJ4XGFkezc=;
        b=V4Dr5Ta011CUDI31cGOwkUngGIe0OczP9v8i4vOyryim9LjFheAT8g0OAiOj9NYQxO8PwocW4gC54Q/N7w3Un9Aeg70FUiXj81XjNeu4YeCe4ITrtpxhGRpGh3U/dW+D+oa+ywgLVVyKZYtwjh7H/6L3SZYI3y3QldAbZYAqcQA=;
X-UUID: 8aaae59155ea46189d8202b9f9185cf0-20200226
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <gtk_ruiwang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 605971352; Wed, 26 Feb 2020 11:38:15 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 26 Feb 2020 11:37:24 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 26 Feb 2020 11:35:56 +0800
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
Subject: [PATCH] mediatek: move MT8173 VPU FW to subfolder
Date:   Wed, 26 Feb 2020 11:36:46 +0800
Message-ID: <20200226033646.20949-2-gtk_ruiwang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200226033646.20949-1-gtk_ruiwang@mediatek.com>
References: <20200226033646.20949-1-gtk_ruiwang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RnJvbTogZ3RrX3J1aXdhbmcgPGd0a19ydWl3YW5nQG1lZGlhdGVrLmNvbT4NCg0KQ3VycmVudGx5
IHZwdV9kLmJpbiBhbmQgdnB1X3AuYmluIGFyZSBhdCB0aGUgcm9vdCBvZg0KbGludXgtZmlybXdh
cmUgZ2l0IHRyZWUsIGl0J3Mgbm90IGFwcHJvcHJpYXRlIHNvIHdlIG1vdmUNCnRoZW0gdG8gc3Vi
Zm9sZGVyIG1lZGlhdGVrL210ODE3Mw0KDQpSZWxlYXNlIFZlcnNpb246IDEuMS40DQoNClNpZ25l
ZC1vZmYtYnk6IFJ1aSBXYW5nIDxndGtfcnVpd2FuZ0BtZWRpYXRlay5jb20+DQotLS0NCiB2cHVf
ZC5iaW4gPT4gbWVkaWF0ZWsvbXQ4MTczL3ZwdV9kLmJpbiB8IEJpbg0KIHZwdV9wLmJpbiA9PiBt
ZWRpYXRlay9tdDgxNzMvdnB1X3AuYmluIHwgQmluDQogMiBmaWxlcyBjaGFuZ2VkLCAwIGluc2Vy
dGlvbnMoKyksIDAgZGVsZXRpb25zKC0pDQogcmVuYW1lIHZwdV9kLmJpbiA9PiBtZWRpYXRlay9t
dDgxNzMvdnB1X2QuYmluICgxMDAlKQ0KIHJlbmFtZSB2cHVfcC5iaW4gPT4gbWVkaWF0ZWsvbXQ4
MTczL3ZwdV9wLmJpbiAoMTAwJSkNCg0KZGlmZiAtLWdpdCBhL3ZwdV9kLmJpbiBiL21lZGlhdGVr
L210ODE3My92cHVfZC5iaW4NCnNpbWlsYXJpdHkgaW5kZXggMTAwJQ0KcmVuYW1lIGZyb20gdnB1
X2QuYmluDQpyZW5hbWUgdG8gbWVkaWF0ZWsvbXQ4MTczL3ZwdV9kLmJpbg0KZGlmZiAtLWdpdCBh
L3ZwdV9wLmJpbiBiL21lZGlhdGVrL210ODE3My92cHVfcC5iaW4NCnNpbWlsYXJpdHkgaW5kZXgg
MTAwJQ0KcmVuYW1lIGZyb20gdnB1X3AuYmluDQpyZW5hbWUgdG8gbWVkaWF0ZWsvbXQ4MTczL3Zw
dV9wLmJpbg0KLS0gDQoyLjE4LjANCg==

