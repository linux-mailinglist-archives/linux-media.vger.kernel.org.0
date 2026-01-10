Return-Path: <linux-media+bounces-50351-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E83CD0DC04
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 20:41:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FDC8308BA19
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 19:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C1B2DB78D;
	Sat, 10 Jan 2026 19:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HXjkNgiv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CL35ecxC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB952773E5
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768073893; cv=none; b=IPD0WW+IIhvvywm4DQPsm+LiHKPU2c9XaXuq8mvdyAGZ7FYRvX+ZAb8DhdK5Qmg3H25ojgEFIUPQslCA8tQ3/KEfSoUoY8sjR41iFW/0VKg8sO4cVcI2yVhCoa7TWizog3vdngVoMtdw/QfPISSkiFFzdn9CSEmpI0zmyQDIhUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768073893; c=relaxed/simple;
	bh=fg14kcuG7sEkK6DBaOxh0G3+G0MJLBZT2Hb1acuuvlo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X0vw2ne/ET2snQJi3UBqtEeeOOLcw9leG8oTtgsG1UzlqC+wVE4lKgAmHm6Cq9//S4SJAKF6DHYxy5DWOQxjAusS/BQRK3GApFbW7Ag6Hk5WKVL8UUuKrdAS0ILQkB55Pi2zjA8uxhD8uY/xp8SSvKB6wTD5S2w+7Rr+cyMEi/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HXjkNgiv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CL35ecxC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60A6o4V92630729
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:38:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	44E0YMx+5tHokjY5JA6iZJ4USE2acpUV/cer9MR6AVQ=; b=HXjkNgivG9EiPBSr
	H3tpl86Pn3z3IzXef7b/+XD4f8reqLrZyXmaif5m6sp72PjfmXx4iZ8QOkpcn0+C
	qNRKZxJRqF4CKds5O/MkYH49/tgeQ9FB2RlpD865G/8ipc9FXyl0yRs+fFdequKA
	xJZ4noZrWrlHj0UjD6stmcdACd883ZcrjYjeC6l4vCJenq71s9e7o7YpKja2aYNG
	XjZcG5WWw4W1oeIND3d1Pyp+688rwEwZjGlUkKy5tljuPtYwkYaTLf9iF+vDNyix
	i0Sj+eyT9THGAkh8GdPC0EmD1K1IPRjJFOWieKGcS+NbSXO+4SJC5xFK5nSAsPID
	P28P1g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkf5795q9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:38:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b8738fb141so1120328185a.0
        for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 11:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768073888; x=1768678688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44E0YMx+5tHokjY5JA6iZJ4USE2acpUV/cer9MR6AVQ=;
        b=CL35ecxCIH/rR44HoDk7+SOz9Jc0mh051P7B2UvCZ9PCDhJVY/r2IhHgzQjk4RZzFx
         ag2WLKq7erROlO7DbNb+YgfYFmCkfhxWxI4eXR6L9fBm7r9KkBbBsl7xPN0YRTLaDps0
         shWPmTfJTSgnDgJmbtMlohyVPOvcsfTKzXkEHtZ0Vw2jthQ9gV8xdjWoYmIE9iHIXEw1
         gsA1w+GAFbrHhTAAbH1NuQQAtcfGWA5Sn5aSil1aZ2iBhM6NJgpBq6C2BQmzRAaxy8OX
         NoDMKpRVidQmEOYcbHJfM7fdAZUf8pFE7m0SwQLt11Ruz2TeLtc10JTdLL1SttWnm4dt
         9A/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768073888; x=1768678688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=44E0YMx+5tHokjY5JA6iZJ4USE2acpUV/cer9MR6AVQ=;
        b=Id7NhN+0RXaLdi9B4qw1+u2MkqAbj8W+AI+I5U6IsWEoK0ZGU38at8r0nDgrx/Yp3T
         FyKGFg+EsqpsgTbue39S2GQU6upg957IbV+xqh+awL+ferJu+Ja7eHjUYlixlXWVEJHU
         yKnxFEiyfcOI7Co7SgI6XBdVoRjY6QzLxJFh55BO4mD6U1XBkee0kxmDq2zTAzVmR24z
         01BghcH7DrZJPDsBn+XTrfAzvPAcB4N2nV8wxcd4rd1SfGGnx5EJ9dstnOZ23IuHfgIZ
         Gtvaj0HClrIHGBkyTL1mO9qZ/ghXOO/fISFWFeVbFouHfyoLxlWf4UbkrMGKAkCArA+E
         YMGA==
X-Forwarded-Encrypted: i=1; AJvYcCXjbF7FzfYtUAlNeXnvUW48m3DcRAT8JF5WNZQJk+DduhuPTu5234odNXn8xYdcu77MJP0FKVbUIFWZ3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8A4ROHOKfayrRvslSleYsSnUOM4jt20eWiW+6D4WeodHJxQIw
	CvCJ1cjcC2BFr0PaVcpjB2SWRU5jQp9PqcrmPAhYauwhGSyrZtIv0apZEcwgkfBrppV9ZP1JOE+
	9yiCPVYmbC1oWpBlWIZLO+Xp0y1w4pPmjMgxOgDAQX3mPFOVy/NzXMT60Ni0S7k/6rA==
