Return-Path: <linux-media+bounces-38975-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8603B1CABA
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 19:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E33C18C26BE
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 17:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34592BD03C;
	Wed,  6 Aug 2025 17:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a1ETTCVE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FAA29E0EC
	for <linux-media@vger.kernel.org>; Wed,  6 Aug 2025 17:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754501173; cv=none; b=CIbeTXcoeNvr1rGyfzzS02Ph0/B2dc5/UNQ7Kl/zAXMyZvak/xhipBKq8xDOGVBOzEej2bD/YDQtPGRf3KWPLgytcYsnHqhghCi46cW0lYdur5Q1tJVmRVXT/0aiwpV63GI0BNbPAuKgy9Mk3aOhbO9Zhnmt5+++LdiWzxMvu1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754501173; c=relaxed/simple;
	bh=ISijb1E0+ZD77bkKk24Ne4W33w2AVxTmXoDiNWMIs5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FZD1/3QS6qjiQ7DZYdO1nGXDkb543yp+pIFG3cbkYGSo04j1/rFOtnTkeTTLMJfhrMQ/mLezxJN0i3UPj40hp27/0ZLehLTgeY78vqgZN+ihItKNfJas8o+XbCpVYYL9mcAcl4sX7br2vUkW/UK7/QJxDJz+XksNeTPMb1z0TAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a1ETTCVE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576CPDSp019908
	for <linux-media@vger.kernel.org>; Wed, 6 Aug 2025 17:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5V4MfdEEJjF
	qpxnuJxY+w9W+JqTRsjaxsk3+BJSZB8s=; b=a1ETTCVE3M5VttGfMhCLvribLSA
	V4YlRLkXvHdLKyegh+w89ShSkseZsFeEU3LABX5s/QN+a5Gr5l9xBneU8bCPju24
	3L23tP2zJUvKmYeqraXw3oBhtCpPf3rm3LRZtwY1FkHHKQtu6cyRjj3atDddp3EQ
	zm1IIko37h2pG/INl1SpHLGs29wu7NgosGTwYSU0AVGiuSO5H+Ux1Dc3MFr9Gwt9
	B5FGrcZc+1WxNsOeA4PnhUXLPGNSHjGAlkswAm5cueZziRrEh/QHb6EB2Z6o/4yh
	rRrJkhkD5+sSN7CcxrerbMd4onb5CxSMJtOe3Bn20Qye74m7zuJylCDNgqA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw1bjar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 06 Aug 2025 17:26:09 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76bf8e79828so274304b3a.3
        for <linux-media@vger.kernel.org>; Wed, 06 Aug 2025 10:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754501168; x=1755105968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5V4MfdEEJjFqpxnuJxY+w9W+JqTRsjaxsk3+BJSZB8s=;
        b=Oe9+Hv+X2fOV2tZCQveMsvBWFwBL197gPKWdv/0xKhw7Dc/0agqjurwRBaez+blNC0
         4QlzgWuIVIA+2ftOW8YI9tMW9XCODaLLVQ3cqSqugYP7fQiMlM+2Lr1yzitDrodu1qLG
         l+CYAHQh1zYMb2M8WTQz/Mi0IeRzISC7XKnbZcXwJyCNHicf+QccJfaH+I95U8o9N/yz
         0Uop2p2i3GfSZ/EZB4aFnbOVrvp3DLUKInKsBYBj6xb7mtDGS58xGPM7jsQNtTpOVXsA
         vdN45180zkIz8d/7/9cfkeoG5W+iSQGtPA7cu6xbhRt/3x0b8dVQqz5uMfmQZosuf9+N
         kd9g==
X-Forwarded-Encrypted: i=1; AJvYcCVkLlNN2A1BFQbqp9tPuSYEmSHiuMukwlTbGgj0vSVMWVheTfiQv7pIAeaX2nmUsmLN29CzkCwgj3CWRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm/qv096ywNw66gGq7pKPcvxsOEz90u7iiY5Wa0ci96Ty8AItE
	j6hx+lf/FeBLxpvLS5P2KitTxmKqSLMo47vnIu4d2m9o+Qm/1PdrrSmk/XynD5pH8XSz3Q04ylA
	DtFIaT+qkNUUsFgRJKGt9NASs/gkQ8qQcMLgn1cJCkTAsu3gS8sE0Co/FxNfaHdDJPh4aX/0jJA
	==
