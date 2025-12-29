Return-Path: <linux-media+bounces-49623-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC94CE6070
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 07:33:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFEDE301D0C7
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 06:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9552D0608;
	Mon, 29 Dec 2025 06:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dMGmGyFi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ew2Wz/yP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF04C2D0C8B
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 06:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766989910; cv=none; b=Ppc9FcibP9yODMzMPrztivBJ4w0hyr5xgrUJtCgP16DPkFvcfAvK7jLTkB5tTi7IndPRUOfJLYDg+63yvqZCLU50nH7OjUtCH8Z3d19TKzV0UCKxcUxfxJknXQb5P7qhB7D0m3CG5zXvNNYwUJjE+AQvZhN3svPE5xqs/5zXGi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766989910; c=relaxed/simple;
	bh=+rL4lRzTGUatVxR2IU5B50u9WgYSm4OhmK8lABIkEUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fZFPOoTWVuuFUS2TXYk4z0Laj5UTOcTjRCPW3GS2TrLesarlSFoEyVDSsEk2gYbRgk4TgVB5HAJVnPvP0SON8JTN6xjrb8cTFrs8o4IznooNFIy/7J/ldMxSIgEnVD9nWl80fmseC28Qh+TEvVzVaeOw88R1DiN1VaExIcUX8dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dMGmGyFi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ew2Wz/yP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSMlgBg3706305
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 06:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CSTdKndo2CG1ApifCcfjmKKwiWM5Dk3UzJnk6Vq5Q0w=; b=dMGmGyFipzSeUG7/
	zm6u2nd2RIZ5NROThQXSYAM6iL5Pu/d2nHAfT9MxM41TnWQyb9XE2SaOOeAdU7sz
	7aFEXa7+/4YM9fJOq6nZrwVerChuRIykdo6qyXHBLyooCLQr2V0cZ+IlH9XA9rzQ
	BKELwKBYgkOLg0Rd3T5GQPIgobTWhG0RpikArF+2GUuljGTZvuhgbTmopHkuVMNE
	Q2YJ44S7PqZxJskOLk6CmSFXu5uZNPpZEpwXbypUeJzM5homl7BqrM7PFWiJ6xNO
	9PlfmrPBp7K5lXdlk5oJnOFPZwyqTPHgc9rp3RYbHqEY4YSWypkZCe644+jy1260
	fy4N8w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbc8yrt28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 06:31:46 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7aa148105a2so8518141b3a.1
        for <linux-media@vger.kernel.org>; Sun, 28 Dec 2025 22:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766989906; x=1767594706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CSTdKndo2CG1ApifCcfjmKKwiWM5Dk3UzJnk6Vq5Q0w=;
        b=Ew2Wz/yPqUGTIdkhJgC2hpynYklWggWu0KHFj1v+BlVZldLY7OORNMcEpV2JiAPr21
         /CBiU0wwtvMGmlVMi8vi67rD5v0MIHhz6yWSQVSWNed1PxU4E82ytcci+LMV/EeInDjl
         Uc0wKCU38KoLff+RMsn+Rz7QhrJx4nKWmiAZ4L1OpO3b4NJoromg7NJhQgk5rs1LG9bG
         +dVA6qHj90dh34GvI97tKtZvhIdbHTUzOC6EmAz2Gd8G1FgbCK60sl+tlip1yBUtyd5k
         SubFY8rz2AJjXyr4ubrigTTt6/CdBsR9t1CRBGjkFlFO8di14OZ7npeQN1fX+2Gk5xfe
         2Yiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766989906; x=1767594706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CSTdKndo2CG1ApifCcfjmKKwiWM5Dk3UzJnk6Vq5Q0w=;
        b=vu0LJyM7ukI6otRrl8BDr4QnqDAHCtMmsZa0dVi4PR3nGQoRDCqpJtBcbUVa8vTXVd
         Ud1NIuPyGMFwANGspE7FcKNNvAdV7XN4Dgs3Q6SeIUzeZ2o59//Zy8Orl3QyrCi0mRAK
         pAbjbV7uJoD6PCG+zWD2LSus+12o+4++dcvhLpN/MaIHFr1mTOyElouRQdfjO2H1GR3z
         Ms29T64pt8G1eDB4AEpWpCqyaz/aTeEotoTHZw8W1mbgF85/kOMvD7giaR18YaVHbdfY
         toJkqBaJ5pNITKj2WHRVvbv1mHXPMzOLjqZDkLbwBSzOx7RAenMsa6+t9UYlD4XczqUF
         LD9A==
