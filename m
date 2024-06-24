Return-Path: <linux-media+bounces-14025-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E973914527
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 10:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2967D284A1A
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 08:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB4E12F5A5;
	Mon, 24 Jun 2024 08:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Qlt54Ecx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCC484D03;
	Mon, 24 Jun 2024 08:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719218582; cv=none; b=hu3moUhG+uhfCC4A38r1piStqkf3YPA6tfKsko5p8EAOEPhmkdjhaYMQDjfG0fxYIkgEH06sB7hJk6icILOR2nWpeyAOIIHyO8KGcysXwGQFocnScY6/P/xLChm1HuqAFFN0spxX3Pu4hSPr5yA0cIbROvj74t4Q4u+IsTXYZlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719218582; c=relaxed/simple;
	bh=1Ql/rPJr9B//lnVoSBXI6kmGKjaCsxZKPQJn0Q/2P7E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VhFGhMOT7JC7tBObRs9bdk+YGbZ2EKPIWLfICCwJ7Jejq2cGk11J0jl2xbXw14YvGpmiC2uwntR+CIZaVcw3F7GDTf1IgjuZe7N+sIoYnSljdpPfuk4R77YyShgvwaEQWc9J3Seai6Gq+yrz+WAIcSU//9Ij6lMpibXWYUbVZ3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Qlt54Ecx; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45O82p4Y006217;
	Mon, 24 Jun 2024 10:42:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=AeCFDncPm+RmmKekJr5ls2
	XtImCTJaOsCJTIji/uvL0=; b=Qlt54Ecxz/AioprZnMS6IBTR4WI7IwO74hsiZw
	ooMmltq5IR7S8dCj7knsL0Fmdwyqnc39lfqgij+C2Bdb0CvY3It7PYf48rDNW+0D
	3wpWjhSn6I0TILWpq3drbChLOTpgcte9/0HD1jcTA/6hzHYJZAP886j+oxpFJKrO
	floMB63eWxqXMRPULya+Wat58WixUln7pF+6KAF3MPJ9hmaw6EZZE+FGtNdg3PwW
	E+wgOW73TXyoDmhDwJs0Cjp5CEreUxAkSzKBH6ma7szU7b6vKkCtWi7VbbnOnVhl
	OJQTLHRA2DD6b9Iq9W+VdPIuftrChjd1hQ5iQCWEyUErs00A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yx860by2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 10:42:37 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D804A4002D;
	Mon, 24 Jun 2024 10:42:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C6134209EC7;
	Mon, 24 Jun 2024 10:41:53 +0200 (CEST)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 24 Jun
 2024 10:41:53 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Alain Volmat
	<alain.volmat@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC: <stable@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: stm32: dcmipp: correct error handling in dcmipp_create_subdevs
Date: Mon, 24 Jun 2024 10:41:22 +0200
Message-ID: <20240624084123.3009122-1-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_07,2024-06-21_01,2024-05-17_01

Correct error handling within the dcmipp_create_subdevs by properly
decrementing the i counter when releasing the subdeves.

Fixes: 28e0f3772296 ("media: stm32-dcmipp: STM32 DCMIPP camera interface driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index 4acc3b90d03a..4924ee36cfda 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -202,7 +202,7 @@ static int dcmipp_create_subdevs(struct dcmipp_device *dcmipp)
 	return 0;
 
 err_init_entity:
-	while (i > 0)
+	while (i-- > 0)
 		dcmipp->pipe_cfg->ents[i - 1].release(dcmipp->entity[i - 1]);
 	return ret;
 }
-- 
2.25.1


