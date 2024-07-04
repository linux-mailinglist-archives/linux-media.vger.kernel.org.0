Return-Path: <linux-media+bounces-14646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F67927A75
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 17:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 707112839F7
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 15:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE02B1B1401;
	Thu,  4 Jul 2024 15:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uWOCZWRw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6A21E485
	for <linux-media@vger.kernel.org>; Thu,  4 Jul 2024 15:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720108198; cv=none; b=DljtVjoicSSwXH1o7qv4AZIS6ysouDPkTWO3wuH/XpRGWqHQYYAaea1KumhD8jdP3Tu4qA02d0TqvkRc5C4gHNvXvvfwJUVX1zQizMj0P7NsiZuDYpu52ib5OnkleZ1+rozfceZaNYZlsSTt8a6tAESY9kEgd4uUSeIhpkSGg5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720108198; c=relaxed/simple;
	bh=bga54ShtX80dKpbhHelOs80UZt/O8/1NiGzrdUI5LEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ai/++OrxyfYbwBLfTSbz3pm8HbntlrR0ipE32Fp4CDWh9Txuhl5nRz9PgMe3q4Sx+zB+gefs/5WRbvOvtntHZnBF+i1l1UYtAZlkJDYnkX69Fko0IJgkZy3tdZhs5JJS5LNwVuVaZPN/7ODfMK2kv96D+7g/ejWygTB/gF0EUBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uWOCZWRw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2124B502;
	Thu,  4 Jul 2024 17:49:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720108165;
	bh=bga54ShtX80dKpbhHelOs80UZt/O8/1NiGzrdUI5LEY=;
	h=From:To:Cc:Subject:Date:From;
	b=uWOCZWRwVL3/83DVscOHRWiw892L/CKujh3zTNp6WpNT66GCaOk7kiIQEOsx+zr8u
	 6l+8Yi2CmDtxFDuopvlMIyEJwKkGzBwv5e1OrNqTzRZquj6jXwZCbPwBEEa2r9d+pf
	 Ovk953rDteZlHvQsfjo6xI4HH97RXSUciP2Wgx3Q=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2 0/5] media: rkisp1: Add support for the companding block
Date: Thu,  4 Jul 2024 18:49:27 +0300
Message-ID: <20240704154932.6686-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patch series extends the rkisp1 driver to add support for the ISP's
companding block.

The companding block is an ISP processing block located at the front of
the processing pipeline that performs data expansion, black level
subtraction and data compression. It is found in the ISP8000Nano on the
i.MX8MP, and not present in Rockchip versions of the ISP, that implement
BLS in a dedicated block (not present in the ISP8000Nano) already
supported by the driver.

The first two patches start with preparatory work. Patch 1/5 refactors
existing duplicate code to share a common function, that will also be
used later in this series. Patch 2/5 then improves the ISP parameters
extensible format handler by making it possible to condition support for
particular ISP blocks based on device features.

Support for the companding block follows in the next three patches.
Patch 3/5 adds macros for the companding block registers, and patch 4/5
adds feature flags to differentiate between the dedicated BLS block and
the companding block. Finally, patch 5/5 adds support for the companding
block in the ISP parameters.

The series is based on Jacopo's support for extensible parameters in the
rkisp1 driver ("[PATCH v5 0/7] media: rkisp1: Implement support for
extensible parameters", see [1]). Thanks to that work, adding support
for a new ISP block in a backward compatible way is easy. I have pushed
a branch to [2] that includes all the dependencies, on top of the media
stage master branch.

[1] https://lore.kernel.org/r/20240703161048.247124-1-jacopo.mondi@ideasonboard.com
[2] https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/log/?h=next/media/rkisp1

Laurent Pinchart (2):
  media: rkisp1: Add helper function to swap colour channels
  media: rkisp1: Add features mask to extensible block handlers

Paul Elder (3):
  media: rkisp1: Add register definitions for the companding block
  media: rkisp1: Add feature flags for BLS and compand
  media: rkisp1: Add support for the companding block

 .../platform/rockchip/rkisp1/rkisp1-common.c  |  14 +
 .../platform/rockchip/rkisp1/rkisp1-common.h  |   7 +
 .../platform/rockchip/rkisp1/rkisp1-dev.c     |   9 +-
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 243 ++++++++++++++----
 .../platform/rockchip/rkisp1/rkisp1-regs.h    |  23 ++
 .../platform/rockchip/rkisp1/rkisp1-stats.c   |  51 +---
 include/uapi/linux/rkisp1-config.h            |  89 ++++++-
 7 files changed, 348 insertions(+), 88 deletions(-)


base-commit: 06d29a973fc1d19dc5d3337565b83e83344c14ea
-- 
Regards,

Laurent Pinchart


