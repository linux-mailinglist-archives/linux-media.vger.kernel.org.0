Return-Path: <linux-media+bounces-45574-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B7BC0AFE3
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 19:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9CC0A34993F
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 18:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB38E2E8DFC;
	Sun, 26 Oct 2025 18:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tjyXNY3R"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89E726E6E5
	for <linux-media@vger.kernel.org>; Sun, 26 Oct 2025 18:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761502358; cv=none; b=uiMxPoar90HcIs3g95nvcgWD7zSDzSNiNAklVDQ8MUaWNd2HKOS73tKebX/5H7w8jIEa1qDc0RRod30ZQd3b0vc4MGb91RDZHwKAeBhKngLRdm4Ta9vbjtp7FneF0R9hv33CH+xjjdhoZ42Quy4dvBXrgX0Kq91VNECA5wSriI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761502358; c=relaxed/simple;
	bh=Ew+M3G9Nz1IT4zHFaEmxDnALHiMp9q8WXlOQoLlck+c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ox6w1HZKOg6F/HACcAYC/etNkmReGVaO1I6NcNFVsX3puZOgV4YBzxn8mNVjRU7f0yu1gxdEi3bPI3g30CbOETJZxhqY1SJydOsJg/TsAIhTAs+apOanYivRC1FoRHSjeQt/X1qaeL1VYVfJY4p+XBpPd+9niX2RsBda1kJfLXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tjyXNY3R; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8EF4B664;
	Sun, 26 Oct 2025 19:10:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761502243;
	bh=Ew+M3G9Nz1IT4zHFaEmxDnALHiMp9q8WXlOQoLlck+c=;
	h=From:To:Cc:Subject:Date:From;
	b=tjyXNY3R3X3phd/XMYErVX/vGVnT2dJ1LZw/Wuu/qFgxk1cxvXRHNwf/LIJpxqfct
	 VcpP0qFZUzQeMJOzcawQX9iD5t+xA69sAZjRj5UktsAZY5MSk21gy1m4EyCiuON0Zn
	 Xyj+wkXL2Gk9g5wMsaifQjE6QXHWrHnznTJAe1No=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: [PATCH] media: ipu3-imgu: Drop struct imgu_device v4l2_file_ops field
Date: Sun, 26 Oct 2025 20:12:16 +0200
Message-ID: <20251026181216.13485-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct imgu_device v4l2_file_ops field is unused. Drop it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/ipu3/ipu3.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3.h b/drivers/staging/media/ipu3/ipu3.h
index d2ad0a95c5aa..7b2a1eee2c7f 100644
--- a/drivers/staging/media/ipu3/ipu3.h
+++ b/drivers/staging/media/ipu3/ipu3.h
@@ -127,7 +127,6 @@ struct imgu_device {
 	/* Private fields */
 	struct v4l2_device v4l2_dev;
 	struct media_device media_dev;
-	struct v4l2_file_operations v4l2_file_ops;
 
 	/* MMU driver for css */
 	struct imgu_mmu_info *mmu;

base-commit: ea299a2164262ff787c9d33f46049acccd120672
-- 
Regards,

Laurent Pinchart


