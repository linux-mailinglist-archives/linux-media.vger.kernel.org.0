Return-Path: <linux-media+bounces-44365-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E2CBD810B
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 10:04:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 316751920AD4
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 08:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12D513101A2;
	Tue, 14 Oct 2025 08:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KOq5kxys"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F0B30FC34;
	Tue, 14 Oct 2025 08:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760428893; cv=none; b=qpw6CF+LDlg2awd0OhlBRGNaeUds+AIbl+4DiOn+32vXTbNMOJ+xBqu/vlFMjpqEdU+ZXdp+nWsnMlWQPHRWohSNvdEbmd/p5Rlt/1G9wrjJ+HRc15kqQpcXy5eC029HgBjUg8PQKZOof7XWQQUSCKC78EeKwgO4Uu02fh+xgYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760428893; c=relaxed/simple;
	bh=6nIA8PMBxNyMFZpIPqZNTn55txgmaas6G6JxqTpnEHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V8xwNDnBQ/dyPCLOvabNaWR70uE+vNg9DQGOnF4y0fibyDsiH96x8u3XLaVjiav80uQg15PvAJRqc9OpYioHHkB8/5YZH3zOIw+nEUhdEER9O+cI7Xqsm0Lc9fi3lGE9aON1LD1gzYAwiPaoJfmqbb3aYktCOiDRcXaadcjmH2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KOq5kxys; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.182] (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 214F711DD;
	Tue, 14 Oct 2025 09:59:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760428778;
	bh=6nIA8PMBxNyMFZpIPqZNTn55txgmaas6G6JxqTpnEHo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KOq5kxys/GQVjZaTmVcPbI7GlewLn7ndBht/nkIoU/Pp9XZpzmb6zeqwvlPtTP0c2
	 x2x2x500os0ib8eIcMQX8Jgw7GeoD0QDW895QAfUaAh8gotqvC4ExvPiWsixN27Iiu
	 y4tKDd3lBfsmaueDRK+tGmKyLovK1Y8dQ9OVE+uQ=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 14 Oct 2025 10:01:00 +0200
Subject: [PATCH v7 8/8] media: Documentation: kapi: Add v4l2 generic ISP
 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-extensible-parameters-validation-v7-8-6628bed5ca98@ideasonboard.com>
References: <20251014-extensible-parameters-validation-v7-0-6628bed5ca98@ideasonboard.com>
In-Reply-To: <20251014-extensible-parameters-validation-v7-0-6628bed5ca98@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4037;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=6nIA8PMBxNyMFZpIPqZNTn55txgmaas6G6JxqTpnEHo=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBo7gNHjvfYwLqh8xguj4uruLNRXZauUpFikLfZE
 0nOZoHG6R2JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaO4DRwAKCRByNAaPFqFW
 PAEcD/9+utt/ZXzF0biLyHM02WwO32AyOewfdWDaVTIeh8P+7PWTZGaoESXUtbB9ms+ZrnY80cd
 RsSwZlxkVwah7tnGqiEtgTnVi5uhuhVL09w0ueV7EOXYcwEmI/GlcW1ri4cZLrKPj2oP/d2+gOu
 cK1qizym1P0R8+O4MUrVWTRiyqZiRdXUZYcHkxojLiSWRmg7Rd+nwf1BkwgvJiNuSi9oQuTHejJ
 tYuE06/EAfAtu6L69lxbt/hpbXHOh8wtQnsK/EzbU1qmMj4QdnrczmxEQlWH5PrRGJZ11sCaChd
 Op8akjgIzC/BnV754MalKFo/+DKyIOf6jbD3aMSaWTfKvvw9iD8v3kd1Z0eWZXfXEkWTnz2LVmz
 K/BVuGlI5a5VRpc0CY64HmNQh6j+qQDR1EWNsN7vNY2h+1f3Cpyxau2FVvrxHCpMDFLFybVIioh
 FIyWQc1jnCiGMdxcwv8wdI1MGK/kiMsdCYXXovIFLmll3qrKnuE4J7QBDLIy6lTSYyU4PTY6kx/
 iRa3a6NNqxlK4d+z+9ZFc5uA1OprvNT+baMKKS1ywW4zSf0KDuAYyeKLdC7I0ZSPClZdEYKMYYI
 2J2jh5qkIf0J1D2RgDG3hrT4wkERipEQE4vLfi2sLd5W+AMCqYifM5M85oeVn9nYz9exyi2+EZ+
 3xUs9y3ZEtl56YA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add to the driver-api documentation the v4l2-isp.h types and
helpers documentation.

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
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
index 0000000000000000000000000000000000000000..42c2550602979609e92a09e3cd1fe3dcbafd6416
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
+Each ISP driver defines its own metadata capture format for parameters and
+a metadata output format for statistics. The buffer layout is realized by a
+set of C structures that reflects the registers layout. The number and types
+of C structures is fixed by the format definition and becomes part of the Linux
+kernel uAPI/uABI interface.
+
+Because of the hard requirement of backward compatibility when extending the
+user API/ABI interface, modifying an ISP driver capture or output metadata
+format after it has been accepted by mainline is very hard if not impossible.
+
+It generally happens, in facts, that after the first accepted revision of an
+ISP driver the buffer layout need to be modified, either to support new hardware
+blocks, fix bugs found later on or support different revisions of the same IP.
+
+Each of these situation would require defining a new metadata format, making it
+really hard to maintain and extend drivers and requiring userspace to use a
+the correct format depending on the kernel revision in use.
+
+V4L2 ISP configuration parameters
+=================================
+
+For these reasons, Video4Linux2 defines generic types for ISP configuration
+parameters and statistics. Drivers are still expected to define their own
+formats for their metadata output and capture nodes, but the buffer layout can
+be defined using the extensible and versioned types defined by
+include/uapi/linux/media/v4l2-isp.h.
+
+Drivers are expected to provide the definitions of their supported ISP blocks,
+the control flags and the expected maximum size of a buffer.
+
+For driver developers a set of helper functions to assist them with validation
+of the buffer received from userspace is available in the form of helper
+functions in drivers/media/v4l2-core/v4l2-isp.c
+
+V4L2 ISP support driver documentation
+=====================================
+.. kernel-doc:: include/media/v4l2-isp.h
diff --git a/MAINTAINERS b/MAINTAINERS
index 59ab4a34f72c0430a8d7966942acb2242ad923ca..3cc24092995bcb01051cc301ca212c32938cf745 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26857,6 +26857,7 @@ V4L2 GENERIC ISP PARAMETERS AND STATISTIC FORMATS
 M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/driver-api/media/v4l2-isp.rst
 F:	Documentation/userspace-api/media/v4l/v4l2-isp.rst
 F:	drivers/media/v4l2-core/v4l2-isp.c
 F:	include/media/v4l2-isp.h

-- 
2.51.0


