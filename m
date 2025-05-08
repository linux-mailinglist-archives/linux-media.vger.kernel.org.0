Return-Path: <linux-media+bounces-32043-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B74B4AAFE61
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 17:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 548D4B40AE2
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 15:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6AE2797BF;
	Thu,  8 May 2025 15:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="i9KJoeO6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AECD278E68
	for <linux-media@vger.kernel.org>; Thu,  8 May 2025 15:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716602; cv=none; b=r5K0Qmml5QppGWAPVeVxkEGgM+qzAiZEadRN8H74brToMKMQ8bhtQW6I9UxbDoptOZzk73Crdi/d27rkKT3ahYfHqArr/MsdNnHcx9BXhm4IaRpYa70WHOKfq1vDkEkTfXLOZNS5BBVwntH2x0h9bLHiUsxHqmzrliFptcVUAJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716602; c=relaxed/simple;
	bh=xMaT/RuiiTQGzQSVVvzkDj3Tw0NFgTcsXYMh/BrFKWA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QQR0qhG29oFKhFL08nFgETcbPpxPXR5IDnIgtNM/l0lWGN1P2uXXVHT8F098CcPo2MEvT2TiELRoqEXP0RDXM/cLY4UHGDfWT46fEac9cIbfEIaWUdrm/ZcDsFDmQgOaH9kYVP8G9nPWgU86/BtyEXGQl9g6xvDx5a0fihbGgpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=i9KJoeO6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:861:3a80:3300:7c3b:c7bf:b733:fa1b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BB372E0;
	Thu,  8 May 2025 17:03:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746716585;
	bh=xMaT/RuiiTQGzQSVVvzkDj3Tw0NFgTcsXYMh/BrFKWA=;
	h=Date:From:To:Cc:Subject:From;
	b=i9KJoeO6rW+mHXV/bVED6BHOFZ1W33uNLlMhYZgVoYDa75hok9NAR2Gfg3kQxB2Fu
	 fDhEfDiuWujODMJCeLO3SWLZgJ0R8fDwh9A7vZfwTXTU7OG19LNlRs1+QeKyYZI9jM
	 QF7g7EsJSXE8Bd5gnQao6BHP2gBW/sTUZYfcgqmI=
Date: Thu, 8 May 2025 17:03:14 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl, sakari.ailus@iki.fi, 
	kieran bingham <kieran.bingham@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Keke Li <keke.li@amlogic.com>, mchehab@kernel.org
Subject: [GIT PULL FOR v6.16] Amlogic C3 ISP
Message-ID: <nxekkw22ehz6d3hzj3lfbojwo5w2wevjkksexzsp5cwsmjoglu@q6x76333mvdt>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Hans, Mauro,

this is the pull request for the Amlogic C3 ISP driver for Linux v6.16

Please find the CI pipeline at:
https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1420231

I know Sakari wants to have a look before the end of the day, so maybe
wait for him before pulling.

Thanks
  j

