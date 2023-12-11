Return-Path: <linux-media+bounces-2088-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A7F80CA58
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 14:00:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 192D91F217C3
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 13:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 298DD3D394;
	Mon, 11 Dec 2023 13:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UmL/T4PV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92704AF;
	Mon, 11 Dec 2023 05:00:05 -0800 (PST)
Received: from umang.jain (unknown [103.251.226.68])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DE6D922;
	Mon, 11 Dec 2023 13:59:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702299559;
	bh=WTcqtedw6uyiI/7EwNje1R8hFvkCGvnX3Wg05wUWeOQ=;
	h=From:To:Cc:Subject:Date:From;
	b=UmL/T4PVqkf4QlJUW9289S86Uzf9h1KP3mdch5XlkM6EWzuP7qXBXk7sFK6MacrbC
	 cdjaKvGWt0PzpVSBa2Gm83TxNxCEONc7KPyr7zVTdGGN1IJmI+l/xVmdoChsYhL/4M
	 jb0iJaiEq6VqAZLICcNRGBG0f8829yZtZeRDhV1g=
From: Umang Jain <umang.jain@ideasonboard.com>
To: devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: "Paul J . Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v4 0/7] media: Sony IMX335 improvements
Date: Mon, 11 Dec 2023 18:29:42 +0530
Message-ID: <20231211125950.108092-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Sony IMX335 is not yet compatible with libcamera, as it is missing
the get selection API call.

It also misses a way to describe how to power on the sensor.

Now that I've got this camera functioning on Debix-SOM and Pi5, I expect
to be able to do quite a bit more cleanup to the code here. But these
patches should already be valid for consideration.

The series provides the bindings required to reference the power
supplies, and then performs some initial clean up to the driver for
error reporting before adding the regulator enablement, implementing the
get_selection api (as well as set selection, which returns the static
configuration) and restricts the hblanking to match the configuration.

v4:
 - Fixed kernel test bot warning in Patch 7/7:
   drivers/media/i2c/imx335.c:160: warning: Function parameter or member 'cur_mbus_code' not described in 'imx335'
 - Dropped "[PATCH v3 8/8] media: i2c: imx335: Support multiple link frequency"
   from series, as the general timing register should also be programmed in
   conjunction (which was missing). Currently under investigation, will
   be posted as separate patch.

v3:
 - Remove #define and use ARRAY_SIZE(imx335_supply_name) directly in 4/8
 - Add two new patches for 10-bit mode(7/8) and multiple link frequency
   support(8/8)

v2:
 - Supplies are no longer 'required'
 - media: i2c: imx335: Fix logging line endings - New patch
 - line endings are fixed
 - error paths are handled for the regulator in imx335_power_on
 - set_selection is defined alongside get_selection

Kieran Bingham (6):
  media: dt-bindings: media: imx335: Add supply bindings
  media: i2c: imx335: Fix logging line endings
  media: i2c: imx335: Improve configuration error reporting
  media: i2c: imx335: Enable regulator supplies
  media: i2c: imx335: Implement get selection API
  media: i2c: imx335: Fix hblank min/max values

Umang Jain (1):
  media: i2c: imx335: Support 2592x1940 10-bit mode

 .../bindings/media/i2c/sony,imx335.yaml       |  13 ++
 drivers/media/i2c/imx335.c                    | 211 +++++++++++++++---
 2 files changed, 191 insertions(+), 33 deletions(-)

-- 
2.41.0


