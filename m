Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AD376BDF54
	for <lists+linux-media@lfdr.de>; Fri, 17 Mar 2023 04:11:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbjCQDLJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Mar 2023 23:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbjCQDKf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Mar 2023 23:10:35 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81356B1ED1;
        Thu, 16 Mar 2023 20:08:43 -0700 (PDT)
X-UUID: 02b8d6b2c47111edbd2e61cc88cc8f98-20230317
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=R5Xe9zYM3rwVYaJvJAQuuKTtJxWoPUf9jJ9amzAM90A=;
        b=gpy6nhzsVeEgW/iFMqYMFWy+BJu4D1p7aHv6PbG0TgO2i/kYT4YeYouNv4ofQXpqHhIswY32PLpvyO9JtoYBiscz5nn9eARDbLqXBrRWd10+AOvgNNNFGXwM4qqg7bV0an30fzrl4fAogXAOBEeQ4GPPGW/lXUQPc4Ui17NUaao=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.21,REQID:d678e151-af5d-4759-a1cc-a3db4bf2be4f,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
        release,TS:0
X-CID-META: VersionHash:83295aa,CLOUDID:757d83b3-beed-4dfc-bd9c-e1b22fa6ccc4,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 02b8d6b2c47111edbd2e61cc88cc8f98-20230317
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 6471511; Fri, 17 Mar 2023 11:08:37 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 17 Mar 2023 11:08:36 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 17 Mar 2023 11:08:35 +0800
From:   Yunfei Dong <yunfei.dong@mediatek.com>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Chen-Yu Tsai <wenst@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= 
        <nfraprado@collabora.com>
CC:     Matthias Brugger <matthias.bgg@gmail.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Steve Cho <stevecho@chromium.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4,2/2] media: mediatek: vcodec: Using MM21 as the default capture format
Date:   Fri, 17 Mar 2023 11:08:33 +0800
Message-ID: <20230317030833.16836-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230317030833.16836-1-yunfei.dong@mediatek.com>
References: <20230317030833.16836-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK:  N
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For the capture queue only support MM21 format with LibYuv, need to set MM21 as the
default format.

Fixes: 7501edef6b1f ("media: mediatek: vcodec: Different codec using different capture format")
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
index 04beb3f08eea..3000db975e5f 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
@@ -392,14 +392,14 @@ static void mtk_vcodec_get_supported_formats(struct mtk_vcodec_ctx *ctx)
 	if (num_formats)
 		return;
 
-	if (ctx->dev->dec_capability & MTK_VDEC_FORMAT_MM21) {
-		mtk_vcodec_add_formats(V4L2_PIX_FMT_MM21, ctx);
-		cap_format_count++;
-	}
 	if (ctx->dev->dec_capability & MTK_VDEC_FORMAT_MT21C) {
 		mtk_vcodec_add_formats(V4L2_PIX_FMT_MT21C, ctx);
 		cap_format_count++;
 	}
+	if (ctx->dev->dec_capability & MTK_VDEC_FORMAT_MM21) {
+		mtk_vcodec_add_formats(V4L2_PIX_FMT_MM21, ctx);
+		cap_format_count++;
+	}
 	if (ctx->dev->dec_capability & MTK_VDEC_FORMAT_H264_SLICE) {
 		mtk_vcodec_add_formats(V4L2_PIX_FMT_H264_SLICE, ctx);
 		out_format_count++;
-- 
2.25.1

