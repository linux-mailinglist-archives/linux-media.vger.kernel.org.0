Return-Path: <linux-media+bounces-49757-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A61C5CEA44B
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 18:08:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9473930723F8
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 17:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD237331214;
	Tue, 30 Dec 2025 17:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GaL2aySr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ipJ5OlRG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4112D32C329
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767114212; cv=none; b=NZvwtk4YhBy84veuDzSeB19NrJ05bvdNn+MGcFrgahePFHQ4n+URdNQoC1Ya3sxJdwpLMpQ0GcOusS6LmGTtLdjt6egQ0BNqNGVgIIWRwriyHdag6LAetNdWIXQIvYX7iJWJ32wd8TTfabW9KL7MDL2VPKOTA+8T/egmr/CZqt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767114212; c=relaxed/simple;
	bh=/bD0B1cBoZ78tLpiH/5KLMUURhywS5vA4Ek7ziqC8MA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ONUvNrjCP+8lJYM02pfYb6OfvDUtCf6Fti+dsHK2ujz5tqWJxfEFlvCM5dlZifmIqONuKwUv0uip1+OHZKb4LwGpvK8rLqd7D+ySPqt+fuWfWNcfBlsHSFfsN5dH8VduBWWY91k/8bp5h2bTKVgRr6U6tE2zdGu4pKPSVgURKIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GaL2aySr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ipJ5OlRG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUEebRQ3539557
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DQh59sD7z1Ty5k1cN/IYnhlGUK3jdk1tMfSek0QEFzA=; b=GaL2aySrBQzS7aMg
	sGQ+NLuiceZ9+fr4Eh+398KHphx0FTql7aVv6xW1l4GckDIzt3AUHFkCGoa3G/i4
	lf373Wd7kxfW7FDVwGCJ9qLJ+4ee/IWAB6WNP5b0+AeqC5PKHLoDmGdl8o5yo2Bc
	Xy8AEdXBqh88BjbeqnsXRyvWuJL0mGB/k2jeGgquHk+8WrTUFLpglMQfv0pF9GMR
	QGcSBtzGMSUj6YcqMsXaJDD1J0WVKURByG+LtIHsE4Ka6aWCMHYXalOpd43gFGqa
	4yTja7OkdGUJMkfwryQB5B771LlQeayxVdJbHH+WvDhFnKMgnB6JgsJvhAegUlV2
	zRBwFg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc88yhnaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:29 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7903fc98229so13427457b3.0
        for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 09:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767114208; x=1767719008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQh59sD7z1Ty5k1cN/IYnhlGUK3jdk1tMfSek0QEFzA=;
        b=ipJ5OlRGsEd8RKZllvdIag8IkOjLZP6fsYNIFd0cC7WIp3IsvrSgKk8aHCkP8JXXx4
         yC9M8Jgb9BzSvnRzcruFYzOnmYVYNbAxxMW2tQ3HHXq5zA2Njtdn5tlj5OCSohfzB6hU
         uexF434+9gSkS+emdPZUbugNO8sVjGnPJxZBue3NzEYZm4ks85uOfKkdSFp3EOXDQfDp
         not7HP8ad9CNP06ZmhnbRBbfKLYqABljhSH2wmZ1lntnNoB4JMhNcTNQWa7HkXa11bif
         RTHe7Q4bB4tqtABevunutqu0WaugkOdlDxwLRCS5eMMRAWE7YbjERKZzgutYwzbd1itr
         pF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767114208; x=1767719008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DQh59sD7z1Ty5k1cN/IYnhlGUK3jdk1tMfSek0QEFzA=;
        b=nf3+jhkYrg0RkAbQkctCY2NbxTkVFxF7KpjepkdKVR0j+bpX7FrOSX5zc9cWqRejKM
         AlmhOIe4EoKI1aJosLoAc12n+eM3mqz5drV15jkMRR6CiuqU0ZBwowqCarHusm1B3JPM
         rRpMxRImFpbqbLOi7iOBNwqwubs5Qa3imL0QSYBkdLOMUwOWM7aUCVLHU7K984S2KoWw
         EWW6Ef1113wZV83YFOSB7pESEoww/EzZ4WksjyQF8FaIHD8XBzVRdLKiKYplDzaxgkhR
         Npei8rOz9DOrh/OvzqxlYWuKfgImoEqn6leIXADxaPuWPN7G1/piECP2ABXRezZXAxCW
         ulZg==
X-Gm-Message-State: AOJu0Ywq9JaZR84gfHkgfv1LGQX3x7vLdY8qCdL8brGfSvM/D9TpT6nT
	RTPqBGLUmKMzqkQS9DmDONhSoUCrBtbjKmkLEGWjO80E5YOGAI4r+iZESsdBAPr4eVEOfKEpEjP
	H8fN3V08IQbQQq/4ekDv9AMmOE9SGeZiyVCFOoOkgbhVxxPytcRhUoymxeFQGamAwp4e/67XYEQ
	==
