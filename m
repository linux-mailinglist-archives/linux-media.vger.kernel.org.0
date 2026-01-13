Return-Path: <linux-media+bounces-50517-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ED3D1789D
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 10:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 705CF30A2E55
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 09:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92ED23815EC;
	Tue, 13 Jan 2026 09:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="M3i3wLec"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA8D3815C5
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 09:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295260; cv=none; b=pu6R1pv+R+KqOGm0GR25weY+MgoANNHfSez23VCVN4RMriTWImIyZpeOPa6L6xJQyDmSS8ZLGPDDVLAz7Uga36qGS4PjWA/9fg9lonW44FEjMv5riIipSg5I0BbgkS9Me82FEOIYRcp9umeSFU9qzSE1soSBY08WBjtWCKMe8c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295260; c=relaxed/simple;
	bh=7QGmoI9vind2ZVUFgIhBfbjxqfPpt+PLukssWGIqkYY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FDaqa+4TodoJTGl/gSoTfOasHvB2K36MTWWFdQLCyB/azyBn7VNAwtpdLx76TnULAKlB7wsrHDZbR5QIZGeiyDHFnZDfsw3NGg2qQ4r02xVGItt5N1Q+P1K3JF5rfFsyz48di9HSBZKgSrnbSoipojZua/2AUvjQ0r6SKIB5KCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=M3i3wLec; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:a473:c554:ed1f:46ad:1ead])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5823A316;
	Tue, 13 Jan 2026 10:07:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768295231;
	bh=7QGmoI9vind2ZVUFgIhBfbjxqfPpt+PLukssWGIqkYY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=M3i3wLecmrsU6j0jdR4uMqjVnPhMLPPC4icCNRjk7q6JWeOTiYLRtZqnj2ZhVx4qa
	 S6d9hpUGBI0dpNSLkrhXi4Km4eVE3jfJOFPc3wZw2uuaUUqcEjHG2i3rsaOLLQrWqi
	 oZvb/uxes7HmD0D4l3ipIgRrFpRdLNfh9KI0uBnY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 13 Jan 2026 14:35:21 +0530
Subject: [PATCH 01/10] platform/raspberrypi: vchiq-mmal: Move headers to
 include/linux
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-b4-vchiq-isp-v1-1-ea0b300bffc8@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5202;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=7QGmoI9vind2ZVUFgIhBfbjxqfPpt+PLukssWGIqkYY=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpZgtDzretoqmR5rIAujIK70XJTnbA3in/McmBH
 grIFpetAcmJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaWYLQwAKCRBD3pH5JJpx
 RWpAEACOzKU2wibcjkO5/BJFxH3EbyzTKDJvv36CRqsisZkHkqSWqHU2THp7IX5wp4elOHh/DW8
 NskNUEmc8H+2ICwJZt3OSfRxQztKUOHqDcZQ+HT7NaPPVqQ0PvwbqlXARhohaenTgmPqS8PQIF8
 MXvdSbvOVxOfJhtherDMIeS99DKLeHYUVAvnlyRh0wr+APFhHceqaSQmQvvzqFrGbEFnIZHHyMm
 i1kpI1Hwk85XGzkWncC9834ddk1PUmn94eRN2LPk+R7aZCUcskMe72S9YT87vWDJ/jsUq0fl7oq
 dwxrX/JkjiKufQb6/4GSuA7Cy/4j6rwRHgFgaod1JvQ/pZe5zPcKcNOWfD0CIDODBkRA7UgUuP1
 wONRnCNiVOTh0LJwdoKYzqdoImMfenpSajtMjBE+FnYseR9PTm3ownE6YdzhRxJraPyJrT3ocrX
 fSKtl77ycKn1M5W+6Tf1fYT4NosmkZEupZ1w2aO4+4StAQN/uKZSKaCi6f+aw0mOYs9XNsLTN3G
 AKXcuVQL1EiELdlu8sWvUOmL7uemj/gkm1HRnf8zE0iHOkK8AIAykHHsJ7sZKOoIdmQXlWfFJdm
 2IclYwziSCLrTh8N1j3w+z4XYpxsW9wVMgdl2imieqkWGu0lmYPNq2HrZPdvXmfGKvKtF0J2KXE
 u9e1ujjblgzMyuA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Now that VCHIQ interface is destaged, different drivers (like ISP or
codec) no longer live under the same tree as VCHIQ MMAL, but in their
relevant trees like media or audio.

