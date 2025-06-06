Return-Path: <linux-media+bounces-34264-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60652AD062A
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 17:52:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 234D7188E0D5
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 15:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B94289824;
	Fri,  6 Jun 2025 15:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L/tWR5mM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C786289E2E;
	Fri,  6 Jun 2025 15:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749224686; cv=none; b=FTX3EU7TLjeNAVAdZGiHAcIGdpRLyuqr8XQsktCvstNBlL6aNSEC8uL2WOYPWf11sV4lWcsIfPDya0lKFf8mdGCVVDPgDEs+TswuHfTQqQvLwLQqCG9EeIJpoipTDh9ZLNpBDQbJzeZHLvRHXIAU/jOQ/Mp464/AAkDNP1paBbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749224686; c=relaxed/simple;
	bh=7SbusbtCH84+e5OYmyU2EqnTJRP7YU9cbC518hgfyjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iH4CgfY0h3DiLcN35SC6yadJspAgr4DmihkOilCjttK9qJUKo7sTOhjlkcInnHDwdsn41DFwIbf2h59mUU9jlru8I+4ps/Xb1eEEN+ScRKz9ZfAyL+A3fxQ6D83WVMTLa+SlvZWhJYZOyBiE82qwQAAfBpQm44Cv+yFtpGDWnA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L/tWR5mM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.localdomain (cpc90716-aztw32-2-0-cust408.18-1.cable.virginm.net [86.26.101.153])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA457446;
	Fri,  6 Jun 2025 17:44:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749224677;
	bh=7SbusbtCH84+e5OYmyU2EqnTJRP7YU9cbC518hgfyjQ=;
	h=From:To:Cc:Subject:Date:From;
	b=L/tWR5mM89JaJkR3vHQ19HSAPwApL8uCIo6+RyKggBWbLW2BChyqxx8XMyLX9uT7H
	 cYhPxuPaGERpzS/h9tMjr1OSduyHh/Y10gq0FirKNveRogp5PL6VnSYVKC7CUm2u2O
	 rSfiQ2gQHWiXYEftUuM7SQxw7JrBzfa1ebQoODAU=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: kieran.bingham@ideasonboard.com,
	rmfrfs@gmail.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v2 0/2] media: Add line end IRQ to imx-mipi-csis driver 
Date: Fri,  6 Jun 2025 16:44:12 +0100
Message-ID: <20250606154414.540290-1-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Many boards, such as the NXP i.MX 8M Plus, feature multiple interrupt
registers. This series refactors interrupt status register debug handling to make
it more intuitive to add other registers such as LINE_END, which has an
entire register containing only one interrupt. Previously, the
mipi_csi_events[] list contained a debug enable field, and this replaces
that with a status_index, which indicates which status register contains
the mask for the interrupt.

The second patch adds the user line interrupt, which is useful for
debugging, as it allows a user to trigger an interrupt after the MIPI
CSI receiver has counted a configurable number of lines. This can make
it possible to discern the true resolution of the image stream reaching
the CSI receiver. It adds an entry to debugfs which lets users choose
how many lines are needed to trigger the interrupt, and can be disabled
both within and outside streaming by setting the value to 0.

---

Changes since v1:
- Moved from magic number to enum in status_index
- Clear INT_MSK_1 in enable_interrupts() when on == false
- use local variable in set_params() as in the interrupt handler
- move interrupt handling code outside of spinlock

Isaac Scott (2):
  media: platform: Refactor interrupt status registers
  media: platform: Add user line interrupt to imx-mipi-csis driver

 drivers/media/platform/nxp/imx-mipi-csis.c | 107 ++++++++++++++-------
 1 file changed, 74 insertions(+), 33 deletions(-)

-- 
2.43.0


