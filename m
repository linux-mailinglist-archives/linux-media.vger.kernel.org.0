Return-Path: <linux-media+bounces-49687-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4270CCE91C8
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 09:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABF1A3050CDE
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 08:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E7031D364;
	Tue, 30 Dec 2025 08:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K/qyYT3v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YZSitEg9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8378731985C
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 08:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767083686; cv=none; b=Mo/7Igv1GY7R6kOPUggWCYl5qZH/Cq3HtFex8Hbg3pDe7I8PRWs+KJ8mFx7jbKPHknxsk/Lw0WkmhYSPBqPEWYzssLqBqf5wMoqQrAiG0Q18e1VeshptF75XBYQW9kNknIevHlTG8vv7xTSXSNBPuaZiVEGNPx+keSP01aj7p54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767083686; c=relaxed/simple;
	bh=b/Uih+xiwgtulW8Q6FcNJAqo6CPuzz/bAKmol36Ckxg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iLuqDxhMnOLmKfqDkwYabrMaI/OvC9p+w2Q7pUeRWfUtVewgycfe7pGK7u1FrJz/gp48IyeFgqO27bNg8bY7V0CwhMTUI/yZTO8hU0wsY9O96CQ3zcc3Ya6I1oVzhInRHkWQyji8F/le3ewuiT+9x868JWdGBmp0swHJd3UQyQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K/qyYT3v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YZSitEg9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU1KbJ93115933
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 08:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sZJbn45uJvfmwLsLmP3C6rwKckT3pBqOOeK
	KHYLcVaw=; b=K/qyYT3vUAF5edM/I9sKFEjz24nD4KP2MnAz8suPHT8/1BUg8VJ
	jjrQighZsF4AqT79IUASxm7gZ1OP4ZTG+YkeStUGxOLF4SGftgcNOtK+tHKJhJUs
	OVuturZhhfnF72720WkbCO8pQWwPOR7Lvq4rKKD+QCqXHmxKlJnlDKc56fltnlIV
	c0j9vFb7zzSpDX6NvRCjJtL5+jfeFFiG55QmOT1lCkYSIMF0u+trZ53fVo/MPTjW
	3jRrgmToYsO50TSHf8RntrmBJ7i1HW8piF60g8i42E7DIeWAROMOOMLcG/3OSxKd
	4/Mua1PDXJ/tXKHksMKhsp0PBtHe9WLSsGw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0skha93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 08:34:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f4a5dba954so250390361cf.0
        for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 00:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767083683; x=1767688483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sZJbn45uJvfmwLsLmP3C6rwKckT3pBqOOeKKHYLcVaw=;
        b=YZSitEg90uwyoM6r6NBOQYw1/i6mQeeUT/ERTZAVbThxlhdx7x0yYGLXdtjW1g1A0Q
         +iGa+p6l+byzCR2ExhIay+5x5N0a7KjGW39I4nINbvq9mRYYA9Rjc8764AWwRm/s/wgo
         B8UaBcRiPW7ytL617hbYQQqQM0LoWr3qlHExZFA9BkNPjNDulxW44IJ82MYZD3hdSSFA
         KIEAVq8yLMQh5nVSkjWvpLnRaDpgj/un8Uao7Qnq+v1HesnqqeMx/tvZHTGx4GIVHRqy
         SJ3+mjPQvKIY/kJw9Ejz+sD7qYG3FfwK+HA8tL9us23uv6MlAN0ThMr+3SHYbrFMSq1s
         ertw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767083683; x=1767688483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZJbn45uJvfmwLsLmP3C6rwKckT3pBqOOeKKHYLcVaw=;
        b=ugADPBUlcFwe11WWGzcpbQcURIj4jZqb3URYp+3ElT8JWl3pxmnratW1GamOg+RqNI
         kIkcXo5H3GCOjEQm1n8VZVhS8fMrElRDwfacE3uH+uy1VILo1rDeY2+G+X7bKN26VVxd
         VWPUFnpaie2+bOO6hbFnW4JYrMHNGMXWyQeLCiLrrB/1weXH4BzOQITCe1NuVBpAz3PD
         6qVY8ez1kjSiCxXeBmhbETCOPM3CGLZTvOKExNQUlCJwFabqPMgIa3AuQKVayUeuPorc
         3jeBQg1FtGN/tOm1u04HwU8sIc/EiCOFg6LRfnOG+N8ZzD92rB4DfuG35Dg8tkkWX2CV
         zOqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAaX35ze7ZIr1ASi1LBp+dFo822pcSTQrKabXFNYccXGnBF1C6NRqpQr1M1PPPePEbMXyy0+O09Q8anw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzWizKF19qU1kh3kmAlDP8EbPohC7VVggufp2WaMFY2lVn1vv3
	rkJmTEUISb+rxDyF/FLJIezOtzyhWEZx5Y7MxbfXzzK/MuDF60YvyrsjJFQOuOXH27T37JwmSQh
	rXkDFyBXVTUvmtnIZooiDCrvy6UpkPgbNiZDRod5e69m+pfdBhS6cfmfN2PmrNUeZiA==
