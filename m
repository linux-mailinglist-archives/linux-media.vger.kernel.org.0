Return-Path: <linux-media+bounces-50345-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE5CD0DB7D
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 20:38:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B4113028D43
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 19:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ECA712B93;
	Sat, 10 Jan 2026 19:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LX9KQVa/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XiNpoDDJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A89C22A817
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768073882; cv=none; b=NYB26Bb59xAOfX0euogKMzac9/l2e9jFYa6AeVADVBf6fdOL01rHrT+iRi3199HP9KcwTzdARn3TTo+m/1jhs7Gftp7UhET6nXXom2/m2QkUV+OiLs2HTGdqTvD0f4ynR1vjgKKzpPNNsBJwznSqu19v69HxefRqvMUj9s0nqqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768073882; c=relaxed/simple;
	bh=Pev46xI2YfYCEJWpoooLY3aM1pLiw3PESsmECFYvSaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EhJ03wt7PZwyjS6sKUsTn4HAXszG6GEw/1hSRYjiVLwR6wvR5h4kdNdtZJoZc/Cq0IRKKTx3mGiGMadmvaHmF6/sx6jh6tl5Gg6lxF5oqSPMF1qsWoCq1XEc9Fo9LX4EssAA/03Y1PIHTpX/6PBC9z1MQwqislChM9gBV6DSWxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LX9KQVa/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XiNpoDDJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ACkoIP411417
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jf2DMqzpH2JNy8Ab3F/hxDhzYlf86bFDL8kNrSEC6cU=; b=LX9KQVa/Z4wfQlyb
	Gnk652sr1zmAP0AftssihFWn38yvYultqDsukCSI36Pia3/M0AD8DJRd9QDpijIv
	TU+uGP6j9l0eEa3JvXrwMWiK/cMwsbsVRKwhMksW0FDgFqX9wBc25gRC0A8YL4zV
	4Pj0u5R5UYneTAO99aiUPwp82KYAQLz9MCqWkOZBXFymkim/f7HjhJHxi3Llz0J/
	w7uzdXLIxaWHjT5r/3To6nCoeYGFafXuj8DKMtsP/WJi+5W3dtSsVvZNQuFjLTij
	Nh0QORW8Gg63s0AHiW+vSCiTzoZXFYQwOA/SBsGoNbwNJvOVq/1dzsc97zB441Ub
	rWxXBQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkds599ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:38:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2e19c8558so1255146385a.2
        for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 11:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768073880; x=1768678680; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jf2DMqzpH2JNy8Ab3F/hxDhzYlf86bFDL8kNrSEC6cU=;
        b=XiNpoDDJqlKl+Q5yniGk31eMm2T4LSMoEOeOKmPUSKCF+HFCB9FSplfbHKAgNOcq6c
         ft7ek1C1WIZXJyTEwh0gVj3jfacit7/l9OCRLVT863NChaSUEly3OHProb/Oo25eMJB/
         jpaMYhmCpYKK5XJuCQrmmSi34sSVeU4oJUtecVK9vFT1goce71+WZhZvSJEJK/VEftW4
         8BCbFZ8+OFCkTs+z9pE0R0KPVtIDEgE1re2+WAL6owNCuytXWI1pa38QtTd82G//45nI
         gxL7hiIq7xyyYiAJM0TQ0mVbIGnarDiN6KpnXbdt/b4Qu9NnBwXmOFFMgzG5uftGOrC6
         sdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768073880; x=1768678680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jf2DMqzpH2JNy8Ab3F/hxDhzYlf86bFDL8kNrSEC6cU=;
        b=c6gO4Dxjb4RVYoQqLtSGWPf/MAjFEGhpuxZH48SyMZQjm4ivA51ZwUfUsv15ACgVIn
         F71VpAgVUFW+5jFInSzGx6ewaD/zi/axgN/Uor8Z3aTscn96PJQu8Rh/qIveRLZ6k6xz
         M9zesUZWV2L1LB2tsb9HtjsX/8cW6kwT3oASDfKWCvmo2uDpYmjStD8ApdV8jtt298Yb
         gX8ab2AsWReM9VczUTqp53YMYJ1O/hs/u2YsKAqFKabTAhgf2HXZoI4+d4xaP5KkG0fa
         Kwq83e5vFgb4MNrPUPHJJBuh5I24FmgAA+reKJj54rsniWT1lE6vVPgmbZTNLfQpDe6Q
         w+lg==
X-Forwarded-Encrypted: i=1; AJvYcCUpbz1Y3ota0briuX6rSB3jCwzma1gBi5+Z/7dnZiFeFFKPK96tV2TBNs7SUCdQnoEC1kdoZrcrvDbqKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoShcqKxhYDvnmOwfTKYmzekFANjCzLsStdGpEKOhGHOmPrVmN
	rptP7wDp2o+++jHTmZy6P5k+ltutvC2nZUQ/wKQEKox/JS1+MfXJsWF5LlJ0yMm58X/iYyFQnFB
	KDko1VZHTbT01x+WMq3yaElhVS+uEGPPggxAujh2RLzXwVi6ATd2oynETc51/DEz25g==
