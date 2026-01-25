Return-Path: <linux-media+bounces-51475-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JD/NLX/dWmMKQEAu9opvQ
	(envelope-from <linux-media+bounces-51475-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 12:34:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 381AB8049F
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 12:34:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FAC43050D4C
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 11:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02EC21F583D;
	Sun, 25 Jan 2026 11:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZqrwAWTS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZL0a/o3u"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB66431A558
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 11:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769340632; cv=none; b=Oaly/NoeoDNlKLtQBLHNTm+5Ooxv0sQX+Q8pswbpI12wLg8Oi9mELnyKtxobQi43C70Gp49PeeZ0qlbr91bpfmVQuFfTAyGdaN8QvUW8QBYIGJuc8aJAjeUT3Rav3RCXx8hzDAB6BDXCRisBBRNIxS6GkOJRKmSZKBZPgTGm19M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769340632; c=relaxed/simple;
	bh=I0GJCkT+M6rzwScGE2nHMtdPm0YonKxq+nwx5NI6V5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l653dw7Yj3B4fgNH3F2Sop5Wu/VfvRXYjcffiVd+XmXCJlC1VpN2lLU+DQb5ZKebbCeEEoF56MxzOCX3NfgN0m6njoW3QHX1JrifsKtlxILqAEFWR4FppDvdUZiPzEeGduao6O6mfms0Z2lGmSwcAhmnTuN269jBNldgCvKSAHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZqrwAWTS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZL0a/o3u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60P6PVxn2823697
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 11:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SyQqdK9jmZKeNVXJQVvQIDZmFlPQgBoBYfDnZTubWOk=; b=ZqrwAWTSQABX2npi
	TVIHRRRAO64dO8G/rheiBW9cDNHF+Tt3eW0tjfIPQfhQtjN9wCkIumkHfhgBdHo5
	3xGpFhJYsGZsmRVVV/hayuQD5N3Pejw6g3FYJ+C1tURa/x5wE96/6gLZpp74HbcR
	u+5nh0G2gbKFn+WSC0tDRC+osTk1bhrSTuO2Z95iWpKyRHT5glW3FzodXo61advE
	bKq0JnqxjNAfew6LySMuJ/IE3+uQxXVRTNApunhfLnRqLKAYiZ2Vqze0FICkL63c
	gGli5QmgDSsEvWrOt26g3I7/Q+zSHIXJvvV682Wr2euf9UjtlOrPQ4emV9hlKU3V
	CJRRQg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9tt0qq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 11:30:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a87029b6so1143843485a.1
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 03:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769340628; x=1769945428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SyQqdK9jmZKeNVXJQVvQIDZmFlPQgBoBYfDnZTubWOk=;
        b=ZL0a/o3uMMvPsbSSH4DSrP0qIk1JuOtseDtVcL5auY33al04Slur7SzKYyv7KDcPYP
         yjD82SAopVVVEfLt8NKoX1nof1TSis8vyDZretQZep+3HoI/YIQd9gbBrkcv6QSx4uRt
         tRoeYglF99vavZJG97WHoRLIdKKgIzScqCu3J86ynMGDlJD7wJdLeLkFco44k3cVztNp
         Y7NOL7qHMpcwQWmk8jzJYIAhVCu5Y8ooC4R/pHAr4WKDldJDGM9OTrkVe3777pO6GKPz
         sTUYPT7cP6+Y6cOWiUcWMEc9MH3MsVDUXOzjXXqAXLzdrkuEjyV69QhdJR5X3ZaZaVem
         8nRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769340628; x=1769945428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SyQqdK9jmZKeNVXJQVvQIDZmFlPQgBoBYfDnZTubWOk=;
        b=NJkBFtEH0cJ52w9Uwj02oAn498h72jAJn+ISwdZKkbiyz3DQdr1RciAcUYqhf5kxbH
         RXI8Oh6X6H133CJ3p3gNcuICNopt9psdnOTG+UgZuVvFclkEDiG5WwDsvZj3pMfA44d5
         nMn3mGVZdkDmJXHcemqxoBt5+O8w8vQdjYYC4JnvAzxnHBgYveqop7nH/z3uLG1YoVVo
         YQQK6NGu3BnLPNOMK7ovibpD7/XOUfj+J1BJIDy2h/CgUcm6POj0Nvee+MW+thvtdozX
         vqsPjy/v3pF8RRFXUQtHvk5LufqJuXb26qDYeAIUwsYqedwKLOSpHC//g6XMcdaeOJwz
         GdEw==
X-Forwarded-Encrypted: i=1; AJvYcCV8frqJx32sCjq1ylsfqBcgCkNIMMFg99oIS9cgpe+5WLosjydvzN3+UrcwVV0kvBQtJ2O4QnOrRAiZJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMCDC4NP9u9mXkLqQUiOw+BzmjNaSIi7ab6wne4JauDHVdLlGX
	8LwphpmE2dNFyaWKY6qD/qZ9yyX5vBkL/Mf8+R0FX+o6GErt3yuB9GqBkbmyQ9/ZklNuWypuxwY
	eSMJry2retGWz/I6kM5DDQU4OQF5gO5eDXaiEOODkDoR9u26rMJjaW1FWrgPF8KBTsQ==
X-Gm-Gg: AZuq6aIAIe83+nY0/u+vXNM0QgixHBm7Rls/xlG+Syk8ADIKWvK+zNMmyNGVrv/r0sj
	6JPHK+oFlMzJ6eVzxbbC4vNYoSegaFTK8rxBFtwIkywrD0DY4gmIK45VSzWX6CIb0BDUHX2l3Xf
	oRT+MvMU9rbU8SFN90jLE2x88iw+IqQ0DtmTLimYMPxaIVlD2qxHrN/Pg/fjNorpKRssCdvWNQM
	9ZbII589DjLEZThYMhNUklc1fRjkX/CavR02V6cELOOuIPWIxUidN6uR6T1kO42d3vcLB2FSSJE
	SaK5/W5RoJljy+lk2oJN/sK3a1fgNAQBEjNzy1j/jTjy/ULeE5oRRGDFpUV153UBExT0uVn3FdH
	kicjAYgTneO8DQe/sV3nKT3VNT0MPiXbCIiX3zPW3symFB83VrpAluOZky/27xHwx5qSNINUNtM
	QSMz0WVxF503FYEHHYWtyhAQs=
X-Received: by 2002:a05:620a:461f:b0:8c6:a608:5abc with SMTP id af79cd13be357-8c6f95fd92emr156260885a.28.1769340628066;
        Sun, 25 Jan 2026 03:30:28 -0800 (PST)
X-Received: by 2002:a05:620a:461f:b0:8c6:a608:5abc with SMTP id af79cd13be357-8c6f95fd92emr156258385a.28.1769340627680;
        Sun, 25 Jan 2026 03:30:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9fec3c9sm18583451fa.15.2026.01.25.03.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 03:30:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 13:30:08 +0200
Subject: [PATCH v4 6/9] media: iris: don't specify ubwc_swizzle in the
 source code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-ubwc-v4-6-1ff30644ac81@oss.qualcomm.com>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
In-Reply-To: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3286;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=I0GJCkT+M6rzwScGE2nHMtdPm0YonKxq+nwx5NI6V5w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdf6/r+/CRSOtjlesB321W8+/NVuCWNV5b7blO
 3tD6mjH262JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXX+vwAKCRCLPIo+Aiko
 1UMeCACfr6fMyFR/w1e2kdiDjfvPQe/y223f1zEgA73d6AKI50kP2ZsaBhG04vLvbeVPTzZdQzv
 ftfQdeTefNyGINHx3JGZaX2evrbO2fKqgIAQlYUvmvpCyB9XoyKxgpIPmAr1VjKAxRKPugxxW0Q
 rgGGaUDtSRlhjpMJmO7TDFGanZK4Q00jh4OprV9iM3qwhWGCldRVI2N68bR3QOVoHT7s3j4VruK
 aodCfVgHUClwmn33Ad23lKsNGaIfPKi9WKfLMsFT4qIlCAzQnYwQsBdZ5OSfeTVecqQ0g1yq/+D
 kjhB3WEiz30ELAQL5J/Q7KCz+A5wRoERB3HoDGvxSBZqpC9K
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDA5NSBTYWx0ZWRfX18C8YZ/akSp8
 TgMLKgRuQs7JCbSTRFhrZI9ReRGQ//iBAwVOfx7yLqDq4DwPARwFCl2ehiqSo/E+MumOqAIeHNl
 go+p2QHwFZNWs1gWN8deyQoLc3pb9p5VyR6IgYbXtpPL+hzVGM0QrucZmpzrnB+xdQPG6uLLXGA
 MzlMRAyxG7RQHnGPLo4DKAYuIR79zw9SFhl7TQr098NSQ/WkDAlvhiERaa1Z7G1EULRl2NBxyIw
 Z/t87k/uvIeyYZM7PMgWKxWNzEDG8tKLe+C2jY5YEd1lL1XZC2X34g+MpAwW2lRa6hBP5QkZwfj
 6YQ1Aq7G0w0BG72mh5RoY3u4J0pOfnTO66w83VPJFUYiPA30pdtcTSd0g29sY1l1fSLPIImDkZN
 f0O3cRZoXhqaRKUx8nPZRTAOZ/kMigWAic0R1kK0yM8jKMT/Egfu65UfHxEZZc2DNzOMogMMWwv
 BAJKc01kaqNJn8dg3Ow==
X-Authority-Analysis: v=2.4 cv=QN5lhwLL c=1 sm=1 tr=0 ts=6975fed4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4H5-pPW84uT1T8hsIVgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: SnI-909Om1nCSevc2EsTPTomeUTflk4n
X-Proofpoint-ORIG-GUID: SnI-909Om1nCSevc2EsTPTomeUTflk4n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51475-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 381AB8049F
X-Rspamd-Action: no action

The UBWC swizzle is specified both in the Iris driver and in the
platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 6 +++---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 3 ---
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 3 ---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 6dc0cbaa9c19..a4d9efdbb43b 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -170,7 +170,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swzl_level;
+	payload = !!(qcom_ubwc_swizzle(ubwc) & UBWC_SWIZZLE_ENABLE_LVL1);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL1,
 				    HFI_HOST_FLAGS_NONE,
@@ -180,7 +180,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swz2_level;
+	payload = !!(qcom_ubwc_swizzle(ubwc) & UBWC_SWIZZLE_ENABLE_LVL2);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL2,
 				    HFI_HOST_FLAGS_NONE,
@@ -190,7 +190,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swz3_level;
+	payload = !!(qcom_ubwc_swizzle(ubwc) & UBWC_SWIZZLE_ENABLE_LVL3);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL3,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5639eb5a75b6..e217f15ef028 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -77,9 +77,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	bank_swzl_level;
-	u32	bank_swz2_level;
-	u32	bank_swz3_level;
 	u32	bank_spreading;
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index bdeb92e0b7bc..8072f430bd26 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -792,9 +792,6 @@ static const char * const sm8550_opp_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.bank_swzl_level = 0,
-	.bank_swz2_level = 1,
-	.bank_swz3_level = 1,
 	.bank_spreading = 1,
 };
 

-- 
2.47.3