X-Gm-Gg: AY/fxX56OGJ6AsWiEho1WPOjD2vaakIcSyYrNq+ci8RHJKLqDC4lzjKd7UyHMlfJZrm
	IfNgTMo4FMXmnCVVo4CcOS57dCcxKh2oIjhghdCl/UduykAAXDu9fZhd9HjtkOcnMj39dEr8nDz
	Fo+wcofk1qID2mtaZrcKRoNVNongHZrqCa5AzFcqM6LcO5g7HzKF4fbn+w/5JKKqxFWwmeSkHRX
	V/vE8Kbt2/ES+Jyr/I4I2tLYLlktOrXiKyNCv98HFoQT0SowP6v/wNOU9spYmcq1fvoWcu+oIxH
	CjvztDwc9zVLcnD3NKrymG1ojmEWiwyWhaMgVltXLUo30cqp5WgiRs1uqKepbvmlM8vMNW4VwXZ
	hSYW1g4Xgqxy+h2kWxAJg7x4TXA==
X-Received: by 2002:a05:622a:410f:b0:4ee:fe8:9348 with SMTP id d75a77b69052e-4f4abdb47b4mr464621481cf.72.1767083682792;
        Tue, 30 Dec 2025 00:34:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4XA0VX9aTNRxLaLeYSbI1rMjpMyLklw2uq6TJ9ZMtX9AROBkgbnuiWYFvumn2wU1Y6p/9Pw==
X-Received: by 2002:a05:622a:410f:b0:4ee:fe8:9348 with SMTP id d75a77b69052e-4f4abdb47b4mr464621351cf.72.1767083682357;
        Tue, 30 Dec 2025 00:34:42 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be272eaf8sm625934515e9.5.2025.12.30.00.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 00:34:41 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Hans Verkuil <hverkuil@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] media: i2c: Add note to prevent buggy code re-use
