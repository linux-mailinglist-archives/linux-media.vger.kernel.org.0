Return-Path: <linux-media+bounces-34385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE48AD2E5E
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 09:09:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F2407A85E2
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 07:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B66D280005;
	Tue, 10 Jun 2025 07:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="BJmhOMka"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC48A27AC3A;
	Tue, 10 Jun 2025 07:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749539327; cv=none; b=cZxPd/2ire0YMoKH+WISr18Y5KoZIfjiDlgO2gqzfsIedIeaCIHNOoTrcfOQ7c4AUPdefKDI2gVyvF6QMwzqMThwfAZ90ksn5iXKbJM1V2X+/afLsg/XGa4xor5y0DEbfhxZ2ksLN7HHd7Gbq+dKsbI89Q5KlDzqfPViiM7xOZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749539327; c=relaxed/simple;
	bh=ctclJjwPRvKlZ5vso2YhYgBATEQ+iorHkXYmkKRwF24=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=Mqp/jUW8YvSN6Z3Nal/+MacN1GeyMM4eRQIBCWwY4JRBseS3tw905SAKidhhxShILmRVP+cbYuMk8ce48J80eAG3dBrVRQyNMS4t4NF6bvml7pOErA6GCo32BnO5rJg81mLVsXVTCbRHJPRkeXxYnJqb1i5pR3Z7D1gUEmPcMv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=BJmhOMka; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A6PKiI000357;
	Tue, 10 Jun 2025 09:08:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=dnABWqWMBCcA0NUtefsRJT
	JNcmR8vqEmU2X/B+smDDA=; b=BJmhOMkaqxYpQvwxke0i7ybYtWWE+SLF5HRoG6
	YOivDwzGSbrApzghUMoLF77X4J6CEZ/AWxjejQla1YWjg5aQDQ1fJUcyOnA3/OmP
	jYI+LXexjOjc/Nar+PWyRmiAx/0HaBAbXZi8U5Gsq7GcOwE0BcJR5DZlUGIjuB/y
	V/HEHhU9IVg8zw+5PRmldZq3pIDKPijMgT0rXzuwPykfTxCspYCqCZpE5zOnqHB1
	5KvpMk9v0cprwMNvdkbi3Lps3KdcnGFlKeAqos3yNxj0irwFbVrnIQ44atm+2stT
	Wn0MniDMszAiojy0Cha7/ZLYKETL8QTZ7HdCXMi+TUS/uXgA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474aumbgq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 09:08:36 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 69E014004A;
	Tue, 10 Jun 2025 09:07:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1FC86B9DCDF;
	Tue, 10 Jun 2025 09:07:42 +0200 (CEST)
Received: from localhost (10.130.73.167) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 09:07:41 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH v2 0/4] media: i2c: vd55g1: Miscellaneous fixes
Date: Tue, 10 Jun 2025 09:07:40 +0200
Message-ID: <20250610-fix_vd55g1-v2-0-328305748417@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALzZR2gC/22MywrCMBBFf6XM2pQ8S+LK/5Ai2kzaLGwkU4JS8
 u/Grl2eezlnB8IckeDc7ZCxRIppbSBPHUzLfZ2RRd8YJJeGD9yxEN+34o2ZBbMKndSDtt4aaMI
 rY3uP2HVsvETaUv4c7SJ+699MEYwz43QQQmlU4XEJiainrZ/SE8Za6xcxtDF6pgAAAA==
X-Change-ID: 20250609-fix_vd55g1-83e924648d85
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benjamin
 Mugnier <benjamin.mugnier@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_02,2025-06-09_02,2025-03-28_01

This series provides small fixes and style improvements to the vd55g1
driver.
Nothing fancy really, just to keep everything up to date.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
Changes in v2:
- Add commit description to commits missing one
- Link to v1: https://lore.kernel.org/r/20250609-fix_vd55g1-v1-0-594f1134e3fb@foss.st.com

---
Benjamin Mugnier (4):
      media: i2c: vd55g1: Fix RATE macros not being expressed in bps
      media: i2c: vd55g1: Fix return code in vd55g1_enable_streams error path
      media: i2c: vd55g1: Setup sensor external clock before patching
      media: i2c: vd55g1: Use first index of mbus codes array as default

 drivers/media/i2c/vd55g1.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)
---
base-commit: 5e1ff2314797bf53636468a97719a8222deca9ae
change-id: 20250609-fix_vd55g1-83e924648d85

Best regards,
-- 
Benjamin Mugnier <benjamin.mugnier@foss.st.com>


