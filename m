Return-Path: <linux-media+bounces-35722-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5E1AE5E95
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 10:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2972417AF75
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 08:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D27624BD0C;
	Tue, 24 Jun 2025 08:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DiXlD02l"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D6B24A06D
	for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 08:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750752009; cv=none; b=Wzei4JI1Z/e3MIJRQpnlZb71K5bgftFfC7ymtw52n3AvyZ8Qo8+AHJBTh0mDxBv9c+EOPU4uls0PFVGMmFpbMzK+fMbNF+BAyAwt9HiRAF2RweCjVi62tBAJb0nn5EtX1pPHptV0yiJJwLwxIf1xcS3PEetswYkNKo42ZTtQnAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750752009; c=relaxed/simple;
	bh=siUBx+fihi4utVvj0+n+hCC1/L+gMgdf9NjJzsmIwtE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oaBw0NinAMx7yeEsj4RE0XFKNOBEGNQ+5ubQ4/7DcTkH2gEtFab8TWEao0S7BhhPzFtcuTLcavOEcc4N4lzvhTf0/3Trk6Cdxj0BIBLOrOhcwJ2bWyA6AeViWsioyMrjAAkYQiyMgJysfRZILfMuQUxu3o7eyVi1rXb8auPHZJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DiXlD02l; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DBDD741;
	Tue, 24 Jun 2025 09:59:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750751988;
	bh=siUBx+fihi4utVvj0+n+hCC1/L+gMgdf9NjJzsmIwtE=;
	h=From:Subject:Date:To:Cc:From;
	b=DiXlD02lHk5ZYxBD/iCFuwglyv8Pzxq1vio+IE3p04thyO4X+2e3AzeJJcGINNGWA
	 WWLsixclkCh2rwLABOg+K7WYQFkuZjcwIrg8Ske8wsktCrNi4Kf+98ZahWgGCdI++0
	 +v9LeG1PL5mzPibbazlrEy8AVW7DrvJEZ/ctO7UY=
From: Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v2 0/3] Add media jobs framework
Date: Tue, 24 Jun 2025 08:59:49 +0100
Message-Id: <20250624-media-jobs-v2-0-8e649b069a96@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPVaWmgC/53OvQ6DIBiF4VtpmIvhTxI69T4aB4SP+jUKDRhTY
 7z3okv3ju9wnpyNFMgIhdwuG8mwYMEUa4jrhbjBxidQ9LWJYKJlWkg6gUdLX6kvVAcZjNGSael
 IHbwzBPyc2KOrHXKa6DxksD+i5YYrpphslJKGt5RTb2NTnB3H9Y4ebEmxTzb7xqXpUAcsc8rr+
 XARh/2X1O37/gX+4dPV7gAAAA==
X-Change-ID: 20250623-media-jobs-6f3f9963063c
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, jacopo.mondi@ideasonboard.com, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3689;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=siUBx+fihi4utVvj0+n+hCC1/L+gMgdf9NjJzsmIwtE=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoWlsDYJFwvJwederdis92eK+iRcv0gBMm+bogL
 SCxhwAIaO2JAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFpbAwAKCRDISVd6bEV1
 Mvv9EACiK/PQqQzSizZttY6fT+jEKjzviwX//Bxum6IzyQ87AQx+mA/ukpTnu+NjQY7meTYaeLT
 DXPr0Tmq4oAhKbvOSYEheX0F2NZDPPKwffClyt15M/Bk6p5Z+WDBh9gLsiFqfdtpXIKBX5yUMOe
 tn7boLuV/VThW7ncn87ogr1GjTrmNEZVGama6TAj8urK8SB6hbEqxpEiW0yZrWVsq0BBvDrnwQB
 8UcVq/4SfSmTLRTleRPx8rOXI4DPPu7I6KU+zqFLs9I9tU3L6KroVN8+zvWdgTLH9f/kw2mKkrt
 Lp2Fo+B7hcQul0D4PGlFzzh60GsQ8As+3PcLwyf4DCwjuXdeyVwOT5tLYpOJwxPFD3Lazv3dku1
 GLbIRl3GAvtOCT/N7sJO36fQGa5SGu+gnRF22REQFZahzybBX0i9SP6gEX3GW1PNkRXU3ZYJbYu
 8gms8pHQY/ocgqa11/QbaxY3c8hiqyaKeNrNTQnlzH6QJaPZ0r1fwn0JEeeSyC2n25Svne1zasC
 44/5/b30lqzTnrugTt0gvi0pSB+/Zf6DuCLj0UIISg5I2ULj1GAd6LB1UgmYbqohyQCEGSwXHXX
 a+lDFW13+1kfA0VRHtUAV1Wpqe7g+2xXjQ/9Yi8lAbKY9OOjaDAFmvc3MXj7RUFu9vC7NQw6FLn
 wrsRhoq8+ftAVgQ==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Hello all

