Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 853DE496C49
	for <lists+linux-media@lfdr.de>; Sat, 22 Jan 2022 13:13:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234493AbiAVMNw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Jan 2022 07:13:52 -0500
Received: from mailgw01.mediatek.com ([60.244.123.138]:39360 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S234460AbiAVMNw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Jan 2022 07:13:52 -0500
X-UUID: 9868838fdc69480f9c2e1a5f135f34ee-20220122
X-UUID: 9868838fdc69480f9c2e1a5f135f34ee-20220122
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 434374060; Sat, 22 Jan 2022 20:13:47 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 22 Jan 2022 20:13:46 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 22 Jan 2022 20:13:45 +0800
From:   Irui Wang <irui.wang@mediatek.com>
To:     <linux-firmware@kernel.org>
CC:     <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, <tiffany.lin@mediatek.com>,
        <Maoguang.Meng@mediatek.com>, <Longfei.Wang@mediatek.com>,
        <Yunfei.Dong@mediatek.com>, <Andrew-CT.Chen@mediatek.com>,
        <erin.lo@mediatek.com>, <PoChun.Lin@mediatek.com>,
        <irui.wang@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: pull request: linux-firmware: mediatek: Update MT8173 VPU firmware to v1.17 
Date:   Sat, 22 Jan 2022 20:13:06 +0800
Message-ID: <20220122121307.20770-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi linux-firmware maintainers,

The following changes since commit 0c6a7b3bf728b95c8b7b95328f94335e2bb2c967:

  linux-firmware: Update firmware file for Intel Bluetooth 9260 (2022-01-19 11:16:28 -0500)

are available in the Git repository at:

  https://github.com/irui-wang/linux_fw_vpu_v1.1.7.git v1.1.7

for you to fetch changes up to 80d16ecb66f28c82987bab2a361df4dfe2c8b25f:

  linux-firmware: mediatek: Update MT8173 VPU firmware to v1.17 (2022-01-22 19:48:53 +0800)

----------------------------------------------------------------
Irui Wang (1):
      linux-firmware: mediatek: Update MT8173 VPU firmware to v1.17

 mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
 mediatek/mt8173/vpu_p.bin | Bin 131180 -> 131180 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)



