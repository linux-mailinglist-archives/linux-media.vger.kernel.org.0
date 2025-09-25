Return-Path: <linux-media+bounces-43202-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0E6BA07C6
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 17:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B85CA38221D
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 15:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF2B303C9D;
	Thu, 25 Sep 2025 15:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wcJBW7ze"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F601CA84;
	Thu, 25 Sep 2025 15:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758815731; cv=none; b=PwuhpFALnVDcW1bc8O0o/59N+pgi8d0+f9j5UkVYR42THWLkdKaKNhWiy1Dm0FYzWkCld+nXHpjkuOacuq/x6qFMwKaoZnICqeetkSjIErX01Y/9AGARTIIjELuAz/00ivCkFM1MGObHXF//V/USkhSpOxEhRRB5ixFiqxF2FdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758815731; c=relaxed/simple;
	bh=0ASisa2QCpY4l16afQHZBqZmcpyhe0KCgNcO9tJeOGU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rQXUGyDP7x+77+YAQkKisWvj3S2T8L2856FAqzqMXAXn1Z1farB2kBI4Nqo4VI0llakCAa2mQiA7gvqZ1d2NjZr9IjfF4dXrc522ozkpUh3M3UJq6sRphkKx9B78w0bRv9O2L4AmrKYMmOvvrE3s0MNGn0qL/Uwb12wX+VFmgXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wcJBW7ze; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A199C1129;
	Thu, 25 Sep 2025 17:54:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758815641;
	bh=0ASisa2QCpY4l16afQHZBqZmcpyhe0KCgNcO9tJeOGU=;
	h=From:Subject:Date:To:Cc:From;
	b=wcJBW7zeIqgQbrienKha/4I+rYetMbftwZF0xnM0mKxi7yIVL20dbJrxWr0tgsQ6q
	 BHiLky86k2+TIE38E0FE48mF29tH5RJV40Qfpm7b2MvYX69rdYkqk7t6IGh4XR02jL
	 dYtG7N6iayY0wZRI7nsxlZoFsDv1A/k4P9hkWL88=
From: Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v4 0/4] media: imx-mipi-csis: Get the number of active
 lanes from mbus_config
Date: Thu, 25 Sep 2025 16:54:25 +0100
Message-Id: <20250925-active-data-lanes-v4-0-8b54e3d5af6c@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALFl1WgC/x3MQQqAIBBA0avIrBsQ0YVdJVpMOdZAWKhEEN49a
 fkW/79QOAsXGNULmW8pcqYOOyhYd0obo4RuMNo47Y1DWqvcjIEq4UGJCy4ueG9j1MYS9O7KHOX
 5n9Pc2gcWWSs0YwAAAA==
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Isaac Scott <isaac.scott@ideasonboard.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13.0

It is possible that the number of desired active MIPI CSI2 data lanes
does not match the maximum listed in device tree. Add a helper function
to v4l2_common that calls the get_mbus_config op to get the number of
actively used data lanes in drivers that support it.

Compare it to the number of lanes configured in device tree, and if its
invalid, use the number present in device tree.

This series also uses the helper in imx-mipi-csis driver to set the
currently configured num_data_lanes, while keeping track of the number
of data lanes set in device tree to ensure we can still use all possible
lanes if we need to, and the upstream subdev driver requests them.

Tested on v6.15, compile tested on media/next.

---------

Changes v3 -> v4:

- Updated base tree to media/next
- Used local 'lanes' variable consistently in
  v4l2_get_active_data_lanes()
- Removed device tree references in documentation
- Made comment a single line
- Collected tag for patch 1/4
- Removed unnecessary num_data_lanes assignments in async_register in
  imx-mipi-csis
- Removed some debug print changes
- Checked return value of v4l2_get_active_data_lanes() before assignment
  to csis->num_data_lanes
- Added patch to move redundant debug print in mipi_csis_probe()

Changes v2 -> v3:

- Rename dt_lanes to max_data_lanes
- Remove check for < 0 on unsigned int max_data_lanes in
  v4l2_get_active_data_lanes()
- Added comment to explain that mbus_config is expected to be zeroed at
  init in drivers implementing get_mbus_config subdev pad op
- Wrapped signature in header file and source for
  v4l2_get_active_data_lanes()
- Added kernel-doc documentation for v4l2_get_active_data_lanes()
- Added debug message to indicate an invalid number of active lanes
- Changed csis->max_data_lanes to csis->num_data_lanes
- Changed uses of csis->bus.num_data_lanes to csis->num_data_lanes where
  appropriate to make csis->bus immutable after probe

Changes v1 -> v2:

- Added helper function to get active data lanes in v4l2-common
- Store the maximum data lanes possible, as configured in device tree
- Added media: prefix to commit titles

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
Isaac Scott (4):
      media: v4l: Add helper to get number of active lanes via a pad
      media: imx-mipi-csis: Move redundant debug print in probe
      media: imx-mipi-csis: Store the number of data_lanes configured in dt
      media: imx-mipi-csis: Get number of active lanes via mbus_config

 drivers/media/platform/nxp/imx-mipi-csis.c | 19 ++++++++++++-------
 drivers/media/v4l2-core/v4l2-common.c      | 29 +++++++++++++++++++++++++++++
 include/media/v4l2-common.h                | 20 ++++++++++++++++++++
 3 files changed, 61 insertions(+), 7 deletions(-)
---
base-commit: 40b7a19f321e65789612ebaca966472055dab48c
change-id: 20250925-active-data-lanes-b5d994ff024a

Best regards,
-- 
Isaac Scott <isaac.scott@ideasonboard.com>


