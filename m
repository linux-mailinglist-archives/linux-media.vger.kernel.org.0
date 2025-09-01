Return-Path: <linux-media+bounces-41398-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CF8B3DB21
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 09:34:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C95343B3D83
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 07:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE542270EAB;
	Mon,  1 Sep 2025 07:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zyj2FdeD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E1E26F298
	for <linux-media@vger.kernel.org>; Mon,  1 Sep 2025 07:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756712022; cv=none; b=dQdtMZNO3QmuAzntPFJPJMtAJIjktPzqwo41s0BiW1LMBGmVFeTC/t3qefCvbeqCXP3sHauiLcO09q3LF80ePZuJWJHXk+rhmY4DkUzQ3aPmyQPI0wgGcsqxmzUhMou3U6BAQpZpRk7VGKoHGAP5pOLNisFN1e3OCjoiOowwZhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756712022; c=relaxed/simple;
	bh=1z5soL92eC8zffCxJhz/a6/ADgzwmSCCyVSbMCgjXJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BUx54dsh33q6sCllk2tM8fNupi3Ap2sQaATCpXYTgz9BH+wY/QTknhA4JOEE+T1nQl8ExvIycagO0+AUdv8qv3DVVpEfhqLUO0HmtR6GpsU2tr/CaNe+8LIWBeqhLfwOU03viqcP0b0giihhy/G+AjrM5TVBfYRcr4ScCrzgU0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zyj2FdeD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57VNw5sv027871
	for <linux-media@vger.kernel.org>; Mon, 1 Sep 2025 07:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iS447CDueJx81gqdmdCm+59nRouqmaLm51fnjKALN1A=; b=Zyj2FdeDQgi1v6z4
	SBOe7gdx/e+TqAhleGjzdl52R5aDVd7g/13WzLJQRtwT6XmRCf/iBnRsj5+sTjQA
	ESZ8str51+3IAUd+5ZdwqR/DEr8lUUjd7j5fSCdrWBl6L9S+BYJlRB83EYtXc6pG
	0e54ywcARry6UgLghPyPwIx69fmegokGNkgRUNUqw3YVOgfNPciKXOLE9cmBSBVL
	iYRkt03wCOr3pUgQC8lq5CGOf9XYgf26ZvP/ATTbT/sJttIwrRwxl6p8LOTooaE2
	23sUteVMC3oEVJxXfVgy4yggCXAHrfKwiYn2Ds6FfNGu6/X5XReUddWKa3XCjen7
	4+MwDg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscuuqu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 01 Sep 2025 07:33:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-327709e00c1so4312557a91.3
        for <linux-media@vger.kernel.org>; Mon, 01 Sep 2025 00:33:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756712018; x=1757316818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iS447CDueJx81gqdmdCm+59nRouqmaLm51fnjKALN1A=;
        b=ZSpBadiShpPYUcrkcHTOBRYr4ps+m7rZp9TsI6+rwcR06qU0tCLqMTN+wQCUwJrG/3
         +UEOm9R4L2VxeNvAt+W7QTgCpR4DZ3VmE/pHFMfCNONfHRPlTkI+CGO1IeCpP8zRT4Bo
         We/4uyKY9S3bKv0ORIME+clpaz+ry1TP0JZNliw04f77YjXFKVEm9piGKgaXQT8yoeXQ
         /zj8aZJjz3vcsdA89oaMI1KTD4UJdHXE9m99BiTPwVhIEfRBARfo9+YT4y1+Kx/Po8lh
         F5TCjDCEdnYd73PXtQaPq49LN4UTenU6bZEO/BowI7DCChnWj/Sb/y/bGJnGkyoW8YMU
         dSQg==
X-Forwarded-Encrypted: i=1; AJvYcCVt62OlteNE2NguxDg8Y/IXc+h0IRFMeAt/xuoldUmdL7AmFYr39y/S6cBkEduGvZmgWxvgPTsRT5xjSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxuq61t84Qp/3ONwyWWtJVD6njfM7OXbvxC1pIdPxkoEfNuH8gL
	fLbtWvWhzHy06zYLZZFgkRPPH7eZ3Ekzo9eMgJLRm0wUsz9uyFAmnvQNVFSFx2ecu6mxMM8G9p9
	9VCanGleEXJp2rmSmt+/n13K9eCrv+6ktbU7rWtcHoVLWQItwKx5LwhMemSHD24cxBA==
