Return-Path: <linux-media+bounces-49480-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F02B3CDC3BB
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 13:38:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 916E53119B9A
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 12:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F40C33556D;
	Wed, 24 Dec 2025 12:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jetu+itw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GCnp4RiZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C8533890D
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766579497; cv=none; b=HONAl0C+xWrExraVqWDJPPWgq6CgX+hPTijz+wUCQOKcyKfzGfQ1tzlP1UgBIh9pHJDzg1zWPXs4KemMnBYpwLssc+azT1LmT16Ow495kgMDJt/s3uV8BcJjs0YZrBDkxSwrmAPZOu7OoZgJiTPGEPd8lK/1m5VjA3EmZ2Q9/4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766579497; c=relaxed/simple;
	bh=hloPmS/gU0jIzAKeFmhUtGJfp/7uHpLhIe0ol+k4rWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AX9KEZ1vT4DP4pXZHnwsaZI2wmPVRKVayamfxviqYEJgT1o4E04v1JNsZhD7xw6C9XNUXA+qfcK/7fIIX2O4c2dSrN9QaIUIumSe/UX6SXkNc0iC8ZXtA5cBPG4Fo4Xs2sKIzJKnpv4VqTKwu0qMkjQT2xNvv04q58tqSAP7KbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jetu+itw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GCnp4RiZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO8V6MO1206453
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WKN4rmMuNZjMAPske/u/qV1QPc+BO+zGVACsa/L8Cyc=; b=Jetu+itwEs21hM1o
	ppjaL+WyLdzyKwO086z8ia+hJw4gFLss3hmqElAKHRfIrK5say3giRS9g7/Ja4BF
	M+GBYkBOG2bzD0JjPsDA+ecRd0DoTwSFWnApdt6vbkb4tP8XBZ2GELq8cCFuwelo
	iyOvYkSUXucb9NByavG3v7m0jCwtwFrXVI3ovltnEG+fJaRokRoUPK5+6VB6IZYW
	ljOFY/0kmpsz2oL/qQ0OJJ90CGT7VHnj1Vn05NWEQF0fBD6Kwgu7pH0SI3p4vnO4
	1IG3K5eXMngy3tfcU3QH5iezeVClxOvRTocyFAyrExOAho9iizMEakvcRu0w8MZF
	v0dCSg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b827r23nw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edad69b4e8so124273181cf.1
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 04:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766579494; x=1767184294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WKN4rmMuNZjMAPske/u/qV1QPc+BO+zGVACsa/L8Cyc=;
        b=GCnp4RiZySuELms8Pz/zh1nTx+PtPSDSjs7x9dXMS5Tb8v1uhs3ZxT9XSDSB4518xG
         /xf37cmeC+ymSieLCJYMpMpIS5+R5JWKMC+2Bf2A+IbR8qVyXjKu0Igb5L0tGVnNmJ/j
         enkN04hF4/mGJiTMX0EdVepMi6BnZTO+w5HBzBR1PrnRhyv2TbkuHjm7It5VXHp/BRSU
         5Kw/rL8ZD2dmcPSBotchazirzYj3wOa5tMPUAyVHlOR+jjJ7OjPyj6UE0Sdmm2bJxAGM
         ZeOeWAZ+H4DXErEP8H6xCTsc3wXsEyYUcgkrWlVs9sAWX+4xOfKlpWJdnvKONvEc8Rrz
         FEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766579494; x=1767184294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WKN4rmMuNZjMAPske/u/qV1QPc+BO+zGVACsa/L8Cyc=;
        b=jhgb6jNzznbzodKkUfXHCisoONMlobMpIUG/Z/7HOgdktdw5f3ZagmEoEsOEMDaZWd
         KFSRUEJXfHgSNongafMbO3e+CNCm8x5wsTgW5VF4HuSX1SMwe1HciFuG1QOnWTkgQFLF
         93QZaYp8w5e73fqCtgjJRRrOGugXncnDgQ8A4qrivP2IuzE1rRU1r7zyh4lfWa2fTSLH
         eVEUi0rum0K9CU90LmFP2miqGmDVomcH81XG7wfd4LMRJRiU/ZhL/LhhqR8Spui4oPLA
         PmOETyzYtwPqLsXOvPMcHh/in2l2toqku+UkfcjwAvRuhJ6o4iYv4AKBjKiHjLrnXmb4
         TIlw==
