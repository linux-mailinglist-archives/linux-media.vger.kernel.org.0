Return-Path: <linux-media+bounces-49934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CC88FCF4EDB
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 18:12:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5C1E3300871D
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 17:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6217531ED67;
	Mon,  5 Jan 2026 17:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RVqUJ0Oi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B873B2FD685;
	Mon,  5 Jan 2026 17:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767633125; cv=none; b=FLo6ivO2+Sr2N/x9odKDe9qK5oRLC5oVHrl3HA+fHxx9IZiixfkPb+ioo5ToRPxFAxIEn+ZkhdRAeZEbJnyeq4wZndggPKYt9msBp5yoLxxykIkT31AoIcBitLhXUtNYI/OvrC8hCwimFCZHgcDWc6HgVKKUL/rNvUYEQmmagIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767633125; c=relaxed/simple;
	bh=KnRyxlWiYmitQ1tAEkHqz9bq2NDqcaHpHmYcf0N+xgI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dzYbGIBCfA0MhXU51CxrTTW/GA4eZnIdrXFizfN3PxH3lhrdJAYqq/zNWoRac7okMT/pGjRXO2TCFrl1BVHuISsgbbWm9P4akCg4VbGLSEkmovL7KA/IID8BBwyAfn9onipR3FtxePbii3LbH/f0lA5zPh+uvrqqgiHJEq06Ic4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RVqUJ0Oi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from rui-Precision-7560.local (unknown [209.216.103.65])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EADD25D5;
	Mon,  5 Jan 2026 18:11:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767633100;
	bh=KnRyxlWiYmitQ1tAEkHqz9bq2NDqcaHpHmYcf0N+xgI=;
	h=From:To:Cc:Subject:Date:From;
	b=RVqUJ0OikiXvWEi/akktgaIZmwD/sLH0ALepesoFR6IXCH34V5aIN6pbd7dN+dvk1
	 5F3VkFncLQfec+GBHYnH0STGHyiSyUMNLx67kRciRCVKh2AFp+JXoRnJYxrPhz2TPa
	 g/EYjDMlwDrjXn5BSFZvdva1WBw3s7r7qhJQ9jRg=
From: Rui Wang <rui.wang@ideasonboard.com>
To: linux-media@vger.kernel.org,
	dafna@fastmail.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	heiko@sntech.de,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: libcamera-devel@lists.libcamera.org,
	Rui Wang <rui.wang@ideasonboard.com>
Subject: [PATCH v4 0/1] Fix filter mode register issue
Date: Mon,  5 Jan 2026 12:11:41 -0500
Message-ID: <20260105171142.147792-1-rui.wang@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series contains a single patch that fixes an issue in the rkisp1
filter mode configuration logic.

The rkisp1_flt_config() function performs a direct write to the
FILT_MODE register before the read/modify/write update. This write
does not include the RKISP1_CIF_ISP_FLT_ENA bit, which clears the
enable bit in hardware. After that, the read/modify/write sequence
cannot restore the original enable state, causing the filter to be
disabled unintentionally.

The patch removes the redundant direct write. The remaining
read/modify/write sequence correctly updates the mode fields while
preserving the existing enable bit.

Please review.

Thanks,
Rui Wang

Rui Wang (1):
  media: rkisp1: Fix filter mode register configuration

 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 6 ------
 1 file changed, 6 deletions(-)

-- 
2.43.0


