Return-Path: <linux-media+bounces-60698-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGcQN13n+2kaHwAAu9opvQ
	(envelope-from <linux-media+bounces-60698-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 03:14:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 788604E1E4F
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 03:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0FFE308488F
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 01:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB1B92BF3D7;
	Thu,  7 May 2026 01:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EXy8xgsR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dyAmSofv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F05129C33F
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 01:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778116268; cv=none; b=Agxly9kYM6gu6qETSV7wlbdpgV5vQ1gEH9m+9VnlefTQCqqFfQMn1o5toIQuZg+/kh9cxIQckbbiT57vX93W6CmGK09hl3tpJBnMJpPQ7iwP7nyjv12kPQUKjkju5BCGurac631FGMdVqRIqQERxneynMgh/32SNrPhQvYyyqtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778116268; c=relaxed/simple;
	bh=/9nEVbBbZylkYnurLYSAS/hZukhtGTEGsaxE9DNa3To=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XcQgIgFk3bsofQUxuB9NdyzhKLHUO4xgTqKkSflTW0A/lHFtxv0eD0aTzv356E2o2p9ah4iYCFwFNul5VizTuazeEIY2gUMO4cgRI22jVhvxI7ZxJRPl5A7wpFapt7XiwUmh5zbq/gyE5pfF3zRUCrER9sDGTBkxOLnMSimm4ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EXy8xgsR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dyAmSofv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6470IGKZ443101
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 01:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W/n8lIy6TJAx0t/SbpKSBMWtMGWB6AELaqSTzQbbTRI=; b=EXy8xgsRBbltMzUU
	9/w5mfj709mmiwudJx1TszpPTa986/WfdXQScANdHdhZj8CvRrBrDm5t9YGh0Z+E
	76HNIQvo467oL5ayyhLZ1L4RacGuu5VIn6Z9djmz7H1IudDinwHW3el3D4O3OL8t
	mufFritKotu32BNt2JHdKfDt2RzZdKTBxTgP5ufp9W8DVw1t9sz+lJUP1vb3TaH5
	fn/3UwCyndlvTcn/7intSSjdeFbUV1LVGZdvHxaa/kJUyiOrI7hZPuRNSJ1zP93d
	IN/kFaspDCBZzwhv5Q5kbyO6frRvXetRsVLA/+h62Z1Dl65eXjoS9hmcV1sebb5z
	LlDtuQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0299kbvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 01:11:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e2592ea3bso2738231cf.2
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 18:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778116265; x=1778721065; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/n8lIy6TJAx0t/SbpKSBMWtMGWB6AELaqSTzQbbTRI=;
        b=dyAmSofvm+Qkoxt7dqUnniUZSYNMKV7PQYLWuFoHyRdAzEfdjvltSgdYDA2ooNn6/e
         L6WAHyFjLAcXmI6AlA25PIaJCyOJJzPL6tgiQzQHZcKSND2YoNd//EvX5X46AtZ3BLDR
         KQZ+xckQ1Bvjk+cDBHLfMLjvrr3dBWXBcSW04LT3pXrIpbGVQXd5YrsR5ChxCEukmXXy
         E3lgioxvuvaLViLSE6LVD6wEejdhmfZBQWjD88HwCB8hsLQ3d7qkopJDCeNwHFAj7NiD
         iqQQmYxqgC90fNC1qT+sIxAiwKuT/lR9oiYWtfwd14ss5/iC5vlYUtF22ccIUrBAJJ2e
         n/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778116265; x=1778721065;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W/n8lIy6TJAx0t/SbpKSBMWtMGWB6AELaqSTzQbbTRI=;
        b=RdA2Es/W7Pgbf7QNSgWnu8d5d6XJwpo4PRIoBpCI7pPoz9sJuv1x0N9IarHmFNcwlr
         txHHxTiA7Wnlq46crvsHPdMML72fozZX1RPKmk0RdY+zvrATGCc1PDswLH1uRcFDkX0h
         Ohvx8ORuaNTwZKDGNEHMa6iyjX4NX03Gr+JWfgLFjkCul2C/SLBgYc1p8FijOzjR1wy0
         eGH+ajPQ0C8DYZ/yN+IkciHft9bxKee/iaSuBmdD+WGH4nSLvSEaWUDKLysjFOITWtNc
         KQbURJCq5rJGhZLD4gtbaBaJc3zmfEZmi5z4qGRyKId4+XJQnyDuPNTKlM5l0SNrLX1u
         RVZw==
X-Forwarded-Encrypted: i=1; AFNElJ9Ie6C9Pmufk8+5sf8kSm4A3IUnIsjiQLZPUVvvC8q+k7reHuqBsQRbTuQokuomk7C2V8opHU6bwPVeKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXkWmxQO/UMDRKI0JCjWRBXVBdeAZ2w19iZzvH6ZsibnpEayt0
	pxz18rbfYfTaIFhWyRopHdgSGH0a00tWWqoup1oNBC6GDkRQ5Nm6evhTMRhTd7l4vnhFrVZ6JVV
	TN76Rj/KjWgERHYUNeygVH5PDcRtZelQqiCdS41dfEVRVc8mypTzWGcK8TaoD7lpP5g==
X-Gm-Gg: AeBDiesRtEV5m5w8mzGuWHD6vqBWz/xBX7lKVRy60AZcvQYjIrpJU34mdgCpiiLn4zf
	inQIbK9lLHpZFSdPPZq/K14QCuxrrvOb/nBPocgPoligwj/r9ydZXKURGU+Pr0Pd4DhTy6xObFl
	lNyghOtBt/Qm4yuJunVJlfWu/r6i16BIK9vYD1KWyYJWnyjyt0gacmksHrjQSXQZWRqzI7zTPka
	oCnkUuXiCrY0xqL9Ts6D6+DTuELEhV5coeOqDe+MLKHCSxEOVt3saxOcGEoNwJaiCIGLlZ4ZSWt
	zRdcI66Gc+dDpUo1V9SRMQ+oOCm7VSueXk9K9ZtzNS60ee4rM7zK2JRDcVUqmgPj0phn3fiP8zj
	BleE9dkvW2ozDinMggLeX7vDE9r3uxhqO04NDuw/iim04zJ/lrsBhdLrFovl/Xjis9rNBoCekCD
	n59pqKYFP5/l8RnQ+T9nWKasKhNTbsqzT4o84MyChasetZfJFU1tXbhL6W
X-Received: by 2002:a05:622a:5a9b:b0:50e:6139:492b with SMTP id d75a77b69052e-51461c3620dmr77944681cf.23.1778116264664;
        Wed, 06 May 2026 18:11:04 -0700 (PDT)
X-Received: by 2002:a05:622a:5a9b:b0:50e:6139:492b with SMTP id d75a77b69052e-51461c3620dmr77944191cf.23.1778116264100;
        Wed, 06 May 2026 18:11:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230e00sm5221967e87.29.2026.05.06.18.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 18:11:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 04:10:46 +0300
Subject: [PATCH v5 7/7] media: iris: drop remnants of UBWC configuration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ubwc-v5-7-e9a3aee53c49@oss.qualcomm.com>
References: <20260507-iris-ubwc-v5-0-e9a3aee53c49@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ubwc-v5-0-e9a3aee53c49@oss.qualcomm.com>
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
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3291;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/9nEVbBbZylkYnurLYSAS/hZukhtGTEGsaxE9DNa3To=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp++aVh6IZ+jV2o5J5RH1giNT3lNZ1unZ8Ayvb3
 s7MFeQ5VAOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafvmlQAKCRCLPIo+Aiko
 1QaSB/90X34ni4hJpeXgAwDtXwokYiXk4Qv46OD4sJcnHVYnKzUaWG8aTLWdHZSGoXcn4Na1BiE
 EJmtv4sxv20sxG8H0B5IdBfP6g4dRWr2z3Ot7JdPRDT5Y/pDe5dVaQ5bbDALrpUruyN8Xh0FmSd
 MSc9KjQYKVeI4EmCKbOxrRG19fx/rAJqtP7DRSIMBNxGBRd7Goo7PmN05FKpoGeNq9uYYc6DHLx
 5ajgaJlR6hsdeWo/g/EmKW2m1OMhQG8YRjWRZx08yYolcNBoMO7UvbxGbX8ddQf15zFO1cBFrFy
 g6F0LQ97Nvdni0nFdGahwz8hxdLjofJNWqErd/EWxqgjnQ89
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=fMMJG5ae c=1 sm=1 tr=0 ts=69fbe6a9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=0TfDEXg-tPZCovj8PBUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0pW7hmWyzEqzK_qttd1kUrfQd2XuCEPe
X-Proofpoint-GUID: 0pW7hmWyzEqzK_qttd1kUrfQd2XuCEPe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDAwOSBTYWx0ZWRfX6l4d55UFguw+
 VYfCx17IfrIQ7/msQ8/2QxOLEow4ydlIx1X2w1t0JTxXrjoq7vKueS4zAAEfGI1AMuDVN5U1RTT
 Wh9MXez4U+Kc36KhKxsI8z6TrT8FLuXaYF/d1xc4o/FdVffhKhJaePYCQJUX5kcgDrVnpa3eIbn
 Zc6v8QI8d5aO4EJJ4Kxd15Qpp+2yv9qsdTW1s/3r8fWZAhCTlmG0OKELZHswpXuh9nU8iRaEeBm
 exW1XSXMlJhEu8NnxYEHyL+gpjAjHMGZCT+XXlqvA4pcCb56KkF7rPZaAgpS2EAtvEkllcMCv7r
 6Wnu9ucZ6VUXKdSxXqqhUdli87quiLxNfLEJPFcK8ZAhK0AOM2NELJZqRKH8udx6c0kY0WLQf+A
 Ok5c/ZFtfYvvtq9WQXyUM9rz5T1xuurE/TnmlNvErb2IsSzTdHElfFkUfCb5nvMKEOH3V7X77T/
 Ol+XpkxOOWKCLda1WSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070009
X-Rspamd-Queue-Id: 788604E1E4F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60698-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Now as all UBWC configuration bits were migrated to be used or derived
from the global UBWC platform-specific data, drop the unused struct and
field definitions.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 4 ----
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 7 -------
 2 files changed, 11 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index e8b5446dce76..f42e1798747c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -75,9 +75,6 @@ struct tz_cp_config {
 	u32 cp_nonpixel_size;
 };
 
-struct ubwc_config_data {
-};
-
 struct platform_inst_caps {
 	u32 min_frame_width;
 	u32 max_frame_width;
@@ -241,7 +238,6 @@ struct iris_platform_data {
 	u32 tz_cp_config_data_size;
 	u32 core_arch;
 	u32 hw_response_timeout;
-	struct ubwc_config_data *ubwc_config;
 	u32 num_vpp_pipe;
 	bool no_aon;
 	u32 max_session_count;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 05b1dd11abce..a526b50a1cd3 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -790,9 +790,6 @@ static const char * const sm8550_opp_clk_table[] = {
 	NULL,
 };
 
-static struct ubwc_config_data ubwc_config_sm8550 = {
-};
-
 static const struct tz_cp_config tz_cp_config_sm8550[] = {
 	{
 		.cp_start = 0,
@@ -949,7 +946,6 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -1054,7 +1050,6 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -1150,7 +1145,6 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -1250,7 +1244,6 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 2,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,

-- 
2.47.3


