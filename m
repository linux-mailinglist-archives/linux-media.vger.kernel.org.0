Return-Path: <linux-media+bounces-50352-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 868E6D0DBC8
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 20:38:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8201C30360FE
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 19:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E06E28851F;
	Sat, 10 Jan 2026 19:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KO+r+gLa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AlCyulZX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F5725B305
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768073893; cv=none; b=c2BaVNMmX3LvGFDWsZUqyGSNZd3miwCfayYYWTVfrTdi+Zw6FyY/B3cTdOaodaQ1rfwH30uKwPgofu3u2lNnRDCJBOqGZV/YYWixjEnedqGShJhR3/LeMe3B31TD3K8cVpcbTkSVLTDrA1mbkhcWPCXzBsk160/H0OJxgQ7eVS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768073893; c=relaxed/simple;
	bh=lI206RAn0syEtBGFIwrCzvGuezMwS8kPobyiNnHRo80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M6iTVh1aOGZKn5QLrOnoLxbC2iZnx3i7F61zIx0io86yCX7A4ibqUqFvQ8uNNf4pHVnEdze63cGUVOqCTEPH2W7ksyx/Ci2vK4TQoJ9Lg7F7DejxMibGSAPpq2jQR8iTtGXjDtTI3IenjeqTyjzzXzgvQeAJvPAFdE9Pmcro/wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KO+r+gLa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AlCyulZX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60AGpCKh4193290
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1CwAZXdBUc9xQFrxwrCs3jtALVbNFxTXbK8oxBBj+5I=; b=KO+r+gLaEzAmAZUp
	PISjftyQA0vDfkJQ4PAEkcDxcNqCEatTKaV9LHRI8ti4JIC8hM3IbF9c6UaIiK6N
	3/pKN1flqLUPGEb1PzQ1FQIGURVnn4kSjpvON/Lb3rjqL4Q5bne+mgg1xDT7wwJ9
	kyvJySLgrtVIxTchbge2b61ujmTPb3VTW28KlDCZD6k/dS4ZxsbNoG6QySDCYjU4
	AiELO3tVdmO4IsJ/hiY1ztSV5D9kpUxWz/KjBGt4I9o0Yhzxq1AU5TKIvNKUCz/6
	ol2nqCSghWhWLvJ1V1ISEoV+r+7skRaFjYXuFQeZp924B3+IzKY56kCdlj8Y7M+u
	WjKaYg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bke3e187s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:38:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c277fe676eso1587507785a.0
        for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 11:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768073889; x=1768678689; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1CwAZXdBUc9xQFrxwrCs3jtALVbNFxTXbK8oxBBj+5I=;
        b=AlCyulZXK1NdZOjjXyC6AgNPswpBC8+tTAhZX6mYgZlrhLAhhU5rVzSTmW/p7KUUPL
         tAaSSwgQAQVz7kqP0DgX7W+vIIuPjEibz+Jrvcvu2Owh0txtQKx/kR0UekjoKyaGuPmV
         vvcvYJ5X3g0vrXe930DIb7CqM3u8oGt47uyR5yvR6yEwwBTzz4j1hiKj0uAcY1VTKiPs
         +q3X0AYcNSGX9ILIy3Ij5xse6yAw7H3EQl51P72S4ixzCxyUEQv8LimRje/YBBct8AtF
         8GVxTa8tjeRVSMj5HaQT2U+uXt3ZA52la58E/FKCrZWymwr3rZYAHmhlnlE9tz05lMUp
         KGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768073889; x=1768678689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1CwAZXdBUc9xQFrxwrCs3jtALVbNFxTXbK8oxBBj+5I=;
        b=RYpszHdvAYRkS+fuMeJBtUVEZaN+Hu1Y/JY/1F9qB4APaSjKNqk2txjd2Svx8dwjHN
         B92CH2qeH1nthJKfO2z76yiIj5/9fpS83kNt3NNKW+mTscYzPXk61DBGX366P/pqG87X
         Q5H/V26wTWcPEu4FBh1XqPaeDo8fW+wDbcpqqTIAopScS20KUiba5bfq3o6oEsH1cZhB
         LWcVp9OOVfnBw8AT6PA750EWkHWiz6MOE29ZGLEsBhI9867Vr5X+X0Fkg1R3PnhUkoAT
         UJA+B6a5RZc3b3yEtoLzJahgygIKEeStYv7HFSSh7aMeddgtgHBTGAvrXo5O1CAzIuU7
         gMXw==
X-Forwarded-Encrypted: i=1; AJvYcCXwPZvqYp3aT+0hN/MKKVKi/ZInBvz3q5UB+41EByJjAyfIEaPG3Apujzf6CQtV0pOfh8ZlqfBePAoPSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp4alZHyuSp/mXz6RdZXabe0/1odnB0dp8iCA5zilmt5C+MdzA
	Hq3EUY7+d0ZD19wsuzi++cJVvfVvmCjckokHenKF3ceHYEhVXBGJuTsF+V9ocDJWuoivS6gDHHt
	qZxgjNb95u1C6Gi+ZZPjS+/xh0D66pyHiap1lVBidAfRobjKeP1Vo/i9f0LVRpiTd/Q==
