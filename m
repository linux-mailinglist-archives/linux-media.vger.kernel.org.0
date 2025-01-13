Return-Path: <linux-media+bounces-24687-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3ECA0B459
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 11:18:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7FBC161FCA
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 10:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E82621ADBE;
	Mon, 13 Jan 2025 10:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="Q9H2CGzi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E922235C14;
	Mon, 13 Jan 2025 10:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736763492; cv=none; b=k92RLBbDEPTxNypqfRnIj3pllDopzjjJE91A/eZlBWChsV4ZmDOEeffFw//lROwDUQB8bQelTsDySI1HwuUe0cYA1xjVitosYrwuSuWgmSDCkQNWqezU3rSGF/giB2OfJb0okvG6afaFk7kuJZLxrh6EE/KePbm5MREGY8oEm7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736763492; c=relaxed/simple;
	bh=iaFHLtgKkr5eLw+guyEk91BCvn615X23qDyv53l9Lj8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gac7RUWjOcbCTfQSqr9nTQpP1yYF9LWJMgPQIccS9lBVbfR9NcmyYd7DwLH2zEJa5Yj6t7IWcTcXwEH8YTcBEDgnsm4+ianezttFV09urjS2LPM5vn65WR4Wmot+NCteu8vQmRt7rM+J68Fk3X62Y08tyX2BaQ0aZD6NaYYE9y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=Q9H2CGzi; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Received: from ldvnode.intra.ispras.ru (unknown [10.10.2.153])
	by mail.ispras.ru (Postfix) with ESMTPSA id E8ED540769AC;
	Mon, 13 Jan 2025 10:17:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru E8ED540769AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1736763479;
	bh=U51A4gH9eY3j+Jj5Eqv3cP9otx60XstkbxWOCnsHWQ4=;
	h=From:To:Cc:Subject:Date:From;
	b=Q9H2CGziJz5TECuRr9bdRo6MY5vyXwHbTbspeGZ3z8S2iCSCvRj4uXxGKsvDG50vt
	 l2xclqR5i61eReXU24sHivwJrgGuOvaDfBqMAWYBZFNZQqYxnKF09l7rP8CLY2VGiv
	 qLzfLHq5okYp4nLCW3EYgURNXAOVntOwJE9TIeNo=
From: Vitalii Mordan <mordan@ispras.ru>
To: Maxime Ripard <mripard@kernel.org>
Cc: Vitalii Mordan <mordan@ispras.ru>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Benoit Parrot <bparrot@ti.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	Vadim Mutilin <mutilin@ispras.ru>,
	stable@vger.kernel.org
Subject: [PATCH] media: cdns-csi2rx: fix call balance for csi2rx->p_clk handling routines
Date: Mon, 13 Jan 2025 13:17:49 +0300
Message-Id: <20250113101749.2440878-1-mordan@ispras.ru>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the clock csi2rx->p_clk was not enabled in csi2rx_stop(), it should not
be disabled in any path.

Conversely, if it was enabled in csi2rx_stop(), it must be disabled in all
error paths to ensure proper cleanup.

Found by Linux Verification Center (linuxtesting.org) with Klever.

Fixes: 1fc3b37f34f6 ("media: v4l: cadence: Add Cadence MIPI-CSI2 RX driver")
Cc: stable@vger.kernel.org
Signed-off-by: Vitalii Mordan <mordan@ispras.ru>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 4d64df829e75..e7e8decf9a02 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -322,11 +322,14 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 
 static void csi2rx_stop(struct csi2rx_priv *csi2rx)
 {
+	int ret, ret_clk;
 	unsigned int i;
 	u32 val;
-	int ret;
 
-	clk_prepare_enable(csi2rx->p_clk);
+	ret_clk = clk_prepare_enable(csi2rx->p_clk);
+	if (ret_clk)
+		dev_warn(csi2rx->dev,
+			 "Couldn't prepare and enable P clock\n");
 	reset_control_assert(csi2rx->sys_rst);
 	clk_disable_unprepare(csi2rx->sys_clk);
 
@@ -348,7 +351,8 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
 	}
 
 	reset_control_assert(csi2rx->p_rst);
-	clk_disable_unprepare(csi2rx->p_clk);
+	if (!ret_clk)
+		clk_disable_unprepare(csi2rx->p_clk);
 
 	if (v4l2_subdev_call(csi2rx->source_subdev, video, s_stream, false))
 		dev_warn(csi2rx->dev, "Couldn't disable our subdev\n");
-- 
2.25.1