X-Gm-Message-State: AOJu0Yw9DyHgoy2HUF3NM3L75oPiD5oZeRbWzsfuaoCXzmEd+MxBuN+K
	QYlYZJYsAX0+jnkmMQN2o9nxL0X2Lloi41cs0GDW5fwRMwmTJeUzYSNA9pZ7wtsgTPTaiVjBg3x
	Jik9rL191kyK5eZA+C1404h3cT72zuZCpnb9kNfiWEyTe1C+aUA3uhIuvOgffqY1W0g==
X-Gm-Gg: AY/fxX54LueDaSwJj8NKJAb3LGdyXoLUYmDFwkO1sDUg7c/3Rl0L67B6G07R6uvqoxU
	fTq5wE2AILyoQ7e9whfKM4bJBM6ErwOKfm728VzpciP6py/XrIkmHzsBKiGU+tIDTTx3Nu9Imnc
	hGSygnGNm9TPPGW0OWulVJRWvS3PAJHIuEICbeAhKYfWTdrR8GfNfCFxqow3OV8mmJPViSeeqnE
	eZrodUWg66XB1uChOHwINhj/Ce8sv4PrF7ka3aSJbmItXjFH/SefPvkQn3tvn066exFFOWD2MDN
	JWsu8vjzXZPRIVLdyboH4+3H6JI3Q42diPKvOzAmH6RfoDIcsywXUu+5PG0m7S4XI0Y5KRKFONv
	z3v5RkV0BmQz0O6uxbPcFQ1EuafxsOVwqf1sssCCbR03338c70aRX7MYJwwD6cph6ycbY4+fgYl
	eyPcRrpKoqAvdhdpIcp8glb4jqxHeW8ISJMuSzUGg9
X-Received: by 2002:ac8:5f8c:0:b0:4ee:bac:e3aa with SMTP id d75a77b69052e-4f35f46d1ddmr317594041cf.35.1766579493887;
        Wed, 24 Dec 2025 04:31:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIsZkGfhFcDEW3nArahjqs2pVGrQ6BHEQvjRiT7Tqzwb/XjrW/z34m/OteKuyL0bYQQbwRUQ==
X-Received: by 2002:ac8:5f8c:0:b0:4ee:bac:e3aa with SMTP id d75a77b69052e-4f35f46d1ddmr317593741cf.35.1766579493531;
        Wed, 24 Dec 2025 04:31:33 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b12dsm1750304066b.48.2025.12.24.04.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:31:32 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 13:31:24 +0100
Subject: [PATCH v4 15/15] media: mt9m114: Add ACPI enumeration support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-mt9m114-atomisp-v4-15-60b25da7a1bc@oss.qualcomm.com>
References: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
In-Reply-To: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: Ikh0URX0GHCh0TpLVZEsd1QNu-KzO0px
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwOSBTYWx0ZWRfX8H7RCDbxtZpJ
 FLl9BII8DaDnDFs8hXlnO7WRaUKSIYq/MbyD4qiVpYHbs7mqunfOf3DXu5KL5uwQe+0jXmePWkK
 +ryoNy+Kje0QmU9PlmOy4CSQqbvSGkCAgxjy3eZZxGvimEd+aZQD2BrLVRmaGfVOLlWvvkc/4G8
 3z5eW50tiAorjfT6d0nLDRNhUv7YzU1rG/bV6rYfaivupXyOU/sNLmoMMhE0LNlMV72QtwEsL8o
 nm9iTdLg37JZerbtclo/lDqJAExi8YpYzVIX7D7YVe1w2bx1lf0QHi03e1g4Wr1KCm3tNhqTw7r
 AqM1oYk+OKMt7SsNycl17p/cqU6fXhIt+zzh4xBYR5WJOHMq2YHVZ6B6AZh9NshoGCC0ELTnj62
 iQ7ej3UGxZ0ncU0GVaFexeII0QrNsnMRabQvboA+ufTl+iiSxWgD8Tzjb8mjE4YFzNjVwjeBehD
 Kg5Ax2gbD0c+P8ILDpA==
X-Proofpoint-GUID: Ikh0URX0GHCh0TpLVZEsd1QNu-KzO0px
X-Authority-Analysis: v=2.4 cv=RbSdyltv c=1 sm=1 tr=0 ts=694bdd26 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=5YKaq-4ml3F4CIf4D4IA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240109

Add support for the mt9m114 sensor being enumerated through ACPI
using the INT33F0 HID as found on the Asus T100TA.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/media/i2c/mt9m114.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 9bf900095515447d22265521349cce1d7892e9b8..836ba16d1accbfc1a6b8878ba8d3806ef7a1caa1 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -2640,11 +2640,18 @@ static const struct of_device_id mt9m114_of_ids[] = {
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