X-Gm-Gg: ASbGncsoPo5msCcR8ZueGXHm6+Gi08nCyMF263bokr2i1SuQZJqZ0akwz71N0UUxV0t
	R89I+2d7OTo90V6Lpt0kOWEP18o6s4uwbFznXVM+kHm3w1/A+czCryksMWKOF0ieZNZ7esGxVhf
	KuTdbsJe5pnY+Qp62u2bSUuEkdzOqY5365KtqRrh4+QUHp/CBWd0t0biOJxKFY4bDP0CVSkpZVx
	RqnV4nzeDSOOisc5N7T/nb3sQNZS+22/2x6ZfL8JdPIRktiQrb03rQb5CfK6z88YvkcOkSqjoVn
	9wuKifWmYSf//BXgPDK9N2d7AeOYvRLlgb/sjsEHgrwMHjBnOh/EskUzE1v5Rnc+v/W2s5XV2zF
	3Iw==
X-Received: by 2002:a17:90b:2cc6:b0:328:fc8:2781 with SMTP id 98e67ed59e1d1-32815436289mr10246021a91.12.1756712018315;
        Mon, 01 Sep 2025 00:33:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEME11N5ENX7J5PMxn2/lOmJlxyjF3CMW/f8cATDCTefSoh8Jh05BTtdhlj/iDZcxU83BxCWA==
X-Received: by 2002:a17:90b:2cc6:b0:328:fc8:2781 with SMTP id 98e67ed59e1d1-32815436289mr10245993a91.12.1756712017773;
        Mon, 01 Sep 2025 00:33:37 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276f5a0bf9sm16095554a91.13.2025.09.01.00.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 00:33:37 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Mon, 01 Sep 2025 13:03:28 +0530
Subject: [PATCH 1/2] MAINTAINERS: update Dikshita Agarwal's email addresses
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-update-email-v1-1-8fd49d58c0e5@oss.qualcomm.com>
References: <20250901-update-email-v1-0-8fd49d58c0e5@oss.qualcomm.com>
In-Reply-To: <20250901-update-email-v1-0-8fd49d58c0e5@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756712010; l=1251;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=1z5soL92eC8zffCxJhz/a6/ADgzwmSCCyVSbMCgjXJ4=;
 b=t2euVTCAGsiPp8Ksjv50+dqDikmrXohkuIevIYyUd9j7Uji1mSU97B2KyfTxRNlgGDeCD2Jcv
 6Pvdi9K6R6pBT9e7FWI4hUTAXKlJ3w6RK4R7JRaTnhUbCfyq2Tnb2Uz
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfXyfYoUYybix2F
 eB+XITk1oTV3kk+n/f2+By9LbqOeWJARQ6GoB1re6jsmttzsACKwOvJnLIbdR3fdfmK5DTQv5n5
 q6vTH74HRH7PC+jTauWMT47RuY+9rLgx4om3kV15mfj7UNV9H8VVYeAZu68qnUwYAG9TvToWWxw
 AqWRHZqhmmvHZgs6oin2V7NA1eMQguqWl+qM7kLcp9jYJ3g5HmHhWtKpKqCisdca/kklkKDdnBJ
 qmfm0c0wFuQuzWkjQZLEgl6/bG/Q7h+jyRRsbjSJuCxCPidWX0ER+pmwN0GJyPhHcs/fqlX3zjs
 xqTP/fwSVvw9UHsONc49ubeT7SCjnhvW0cxBp8ABNOaqPo8x2duvJqvRpT/796fAmeyP++js+R9
 UOTrKHwh
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b54c53 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=69LWc1rl86c1DZQ69rIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 4e-kjBIUVTpjYMfjOAKG61eD8JnnKE3M
X-Proofpoint-GUID: 4e-kjBIUVTpjYMfjOAKG61eD8JnnKE3M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1011
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031

Use dikshita.agarwal@oss.qualcomm.com as the main address for kernel
work as quic_dikshita@quicinc.com will go away in some time.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 64ecfa45540c3e10cdef4fc10fc10e854b396c99..fe9253d6fe49c33828a79ddcf59d024495661774 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20818,7 +20818,7 @@ F:	drivers/regulator/vqmmc-ipq4019-regulator.c
 
 QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
 M:	Vikash Garodia <quic_vgarodia@quicinc.com>
-M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
+M:	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
 R:	Abhinav Kumar <abhinav.kumar@linux.dev>
 R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 L:	linux-media@vger.kernel.org
@@ -20890,7 +20890,7 @@ F:	drivers/usb/typec/tcpm/qcom/
 
 QUALCOMM VENUS VIDEO ACCELERATOR DRIVER
 M:	Vikash Garodia <quic_vgarodia@quicinc.com>
-M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
+M:	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
 R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 L:	linux-media@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org

-- 
2.34.1


