Return-Path: <linux-media+bounces-11220-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE368C127A
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 18:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E695F1F223B9
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 16:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 617A116F850;
	Thu,  9 May 2024 16:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="e1M32LjQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D3816F838;
	Thu,  9 May 2024 16:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715271261; cv=none; b=ID96d9BNgCUsMEaWd/qe6dQ0ZIMNtP/BALOd75wD3kVw9TlwIyrFOukN/3ekCtLgXEfrKwgP3RlzBq6hfAyPfAERvszpCQNTrGYG6BEs6bIFczSjJILw/CjFvGmLhkw6CFS1TfCZTD2kVmi7FDBW7kJ2hJDjk2Wu/mwb0SweR6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715271261; c=relaxed/simple;
	bh=8oBxZuB2ADwJUDUwHXhuRa2dcgBavevXYZYrTSbtaQU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qiJWObxhyRpj+8DJjuf0wMKSCX/LP1l781MS/B1qLVzL0/JmRk1EVEiG1jz+LMBdNJ3vsU+o1hBxZMPjRGDTVJk1V7mNcJDy03z2I83H6a0FNkwdGozOwvBvH15KcJvEKWVGmTsp7me3wgAr8feFs61S1s9uS/lsIDuz0iRXT34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=e1M32LjQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E5EE524;
	Thu,  9 May 2024 18:14:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715271254;
	bh=8oBxZuB2ADwJUDUwHXhuRa2dcgBavevXYZYrTSbtaQU=;
	h=From:To:Cc:Subject:Date:From;
	b=e1M32LjQa7vAksKwCV4yPJJml3QPmAgHEPWznbcZ6hLVRvrF6n7cfSEujwc2JV9sV
	 qviXkeBv54JFMD6XytoL3KDA2hm68noSvrulDwbnl+t9nHaYTz74kF3bmSpVHi+5JI
	 D6fgWOgKX8b2ZyfJ2Shjirwu+ieRQGagukboiqTg=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 00/11] media: renesas: rcar-csi2: Use the subdev active state
Date: Thu,  9 May 2024 18:13:50 +0200
Message-ID: <20240509161403.111789-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2->v3:
- rcar-csi2: Collect v2.2 of [4/11]
- adv748x: enum_mbus_code: reduce the number of formats to the ones supported
  by the HDMI and Analog front ends;
- adv748x: enum_mbus_code: enumerate all formats on sink pad; enumerate the
  active format on the source pad
- max9286: Apply the format to all pads to enforce all links to have the same
  format
- max9286: Remove max9286_set_fsync_period() from setup

v2->v1:
  - Remove "media: adv748x-csi2: Initialize subdev format"
  - Add "media: adv748x-afe: Use 1X16 media bus code"
  - Tested with CVBS
  - address comments from Laurent and Niklas

A branch is available at
https://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git/
jmondi/renesas-drivers-2024-04-23-v6.9-rc5/multistream-prep

As a follow-up to the recently sent
"media: renesas: rcar-csi2: Support multiple streams" series, this smaller
version collects some fixes and implement usage of the subdev active state
to simplify the R-Car CSI-2, ADV748x and MAX9286 drivers implementations.

Tested with GMSL on Eagle V3M
Tested with HDMI on Salvator-X
Tested with CVBS on Salvator-X
Boot tested on WhiteHawk V4H


Jacopo Mondi (11):
  media: rcar-vin: Fix YUYV8_1X16 handling for CSI-2
  media: rcar-csi2: Disable runtime_pm in probe error
  media: rcar-csi2: Cleanup subdevice in remove()
  media: rcar-csi2: Use the subdev active state
  media: adv748x-csi2: Implement enum_mbus_codes
  media: adv748x-csi2: Validate the image format
  media: adv748x-csi2: Use the subdev active state
  media: adv748x-afe: Use 1X16 media bus code
  media: max9286: Fix enum_mbus_code
  media: max9286: Use the subdev active state
  media: max9286: Use frame interval from subdev state

 drivers/media/i2c/adv748x/adv748x-afe.c       |   4 +-
 drivers/media/i2c/adv748x/adv748x-csi2.c      | 145 +++++++++-----
 drivers/media/i2c/adv748x/adv748x.h           |   1 -
 drivers/media/i2c/max9286.c                   | 182 +++++++-----------
 drivers/media/platform/renesas/rcar-csi2.c    | 155 +++++++++------
 .../platform/renesas/rcar-vin/rcar-dma.c      |  16 +-
 6 files changed, 271 insertions(+), 232 deletions(-)

--
2.44.0


