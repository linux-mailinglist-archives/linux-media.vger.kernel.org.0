Return-Path: <linux-media+bounces-35227-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF906ADFF1A
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 09:49:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4582816BE14
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 07:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E83120F09C;
	Thu, 19 Jun 2025 07:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HdNkR93b"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CAD2571B3
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 07:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750319319; cv=none; b=EwSVi0XRIA8Inid3O55PXweFgCcWVaH1s8G1xyKiclUwbhgRVCPHaC2Sju0DYYfAql1vm8BBdx74JUsGlPAiL/7Vy3sWIdXqESOVsCFNQiYtTYc8Dx98kQ9FqPi3Y8IhfoDQZmCq6mAlG1riL+FBJyEMb9RqQ575oFhvbTIsqd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750319319; c=relaxed/simple;
	bh=U2STGhzIXpultd/ZiNOod4EPJT/hThpae0fjp7R5nRo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DjD9e6KdKsbzMlub3Q2ItQx9RSC2ulYeJtV/RC5xQXeV7QEpGjYUlOJ+bLFG9hE++a47gDjSns28fDUkjvZlBeuRBf5MphQuRjfmfnz0xjoa07uaU5BF9AwgBe6J90ocdK3yUnF+t06NwxjUgD9j2aIO8Ar8D52U93w9Wudiy54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HdNkR93b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J7KYQ5008236
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 07:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=z8j+K8iVfjdH3xhqExCIq8h+sOQFzpM8OaK
	kF/g/qng=; b=HdNkR93b5bYukRDiPUxJ3ZmiXkykibBfhQdNkZbNCeHMH0IlfJd
	0nlgEfLTz6RIW8VTWJcAyQU48ahx/EHJi8vo5ptHbazBubLEC3gvFSRIIGloXm+g
	jWDhcu4KybyGT2d8ptyzB8esuoISJh/2mJsR8BeBIkrTRSaxFVWAFc46cfEJQYb+
	GOg69u3xGCDb8vTEOJ+ibnNhYbQDANB+qfpJthLJAwbXrXAknCXvD2uomO0GZlZO
	YIgPJTHARuLeC9y/zfdsIeUmGNOYaUDj676P+tc9RTvurpsUeFVcl2d5P6xMdCaW
	sjvj3cj88Iz7Vh93THHEU4D1mYxo8VrVWdA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mq08q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 07:48:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7caee990721so121726285a.1
        for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 00:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750319315; x=1750924115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z8j+K8iVfjdH3xhqExCIq8h+sOQFzpM8OaKkF/g/qng=;
        b=pdB0Yj+70a6ZSsIv1KvX2QADl0+VSSUfsgoqpt5IWZU/aNEexfpLPiUOAlZWbKGZvm
         LwNX4fnlKeQEF5bMPQqNm/ej2rPEw3tPDOpXulEPpM1YQqfn7O/nXIOXpdpMTCBvMWA7
         xhQSfblpD9+XcnwCheTzGHJ6A7pgWlD4IY8EQek29dof0YPWqpT+qGfPZv4xrZxCRbGx
         f3Xa0melcA5Zo+pmFnfebm6LSQ1UqRxvpaEAzuSFoh+W7pc4DbpuFEw+GNBkaISBY6oi
         04yQdiOvO4QWYennSQNq6BU1DuPs/3/z2NzvJXMicsHww7BWN3ADwQVUcYwImjWZBySX
         TQVw==
X-Gm-Message-State: AOJu0Yx1H9bl9m67XKW2cn/wnfKavdT82BLiH5Odj0ZM47IA8rL9hMm7
	J20iPa8M95esuj6iMyqBkWiEJT+VwVcu1EqCSQ8DGwKlz2ZQMIRR4b5abq8yOiGpUD+uIMaXUog
	gobJeUi9xleB/nHkAMK81gm7XvIttJEDmhGa0VHWewlOA6jbIAhidVwDjrtnqoG73SQ==
