Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3950F4F8F1D
	for <lists+linux-media@lfdr.de>; Fri,  8 Apr 2022 09:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233446AbiDHG3k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Apr 2022 02:29:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235215AbiDHG3d (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Apr 2022 02:29:33 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D4A11E3E03
        for <linux-media@vger.kernel.org>; Thu,  7 Apr 2022 23:27:31 -0700 (PDT)
X-UUID: d2cced9f8df04f638de51d4ea0b336aa-20220408
X-UUID: d2cced9f8df04f638de51d4ea0b336aa-20220408
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1408716280; Fri, 08 Apr 2022 14:27:25 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 8 Apr 2022 14:27:24 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Apr 2022 14:27:23 +0800
From:   Yunfei Dong <yunfei.dong@mediatek.com>
To:     <linux-firmware@kernel.org>
CC:     <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, <tinghan.shen@mediatek.com>,
        <Yunfei.Dong@mediatek.com>, <irui.wang@mediatek.com>,
        <srv_heupstream@mediatek.com>
Subject: pull request: linux-firmware: Create Mediatek MT8192 SCP firmware
Date:   Fri, 8 Apr 2022 14:27:21 +0800
Message-ID: <20220408062722.26813-1-yunfei.dong@mediatek.com>
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

for you to fetch changes up to 3ac2fc85bc7dfcebdb92b5b5808b0268cdfb772d:

  mediatek: Add mt8192 SCP firmware (2022-04-08 10:59:44 +0800)

----------------------------------------------------------------
Yunfei Dong (1):
      mediatek: Add mt8192 SCP firmware

 mediatek/mt8192/scp.img | Bin 0 -> 309436 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 mediatek/mt8192/scp.img