X-Gm-Message-State: AOJu0YzgjSNB8/u4YUovJj7Z6R8MX6lFAuqYj3zepvklaoddPCGdQeBx
	XPh8hnM9YkZrzoW8y2j6LKeHR7jURQJ6OGV/3TpNI06A5TWxDFmp3nY9+wHMvZqV3DI2TYDwjl7
	yfN/m/zGHcBWjuXJ1w7l2KH2iIdBESUYCroLrCRE+bs3Zv9B+3K/8rKJNGkI2Rm5nTw==
X-Gm-Gg: AY/fxX4uB081/R9PK2y9NvngyIbIqTBykjalfyxCzL9eGwRcZq0WJJHePfN6RRDVX15
	JUROpyF0i2PmB9GDYbMAcwclMxBsrVrOQ6aHFl3RYXEO8DPD9nQmxZK8R0zWri1G3kyqM/oUZS3
	vH14WyokkAS+BhLB4SZshSX16Y7qyrF4PS2p2mZkOelpGIZqzcqd8YzPB6OxP8LG/PK3qUrmCdq
	vC6DIQaYZlN6HWvZ8QjeOmZpoliXASP2iAr5vwRjuqpEMiWdUzm0TOqbGQi+VTxUL/JtCNmmDZa
	7VCji8Wjz/sMsfGrtc8xV4c/7drfyGw544lG1bg71VZWZK5OfaAbNqcsTA+zeaydte7eOwbgnV3
	1NK+0CQDUnYpQ8wDjQ+/99ZWl7D1lfBzYRZmfbhH3ncQJEgw=
X-Received: by 2002:a05:6a00:4105:b0:7f0:d758:3143 with SMTP id d2e1a72fcca58-7ff654b8108mr24578308b3a.20.1766989905973;
        Sun, 28 Dec 2025 22:31:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDInxSUa0oM3ki/aI3H6HGzs0EMPDzJPVYX8xu8sOQ+UZegnvmeo2DVlJYFXbYykF5SxlGIA==
X-Received: by 2002:a05:6a00:4105:b0:7f0:d758:3143 with SMTP id d2e1a72fcca58-7ff654b8108mr24578290b3a.20.1766989905477;
        Sun, 28 Dec 2025 22:31:45 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e797ab9sm28308962b3a.59.2025.12.28.22.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 22:31:45 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 12:01:21 +0530
Subject: [PATCH v2 2/6] media: iris: Skip resolution set on first IPSC
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-iris-fixes-v2-2-6dce2063d782@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766989894; l=1386;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=+rL4lRzTGUatVxR2IU5B50u9WgYSm4OhmK8lABIkEUw=;
 b=cvCwCsa2e0WzLjbz4pz1dOqr9BVp8LWqEaYF9etAPKZHg5cz+zc1B7dUbW1ONpKMy/7hwooV3
 AMQOJvKRWlgD/Yg5EEgfBvhzbh0RcD2h2OWsXQUJsFfFrrhfeY5R4ca
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA1NyBTYWx0ZWRfX/avi799Ok74v
 iPe5vX5d/7k686xFCwsx4atAb8sEJbAMu2DUyRWWwp9nIqHfrwVyfm1i4CEch7EDC+rNgcOmgmV
 O8Rka4O/QJLKWLk+UwczCVd9R9v3MXgPNyJhEZvZuK8wLkTjm2cs7TFa035YPnjfLdEM2DMv+Xi
 L/R9Q/ZBQb8wiu8WXWqv0NRtHewGDCAOzOd3RCIqneWsouJEARpA4ozksO8wLQMMNmJdL2UpDaK
 SSH3I3a8H0hzBfRik5GmkDSudVWnx5iIO6aIiV/2s5ezSitY1hewK5Vs0axe9czPirhtGOuhf1p
 Ng8jTy3u0y0rOPmrXbJwCpt3ZG4wFnCFqDc30s0km3IYUMYkb/gK5h/ZAJmYafqdjys9uPs3lZU
 o3oJWkdUbnkmbrxdtFS92s1tCvNWkP/dg9dHPfA+CtSpD3aaeFnd6NEEbDm0dbUPnoaWBGfJFt4
 TJ3LThsOBXRoHQ2iQGA==
X-Authority-Analysis: v=2.4 cv=cP7tc1eN c=1 sm=1 tr=0 ts=69522052 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Ed8qMULA6z6kmPtfi8MA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: l6dC7xzyE9K8Yb9fyM0KI32F53GOg6sU
X-Proofpoint-GUID: l6dC7xzyE9K8Yb9fyM0KI32F53GOg6sU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290057

The resolution property is not supposed to be set during reconfig.
Existing iris_drc_pending(inst) check is insufficient, as it doesn't
cover the first port setting change.

Extend the conditional check to also skip resolution setting when
the instance is in IRIS_INST_SUB_FIRST_IPSC.

Fixes: caf205548769 ("media: iris: Avoid updating frame size to firmware during reconfig")
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
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


