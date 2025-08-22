Return-Path: <linux-media+bounces-40697-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 576F1B30A57
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 02:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16B473B5658
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 00:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2836718DB1C;
	Fri, 22 Aug 2025 00:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LgoOF8xm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211CE1096F;
	Fri, 22 Aug 2025 00:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755822492; cv=none; b=WUnZpmso0IOGL9oXKeYk0ThRG1NkWq10oYcngOKKxwr4hStnkjsfTMBOkzBo5jIi2NxYonqj8iueUSy4B8oRW0hd5QESJ+54SEZbN4f90t0GEVgFfbBqzTkzyxXJStgE5NbFO3h8HsSmzplbUkK0ZKqMMBtJPnrCWsLCdrAgAok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755822492; c=relaxed/simple;
	bh=+2uWvTejnO4/xaa6TvzNFbU4t/8EQu/bspQi8hgNTO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dMmfbmQE84EkBCXusfyrVwWvEJ+QLNbKID6Ao2d3ymWWM5xSfbarrP25sDcKJMExTN7RxkIDo1RxZtdJI7P+AVzpiL+/PJpro9tO0N0KyVDazwwr8G5KswoFFSseyRYBOUyE9VBCDphv6jRWNuOxDzjZuZo8Z1Lpl/iSND/b6C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LgoOF8xm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 91405E45;
	Fri, 22 Aug 2025 02:27:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755822429;
	bh=+2uWvTejnO4/xaa6TvzNFbU4t/8EQu/bspQi8hgNTO8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LgoOF8xmTKrMDrwAjbKOYsxnvJwczW2j/2HxaE2Al3p1/Kto52r86mry7cEJeTzjl
	 Ga3ej6rzjn05u/PDMss/iKmuESWjYADz43NRM/XFTtTp0XYrYRrrR23X0lWV7+guj3
	 xuW54gMrSCjJ7hKhY/aYgxyvN7Pdw/FPjuzBUY44=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Purism Kernel Team <kernel@puri.sm>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 07/13] media: imx-mipi-csis: Fix field alignment in register dump
Date: Fri, 22 Aug 2025 03:27:27 +0300
Message-ID: <20250822002734.23516-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
References: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 95a1379004cb ("media: staging: media: imx: imx7-mipi-csis: Dump
MIPI_CSIS_FRAME_COUNTER_CH0 register") forgot to increase the maximum
register name length, resulting in misalignment of names printed in the
kernel log. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 50f6f4468f7b..346599b7a517 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -892,7 +892,7 @@ static int mipi_csis_dump_regs(struct mipi_csis_device *csis)
 
 	for (i = 0; i < ARRAY_SIZE(registers); i++) {
 		cfg = mipi_csis_read(csis, registers[i].offset);
-		dev_info(csis->dev, "%14s: 0x%08x\n", registers[i].name, cfg);
+		dev_info(csis->dev, "%17s: 0x%08x\n", registers[i].name, cfg);
 	}
 
 	pm_runtime_put(csis->dev);
-- 
Regards,

Laurent Pinchart


