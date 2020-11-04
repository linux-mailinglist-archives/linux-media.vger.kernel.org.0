Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DCE02A6480
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 13:38:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729947AbgKDMi2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 07:38:28 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:7049 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729826AbgKDMi1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 07:38:27 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CR5m14wjJzhgks;
        Wed,  4 Nov 2020 20:38:09 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Wed, 4 Nov 2020
 20:38:01 +0800
From:   Yu Kuai <yukuai3@huawei.com>
To:     <rick.chang@mediatek.com>, <bin.liu@mediatek.com>,
        <mchehab@kernel.org>, <matthias.bgg@gmail.com>,
        <tiffany.lin@mediatek.com>, <andrew-ct.chen@mediatek.com>,
        <xia.jiang@mediatek.com>, <hverkuil-cisco@xs4all.nl>,
        <tfiga@chromium.org>, <minghsiu.tsai@mediatek.com>,
        <jcliang@chromium.org>
CC:     <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <yukuai3@huawei.com>,
        <yi.zhang@huawei.com>
Subject: [patch V3 0/6] patches to add missing put_device() call
Date:   Wed, 4 Nov 2020 20:41:34 +0800
Message-ID: <20201104124140.3443309-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

chagnes in V3:
 - merge patch 2 and patch 3 into one patch, add a help
 mtk_jpeg_clk_release().

changes in V2:
 - add several patches suggested by Hans

Yu Kuai (6):
  media: platform: add missing put_device() call in mtk_jpeg_clk_init()
  media: platform: add missing put_device() call in mtk_jpeg_probe() and
    mtk_jpeg_remove()
  media: mtk-vcodec: add missing put_device() call in
    mtk_vcodec_init_dec_pm()
  media: mtk-vcodec: add missing put_device() call in
    mtk_vcodec_release_dec_pm()
  media: mtk-vcodec: add missing put_device() call in
    mtk_vcodec_init_enc_pm()
  media: mtk-vcodec: add missing put_device() call in
    mtk_vcodec_release_enc_pm()

 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   |  9 ++++++
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 19 +++++++++----
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 28 ++++++++++++++-----
 3 files changed, 43 insertions(+), 13 deletions(-)

-- 
2.25.4

