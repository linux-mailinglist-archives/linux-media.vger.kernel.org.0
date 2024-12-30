Return-Path: <linux-media+bounces-24171-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1125F9FE6B0
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 14:53:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 012571882526
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 13:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352841A9B24;
	Mon, 30 Dec 2024 13:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNd++Nvc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1C11A2544;
	Mon, 30 Dec 2024 13:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735566802; cv=none; b=RuMuZIEPwjhMWWM4pebY8Yk0M878l4MhDFvASyWmp/sGTdF1/3a83U/kKQ3/86BWJ14s0N0IUzxZkPbNR8/+luDzVxRcoxYnjGpJs9n5Zg7yiE+rrxgXKJoOM9ZwHafu2HGOu+YLXqWoJQyrMUaQw/00Ki7+NP2TvFbbzGHJs1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735566802; c=relaxed/simple;
	bh=4KJMfkJbjuD1+I7HsDy0xyDU+DlgBavMOG3qlPzrG4c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s3HL5uZbl5CUb1RtMX79MxLBgKSnrfNUl9IHxg6Z/RdNgU4R/ZzER41z30kxTeORHA6v47ClIZchJMbImLchtki2QjblTUkytpUu3wr9kjtEeg0uVWTAst53bRBPdT/54zHiXQ22kCIE/K0Zf1QhhelqANrXX8HDnQYBkJzyD+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNd++Nvc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41710C4CED0;
	Mon, 30 Dec 2024 13:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735566802;
	bh=4KJMfkJbjuD1+I7HsDy0xyDU+DlgBavMOG3qlPzrG4c=;
	h=From:To:Cc:Subject:Date:From;
	b=CNd++Nvc/S3vwoaVFLgo5xuyrmVTyTcgkAnRPtoJioBsxm36SCmt+rlQ1uLjnACbc
	 lSvcpFqHA0n6ypRSo3957U9NSnQU6QrZJhPt9CDnquNA8rJWQZi7qnvMcN+x13jZgo
	 xMerSxY2TK3GQrP/Hu+tFp1EyqkYVaLjmcB4bMiu6EngbCEYGoY0gR4BSzhfvmlxBE
	 +cDuQxc01HokM6IPL74hGk5+U3l8yTYT6XuMUm9zMSDCM9D9zI3mjh1EO0JfoD6nUN
	 H6/vUMUW0gK4C4//iWZ7BcjeUxW9wXTkSZMfhoG51g6ABgWoZT0F1A3toIiWL/iavd
	 PXON4Ifq41tMw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/mediatek: Remove unneeded semicolon
Date: Mon, 30 Dec 2024 13:53:14 +0000
Message-Id: <20241230135314.5419-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c:1092:2-3: Unneeded semicolon

Fixes: 4c932840db1d ("drm/mediatek: Implement OF graphs support for display paths")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412022048.kY2ZhxZ4-lkp@intel.com/
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 9a8ef8558da9..9d8286424e98 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -1089,7 +1089,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		/* No devicetree graphs support: go with hardcoded paths if present */
 		dev_dbg(dev, "Using hardcoded paths for MMSYS %u\n", mtk_drm_data->mmsys_id);
 		private->data = mtk_drm_data;
-	};
+	}
 
 	private->all_drm_private = devm_kmalloc_array(dev, private->data->mmsys_dev_num,
 						      sizeof(*private->all_drm_private),
-- 
2.34.1


