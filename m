Return-Path: <linux-media+bounces-1948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D4C80A47C
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 14:34:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D31ED1F21191
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 13:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DB441CFB3;
	Fri,  8 Dec 2023 13:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eeJ6QMNx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0824410E6
	for <linux-media@vger.kernel.org>; Fri,  8 Dec 2023 05:34:18 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB089552
	for <linux-media@vger.kernel.org>; Fri,  8 Dec 2023 14:33:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702042415;
	bh=fW9t8fS4I4GNFIBnWwmReJJS2KID8+3UXk0ygt6nL9Q=;
	h=Date:From:To:Subject:From;
	b=eeJ6QMNxqx12tOceaLL9/YiDEhSkvaFkoRdvPnHKA5YOBz4kBGewyybxNBQa5FRti
	 F2/pKMN6EDEYGdL88i97nBlMoMxtlGSf4h6sOVKL4njVfq/xiDOZ+XEMrdKKPKhYUN
	 ZgtXZFnts5cO8dU+KiLzGm1a3bPZYZsCE/zB95UY=
Date: Fri, 8 Dec 2023 15:34:23 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.8] IMX media drivers fixes and enhancements
Message-ID: <20231208133423.GB12450@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello,

The following changes since commit e55a9482888da73eeadde5f13ef8bafce68a38ed:

  media: ov9640: Don't set format in sub-device state (2023-12-08 10:04:12 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-imx-next-20231208

for you to fetch changes up to 37b891807782548a1da987508e1bfa08a9149a36:

  media: nxp: imx8-isi-debug: Add missing 36-Bit DMA registers to debugfs output (2023-12-08 15:27:50 +0200)

----------------------------------------------------------------
Miscallenous fixes and enhancements for IMX media drivers

----------------------------------------------------------------
Alexander Stein (1):
      media: nxp: imx8-isi-debug: Add missing 36-Bit DMA registers to debugfs output

Laurent Pinchart (1):
      media: imx: imx7-media-csi: Include headers explicitly

Tomi Valkeinen (2):
      media: imx-mipi-csis: Fix clock handling in remove()
      media: imx-mipi-csis: Drop extra clock enable at probe()

 drivers/media/platform/nxp/imx-mipi-csis.c         | 17 ++++----------
 drivers/media/platform/nxp/imx7-media-csi.c        | 27 +++++++++++++++++-----
 .../media/platform/nxp/imx8-isi/imx8-isi-debug.c   | 27 +++++++++++++++++++---
 3 files changed, 50 insertions(+), 21 deletions(-)

-- 
Regards,

Laurent Pinchart

