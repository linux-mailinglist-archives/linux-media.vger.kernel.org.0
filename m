Return-Path: <linux-media+bounces-45005-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D895DBEFEE5
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 10:27:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D90783E34EC
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 08:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 364B02F0688;
	Mon, 20 Oct 2025 08:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Z+Fc3I3k"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D6E2EFD86;
	Mon, 20 Oct 2025 08:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760948718; cv=none; b=S8upzrwNayn4OcruOn1YJY2ZptR0jAwpgjy2C31PWz2ykmTCoNX0mBi8CZ+vQPV04kyd8lf1L6anwZWFUjHQVNcIW4QPJK+CkJ4kL0bLPmcCuOjubWQ4C6f9czfioHYEU0rqNYe7BvtK4Wm/eUzi2h2S+upaIGkLDC7zVtDSEZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760948718; c=relaxed/simple;
	bh=aphqrnjnIHEaL1McVyPsfsz1ESyLlGYYkbJKH8NlHMg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U55Q96wtZmWAcNVUani3BMHnSqURAG9OxR3TgdfE72OWhmdJryNq4UVc+l9cPuo6hoJqQxdpFGYOoGjL8lRXNCIKiLaG0kioqAvAMQ0yvhCoIIYNxhS9P2a2l8tvYIBEw58/Umuy8cf7DFMk4Mism4pvzpiKPuZrHgE8F6EnF8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Z+Fc3I3k; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F8001116;
	Mon, 20 Oct 2025 10:23:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760948603;
	bh=aphqrnjnIHEaL1McVyPsfsz1ESyLlGYYkbJKH8NlHMg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z+Fc3I3kwwM42ZJWD1OKt3Rcuuawr4d2kcM1vAoJfi35Qq4959AiJVgxr1XH+gG7d
	 s4SVp5poG+AZXZyizdsbvZLRLQzEbZakvE98xyC0yTtnzujJOtb/hYI18Dx1WOnJ1k
	 CljDBws2gl4v8LfVnlWUpnhM9PRt1oUIM63gi4D8=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Mon, 20 Oct 2025 10:24:54 +0200
Subject: [PATCH v8 8/8] media: Documentation: kapi: Add v4l2 generic ISP
 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-extensible-parameters-validation-v8-8-afba4ba7b42d@ideasonboard.com>
References: <20251020-extensible-parameters-validation-v8-0-afba4ba7b42d@ideasonboard.com>
In-Reply-To: <20251020-extensible-parameters-validation-v8-0-afba4ba7b42d@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4112;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=aphqrnjnIHEaL1McVyPsfsz1ESyLlGYYkbJKH8NlHMg=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBo9fHYLuapdMSCrbxyTfvkamWN3atlzp6On/gWa
 Ullsu6bJlWJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaPXx2AAKCRByNAaPFqFW
 PMebD/40IT9AUTtqWZ1ILnE5CPIbzJn7CE5LICF8T/arumBlmCly/EBuhRr2Cc5lMTkqPq8BIR3
 JzCsZmxP9yTspZctBCJ+ZvHC3GSur4e2GXJgJQa2DW98j6MJpx20A1q6Lb1+/hWag4G+xk1/PH+
 yJfj/eZ3MOQStCijZOadI+l5jrUa70H3dzY2UCiB7FFog2/YMYFclF3LBe41lNNPt8qot0Trc65
 bpmu56bfff00/AwdmoWkahb34YVztUxsuFkwnAUVqNlUGGy3DnTlWsRwTYdlGyUax3mbnWKJE0I
 7TfqzvONQ+0SZmHpu8vQTIa65cjA6WgyuhnhMnnOGaei4mHelvbAjJi+IuUrZXgyvwbJ3tKY66E
 jIf/eDzd+LiDltTTWTc68j5mHybg0USzv9dObAvWpxJ+gEloSVhxD6upum5sVSGFhRsLATswqnA
 1FdGI18PiuzQ0rCcuQbrdcwA9IxAzbzhEHQ6fqpd9F1aWZOQklr7rGssEDY+GVNuotQztE9SlsG
 YJ59FjfbRShIG2PZKk6w1JE0y3VhsCj29fSwxeu3efR95MAp1iQdL7AscBI0yeoCHnBR+4cbWNu
 XK0E6QC7MbsXwrLJpyLsknPdH8dDGKO5a9V2JdICIWdOED3hRTT1SBKiAXrDKplYNL6QsPWJWVe
 imETzVRPh5GckEA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add to the driver-api documentation the v4l2-isp.h types and
