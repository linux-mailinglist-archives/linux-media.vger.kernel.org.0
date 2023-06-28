Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25B5C740A2B
	for <lists+linux-media@lfdr.de>; Wed, 28 Jun 2023 09:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230473AbjF1H7G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jun 2023 03:59:06 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:45800 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231899AbjF1H4t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jun 2023 03:56:49 -0400
X-UUID: 6ba3b39e157611ee9cb5633481061a41-20230628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=zfjx6R+EMpgD1vYrYarvFtRq2IEGDT6k/qkqHHuoJnM=;
        b=dVo9yTNCHeooYKtBZ8b6WYGtHecw4qUKNBg3pMT0i4vdkG8+DH4e7UAobMgI1Apa3NsJqXew+m4lFbEhezRfNH4FMPit6pHcRO7rexFH4y/KdzqXSUE9RFwJs4Lusmf4xaLuU2wzHOunarHQhc/whMMBi2uqzy6ue9Mhk6f8O+M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:81396fbb-e3f9-4e48-83b4-2eb5c11a3597,IP:0,U
        RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACT
        ION:release,TS:75
X-CID-INFO: VERSION:1.1.27,REQID:81396fbb-e3f9-4e48-83b4-2eb5c11a3597,IP:0,URL
        :0,TC:0,Content:-25,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACT
        ION:quarantine,TS:75
X-CID-META: VersionHash:01c9525,CLOUDID:8c4b4d0d-26a8-467f-b838-f99719a9c083,B
        ulkID:230628134126CNQCJ4IB,BulkQuantity:0,Recheck:0,SF:28|17|19|48|38|29,T
        C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
        L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,
        TF_CID_SPAM_FSD,TF_CID_SPAM_ULN
X-UUID: 6ba3b39e157611ee9cb5633481061a41-20230628
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <xiaoyong.lu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1460076881; Wed, 28 Jun 2023 13:41:25 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 28 Jun 2023 13:41:23 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 28 Jun 2023 13:41:22 +0800
From:   Xiaoyong Lu <xiaoyong.lu@mediatek.com>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>
CC:     George Sun <george.sun@mediatek.com>,
        Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        Steve Cho <stevecho@chromium.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: media: mediatek: vcodec: fix AV1 decode fail for 36bit iova
Date:   Wed, 28 Jun 2023 13:41:11 +0800
Message-ID: <20230628054111.8967-1-xiaoyong.lu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Decoder hardware will access incorrect iova address when tile buffer is
36bit, leading to iommu fault when hardware access dram data.

Fixes: 2f5d0aef37c6 ("media: mediatek: vcodec: support stateless AV1 decoder")
Signed-off-by: Xiaoyong Lu<xiaoyong.lu@mediatek.com>
---
- Test ok: mt8195 32bit and mt8188 36bit iova.
---
 .../platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c    | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
index 404a1a23fd40..420222c8a56d 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
@@ -1658,9 +1658,9 @@ static void vdec_av1_slice_setup_tile_buffer(struct vdec_av1_slice_instance *ins
 	u32 allow_update_cdf = 0;
 	u32 sb_boundary_x_m1 = 0, sb_boundary_y_m1 = 0;
 	int tile_info_base;
-	u32 tile_buf_pa;
+	u64 tile_buf_pa;
 	u32 *tile_info_buf = instance->tile.va;
-	u32 pa = (u32)bs->dma_addr;
+	u64 pa = (u64)bs->dma_addr;
 
 	if (uh->disable_cdf_update == 0)
 		allow_update_cdf = 1;
@@ -1673,7 +1673,8 @@ static void vdec_av1_slice_setup_tile_buffer(struct vdec_av1_slice_instance *ins
 		tile_info_buf[tile_info_base + 0] = (tile_group->tile_size[tile_num] << 3);
 		tile_buf_pa = pa + tile_group->tile_start_offset[tile_num];
 
-		tile_info_buf[tile_info_base + 1] = (tile_buf_pa >> 4) << 4;
+		tile_info_buf[tile_info_base + 1] = (unsigned int)(tile_buf_pa >> 4) << 4 +
+			((unsigned int)(tile_buf_pa >> 32) & 0xf);
 		tile_info_buf[tile_info_base + 2] = (tile_buf_pa % 16) << 3;
 
 		sb_boundary_x_m1 =
-- 
2.25.1

