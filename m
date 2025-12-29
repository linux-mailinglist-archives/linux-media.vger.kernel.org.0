Return-Path: <linux-media+bounces-49624-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE37CE6079
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 07:33:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 936163027A7D
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 06:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069DA25B1C7;
	Mon, 29 Dec 2025 06:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NMG/if0U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FhauOmzm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D688D2D23B6
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 06:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766989915; cv=none; b=BDYmc6u7Z8E6yBEiOMtL55DcxnJwPDEsYcslD9ngqVZGitM4nRcOTRCA8eXTxq8fZOyTt97Lyhtcu30GH7MCDz/95pjwYuImvb3gBCvminYdj2BL62RKtDMUMSbmbM9LZG5GSDD+Yh/gNQWqh4EnQgwdUYf9sETrrL/MlTMPLEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766989915; c=relaxed/simple;
	bh=MEV2/qVVd99QWuTtE5bIxAoEdRDy3ULlE8nZBM2UNsw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fRU6cFX5SXm9afjKAcJaW55tgwKXdCa6Mfc/e4ZUhRZD+vCqvnHC7hB//o4bVRDVXZGWKoNbL+B9NkUW63qY+tqfhA0K+nhp+AMby7svpfdwepDoTNMsPP+1as/R76NV7FPGPCygAkZs+kY3FN54ZUKTTXzBd5Qq0YYw1eAfNAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NMG/if0U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FhauOmzm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSLEYev043783
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 06:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3iZ4W4e1iDrWQWlO3LPsVRbwj84Rm21UBb36ptgETvc=; b=NMG/if0UzZivJsfX
	sakulDhkt9bNepDQ/GyN2+g4V7fKZK47CoEgsAQVIiQXKb00wq0TL+fTixjWutOJ
	h3XO8I8LqQrgAqe8PzCWbVssXN7ozJeM7XLFHtUh1QFCDBtEn06O/Ka/t7xtKeCB
	fdvSouTYZQAP+kGf+Sg1AXcDc33CCtmPUv480+0RlnlsLBzQL3AFsMoHiKL3Uddw
	C2ToyItwcPFe4VJnKCujxwdcepbgIzYWjn+jvrfisZcy7kp9XoeGyJHUW+IBaXVg
	gdQ7Jw8d2EUpKkTAUtAt+NOyyAXgcQwAqfW/DWJsMnNOlsBi2z5aP860PeDUmilO
	IIfYrw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbc9v0thc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 06:31:52 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7f66686710fso20440654b3a.3
        for <linux-media@vger.kernel.org>; Sun, 28 Dec 2025 22:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766989909; x=1767594709; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3iZ4W4e1iDrWQWlO3LPsVRbwj84Rm21UBb36ptgETvc=;
        b=FhauOmzm31EU8bEv9kkxBujgLxlHor8j65zk47M2KZsL842IvvxKE9N9IbugfFFbWU
         YirOuFwfM65XrGyO6s1uYHTAzUCZKT2CAb+BrXo7IlKinkK0KM6W2FoFySGECpV0iG61
         s18pVPo3IggstJRNYj94NrapJzmNvSmmFnZcL9bAx+AkxrWodZc7juirq4BpR1pIepOB
         u0ZxC1MAceeUBNYFQ8trvjUN1o4G3L5p404yaZcZrysXEAw7oJSwyIlXSB3WT1qewawH
         nRS0EUm/RwypfTi8iYXxrFnFuEShtjOHt00ULuThDhQ21jMLSGjMx26Mb9cPdwLucxhO
         Gd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766989909; x=1767594709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3iZ4W4e1iDrWQWlO3LPsVRbwj84Rm21UBb36ptgETvc=;
        b=oO9urM9YZTPplNT6N1RFStzo5IrguCZrfjBgqs+EA+b9ty8OWcl+TRbQ0/gdz9Gzba
         RD+7zjZcPsaUrJrLBE2sO847C9HxqpRGJ5Q7ZtEQqumqJL1aX6njatkLCB0iXt6b+IOP
         87NykZ6CDBjt1b0/mAdtmzxZE4Bs+ctlVTSg9k83zfGZ+HtnZpj2l0GNW8stS0AoPAeh
         qAk6lIRhF481eFSIbsdlBrnx8floCPZ3YbsxIlzaY1VtcYqXd+v6uvdGznFmrIi5J8sU
         SsgTi8qZ9INerSPf3Znef+2LYtAjQM1ViS0rp9r8ISOYH3Hka6y2m9UkV68HqLwzZYol
         lidQ==
X-Gm-Message-State: AOJu0YyPwuh5yWjCxMROOjrZewH4nNPBDlu5TRvrzcyfnq/JyZ8JNTsL
	YoJKhcMQ16q1JkPqSW0TR01kzWNzP/wSPhcr2TTMuIo+b5JanFQysvLlMi3Jl9DZEVTUTpscIyJ
	/YXkLdqv7n9Jna59ngMAVt+IJi3HyCkdGgHl2yejSQqhvdmKgfOE4acgNUoQAFRHuiQ==