X-Gm-Gg: ASbGncuy/ItoIEDX5dJc5jxuC/rrcqjFRz+YNdkfnAbRePv9cRkAYqWgJwQEvaT7ij5
	k9rd/TIFyxvt5qp50v7HunA5/vKTCK/iDU+ThH/QanmF1qnZy24ENfpE5eSXzTX29DvIeS7cWPm
	L/0ZQO0JqQErgXwquoQiYiUkd6K8vMO4aeLujt2fkVeFtF4ZVIFUOpDSPRKvzbHIZT9s/LWQsCu
	5KyZN6lxHQ67mlJPHzJPYiCfp4PexJxOLLuIiNmiuNLsAPzPrRmkHmr6b9gmNSi/DxwrcyTqkxh
	H365lbayZr1UsWCcdGgCP6aiqUQQ6XfFZrbh/wGyz3G0uxUjpLZtH49pHDwbdiqg4stP1q9Y5c2
	l
X-Received: by 2002:a05:620a:a11c:b0:7d2:265:c2c1 with SMTP id af79cd13be357-7d3c6cd9fb5mr2912746785a.27.1750319315530;
        Thu, 19 Jun 2025 00:48:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFa/bitPn7p+wO5BNUxje2vR0gnJrH2y5gFcyJKjUCeyoovv+2bLDtbOLvQj1g7gFSI/tM28A==
X-Received: by 2002:a05:620a:a11c:b0:7d2:265:c2c1 with SMTP id af79cd13be357-7d3c6cd9fb5mr2912744985a.27.1750319315088;
        Thu, 19 Jun 2025 00:48:35 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a73a7bsm19107586f8f.36.2025.06.19.00.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 00:48:34 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: venus: hfi: explicitly release IRQ during teardown
Date: Thu, 19 Jun 2025 09:48:30 +0200
Message-Id: <20250619074830.1708453-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDA2NSBTYWx0ZWRfX5EENrvqG4Z+Y
 ddrGQn5qBT0nQ8sZW6u6Z0+YdDDwGzIdSfxyZsO8xdj2sL6+7XuTK2VhGv/fM/SMzufu7RcW9yb
 MqZfP7sXFcp93FM9B6/yJh//x8V/tLkKxDwOBqzHp0Mx1bKVeyo2T5jz+tocrGNar2vvmlbWGSQ
 NHcPVWWQtYurWcALU1NXPc9q0yKqe2O8RCPoA9RliZayl9JcSMGv1Dj868qjrHtSzcYB2X9StVU
 w+40XzhCfs7Uj9jILz4RCINy31VfxggJwiK+f0V+v/io7wE6iBoPjdrgxeHsl8aHMCYEIQ1Sqxc
 iMOtP6lFWuu0d78a7X9c9PR+7NiAOWRXCDiYS0EUTAU9OCkP3k16/cHfhRpZVInn3xcNaNDPCTQ
 JZAdPmiEKpI1i/lW/7rXVy9BbXav93jvpEIV6dqJ55r4rGUXAlgZq/u3H/99i8vJQqkohjLt
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=6853c0d4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=8RyGSdXC0efAYOFA9KgA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: J1MxwWBZvRpxnZYR3GhQV2RKROw5e94J
X-Proofpoint-ORIG-GUID: J1MxwWBZvRpxnZYR3GhQV2RKROw5e94J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_03,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=727 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506190065

Ensure the IRQ is disabled - and all pending handlers completed - before
dismantling the interrupt routing and clearing related pointers.

This prevents any possibility of the interrupt triggering after the
handler context has been invalidated.

Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---

 v2:
    disable the handler and block until complete.
    allow devres to release and free the allocated irq

 drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index b5f2ea879950..ed003adb0282 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1678,6 +1678,7 @@ void venus_hfi_destroy(struct venus_core *core)
 	venus_interface_queues_release(hdev);
 	mutex_destroy(&hdev->lock);
 	kfree(hdev);
+	disable_irq(core->irq);
 	core->ops = NULL;
 }
 
-- 
2.34.1


