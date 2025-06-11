Return-Path: <linux-media+bounces-34500-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5908BAD50B2
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 11:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45B107A5073
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 09:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B7B262FCE;
	Wed, 11 Jun 2025 09:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="tNLjHeWO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FCC19924D;
	Wed, 11 Jun 2025 09:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749635865; cv=none; b=A4vejpLgx8uLHI0tmsoQWjW3KfdzSRtOmt/p3XgbQ0WT/voQslceUci440gWFoQmzWJ78qtvAdJ3G02H0YcsbHhuz/p2YwYkc8wIbTbsJjnL7UeDJ9rBGnM3wYrS91K6P7Z5RIzCq+7hFG/IaLasdTgo3xB/bOuWAs/UUKkvgIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749635865; c=relaxed/simple;
	bh=69Lk3vhK7kxM+f3aRs9NZGKK7v3SZWRNe334x64JVkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=W+dCShu6JfZqg2hzlOZh3GsZrMDuN8vgnh9j18TsG9CaYyKv4tiBfsmsdOZXOO0iRJp4QsQ0Ok9QjL14Gg4cbn2D9SGM0dGIrigwwy8zvEFBDlzIjYGkuXr8E1nrNIqsxc16uqZYUhP8S02dNHzF51GCaEE29vfNtNFko5XM0vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=tNLjHeWO; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B72cwx022334;
	Wed, 11 Jun 2025 10:49:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	PX/y7gliH4I8f98WoXqhCdSxGh4NTXeRFWxdmsiFQgw=; b=tNLjHeWOsEcuJkP0
	QGVIzqQo+s3p90AcqAb9pXu2l96lq+i9U5xs4WlDReWVXSOXPe/Na7nKluffLuZW
	IV0V2hPcU7Y5Vy5ppbdOvIx0L6O6QPui0xQMhkSf5OukQyisuGpmk4zpsPPGtjwt
	t+a4ukNaLcrugDNl/ggskYFAWyprDF6aQhfcunz3obIOfj9Qji0F39oVOHd58PKq
	7ITxSlHAVHZMeQ7lS/zpmpRcMt3orlgz3IwNhPc5wHsUSYxsk/zUORdJCcJmjC1m
	CpsD6iIA4TCkSYirETJrfeKmzOZmApzK64fM5b1p1frmgekk5YGSQAjk33pk0wB0
	DJBMwA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474y056w4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 10:49:35 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C606240087;
	Wed, 11 Jun 2025 10:48:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6B469AFF26E;
	Wed, 11 Jun 2025 10:48:39 +0200 (CEST)
Received: from localhost (10.252.5.102) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 10:48:39 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Date: Wed, 11 Jun 2025 10:48:31 +0200
Subject: [PATCH v3 2/4] media: i2c: vd55g1: Fix return code in
 vd55g1_enable_streams error path
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250611-fix_vd55g1-v3-2-ef4ecf15ddbc@foss.st.com>
References: <20250611-fix_vd55g1-v3-0-ef4ecf15ddbc@foss.st.com>
In-Reply-To: <20250611-fix_vd55g1-v3-0-ef4ecf15ddbc@foss.st.com>
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

Enable stream was returning success even if an error occurred, fix it by
modifying the err_rpm_put return value to -EINVAL.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/media/i2c/vd55g1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 78dd22d9cab03edf4ff3e5a301f8d045e930c997..336dc3c85ac9e695f22aa524e0df6138dc76e45c 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -1084,7 +1084,7 @@ static int vd55g1_enable_streams(struct v4l2_subdev *sd,
 
 err_rpm_put:
 	pm_runtime_put(sensor->dev);
-	return 0;
+	return -EINVAL;
 }
 
 static int vd55g1_disable_streams(struct v4l2_subdev *sd,

-- 
2.25.1


