Return-Path: <linux-media+bounces-13604-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE5A90DC91
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 21:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57CDF1F23393
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 19:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02CAA1741C3;
	Tue, 18 Jun 2024 19:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NXsAAUga"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA7016DC2E;
	Tue, 18 Jun 2024 19:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718739431; cv=none; b=VJSQPdlgAUfKIclXIxzYzg6OaJhwhjMy6CNBp38tmI60qh0VCGCCgJf0SwBBth1r+GvGs4bH6+ilVi0sbXf98l1ZeanrA8UDDay+90TjjUSlzimFH3wjKdi1m7dIFO93ikEXxJOLZKDbav7L1wcn5yxc+QYDn1wDu29Y5WDHfvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718739431; c=relaxed/simple;
	bh=pVacPQn+erR2SDj/ntM1mvFXzPXDKj5nI3/AoIB3TXU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GIkVO2a2a/oqbQuyj5thrBCihCNTXxy7fwM8U/2XyRjZRE4YG4xvas2AaUVqbtNV36aONii2UyMC63YZRNyjVFQKs5DnUI4vKtXUZ5oC19pbInzFWzLaVY6KCm6PAPF7O7ay6UUjrLoj5EDDi/obUpE42n03PkJ3ykttKLBqexk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=NXsAAUga; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45IJaxrV075761;
	Tue, 18 Jun 2024 14:36:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718739419;
	bh=RaY76pclxOi7Kh6KECJQ237ArOuiV+RkbWN27NXq+d4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NXsAAUgafboBlUHyTiFmCAXR1hRhAyNkLH7b+6QNgX+71uQTR4HlJjtfA1KeRkQYL
	 1iVA56O6zZ+ZgvTzJFvUG0aOH5OGddZVKmdz0jW7lFslTvdVzeKJkrq9L10kJ1IVz1
	 fWklVDj4pZQDP8v8eG9A41SjBPTpkme3nNqDIGW4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45IJaxoS116617
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Jun 2024 14:36:59 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Jun 2024 14:36:58 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Jun 2024 14:36:59 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45IJawZx010552;
	Tue, 18 Jun 2024 14:36:58 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
        <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>, <devarsht@ti.com>, <andrzej.p@collabora.com>,
        <nicolas@ndufresne.ca>, <afd@ti.com>
Subject: [PATCH v14 4/6] media: Documentation: Document v4l2-jpeg helper functions
Date: Wed, 19 Jun 2024 01:06:49 +0530
Message-ID: <20240618193651.2771478-5-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240618193651.2771478-1-devarsht@ti.com>
References: <20240618193651.2771478-1-devarsht@ti.com>
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
V2->V14: No change (patch introduced in v12)

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


