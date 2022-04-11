Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE73C4FBBB2
	for <lists+linux-media@lfdr.de>; Mon, 11 Apr 2022 14:06:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240717AbiDKMIR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Apr 2022 08:08:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345970AbiDKMIQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Apr 2022 08:08:16 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE99C3B291
        for <linux-media@vger.kernel.org>; Mon, 11 Apr 2022 05:05:53 -0700 (PDT)
X-UUID: 55c9f4dc5cd144ea82112c418746b7c6-20220411
X-UUID: 55c9f4dc5cd144ea82112c418746b7c6-20220411
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1136917470; Mon, 11 Apr 2022 20:05:47 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Mon, 11 Apr 2022 20:05:46 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Apr 2022 20:05:45 +0800
From:   Yunfei Dong <yunfei.dong@mediatek.com>
To:     <linux-firmware@kernel.org>
CC:     <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, <tinghan.shen@mediatek.com>,
        <Yunfei.Dong@mediatek.com>, <irui.wang@mediatek.com>,
        <srv_heupstream@mediatek.com>
Subject: pull request: linux-firmware: Create Mediatek MT8192 SCP firmware 
Date:   Mon, 11 Apr 2022 20:05:44 +0800
Message-ID: <20220411120545.20066-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 681281e49fb6778831370e5d94e6e1d97f0752d6:

  amdgpu: update PSP 13.0.8 firmware (2022-03-18 07:35:54 -0400)

are available in the Git repository at:

  https://github.com/yunfeidongmediatek/linux_fw_scp_8192 v1

for you to fetch changes up to ae8dfb4a5d4c6028ee1fca04b374b0e03ec35360:

  mediatek: Add mt8192 SCP firmware (2022-04-11 20:00:24 +0800)

----------------------------------------------------------------
Yunfei Dong (1):
      mediatek: Add mt8192 SCP firmware

 WHENCE                  |   3 +++
 mediatek/mt8192/scp.img | Bin 0 -> 309436 bytes
 2 files changed, 3 insertions(+)
 create mode 100644 mediatek/mt8192/scp.img


