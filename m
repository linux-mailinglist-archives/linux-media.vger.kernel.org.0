Return-Path: <linux-media+bounces-45784-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BA5C13FE0
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 11:05:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F2FA3354ACB
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 10:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2508E3043A2;
	Tue, 28 Oct 2025 10:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uO0Rl0da"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8F2202F70;
	Tue, 28 Oct 2025 10:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761645925; cv=none; b=gyl/q92KuZHF0JnSQkAuu5hIqBnJWh3qQixWKgWrHsqHrTzSBaWfQ5jt7WBEvwlp0tbahQD+yGT+7LGwPACTeZYS5P9YhhaFNIoUw6cWnINDjfUho9wbsrUCAHd77f+MANMmNeAXG8YQu7lWPHVWp1aomc+bYZfGtby1ga8+YdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761645925; c=relaxed/simple;
	bh=8jWerZzCn0ClHy8BlojGWt6khL1ZwPkVWdms5ih6Wgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kXvKrddVChhJ688gXVwOWsMc7UhaTu6xlw4loBDK3Ecp3xImGq5HBONUyD6uwp1pGnG2rQwCvK03hK9fTo17auEATJlVkkTZ2IpW4CxyIJG4gQUvY7NOXIMerSdw23Dh+O5Eea5X59Xj1gVQtXOd4euTL5uKwXPVBx5RnvDgzhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uO0Rl0da; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E404C4CEF7;
	Tue, 28 Oct 2025 10:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761645925;
	bh=8jWerZzCn0ClHy8BlojGWt6khL1ZwPkVWdms5ih6Wgg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uO0Rl0daCyw4JUN3Uu7Hb3+RKfT39ccMG7CqjcbtlyDo0OiSLaoAaZdzzUcwRyioM
	 Dkfyp+/c/iu9hsvv8ZhnoVxi/dFfDBV5eQlrYHJWSvi7xS75rUaSWXdVNsOMJ+D0Ic
	 w1+h2zHYOMnaaFxOYXaXQ5qFXUZzNRChTziMf9k087uPgcCWxEQxiulngBQsdnt/Gc
	 xEUQ8JytC8F/+5T/I1zS32GVrhyLjhXMqgdL5rhqES3NIyTo87bHqhlE8j/sMKUKda
	 xuu3VWy62s2pEmFLhxKvKTA43zFT2a1QJyyw0ohDZ45lxPUpL4uM7k7gb9OKROG6s9
	 Ij1eKcEXdtqQg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vDga0-0000000014k-48F8;
	Tue, 28 Oct 2025 11:05:29 +0100
From: Johan Hovold <johan@kernel.org>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 2/2] media: mediatek: amend vpu_get_plat_device() documentation
Date: Tue, 28 Oct 2025 11:04:54 +0100
Message-ID: <20251028100454.4086-3-johan@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028100454.4086-1-johan@kernel.org>
References: <20251028100454.4086-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a comment to the vpu_get_plat_device() documentation to make it
clear that the VPU platform device is returned with an incremented
reference count (which needs to be dropped after use).

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/media/platform/mediatek/vpu/mtk_vpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.h b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
index da05f3e74081..5808311d2b15 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.h
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
@@ -120,7 +120,7 @@ int vpu_ipi_send(struct platform_device *pdev,
  *		device for using VPU API.
  *
  * Return: Return NULL if it is failed.
- * otherwise it is VPU's platform device
+ * otherwise it is VPU's platform device with incremented reference count
  **/
 struct platform_device *vpu_get_plat_device(struct platform_device *pdev);
 
-- 
2.51.0