X-Gm-Gg: AY/fxX6VBnX/efxFanXg17Cv5dffaUKg1472lsSQ9IdSircqObq67wU8AxUQh0KkB+L
	NidsvIl97W60V6/4curw+F2h8XXD3Mavze9NBPV5c916YCmBIVlyprpXpmwLLLICE+Wy15XKIsg
	wrDYPg5pMfawQlAyQMLPkJ8Xi+hxXf+HS8R+d553Jn6FkvGAy5KHHVnYfpRa4yUuZwuQino3UJG
	wFj6xG5xdrhrn0qlcXWtFa5Zkh4kEcC1vH7pu8ijOZLNGeZFTLdMcqCvoTifUxI8vzsEFSbOXI+
	ryWe5kaoOY2kbmsXKh74VJBDYkiyNgznJIeNKqmDInoIHbnPKht+gzPW6BMoey6f5UUvjojZQLP
	CMHdGB4XJzhdUGJJkL64LgdTDwKcLCEln7TMNKrv3wVSTWo6YODEM5sfadd6odQm59dSL+SVQDs
	bkvStEBYaTjwCqoGM2MqppElE=
X-Received: by 2002:a05:620a:4041:b0:892:25d5:2ec with SMTP id af79cd13be357-8c3893a234dmr1932596985a.27.1768073889512;
        Sat, 10 Jan 2026 11:38:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6ysYkEyuQS4NY1Y9cW0IM7svB4+OFyFxciv6hGR04XoHyoO6I5rv4ARjmqrh1JNhc4LMfRQ==
X-Received: by 2002:a05:620a:4041:b0:892:25d5:2ec with SMTP id af79cd13be357-8c3893a234dmr1932593085a.27.1768073889029;
        Sat, 10 Jan 2026 11:38:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 11:38:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:38:00 +0200
Subject: [PATCH 08/11] media: iris: don't specify max_channels in the
 source code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-8-dd70494dcd7b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2155;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lI206RAn0syEtBGFIwrCzvGuezMwS8kPobyiNnHRo80=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqUI7DjMqRDpb44hymmYSc9xyQvDtas5hO6J
 cWUmBCd9USJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqlAAKCRCLPIo+Aiko
 1df+CACXImUz2ySv1msEZJwL6Ka6JPcxHLReOA/dClhjty+PYdqgvVJ5ZfLYM7kVWz8v9gSFaRu
 Gnid5ffysQBsRAElRVdk00CChludfgaNTK3uvEKKpUuYMtP1nQaD3srkYbKYcKz3F+tBizbdMGd
 QxYTIYRX0FNv3mllLrabqtS2I3ISuB2mUHyfvWkXbxX9McRIx5vvuAwpcV/Eqqlc9rC8xif2muL
 uqcF/mVLo33H1pgpSympcmy+spPtKqgxV9f+dCpcFcK+PsbQanoq5VDYX01eRhDLdrf/QGPR3pU
 RGK1Loia19tUJWTN+mqNlA8RkMETtppag3hq8BaZVAA4j9A9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: W--VEpHckuXWi-FMo-mdZcC3AqfxemNN
X-Proofpoint-ORIG-GUID: W--VEpHckuXWi-FMo-mdZcC3AqfxemNN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX/xttOzcOv3oX
 6ow6KFHvxJ7y/rRfJRlbP6MkeYKv1BbummnqI3AC14n5jCxGVq/cCvGFJU8p8k10Ridu0KnSK69
 ALPf93R0gsiTx1EHbAQ6vTRFGBZF75lrvt7eNst8yAYSYRc+vhGg8/FdiMd0GahCirQKyjL+8I3
 LDWyhLrPYJpIYnZNmep9fAw5qCtGkpIO2/+OagMfMu0gZETLNWsl1vixtHnKbSUAlOPslzj/L0c
 cbkJh/NKaVLQRaVaGiJ2rJs+Eu7sv8qC0si6cDcdvA6Ok7pWSm+zt3J8NY3Rav1/bvpO6hobABt
 qwqaiEz6pkvVUt8b82vzCOjfxpHb6AMcxn4AY0tGPbn/meoxcejZev6Zgb/dv7RTkv6WGWeJ8sX
 +ogpFRJ+gGAGu6lvTjQgRiQN3ZbNL0FAhdAL19DK6P8eMCQuMamPqNwBUtrMjvYwLpgCvU5hm9h
 1i/84ZZlBHi8wTgz9zg==
X-Authority-Analysis: v=2.4 cv=Dckaa/tW c=1 sm=1 tr=0 ts=6962aaa2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=rTy9geyXzX0TkIcb0cAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601100173

The UBWC max_channels spreading is specified in the Iris driver, but it
also can be calculated from the platform UBWC config. Use the platform
UBWC configuration instead of specifying it directly in the source.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 9945c939cd29..91dbea4c6664 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -139,7 +139,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->max_channels;
+	payload = ubwc->macrotile_mode ? 8 : 4;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAX_CHANNELS,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index f99fcbb8fced..4abaf4615cea 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -72,7 +72,6 @@ struct tz_cp_config {
 };
 
 struct ubwc_config_data {
-	u32	max_channels;
 };
 
 struct platform_inst_caps {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index c967db452dec..e78cda7e307d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -632,7 +632,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 };
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
-	.max_channels = 8,
 };
 
 static struct tz_cp_config tz_cp_config_sm8550 = {

-- 
2.47.3


