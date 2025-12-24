Return-Path: <linux-media+bounces-49473-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7746FCDC38E
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 13:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FF5530CA567
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 12:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD743358B7;
	Wed, 24 Dec 2025 12:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TASAy82e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BYJPXWXT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E19338F23
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766579488; cv=none; b=fLQrBfzN0Kc+NNpzIK3ZrBURLPdwpJSbKW3XBaU/wgR4DWlXnA6u9fq/BFteQgC2axIkaBGege+xLlRg9GSkEHibQNzxvFQPd00OYFMFBYG6SWqvvszCQglhTbeuM/VcZ88cWp1OErMnB4sTO9j3EdtTyhVrxUqhkEo99pGvT5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766579488; c=relaxed/simple;
	bh=snUVeDs23rzIxWCmdG5/hLGG1imrxP4F4RXFGT7/ovo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P6IExGnd0jsnz6B+dhsAscPpJ4aK2dByuhdSizFy8wMq1gamnPM2JTVmRaBBzuj+9nYZAybtsMlyeuNbxccUCkGKCj9ShR2k97C7aVQvqKLalsHgekEuYqqhaesiiq8qebsmKSqXZ4i17repelzV+nM+s67Ea6QeucsD13+MEHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TASAy82e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BYJPXWXT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BOBPAu1461351
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r7uNVIk/zN3/ta92Xgm1panDdfQVE1f+kEt/PLhrFlY=; b=TASAy82e5rB70/eH
	X6KO0EEU1wpOQuJg5aZnyIk/FmUw5GfVAtxrE5uZL2QWcu9j88E+5sNoLDNq1bxc
	y3bnuijyuXs3g3LygniBC+XsV8B29qKHyWZATucfxcaThoedCTv+CKANog0kO/ET
	sOpUhe33/USnJofcsTsoe6q4z6rBtDb5rc4jVuqoKg76CguCXXdKcGQavBVk3ZU9
	iDROqy0pfYJm5SY9T4Oi13gmo/P23VO9nNrNLALOon+aILRvLLf+kLMvlRh0Ifg4
	Dvw0JN/iGwZQW8W8KmKGVdMFCS4NQCtjF2qgNzccrrkz+dlzEGoIIp45ZnR5c+dJ
	GmS8gg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8fu5sr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1d2aa793fso150868961cf.3
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 04:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766579484; x=1767184284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r7uNVIk/zN3/ta92Xgm1panDdfQVE1f+kEt/PLhrFlY=;
        b=BYJPXWXT7Ha9AZxRwrDaPotJJT74X2mb1Htvp+/lEloNlTnmAlq1QJgp9tX1zGxiYo
         5ZwhdUkRFDx+rME4uLgyIOm4ClWjnNl41wcQaI98IqvMvt8RkCMhRJzFjFTadpygorTx
         1+oZKP0Za9eJV5sSkFad6xQnqB5KPwlxdL5OCxINv8HzliaBfQ5tbc2VlhI9cbV68G0u
         ulxidE1rqoAohNaGXf3LacuuC11t42U2SQMmlEem3rtlEyORaVwXgCG3nbfbz1OKY7c/
         ykU5a0A2Um5QMsIIpw93roA05PMDK0z7UtGMtRKZJXyzYFF4Wf0SlhUOoSshgv/0V/e/
         UUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766579484; x=1767184284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r7uNVIk/zN3/ta92Xgm1panDdfQVE1f+kEt/PLhrFlY=;
        b=tVxJVabkcOyKFUfieDD4xDLnIhNXchUwmAvn8pipQpGS93CmOxQ8OPOa36RMatd9zg
         IqX5BNDfdLabtP9UDw/4XHjrOykLylD4mo47HEC4uzPdhaljZlB7LJW3YpBT+moLthCM
         Zk5BhUbsSL5WgeuxORdBIFo03tEbBZLXFxwnbEPgD3bCOMmJd4SWsnaiHyj/2NcS6TV8
         bu3N+1to5BiVz8MDfwVLavITKbO9FF6OUZcARZrDO1toKuakJkMJEjejzdhc+tTPEXVO
         1i4pYUUzPb7L/gqtPiQIMB71sE+OkmJcGzkUBOmvbg20NEeNZOJr/oQfYjni0yAJOAUU
         GWTw==
X-Gm-Message-State: AOJu0YwB5NhbRzMqBM4L6l6QWpny+oASHG+R76s+BNI7Ew/0H0Miu77R
	rd/baS2ennY7xTXYX/TVTPRzEhQrZzcgbnGPHjkXwMMYWFNOmzVWBDzRAmsLZF8HDA5wIwk2YEO
	kpmjO9gQjwmmJla2STY4qU2iuWuhDtLNjpHhuLnPR/b3A8WYATw9W5uJKr+tPZSiwag==
