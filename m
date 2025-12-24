Return-Path: <linux-media+bounces-49449-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E9BCDB7D6
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 07:29:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A56D7306CC10
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 06:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486F932937E;
	Wed, 24 Dec 2025 06:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pMyFi9R2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E+hk8zBF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093D6310655
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 06:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766557677; cv=none; b=Wl8E89+U6SfTwrqXxOJP0eMJauffCvjpINmHhNsn9w8ClMECVKVYH9Lr4C0/Zlpy36f8I3nncpkb8jS35fuYPtlFtHTQ+jgXanYT5+H9ttZVXE72YQ8vzj3ru5LVn5H1iXX9uXhSqHaGdy2c9lxTSp7BS1o3t+zZQqs0S1/3WW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766557677; c=relaxed/simple;
	bh=kBXQ6ZFympbK5znEvBiLER5omlbqdz0DnvtZ+0z8ims=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QNxtprBUTfF9+ob/dlex7OSuaaqNbmRB11wZo6gp7jpqumiyP31i5ow4E2tMl5a97SaMLPjgdNShN0G+mkIWEEk8rHrY1c7u5uXNno+TWoEj5MidM2/XV06Gt09u8QSKge9myVamN46Dy3j5qcdnKQ7sVrHcr5dy4zxoHFVoJ3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pMyFi9R2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E+hk8zBF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO17W2V1597811
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 06:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zlufFA2n8/iZij4b6ml54L8JpTKXEa6kseIlCxox5ec=; b=pMyFi9R2tl6QNjgQ
	ujbec0dIR7C6DKh4Qy4pDvwZ5F2zOMUFnt76Mz9+74qdW2WuQyXMrEjgFB2kuzGt
	GBzSDchCfDlvUCSKfJ9KwwLxO4N8EICklAwCgfVddhZMdIp1Hj2D/qcNpriSZJs6
	EudQ2XLcCbdBJHwUc2CZKuQlKORLaAGfDm4o71lH4LJYVyuCbNAyp3guGeJLqxwO
	IK3RUlD0MeotwdRRYoQbKbVq2lQuzUbIVlenGPDHwxr6m/vWHZrV48iuRfq/urW9
	vx/mis5WEs/HEDulP5Wys+Rrn2T0i/4Z9cFvTeWBnuArdq8sInvU5Uhj3u5h/mdI
	Wh3XXQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8683gpym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 06:27:55 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7bad1cef9bcso11700527b3a.1
        for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 22:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766557674; x=1767162474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zlufFA2n8/iZij4b6ml54L8JpTKXEa6kseIlCxox5ec=;
        b=E+hk8zBFtH1W20c4FUGap61iH9eoXRtCSwqWGYMe5eTk9ri2R3FYerurFHWUTnglwv
         QhO3y2dtvkEgMfUqv6VeSwh5wXJ6FyqYnJnGJEPYmp5WkBftAA4Zz0uIz2G3aekYD9Zg
         xRa7HPMCfZzdSREUQB7mixP/q+jOCTgAqzMwC7Ush9J2m3uCZzT2AdcD53h1kb+QjxjG
         KViyHuuq4Psxt6yyZYQy3av9F+3y+Bc7r3h51lVvKQh2w+a7Ct1FRKx5/YaaXR9kpAoi
         0iwltCu8ah2NozJwwiOrcOsERREib7mg+qmiqxTLDv/ItaWUiCPnVNJUoKLYAtVS3psG
         POag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766557674; x=1767162474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zlufFA2n8/iZij4b6ml54L8JpTKXEa6kseIlCxox5ec=;
        b=WFLo2GIKaMw+QKZTdBGwHVCr039rlj0lvehmoIXGcJyZSJLRMAquTWyxaMjUxkooe/
         DG+vnIz+cEfo1hplRKnhDFTq6ej5SvZPfX9u3octwQM1zNpvd32kxho1p3qRaM5tnuDg
         KjW6Wk7peez8JzhHcV9Pc0DVYVfT4f/OkHT/b6EjVUPbIPc9Mr82j99ZSZ/yJVf+GzpK
         xcQks1OPSulbYGrK6s8Byr8wBrdkHrfrZjelcBeOGcPZsuc/V2quj+k+IswZUAxK6FQe
         YLM+XQtcqFYjHxHpBoZTIWVNvSpMIT7o03V21cQSmEScrPuAaQIfz0OJF5Lfu40r+gzy
         hgfQ==
X-Gm-Message-State: AOJu0YyiA2teD2gZVLCDGVKw2BjWToGJ97A/bjstX+hlrEAWlTLksagI
	Mim0C5rULceagwOre1A5uNNxyvH/s5z1suhgJpNO6RXYYWDv9sG0Xx3yg2jxeFDxTPKiLm6gmef
	87qJUb77HDoEomGGlOM/H/0szTk/JbCXGUlPJ8jdrQbIEyjzJ2buinVUAjLE6ejy1Z38s9sGQAg
	==
