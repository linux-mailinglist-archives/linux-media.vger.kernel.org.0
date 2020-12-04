Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F28F82CE989
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 09:27:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729022AbgLDI04 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 03:26:56 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:9012 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727479AbgLDI0z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Dec 2020 03:26:55 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CnQkt1NtszhmMK;
        Fri,  4 Dec 2020 16:25:42 +0800 (CST)
Received: from compute.localdomain (10.175.112.70) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Fri, 4 Dec 2020 16:25:59 +0800
From:   Zhang Changzhong <zhangchangzhong@huawei.com>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rui Wang <gtk_ruiwang@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC:     Zhang Changzhong <zhangchangzhong@huawei.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: mtk-vcodec: fix error return code in vdec_vp9_decode()
Date:   Fri, 4 Dec 2020 16:29:34 +0800
Message-ID: <1607070575-32609-1-git-send-email-zhangchangzhong@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.70]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix to return a negative error code from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: dea42fb79f4f ("media: mtk-vcodec: reset segment data then trig decoder")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhang Changzhong <zhangchangzhong@huawei.com>
---
 drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
index 5ea153a..d988021 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
@@ -890,7 +890,8 @@ static int vdec_vp9_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 			memset(inst->seg_id_buf.va, 0, inst->seg_id_buf.size);
 
 			if (vsi->show_frame & BIT(2)) {
-				if (vpu_dec_start(&inst->vpu, NULL, 0)) {
+				ret = vpu_dec_start(&inst->vpu, NULL, 0);
+				if (ret) {
 					mtk_vcodec_err(inst, "vpu trig decoder failed");
 					goto DECODE_ERROR;
 				}
-- 
2.9.5

