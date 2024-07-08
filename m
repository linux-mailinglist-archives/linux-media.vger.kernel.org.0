Return-Path: <linux-media+bounces-14709-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4B592A6A7
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2024 18:01:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 052D61F22799
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2024 16:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5DF714A61A;
	Mon,  8 Jul 2024 16:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="usWw0mJd"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E8A149011;
	Mon,  8 Jul 2024 16:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720454416; cv=none; b=MlXxtkGxhYpZCpshf8jlLIZBTe6nM8bdIx2D3x7NUVvdUUeqyphGclu/YoWXhlR7RTFpoONGoq/SMxb54XfEi6n6smv0G0tinum8WcptUgkggxz8kM0BjZb3Op0vbN3bUHlDQW5lE3gxttgw9eH+57Y0jeYQoEIbgB+zEfDAwWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720454416; c=relaxed/simple;
	bh=fi+XvasGGHunsLY75qdVarZgGR1hm7wrhmPn5qChLY4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g8FX4rWc9MVd94ZstXCHbdtDR9b9+I936PrwPZqJoJoDIH2pyN5yH2SyZu5RbIiwLWUo1VsKepbV4aWWLk3x/UGoYj7YURmv6w6aTRNgzTkcouwKUkgUhiZkUzipolGK+vmikPqCY6gf809FiOVcieIowlDsho2VzhXg+22oFUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=usWw0mJd; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 468Fxnl9011466;
	Mon, 8 Jul 2024 10:59:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720454389;
	bh=3+Zpq0TmuuO8rsV6+0UQWZ4J5HPyZ82smSsNdSbfSg8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=usWw0mJd6/Tt9GwHSC+iPv5GC+Itk4pgMGXKPP31lmILlf8uyc5iFEzdZFDVaBcjj
	 Hdj+QdUf9w5n0HhKLQPWxZ1rmuGmmvKo8amNkauYysd7nDLXsnz5jCUI0kqXreqjqu
	 58rDsIlJ+hiPbWhDODjk+jGoLVKBhl0xVOUxdFGs=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 468Fxn8d040633
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jul 2024 10:59:49 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 8
 Jul 2024 10:59:48 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 8 Jul 2024 10:59:48 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 468FxmY3033351;
	Mon, 8 Jul 2024 10:59:48 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sebastian.fricke@collabora.com>, <andriy.shevchenko@linux.intel.com>,
        <jani.nikula@intel.com>, <jirislaby@kernel.org>, <corbet@lwn.net>,
        <broonie@kernel.org>, <rdunlap@infradead.org>,
        <linux-doc@vger.kernel.org>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>, <devarsht@ti.com>, <andi.shyti@linux.intel.com>,
        <nicolas@ndufresne.ca>, <davidgow@google.com>, <dlatypov@google.com>
Subject: [PATCH 3/6] Documentation: core-api: Add math.h macros and functions
Date: Mon, 8 Jul 2024 21:29:40 +0530
Message-ID: <20240708155943.2314427-4-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240708155943.2314427-1-devarsht@ti.com>
References: <20240708155943.2314427-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Add documentation for rounding, scaling, absolute value and 32-bit division
related macros and functions exported by math.h header file.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
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


