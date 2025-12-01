Return-Path: <linux-media+bounces-47998-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28319C9916E
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 21:53:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9554C3A18C2
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 20:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2140D27147D;
	Mon,  1 Dec 2025 20:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K9SHJIs1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55B4223DEF;
	Mon,  1 Dec 2025 20:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764622420; cv=none; b=qgQ76JytGJh6rOIVIa5+Ff8ssnry3X4I11YqcZgOK4f7NbtJzO4/uvkwUuLHn9sE0njKalBghM/QZ83ZtPagPOevfXcpA3VotdMxpaJm5FsBGjEyJD6prlZbJ6tpD/ImMjMzeLEpaIl8AQwHIYgjXtYSakO/4deXlSYrN1/BqEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764622420; c=relaxed/simple;
	bh=NKPb9OC67JtbcGiQx8Ruwgcg11ef9AedAmCCxfv6qvo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IUxo9o/+yIO76Pp6f0DOvTYsFhhDyWehQ0+SxeILYsrHRc+czmefFXq4LOt2GDB6+e4o1vbehTQa+66hSTwA8v7VUDQMS66kjfy+VFJoSqvltlSRH2RocBc1Jdn5HV3DPpyF/sBdRqqVgKWlRhb6Om3xRs6kcMCd57eVdk1uT6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K9SHJIs1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from rui-Precision-7560.local (unknown [209.216.103.65])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B779E6AC;
	Mon,  1 Dec 2025 21:51:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764622282;
	bh=NKPb9OC67JtbcGiQx8Ruwgcg11ef9AedAmCCxfv6qvo=;
	h=From:To:Cc:Subject:Date:From;
	b=K9SHJIs1TWz4kwVqVpUf7r09a6NG6uucS+90iDJwDGeMD1v/NVNXLPbvsAzehVX/3
	 JtJvVIFo0x1PTyGOnq/+1jOqqkn/3LNJ0I2Hc8GN1n5fM9tf/EtIM+rOlaXgYEeUKP
	 YQM+wyn+vVh+vd8kF+Luw+T0dxTvJplzLDWVxKIM=
From: Rui Wang <rui.wang@ideasonboard.com>
To: linux-media@vger.kernel.org,
	dafna@fastmail.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	heiko@sntech.de,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: libcamera-devel@lists.libcamera.org
Subject: 
Date: Mon,  1 Dec 2025 15:50:54 -0500
Message-ID: <20251201205309.528858-1-rui.wang@ideasonboard.com>
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