helpers documentation.

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 Documentation/driver-api/media/v4l2-core.rst |  1 +
 Documentation/driver-api/media/v4l2-isp.rst  | 49 ++++++++++++++++++++++++++++
 MAINTAINERS                                  |  1 +
 3 files changed, 51 insertions(+)

diff --git a/Documentation/driver-api/media/v4l2-core.rst b/Documentation/driver-api/media/v4l2-core.rst
index ad987c34ad2a8460bb95e97adc4d850d624e0b81..a5f5102c64cca57b57b54ab95882b26286fb27de 100644
--- a/Documentation/driver-api/media/v4l2-core.rst
+++ b/Documentation/driver-api/media/v4l2-core.rst
@@ -27,3 +27,4 @@ Video4Linux devices
     v4l2-common
     v4l2-tveeprom
     v4l2-jpeg
+    v4l2-isp
diff --git a/Documentation/driver-api/media/v4l2-isp.rst b/Documentation/driver-api/media/v4l2-isp.rst
new file mode 100644
index 0000000000000000000000000000000000000000..150ba39b257b23e6a8ca1a348047f5b55588fbf7
--- /dev/null
+++ b/Documentation/driver-api/media/v4l2-isp.rst
@@ -0,0 +1,49 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+V4L2 generic ISP parameters and statistics support
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Design rationale
+================
+
+ISP configuration parameters and statistics are processed and collected by
+drivers and exchanged with userspace through data types that usually
+reflect the ISP peripheral registers layout.
+
+Each ISP driver defines its own metadata output format for parameters and
+a metadata capture format for statistics. The buffer layout is realized by a
+set of C structures that reflects the registers layout. The number and types
+of C structures is fixed by the format definition and becomes part of the Linux
+kernel uAPI/uABI interface.
+
+Because of the hard requirement of backward compatibility when extending the
+user API/ABI interface, modifying an ISP driver capture or output metadata
+format after it has been accepted by mainline is very hard if not impossible.
+
+It generally happens, in fact, that after the first accepted revision of an ISP
+driver the buffers layout need to be modified, either to support new hardware
+blocks, to fix bugs or to support different revisions of the hardware.
+
+Each of these situations would require defining a new metadata format, making it
+really hard to maintain and extend drivers and requiring userspace to use
+the correct format depending on the kernel revision in use.
+
+V4L2 ISP configuration parameters
+=================================
+
+For these reasons, Video4Linux2 defines generic types for ISP configuration
+parameters and statistics. Drivers are still expected to define their own
+formats for their metadata output and capture nodes, but the buffers layout can
+be defined using the extensible and versioned types defined by
+include/uapi/linux/media/v4l2-isp.h.
+
+Drivers are expected to provide the definitions of their supported ISP blocks,
+the control flags and the expected maximum size of a buffer.
+
+For driver developers a set of helper functions to assist them with validation
+of the buffer received from userspace is available in
+drivers/media/v4l2-core/v4l2-isp.c
+
+V4L2 ISP support driver documentation
+=====================================
+.. kernel-doc:: include/media/v4l2-isp.h
diff --git a/MAINTAINERS b/MAINTAINERS
index 5833f82caa7f2f734bb0e1be144ade2109b23988..cd1137c7754538d02bd72521fec6c89e082246d2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26856,6 +26856,7 @@ V4L2 GENERIC ISP PARAMETERS AND STATISTIC FORMATS
 M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/driver-api/media/v4l2-isp.rst
 F:	Documentation/userspace-api/media/v4l/v4l2-isp.rst
 F:	drivers/media/v4l2-core/v4l2-isp.c
 F:	include/media/v4l2-isp.h

-- 
2.51.0


