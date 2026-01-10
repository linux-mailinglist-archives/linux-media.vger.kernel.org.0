Return-Path: <linux-media+bounces-50353-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF14BD0DC10
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 20:42:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CBBD30AA6E4
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 19:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C96F1A9F84;
	Sat, 10 Jan 2026 19:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c1V10UK/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tv7+TlzQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2512D97AB
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768073896; cv=none; b=jTzmqRIiX5bFDoRorcWRgRnybqbOU9ezhgy1S7d4OtL39gDG1svSSihIiOQrYgQ/NyDptXiXsbV+J9Icp7hWEwLv4UYNIxOMS490YPohDShnq64J7ITwj6Hf1+ny6pyMHIgyUrilGOFx+NMD7CUqygWQP2E1K4NW/a4Ah2P/3vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768073896; c=relaxed/simple;
	bh=JslXq2UN0h55ZGQKK6W5GartLCm1dfjuGB41CNjkyvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gX2mTkWWh2IEugrV54MKEr6tP7xRiy6rU3S1YkLw546fx1HUABhjACumbPtNTYmH056vccFa6y13EzadMRdH1AA+KDoBMqeBnqAHHJ2iEr1mU9OybeVDSxzNt9Eu+iYs1XMX+OLcCGGBKiLjiEHMR82cVTl7PrX9GLg0kyrSh5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c1V10UK/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tv7+TlzQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60AEPR8Y4013648
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WX+tpGOx/XtA3egSToWa4xfPKV46G8xjtDhhWctRh90=; b=c1V10UK/4Z7EOUEL
	VubWdwbGMKEsMipAXSUStR+oQKY7IVA5K9MHTFKF8s/1oZ9ZEoTpGrebj7LiAdqZ
	gDkbpBDZcfjFKnBFuRgXkuE7uzQ2/maSo/pFN+hI1onRY9wNjyk1fxvTWQG/iD3Q
	RNX0wCtUMJPaMZF4kqdB+DDROPlCPQnxALABJrZg5DpvxBmEIgQe4cIz+fe45K/H
	wsbxGo82Phzgo0vb1VnYW84uVP9650YV2R0dC53O0iDTOQL2LyXwYPXPJtKqoNUt
	LTj+9VCS3qLTVLPR5C6Maafl8hlM8fXK9XSK7HYfpwkTYYbpQkr1vrzBdfL7kAiq
	8Niplw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkjvxrubu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:38:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a360b8096so139381466d6.0
        for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 11:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768073892; x=1768678692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WX+tpGOx/XtA3egSToWa4xfPKV46G8xjtDhhWctRh90=;
        b=Tv7+TlzQZjlUAtUI+ECysb9xTIpowXmvNqEFuYvZOC5vICEbZr2HJIswd1uKYYKpKG
         nFiTOlbUZ4oNu9eNDFh2mIai9DW1KVGLliisT90mSVf5wYzPqHyO9dip6xIW3OPPhuf8
         22RruYZ8Uy+RNT0BZnatenkXKtEzIIQVlZ/46+4zQWnkvKPXHZ+34HQEWWOsrpRGhSoQ
         TZyRK5czjqiMVYjwqLIjFqnLhJl/Mis3qJldlOLqL/wZX7y+vEKoWFuYbU7AeFcESpr9
         UDx/9I+LiQNjYitiuny7YJ/WNyGTi2MRD6a+8Orh7jZAizWqEedjrLphwxZIv9O35Ov/
         qlDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768073892; x=1768678692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WX+tpGOx/XtA3egSToWa4xfPKV46G8xjtDhhWctRh90=;
        b=iw+/tqvh/voLirc9D3qMoEyHeztbETzKr/ue+HBDffThKGOtYuc9WEK078uXF8XBu/
         WSK1FdlFfYVylYCMKt1sRvk6qlnwPBFR+wMbQ+uBhvi1PSeLA4IG4BEoW3T52/zl0u0R
         UupkzLo83x78xQ5gt/Cd9WI/beCWNWVZolTxMGAmPrRu+/mjX4+jOFllHTc7KYdW6uNG
         ioI6zPU4NQhBPYOutnwrHP7pRWiGmrsxzqq/kMeMGJeDc6+au88TuI7YP70YCvQxyzWD
         EW0P/55yk2ZLo6dz3bontAaTXR5tbUEZoACDBxsaPSyoL/SnxobUgIeqYDMRO36i5Rbj
         MmWA==
X-Forwarded-Encrypted: i=1; AJvYcCUU/LO/+yn0Gz+4AriWq07AOaZsPTXdY0PDYEniCYS0TZ58dogjH+UkOqhNZ6on7NeYFdaFqNozQGTQIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLKs4Val3KOUEHo5o5nNc+8zR2Cl9+8cacuw6LjhlflvWG1esu
	b4PsqrEGnNb60bieClKfegx1RuiVAwIZaOcsiANkOHdrwNiaxT7fscYjPwc4ErObK+jRp47DH6+
	FuIZmN+cV9qYdsWONJxyXHkYJrdQB3li5MoX7Ce2Hn8cqxKIf1E8VBDc8ltNa+/Sdsw==
