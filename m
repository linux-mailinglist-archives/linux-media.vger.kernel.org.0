Return-Path: <linux-media+bounces-27163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BE515A47C80
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 12:48:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 083E27A476B
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 11:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66DBA22A4F4;
	Thu, 27 Feb 2025 11:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TCN0cIHz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D7722CBE8;
	Thu, 27 Feb 2025 11:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740656854; cv=none; b=YsqXYHLazuPM3MoPotqyo1HebQFYw/QRC1iSEI6ulUGdHSMmoVdSN1uxyEMaX2to/yFn1y9jh4HgEu7HvP26AfujGOAYNkHBdSmXnpv3GGHHbo8ZHdMy8h2/dwzGdNpBu2tAHK6oLRzE4fnBihp1G/eaPapffuLBnJg8TISC8JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740656854; c=relaxed/simple;
	bh=P9xqUjKbHM5Je+UfdaKgLXkxGRlIAHd1iEy80IGgQXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KMQM/FR/5mN8yZjoBUDsFb9ISVKC36+WDvUfF8R79r3HBtEG+S+6rl/2i/1u8Kzmuw4pFnWxQqV0LolimlUHgt7fFbSdtsnzz+UZShr21pZ7qeF/Mi5POkFK6kyeLYlDgPrSjZWVn1SGEAMZSr23ejXHnK7NeZGpTxn+MAzBENc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TCN0cIHz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:a3f5:6799:2ce9:5b66])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5DFD27F5;
	Thu, 27 Feb 2025 12:46:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740656763;
	bh=P9xqUjKbHM5Je+UfdaKgLXkxGRlIAHd1iEy80IGgQXE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TCN0cIHzr1IRMzTI7bhy1uuEj1SRVAB00NAagrYvtrsx4PI91VFfxUNlIEg/EzI02
	 1Hl0d4eE73DYpypXFuli6Yj27dkq5nre2BNTyUIHQf9DIlWA0JJ6PKtP6jd6RpWBRF
	 CZKearkxFmOjwsNV9nLve8me29659QOwH6R21HdQ=
From: Stefan Klug <stefan.klug@ideasonboard.com>
To: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] media: rkisp1: Remove unnecessary defines
Date: Thu, 27 Feb 2025 12:45:01 +0100
Message-ID: <20250227114558.3097101-4-stefan.klug@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227114558.3097101-1-stefan.klug@ideasonboard.com>
References: <20250227114558.3097101-1-stefan.klug@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The effect modes are not shifts but numbers which are already defined a
few lines above. Remove the misleading defines.

Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
index bf0260600a19..139177db9c6d 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
@@ -327,13 +327,6 @@
 #define RKISP1_CIF_IMG_EFF_CTRL_CFG_UPD			BIT(4)
 #define RKISP1_CIF_IMG_EFF_CTRL_YCBCR_FULL		BIT(5)
 
-#define RKISP1_CIF_IMG_EFF_CTRL_MODE_BLACKWHITE_SHIFT	0
-#define RKISP1_CIF_IMG_EFF_CTRL_MODE_NEGATIVE_SHIFT	1
-#define RKISP1_CIF_IMG_EFF_CTRL_MODE_SEPIA_SHIFT	2
-#define RKISP1_CIF_IMG_EFF_CTRL_MODE_COLOR_SEL_SHIFT	3
-#define RKISP1_CIF_IMG_EFF_CTRL_MODE_EMBOSS_SHIFT	4
-#define RKISP1_CIF_IMG_EFF_CTRL_MODE_SKETCH_SHIFT	5
-#define RKISP1_CIF_IMG_EFF_CTRL_MODE_SHARPEN_SHIFT	6
 #define RKISP1_CIF_IMG_EFF_CTRL_MODE_MASK		0xe
 
 /* IMG_EFF_COLOR_SEL */
-- 
2.43.0


