Return-Path: <linux-media+bounces-1968-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E77480A69C
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 16:08:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA339B20B07
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 15:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9457020B10;
	Fri,  8 Dec 2023 15:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OQSBdrjy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0D76199A;
	Fri,  8 Dec 2023 07:08:03 -0800 (PST)
Received: from umang.jain (unknown [103.251.226.108])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5467E512;
	Fri,  8 Dec 2023 16:07:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702048040;
	bh=XdE5oS+/0plOEZHGfKkHkn9BwZSH6QN5Lw//bCz3XJE=;
	h=From:To:Cc:Subject:Date:From;
	b=OQSBdrjy6cHooeV9AJTuEHYNizuvW912lQ2KtBflkt2DxTsgYk1qErrkivVwW3c6H
	 U1xu1uEKOlc5QsuhmschNb0lKTB9zWGjWWAVkNEu3wwXB1uJmcQ2CV8OgwNK8gpkz9
	 USjAi+O4UsPk++q6JnqdjnsDyyZnKH1WyRVi1ktQ=
From: Umang Jain <umang.jain@ideasonboard.com>
To: devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: "Paul J . Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v3 0/8] media: Sony IMX335 improvements
Date: Fri,  8 Dec 2023 20:37:46 +0530
Message-ID: <20231208150756.124720-1-umang.jain@ideasonboard.com>
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

Umang Jain (2):
  media: i2c: imx335: Support 2592x1940 10-bit mode
  media: i2c: imx335: Support multiple link frequency

 .../bindings/media/i2c/sony,imx335.yaml       |  13 +
 drivers/media/i2c/imx335.c                    | 297 ++++++++++++++----
 2 files changed, 257 insertions(+), 53 deletions(-)

-- 
2.41.0