X-Gm-Gg: AY/fxX6TzkxWR07Sc+ORxwGpaFBwnvs73woACWtstj/tk/3ZLKkdIyUwEaNBMmgr/Vw
	Kzorb7+GiYdmaZe5l5C7Ikg/LzTgpm9COoj4DhXZQHiijJ0CqACug9y0FZd8ig1BDUjEvzqj1Bc
	Bi2Hns2LPVhq8OKrzfOxvyDVjObck+ZJENcJRPie1zeCPQYzWFQWAIMwkB31sVNzpD0VCwwL9Hp
	Ie1j3Ca6164onM3Xr4Q+Mhn1l46PFbdE7McLnEeXxCP9rCxmVsnDqvk8VOmx63+8uPnCVLV0spu
	9azZcZZ3dMGxww3X28SpWEtLPo1QFNeYyAD0UDkaLmlaw4Ch4PrOMhocAjJhf+zIFbNUj+AHFGZ
	ndTChO6zE39Vsvjs42jSgLkoiMK5cGIlMf6ggY5ZZQ3m5B1Mplbs7OL8bNzgkKvRa+CsIYkTruY
	cN9PsVGwJfK/5AFQzy/pmzkcY=
X-Received: by 2002:ad4:5968:0:b0:7e3:cc6e:3c89 with SMTP id 6a1803df08f44-89084270b69mr217618686d6.56.1768073892492;
        Sat, 10 Jan 2026 11:38:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECeV6PNptdKbFZIIGvq91wxzn+Aus3ciw0GrkSflBtIOmUWwgKzzKf5agxfyj92y7TK4QHFg==
X-Received: by 2002:ad4:5968:0:b0:7e3:cc6e:3c89 with SMTP id 6a1803df08f44-89084270b69mr217618496d6.56.1768073892115;
        Sat, 10 Jan 2026 11:38:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 11:38:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:38:02 +0200
Subject: [PATCH 10/11] drm/msm/mdss: use new helper to set min_acc length
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-10-dd70494dcd7b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1301;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JslXq2UN0h55ZGQKK6W5GartLCm1dfjuGB41CNjkyvM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqUNvcF+p8D3B3QRC8FSeYNjnIpYwnquqU/d
 9hcYY8M45eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqlAAKCRCLPIo+Aiko
 1SZfB/9ZRCI45bpqc/DRBI659ZGLEIRrafmzdVFMrFYbxdM09ocXLYE6qaempIc6CfhkqVsz63h
 M8N9L0NnAADdAbLKM/cb2NF5wV+ZYT6hO84trAB3IeziCx64FjWpU/xbdTZQZYmCpFD9doXruqV
 akdyqY9fQ2BPYpAdqu3vmDV7EmUcVABo5ki8FLdI4o/eCbpvFrm8MRA9yddaE8weXm1o2Vk98/N
 aDZ4zQHoq+le9fRJ8254bJKU2Pq2yhqBrnXz3OsyPaRr2I54yVXTfSRzCcUw3LzTsDNIJWK7j7y
 UxsDTmxpaOgAXIw7+9kNFJBaW6tgdzayNJ/hF1XZ+63weYoN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Wrsm8Nfv c=1 sm=1 tr=0 ts=6962aaa5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=F1F9tmq6QbaLjm51Hh4A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: mugdyRW2fcyKwpIHT6dZbwBTBXoqjcdZ
X-Proofpoint-ORIG-GUID: mugdyRW2fcyKwpIHT6dZbwBTBXoqjcdZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX99UMweezSK7i
 90gDjBNdHbQSyA58bwqntE0OaVO9itd+9EfSUBb8OCcJoznxzFNr4jCkEnwiQuJrnzf4hcKJu0n
 iUrVSTMwN4QLpSQB0Zr109ASRV2WrE0pbCjCfoyYLELW1Mxlzr1XJtgybmnoK4SD018/LW5fcpw
 ASu3eqO9H6t2g/L9x3bvFEEtFInDImjdnlSQelg8k/9uJ0B+iEhxrUt7tuoZj7cJieVjJSe3FpA
 lemoEsrxqUX71UnSLUigqr8Gz6xbuCLbJaJOZYLkcO8xCKGPuRujMKjpRZFmTY3sSiX6m3nJkIZ
 Yrg3fs8UFKsA4juiM+0xNUvHH0NTa8mfFd6/NG+BJso0jL9W2gVm1PaV1/OEZ1E8Z0no7e+MoLJ
 v9/wpJM93I1lHzmCSazcCYF4roY/wBS1LTZwrWT/+auS+QJfkGdk/QmXCfLLLAgdCSEVQiXjLwY
 fYnfXiENC9cYdcbk3dA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100173

Use freshly defined helper instead of hardcoding the checks in the
driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index bf9a33e925ac..da266753df69 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -175,8 +175,7 @@ static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
 
-	if (data->ubwc_enc_version == UBWC_1_0)
-		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
+	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
@@ -193,8 +192,7 @@ static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 	if (data->ubwc_enc_version == UBWC_3_0)
 		value |= MDSS_UBWC_STATIC_UBWC_AMSBC;
 
-	if (data->ubwc_enc_version == UBWC_1_0)
-		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
+	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }

-- 
2.47.3