X-Gm-Gg: AY/fxX5ywey5iNbovcI13i94SgBlprf4/mlTNN4yhMyYZxWyx8uipHRN80u7CCd7kLu
	ZfHCkDVA8pmMExreKkuSTr7NDgV0eKhux5qx2nCGZwDzH/VVu03LrywNEqAdRQN1lSJjesRr9Jy
	LhMsXVIPKewYTQwA54kMpCHMHNERZ249LReW68sjXfG2k9eapGaQs3/+N8UCgOcf9PA/4A8ifTG
	iD+4nj3rm5V0eK7+VGsNfJqyrRQ4YyLeaCgXkuzzwFUYNx/3SJWR6cArgFXPxb5Azwcv69UMvjz
	vXAdH3U9gGUWIj5zDEW6STeRD8s+JtQAgicYt6lyWrHK8AmJ5voEfAt/yIG+N3OslyhyOiANonj
	pmVpz65rv1WTSm/XvFbVXQJv5L32X5NJg/2ZSjMDawLtrDwo=
X-Received: by 2002:a05:6a00:1d9e:b0:77c:6621:6168 with SMTP id d2e1a72fcca58-7ff64ed0d0emr15165415b3a.30.1766557674282;
        Tue, 23 Dec 2025 22:27:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbtwbKJx5aTpDW2K5lKM8gUUxp7wFkyUkdaa9pAdXtIRs7cyLizaF/2URvTH9l60mtuh2pRA==
X-Received: by 2002:a05:6a00:1d9e:b0:77c:6621:6168 with SMTP id d2e1a72fcca58-7ff64ed0d0emr15165390b3a.30.1766557673795;
        Tue, 23 Dec 2025 22:27:53 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7eb85f15sm15618908b3a.68.2025.12.23.22.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 22:27:53 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 11:57:11 +0530
Subject: [PATCH 2/6] media: iris: Skip resolution set on first IPSC
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-iris-fixes-v1-2-5f79861700ec@oss.qualcomm.com>
References: <20251224-iris-fixes-v1-0-5f79861700ec@oss.qualcomm.com>
In-Reply-To: <20251224-iris-fixes-v1-0-5f79861700ec@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766557663; l=1338;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=kBXQ6ZFympbK5znEvBiLER5omlbqdz0DnvtZ+0z8ims=;
 b=QHMJVxZzB0nGparsxE/+lFq5OEQFiKP2kdM2JqFdRNqkR+HkY65lseelmPu+PGidF+/xarSoK
 o9XRD5ndKv1DsymfnJ8IeHBhgg5Y/N29kk/DB/X6JX6lOVYpAm/1uRi
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-GUID: FAYKbqEUu3MeiXtyYITIWBuPcC0wAmQB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA1MyBTYWx0ZWRfX0uUoYtvFS9sc
 Li4vBU9iwTnxNtvJAzAv4QrFfKQO8+95Qb+ZUqIE+e7IvugnFOMBOs9rUMBsebVaK1oexdMd2qH
 vWt4wJVWFpEWK8mc4ClUd6sAPg/n7Akzeekn40nVHZhIKpQkdwSwuFVIbP6COCwrQTBOO+Ms9Q5
 L9dsgN88abAAdjVwC93XQPQq4WttLP0pFsyDH8p5QHFycYjaRKLX7XJDWyh1LzxVvdXPMLsLqRS
 sFUhXPfnypqXLG5/+2UOWXlh86Vel0AIGm3vGDale8f+8YGm8DAeOyJoJ34B5clnxx6EIVmm+6T
 ZTS2LOnW6nFO3B5DrFIejsHetFVd2P2Vgo5j2Ren3D2hjy9c8JMvNOpT8Hn/USRn21f2Se2O+dV
 XfVwlqncP0rC3gCjUXPEc2Xe/PvkO//gBURzPUMnaqNfWE7uI+W3BxRujBP6UJGbXCEuBT2rvi+
 5wn3d48MC50DAQkTfYQ==
X-Authority-Analysis: v=2.4 cv=HqV72kTS c=1 sm=1 tr=0 ts=694b87eb cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Ed8qMULA6z6kmPtfi8MA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: FAYKbqEUu3MeiXtyYITIWBuPcC0wAmQB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240053

The resolution property is not supposed to be set during reconfig.
Existing iris_drc_pending(inst) check is insufficient, as it doesn't
cover the first port setting change.

Extend the conditional check to also skip resolution setting when
the instance is in IRIS_INST_SUB_FIRST_IPSC.

Fixes: caf205548769 ("media: iris: Avoid updating frame size to firmware during reconfig")
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 52da7ef7bab08fb1cb2ac804ccc6e3c7f9677890..5087e51daa842515e9d62730680fb237bf274efa 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -733,7 +733,7 @@ static int iris_hfi_gen1_set_resolution(struct iris_inst *inst, u32 plane)
 	struct hfi_framesize fs;
 	int ret;
 
-	if (!iris_drc_pending(inst)) {
+	if (!iris_drc_pending(inst) && !(inst->sub_state & IRIS_INST_SUB_FIRST_IPSC)) {
 		fs.buffer_type = HFI_BUFFER_INPUT;
 		fs.width = inst->fmt_src->fmt.pix_mp.width;
 		fs.height = inst->fmt_src->fmt.pix_mp.height;

-- 
2.34.1


