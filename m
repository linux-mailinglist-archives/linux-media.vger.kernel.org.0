Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9080C458C8C
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 11:44:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239072AbhKVKr3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 05:47:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238864AbhKVKr2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 05:47:28 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F27EAC061574;
        Mon, 22 Nov 2021 02:44:21 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 0363E1F4481E
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637577860; bh=F0sCdl4LDNPsiVCBcFYo9Yve0hPNTO3tV9OSCtyVJ0I=;
        h=From:To:Cc:Subject:Date:From;
        b=Zhi4XWr0K4DNHK96YKsypStuWryd8MzOuLDyqiTHpBOUNhQCdttlcrDn9Z6OouRi2
         z8roA8RsKtPHY5rX5Il0X+DFtSsqKMkKY79ObzmJRIrldMCtDz2dhrpsVa2OE+WNB+
         +fonn97A7iFt6bTUfZzXWpUiYuC25UgHqxlATT3KgoE9tw8ghza/FRUMOrW6ypRMyU
         tapUzyO7PBNLjHzPo7oXv24zVZzXdo2L5J/Zl2AlKDBsuWIE9k5oQQAnXRJQDX6AFH
         okCkKXu1oue8Nhlc0boh6vAu6t1qLGUqiKuGbslKk79gQcoBPMlpTAP2q4pnJu5JHF
         RlLd6ovtDB2LA==
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     iommu@lists.linux-foundation.org
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        kernel@collabora.com, Yong Wu <yong.wu@mediatek.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mediatek@lists.infradead.org (moderated list:MEDIATEK IOMMU
        DRIVER),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC
        support), linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org, sebastian.reichel@collabora.com
Subject: [PATCH 0/2] iommu/mediatek: fix tlb flush logic
Date:   Mon, 22 Nov 2021 12:43:58 +0200
Message-Id: <20211122104400.4160-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Often devices allocate dma buffers before they do
runtime pm resume. This is the case for example with v4l2
devices where buffers are allocated during 'VIDIOC_REQBUFS`
and runtime resume happens later usually during 'VIDIOC_STREAMON'.
In such cases the partial tlb flush when allocating will fail
since the the iommu is runtime suspended. This will print a warning
and try to do full flush. But there is actually no need to flush
the tlb before the consumer device is turned on.

Fix the warning by skipping parital flush when allocating and instead
do full flash in runtime resume

This patchset is a combination of a patch already sent in a different
patchset: [1] and a warning fix from Sebastian Reichel

[1] https://lore.kernel.org/linux-devicetree/20210923115840.17813-13-yong.wu@mediatek.com/

Sebastian Reichel (1):
  iommu/mediatek: always check runtime PM status in tlb flush range
    callback

Yong Wu (1):
  iommu/mediatek: Always tlb_flush_all when each PM resume

 drivers/iommu/mtk_iommu.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

-- 
2.17.1

