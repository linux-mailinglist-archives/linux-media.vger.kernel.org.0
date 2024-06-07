Return-Path: <linux-media+bounces-12739-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 411729004ED
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 15:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5506C1C24511
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 13:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D9481991A3;
	Fri,  7 Jun 2024 13:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NwdDlXxo"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AFB194AC6;
	Fri,  7 Jun 2024 13:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717766964; cv=none; b=qXoOBr6d7+SyMVasn03jNirFs8jjRPCvNN36Xtoh+UXjCCzeX9Uhuv3E1EbEKzi/UcgxSw51x3wV+vBa4MmEiBy86wRqTB32TGgOLdbGlYb/n1nTuVqNDG0YKnmdl169vEtUbnS2JUE8IYiB3H10/bwj7tuO6h3poNGdagMvAng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717766964; c=relaxed/simple;
	bh=z5y2B1JAfULyz/eK3dGfFNHOH8mN/la9z22S6Ay0pQ0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tWWsuiHU0Fs1ZTOuCw1/Y7lJEmqVu4PSxKLT4VAJrRJfriirXBgBa1YGV9aisWQKHX+eQkvMtVlSyTZXo8YA1TFSRqSql/p2i0ZCF8Jt6eyHraymNXszFfKwBNB3r5Ne5IC0I6FudhSCbPqxG5YuUBcJQw1q1ylShn9ybA3jhWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=NwdDlXxo; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 457DT3h8085999;
	Fri, 7 Jun 2024 08:29:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717766943;
	bh=FqWdCWfJ5E0cE/02m7Qc63fVHLLQLLlM3Z750/UZJ6g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NwdDlXxoEUBnybM9NnWYIVc2Y2xmjF55dQZp9AgekpF7cImDGNPwqTZ889egLGlku
	 daMg0ib4xnohBVNM7M54y+OWWe9EnXSSE8cFeGIHDlKbGkXhT1+A4M8EbglXbDy56Z
	 y5V5O3RHkNTg6xpN6DP+yu+Gb4CaRIzP4nFzEfAc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 457DT3v1068419
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 7 Jun 2024 08:29:03 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Jun 2024 08:29:03 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Jun 2024 08:29:03 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 457DT2LT111547;
	Fri, 7 Jun 2024 08:29:02 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <benjamin.gaignard@collabora.com>,
        <sebastian.fricke@collabora.com>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>, <devarsht@ti.com>, <andrzej.p@collabora.com>,
        <nicolas@ndufresne.ca>
Subject: [PATCH v13 04/13] media: Documentation: Document v4l2-jpeg helper functions
Date: Fri, 7 Jun 2024 18:59:01 +0530
Message-ID: <20240607132901.3552233-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240607131900.3535250-1-devarsht@ti.com>
References: <20240607131900.3535250-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Enable documentation for v4l2-jpeg header related helper functions which
are useful for parsing jpeg files while decoding or creating jpeg headers
while encoding.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V2->V13: No change (patch introduced in v12)
 Documentation/driver-api/media/v4l2-core.rst |  1 +
 Documentation/driver-api/media/v4l2-jpeg.rst | 10 ++++++++++
 2 files changed, 11 insertions(+)
 create mode 100644 Documentation/driver-api/media/v4l2-jpeg.rst

diff --git a/Documentation/driver-api/media/v4l2-core.rst b/Documentation/driver-api/media/v4l2-core.rst
index 58cba831ade5..ad987c34ad2a 100644
--- a/Documentation/driver-api/media/v4l2-core.rst
+++ b/Documentation/driver-api/media/v4l2-core.rst
@@ -26,3 +26,4 @@ Video4Linux devices
     v4l2-tuner
     v4l2-common
     v4l2-tveeprom
+    v4l2-jpeg
diff --git a/Documentation/driver-api/media/v4l2-jpeg.rst b/Documentation/driver-api/media/v4l2-jpeg.rst
new file mode 100644
index 000000000000..af3bc52f865b
--- /dev/null
+++ b/Documentation/driver-api/media/v4l2-jpeg.rst
@@ -0,0 +1,10 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+V4L2 JPEG header related functions and data structures
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+.. kernel-doc:: include/media/v4l2-jpeg.h
+   :internal:
+
+.. kernel-doc:: drivers/media/v4l2-core/v4l2-jpeg.c
+   :export:
-- 
2.39.1


