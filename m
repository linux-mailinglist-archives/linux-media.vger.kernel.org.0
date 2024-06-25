Return-Path: <linux-media+bounces-14092-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2DD916142
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 10:31:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31125284CD3
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 08:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B954148828;
	Tue, 25 Jun 2024 08:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="TCvRrDK4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BC11474A0;
	Tue, 25 Jun 2024 08:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719304298; cv=none; b=JYixswUHw2FHAXgzP+dTYOAhkqF/+q8TecY+SWu/SVnf5bmQ8l/Ue/8wKzIOIW5Nkb98P9NMiak5opkyTFyR2iIjwpVVNXocF7uD1LQwP44j/XUvayOXxGFZmU008dnxna7H+AMfDAK4JiuCk1B4phU2Jr4OUDlo6r04LzKRCE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719304298; c=relaxed/simple;
	bh=/dOnhkoO5+R3dlGQedxnWM1hbRa4XGn1p/VKPmIJMt4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Zg0W5qS4UqcGMXRNZMnjR4maTldtTvfTfqyv73QJKxnAqJmt/Xo+XferhVqMWmff7hfvrJCederEEtW76BNyd/jSyuApbP6Z6CMf6CBZuAh4zKTOyPuIL4u+VczWPDOsv62HTlmJG2N+G8P7GnXMscF30TTh+/irv/bwCO2pARk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=TCvRrDK4; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45P7Z1Yp023451;
	Tue, 25 Jun 2024 10:31:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=KOdgEEi64DxcdqDdDoCi6J
	Fxl0LacrP20YO/30ROQ5Q=; b=TCvRrDK4MTCBfTnkVFpzeYHfqmj/ChPnQXJab3
	05Uan+zmeRXBgOZnDzKNfdOx7vF87rWDgmPXVY4kd0T+cvkz96dhEBmW64yl371L
	u4HiR69ssjwrAjgJfKmbLqAPFNThm3o4lGBkPqxZb9SLRT1NVB1va2kLRfkzXK4M
	1PBrx4MD7fr8jSQfQAScbEORIpFSpBTbnML9U4dFe4iiYgEDQnjadK9M7rbwh7E7
	V85Pc5UbMDSy569VZwaby+hHtDScOqWCfTQX1Y7JNEuOMWiErIYl9ge4t2lW96QW
	F5J6TOBvfvYA0nT3uKEQnm7IZfHVVywxWtQ7RFH8dwZIoeAw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yx9jj87wy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 10:31:14 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3313840046;
	Tue, 25 Jun 2024 10:31:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C3E082132CC;
	Tue, 25 Jun 2024 10:30:53 +0200 (CEST)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 25 Jun
 2024 10:30:53 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Alain Volmat <alain.volmat@foss.st.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] media: i2c: gc2145: CCI_REG16_LE usage & RAW8
Date: Tue, 25 Jun 2024 10:29:53 +0200
Message-ID: <20240625082956.2556293-1-alain.volmat@foss.st.com>
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
 definitions=2024-06-25_04,2024-06-24_01,2024-05-17_01

Add RAW8 format support within the driver and use CCI_REG16_LE macro
on 16 bit registers of P3(CSI) area in order to avoid having to
access them in 8 bit.

Tested on STM32MP135F-DK board.

Alain Volmat (2):
  media: i2c: gc2145: addition of RAW8 formats support
  media: i2c: gc2145: use CCI_REG16_LE for little-endian registers

 drivers/media/i2c/gc2145.c | 90 ++++++++++++++++++++++++++++++--------
 1 file changed, 72 insertions(+), 18 deletions(-)

-- 
2.25.1


