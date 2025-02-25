Return-Path: <linux-media+bounces-26885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFF5A43254
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 02:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5A3B172FEB
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 01:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837F4BE4A;
	Tue, 25 Feb 2025 01:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="bmP9gxre"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D730D3B784;
	Tue, 25 Feb 2025 01:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740446154; cv=none; b=Tg8SJ41cIrLsHs8MG6CYdYryx2JKky61uXLyTqiHJw1TR9RYDKJBWkQ33xD6WvTKdanxHOoOYqMutwfEKCMQjbaf/LRPs4b9w3kQ7uXxNFkX+brvWdqcsIsV1TzvRiHmNwXNCQWuOFcNTSgSRmHMkaIVm/QAYt+AZsv7vT0pn2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740446154; c=relaxed/simple;
	bh=MLUP5QnfwhL66AGTxMiJuNoHhQAhowFVljK/zCFRaf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r0LW+s3X/uWVPM+/4w4N6jjSghbf6bHpwy2dkHwnuTOZL+c9QXk3UKFEDL/iUeM7Dz/+EazwQGuLXyiFruIVnAyI8oJ5+n4SUc8wFIZUJGAtIrpHqqeVTBUK+CLuTfnVzq/eE+1T4O4Ebx2erJaRViw3h78fP3TL4MWNuOjrnzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=bmP9gxre; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=i9jjhpnAnfgtITEEW23ofcSSqaOu8vyXG7tfz1anqHc=; b=bmP9gxreW+vyWEpf
	dlFvIhy7l9EXUM3V0Uctj2i9fH/o0jAJQrhFn4rNvbufLlrmPH07SEbT5Ks7FgeEo+GvnMBLj9CK1
	uc2KhJHhzk4RV0dheiGDD6TAeigNGQqMwSR8fk8yN5fjGlL/G5SySXPSlOj+bijEkPFiM4n72bJ3t
	mmtLrxxvtk4AAO8r4x4bP4oh8HuN28KTl/h/XXNcXss7Qgx/5qPpTLQBoizh/6rDLkOMFwnsC6ONg
	acONsojYz0YrQPNi4Ee2qk5B5LRz4GDLCO/OAH0CUZl0096nDOSoPUwrOG2Xw4E+B0DqWM9+xHKuQ
	vE8lxnerFZpTGsdMdA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tmjY0-000Yja-1P;
	Tue, 25 Feb 2025 01:15:44 +0000
From: linux@treblig.org
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] media: platform: ti: Remove unused omap3isp_print_status
Date: Tue, 25 Feb 2025 01:15:43 +0000
Message-ID: <20250225011543.94370-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

omap3isp_print_status() was added in 2011 by
commit 448de7e7850b ("[media] omap3isp: OMAP3 ISP core")
but has remained unused.

Remove it (and it's associated #defines).

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/media/platform/ti/omap3isp/isp.c | 37 ------------------------
 drivers/media/platform/ti/omap3isp/isp.h |  2 --
 2 files changed, 39 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
index 405ca215179d..6ffbf587f3f7 100644
--- a/drivers/media/platform/ti/omap3isp/isp.c
+++ b/drivers/media/platform/ti/omap3isp/isp.c
@@ -1475,43 +1475,6 @@ void omap3isp_put(struct isp_device *isp)
  * Platform device driver
  */
 
-/*
- * omap3isp_print_status - Prints the values of the ISP Control Module registers
- * @isp: OMAP3 ISP device
- */
-#define ISP_PRINT_REGISTER(isp, name)\
-	dev_dbg(isp->dev, "###ISP " #name "=0x%08x\n", \
-		isp_reg_readl(isp, OMAP3_ISP_IOMEM_MAIN, ISP_##name))
-#define SBL_PRINT_REGISTER(isp, name)\
-	dev_dbg(isp->dev, "###SBL " #name "=0x%08x\n", \
-		isp_reg_readl(isp, OMAP3_ISP_IOMEM_SBL, ISPSBL_##name))
-
-void omap3isp_print_status(struct isp_device *isp)
-{
-	dev_dbg(isp->dev, "-------------ISP Register dump--------------\n");
-
-	ISP_PRINT_REGISTER(isp, SYSCONFIG);
-	ISP_PRINT_REGISTER(isp, SYSSTATUS);
-	ISP_PRINT_REGISTER(isp, IRQ0ENABLE);
-	ISP_PRINT_REGISTER(isp, IRQ0STATUS);
-	ISP_PRINT_REGISTER(isp, TCTRL_GRESET_LENGTH);
-	ISP_PRINT_REGISTER(isp, TCTRL_PSTRB_REPLAY);
-	ISP_PRINT_REGISTER(isp, CTRL);
-	ISP_PRINT_REGISTER(isp, TCTRL_CTRL);
-	ISP_PRINT_REGISTER(isp, TCTRL_FRAME);
-	ISP_PRINT_REGISTER(isp, TCTRL_PSTRB_DELAY);
-	ISP_PRINT_REGISTER(isp, TCTRL_STRB_DELAY);
-	ISP_PRINT_REGISTER(isp, TCTRL_SHUT_DELAY);
-	ISP_PRINT_REGISTER(isp, TCTRL_PSTRB_LENGTH);
-	ISP_PRINT_REGISTER(isp, TCTRL_STRB_LENGTH);
-	ISP_PRINT_REGISTER(isp, TCTRL_SHUT_LENGTH);
-
-	SBL_PRINT_REGISTER(isp, PCR);
-	SBL_PRINT_REGISTER(isp, SDR_REQ_EXP);
-
-	dev_dbg(isp->dev, "--------------------------------------------\n");
-}
-
 #ifdef CONFIG_PM
 
 /*
diff --git a/drivers/media/platform/ti/omap3isp/isp.h b/drivers/media/platform/ti/omap3isp/isp.h
index b4793631ad97..60acf3401ac9 100644
--- a/drivers/media/platform/ti/omap3isp/isp.h
+++ b/drivers/media/platform/ti/omap3isp/isp.h
@@ -260,8 +260,6 @@ void omap3isp_configure_bridge(struct isp_device *isp,
 struct isp_device *omap3isp_get(struct isp_device *isp);
 void omap3isp_put(struct isp_device *isp);
 
-void omap3isp_print_status(struct isp_device *isp);
-
 void omap3isp_sbl_enable(struct isp_device *isp, enum isp_sbl_resource res);
 void omap3isp_sbl_disable(struct isp_device *isp, enum isp_sbl_resource res);
 
-- 
2.48.1


