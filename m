Return-Path: <linux-media+bounces-16839-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5766895F4AE
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 17:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE945B22415
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 15:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640C1194C6C;
	Mon, 26 Aug 2024 15:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mM4k2C4F"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4941946D1;
	Mon, 26 Aug 2024 15:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724684931; cv=none; b=rwnrzvIHSJQv8pOi0v6BWi8BGQf3Ui2k3X6OYwKchpy2+eX+XmOjvnwqrYglzFpb4j/e3riebO8PkZNKU7iyn4+h/3/PhCf6ygtUPGv76cu77hY8/H4oKFl7HvGpXuNaJ2hfHDU1g88pABWIRzN2XGDi1chQfRCAlKmKBgvAe88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724684931; c=relaxed/simple;
	bh=9ZfTdGPAahDa6pggQC7bujplRZ2DvTYkrA504z1xvYo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HzLlUpSg790rj5/NekNb62HpbrN14SY0DHnB2cOeO6XAtUTaCzWDhdWhZ7EcRl8VSjCGXFFQ9Ittcu6g7wICESNHbElAiSgqe7fF6BNHZ2OODO7KHsyxbzGxnsEKauZsVwxbkMHoxfGih8pU12rmMeuDAvQYyEPXhWWi+4m9Hco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=mM4k2C4F; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47QF8S8n068662;
	Mon, 26 Aug 2024 10:08:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724684909;
	bh=gApDMJKLE8AFjcZew5jNM4hihhXfmbUsKyWJrrfjv0g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=mM4k2C4F3eaU+JsF0cI4hZtuPzm6onxCwtYzW6hhIRonH4IOEpp0hWWCVbL354Kn1
	 LV8KKaRtiMpcNl0lGb/bnStB7igLA/9svvc/2NfRG577AnpvOCFPpQUohMa+tuc8t6
	 Ae4g0VjCINKxy6iTILbLFqciNpUaRLWGd46QuwN4=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47QF8SaX124036
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 26 Aug 2024 10:08:28 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 26
 Aug 2024 10:08:28 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 26 Aug 2024 10:08:28 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47QF8RDl100560;
	Mon, 26 Aug 2024 10:08:28 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sebastian.fricke@collabora.com>, <linux-doc@vger.kernel.org>
CC: <praneeth@ti.com>, <nm@ti.com>, <vigneshr@ti.com>, <s-jain1@ti.com>,
        <r-donadkar@ti.com>, <b-brnich@ti.com>, <detheridge@ti.com>,
        <p-mantena@ti.com>, <vijayp@ti.com>, <devarsht@ti.com>,
        <andi.shyti@linux.intel.com>, <nicolas@ndufresne.ca>,
        <andriy.shevchenko@linux.intel.com>, <jirislaby@kernel.org>,
        <davidgow@google.com>, <dlatypov@google.com>, <corbet@lwn.net>,
        <broonie@kernel.org>, <jani.nikula@intel.com>, <rdunlap@infradead.org>,
        <nik.borisov@suse.com>, <Dave.Martin@arm.com>
Subject: [PATCH v2 3/6] Documentation: core-api: Add math.h macros and functions
Date: Mon, 26 Aug 2024 20:38:19 +0530
Message-ID: <20240826150822.4057164-4-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240826150822.4057164-1-devarsht@ti.com>
References: <20240826150822.4057164-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Add documentation for rounding, absolute value, division and 32-bit scaling
related macros and functions exported by math.h header file.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V2: Update commit message
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