X-Gm-Gg: AY/fxX4GRGNjECYdgdgu5nBK6HV5eTcHJ7gwN1Irbcp4avjXXlK7BSFDnQ0t1U5U1H2
	iUUlzddXsMNlKlAnuyVnQF7iJ67Ab5UcKZ+VDKWa5JITOHm8OV3lVfjlWdHYpTzb//5qsKHGcam
	wLry4k+cfvSM+UZ/jjriH48fredjzj0+IYxKn2O4CQCuL80InFb/bWvn6aoyWMf97ue18e23BNM
	atl31UoakjG+KPybxzST2C/9BmRTLgKdVGC4ay82sFhOXnkTKCK3RYLEaqgamIJ4G+l+ebRj2w4
	nMZ74YvaJtWZu4NEhHq/lOPSdSUlMMC9tybYcgjYvpwKKFmElDusSX2dvH5W9BwHiQ2a11ebAd9
	8lGO3xdzvobPAf21v9Rv7tmHh+QT+S8x/Jtr9prW0GE43NSg=
X-Received: by 2002:a05:6a00:3286:b0:7e2:839e:84e0 with SMTP id d2e1a72fcca58-7ff64cd429dmr23873607b3a.17.1766989909588;
        Sun, 28 Dec 2025 22:31:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHaxbeyexC70WN43ELJxd4EwRUh/WhI8QxlmMzJXYH9f1Bscl31v4+tELm+vI8DjSSdwqUJyQ==
X-Received: by 2002:a05:6a00:3286:b0:7e2:839e:84e0 with SMTP id d2e1a72fcca58-7ff64cd429dmr23873587b3a.17.1766989909193;
        Sun, 28 Dec 2025 22:31:49 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e797ab9sm28308962b3a.59.2025.12.28.22.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 22:31:48 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 12:01:22 +0530
Subject: [PATCH v2 3/6] media: iris: gen1: Destroy internal buffers after
 FW releases
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-iris-fixes-v2-3-6dce2063d782@oss.qualcomm.com>
References: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
In-Reply-To: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766989894; l=1336;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=MEV2/qVVd99QWuTtE5bIxAoEdRDy3ULlE8nZBM2UNsw=;
 b=IaRfzLARxFmFZs+06nVP6qXfmpdn/HGQKiRpqWvOUZKtj+oojXCHmnXdE09bQ+8JKXtQLg7D8
 RPFpdcQQ8RZAl/+hpZM5n/M5XK7LGrVZPhWd0dxQwWO+U8x66GP4Oz4
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-GUID: yPWWKe0A-BBI0a7K9kO0Gtsqbu5V4oPx
X-Authority-Analysis: v=2.4 cv=R/sO2NRX c=1 sm=1 tr=0 ts=69522058 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=ClRbyBwZYeV4lDUphtoA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA1NyBTYWx0ZWRfX2rlQQ58n8slO
 zEzUzQ2zEcHiUabC0rTjIdSphdhAMEsha9Tq8mF7ZKy/OfUTuBYKN4n9adsuuXLdM0asHDG8wb7
 R8lCqzM+ALzjPDPrqgZWLv0NFDYDXKzTm7TM3d+Yu3PDZGw0xS6nOwws5X3BbGktXdSZaAOSmzK
 KGrq2MCmVtzPbvRj5CO8/NgSK8FN+MtYWaEuqLDn1r1xHavAr3ZhsOElgwx8rKt/v3jL7/yJEzH
 3PQ+9Z9gdrtIaiENuNtH6wD1XpW6rYtxnVnZVBdWqf5Ce1HG86XxADjD8XLCOG9bhYkXwiLReLt
 5GLuYvk1QlCa02trgvzrnnbZ28GH1pCSPDEBwNNtk7ZjKXKsQ1SZ1g+Wa0zERIGQmEnaheSYHN6
 lLMp+wlujqVdXrwtbxOw/uieQLOC6Tgdton0fagkbq5O7kLSbIc9rEyyLtFdi2HAqQ6K4Qx0Sk2
 NFRBJmHNa2vsZ1SiL0A==
X-Proofpoint-ORIG-GUID: yPWWKe0A-BBI0a7K9kO0Gtsqbu5V4oPx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290057

After the firmware releases internal buffers, the driver was not
destroying them. This left stale allocations that were no longer used,
especially across resolution changes where new buffers are allocated per
the updated requirements. As a result, memory was wasted until session
close.

Destroy internal buffers once the release response is received from the
firmware.

Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 5087e51daa842515e9d62730680fb237bf274efa..5ff71e25597b61587c674142feb99626e402c893 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -441,6 +441,8 @@ static int iris_hfi_gen1_session_unset_buffers(struct iris_inst *inst, struct ir
 		goto exit;
 
 	ret = iris_wait_for_session_response(inst, false);
+	if (!ret)
+		ret = iris_destroy_internal_buffer(inst, buf);
 
 exit:
 	kfree(pkt);

-- 
2.34.1


