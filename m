Return-Path: <linux-media+bounces-17710-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A62A96E5E7
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 00:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33DEC1C22BF9
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 22:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7A71AD27E;
	Thu,  5 Sep 2024 22:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="txP7X4jU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DB31482E9;
	Thu,  5 Sep 2024 22:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725576804; cv=none; b=D+w9mK7H42OOYNcJJBV6IwAey+/DaeyTVMLlfYexk6bXoPebiQaHOtRjPHX6FxA0Ptajuzyf1oMj03poBwYqcbmm+jIc3v1eH6gdtyrGVtNCJvhrmiQ1Wx6gjllXLbeRVb12qxXHDj9EVbQ7i+dXbnlYHj1T53L/ZfTWNEwESXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725576804; c=relaxed/simple;
	bh=pvm+SUYVQtw7X9IMzdKVnVElWw0FSFD5kCwbh0qiTlo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kLTiDr4XDUeUrCwQ7FBQMJrFs/FdSLBkAAhC9fXsrOf0oWeY/2k8VQu6+68jtKhyUqFw6vOpyYiC5ReeyLgs6U/94kkoLtsR+ftTtibVbIOpUwZlF81dFW7H4WcAQGCc5GALsUwM6BHwXSzaQiclRYLfsZTVB3TkrUQBuhwQtUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=txP7X4jU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9506B8A9;
	Fri,  6 Sep 2024 00:52:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725576720;
	bh=pvm+SUYVQtw7X9IMzdKVnVElWw0FSFD5kCwbh0qiTlo=;
	h=From:To:Cc:Subject:Date:From;
	b=txP7X4jUFS7Kveh8vrZpr/Py+fzx6vE2tB20IKcIXqAPgeR0/Ii+io8/a2Z+lYXKO
	 Nj3Ik8/DO1NVnQ6+39+gqKZW2IByax8X445RYuSfuQ6QCEO6GuHeobl3UcmTCgMirR
	 xpTFffzz5fCznD1Kf34uzsVDIDTdnh+wfqWCebLI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH/RFC v2 0/9] media: i2c: AR0144 camera sensor driver with companding support
Date: Fri,  6 Sep 2024 01:52:58 +0300
Message-ID: <20240905225308.11267-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patch series adds a driver for the onsemi AR0144 camera sensor.

The AR0144 is a 1/4" 1MP 12-bit raw camera sensor, with monochrome and
Bayer variants. It has both parallel and MIPI CSI-2 output capability.
Its features include analog crop, binning/skipping and the usual set of
controls applicable to raw sensors. It has a CCS-compatible clock tree,
but doesn't use the CCS register layout.

In addition to the standard features, the sensor supports automatic
exposure and black level correction. Furthermore, it supports dynamic
range compression to reduce the bit rate. This last feature is new to
V4L2, and is why this series is marked as RFC.

Patch 1/9 adds the DT binding, and patch 2/9 the driver. Support for the
parallel interface comes in patch 3/9. I haven't bundled it with 2/9 as
my test platform supports CSI-2 only, so I couldn't test the parallel
interface, and I suspect it will not work out of the box. I'm fine
leaving 3/9 out for now, it will be available in the list archives
should anyone decide to test and complete support for the parallel
output.

Patches 4/9 to 7/9 then add support for internal pads, routing and
embedded data. This is split from patch 3/9 as the necessary APIs are
not merged in the kernel yet. The DT binding and the base driver could
be upstreamed first and independently from embedded data support,
depending on the timing of the dependencies.

Patch 8/9 then starts the RFC part. It adds a new V4L2 control for
companding. Companding is a combination of compressing (on the camera
sensor side) and expanding the data to reduce the bandwidth transmitted
on the bus. The AR0144 support compressing data using a custom curve
similar to A-law when outputting 8- or 10-bit data. This improves the
sensitivity in the middle of the dynamic range. The new control allows
enabling compression. The control doesn't affect the bit depth of the
output format, only the way the larger bit depth of the sensor is
reduced.

Finally, patch 9/9 implement the companding control in the ar0144
driver.

The series is based on "[PATCH v9 00/46] Generic line based metadata
support, internal pads" ([1]). I have pushed it to a branch ([2]) that
includes the dependencies (along with other relevant - and less relevant
- bits and pieces such as DT overlays for testing).

[1] https://lore.kernel.org/all/20240416193319.778192-1-sakari.ailus@linux.intel.com/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/log/?h=nxp/v6.11/dev/rpi-cam/next

Laurent Pinchart (9):
  media: dt-bindings: media: i2c: Add AR0144 camera sensor
  media: i2c: Add a driver for the onsemi AR0144 camera sensor
  media: i2c: ar0144: Add support for the parallel interface
  media: i2c: ar0144: Add internal image sink pad
  media: i2c: ar0144: Add image stream
  media: i2c: ar0144: Report internal routes to userspace
  media: i2c: ar0144: Add embedded data support
  media: v4l: ctrls: Add a control for companding
  media: i2c: ar0144: Add support for companding

 .../bindings/media/i2c/onnn,ar0144.yaml       |  162 ++
 .../media/v4l/ext-ctrls-image-process.rst     |   16 +
 MAINTAINERS                                   |    7 +
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ar0144.c                    | 2111 +++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |    9 +
 include/uapi/linux/v4l2-controls.h            |    5 +
 8 files changed, 2322 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ar0144.yaml
 create mode 100644 drivers/media/i2c/ar0144.c


base-commit: 39574b6b7bf1368c42975263988d86cc400526e2
-- 
Regards,

Laurent Pinchart


