Return-Path: <linux-media+bounces-50262-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A650D072B2
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 05:49:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FAEF301D654
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 04:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90AF1261B80;
	Fri,  9 Jan 2026 04:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CGB5MtIT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TWhea14/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22CECA6B
	for <linux-media@vger.kernel.org>; Fri,  9 Jan 2026 04:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767934173; cv=none; b=ikSOtMVI9B1SsUN4/RLxJiJXhqMaOhjGVVTL3pM0vk0Iz+dulPJcttazR/MwGsGqzAG9xWINOMJz3+Z+P4EchbUXp3hjyg+0Nfi9FhW8Vil4MUlc4Jlc8VTz0Hml5pdNafTRGot07ZANOaStX6fQ0RvuELtekB0aypROXU4eB1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767934173; c=relaxed/simple;
	bh=5nu0clrNhiT08OdX2YjcD+8rItHzYZs7mGppKc9/fBw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Gfj0+J9dd+dehCJABWxWX0wgqfLjFRC8y7YU9OhKzj4Gb3/sPEAhEFxu6XYzjYD+D+V/BVXErxzH8YvQJ4tnxt49z+G8KDZXnRdzmt2rkr91XzX8eVUAlU9eLLBZB4W9QpIddc+Tw42I9lywayu+YfedR49KPDDEPXyiyHjmfrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CGB5MtIT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TWhea14/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608JFoTG3019527
	for <linux-media@vger.kernel.org>; Fri, 9 Jan 2026 04:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aZ+/ekIdSYikpbxfIVe6JD
	OX0MUg3x4flhnwmoIhSLw=; b=CGB5MtITjQGVnw5zTcpD1P0jJRUik9hrfZKYzR
	jQ+uMCyX0y8S/ckVnXL/sUA8pw/OtXxgIpuw2iftgJm2YDxeh1EiYZEJmgKzQ8O5
	9hNTdXHfWOrApRmGZqofSSQ9Sw5nuinj5yPEyiThnb5fyiB4rsubtF61JZ7UbKfP
	0T4pukeEstwsXxeSZ4m5wKZOMVW98adhotlqwAYwC0VxxrHM0nX0q1y25/FXtXM3
	9QhzsN5D3BKiTPZreYditnK6gS492rJcao5V2exmZLxBCF0aVFPXFWkPNx/FfW4R
	wzLrsOx4ET5SFpwdXxqfg8VW8n7OKtvepnJTfQm6eSgDtziw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjjk3hamq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 09 Jan 2026 04:49:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6ff3de05so109400901cf.3
        for <linux-media@vger.kernel.org>; Thu, 08 Jan 2026 20:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767934170; x=1768538970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aZ+/ekIdSYikpbxfIVe6JDOX0MUg3x4flhnwmoIhSLw=;
        b=TWhea14/kOmnIbmCzCcD0d5iIXxN2miAi8OZ5IJqXxDev2jXegVH39hQWVMl7XwBNO
         VsXuRqeMnvhbnIjl3a88V2VXla11EKiIlu0dN4VL5AcxNqJBZNUD9Rbm4UeGoyD0r5VN
         WMd998ZThfp8ZQXAzofdonL61SAoqfXAud9mrhf8XDNFa4nWHOExQnAdyhr0UYmXLDe8
         hitxFh6bOfn7at2DvQK2aujgTNRsXNzxghFpZEKUlKGuHKNeXDdGDXyxwYcL6PHLKhYV
         G3o+rRFDEr79YrNE6i/pd1yLWXTWJQ76qezZ4TGs6GJhJE8rJE4B3/8ru+ZJIdLKokQf
         YtBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767934170; x=1768538970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZ+/ekIdSYikpbxfIVe6JDOX0MUg3x4flhnwmoIhSLw=;
        b=dR0kwRtf9Q4NouwdAsRD1E3ePP55ZuWOwiMbBHCWOMjpCh1v+PjD7AJ1/5ZnEvm2KS
         wQKJ3fGAzEDenr7S9yqtbJGtrvzJv4HbCxEStoyKOou4agaYqyPT8pXvTzEqMaEkKuTU
         s77d8ppZGxiIsXwdP+wdW7zkgLSbiN8I4WJ09cE2Yq5PXESu93d6Ezr1o06qSbY5La73
         xuQmvTGTgM4e7NPF/nf5YoF6OWzUsbIsDp8VDsNn35zEQmrQIbRoL/rnvot44HxZj0Qv
         IAP100klzfs7k0c6qEC+hwD1YopUS8qShFsk6ba0I9VnLOU/M3Def4dFIG47xO/GmRB1
         FmDw==
X-Gm-Message-State: AOJu0YxDBWVj9cq1BJEOwRFcaWyFoDJhulOwnn6IuW9X+h/V7vJ+SjUh
	LWyIQJZC+En45dkA5IZodFFHEi7Ii06JYSBxp5MyoQWWWBiFYrn5MOeZDWgEVdjq0IutfH8Yx1H
	+WilYu/xwChN6yhxwTQuQNH45Uw9zs7v6U8yAtOrqw9Dv/WWFY+VAJPtT8iqD4a7P1A==
