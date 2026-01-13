Return-Path: <linux-media+bounces-50526-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB41D17825
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 10:09:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 840033017874
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 09:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5591387370;
	Tue, 13 Jan 2026 09:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LjjQuPF4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4BC31D72D
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 09:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295292; cv=none; b=GRwopV7ZuoWpmk0DGPzNlHadu6UrXoqo04UW3ZfT5HZdty4hkVG66q7dqGqLmsionkJkXq44F8J2dNjfgv9+68ic9BSMJ0wYyZdclqy+0h4cX2dClYG+kodfjiJuML+EnTtAOnatFKNk0XEhVguNlZmNwHDPUz78u5Y+GN+vlIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295292; c=relaxed/simple;
	bh=kyfIWiZKsIFqoHeQCFtMxJTG9Er3B3wsG9OKJw8XEeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E7q8r3wWPE0D+ntckQZXttUQ7ul+OXOKjQLHmFac1mwAez+MOwK3UNuwatf6VEkme7OejrKsG3MIEUjUiesaCg1gikG6sGZGFoYXt0dgrqnx4ue2J3YLCHyfds6NQMHvTS/41qUGNJ1Tat1yOtnjYNJ+ZMC0CeBmL3HOZlC7XN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LjjQuPF4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:a473:c554:ed1f:46ad:1ead])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E9B4B316;
	Tue, 13 Jan 2026 10:07:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768295263;
	bh=kyfIWiZKsIFqoHeQCFtMxJTG9Er3B3wsG9OKJw8XEeE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LjjQuPF4NLsPuuoY7GzWIM7Bzw1t/bZc/EsbOfU76mbFQ7C9z9YWAwDpaswSGN3tW
	 MPbfyYccAsHXSJYtl1v42bRI3L6XFt9Pao0jwwkIwyYF4Gsxc7H+OCnLhO6iqTzcDS
	 P3qLmkAixYY3URLmzaZH3rnpzs5yWFQKynY5pYpw=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 13 Jan 2026 14:35:27 +0530
Subject: [PATCH 07/10] media: uapi: v4l2-core: Add ISP statistics output
 V4L2 fourcc type
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-b4-vchiq-isp-v1-7-ea0b300bffc8@ideasonboard.com>
References: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com>
In-Reply-To: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4266;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=Z+stu8A+Ltko3z//8/Zz66mt7iixZehU8eSefkNFPwg=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpZgtJOwtmrwy2Ha8asPz2z/UDSL9rd86LL6ekn
 G/CH4HNj1qJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaWYLSQAKCRBD3pH5JJpx
 RXjFD/0UXPxitRefjxzA74sEwsQDmf2VOIQVX7tBlBPirPuvIm1aZ578ExWYni2ySYMwJ/BLmCo
 QioENHDb+/BCogmK/7efVyDZ+DtZXOtjOlv5WfjCDvqdnPB7GPDWURjlLfnKTpzGzQi2ulF9qnM
 MUDVVaHwzKKAWDnhysU0J/3OijePLV4BW4wDJP7i7afCIjjH5tkiW2xcr5KzWCuCR81Jl1SD5sd
 V/+Lizv+C1nUvDlX/pMI2wGDX98uaxbNZldOa4tcJe9zm4ssGyCGQmPx95UjJ6v5WCnKEy+E4fT
 ccXE1E/B4LVcIUFMqJTyxBsP8Ngd72KTWim5BWSo1ZwyWhY9rmHpORXQkIDZELDVDuWhS47OSx/
 PjCaVNv1KlObw2nIo5LplmMUqfUFzU2hwKWAU06kciirWxY/ulzyKc3uZ8taJ760ORU44RhEvW9
 SCb+wR/1vcpGzxkeP6PFAe3ZW6JTfxtshDL0qHtGLEv6LuHk2kFBObv5aTuZnyuIsGPwDa5Cky9
 2RmMVhH7CIaNukF0zhsF74xjL3dITbIRhUr5tQskJwZ0E102ljUEwhFInqb3s2M+hMJsEEcxd0L
 4UiZerkJPmbyXLvU/PPlkUEpm330GPTnjujOJ6AL7te66sWIXJ4igGw3LShTwLwT1RV9Z4wTd/h
 Pv2IQ3DHB7jJdiw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Naushir Patuck <naush@raspberrypi.com>

