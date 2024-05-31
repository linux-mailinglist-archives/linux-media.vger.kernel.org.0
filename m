Return-Path: <linux-media+bounces-12361-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD978D67E0
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 19:12:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1039D2884E2
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 17:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C23176AA4;
	Fri, 31 May 2024 17:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="XX7TDT5g"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AAA156242;
	Fri, 31 May 2024 17:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717175565; cv=none; b=FfZ6Dy/BAgukuc1jY1xxNmpcOHVUDRe+2N7j28zqPq5V7pRyrVGzEUN0M5Q2F4e8Ll0I5YpWugeSDjjjOeeVsBELME8mPcbDcbjT8y5vO2JoVfnACLui0eWmoPpityohrsWxhLvw8B0K1e+PjODNTibKLBvUWyanfRRweZVThvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717175565; c=relaxed/simple;
	bh=5Drjhjc40i5t20Q8+Udfpsti+apZMTrzq15BgTAyJ7E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rUjBg+T5jamCEPEE40VVVJhbfrPRMTCwzEqRLWxiSsvBDBStMl27F2QkVgvGHPuwyVuXS9ursmXgjZ0RsfbQBxJgswSj7/6aViY7uloGO28vX3T4d7rxpe90Vn32PrCr9J7tfs36/CpHSXdxQ6YDh+o0wTDuXUoIaPJjPx5or+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=XX7TDT5g; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44VHCMVT034497;
	Fri, 31 May 2024 12:12:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717175542;
	bh=2rNMIILgKlNzeXzRzdQgwxJkUuZXyruFMSuxEMftOW4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=XX7TDT5gsbDbGHNz060zChdoXnucz2ixNZM98WKTloyOR8EyTLdLMSQw4r/WNSxO1
	 nlBUcU4mD9sSZTzB+W4PNSz2gmLNs9Fr63YgOHVTFxxMokkW3MM23FJ1IYIoBxSoR2
	 iyexsdyjtWKjT5WiGdVtwPbF28m4/KokeOF2ZT+Q=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44VHCMoG023460
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 May 2024 12:12:22 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 31
 May 2024 12:12:22 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 31 May 2024 12:12:22 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44VHCLu8051240;
	Fri, 31 May 2024 12:12:21 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>,
        <akpm@linux-foundation.org>, <gregkh@linuxfoundation.org>,
        <andriy.shevchenko@linux.intel.com>, <adobriyan@gmail.com>,
        <jani.nikula@intel.com>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
        <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>, <corbet@lwn.net>,
        <broonie@kernel.org>, <rdunlap@infradead.org>,
        <linux-doc@vger.kernel.org>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>, <devarsht@ti.com>, <andrzej.p@collabora.com>,
        <nicolas@ndufresne.ca>, <davidgow@google.com>, <dlatypov@google.com>
Subject: [PATCH v11 07/11] Documentation: core-api: Add math.h macros and functions
Date: Fri, 31 May 2024 22:42:20 +0530
Message-ID: <20240531171220.1295881-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240531170229.1270828-1-devarsht@ti.com>
References: <20240531170229.1270828-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Add documentation for rounding, scaling, absolute value and difference,
32-bit division related macros and functions exported by math.h header
file.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V11: Fix title for math function header
V10: Patch introduced
V1->V9 (No change)
---
 Documentation/core-api/kernel-api.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/core-api/kernel-api.rst b/Documentation/core-api/kernel-api.rst
index ae92a2571388..7de494e76fa6 100644
--- a/Documentation/core-api/kernel-api.rst
+++ b/Documentation/core-api/kernel-api.rst
@@ -185,6 +185,12 @@ Division Functions
 .. kernel-doc:: lib/math/gcd.c
    :export:
 
+Rounding, absolute value, division and 32-bit scaling functions
+---------------------------------------------------------------
+
+.. kernel-doc:: include/linux/math.h
+   :internal:
+
 UUID/GUID
 ---------
 
-- 
2.39.1


