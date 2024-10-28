Return-Path: <linux-media+bounces-20460-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4759B3C18
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 21:45:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 511F7283742
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 20:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C4E818E03D;
	Mon, 28 Oct 2024 20:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gRaWenKS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B093C1E04BF
	for <linux-media@vger.kernel.org>; Mon, 28 Oct 2024 20:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730148293; cv=none; b=ievX/84cDcLbulTEMb1nu84gdDu7oe2J0B81eAztlayWu+ijOmO/MEoTGKi2YKugZes+vN75MJttkyDZXyTbp9hKPCc6bi/r8orR29VVB9lgqjkC85TkJcL3iT85E0LZ9U5Dnrv+L9ip9IdRyATS8cRQXBAahzhZ4TDfCuNZfUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730148293; c=relaxed/simple;
	bh=7IkZoeUb1EinZAxNYqXQvur0xP4SqrMSkNl1/0cqcV8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t6AwQh3jQ/zaHr4HklmXqYBsw0XXQ9oF6SlV+A5/pUYAwiOUJZcn6OMkEZdbGkKnMwQAKQEmJwxO4TWVrr9XMvmcli6Ap7Bm+AWltvlOXA5DutbRnHn29pc83XMyBhVN4+idgU7ChaAi8xTy7qlv8bvMJlGmA8eqa+FohO1f4io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gRaWenKS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77D02594;
	Mon, 28 Oct 2024 21:44:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730148287;
	bh=7IkZoeUb1EinZAxNYqXQvur0xP4SqrMSkNl1/0cqcV8=;
	h=From:To:Cc:Subject:Date:From;
	b=gRaWenKScChlMbVk7rDi9lsMZBn03fIMHoHWG32ILUnbqI8eF4CVf90wb/90FSjUs
	 8ciu6lN40gEn1beXizjJBBX5XaLJ7AhnWxp9746dUTVZ/2Gz6jx91zvslkaq6zdPaS
	 1Jgi7di2uEJB2fLITYd2BCejMIODHbJlunGypanE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tarang Raval <tarang.raval@siliconsignals.io>
Subject: [PATCH v2 0/3] media: mt9p031: Drop legacy platform data
Date: Mon, 28 Oct 2024 22:44:40 +0200
Message-ID: <20241028204443.22426-1-laurent.pinchart@ideasonboard.com>
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
driver. Patch 1/3 removes support for platform data as it has not been
used for a long time, and patch 2/3 follows by dropping the then
unneeded I2C device ID table. Patch 3/3 is new in this version and
switches from the OF API to the fwnode API, making the driver usable on
non-OF platforms.

I can't easily test the series at the moment. Would anyone know of an
MT9P031 camera module available off-the-shelf with a Raspberry
Pi-compatible connector ?

Tarang, would you be able to test the series ? I would like to make sure
patch 3/3 doesn't break anything.

Laurent Pinchart (3):
  media: i2c: mt9p031: Drop support for legacy platform data
  media: i2c: mt9p031: Drop I2C device ID table
  media: i2c: mt9p031: Switch from OF to fwnode API

 MAINTAINERS                 |  1 -
 drivers/media/i2c/mt9p031.c | 82 +++++++++++++++----------------------
 include/media/i2c/mt9p031.h | 18 --------
 3 files changed, 32 insertions(+), 69 deletions(-)
 delete mode 100644 include/media/i2c/mt9p031.h


base-commit: d020ca11a816a99f87f2d186e137a9fb2341adb3
-- 
Regards,

Laurent Pinchart


