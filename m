Return-Path: <linux-media+bounces-38840-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDB9B1A1A9
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 14:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37F06188AA40
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 12:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB71E1C3027;
	Mon,  4 Aug 2025 12:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QrwY1oeF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16035260565
	for <linux-media@vger.kernel.org>; Mon,  4 Aug 2025 12:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754311368; cv=none; b=QXpXNQ0MAZ6uSkb+bX5t+hKmIIrWLPxQQDS7djwjzgUMO2oyOMjVDhAtG7MFGEOGP5fOwrxbYBQi8PyqnajK2qMSpougyeA7u2skFM3NbfAWS8PKUts8n9x9EaeKrFT/3UU1xLeeAeEMkk3OmjNZRugmfFs/fpRpvPY6nMu2428=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754311368; c=relaxed/simple;
	bh=ZD2cfNOpHxwkRMCN7+js1vyBb1FTVU2dFAlUapNz9qo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b785VEa/C8cBvGroMUuJ0bH0EMGmq+ccY8/iRvpke+pkT9k8C7WASJUlvkJOBtQhtsoAwDQKfT3QAbEqWuORD8ITPcS+x54AvBGPtcPRcOyTWDA4+Q9rlHGbx2gOn777Ctx0HiDlSOSfGQ8GAKU0mVbR0GmpRzcEHVJyGx69xpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QrwY1oeF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5748WBCT030905
	for <linux-media@vger.kernel.org>; Mon, 4 Aug 2025 12:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E7khlvNNDuoulE+J6oEwv77nicTb/IEKyXaurbG6alM=; b=QrwY1oeFsDIdUUZt
	h+veGqFgX2T0df+pc0yih0yBxRl8y1jGxqQ/NV5o04cHaybiU5MCubmOddioLmkL
	mDGn1KsoDGSPT4iLTXY1fsEiJxkuoWF/KCZBeTvppJv0LL27S5+BNj2bGHgMQChB
	jZM5GVJcL6/68lc6LKdY45Vy5iB1qVpB3SKiCBImC0Db1MJUxZwnQBTpHQ7h8RgY
	I3BlVHQua+S8sDEeGPu9Wi2nxjw3JGyM3Hcgo33Bv1G8HYdNKzibG8K6Vn4xuDHF
	ucWOuAQgJv7E75Q1bSsEzgNQwcoMgaxGgU89Z9Ej00/OCoGsDGb4hXBkXpX+/cjH
	7TE+Wg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48a2ke336b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 04 Aug 2025 12:42:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24249098fd0so24988305ad.0
        for <linux-media@vger.kernel.org>; Mon, 04 Aug 2025 05:42:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754311365; x=1754916165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7khlvNNDuoulE+J6oEwv77nicTb/IEKyXaurbG6alM=;
        b=ZYoLEVE6GmRDRdIvi1DyEPWYtCa7ZFgiYH1+GJtUktDS7i144sT8P8CjG/HETbm3RP
         WNMan1QacPCbMafu6r4Y+9XjYgIHvuFYPNwXs2e914MdsvdGkvNXCXgLAzz5+K8LMtUF
         +nlR65bXBC9t/0Xw4NlqHhkqmDLjP1dNUuJsGDMmyIcLbgZK+U+MeaCrHF8cs99Siq8U
         Y/202dt1pexQAqePNDV69t4iGVGWpujIfvZ3++cryX0sfPGJZ4Cx7mni3HZhPY3TAVMs
         3eK8Tz32spHD1ml+jlVa0QlUhd/vgkthrtOCCRPhtRaw/J8iSOosGt7V7QvAiliOX486
         raNA==
X-Forwarded-Encrypted: i=1; AJvYcCXq02+0sr4T/r0AfKmOX+oYQS5ii4OSttAuRUN38xEc0T7pDiGZnwF5JIWP5FeszuAbVPhDMf0TvVLcew==@vger.kernel.org
X-Gm-Message-State: AOJu0YztMKprRCXbiw5l9AxuRhQE7vRar5n2vJqK+yxZkwP66JsMC+RA
	8y/J3Z3MyeCIILmgdWYp05TXvAav6U1s2DLnojQZydZuIMIeOj6cGf9W7lNUb0c/wAT1bjeF13d
	8ULcIpc78xrGlSpqbDkPoVCoeuBuB7ImuTLYmrYDVvXPGzkUL0wMmAd+gdSdg1VALLBKAdpAEbg
	==
