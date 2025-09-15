Return-Path: <linux-media+bounces-42558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C35C9B57CA0
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 15:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2584C1A2689F
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 13:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF17A30DEAD;
	Mon, 15 Sep 2025 13:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oPi9ooxI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A1530CDBE;
	Mon, 15 Sep 2025 13:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757942325; cv=none; b=cjZXlwkBfI/i9/5r4dVS3ZvNVz1H9ktz/NrNStl1DJihlau34YLcr/V85iXivrzq+4NHUxYjrk68LB3vDdTrXn2584UD0g2yJzkDGdBH/srAzuGJW3n+ZtANQXWVUTbJgsGOwypfNRq2fafdg23Lc3yTCCM/TBsu+QWe0HCE9lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757942325; c=relaxed/simple;
	bh=K168Nz0/cSOMcDV5Ibjm1ORQDmfgPC7IGoVfDOOSL+o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fSzni+cd6sWutjPJfH5pN/fMLj+IBy2DM/1+UvJpMjW2COvRGvdRA9wNdU8eTk3lccH49P6tEu/ccMGu8a+EbWR/AHxhoVuHyzfUk1585nWV3q56mxYrBJdHgaHfOjr7ONzHsFLEHZXa/bDc2uDm5aLj8meerbdENGd/3UJG8vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oPi9ooxI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E43D11744;
	Mon, 15 Sep 2025 15:17:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757942240;
	bh=K168Nz0/cSOMcDV5Ibjm1ORQDmfgPC7IGoVfDOOSL+o=;
	h=From:Subject:Date:To:Cc:From;
	b=oPi9ooxIybJfeENFQJOqbO+uh9kdSW9cB4wvM25ugmvLs02/B/0MVG1zAyEN+P4Cx
	 QFJySqYsAu3RSOOW9DWY9XKdj6DBkyFFVHjWths/W3RSoLJKl69++RXsIo6EHPXDPp
	 Ox5B/qNAvS2bS8lvGMlgEQStM+oi3nrqGr4zGOKU=
From: Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v3 0/3] media: imx-mipi-csis: Get the number of active
 lanes from mbus_config
Date: Mon, 15 Sep 2025 14:18:32 +0100
Message-Id: <20250915-mbus-config-active-lanes-v3-0-97a1282a410b@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACgSyGgC/03MTQ6CMBBA4auYrh3SHwroynsYF0M7wCTSmrYSE
 8LdbVy5/Bbv7SJTYsrietpFoo0zx1BhzifhFgwzAftqoaW28qIsrOM7g4th4hnQFd4Inhgog2r
 R28H1qIZO1PyVaOLPb31/VE8prlCWRPg3lEZJrVvTKNsZq3tQwBnRNdnFUm7sCXMMY8TkGxdXc
 Rxfb9mITrIAAAA=
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Frank Li <Frank.Li@nxp.com>, Isaac Scott <isaac.scott@ideasonboard.com>
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

Tested on v6.15, compile tested on v6.17-rc6.

---------

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

Isaac Scott (3):
  media: v4l: Add helper to get number of active lanes via a pad
  media: imx-mipi-csis: Store the number of data_lanes configured in dt
  media: imx-mipi-csis: Get number of active lanes via mbus_config

 drivers/media/platform/nxp/imx-mipi-csis.c |  8 ++++++-
 drivers/media/v4l2-core/v4l2-common.c      | 25 ++++++++++++++++++++++
 include/media/v4l2-common.h                |  1 +
 3 files changed, 33 insertions(+), 1 deletion(-)

--
2.43.0

---
Isaac Scott (3):
      media: v4l: Add helper to get number of active lanes via a pad
      media: imx-mipi-csis: Store the number of data_lanes configured in dt
      media: imx-mipi-csis: Get number of active lanes via mbus_config

 drivers/media/platform/nxp/imx-mipi-csis.c | 17 +++++++++++-----
 drivers/media/v4l2-core/v4l2-common.c      | 32 ++++++++++++++++++++++++++++++
 include/media/v4l2-common.h                | 21 ++++++++++++++++++++
 3 files changed, 65 insertions(+), 5 deletions(-)
---
base-commit: f83ec76bf285bea5727f478a68b894f5543ca76e
change-id: 20250915-mbus-config-active-lanes-14ad58c7a186

Best regards,
-- 
Isaac Scott <isaac.scott@ideasonboard.com>


