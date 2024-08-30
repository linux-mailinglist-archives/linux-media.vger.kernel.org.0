Return-Path: <linux-media+bounces-17196-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF8B965796
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 08:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DE441C22F21
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 06:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065A7152169;
	Fri, 30 Aug 2024 06:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fn4dxW77"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FE344C7C;
	Fri, 30 Aug 2024 06:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724999213; cv=none; b=m4aFlo68uPA/9cGlulF+x0V2PfHwsX1Ia6Q6qujVptRzfZR0s3RSy1gOOeEJA4YQj+iczxdcbXGY2fXmA8470/ruLvWJ4tjoXODNeLe8cKbF6jNB5yu2mfPEmwY3djJ8nB7JiOaeeiUQiXRjQBaG/6zwoz8ARXmNN2bnjNM2o88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724999213; c=relaxed/simple;
	bh=lrvFrR/yaNfcgo8gyrBAYFxrpVpe1C9d1RFCq+58iD0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ThE20geR+Sq1qAJOiKX5t9otC9LzIDmp75reMbg3LXafyzOMgNdpQnTr081RhPOVTjyRpew4LnXFEuTu00S0WZGAMUjqNCtND7TiJDL4tj6YizoE8THLu0Gy+hOuicIhZvYpUch8LyDp/dqfyDg6O1mV6ePgCEK7iZ+BuaQ9ot0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fn4dxW77; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2405:201:2015:f873:55f8:639e:8e9f:12ec])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D408F229;
	Fri, 30 Aug 2024 08:25:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724999141;
	bh=lrvFrR/yaNfcgo8gyrBAYFxrpVpe1C9d1RFCq+58iD0=;
	h=From:To:Cc:Subject:Date:From;
	b=fn4dxW77dbTV1wpGrx0VmU6mUzy9BLmn+zTwbbjn1T97TbQiCSUGq42k87w+HVYSC
	 DEo6W98UO0ur16YfMAUnf5l/kWVAlN0msq+tjHNX9FAtUeILJvZw4dSHVklS4/XPtY
	 ymURP889Sbnnt/Tl7JX63f2+l8BSA8LfYnWxKWRs=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	open list <linux-kernel@vger.kernel.org>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 0/2] media: imx335: Support vertical flip
Date: Fri, 30 Aug 2024 11:56:37 +0530
Message-ID: <20240830062639.72947-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This work intends to supprt vertical flipping for IMX335 driver.
1/2 contains a small drive by fix, to rename the mode struct name
2/2 introduces the support for vertical flip for the mode.

changes in v2:
- None, just a resend over latest media-stage

Umang Jain (2):
  media: imx335: Rectify name of mode struct
  media: imx335: Support vertical flip

 drivers/media/i2c/imx335.c | 77 +++++++++++++++++++++++++++++++++++---
 1 file changed, 72 insertions(+), 5 deletions(-)

-- 
2.45.0


