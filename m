Return-Path: <linux-media+bounces-12514-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2388FB05B
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 12:49:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9248281361
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 10:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C306145345;
	Tue,  4 Jun 2024 10:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="l8/G3Z71"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A77214264A;
	Tue,  4 Jun 2024 10:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717498147; cv=none; b=hmiy7tWdpfLK5sxtAC/BkqOKGYlNNQOiLUx4E/1y+SPAF5uG4LGQWuWOWgME2s18eKPLTjs+sYzQ/vTSYZB2FHh4FwiFGjCXM1mVf3LW6MxkwT5TuwarpnXhZhhnpOXyfJvaPHFJ3vry09zBArLKA2q3hCspDHJZGDLqdM9oSQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717498147; c=relaxed/simple;
	bh=qA42IuP99M+WQEkvR1zru3LETpM8jFSsUvqRCK4L89M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VC5dQMwXsGFRvlGg1MSkSEB29lagsIYNfd77G9Pkkwom5yFaeXPzZ2Kf+NVGdC9NYS6UPwuF0GAYsAvOOFYwG+SUupdFr6Iiej4i2/+rssdppNwe/H1bJ0DNefbbbjL6T8zsnS4ExUmq++Qh4b7TuJoyHG+EE8EuL+1J7hxxe5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=l8/G3Z71; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 454AmvDE004188;
	Tue, 4 Jun 2024 05:48:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717498137;
	bh=n1COGhkEG05iKjvgBqQbDqtOTbsIFAQMFYqt/+3u8Is=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=l8/G3Z71yI9SC7UwGPITu/Sf0WjxhHECjC1GC1UoqNbnlcw+NiH9G6trA66qQsy7G
	 MBGhmO09DfKyGWBIV6uareq083Poel3VywbTTCbTtxGC68LlhEzSPKxilHCifxc/Dr
	 9h5qIjjCBIH8t4giDireqhky38hLnUNLD3kl/Ra8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 454AmvtG030385
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Jun 2024 05:48:57 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Jun 2024 05:48:57 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Jun 2024 05:48:57 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 454AmuD2115360;
	Tue, 4 Jun 2024 05:48:56 -0500
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
Subject: [PATCH v12 04/13] media: Documentation: Document v4l2-jpeg helper functions
Date: Tue, 4 Jun 2024 16:18:55 +0530
Message-ID: <20240604104855.2249658-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240604104001.2235082-1-devarsht@ti.com>
References: <20240604104001.2235082-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Enable documentation for v4l2-jpeg header relate helper functions which are
useful for parsing jpeg files while decoding or creating jpeg headers while
encoding.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V2->V12: No change (patch introduced in v12)
---
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