X-Gm-Gg: AY/fxX4EbzymO+ahJtyviXV8C6XHHuSD3OD0gNljLcCj4+fevSWZJVB017/xH6P3GDB
	cAyf+MeO+twUKSk2/JSinDv4rAW8WyYV4SAL7k8Q42AaAGlGXfWCkyXGEZVwqtXDrXoJxNJfkBd
	Rb+cHUDR1iqDbyr64MN4iG/T31+R+BVgTnpYB/LeTn4oQO6/OSIgDHs1Gmf7yQs9Muez6ZfHdvj
	h8ZgPbjr0201tC1QfmXJJu+eSxlPt9b9IUSDbDNkTtBTgn6q0PSIBAIjJxXfctfObVy9Oct/0lH
	m985Dk41BjQ1kWydBnACtAb7hncDS0jy+it3+huLx1RDRLO6HugjEnO5pOx8EC4BLqmRIsu5LxI
	KLX0j4qTlvwG0TTTeihnJn3/TMKYtK5VGl0YTKURYZza9pCsMY0QSKLx/QIyQDkmrJQcWPwIe
X-Received: by 2002:a05:622a:5916:b0:4f3:59a7:67b3 with SMTP id d75a77b69052e-4ffb48c4709mr119260651cf.20.1767934170068;
        Thu, 08 Jan 2026 20:49:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2p36nlS/pu5IyinOLSzYhkcjkXOzckkWiACQ3sysHMqUNUqN6S/YQ8apY2qdC80DHiqx0aQ==
X-Received: by 2002:a05:622a:5916:b0:4f3:59a7:67b3 with SMTP id d75a77b69052e-4ffb48c4709mr119260371cf.20.1767934169639;
        Thu, 08 Jan 2026 20:49:29 -0800 (PST)
Received: from WENMLIU-LAB01.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8e36232sm61049991cf.22.2026.01.08.20.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 20:49:28 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
To: sakari.ailus@linux.intel.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        wenmeng.liu@oss.qualcomm.com
Subject: [PATCH v2] media: i2c: imx412: wait for NVM read (T7) before programming mode registers
Date: Fri,  9 Jan 2026 12:49:13 +0800
Message-Id: <20260109044913.3310-1-wenmeng.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Uo7RzqpL0n8wQOv6E3NRT6cCOTsfoBAf
X-Authority-Analysis: v=2.4 cv=EazFgfmC c=1 sm=1 tr=0 ts=696088db cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Rz3T_L-m2ZCUWiLNYVcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Uo7RzqpL0n8wQOv6E3NRT6cCOTsfoBAf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAzMCBTYWx0ZWRfX0oN08B/F0o0T
 ZrBfE9d7BuIsfeCmQNmOJlB7Q55mBL5Vfl3Y6OzQkPxT4uQH2LoKC34FaI/EHYt6eXCv8wVZ/VL
 WcvSBR5z91zTGtRafucPJxBR9fHgwPLNLiTsdWboOzMbw7IJEcX4duJ7TGQIsjeSoCRkrogYllC
 CUo5qLk0iwoUowIty3dyuWJjK9Rw10Iu1ZG46YlyCqqBb8N4ALzaO1TM8IWYR88NHJtcIhQZ7FE
 FcvdNDprmhKIOAr45ZqTx9G376WKu3tNu27JPMpu1ffrnf1aZdwIhO+09hBMC6o/xpSShea7dEI
 z+K7f5RnuaKz0uJJ/sI9+iala/5ZsNU8GGQ4x0/RAK1UBkJmUSkuIsFk1ld5UNjL6C7vMmrrg4N
 EQGmzjlwc96LjyVknXaP4jnIpxJnkLFynMjqLo23tHnVlVlrPnR3AmPLkUHHWVz/BTtR5Q8xYPC
 o+qdp03wpYo4wkggUKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_01,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090030

During sensor bring-up, the IMX412 performs CCI ID read (T6 ~0.6 ms) and
parameter loading from NVM (T7 ≤ 8 ms) after INCK/XCLR rise. Writing the
mode register list while T7 is in progress can cause  failed
register programming.

Move the usleep_range(7400, 8000) to the beginning of
imx412_start_streaming(), so the driver waits for the NVM read window (T7)
to complete before pushing the mode registers and sending the streaming
command (T8). This change preserves the original delay length but fixes
the ordering to match the datasheet timing:

- T6: CCI ID read wait (~0.6 ms)
- T7: NVM parameter read (≤ 8 ms) — now fully elapsed before any
      register writes
- T8: start of first streaming after issuing MODE_SELECT

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
Changes in v2:
- Move the 7.4–8 ms delay before mode-register programming to satisfy T7 (NVM read).
- Link to v1: https://lore.kernel.org/all/20251222-imx412-v1-1-51c7e724b376@oss.qualcomm.com/
---
 drivers/media/i2c/imx412.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index b3826f803547..ed249a95ff35 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -798,6 +798,9 @@ static int imx412_start_streaming(struct imx412 *imx412)
 	const struct imx412_reg_list *reg_list;
 	int ret;
 
+	/* Wait T7 (≤8ms) so NVM read finishes; avoid I2C NACK when writing mode regs */
+	usleep_range(7400, 8000);
+
 	/* Write sensor mode registers */
 	reg_list = &imx412->cur_mode->reg_list;
 	ret = imx412_write_regs(imx412, reg_list->regs,
@@ -814,9 +817,6 @@ static int imx412_start_streaming(struct imx412 *imx412)
 		return ret;
 	}
 
-	/* Delay is required before streaming*/
-	usleep_range(7400, 8000);
-
 	/* Start streaming */
 	ret = imx412_write_reg(imx412, IMX412_REG_MODE_SELECT,
 			       1, IMX412_MODE_STREAMING);
-- 
2.34.1


