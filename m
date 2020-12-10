Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 968072D50AE
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 03:13:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728035AbgLJCNk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 21:13:40 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:40082 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728033AbgLJCNk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Dec 2020 21:13:40 -0500
X-UUID: 29059de2b0f24aab936add0264399d32-20201210
X-UUID: 29059de2b0f24aab936add0264399d32-20201210
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 499842233; Thu, 10 Dec 2020 10:07:44 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Dec 2020 10:07:42 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Dec 2020 10:07:42 +0800
From:   Irui Wang <irui.wang@mediatek.com>
To:     <linux-firmware@kernel.org>
CC:     <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, <tiffany.lin@mediatek.com>,
        <Maoguang.Meng@mediatek.com>, <Longfei.Wang@mediatek.com>,
        <Yunfei.Dong@mediatek.com>, <Andrew-CT.Chen@mediatek.com>,
        <erin.lo@mediatek.com>, <PoChun.Lin@mediatek.com>,
        <irui.wang@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: pull request: linux-firmware: Update Mediatek MT8173 VPU firmware
Date:   Thu, 10 Dec 2020 10:07:39 +0800
Message-ID: <20201210020740.21467-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi linux-firmware maintainers,

The following changes since commit 7455a36066741a6e52fba65e04f6451b4cdfd9c4:

  Merge branch 'guc_v49' of git://anongit.freedesktop.org/drm/drm-firmware into main (2020-11-30 09:26:11 -0500)

are available in the Git repository at:

  https://github.com/irui-wang/linux_fw_vpu_v1.1.6.git v1.1.6

for you to fetch changes up to 0fe0fe022b7f88f581254487b1d1768df1b218bb:

  mediatek: update MT8173 VPU firmware to v1.1.6 (2020-12-10 09:38:07 +0800)

----------------------------------------------------------------
Irui Wang (1):
      mediatek: update MT8173 VPU firmware to v1.1.6

 mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
 mediatek/mt8173/vpu_p.bin | Bin 131180 -> 131180 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)


