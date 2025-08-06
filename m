Return-Path: <linux-media+bounces-38972-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92322B1CAAD
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 19:26:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3395160FC6
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 17:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D7FEEA6;
	Wed,  6 Aug 2025 17:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VD9wmOYD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1020C1A76B1
	for <linux-media@vger.kernel.org>; Wed,  6 Aug 2025 17:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754501150; cv=none; b=NKeckfjvTZZ2PBNMByEBaC2yVWPmDtZDI9IC4NaK7q0+Y4JHtw2KdprY2+c9pk41ejz6npx0fekSKSLmzk3lKExdOX7UdGRzK+wrNZza8AZ+Nq+DfzOtpz+qIlaBFM/oRKg5J9Ivxm938KMT0iDZx2xijXdm/FOrlM4qYJTUlbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754501150; c=relaxed/simple;
	bh=Cnfe81ebyCIk8w/h4ZV2DZyd5yj+BwIO3eFpimyJFZo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=afW2RZAsM3DYFU1SQHlCGf24lz5vIieNM6Iq4gf4kd1zWY1HzVoYWyDl1v0qfz7swa3jsOIE6sZFicUpctMBT9I3lcPmsj++IlzoUJFojWScpiGe3yu+1k8UCITcmZJQ9kfPL+q/YtZc597vq00dIh2cW6CztTNY3r4qAf3k470=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VD9wmOYD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576DJ713027782
	for <linux-media@vger.kernel.org>; Wed, 6 Aug 2025 17:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eVYjI3rygCGwLfBirqa4CEGJ+oQnrEt/kpH
	x3wnKFJA=; b=VD9wmOYDlZZ+wc29v4hP/QvVEoydomsDECUYB5Y1zl0BtGGRDkJ
	P+YAyEndBnMQ8OHhYtRBrutJ3y1n7Vg2c9VVg9zodZSMZm2lS3gOB702edLcEwhV
	E2D6zOV7TNDtfFiqe2UfHIWSc6cCQ64SK0Jm5kRXvjDncqBYfROTPdVWFicJpIpk
	F66Ul9V0uOENdBAjNAu/Xfm3jAacB5wcA3g9UP5P6asEGd6bNeW01uO3GcV/F11i
	9RMyMZUIucIJ9rnBNGT5sKR7kWVN9RA11ng2t3qB0R1RJdh6JGnlT8AyxuPCZ1h1
	YIeMkReASIUPcqxqd7h+QObQIS6nD23A2qQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy6uh6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 06 Aug 2025 17:25:48 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b38ec062983so26183a12.3
        for <linux-media@vger.kernel.org>; Wed, 06 Aug 2025 10:25:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754501147; x=1755105947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eVYjI3rygCGwLfBirqa4CEGJ+oQnrEt/kpHx3wnKFJA=;
        b=WrrafRo3WY657M/rnhnLrRLCphYRzyaTDscCW/kp341Gj0R+kyAsaJma2wnPvKy5FI
         Oap0omyy10s7kO2I0y+riOGmfWgj51aN0uezXRv2eyMUeSX8s726L841v6UcESFOQemb
         OunOoRiisijqj34ICHp/9UxbS269e5eZOphmWj9bpZPoRGAbHC05GatYHmwnzHhohTcU
         XxAglyXQd9CwohwgUaReSvutqpGxVGVBu+2cWi/OXAOXpu9kjhAQeFxEpPXBea/+TRQA
         NWSholIhkFLZqf4z9Zzok8CXiVpSBUskg3O7W52JAP01pxIWAyTY7VdRC7iKhhPdaS69
         jtvA==
X-Forwarded-Encrypted: i=1; AJvYcCXXUl5RUA+I1FyXynq16/Va/2LmE9zcTTuPxCi+VtcePpTY2l7lK8dCNdSZADJ5hjUDudzo/StB+I7ygA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZO0oZjrD6HF9xlWlHGwhKgnkRZO1GahDBkWoqgpyqyd7Ju0O7
	GYvpT6pbPdZ0q9Lf12wNp3Du6J+ojdV9lhFf64hilmuL2GSLocDApROkHTJc2toaOlG+4Aamg7l
	sy4yUBUFhh8lnjSgaDTb3nIi6um324hwCYvTRVgejASaK82F+C0LQH9UxR6bRnEbIIA==
