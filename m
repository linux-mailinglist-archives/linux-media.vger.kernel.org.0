Return-Path: <linux-media+bounces-33238-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41139AC1ED7
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 10:38:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C45C1BC6F9F
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 08:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ABE428A1D0;
	Fri, 23 May 2025 08:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KDWcekRU"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05C4212FB7;
	Fri, 23 May 2025 08:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747989497; cv=none; b=XTctcaCdMA+It/cHGbjohqYWYTKG2EkqTRWJWLljXvTJUXPlijUOIPNYgBwsnm4o2YBVRWyoBOk0P9sryRMGPToPy2GE0xezkN/CXjmoPoei6mtnpReIRmhkOE2WxrOhxJpsaB4ETigDK/ckaK1jlwP9tlp07kPzKJjftqjDStg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747989497; c=relaxed/simple;
	bh=Tvr09vHqBxBrquVCgMiv2a1/dDnw3aLkr2QUcZW8Xhc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=okhtHgaE1R59W7xDVVsy6bz9CJkNG/64x1o/lNHc+XNYlXLhCtefEUdUqmdybJj7Vdxt6JtsJnEqrGiENjXyvNBz0skDnvmxPcnnbsPqdEjkQHnddGpUSWKqwWZ8FiMM0kLHeXQPGh8Eo2za0Bg6rxwvHrj7JVoP0cPMfUs9Row=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KDWcekRU; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54N8bmhU900019;
	Fri, 23 May 2025 03:37:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747989468;
	bh=5lFA8hIa4mvlsinpXfo1s8HxiGLQgJz5RPlki7a4QdE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KDWcekRUN0brmDt0IGzhAS74Epe/mvj7lPGZvFQATO0NOnu0BGU0G08VpPLxGRlg8
	 SoIDVzYdCwXWcnBrPz9dvVlY5+t5YhtpLGksGrzLEB3nw8LM3chllhYbjR9GwoCJ+g
	 ozh1bwS+Mtp9Z+fhyd27BJqIix2Qn1GN6Em9/E/0=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54N8bmZn3678489
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 23 May 2025 03:37:48 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 23
 May 2025 03:37:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 23 May 2025 03:37:47 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54N8bbs41130054;
	Fri, 23 May 2025 03:37:44 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <tomi.valkeinen@ideasonboard.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <hverkuil@xs4all.nl>, <sakari.ailus@linux.intel.com>,
        <laurent.pinchart@ideasonboard.com>, <vaishnav.a@ti.com>,
        <u-kumar1@ti.com>, <jai.luthra@linux.dev>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <y-abhilashchandra@ti.com>
Subject: [PATCH 1/2] media: dt-bindings: ti,ds90ub960: Add bindings for DS90UB954-Q1
Date: Fri, 23 May 2025 14:06:54 +0530
Message-ID: <20250523083655.3876005-2-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250523083655.3876005-1-y-abhilashchandra@ti.com>
References: <20250523083655.3876005-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

DS90UB954-Q1 is an FPDLink-III deserializer that is mostly register
compatible with DS90UB960-Q1. The main difference is that it supports
half of the RX and TX ports, i.e. 2x FPDLink RX ports and 1x CSI TX
port. Therefore, add support for DS90UB954 within the existing bindings.

Link: https://www.ti.com/lit/gpn/ds90ub954-q1
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
index 4dcbd2b039a5..b2d4300d7846 100644
--- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
@@ -19,6 +19,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - ti,ds90ub954-q1
       - ti,ds90ub960-q1
       - ti,ds90ub9702-q1
 
-- 
2.34.1


