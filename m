Return-Path: <linux-media+bounces-20344-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EE39B0CFD
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 20:17:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C831CB23864
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 18:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFDE218BC0E;
	Fri, 25 Oct 2024 18:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g5csNPDz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E85F20BB4F
	for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 18:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729880238; cv=none; b=XnLMtiVzyNsFP3GJEd/8Z7jG70titooew+y8j2TsCWAOtBbujz5c5DJmUG21eCzAlxpWVGzoaLYEj2UKK3/2/Qdt893kHqvPLhz1hzIBTsLQO/vIotUEMw88vLNgyDijbdyvCxQ86EpxJgIj4IYDr7RmxPeFI57ET1BjkGjTv+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729880238; c=relaxed/simple;
	bh=UmaUcTUblLBXb0YzEFvJAKuPHgdQMdzB0ilOP/0YzWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X2YjpgeVAAoPKxz+3tGXlfQ5gzr9HZ6q/LMSE0quRc2PmwcgVWJcGpYd2Cs+AB8sk4pZG3MGqfJ5ptiHJZiBjEZGuAlTytvAchy4SKSMXeQtXJz2q2uYb5KVp8oWytcqeLdkhg7QseaKko0SRgMNZCmlmG6GueKsJSm3ghM4nSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g5csNPDz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 922E59CA;
	Fri, 25 Oct 2024 20:15:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729880125;
	bh=UmaUcTUblLBXb0YzEFvJAKuPHgdQMdzB0ilOP/0YzWQ=;
	h=From:To:Cc:Subject:Date:From;
	b=g5csNPDzXPJ8Z7fjXeJ71/04eJIFFvXNx2XZeDnJuxqI6fyy89zT1I5zG8jr62ulc
	 28hddp2AeaN4Nzv0fiHiLYR/mw7uYenz1MkCw9tHBjHLe/t2pxjNsUhsIB8/6oKfBe
	 CqIqeEq5kyUbqTr8GwAZjw7XRKiKrqtBovWKh8GY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tarang Raval <tarang.raval@siliconsignals.io>
Subject: [PATCH 0/2] media: mt9p031: Drop legacy platform data
Date: Fri, 25 Oct 2024 21:17:06 +0300
Message-ID: <20241025181708.20648-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This small series drops support for legacy platform data from the mt9p031
driver. Patch 1/2 removes support for platform data as it has not been
used for a long time, and patch 2/2 follows by dropping the then
unneeded I2C device ID table.

Tarang, you can base your next version of "[PATCH] media: mt9p031:
Refactor format handling for different sensor models" on top of this
series, it should simplify your patch a bit.

Laurent Pinchart (2):
  media: i2c: mt9p031: Drop support for legacy platform data
  media: i2c: mt9p031: Drop I2C device ID table

 MAINTAINERS                 |  1 -
 drivers/media/i2c/mt9p031.c | 82 +++++++++++++++----------------------
 include/media/i2c/mt9p031.h | 18 --------
 3 files changed, 34 insertions(+), 67 deletions(-)
 delete mode 100644 include/media/i2c/mt9p031.h


base-commit: c9ec6f1736363b2b2bb4e266997389740f628441
-- 
Regards,

Laurent Pinchart