X-Gm-Gg: ASbGncux+432CUu0/hGTV0WxHWeLHZFDPR3D3u6xXHgcqMkrChQpFMTdh8BQrKw2Isy
	GLPL0bqHcg6GrtiDe3V3Sk1YwdNLVOaNX3rc8iHPt1e8jZYdFYQhYVacm4YMDTUrrj7RM6nhKnC
	Qh9xS8NHhc3z/tJnriMa63FS9nVhK9aSAkc/aH5kjE7yg95CSNNvBiuySW1kYZt14AWQ88oS2Ol
	F9TOBrT5mHqw1Jv1/datK7ZRx+pEWhx8K1MKgIThHhdQZnLWs2q8konUedvFvhyXFYnYGXnWVX4
	UsdQ9Cgbjh5+j+bYb3xKWiTVWoBcKvLIebPKHMIttGDHt9fftgeltQZMY5xqbH8lXwY=
X-Received: by 2002:a05:6a20:6a26:b0:235:2cd8:6cd1 with SMTP id adf61e73a8af0-240314f8cc4mr5563455637.34.1754501147519;
        Wed, 06 Aug 2025 10:25:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFu+nPMT7IIoSPFhOuYdFJmJMRBwrZH5TbAT34dZUvgIdZmjKpP2Xiim6bvjiybrcOPhuzQjQ==
X-Received: by 2002:a05:6a20:6a26:b0:235:2cd8:6cd1 with SMTP id adf61e73a8af0-240314f8cc4mr5563397637.34.1754501147071;
        Wed, 06 Aug 2025 10:25:47 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8f417sm15866210b3a.44.2025.08.06.10.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 10:25:46 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 1/4] soc: qcom: mdt_loader: Fix check mdt_header_valid()
Date: Wed,  6 Aug 2025 22:55:28 +0530
Message-ID: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JBRGpTWf3VAroqc1humOKLspjGk--45J
X-Proofpoint-GUID: JBRGpTWf3VAroqc1humOKLspjGk--45J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX3cGbmlETQftm
 I8kvd3nvkZ5LfAYcC7u8HK5lB8qzTCpURbE/7HDB9UFdUaeIozy+ZnFntEBLvkn5QLvZCS+WpSJ
 9Pd554XuKDdD1fX+YAktJZ4PCWJlgS0//FatVRFxjlVU50WbA1tDejTKcluEH69E3aLtb/l+JmN
 oql/XoM99SvaMnJgpGaUIXuE8TJ7hn0aIIB1veFqsvRRCxcAp0T1Pvz04P5j1q1AxKVUJFpZNSu
 7KzxgdWhTxqmGct8p+1xoJFnbkX8g1klsOoaV1h4gtYYbMDf6gtPp+dpSAsDNayFHeYpvd69m3j
 4xAn2aAO3yYRFvMSi6W4+s9mHMmF+EQbup+utj5eDdDVkfxysZC0RHlGR7NsUZaRRCcod30KJcA
 luI0cc5s
X-Authority-Analysis: v=2.4 cv=LNVmQIW9 c=1 sm=1 tr=0 ts=6893901c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=o9fwi_DDGJO2X54_KKEA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060009

Firmware binaries may lack section headers, in which case
the e_shentsize field in the ELF header can be zero.

Update mdt_header_valid() to correctly handle this scenario
by adjusting the validation logic accordingly.

Fixes: 9f9967fed9d0 ("soc: qcom: mdt_loader: Ensure we don't read past the ELF header")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2:
- Make this patch as first patch of the series.
- Added R-b tag

 drivers/soc/qcom/mdt_loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 0ca268bdf1f8..2a14ba9b0fb6 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -39,7 +39,7 @@ static bool mdt_header_valid(const struct firmware *fw)
 	if (phend > fw->size)
 		return false;
 
-	if (ehdr->e_shentsize != sizeof(struct elf32_shdr))
+	if (ehdr->e_shentsize && ehdr->e_shentsize != sizeof(struct elf32_shdr))
 		return false;
 
 	shend = size_add(size_mul(sizeof(struct elf32_shdr), ehdr->e_shnum), ehdr->e_shoff);
-- 
2.50.1


