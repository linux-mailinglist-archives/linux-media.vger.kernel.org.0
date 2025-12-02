Return-Path: <linux-media+bounces-48003-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2B2C99CB7
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 02:51:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 09A9B345E41
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 01:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A7121773D;
	Tue,  2 Dec 2025 01:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NA66SOYj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10201F151C;
	Tue,  2 Dec 2025 01:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764640248; cv=none; b=Zs2vtsa0hfKMIvdgnSBp1cW9mVNGOGOYKHVcOBf5uB5xwYvjOAQyY5jfHGTrMaYcrqtw07KETX+UkpH1nm+bg0NhVC2QsJJPAav8N/XkxdmiT+lqTh+q7UINVG4BoQQVh92P30Y9OTmDlUrmC4tkLqkuqJ3lfTwVXN3Zx5vHhC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764640248; c=relaxed/simple;
	bh=KnRyxlWiYmitQ1tAEkHqz9bq2NDqcaHpHmYcf0N+xgI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k2DlVnpyDHBfDICzEtg4eidphbo3U9yr0bR/YBmAl2bKk2/EWrgr29venI7lnB0A2PYMTy/BN5d9evhnHc/l9BEGpHfBp5Esq4GLGUlNlssKx2d86manMSDiZTMrt5pZX6gDcpAC+eb14X+/2zHz7G3ID1GFEVtjZfwhEncfqxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NA66SOYj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from rui-Precision-7560.local (unknown [209.216.103.65])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5CA30A06;
	Tue,  2 Dec 2025 02:48:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764640108;
	bh=KnRyxlWiYmitQ1tAEkHqz9bq2NDqcaHpHmYcf0N+xgI=;
	h=From:To:Cc:Subject:Date:From;
	b=NA66SOYjcfVhIlIUb0rmTNDc3aWKdtrv18zLMqbe4SV5Xzubqf88AzE69rovmFT5w
	 wO1wJJMNbF9Ryi4uzL7SWR9+vUmER3LpedSw+vM1FhVEnqlm7DBLXf4IxrRiYDuGCb
	 jOGyvOaFfW8HBrwZMivkc7dlfaQK/X1EGh1LoKmI=
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
Subject: [PATCH v1 0/1] Fix filter mode register issue
Date: Mon,  1 Dec 2025 20:50:24 -0500
Message-ID: <20251202015025.601549-1-rui.wang@ideasonboard.com>
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


