Return-Path: <linux-media+bounces-14812-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1217792C9FE
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 06:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A50B7B227CD
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 04:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858F34C631;
	Wed, 10 Jul 2024 04:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VAm6nPoY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F2329CE6;
	Wed, 10 Jul 2024 04:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720586809; cv=none; b=iHiCRyUh2FEX662h5qYKR1SUgE4Slnit+zTM9Yvdse9xyuO4/jaCfkOM4NCpo+LOjUoidq2ZUtLw/Y0OYUthrIKXdSq+Kxu+Zu6cUeqSq70So7xpTto40Yzb2/5Hyngt+1CX/XCwaRSKiVoM/25EvTNJyW46jPOG4G/4yqz9BBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720586809; c=relaxed/simple;
	bh=L3430Clc7rk6DVE6/59065Gnf0LIVfu8I3WmqFOLb7c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BJijfChSjv4/0JNQQqpL29IvbSW0dNrSoilwVanebof3wg5E33ED5fXVZ581cjHVvV3fjcPqj9aTuHbr83L2OrNfZWHE6xP+bd9oxnfU1ckpS51i46f54C6oODhEMUiJx3kfQ6r18u5dEuNgD+tIlA204NVqpddNqdke2dQE9Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VAm6nPoY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2405:201:2015:f873:55f8:639e:8e9f:12ec])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13971FAD;
	Wed, 10 Jul 2024 06:46:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720586772;
	bh=L3430Clc7rk6DVE6/59065Gnf0LIVfu8I3WmqFOLb7c=;
	h=From:To:Cc:Subject:Date:From;
	b=VAm6nPoYhi83AMpZDfd19mX+9qPKMcbTgvWZN0OpAxXSVPXZ5cIzIh/wI4AKL5niQ
	 Nfkh6nWzUECsVf9BjihUEKNjXPYI2kUBlvB8OHoBQr05ZyhbZmgRQPUWQXPJXE1Ntt
	 SzAkvwdeQL/7QZGQGPJIZRPo5I6L+CjqODcGBILU=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Alexander Shiyan <eagle.alexander923@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	open list <linux-kernel@vger.kernel.org>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 0/2] media: imx335: Support vertical flip
Date: Wed, 10 Jul 2024 10:16:30 +0530
Message-ID: <20240710044633.81372-1-umang.jain@ideasonboard.com>
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

Umang Jain (2):
  media: imx335: Rectify name of mode struct
  media: imx335: Support vertical flip

 drivers/media/i2c/imx335.c | 77 +++++++++++++++++++++++++++++++++++---
 1 file changed, 72 insertions(+), 5 deletions(-)

-- 
2.45.0