Date: Tue, 30 Dec 2025 09:34:36 +0100
Message-ID: <20251230083435.26267-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2296; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=b/Uih+xiwgtulW8Q6FcNJAqo6CPuzz/bAKmol36Ckxg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpU46bVjB45o55TH2nXgFo7ACAsYJzj+Tg2GTdu
 LbT7KVil66JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVOOmwAKCRDBN2bmhouD
 191XD/47KROIfKw8M+58kkKgG73eBeihc7lcIJWo4biHrdFT8Vchyjf8HGv0prqx4VNJSqsZmEK
 gNOiXvxd+HKO9bt93FZImjaFASddopB/pGSwmfwL9yTiERcyJEMQsEDac00pGA6M3COeh75YWMK
 cdO12U586A2mpcofzYWDlsWu343OIO4jUBl3SDLFmlWzwscRqDBigMFvRB/F0a90WRiO210xiup
 XuAyyQMkdab9oKyaX0uBinTLEyECFa2clxzPuWm76Nvxvam1XxLUJSIfTyVX2HjM8dLDDYVRgpP
 TI4V/ftLY/ESQpz2IVALpTpsGYqSTrR2WDjjYcP2A78/1oYqT52bVcsVgWtxJGuAY3iKQYpzEuq
 9leESTvmE4SKn9QpRH/p/NX7EVriPhXedgnI0ANPSRw6D8M0ATfgsbnPue5++WFZE+sskJijBe6
 oDKrHF0cJBFMCsF4x+qEertLMlbJSTBNOcXO6eDIRaPGq/RgqhUx7QErKWCLJFRrH2G16342T1i
 uTt3tH9FgaipL/ct6s1TEgeHqchHbaKqzppwX1P53QeXcQdiCRMZQZKM6iXKt2FDdQG6gip8kmr
 vp+PXFV885P7PmlewsTrqSNff97eKLgyZ1ZdLpyP6jHCw5NvJ7jMA5jpFXP2Iqoha3Rj//m2cH8 v2BAsAtq4FzOnRw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA3NiBTYWx0ZWRfX9n1N15YKvGaK
 e8VOqZcWPS6UXOor1iBlnbHqngmp79GGqO1JObFMixUcqoBbrmorrDPTlrPabM+/XyEeriykqyd
 4MdjDSDDpkMmRniFb87/R0m2yVgirKVsQ1YgFNA+nYCr4IgkLss+05ezKybQHAUD6ZCjWcPIBSI
 Sy0TBv4qsYEn/x9rzD1wepN2mVUu5Ie90w2773qvOrwgtKugw+DpmgQ7F00pA86FifTM/uwDuoW
 0wM8Xm/pBUvT+IndcDdLZga5T+Q46FHgY9t7yEzArFw4IjPn3u5DfZXcB9aeAnUiypUTGaM5hF/
 G0a9V5mvc9w/Wm5r4RjGQHpNyJtbw/elO3dIBS35b25cjya8zWlWM89BAXyLaiNZt5ml5eQ3naB
 zh8NrDWnv5fuCOurtZ5Y9xxtCjF+re9GqUmFgnw0y+AlKgiF2yZUw3npae6ZM2icuWuo2GzFNrH
 kEMTBv+kSty7AC0pCDg==
X-Proofpoint-ORIG-GUID: q2OtNd32ZyvINIvYiFXA18MjO3UX2wQy
X-Proofpoint-GUID: q2OtNd32ZyvINIvYiFXA18MjO3UX2wQy
X-Authority-Analysis: v=2.4 cv=FJ0WBuos c=1 sm=1 tr=0 ts=69538ea3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=2IlOcs2IsCq10ZUakEwA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 suspectscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300076

adv7604 and et8ek8 sensor drivers have mixed up logical and line level
for reset/powerdown signal.  They call it a reset signal (it indeed
behaves like that), but drivers assert the reset to operate which is
clearly incorrect and relies on wrong ACTIVE_HIGH flag in the DTS.

People in discussions copy existing poor code and claim they can repeat
same mistake, so add a note to prevent that.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Similar to my commit 9d108d226224 ("media: i2c: imx: Add note to prevent
buggy code re-use"). I went through rest of i2c drivers and found only
these two doing it incorrectly.
---
 drivers/media/i2c/adv7604.c              | 8 +++++++-
 drivers/media/i2c/et8ek8/et8ek8_driver.c | 4 ++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 516553fb17e9..67116a4ef134 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -3453,7 +3453,13 @@ static int configure_regmaps(struct adv76xx_state *state)
 static void adv76xx_reset(struct adv76xx_state *state)
 {
 	if (state->reset_gpio) {
-		/* ADV76XX can be reset by a low reset pulse of minimum 5 ms. */
+		/*
+		 * Note: Misinterpretation of reset assertion - do not re-use
+		 * this code.  The reset pin is using incorrect (for a reset
+		 * signal) logical level.
+		 *
+		 * ADV76XX can be reset by a low reset pulse of minimum 5 ms.
+		 */
 		gpiod_set_value_cansleep(state->reset_gpio, 0);
 		usleep_range(5000, 10000);
 		gpiod_set_value_cansleep(state->reset_gpio, 1);
diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c/et8ek8/et8ek8_driver.c
index 2cb7b718782b..50121c3e5b48 100644
--- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
+++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
@@ -835,6 +835,10 @@ static int et8ek8_power_on(struct et8ek8_sensor *sensor)
 
 	udelay(10); /* I wish this is a good value */
 
+	/*
+	 * Note: Misinterpretation of reset assertion - do not re-use this code.
+	 * The reset pin is using incorrect (for a reset signal) logical level.
+	 */
 	gpiod_set_value(sensor->reset, 1);
 
 	msleep(5000 * 1000 / sensor->xclk_freq + 1); /* Wait 5000 cycles */
-- 
2.51.0


