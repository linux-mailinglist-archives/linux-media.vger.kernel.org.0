Return-Path: <linux-media+bounces-18494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 717949840F5
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 10:47:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E54C283EDA
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 08:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C32C15575C;
	Tue, 24 Sep 2024 08:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="LRkcb71X"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7979154BEC;
	Tue, 24 Sep 2024 08:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727167582; cv=pass; b=cJa5HcjhQXvVJS/aPfg/6BNdVrabUcK2tx8wisgHhtlYXl7K9C/B6bpUFs1K8g/TsgjFfkIAM4yfoo2E9iLBFJO4pgOTl8jXIUmQM04oPOguI5GAS9q3xonZhxefzggAy8MhFh42AJHBibojIQCUUvY1UbKGC+4N158X7r156M0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727167582; c=relaxed/simple;
	bh=g5pHQd73mBrP9X400nvFyG13JPUFcrrvEIFvGsi6JJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fay3M8MHyJz0C7hBHoXdRTlZy2g/YTLV3dQpN1j5byyBuAlyBRxDz5gghEiavZ0LVptqalG8GElLlyiSQOw+FR9xkcDU7NMp1bakLHg12X/JWFH0dqFDO5z2dASTKRaX3PeyPfRiTgmNt/hukuW04mM03Bd773cjgqZk0eJZOwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=LRkcb71X; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1727167570; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=e19HJynkWYey2nLX2jSPsv8MPoSGJwUYYOQ0t9aQfYcjPiqzHeI2IBTA+ViwTNQI3vRiU+LUNEPW3e00+7S43l6qV/5pzbaq/Lhkg61bxPblxhM1Q3MBJ3A5lkGVKDQvM1pOahnrit2UGPJickyKGIB8WnNxurk4XKdi7D52wcM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1727167570; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=inM8DCo47rhJ9DWN7K17yz15/g158T05bva4qurTEO8=; 
	b=QS337cZ0Nqvr8CpkMYEByq2ij8tPjAnuALBFP14kK1C4DLkxjl9l9tP12gCXJ5LxkuZYxt0f7tPeBivglEGo0ycQwRJqhb6gIpq80ZkigdNjksmKJMCIuftD/lsm+pNFLG3LMjZG9D1zAcDDIAkCm0nn0fUyX+IAw3vwH+S1kyQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727167570;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=inM8DCo47rhJ9DWN7K17yz15/g158T05bva4qurTEO8=;
	b=LRkcb71XsV5CNL0cQEqRjOWfFv+Q7LBnaM05eKdPPmTNOOZ0Yvna2azv9SGVZIXZ
	Yifw4SrXydeIXOl70rZYSENHSxuNDyTna/csBCwPyg/ZdD62fFHDTtIYlZw2bug/m7l
	nmoQtNoA18rLhcLAPFZYaf/2oh7r6DOXf1lsQJn4=
Received: by mx.zohomail.com with SMTPS id 1727167569291882.4945000950047;
	Tue, 24 Sep 2024 01:46:09 -0700 (PDT)
From: Sebastian Fricke <sebastian.fricke@collabora.com>
Date: Tue, 24 Sep 2024 10:45:57 +0200
Subject: [PATCH RFC v2 1/3] docs: media: Create separate documentation folder
 for media
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-b4-media_docs_improve-v2-1-66318b2da726@collabora.com>
References: <20240529-b4-media_docs_improve-v2-0-66318b2da726@collabora.com>
In-Reply-To: <20240529-b4-media_docs_improve-v2-0-66318b2da726@collabora.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, mauro.chehab@linux.intel.com, kernel@collabora.com,
 bob.beckett@collabora.com, nicolas.dufresne@collabora.com,
 Sebastian Fricke <sebastian.fricke@collabora.com>
X-Mailer: b4 0.11.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727167560; l=1395;
 i=sebastian.fricke@collabora.com; s=linux-media; h=from:subject:message-id;
 bh=g5pHQd73mBrP9X400nvFyG13JPUFcrrvEIFvGsi6JJg=;
 b=962z/VeePp2Z9kjUmz5+4COaj2/aVPkFSYtnZCh7/DHQ+8ymMvewOOzJc/syMShaZpRf3Y7cIKON
 vdnzHcpIAecHQwuRbovbQP9XcbftPMs6ROdwxeKwKjndQwqLS/6x
X-Developer-Key: i=sebastian.fricke@collabora.com; a=ed25519;
 pk=pYXedPwrTtErcj7ERYeo/IpTrpe4QbJuEzSB52fslBg=
X-ZohoMailClient: External

The media subsystem currently only maintains a set of Kernel API
documentations, with the intent of adding guides for the subsystem a
separate location is required. Create an empty folder with an index and
embed it into the subsystem listing.

Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
---
 Documentation/media/index.rst    | 19 +++++++++++++++++++
 Documentation/subsystem-apis.rst |  1 +
 2 files changed, 20 insertions(+)

diff --git a/Documentation/media/index.rst b/Documentation/media/index.rst
new file mode 100644
index 000000000000..d056a9e99dca
--- /dev/null
+++ b/Documentation/media/index.rst
@@ -0,0 +1,19 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=============================
+Media Subsystem Documentation
+=============================
+
+.. toctree::
+   :maxdepth: 2
+
+   ../userspace-api/media/index
+   ../driver-api/media/index.rst
+   ../admin-guide/media/index
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
diff --git a/Documentation/subsystem-apis.rst b/Documentation/subsystem-apis.rst
index 74af50d2ef7f..5a1d90fd1af6 100644
--- a/Documentation/subsystem-apis.rst
+++ b/Documentation/subsystem-apis.rst
@@ -33,6 +33,7 @@ Human interfaces
    input/index
    hid/index
    sound/index
+   media/index
    gpu/index
    fb/index
    leds/index

-- 
2.25.1

