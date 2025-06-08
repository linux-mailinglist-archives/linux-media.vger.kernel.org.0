Return-Path: <linux-media+bounces-34319-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EC1AD1621
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 01:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44E411693DF
	for <lists+linux-media@lfdr.de>; Sun,  8 Jun 2025 23:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51013267B6F;
	Sun,  8 Jun 2025 23:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jfLvWx1n"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4333F267B12;
	Sun,  8 Jun 2025 23:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749427146; cv=none; b=FdKG8aaEyoFMd9/TLBE62hDK9t3WwwEwAN/AxJvquSw7v7ziuC7x9p2xpaXmIIlJhDCPXhiV4g3rmpLzI2OdyOGQ/BfhUKw19f5kkcGObJtD3X67/tnHgQz6KcXn7pcovQqHcRNzXzKfi4vVznh8YTzZtXGveBmw1xugRJFF+YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749427146; c=relaxed/simple;
	bh=lGvUIS82JYxssO5IZ7LKynUT3kVxA3Vmqhyhr1r/lW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P5pwExxBkTkeihL/YqWDxIM/8Eap/pttOCzQgYp44JEugA8Cye8WAYHe3c6jAFd+mIznnyxmlX4yOW2El/pbBddadFG9U+VncLg54TGAnFh/Ff8/BTyVhoBZJf/Q8nRvKXFimFyq2EMJhUoGlkHo73C54Y6mSKM/btF/E1F9dDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jfLvWx1n; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8EDB7122A;
	Mon,  9 Jun 2025 01:58:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749427129;
	bh=lGvUIS82JYxssO5IZ7LKynUT3kVxA3Vmqhyhr1r/lW8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jfLvWx1nPCTHxijxgLANtloh4TXrvp+feTnhbCcIeBFMKgPTKdKgMlb9TwF3Gq6+H
	 GrSl1TxbxxZuDqyjOzQjLML+vhYyxJOeT9rvM2KqtYP+RLTTGkkkCq4dy+UNz+1XwQ
	 TPvMzBpgbcsAc4Uj1P/FF6uSs4dQpUdFYaiMmPvU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/8] media: imx-mipi-csis: Fix field alignment in register dump
Date: Mon,  9 Jun 2025 02:58:34 +0300
Message-ID: <20250608235840.23871-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
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
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index d59666ef7545..b652d59851c2 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -895,7 +895,7 @@ static int mipi_csis_dump_regs(struct mipi_csis_device *csis)
 
 	for (i = 0; i < ARRAY_SIZE(registers); i++) {
 		cfg = mipi_csis_read(csis, registers[i].offset);
-		dev_info(csis->dev, "%14s: 0x%08x\n", registers[i].name, cfg);
+		dev_info(csis->dev, "%17s: 0x%08x\n", registers[i].name, cfg);
 	}
 
 	pm_runtime_put(csis->dev);
-- 
Regards,

Laurent Pinchart