This series adds a new API to the media controller framework, which
I'm calling "media jobs". The framework is intended to facilitate
communication between separate drivers which need to work together
to fully operate a media pipeline. For example, the need for the
framework arose when writing support for the ISP in the RZ/V2H; the
ISP is fed by a DMA engine which is not part of the same IP block,
and so is driven by its own driver (though sharing a media graph).
The ISP driver needs to be able to communicate with the DMA engine
driver to instruct it to push the next frame. Because the DMA engine
might be different on a different platform that used the ISP, direct
calls into functions exported by the DMA engine driver wouldn't be
scalable, and so this driver agnostic route was adopted. The
framework allows drivers to define the steps that need to be taken
(for example writing configuration data, reading statistics data,
writing buffer addresses and triggering data transmission) to complete
a "job" (of which the only current example is the processing of a
frame of data through the pipeline, though I expect that other use
cases could become apparent too) and to then schedule them into a
work queue once driver definable dependencies have been met. The
dependencies might, for example, be the queuing of buffers to V4L2
capture / output devices.

The framework allows precise definition of the ordering of the steps
regardless of the order in which the drivers populate the jobs. Steps
can be flagged as being placed at a particular position from the front
or back of the queue (I.E. last, or third from last) or as requiring
no particular order. This would allow the construction of a job like:

Step 0 (ISP Driver): Program the hardware with parameters
Step 1 to N-1 (Both drivers): Program the hardware with buffers
Step N (DMA Engine Driver): Send a frame of data to the ISP
... ISP processes data ...
Step N + 1 (ISP Driver): Read out statistics data from the last frame

The mali-c55 ISP driver and the DMA engine feeding it on the RZ/V2H
(called the rzv2h-ivc driver) both use the framework, and will be
posted shortly after this series with references back to it. I will
reply to this message with links to those series for convenience.

The first patch in this set is not strictly part of the framework,
but also facilitates multiple drivers with V4L2 Video Devices
sharing a single media graph. We have a requirement to delay the
start of streaming until all of a pipeline's video devices have had
their .start_streaming() operations called; these new entity ops
provide a mechanism through which each driver can inform the other
that the last video device in the pipeline has now been started.

Thanks
Dan

- Link to v1: https://lore.kernel.org/r/20250519140403.443915-1-dan.scally@ideasonboard.com

---
Daniel Scally (3):
      media: mc: entity: Add pipeline_started/stopped ops
      media: mc: Add media jobs framework
      media: Documentation: Add documentation for media jobs

 Documentation/driver-api/media/mc-core.rst | 169 ++++++++++++
 drivers/media/mc/Makefile                  |   2 +-
 drivers/media/mc/mc-entity.c               |  46 ++++
 drivers/media/mc/mc-jobs.c                 | 428 +++++++++++++++++++++++++++++
 include/media/media-entity.h               |  24 ++
 include/media/media-jobs.h                 | 317 +++++++++++++++++++++
 6 files changed, 985 insertions(+), 1 deletion(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250623-media-jobs-6f3f9963063c

Best regards,
-- 
Daniel Scally <dan.scally@ideasonboard.com>


