Return-Path: <linux-media+bounces-52489-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GO2dL8jqimlEOwAAu9opvQ
	(envelope-from <linux-media+bounces-52489-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 09:22:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E25F118352
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 09:22:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8E3B303DA82
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 08:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65E5133CEA9;
	Tue, 10 Feb 2026 08:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EoNM+YmF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB97257851
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 08:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770711739; cv=none; b=bxhd9b2j1PDEsne2LHjSlWhOFcwkNIuro+GCP9IMZjimvVM+NqrUcXy3IGPbPO+NX2RNSlAMI94fAAZ4Tq0fs4GfKsnrRsk6U0FJ0rUdri85WI2rr2lo0eqekJvAzO/ijsuhBC/jaxskADPCr+W8v+He3srDACcRmSSxCyhPAdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770711739; c=relaxed/simple;
	bh=K641g8eud7NkhIQVybGiCdh9Jy579n8o0Vz5/w8g25Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UAWszWe50VhwmiMMi2dmoZtFcYIk77qEnVFIR5dj862P6asF4FNIR8F/o5u4nx+H5RqnwPfXSG8TvdT33/17JGcmEXFM+UFixETreUz88Q8vlVaUb9RDObLTHeULQVDPBvawpqWbuBxxpBB5gOxuP0YvzWtyKv6bFrYHUBrq5cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EoNM+YmF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:2edd:807a:f3c0:8d1b:28a])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5BCC713BE;
	Tue, 10 Feb 2026 09:21:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770711690;
	bh=K641g8eud7NkhIQVybGiCdh9Jy579n8o0Vz5/w8g25Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EoNM+YmFw20w/7abZp6pkEB5ieD5pBh8sd8DxfjzQh6bN/krKOxNRMp1zA4ByacSk
	 UKN7PeKfZGe5xMlvcjwVhwvyYzFrEWHxTb0yT7oYBL3uJMmBCZ9NQ4Ut2fOlItYNkp
	 iucLyE6LHz2yif8Auj4WynGrMUTCc61QvVNXDhTg=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 10 Feb 2026 13:51:18 +0530
Subject: [PATCH v2 1/8] platform/raspberrypi: vchiq-mmal: Move headers to
 include/linux
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-b4-vchiq-isp-v2-1-4403944152fe@ideasonboard.com>
References: <20260210-b4-vchiq-isp-v2-0-4403944152fe@ideasonboard.com>
In-Reply-To: <20260210-b4-vchiq-isp-v2-0-4403944152fe@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5507;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=K641g8eud7NkhIQVybGiCdh9Jy579n8o0Vz5/w8g25Y=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpiuqmPzfFUkuj7Md9xFyaUEl2e0ujcbG0R5VC5
 PZVz5FwW/KJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaYrqpgAKCRBD3pH5JJpx
 RZppEACCagK+9rI+B7YGtzmv5qoW6+ZDEXo1yp7znV14bLz2HcWPmoQFp9i9OfapGRPXlQad+OK
 23qa02epZ7xKMbAs/MSNzJZb6KWqZB+CaQ0dZPylSweLTR2i0a9buj8za7/beCKBjRxP7BO00Ok
 lfMHmPlSEjCTmhZXtOa91BZ+C3tJKCtRwWSjPexbyXV2csyKLFzUSgQDpnhs7KugJJ5RFLFcSSy
 stzx23P/Wj3Kdktw3x9Kebmq+X2Z0c0L5pbdztpiuCYZsSjrteTw7zJcm5MGdfPEA1Ft5OCcfKm
 yWd7Mhq9VrUz9kcSmmJyNVzXTXtBtnRy77QVk4yiQc9pWNAwmwjerr+21bHgCeyeS+nf19dsj4l
 FhU4UIBIxkTlts9c2vjR1+6yTZhvqPe7ATJe3j5HZ5Q83kQBxwRqKtfE1IW9vXeJzHSmHpwkSMb
 jtlj6tf7fsWbmeYoMRKRhTPCMwG70J+5RUaeKZFBI5/VSNHwkkg7xhXqTV9gJ7N+p29yGOZjjGl
 v6vHtRYbm+36qGgzrN+WERxAYnwu3uU+4/F6v9l+dzSVrzwu3poejDBejLJXDykxbJvj0/bzHaI
 6E65bKapc7owRB5o1DT+KE/P5TXwhOB/I3p7Bwd9kxeBk2DZWH/vjEKUn8Twea6vIpHSrLh0giO
 vj3/YIImiQkZObA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52489-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,raspberrypi.com,gmx.net,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: 0E25F118352
X-Rspamd-Action: no action

Now that VCHIQ interface is destaged, different drivers (like ISP or
codec) no longer live under the same tree as VCHIQ MMAL, but in their
relevant trees like media or audio.

Enable access to VCHIQ headers for such drivers by moving these headers
under include/linux/raspberrypi with other VCHIQ related headers.

While at it, add the missing videobuf2-v4l2.h include to mmal-common.h
as it references struct vb2_v4l2_buffer.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v2:
- Explain the addition of videobuf2-v4l2.h in the commit message
- Add Kieran's R-by
- No code change
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
index 9bb9943fe3deba7fd27f745b6fb2e0b10daf34cb..34f779679f1d0eff4cfbdc2533db153fb5f8fe2e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4931,6 +4931,7 @@ F:	Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
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