X-Gm-Gg: ASbGncss0jAdvTYIAicxZH7Cv8kKrVnvXCFpmdf1ibKxL+2mR6ehuOSwRXWC7D6LqNO
	WRDxQA81KGlPexCOmat7+I67N37zhAOh6VaboZeEVHTVmrp82YPAZe7qLBo/f5g009QsxSr2vj5
	1h759atAapIaW01JgRihtVs6Lby44+HavzD6l4OG6zauvD0Wfbd13sCDob0TIcuIivXEeMJy1Zj
	RgjG3jsoMV61dcpgRiN+15+OxwzMVgPgDg70MyeXx54QIYXSy3G5fGMJ3DVd3DRR1VqPKdIg1je
	zXNiSXWagDGCXHHv5sCMOI+CLtKCV90Mk0qcHqZ1rJgkWVDc0goJaIxu0kbLY/A7eXg=
X-Received: by 2002:a17:902:dac3:b0:240:6ae4:3695 with SMTP id d9443c01a7336-24246f461e1mr130978825ad.4.1754311365195;
        Mon, 04 Aug 2025 05:42:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeOucmT72G4obyRlN+ZWNcH5Q2iHFWuRsaszukVqVSTemP28S1LdiDIliCYgYSEqOFKiYRGQ==
X-Received: by 2002:a17:902:dac3:b0:240:6ae4:3695 with SMTP id d9443c01a7336-24246f461e1mr130978495ad.4.1754311364777;
        Mon, 04 Aug 2025 05:42:44 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef8204sm108876365ad.34.2025.08.04.05.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 05:42:44 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 04 Aug 2025 18:11:51 +0530
Subject: [PATCH 3/3] soc: qcom: mdt_loader: Fix check mdt_header_valid()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-mdtloader-changes-v1-3-5e74629a2241@oss.qualcomm.com>
References: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
In-Reply-To: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754311345; l=1035;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=ZD2cfNOpHxwkRMCN7+js1vyBb1FTVU2dFAlUapNz9qo=;
 b=mtBwG5naW5sNpYeSB0s+MuWu8v5N3eNWKJQxjUkuVslBWPyqweBsrkgRKZIKRu6ocioTpjV+E
 38wGTOcs9trB0+XJueeCQ+8YMfYUL4Njd8SL8xUVCDRnhbU8P0YfH6V
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: ZDRXGp9wHf2Q1oCU7T32YiZkhbm6kv3i
X-Authority-Analysis: v=2.4 cv=TMNFS0la c=1 sm=1 tr=0 ts=6890aac6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=o9fwi_DDGJO2X54_KKEA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA2OSBTYWx0ZWRfX855D2Xgw8Tap
 WLEye9n11W+Y0GXln6G9Cxl2paQfP/f6fpdCQH59Fkw4Kco8rhiuwv9aQZV7/ZQa+cbBSb3dC9u
 n9jjJEq8oddJiTd6evVLyEibo1uJO10eTkUHZVMbAImSRdXDt3b/FtcRDypmmljDiNLVFcMCgMv
 RVjkZFpdpRFvXjcnP/3mF0uiUPdfpBKdiUMb/q3E0I+Fyqk6la9OdFdsEVlpMtAc5X2F+gXoXMy
 1P9RnwHlnfB3cBdFxfDs05uKuBMejSWZqMhPKV8QxKGNCt6mckmlmL5uIGBPab5t10ti3hIpCYG
 yrMcNmtV2cOUDy3lb4ArFmxnqEfd2W6beplvWhK+Mut1pYrK64tD0BOgufZkC3y1jh6qX3G+ApL
 Yr7GVH/OW15xf2HJJ/egkkJqUwCvFDDmaQ6klAgENLMWNbWcasjxHO3+VhCJ9Nuj2ncyWG84
X-Proofpoint-GUID: ZDRXGp9wHf2Q1oCU7T32YiZkhbm6kv3i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040069

Firmware binaries may lack section headers, in which case
the e_shentsize field in the ELF header can be zero.

Update mdt_header_valid() to correctly handle this scenario
by adjusting the validation logic accordingly.

Fixes: 9f9967fed9d0 ("soc: qcom: mdt_loader: Ensure we don't read past the ELF header")
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 7522223835f5..8210fb3dd51a 100644
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