X-Gm-Gg: ASbGncvTVWshYfmw5pg/iQPvzfJvFNxBDNJ3/WsGY8l8nI01DadnUUxvxgZYzqn2Goi
	EjCJRC09GllClAjOE+HYp3dNm32DbMuKyIbM20+9mKH08qVn+peeeiZLGLJprY8ZS25t8Ovx/Z2
	hqEK0yEnqTWCqb7Bp7vNN7aIL3wrPODvhb/yBz1+1sjZplfCoxMDP8mfO3bOdtV8O1coHWpKBbw
	hdmCSXvJo2lakf2GIZkVoufZt/zGr8RcNcCjD8yjNtNpDi0agKeKOL9JqtSL7ryrfrAZD02XgM7
	cr1RtRiECGF00zidsFpAjWj6Xyq7D69qlx7je/W0z0mQ4b2vGgLmOukqBuXE1OulFzY=
X-Received: by 2002:a05:6a00:8d2:b0:76b:2c12:334c with SMTP id d2e1a72fcca58-76c2b06edb7mr4844989b3a.23.1754501168304;
        Wed, 06 Aug 2025 10:26:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJeF+hA3Sf4UAVGOsX40s2DjOot938v+1PjGjJpA2MdTWEdlqDKL/EvOlgI7sVXx1RVnBAQQ==
X-Received: by 2002:a05:6a00:8d2:b0:76b:2c12:334c with SMTP id d2e1a72fcca58-76c2b06edb7mr4844944b3a.23.1754501167795;
        Wed, 06 Aug 2025 10:26:07 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8f417sm15866210b3a.44.2025.08.06.10.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 10:26:07 -0700 (PDT)
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
Subject: [PATCH v2 4/4] soc: qcom: mdt_loader: Remove unused parameter
Date: Wed,  6 Aug 2025 22:55:31 +0530
Message-ID: <20250806172531.1865088-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
References: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXzrjNLpJMtuwk
 Eo1WVHp5WyuK0dVYrxtHCZabGAmdeOk/p38TlNhCcSMYFYMQHdpKni/fbls5B9pZ0AT0Wv05VDQ
 hEN6WHa/xZrC2tIKsx9IsjuOcX7qIrOQvEPBuz10qBv/CZQCW2RowfmUxRjqU4IGwckIGPANnx6
 9/99F1gFlFX8GrBpaKTQxWQnfUkE5AnHEep192qmmD/4w8oVkPcRMETxfHI8XByhp9NsktQG6Lj
 j3fzUVScbLmXOUrbIRRdxP7ll5VRu1AZpwx/wXPhjv3ehAs+vNnI+GPhWy+1fuGf7DpA4x2gQgJ
 A+TLN5z+HDM/qQ3WNWIKGIr38FQvj5yr2lqGWD90BbECLQB528S4T9ePH/bwast/EPfx50X2qy3
 tDjyb+fv
X-Authority-Analysis: v=2.4 cv=Ha4UTjE8 c=1 sm=1 tr=0 ts=68939031 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=QQi8RNdjS96tJPzaHcwA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: FmXtHGkZ-qZXabF6n9JCac1VGpet-zpA
X-Proofpoint-GUID: FmXtHGkZ-qZXabF6n9JCac1VGpet-zpA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

fw_name in qcom_mdt_bins_are_split() seems unused now, it may have
used in the past for logging it but due to code refactor this parameter
is unused now.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2:
 - made this as separate patch.

 drivers/soc/qcom/mdt_loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 145bd1374f07..8210fb3dd51a 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -302,7 +302,7 @@ int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_pas_init);
 
-static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_name)
+static bool qcom_mdt_bins_are_split(const struct firmware *fw)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_hdr *ehdr;
-- 
2.50.1