Enable access to VCHIQ headers for such drivers by moving these headers
under include/linux/raspberrypi with other VCHIQ related headers.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 MAINTAINERS                                                      | 1 +
 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c             | 9 ++++-----
 .../vchiq-mmal => include/linux/raspberrypi}/mmal-common.h       | 2 ++
 .../vchiq-mmal => include/linux/raspberrypi}/mmal-encodings.h    | 0
 .../vchiq-mmal => include/linux/raspberrypi}/mmal-msg-common.h   | 0
 .../vchiq-mmal => include/linux/raspberrypi}/mmal-msg-format.h   | 0
 .../vchiq-mmal => include/linux/raspberrypi}/mmal-msg-port.h     | 0
 .../vchiq-mmal => include/linux/raspberrypi}/mmal-msg.h          | 0
 .../vchiq-mmal => include/linux/raspberrypi}/mmal-parameters.h   | 0
 .../vchiq-mmal => include/linux/raspberrypi}/mmal-vchiq.h        | 0
 10 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 816cceb5dc2d066665501aa8bbc04a2edd751087..16002c21fe06913ed57f495265b0b1ad14772c55 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4927,6 +4927,7 @@ F:	Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
 F:	drivers/pci/controller/pcie-brcmstb.c
 F:	drivers/platform/raspberrypi/vchiq-*
 F:	drivers/staging/vc04_services
+F:	include/linux/raspberrypi/mmal*
 F:	include/linux/raspberrypi/vchiq*
 N:	bcm2711
 N:	bcm2712
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
index a228098d8cc0af5d5900b92b2847a1626a6d599c..3ead81dd2d0f48be7a5dd87256c38d6ba0dbcd0e 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
@@ -22,17 +22,16 @@
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/completion.h>
+#include <linux/raspberrypi/mmal-common.h>
+#include <linux/raspberrypi/mmal-parameters.h>
+#include <linux/raspberrypi/mmal-vchiq.h>
+#include <linux/raspberrypi/mmal-msg.h>
 #include <linux/raspberrypi/vchiq.h>
 #include <linux/raspberrypi/vchiq_arm.h>
 #include <linux/raspberrypi/vc_sm_knl.h>
 #include <linux/vmalloc.h>
 #include <media/videobuf2-vmalloc.h>
 
-#include "mmal-common.h"
-#include "mmal-parameters.h"
-#include "mmal-vchiq.h"
-#include "mmal-msg.h"
-
 /*
  * maximum number of components supported.
  * This matches the maximum permitted by default on the VPU
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h b/include/linux/raspberrypi/mmal-common.h
similarity index 97%
rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
rename to include/linux/raspberrypi/mmal-common.h
index 6c5092a68b99594a0234f56b48b785fbc611bf5a..e7f065c539bcae7480a8dc2000d2a1e4cec7883c 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
+++ b/include/linux/raspberrypi/mmal-common.h
@@ -16,6 +16,8 @@
 #ifndef MMAL_COMMON_H
 #define MMAL_COMMON_H
 
+#include <media/videobuf2-v4l2.h>
+
 #define MMAL_FOURCC(a, b, c, d) ((a) | (b << 8) | (c << 16) | (d << 24))
 #define MMAL_MAGIC MMAL_FOURCC('m', 'm', 'a', 'l')
 
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-encodings.h b/include/linux/raspberrypi/mmal-encodings.h
similarity index 100%
rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-encodings.h
rename to include/linux/raspberrypi/mmal-encodings.h
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-common.h b/include/linux/raspberrypi/mmal-msg-common.h
similarity index 100%
rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-common.h
rename to include/linux/raspberrypi/mmal-msg-common.h
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-format.h b/include/linux/raspberrypi/mmal-msg-format.h
similarity index 100%
rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-format.h
rename to include/linux/raspberrypi/mmal-msg-format.h
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-port.h b/include/linux/raspberrypi/mmal-msg-port.h
similarity index 100%
rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-port.h
rename to include/linux/raspberrypi/mmal-msg-port.h
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg.h b/include/linux/raspberrypi/mmal-msg.h
similarity index 100%
rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-msg.h
rename to include/linux/raspberrypi/mmal-msg.h
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-parameters.h b/include/linux/raspberrypi/mmal-parameters.h
similarity index 100%
rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-parameters.h
rename to include/linux/raspberrypi/mmal-parameters.h
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.h b/include/linux/raspberrypi/mmal-vchiq.h
similarity index 100%
rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.h
rename to include/linux/raspberrypi/mmal-vchiq.h

-- 
2.52.0