X-Gm-Gg: AY/fxX5An5trgcCg5L2PPWGYpGz3PNBESPSDef8YFOgM+4qXTu9vaNkQXBIA62V94TZ
	JANdh76yL0+1C2HQjX4qGQz2K9xjovSmyB55MHDJhfTychae7m4Qjb5puFROHUKMhvbutFUfqbN
	mMZWaSJ0i9sfMM/c2l65uA9MmswnqPhM7AnVW+bH7VwHps4/OhfVhQDyuefH6YdI96FN52kbp4C
	kNDjvKfNwBfoqb8IV1pfyei3XD+kY1XlEjqn8YcGP4k4eWOnE6fOJ+pvIhCtPmhoKeM9b0Fk0Rd
	yQ7TrvPA5tOGBh9mdvF1Em9IJNLVuL9UMZhs5NLgSJIbf/p1avhFu7IMb1PK7tzxeKfGEQU7X7b
	a8aMMDkwwcvnTeH3RfZ2kgOvLjqPKLX9U6X0VKf2WRzEhojXhDNj5bPnv8VXOIY+/W1PgDp6HHL
	UXY7qqOc3tYOVEu7UXTax1MTY=
X-Received: by 2002:a05:620a:3911:b0:88e:1be9:cf65 with SMTP id af79cd13be357-8c37f54ead9mr2456980585a.39.1768073887811;
        Sat, 10 Jan 2026 11:38:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYrHPeQVAQ5a3qfu224MPq06XLRTO8fJCMxGIN7Nr+mANrQ7JIvuzpudnNJOXpcuYnKvhw7w==
X-Received: by 2002:a05:620a:3911:b0:88e:1be9:cf65 with SMTP id af79cd13be357-8c37f54ead9mr2456977785a.39.1768073887328;
        Sat, 10 Jan 2026 11:38:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 11:38:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:37:59 +0200
Subject: [PATCH 07/11] media: iris: don't specify bank_spreading in the
 source code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-7-dd70494dcd7b@oss.qualcomm.com>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2158;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fg14kcuG7sEkK6DBaOxh0G3+G0MJLBZT2Hb1acuuvlo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqThF450ml1fy+pA+0PHm2B6NXSqtzr36AD+
 ljU4FlHNo+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqkwAKCRCLPIo+Aiko
 1ZzXB/4zieglXpBPj75KASN5PU2K9vLJef2+t+9cCIa679c9+TOd/xJhapOjVu9OZ0Z9hjIsds9
 iHGS7VfkyO/il1Q58SY1h0vN05uDi4RkmNwoOoNZAMNuuP3xpiScLVjtZv9QzLo9T1rg+D8unpS
 +fOrZ9Xp4JFOKq2ByDcA4s2SGfbdlYCCTwaDb40246PH0YB49alyQkXQoHQVSL4EUXSlx+1t6S0
 oAH12jWo3WuaCHXZ1RrCZ8SZ5lBLv4WXJ4eZT2mF/92QyIyff7wkGDVf0U/xT2CkvJIlx9dhe9R
 wbPwnqg5dY7HnNnMa6sDtU5RNGtHeaKqoEp2nt7LrI4TSBzc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=K/sv3iWI c=1 sm=1 tr=0 ts=6962aaa0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DVbmZvK3Bkzfg3EmCNkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfXyBHjadcX+Ld0
 lKRwL1sT3wNGdjFMBImOvgYVnwOISWp3W7PN4tlTfL/hmqgC1WZ70/TsC8ufwmtHVbl+8f+hMvJ
 O3hFrdYnjsoeJLqY0/9i9cx94V9Hs+7378cUvwtc42GIARJiSN2tnk4/Ry/AAO50Eh+CIJ1cAfN
 GocghshJN8/PKVC/keaACvWATiJ7NL8x8M/5cm7sMHdO4gA2clbh3h31BXYqngYWLhf99m78ZTa
 zK3cjn5ZJY4bIxdvUoZykq45m6k48EoC685msXIxZnTOmz9tjCLtR+yOV2eo6lxavl9L2GE91Pa
 VhVBMVGtkl4AghitkRb63iD8aAl7zLWIa3L0JSI7+z9ZFNad0sfbycv3QutmGs5lf9P7JpWDtr0
 dqlgJzMImpu7X+q/R7wJU3gP6hVhD7vvVnAgI+rxWPMrelErzpmdgq0el0n/EaDhNTxyAmmhjnb
 JanbQBnwluX6owayOHw==
X-Proofpoint-GUID: fXYPyJKSMzG5_4IZ2peqnGiE6FoGP-Cx
X-Proofpoint-ORIG-GUID: fXYPyJKSMzG5_4IZ2peqnGiE6FoGP-Cx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100173

The UBWC bank spreading is specified both in the Iris driver and in the
platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index a880751107c7..9945c939cd29 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -199,7 +199,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_spreading;
+	payload = ubwc->ubwc_bank_spread;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SPREADING,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 9f9ee67e4732..f99fcbb8fced 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -73,7 +73,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	bank_spreading;
 };
 
 struct platform_inst_caps {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 0f06066d814a..c967db452dec 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.bank_spreading = 1,
 };
 
 static struct tz_cp_config tz_cp_config_sm8550 = {

-- 
2.47.3