---
The following changes since commit 48dbb76cef65fabaa3ac97461eda90495e954ecd:

  dt-bindings: media: convert imx.txt to yaml format (2025-05-06 15:39:40 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/jmondi.git tags/c3-isp-for-v6.16

for you to fetch changes up to 0b12dab506c81606954387310b5e51205863d68b:

  Documentation: media: Add documentation file c3-isp.rst (2025-05-08 16:43:45 +0200)

----------------------------------------------------------------
Amlogic C3 ISP for Linux v6.16

----------------------------------------------------------------
Keke Li (10):
      media: dt-bindings: Add amlogic,c3-mipi-csi2.yaml
      media: platform: Add C3 MIPI CSI-2 driver
      media: dt-bindings: Add amlogic,c3-mipi-adapter.yaml
      media: platform: Add C3 MIPI adapter driver
      media: dt-bindings: Add amlogic,c3-isp.yaml
      media: Add C3ISP_PARAMS and C3ISP_STATS meta formats
      media: uapi: Add stats info and parameters buffer for C3 ISP
      media: platform: Add C3 ISP driver
      Documentation: media: Add documentation file metafmt-c3-isp.rst
      Documentation: media: Add documentation file c3-isp.rst

 Documentation/admin-guide/media/c3-isp.dot                      |   26 +
 Documentation/admin-guide/media/c3-isp.rst                      |  101 +++
 Documentation/admin-guide/media/v4l-drivers.rst                 |    1 +
 Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml     |   88 +++
 .../devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml      |  111 +++
 .../devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml         |  127 ++++
 Documentation/userspace-api/media/v4l/meta-formats.rst          |    1 +
 Documentation/userspace-api/media/v4l/metafmt-c3-isp.rst        |   86 +++
 MAINTAINERS                                                     |   25 +
 drivers/media/platform/amlogic/Kconfig                          |    1 +
 drivers/media/platform/amlogic/Makefile                         |    2 +
 drivers/media/platform/amlogic/c3/Kconfig                       |    5 +
 drivers/media/platform/amlogic/c3/Makefile                      |    5 +
 drivers/media/platform/amlogic/c3/isp/Kconfig                   |   18 +
 drivers/media/platform/amlogic/c3/isp/Makefile                  |   10 +
 drivers/media/platform/amlogic/c3/isp/c3-isp-capture.c          |  806 +++++++++++++++++++++
 drivers/media/platform/amlogic/c3/isp/c3-isp-common.h           |  340 +++++++++
 drivers/media/platform/amlogic/c3/isp/c3-isp-core.c             |  641 +++++++++++++++++
 drivers/media/platform/amlogic/c3/isp/c3-isp-dev.c              |  421 +++++++++++
 drivers/media/platform/amlogic/c3/isp/c3-isp-params.c           | 1010 +++++++++++++++++++++++++++
 drivers/media/platform/amlogic/c3/isp/c3-isp-regs.h             |  618 ++++++++++++++++
 drivers/media/platform/amlogic/c3/isp/c3-isp-resizer.c          |  892 +++++++++++++++++++++++
 drivers/media/platform/amlogic/c3/isp/c3-isp-stats.c            |  328 +++++++++
 drivers/media/platform/amlogic/c3/mipi-adapter/Kconfig          |   16 +
 drivers/media/platform/amlogic/c3/mipi-adapter/Makefile         |    3 +
 drivers/media/platform/amlogic/c3/mipi-adapter/c3-mipi-adap.c   |  842 ++++++++++++++++++++++
 drivers/media/platform/amlogic/c3/mipi-csi2/Kconfig             |   16 +
 drivers/media/platform/amlogic/c3/mipi-csi2/Makefile            |    3 +
 drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c      |  827 ++++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c                            |    2 +
 include/uapi/linux/media/amlogic/c3-isp-config.h                |  564 +++++++++++++++
 include/uapi/linux/videodev2.h                                  |    4 +
 32 files changed, 7940 insertions(+)
 create mode 100644 Documentation/admin-guide/media/c3-isp.dot
 create mode 100644 Documentation/admin-guide/media/c3-isp.rst
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-c3-isp.rst
 create mode 100644 drivers/media/platform/amlogic/c3/Kconfig
 create mode 100644 drivers/media/platform/amlogic/c3/Makefile
 create mode 100644 drivers/media/platform/amlogic/c3/isp/Kconfig
 create mode 100644 drivers/media/platform/amlogic/c3/isp/Makefile
 create mode 100644 drivers/media/platform/amlogic/c3/isp/c3-isp-capture.c
 create mode 100644 drivers/media/platform/amlogic/c3/isp/c3-isp-common.h
 create mode 100644 drivers/media/platform/amlogic/c3/isp/c3-isp-core.c
 create mode 100644 drivers/media/platform/amlogic/c3/isp/c3-isp-dev.c
 create mode 100644 drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
 create mode 100644 drivers/media/platform/amlogic/c3/isp/c3-isp-regs.h
 create mode 100644 drivers/media/platform/amlogic/c3/isp/c3-isp-resizer.c
 create mode 100644 drivers/media/platform/amlogic/c3/isp/c3-isp-stats.c
 create mode 100644 drivers/media/platform/amlogic/c3/mipi-adapter/Kconfig
 create mode 100644 drivers/media/platform/amlogic/c3/mipi-adapter/Makefile
 create mode 100644 drivers/media/platform/amlogic/c3/mipi-adapter/c3-mipi-adap.c
 create mode 100644 drivers/media/platform/amlogic/c3/mipi-csi2/Kconfig
 create mode 100644 drivers/media/platform/amlogic/c3/mipi-csi2/Makefile
 create mode 100644 drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
 create mode 100644 include/uapi/linux/media/amlogic/c3-isp-config.h