X-Gm-Gg: AY/fxX4VStOb/Ho5S0KoUcoCLLJ2FFKsyh3Z5IFVzKWusRfN242UczA90PiiIEsPYN/
	ESR2upXbmQEAqJgkzjkMT8xy5g7Obi2n46xo0ZkLbxqnv5Wjo8MxZCv+0su5BJGFmGmbjXYCZiB
	5QmwzfudWNxosekdGbog4bT0T8wouwlH8XoAjw4AsUR4Eoi+92e2AuTUV8OkUWg4x1KXHYMdc7f
	ARl6xGzOZ96JHXj3pR74Iqk3+QaSXSryHvXRzjCxIkL9rvYLw/rrPAPPZ9JpchiDLF6OkRLNYZv
	4rs7cMDNMmirqNlxO1lJlVoeziP/BtO97k4eJBT+U7zx3viuyHkqsIDu+a0NaWbR3Hzd7B3Wh3g
	rIf/TV84O2yfAE9G0kY5TRSGhg1uELtJY5AGG5I2MtNRLa+An8SeTMzBJrBINEFhm6owZh7Xbo0
	e+rGGuwRW9CKn+ke+sA3rIEFjmNgRU6RbUge1kn1mw
X-Received: by 2002:a05:690c:909:b0:78f:b163:74b with SMTP id 00721157ae682-78fb418ffe6mr275129767b3.59.1767114208403;
        Tue, 30 Dec 2025 09:03:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8gPtOEBHDv+QmqKsImJHPQQR//MFWUZOJW93lEefQE9X6qKhVovh9qhSjW3vBpWtGFxAHiQ==
X-Received: by 2002:a05:690c:909:b0:78f:b163:74b with SMTP id 00721157ae682-78fb418ffe6mr275129487b3.59.1767114207959;
        Tue, 30 Dec 2025 09:03:27 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a5bdb9sm3776086266b.7.2025.12.30.09.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 09:03:27 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 18:03:11 +0100
Subject: [PATCH v5 14/14] media: mt9m114: Add ACPI enumeration support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-mt9m114-atomisp-v5-14-763539e76094@oss.qualcomm.com>
References: <20251230-mt9m114-atomisp-v5-0-763539e76094@oss.qualcomm.com>
In-Reply-To: <20251230-mt9m114-atomisp-v5-0-763539e76094@oss.qualcomm.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=POcCOPqC c=1 sm=1 tr=0 ts=695405e1 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=5YKaq-4ml3F4CIf4D4IA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: _e747hluUbR_y-AHnFhuuDyGlu8Svibr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDE1MyBTYWx0ZWRfX6E+jdcV2xlxX
 KQ72ddH/LEBaWap9K2bIUbYFSArK+YAnnQNSlivrzrHhBnEJtuU3+ghvopdbnpXL3o3qDZqWSel
 3sIy6vdnNDDl+XEkK7eSPQIKl/cXq22adXuNPBeDjRFLh+o8n0+dkLf7HzqbA5crCRfJRXUx/Qq
 VRSxodWeiD5KhPiZYxzVAQvtnuGPNR9yz6T03cq5aA6iIM2993Mzz9OwcJPuWefr0aJNScN1UVn
 UA/n6kQ6rDo7xqq+6Ytj33Wzby88++rvfoqoxkgledUHFi8BWc1pzeB+X0dzOPRRFSng4g8gt2/
 PM2uhHlCb/6g6DfOIiXSmc0eLL3PKwpJeBQy/Plg52J3VWZAtx4PtV7GxdB0Oy+tRi6Q0g+6prD
 R9wP3jiDB8R0kFY3+Kx/xw7Ha3BnBecuQzxRP7GzKUM2/AEHa9CpZVmScDvilda/Z8FPXqAcUgd
 PmK0VXBO+edRajbzZ9Q==
X-Proofpoint-GUID: _e747hluUbR_y-AHnFhuuDyGlu8Svibr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_02,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300153

Add support for the mt9m114 sensor being enumerated through ACPI
using the INT33F0 HID as found on the Asus T100TA.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/media/i2c/mt9m114.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 9712d61ab9512f3b8ff31423afb81b61bc3bdaef..a38a497ac38b24912a14c0636108cbfd84ea661a 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -2652,11 +2652,18 @@ static const struct of_device_id mt9m114_of_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, mt9m114_of_ids);
 
+static const struct acpi_device_id mt9m114_acpi_ids[] = {
+	{ "INT33F0" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(acpi, mt9m114_acpi_ids);
+
 static struct i2c_driver mt9m114_driver = {
 	.driver = {
 		.name	= "mt9m114",
 		.pm	= &mt9m114_pm_ops,
 		.of_match_table = mt9m114_of_ids,
+		.acpi_match_table = mt9m114_acpi_ids,
 	},
 	.probe		= mt9m114_probe,
 	.remove		= mt9m114_remove,

-- 
2.52.0


