Return-Path: <linux-media+bounces-19240-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C28DC9947B4
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 13:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81332281D60
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 11:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C16A31DF27A;
	Tue,  8 Oct 2024 11:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="JpuS9ZM/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2535F1DEFE5;
	Tue,  8 Oct 2024 11:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728388207; cv=none; b=oX00vgg/P2Osesixgqrr9+du15qcfkeFzg0wY4LbJ9jYq6/Sd/ZBhd1/XqCKZJSPY7jkhTkPXkhX93bYWvPKKqF23mDF6cIEiIUJyLZ+ZsiAs1yDcnsgar7YBLUPC4mGFpseya5X9P+nstr2wJVUJazRLUI8Hzh5BvQQGpwDAt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728388207; c=relaxed/simple;
	bh=2m9xFBkVVzUPGVRnZVepjHT6KzbZgjuYn5EssjLEcv4=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=rVw2NqXMmls0t5KYPm9kYIfzypYawbJtD+am2dB9Gl17aP/rxB8bsilZDOVEsCN/7By+ws3RLgWJiRlN7oCdtexDuvVkoixXzdKz9Y8PciZTHqLaIYcY//yL9Vx2Z+iRmf/JVn9DbXmOG1/SAJ1w1Z995kJMFIn6dfWlOWOKfjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=JpuS9ZM/; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498AmrZj016567;
	Tue, 8 Oct 2024 13:50:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=t/2e2ANYc/G4rC3tXke8rZ
	vTxk+wobuC5qKuGbL0T6k=; b=JpuS9ZM/e0ZbVbNCdaHv1P9bJ8v2kEZWc9Da0W
	Ub276uf8CJriYp9PP24K/oECIEig9GoBzUXYCfxBSrn0rp4fFSYSdBKl8V+90D3V
	1srVJrfYld6nFztfxcJydcGONg+I0NNHoFc//Ow64ijc8AMnCc2z0zXXbjFoBYxf
	y0pSAoD+iM3TZmt9JFNdD/BCE6lZn4VLtUq20FLfpptmnTQ4Z0WoDJ4iXr0bk7Br
	nt2zVs+A7qXjPMOLyWEquy4g1lWtX74Ldn0GFGtGOLzlG/XSbbYugNNnUpn7Ew6p
	w+FhxlYOCtilK3ICrupXJom9KtkjH/tleRMkLiJAuVtckYxA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 422xs1e455-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 13:50:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B793C40044;
	Tue,  8 Oct 2024 13:49:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 85109247CC2;
	Tue,  8 Oct 2024 13:46:35 +0200 (CEST)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 8 Oct
 2024 13:46:35 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 0/4] media: i2c: st-mipid02: fixes & enhancements
Date: Tue, 8 Oct 2024 13:46:04 +0200
Message-ID: <20241008-st-mipid02-streams-v1-0-775c2d25cef9@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHwbBWcC/x2MQQqAIBAAvxJ7TlCJkr4SHUzX2oMWbkQg/j3pN
 nOYKcCYCRnmrkDGh5jO1ET1HbjDph0F+eagpR6UlJPgW0S6yEvdMKONLLQyxjmzjcFbaOGVMdD
 7T5e11g+dw+EmZAAAAA==
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Alain
 Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.0
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

This serie includes a fix within the error handling when enable
streaming and another one regarding supported formats.
It also update the driver to use the streams pad ops
instead of the s_stream.
pm_runtime is added to be able to control the supplies & clock.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
Alain Volmat (4):
      media: i2c: st-mipid02: fix mipid02_stream_enable error handling
      media: i2c: st-mipid02: use enable/disable_streams pad ops
      media: i2c: st-mipid02: add pm_runtime handling
      media: i2c: st-mipid02: remove parallel mbus format on sink pad

 drivers/media/i2c/st-mipid02.c | 117 +++++++++++++++++++++++------------------
 1 file changed, 66 insertions(+), 51 deletions(-)
---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20241007-st-mipid02-streams-2188cc8b6fda

Best regards,
-- 
Alain Volmat <alain.volmat@foss.st.com>


