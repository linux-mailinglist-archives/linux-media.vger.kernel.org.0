Return-Path: <linux-media+bounces-22784-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 073F19E68D6
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 09:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47581188151B
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 08:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF0F1FC116;
	Fri,  6 Dec 2024 08:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZCWg2UOP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC21A1DFE16;
	Fri,  6 Dec 2024 08:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733473653; cv=none; b=p4ZPZDzC6ILkUTM9PXd2i77Ypzhd8xMFbxnGNoEFglcfI68kmSPwr3G2zfdqJ8+SFyv05YGtoI2XcjCO0P3g8ZD2PV3Y8GFMvjh9EJIhOr3Oj/pOg/fggM2KCrpmo7H4dYSxCVmWcvD6gkf4lOcHsm8MbR+687QPFPPy8ADYoIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733473653; c=relaxed/simple;
	bh=dnmf6wU/4o7xocF7aclEiM/jdJ6eD4w3CXKP8olVIbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j1ClqQMhSC7V0Bt+1enXwmDkGPcn20ysR3p+dRg7PWpEJT78g366j1prkmj7OegUypgL/XRaM1dPI2movl3uRfmiRYPBkky11MnLGoHUMpnTz63vIF8Vu0yZTcBRM3BGu833ofyyvJW1BGM2RufN0OsUAacFp6wfug/8/G8+uZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZCWg2UOP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 876E474C;
	Fri,  6 Dec 2024 09:26:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733473610;
	bh=dnmf6wU/4o7xocF7aclEiM/jdJ6eD4w3CXKP8olVIbo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZCWg2UOPXRkMDMRAlGPiQ949o76D5IvStpMuSUaTTRa9cFLIjcf9wBek1jyh5Yvbm
	 OOrV0ECNiV17LhDGIeN6yv8+mwYyElT4kl1qOHZ0Vzy8T5jRST5xb2I4/kt098aefB
	 7tVL/I8zTREODsq61m6/QHndvdRgO+iwVuxwDxMU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 06 Dec 2024 10:26:46 +0200
Subject: [PATCH v4 10/15] media: i2c: ds90ub960: Drop unused indirect block
 define
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-ub9xx-fixes-v4-10-466786eec7cc@ideasonboard.com>
References: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
In-Reply-To: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=910;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=dnmf6wU/4o7xocF7aclEiM/jdJ6eD4w3CXKP8olVIbo=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUrVfL5aDwPygpfLgxwozIjPTq8f0b/NWPXmGw
 CwuYYgl6dqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1K1XwAKCRD6PaqMvJYe
 9YgbD/91dM1qNGxjpNp1+G6KQij6AChsVVa/9mk19P5K/jewOqg1NJNiFNSAXiwCl1L1Df8m2br
 Ma/AfNSWhBWQBwmxAhU6UX/qeXHOf98d5s8ymK9Hdz6YlpUQPiTohnZKpIutT4d2i/5gP3Wll2H
 bVXFKNs0f+rxesB1iuw+2zPOQVBeS+oTLNH2OYAscGfBy1xqwsFRUFImxt3wY0AlE7+nC9wLEmE
 Bzl4lAerZRnIT/hiWj535zwZ7sYr0CZZLdsLJkQXI1iaImw9FvK/Q8FSDFSxxxCjmuNXTKriDar
 Ke9JQtKQ8hB/wgKNE16APfbLfcyWozM3VCVv+C0Ck6gmJVgo71NDqTvxhLU0yw45dnZBErli96P
 eGAp/kaaKYyDn4Y1CK2co7uwu7d0hoFGfgcDMqvpwsNDhbElbMDu98g+Y/yHYvdRZjEccbCgDM9
 cbTQE3WPHXMWl8I7gC3w9zT9fbwfQRE2KbmrWgDPhYINfPtpmqzuau4DrzZA/CGwHS+tFSIiAHQ
 BtFO72TE77SXmYyECX+4dvyDaYx8KJog72JwxOUHb92kLFEwQ2UATuvkSURif9Oxcv6erkrd6bD
 swQ/r3LFDmwaqI+sbOcCS406umGHI7h1catCsA5pWQjztgXXtEuqbH1l2gxFGkgu6dOZnTxUvvw
 R3YEaM8K+qTRcYA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Drop the unused UB960_IND_TARGET_CSI_CSIPLL_REG_1 define. It does not
even match to any block in the more recent documents, so it's possible
it is not only unused but also wrong.

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 721898e5c913..51b4aead6ac6 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -367,7 +367,6 @@
 /* Indirect register blocks */
 #define UB960_IND_TARGET_PAT_GEN		0x00
 #define UB960_IND_TARGET_RX_ANA(n)		(0x01 + (n))
-#define UB960_IND_TARGET_CSI_CSIPLL_REG_1	0x92	/* UB9702 */
 #define UB960_IND_TARGET_CSI_ANA		0x07
 
 /* UB960_IR_PGEN_*: Indirect Registers for Test Pattern Generator */

-- 
2.43.0


