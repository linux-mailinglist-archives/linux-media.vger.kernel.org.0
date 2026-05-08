Return-Path: <linux-media+bounces-60908-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gC8jBYay/WkXhwAAu9opvQ
	(envelope-from <linux-media+bounces-60908-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 11:53:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 689804F4821
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 11:53:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35798301A1F7
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 09:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD8C3CD8D7;
	Fri,  8 May 2026 09:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="auGDeqFD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H3fFwgy0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1AF384245
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 09:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778233878; cv=none; b=gFl2AAf/iK215jFueciWPmwRRM0Gy0Dmenn5O61ZuABD6NJrPJy89zg3COnUYXFKbg5QiOwp/EF9GdY6eEHJIcGiYxnjAXExYRz+s6JoueSmwVrLNZ8FjS6V1skAzhAu2eqz8ybCnsCpyVEbCYkgAV2FcptqZ7T52grA8eP1/JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778233878; c=relaxed/simple;
	bh=A9+mTcBSQybwQWajAHQd2dDBgtkeNZu/YRICsAQUe1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jgQ9NbpjL3V4dBh6AvW+GW7Gi1IkcSfNxtHi9n5KoEH8yFAOO6dYzGRz7rBrhLKzRpy7q7OJlYG9DpUDtrftyI6umxsXQ9RBXxVfCHAggXa1G2AemFwMCHIRD5pL/b7BpgztO8HGZU0RyMbb7ivw+ZI4z+w/AjkYMKSm9zPGtPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=auGDeqFD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H3fFwgy0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486jJ7x258202
	for <linux-media@vger.kernel.org>; Fri, 8 May 2026 09:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TtN2Hj23wPRHyv2TVHUkVRACaL0lMfhM10EaRoSVv4M=; b=auGDeqFDFu9eM7Kt
	4qiovqKhg+NZglPDjTnQs6xCz4akTnzidSOj5QdtJIq3RlTvwveUV8sas69segEn
	bRR+yBXgDm26U2kJ2k3El6ovDIAyTN5CFYn+tDmQ4EAG+PmgClay125cEGZ9i6SR
	ILw7gN6utoTbsMbcDX3Li00EHPUz9MsLQ/3zb1pNOsWO9ZMxsXhqjhClqg+iJa7L
	qScB4aLKL0/dzNpGRpFz2bJ6h1x+QqBwL6HxX18t4imrSuNN6+h8mogfGs2h5EHH
	SXDuxpWknzGe24WUHWzK6BIP3VBYzH+9Lgoa3Jdqp/674u+jsfuLkP9UCDBq6V4r
	KM86lA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1auegpgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 08 May 2026 09:51:14 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2cc75e79b97so6690630eec.1
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 02:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778233874; x=1778838674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TtN2Hj23wPRHyv2TVHUkVRACaL0lMfhM10EaRoSVv4M=;
        b=H3fFwgy0GL9paj0M5QB9oGGHCapaJABYRPEQxRxWuT642N94xGlkFL3nhUTQkfdy+q
         /CpueaW+Mo1ZdV5rYtthHS4M+J4YqoGSINnsSnUtiu5vj1zNEnmBLHR36tCVffT0fJQH
         yCWnBh9E6n+E6NwJXoy73hPc8D8/QdImAHYxvrL0eh8Ns6UlrwNUnCZTrn6jQw0Li6Eb
         wd/jQb9RKs1loZHdqOfXqzvZYfWtJsQ4GoIrLIxrmpvpMZlyzWuITcwfUqnYRhxvzH0e
         6rcy3oebqm9mM/kYpRZV3gn8VhHwwFYiWGNRz5qq+ovJeYwyGsnMnMUUpmRDKqRv4GsV
         CudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778233874; x=1778838674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TtN2Hj23wPRHyv2TVHUkVRACaL0lMfhM10EaRoSVv4M=;
        b=aWUwQ4D3U/jrHENFJsBhaGiB58psHff5cGy5rAnmMDrUbWU9QBQn3h1T7/kfMKgy+c
         ie7ggO2DIyKtznCnKxE4uE7RnJQUcy4HlPo4M7MM3PoZuePuLYmOFpF9FX2J49rkraKe
         DJKbo5G+umFs3MOX3pzGp3zz5LcdsD/2yUo3gH06TqalHJDP3RJfVNgeYNyTYzD0tOQH
         ai4dmk3jevELWq79ivTMLQ6d+nn+k0B1FdqZc14OTfPxbInkERNhQPqtAeoaJTIoOCnp
         kMgYB9twcgSkq3HWOwk3C9Bx/EOWm+9DQ4zppoAwAbDj+PupqQPXgvtve7PqTKeUBKAp
         8AJQ==
X-Gm-Message-State: AOJu0Yz1ko/a3IaSYMcioatycvf0w1PUiV167OC0z+a5wju8grAIKykj
	UM4+xMl2GV54Xw713oEIig79HmRL+u9e6k6ff8tfxqCXTFo4OEcOyRBRXS7opph8EFph3P57cRH
	Rs4OGLXxVp0JXefkvNAT1BCoG39K2JwMtHQQBLQct32xj5IPRYad1KNWVxC5CTb9a5A==
X-Gm-Gg: Acq92OFlkaAuv0YmKYbFEJ54oGHspJS6VsCdM7JnFmD3xKW+9d4ctkRw2qKnSlBdGL8
	YJ9IkG+6bXRXEseU3Mlkkdv7SWLoassusLHcDB07SVZA+AotrmseoJqexSpgh/3edCb03xJnuuy
	mvaM6hJ5EDIGynORd611Fv0qMQEfxw0J1qPQ8inHsqFo+sk9ko6nY3e70G43uBnmjELTJ1sDdlU
	pVTJ+/P+gQw2CRMWaskNV0vWUDMSD0wSMbsDkQ/Lh/BmoUBr/Hka4RVR2IGJd/ojda1OvUzRPD8
	WYQbevLmrGssDuzC10R42UDNDsTTUT1742DUa8mQdlCHWHyu1c5N8R6LCLRgWDerhWYk1VhMVXk
	itcGwAloN+oBIfix5mEwj/GJ+umNSs8RRYuqT42xCAFVDaoH4aqBug6oaVUJkNn0TpTkmkVTPiE
	FfWzlzCFx2SZw=
X-Received: by 2002:a05:7300:5727:b0:2f4:3a9c:818c with SMTP id 5a478bee46e88-2f54d678d74mr5935412eec.29.1778233873567;
        Fri, 08 May 2026 02:51:13 -0700 (PDT)
X-Received: by 2002:a05:7300:5727:b0:2f4:3a9c:818c with SMTP id 5a478bee46e88-2f54d678d74mr5935394eec.29.1778233873070;
        Fri, 08 May 2026 02:51:13 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88847502fsm1739323eec.14.2026.05.08.02.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 02:51:12 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Fri, 08 May 2026 02:51:04 -0700
Subject: [PATCH v3 2/5] media: qcom: camss: Add SM8750 compatible camss
 driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-add-support-for-camss-on-sm8750-v3-2-fc6861a65c67@oss.qualcomm.com>
References: <20260508-add-support-for-camss-on-sm8750-v3-0-fc6861a65c67@oss.qualcomm.com>
In-Reply-To: <20260508-add-support-for-camss-on-sm8750-v3-0-fc6861a65c67@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEwMSBTYWx0ZWRfX2jSBvxcbWxTC
 FQP+yQv9kBCHBcpWdcTk+8NgkMDuEBfIRx+o/NT/VKA4mzn+alWFFz6waKTyLmTxMFKX0AsJvDr
 O4eOjovNmz+PKB2JPAPU5i1ZeM1buECKwy7KJuo2DZc2CTWIBkSNrWGgyw5+p9h5W0iFtH6tGxq
 oirbVfpdgQYkl8qe+d05Psx5E0hCW4sceASX6IVbUULhBe83MLIHM8xca57YOWSL+dWu2+v8ZNH
 SEDOjrywLAOQ70QasPo/erv01UxaUvhTXfhqniW4xYeKuDmxjT84qeFAllw+WyFwEVz0jX67auT
 /8mtX70Ir6D4Z9yrxFiCoffZ5KYPJgMuWdLuR0xEkQvtEz+jZN8jL1oyoHzcEW0t2xQOgYpZ2iF
 jIDRaVFbmDLCUKAFwDbrDiMJWGWSQwe10IBl3m0HawJdwhTLOM1XITcvGqygXced4/yVn2pOj2M
 AXNdcACW21gE8GjdawA==
X-Proofpoint-GUID: M375yuEbUhOvdbwGNbO3-s3zKKqlRP1j
X-Proofpoint-ORIG-GUID: M375yuEbUhOvdbwGNbO3-s3zKKqlRP1j
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=69fdb212 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gE60Ov1lhapgyOv8Ur0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080101
X-Rspamd-Queue-Id: 689804F4821
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60908-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hangxiang.ma@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for SM8750 in the camss driver. Add high level resource
information along with the bus bandwidth votes. Module level detailed
resource information will be enumerated in the following patches of the
series.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 04f04d0c2fc7..3cebce812c58 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4238,6 +4238,20 @@ static const struct resources_icc icc_res_sa8775p[] = {
 	},
 };
 
+static const struct resources_icc icc_res_sm8750[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
@@ -5660,6 +5674,13 @@ static const struct camss_resources sm8650_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_sm8650),
 };
 
+static const struct camss_resources sm8750_resources = {
+	.version = CAMSS_8750,
+	.pd_name = "top",
+	.icc_res = icc_res_sm8750,
+	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
+};
+
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
@@ -5692,6 +5713,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
+	{ .compatible = "qcom,sm8750-camss", .data = &sm8750_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
 	{ }
 };
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 2820c687e066..dafdfe1d3a4a 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -92,6 +92,7 @@ enum camss_version {
 	CAMSS_845,
 	CAMSS_8550,
 	CAMSS_8650,
+	CAMSS_8750,
 	CAMSS_8775P,
 	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,

-- 
2.34.1


