Return-Path: <linux-media+bounces-12870-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 368A3902523
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 17:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03271B23FB0
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 15:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A2F13DDCC;
	Mon, 10 Jun 2024 15:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="YmM5T9X9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4031E4A0;
	Mon, 10 Jun 2024 15:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718032420; cv=none; b=T6kDDBWDSEPnI3oXnsqdRAfuKPBvKTXnec2JL1TVyocZD59HnPJ3mKb7ZxcoM4fLf7RWNeRRu7yxQR8iIb1VJk9T02g5UafBiIAoc4b2kOXMqsFe1yXpyGIl1ns3rDv9K0NK0nf8L+jr26hSeoZKJnvNDnJihHYgKbvcP4jV3tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718032420; c=relaxed/simple;
	bh=dbA4Q3NljLWwLfg/8YvXVrf5EDb7VvwfPHiP54AJwxw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dADORH0e9fLKP0HGHpsP2fhxoEUw9++3ZQ105nYvaQMsqK+NODCicX54bPFOUVgbk9gLYURaghVFPXddwYiMVgdImHlOYPdKLuNyxMWJvkgrSDzhpQBZf5PiEbPcONYukJ0p+ybeNw0HNiXWIOQsB6Xk0SHRCRwxX+M8AaNYLIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=YmM5T9X9; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ACQgw7001003;
	Mon, 10 Jun 2024 17:13:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	d59bYfJuaPhoU7eyu8V9rWLVgMTR5ee1jrq+gL9cAfo=; b=YmM5T9X9g0Ajhl9n
	q4RYmKMuOkch3NNYlz/4DIM51JmMNpCPejovRQ1bHRAcBe6MHXzA2GwnAppYQLOf
	A1MaI7uysbtMJfZDeJic7Bh2LVh1VVDgE5I6ttmOj3BPcxSyigT7mMPd47PXeXnw
	R7xr3TExnWQ5wsnvvpQqLLz8vtmguHa23hzoa9EFjjPWDw/HU/AD5QsRsmwqUf9o
	cvpuxTZplbSIzUv0Ae8jJAzLvG790iXyOqZBlFfcroCbktD6nMKqt6Uy+qKCDHJR
	mZqcpRCykjflJaKf6GMi0wIPBVPHGaYLsRGV+3wiCsCjJ8rN1iYFYpcpZAdbRTK3
	QqooJw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yn28hw854-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 17:13:29 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CD79840045;
	Mon, 10 Jun 2024 17:13:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0EA2221B537;
	Mon, 10 Jun 2024 17:12:48 +0200 (CEST)
Received: from localhost (10.130.72.241) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 10 Jun
 2024 17:12:47 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>
Subject: [PATCH 2/3] media: vgxy61: Add legacy compatible string
Date: Mon, 10 Jun 2024 17:08:14 +0200
Message-ID: <20240610150815.228790-3-benjamin.mugnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240610150815.228790-1-benjamin.mugnier@foss.st.com>
References: <20240610150815.228790-1-benjamin.mugnier@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-10_01,2024-05-17_01

As the driver has been renamed from 'st-vgxy61' to 'vgxy61', its
compatible string has been updated to reflect this change. Therefore old
device trees will not work anymore.
Add the old driver name as another compatible name to handle the
retro compatibility.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/media/i2c/vgxy61.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/vgxy61.c b/drivers/media/i2c/vgxy61.c
index 30378e962016..ca3b43608dad 100644
--- a/drivers/media/i2c/vgxy61.c
+++ b/drivers/media/i2c/vgxy61.c
@@ -1867,6 +1867,11 @@ static void vgxy61_remove(struct i2c_client *client)
 }
 
 static const struct of_device_id vgxy61_dt_ids[] = {
+	{ .compatible = "st,vgxy61" },
+	/*
+	 * Previously the driver was named 'st-vgxy61' instead of simply
+	 * 'vgxy61', keep it for retrocompatibility purposes.
+	 */
 	{ .compatible = "st,st-vgxy61" },
 	{ /* sentinel */ }
 };
-- 
2.25.1


