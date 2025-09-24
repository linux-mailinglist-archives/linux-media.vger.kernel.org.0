Return-Path: <linux-media+bounces-43068-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 949D6B9A0E5
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 15:36:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 416434C5FE5
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 13:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1E93054D8;
	Wed, 24 Sep 2025 13:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A7dkHYzo"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F892DAFBA;
	Wed, 24 Sep 2025 13:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758720987; cv=none; b=FtJh4gCosxmzv9PQ0WELNMmKM/njafXHbqHtKJF82cLdD/re5hDBQWhSuCmEWBq7IDXHT/jraHXdQWo7Q05Tq6CIEFePbBJISDFO3a4SdkuzKN78giwFwu91JxtF8V963vSoxWutmDyASybK3osCRksqIxK/zrCgCzBlXim9ZxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758720987; c=relaxed/simple;
	bh=PP4GlelkN7bqBaOJj/FDhufoJKYKO3ceHzlIc1IQG+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZwhHmVZpS5QASQQ8PMqOgMNJnB6JqgvYX+ZN8pmNAom4zSeL6l1jqv957ir/bRZgP1f3UruGIgUcsZlgCgCYFoBdRztr4SC0G/NhPtobNbaYPIaJHerO2I4wg3bDXf+SAjlA6BptYt+YcW64mU7FP/FAxU9193UCmLCBhbu+B00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A7dkHYzo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E10C4CEE7;
	Wed, 24 Sep 2025 13:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758720987;
	bh=PP4GlelkN7bqBaOJj/FDhufoJKYKO3ceHzlIc1IQG+0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A7dkHYzoc6XWoJzulEj9Zqm2lIm/xcCXfkksBISOkIqPH62biFJApKmw+oxiq+wcs
	 kK7GpQHOeyRZAcAn2Ld7fJf54/FZrxxXGfXEJ+8+1PnxbH4MLsvT7/HPEPDLOg3cbW
	 n5ow+8L6xU8bQN7p3iVzYmYJAm+Nq8ixT+Z0lQc4L51uvwM+N6D8yb35xNhQGzfTCF
	 1jTUdfogbKV7HwYz8J3/o7RWIm0GYo8DJpEVPmcPdW0RFt6lb92moSyH9KeUZpp5GP
	 YJGfLSqKwwFJf5Wsoe02SrZoSLrl2FuC2n8/sp4bABc0wrp4Blhj3WJIcWEdfMqx4v
	 Gd0ZBrHYT8vxg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v1PfR-000000007Vm-1LPm;
	Wed, 24 Sep 2025 15:36:21 +0200
From: Johan Hovold <johan@kernel.org>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/3] media: mediatek: vcodec: fix device leak on codec init
Date: Wed, 24 Sep 2025 15:35:50 +0200
Message-ID: <20250924133552.28841-2-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250924133552.28841-1-johan@kernel.org>
References: <20250924133552.28841-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure to drop the reference taken when looking up the VPU firmware
device during codec init on probe failure (e.g. probe deferral) and on
driver unbind.

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
Fixes: 4e855a6efa54 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Encoder Driver")
Cc: stable@vger.kernel.org	# 4.8
Cc: Tiffany Lin <tiffany.lin@mediatek.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 .../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c      | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
index d7027d600208..9237738d7632 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
@@ -83,12 +83,20 @@ static const struct mtk_vcodec_fw_ops mtk_vcodec_vpu_msg = {
 	.release = mtk_vcodec_vpu_release,
 };
 
+static void mtk_vcodec_vpu_put_device(void *_dev)
+{
+	struct device *dev = _dev;
+
+	put_device(dev);
+}
+
 struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(void *priv, enum mtk_vcodec_fw_use fw_use)
 {
 	struct platform_device *fw_pdev;
 	struct platform_device *plat_dev;
 	struct mtk_vcodec_fw *fw;
 	enum rst_id rst_id;
+	int ret;
 
 	if (fw_use == ENCODER) {
 		struct mtk_vcodec_enc_dev *enc_dev = priv;
@@ -111,6 +119,11 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(void *priv, enum mtk_vcodec_fw_use
 		return ERR_PTR(-EINVAL);
 	}
 
+	ret = devm_add_action_or_reset(&plat_dev->dev, mtk_vcodec_vpu_put_device,
+				       &fw_pdev->dev);
+	if (ret)
+		return ERR_PTR(ret);
+
 	if (fw_use == DECODER)
 		vpu_wdt_reg_handler(fw_pdev, mtk_vcodec_vpu_reset_dec_handler, priv, rst_id);
 	else
-- 
2.49.1