X-Gm-Gg: AY/fxX75SmOAkscohONEmBf0dqE50n53PUG+8df8z7fYgFLRA8nGvZo6VdBXmF7wEQM
	bNm/4BTQGX+PVEoXfkqSL0dLsvdM8czvyviL7iRHwULXdUrd2LBBoBF/2QsEKgzDM9CIqc9wJAK
	iDs6U4nfhJ53TKbDMsEbmKj6mIljrXo/kJQjQiDId9H6Fd8VYu6KPeJV5RyGBG+c20astp2LvNC
	1VweF4S9S8fcZxkpX1A2KXOlBHIGJ6hHGa6V0+cNPvEjqzwiCmZYT7j2o5eEZcw8hERTtemmp0c
	QZzU4cWexIKsf6BE6G+J/ASeroanM39XiTZSO62Kp1yK0rT7+3M7dgVjxaNuhB45fP5LdSa+reT
	3lvKCAyO+ov6seT4o5n1aXbTlmGdFdKdK6fhL2Y3BUZIseMnbBx4b7uZsy+tAKlfQbG2xDybJlm
	0Zl4zjB4UR7THEMfIvN2Lo9LkEzpQkrOtPLfwMX0lw
X-Received: by 2002:ac8:59cc:0:b0:4ee:1ee2:f94d with SMTP id d75a77b69052e-4f4abcd0a56mr279202811cf.6.1766579484533;
        Wed, 24 Dec 2025 04:31:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5akLlgQGbgu/sBROmwJf/24Z+8Z5WpbSc+Yw9Og3V8Q1ApGGxQwIwG6yhTF9bMvS9kMMBJQ==
X-Received: by 2002:ac8:59cc:0:b0:4ee:1ee2:f94d with SMTP id d75a77b69052e-4f4abcd0a56mr279202381cf.6.1766579484146;
        Wed, 24 Dec 2025 04:31:24 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b12dsm1750304066b.48.2025.12.24.04.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:31:23 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 13:31:17 +0100
Subject: [PATCH v4 08/15] media: mt9m114: Put sensor in reset on power down
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-mt9m114-atomisp-v4-8-60b25da7a1bc@oss.qualcomm.com>
References: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
In-Reply-To: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: -5parchdKjVxdD13NTVDvVkhV7Bi0_zG
X-Proofpoint-ORIG-GUID: -5parchdKjVxdD13NTVDvVkhV7Bi0_zG
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694bdd1d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=8zVg_k_I0LZdQ-rHxRQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwOSBTYWx0ZWRfX9+/7JUP8rQr3
 EUcxb4yNLMISFHVd2b+OPPJzCoPVfQ8XztAnD6FA7KSEqSdXOWLObgV7XbfDLqpK5Qf2oEZSCQn
 tYfj+eutTtrXMMbPekfrOopLmAQ/Z3qth1yB+Bvyy21/cdClD4UMfd8IcnBm+XUS46Srjlnyd3Z
 UP1pS9gK55oDzvjxaHefyDydluxeQi4pmMbI223/63AEihkmiz+yZpK9FoXfTwnNd52WuxjkpNy
 8z6n6HwduwwY8FRzMQ1uwmAIYI3brSZjyZFfLhwAJNJwjVZ5CvucBD/w1/533tgs7PoZgmDJ0BH
 MluaQHzHVt99L2rUVVc4yaRt+7fUtI9eWmRqj8P8VOOL7E/fnpa0dh/sM94vEXP0WunhbRgk5lU
 dzQkVEyGRW1MtSPZJOd0klURhcNHq2JJ+gIVXpxPrIuPDauwaKk/aWiuJJGpJLXqgzfkV3iwxP2
 dVmcmswPbQ7eH6LrNIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240109

Put the sensor back in reset on power down. Putting the sensor in reset
reduces power-consumption by putting all the data / ctrl pins in High-Z
mode. This helps save power on designs where the regulators may need to
stay on while the sensor is powered down.

This also ensures that the sensor is properly reset on power up,
since now the sensor will see a reset high to low transition after
the regulators have been turned on.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v3:
- Improve commit message

Changes in v2
- After setting reset high wait 20 clk cycles before disabling
  the clk and regulators
---
 drivers/media/i2c/mt9m114.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 60afc32acee4df1e7d4f820838b72f6aa3506f8d..39f9d20221fee4f1d12c24a031d9f33c953b9a9c 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -2228,6 +2228,13 @@ static int mt9m114_power_on(struct mt9m114 *sensor)
 
 static void mt9m114_power_off(struct mt9m114 *sensor)
 {
+	unsigned int duration;
+
+	gpiod_set_value(sensor->reset, 1);
+	/* Power off takes 10 clock cycles. Double it to be safe. */
+	duration = DIV_ROUND_UP(2 * 10 * 1000000, clk_get_rate(sensor->clk));
+	fsleep(duration);
+
 	clk_disable_unprepare(sensor->clk);
 	regulator_bulk_disable(ARRAY_SIZE(sensor->supplies), sensor->supplies);
 }

-- 
2.52.0


