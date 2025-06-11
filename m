Return-Path: <linux-media+bounces-34496-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5836FAD4EDE
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 10:51:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05D923A5411
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 08:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56AD243964;
	Wed, 11 Jun 2025 08:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="t5Uq0jxV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF53226188;
	Wed, 11 Jun 2025 08:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749631843; cv=none; b=IW13I6lXenOi6COtQpCZc4fxeGAQ+4vpl/OMQ3neQgbCy5jBAqJ4p1403Lh5ru8ltlsMVZmvUtrKERqJWdb77dpKoA9pGAMCe02cekOwzJ8zKtJmV3fr1bF1WRvM+dWiKyHhYVAN++GIJ/2KSQ91w25FcHTfn/V99RcDCp9bDx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749631843; c=relaxed/simple;
	bh=rY9JZiWTa8flqvhHuxOWzbJp4FWYLY2VBOYIrcI6/tU=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=hd5Eif65xu4+I1gvt5oY9dDCEvgpnuxtyLsMdjTfQpccAXafyvs0HLd/gS4wse6Y9NoYlNRsKdnlucVA29GjNoR1yyt+i2JmyRUNGeHpHK6UcjbRLoi1f6lPFFLiEa3ZbcePf//xdVHbrGxIRR3HLrXMs5cZ7DPJC86rTgS7ASY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=t5Uq0jxV; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B8eLIJ019791;
	Wed, 11 Jun 2025 10:50:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=Uj3QeyKhztxkgcSBo8axT2
	De/Yu24CcBkBtJL0BEcLM=; b=t5Uq0jxVuWpnZbc7Uue7ysE33TDWLXRWkV6oBu
	azqlj+pMMhnLpduodnC6+f5bSq09vfsKrb0JaVX04IqN5UvjYiuWi5wYNnIDalf1
	F7g/8xJcLG2uto3qsWb7ufBPjLhkHY7Rq3ip45ZRJ8U9WY3nScARPa8+rrI5I188
	r0f5kYYCm3rsvuAYEfZuRMJrGuuM5T1mpbW9+D32AHnYjcSJMFb7DhJX07goM2gL
	kITZZjdqzOR2erWZC54qoqW8jbqwWZRMkj767goixiOxRQhIn43MRLIQlIZ/dlUe
	1Gb81/GMGNAYlYw4EA+xKt/vnfvgm4bz2LZnE3QoxGGBrzew==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cahre1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 10:50:33 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C5A5340086;
	Wed, 11 Jun 2025 10:48:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6FB6EAFF5E2;
	Wed, 11 Jun 2025 10:48:37 +0200 (CEST)
Received: from localhost (10.252.5.102) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 10:48:37 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH v3 0/4] media: i2c: vd55g1: Miscellaneous fixes
Date: Wed, 11 Jun 2025 10:48:29 +0200
Message-ID: <20250611-fix_vd55g1-v3-0-ef4ecf15ddbc@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN1CSWgC/22Myw6CMBBFf4XM2pI+objyP4wxClPoQko6pNEQ/
 t3CShKX596cswBh9EhwLhaImDz5MGZQpwLa4TH2yHyXGSSXhle8Yc6/76kzphfMKmykrrTtrIE
 sTBHzu8eut8yDpznEz95OYlv/ZpJgnJlGOyGURuWeFxeISprLNrxgCyX5Iwt+kGWWlbSKm1pbL
 eqjvK7rF2y9zJfjAAAA
X-Change-ID: 20250609-fix_vd55g1-83e924648d85
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benjamin
 Mugnier <benjamin.mugnier@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_03,2025-06-10_01,2025-03-28_01

This series provides small fixes and style improvements to the vd55g1
driver. Nothing fancy really, just to keep everything up to date.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
Changes in v3:
- Drop *_def variables
- Remove bad line breaks in commit messages
- Link to v2: https://lore.kernel.org/r/20250610-fix_vd55g1-v2-0-328305748417@foss.st.com

Changes in v2:
- Add commit description to commits missing one
- Link to v1: https://lore.kernel.org/r/20250609-fix_vd55g1-v1-0-594f1134e3fb@foss.st.com

---
Benjamin Mugnier (4):
      media: i2c: vd55g1: Fix RATE macros not being expressed in bps
      media: i2c: vd55g1: Fix return code in vd55g1_enable_streams error path
      media: i2c: vd55g1: Setup sensor external clock before patching
      media: i2c: vd55g1: Use first index of mbus codes array as default

 drivers/media/i2c/vd55g1.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)
---
base-commit: 5e1ff2314797bf53636468a97719a8222deca9ae
change-id: 20250609-fix_vd55g1-83e924648d85

Best regards,
-- 
Benjamin Mugnier <benjamin.mugnier@foss.st.com>


