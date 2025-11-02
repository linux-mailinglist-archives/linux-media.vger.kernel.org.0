Return-Path: <linux-media+bounces-46170-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA2AC29A78
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 00:46:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02BA03AE672
	for <lists+linux-media@lfdr.de>; Sun,  2 Nov 2025 23:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC98923814D;
	Sun,  2 Nov 2025 23:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Lo+ScY6i"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5A526E175
	for <linux-media@vger.kernel.org>; Sun,  2 Nov 2025 23:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762127096; cv=none; b=SeDxvQvFSWakTVkwcE1qMI0q6twKn9A6iW58PGs1L85dM9i4HqINIGjfu9/ftiGDPmd88B1K1RpCEsyXqIMqoDKvs6dz7ZPHjf1SAnPDpEIJZbbw/HATjYyPqjqNmS1u/UvI2d2GW3mT0T9lpNIcTbpq6hLlzBq0fvGWusK1yt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762127096; c=relaxed/simple;
	bh=seV/hcI/4KwdmMt7k2kHAL9HtTHualRjxHm3vdMmHys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lww7qARkoydqSyAWAjTFXsth4+Ze+j7v/y8ZAL6Nk2av+0S6Ai32Yaqv4T1BMRLQidhGKUlXljCdhy4GxWlFR12iUVW1EMCG6zJy88ELox3T/tNjCvvks+Er/lhklUBhJavW4vaS5dZlTvIcbediPKhfnLWb3ijaT+2kDvyws18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Lo+ScY6i; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-160-149.bb.dnainternet.fi [82.203.160.149])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id F3AAB7FA;
	Mon,  3 Nov 2025 00:42:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762126980;
	bh=seV/hcI/4KwdmMt7k2kHAL9HtTHualRjxHm3vdMmHys=;
	h=From:To:Cc:Subject:Date:From;
	b=Lo+ScY6iyNyKhkenMcooAlGlX1QF9tHaR/ZBA0OjWV493XSCZciWLPGQNa9ErfINM
	 aBiVpnDWrgkkgFhAsNBWN1n2BRfhYwAIcjP3Cyvj+BRbKf8KBL5qUScko595BRfYy2
	 Ab/YKkFbbF0Iz/9gv6dCbQDd+qvXtr32YP0W2Ceo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Johan Hovold <johan@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] media: imx8-isi: Drop unused module alias
Date: Mon,  3 Nov 2025 01:44:38 +0200
Message-ID: <20251102234438.8022-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver has never supported anything but OF probing so drop the
unused platform module alias.

Suggested-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Johan, I've got the idea from similar patches you submitted for other
NXP media drivers, hence the Suggested-by tag. Please let me know if I
can keep it.

 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index c3d411ddf492..0f000582a1de 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -575,7 +575,6 @@ static struct platform_driver mxc_isi_driver = {
 };
 module_platform_driver(mxc_isi_driver);
 
-MODULE_ALIAS("ISI");
 MODULE_AUTHOR("Freescale Semiconductor, Inc.");
 MODULE_DESCRIPTION("IMX8 Image Sensing Interface driver");
 MODULE_LICENSE("GPL");

base-commit: 163917839c0eea3bdfe3620f27f617a55fd76302
-- 
Regards,

Laurent Pinchart