X-Gm-Gg: AY/fxX4y3PD1NnWlqeTwLHfY0hxLJ2c+zaylx58pzgeciJdFhO+CyBxecFc9xPUr4BD
	wXSRhw8lqKXpHo9En2dGAtw2IUsofkTm5qDpWg++KuFReMX593aaAQGvxAwop1H7dtEAz9UEotM
	XYa95N1YEecr6KH2Qe2y12K65a7h7HUrKuLma6iSKS6gUxnueHS6EYRpWc3zwe9GD5Ptgz628IH
	f5vzXMDLTLmSTH62moj1dl2ABTjwO6y3AwJawv26LLxM25kAatCzJDY17QSVkl32RBPOi7VIRdH
	eeIF2+OXKvPc4zdNq9FLku7d0QCm/UlwcBlZQ4Vtghv2DlcXTYkkRwPnX1X5DcyVORoyCKLKgtt
	Coalu4nQVqUMk898uuG35DyvmglB3EpqAwbAtVu3/cqwa7XbZazZ4qQgvGwrQD5eobNLpz9Qd1V
	BebZLGnr1FRLIUE4dUvCWKzMg=
X-Received: by 2002:a05:620a:44ca:b0:8b2:de6a:ca with SMTP id af79cd13be357-8c3893f51b3mr1951175085a.52.1768073879580;
        Sat, 10 Jan 2026 11:37:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGYu67S8+CPprNVyWfVMgX0OZCAew+jbVfBF0vtbN3BVGruygTn82tAUaHZh9q2joA/HE7yA==
X-Received: by 2002:a05:620a:44ca:b0:8b2:de6a:ca with SMTP id af79cd13be357-8c3893f51b3mr1951171285a.52.1768073879121;
        Sat, 10 Jan 2026 11:37:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 11:37:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:37:53 +0200
Subject: [PATCH 01/11] soc: qcom: ubwc: add missing include
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-1-dd70494dcd7b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=720;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Pev46xI2YfYCEJWpoooLY3aM1pLiw3PESsmECFYvSaI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqSTlADnmSJixHP1i4iUNQp2Ni2QraKzhFRg
 de9h9q5MmyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqkgAKCRCLPIo+Aiko
 1ao3B/9bRdX/gIVDx8irfCSbubecqdZX2hosHW8QH6AQ263XimJTNOzZLckyYqiqjEPTywu+00K
 baULI1Geph6PkbOa2tSonjMdaVTdoqpySuYs6gW6lQHkhxSzAh//IYw5ciXiGI3AI/MyoXPifFy
 lJfhXeDiD1o2rjl66XJlvF/RH0QEHiBcgYVYRzN6jrI87MhX9fyzacBCXYR5K/40UpPwxt5kgvN
 zLp+r2GGp2KcSS/bQ5u9H/3BcjUJ4mpi1j9Y0WB5sMlMkvbWxHYHdTzd7hjCXlcTq8F21KvcbE6
 pPbB+FYyohLnIjzqpQXxYvXbmLlD742an+iRMvpo18QOZe60
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: WRvj58uQcEqBPIhZ8IlnB_NQaEKvJxPG
X-Authority-Analysis: v=2.4 cv=c76mgB9l c=1 sm=1 tr=0 ts=6962aa98 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ALiPkwqszP5KJWpCD6MA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: WRvj58uQcEqBPIhZ8IlnB_NQaEKvJxPG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX2WBXDUSAuU8r
 q0rIEEHhWsl/0oSrzumSoTxvwtwjQ681K2lQChExjNGZH0Z5tEAmnC2MEKMEntXwwt4ff/HxIWh
 6vFg1u2ZhUN97QO3RreGre26R1/Pz1H6GHdkF8GI8OExt59yV3lnts2umlhUe+rq5EK/Sqpn0ht
 7ZIdWAK8XnXPIPDYJZIZhGurJmQGcJyP2wlM0fp7Pa8ROB53YOvNCOsC+IcBhce3L9gOvj5QIVQ
 dY7/R9uc2EYQSD+rLo+CFraUGe2iWeGu9xmX6/GHfM4r3410NWijARSsoZorvmcpq+1VjAgJ95/
 5h/yfFT7G+Lb0mlDAIEifYaqkRRSlfIqm2Zabl65evb8TRrKWAxevv1emIepUPMxphESRhZAldJ
 HM8QdRBUSGgpuT6CT0N2zfA53Xa2F1br3pVHW7jPeoPNJpekkczy21ELMMBoaN1eCAOaZFk0pnr
 ULI58kfN4sQE2TfPEeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601100173

The header has a function which calls pr_err(). Don't require users of
the header to include <linux/printk.h> and include it here.

Fixes: 87cfc79dcd60 ("drm/msm/a6xx: Resolve the meaning of UBWC_MODE")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 0a4edfe3d96d..f052e241736c 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -8,6 +8,7 @@
 #define __QCOM_UBWC_H__
 
 #include <linux/bits.h>
+#include <linux/printk.h>
 #include <linux/types.h>
 
 struct qcom_ubwc_cfg_data {

-- 
2.47.3