Add V4L2_META_FMT_BCM2835_ISP_STATS V4L2 format type.

This new format will be used by the BCM2835 ISP device to return
out ISP statistics for 3A.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 .../userspace-api/media/v4l/meta-formats.rst       |  1 +
 .../media/v4l/pixfmt-meta-bcm2835-isp-stats.rst    | 35 ++++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
 include/uapi/linux/videodev2.h                     |  1 +
 4 files changed, 38 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index 3e0cab153f0ac5e6d76696c5b78eebb0db43b354..be3f20f0e68fd225274428b4a712275654bf539c 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -14,6 +14,7 @@ These formats are used for the :ref:`metadata` interface only.
     :maxdepth: 1
 
     metafmt-arm-mali-c55
+    metafmt-bcm2835-isp-stats
     metafmt-c3-isp
     metafmt-d4xx
     metafmt-generic
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-meta-bcm2835-isp-stats.rst b/Documentation/userspace-api/media/v4l/pixfmt-meta-bcm2835-isp-stats.rst
new file mode 100644
index 0000000000000000000000000000000000000000..d5d71f3ae752a41b86f755c24b487c7cfadfac4b
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-meta-bcm2835-isp-stats.rst
@@ -0,0 +1,35 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
+
+.. _v4l2-meta-fmt-bcm2835-isp-stats:
+
+*****************************************
+V4L2_META_FMT_BCM2835_ISP_STATS  ('BSTA')
+*****************************************
+
+BCM2835 ISP Statistics
+
+Description
+===========
+
+The BCM2835 ISP hardware calculate image statistics for an input Bayer frame.
+These statistics are obtained from the "bcm2835-isp0-capture3" device node
+using the :c:type:`v4l2_meta_format` interface. They are formatted as described
+by the :c:type:`bcm2835_isp_stats` structure below.
+
+.. code-block:: c
+
+	#define DEFAULT_AWB_REGIONS_X 16
+	#define DEFAULT_AWB_REGIONS_Y 12
+
+	#define NUM_HISTOGRAMS 2
+	#define NUM_HISTOGRAM_BINS 128
+	#define AWB_REGIONS (DEFAULT_AWB_REGIONS_X * DEFAULT_AWB_REGIONS_Y)
+	#define FLOATING_REGIONS 16
+	#define AGC_REGIONS 16
+	#define FOCUS_REGIONS 12
+
+.. kernel-doc:: include/uapi/linux/bcm2835-isp.h
+   :functions: bcm2835_isp_stats_hist bcm2835_isp_stats_region
+	             bcm2835_isp_stats_focus bcm2835_isp_stats
+
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 98512ea4cc5b9d725e1851af2ed38df85bb4fa8c..30bfa35ae9f5119dd89251716e4da45e88d30aa9 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1488,6 +1488,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_GENERIC_CSI2_16:	descr = "8-bit Generic Meta, 16b CSI-2"; break;
 	case V4L2_META_FMT_GENERIC_CSI2_20:	descr = "8-bit Generic Meta, 20b CSI-2"; break;
 	case V4L2_META_FMT_GENERIC_CSI2_24:	descr = "8-bit Generic Meta, 24b CSI-2"; break;
+	case V4L2_META_FMT_BCM2835_ISP_STATS: descr = "BCM2835 ISP Image Statistics"; break;
 
 	default:
 		/* Compressed formats */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index add08188f06890182a5c399a223c1ab0a546cae1..b0dff5e124d7eaab933e57909b8421c475de1da3 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -869,6 +869,7 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
 #define V4L2_META_FMT_UVC_MSXU_1_5  v4l2_fourcc('U', 'V', 'C', 'M') /* UVC MSXU metadata */
 #define V4L2_META_FMT_VIVID	  v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Metadata */
+#define V4L2_META_FMT_BCM2835_ISP_STATS v4l2_fourcc('B', 'S', 'T', 'A') /* BCM2835 ISP image statistics output */
 
 /* Vendor specific - used for RK_ISP1 camera sub-system */
 #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */

-- 
2.52.0


