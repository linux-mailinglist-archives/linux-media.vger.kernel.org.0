Return-Path: <linux-media+bounces-53817-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEisD9GnomkK4wQAu9opvQ
	(envelope-from <linux-media+bounces-53817-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:31:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A5B1C164C
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:31:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 205F8313FEB4
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 08:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF9B3D9020;
	Sat, 28 Feb 2026 08:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EcXqQKJJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R4VJa0es"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EFB3D903F
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772267346; cv=none; b=s8vt0axU/WKuGPIe8eRfQc1ETWs0YcRzD1MYOvymBPaIEDk1kOTeeg8nOmdaP1Xg9syaBTqCfV1VgvXmQ1P4oWRzWrub+rT/uuhjks4Tu1A0lyTz6vFLJa+O//zhjl+sfGpkEYCmjhXIaqX6Us1ro/7t7o+OoUo7ApuUSC7+XsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772267346; c=relaxed/simple;
	bh=UTDd4q7OJ9ElblHjzyWaiYHRBQRX00Jcn7/ePPmgxl8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oFIOiF8iHU+FbUZx0aYGsMbJB2o1mpfzfcE51NadswfCOKy24TPnZmRBN4FU2tVtzrgp+yBbHiHzFGCTzgvE8pZyuRDJxSFObrPElR/SSyKq95CByhgjPnWSwLJbOUdu+Zv1XMiFa5UNOWIyfdueLee/w7icNBXnNPjaka3nt0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EcXqQKJJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R4VJa0es; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S6Nn4S1782854
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:29:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5hCSj4BVNzP/ybKc2el5rIGmk2I7+zGs50Rsmhype+o=; b=EcXqQKJJd0twyJSi
	IDL7EBXJlxnUAhtNKPMcOCCJWVJ7gb5iIJzETTn5ffihgdPWOiJ9p3td4d8d43mm
	334yrBquwfRvN3hFCepN6cTFMfcWX1y9h6TvOvXcexLPBr4sh10/WbrWZQIuiBGb
	S8CGVJuhsjMGoltLrtK5TOqqxUsXvyfSHCz4RADcAE4y6zMx9tzYQeGJsXaLxUlW
	goi4jm7YBGsj0Epvf7qSX23tbgCCQxjK26y5crqL9Ls8CrAmwyZTT2W+oVSY1CRb
	7slC/DH5cfJBO7JubIeaupkFSovROvS2XYJJmO1OPFcVINlj+/rQ+ZFGfveE8Pkj
	H3u/sA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgrrj1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:29:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb0595def4so2864029685a.0
        for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 00:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772267343; x=1772872143; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5hCSj4BVNzP/ybKc2el5rIGmk2I7+zGs50Rsmhype+o=;
        b=R4VJa0esFC7getEZjZ68aFpVU8r2+Ay6IGFgS1Fm9iVQZaovg8bPcSS8ReqUTsxKz1
         h4fuc9hZ2mF83tOZAIW6pjSGtWz8GpOkv+3XOgygTzEXk11jLTE02a4B+XfHdCVAm39Z
         eFCv5gOQbS6pRv+AcYMt9Nxrk0LGQVlbLBdgcCviiRKYlXa8++0mpMf6BH+Qd18WNHwy
         vPq/U37OQm51VMtHc6c3WMlOdLwYr1wtZ0Vlo0GV0DWV84hbORNOMzN30Idx0pQq3ref
         Nd1BxeaClawyttnF4kaznuhetFYDbCaAQeAMccjcDqUVxCkLHWxtBDr1v+w5BdIfuh3H
         j8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772267343; x=1772872143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5hCSj4BVNzP/ybKc2el5rIGmk2I7+zGs50Rsmhype+o=;
        b=bLNL8cor8TfFJ0N7YiWxVQBK64/aQIhlqbPJ1+clufewsV6/Q9x0DzErS2pp006NXa
         saz3HsEodzPAMKt3D1WKwnBz7HAFjg5Tb5TX00JiSeehO2hDLbJ5yCNpTr6hdwaNA1Xf
         xVtWhfczkU2LngdTtxxapFIIZHaheuktQ4Gc1hWoD1UoCBGV4idchJx5ZsJJrvB8Guai
         e2QHmHq+1aafdOn+xNSI7snh3OpoRIbw4K1MTTbG2EY/cB4pxhO6hitgStevkIGHZQjR
         t7enT+d1RTMTAkZIYL7lEFkLY71BXE7fz/6utSmg4uFHu5cRXVWhVM9Y4Y1m/AcwyM/h
         D0dQ==
X-Gm-Message-State: AOJu0YyAuEMaFYL6ZHysxTlFzgRI508S3tvPKKvBsZXAuiYvB7eRKIRq
	AwheOrqifmMvvfwiNIoTANZMovpD/Uhq5ggC6M09t7RMVXODIzkIsN7O/nUIAMQSRsn5UrAjoTf
	cjN4BtpeAEb6fXhba3CccfQXuP7tKWXNxaBws21RKeb7zhAXSdWP3e1COvJQeI0x4XA==
X-Gm-Gg: ATEYQzx08g8ue4cOMkqjP3CDjfpJq5lpQxAKKowuss4qMb+HZHwSKO1cY81gPio6IUZ
	FubOQ7JpQjJxuBGVN4a+2xs0AxnyRBpYTZeYfvdzkpJ5TzveYc/kVglmn9EBLjng7Hc5X16cvYG
	xkpOlZ8Px/yelm7yjr2yENsJ6a3L61r/rJQgWRfmaasfI3tRhiMcZ6Dg03UR5tah3AVpXDoSH+0
	bd3I6R/9vIc6u3ZYp7bWBuuzqwM5zlDMK3+cw6MtVkaJSU1+9pF9XAIFwcyKVPJRVBT5AKTZ3oA
	A4JOaKRkRI8nDrp6qM9Edxf4/jPBjFhMpSZhKziJF6FMbp1u/1YQbyJYz8ssynC5WWCSk7Oj1vZ
	xBJhassgzQAHc9qIQSqXOu3E/SAJoFKxlnsf1COtC/FrFopSv75Wm6kMgDLabxPFV+HbABvYj0P
	eVvBV9aUgb93CygwD2bE285R4aENbJlR/6IaI=
X-Received: by 2002:a05:620a:4407:b0:8cb:3143:64cc with SMTP id af79cd13be357-8cbbf407265mr1100452585a.42.1772267343058;
        Sat, 28 Feb 2026 00:29:03 -0800 (PST)
X-Received: by 2002:a05:620a:4407:b0:8cb:3143:64cc with SMTP id af79cd13be357-8cbbf407265mr1100451385a.42.1772267342594;
        Sat, 28 Feb 2026 00:29:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2f4b158sm17970711fa.6.2026.02.28.00.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 00:29:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 10:28:50 +0200
Subject: [PATCH 05/11] media: qcom: iris: handle HFI subscription
 properties directly
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-iris-platform-data-v1-5-c2c53539f948@oss.qualcomm.com>
References: <20260228-iris-platform-data-v1-0-c2c53539f948@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v1-0-c2c53539f948@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10234;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UTDd4q7OJ9ElblHjzyWaiYHRBQRX00Jcn7/ePPmgxl8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpoqdAxvvR/UM/83ESB2bRZG5PXo5+yJggEKCoE
 SMAACZzv1aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaKnQAAKCRCLPIo+Aiko
 1dIhB/kBrmSKahGCUZq9QfeOql+SqGL3ugo7C84PMWecSDttQwv6vv20mW+2H3Ouxp1thZyIqGO
 eitKfNsAdMV0+Ud/LMw7okeARVYnGSQXx7x3XPLof4880i9gnGYO0OdmSPk8aRJ5bPXMjo8n63r
 UKpUOg+/S1UzV1gIZsOwpDTM5mbIK27K7QFIWYphBnX0eF1kQ12urgi/75edGIOaZsKrDgfG8+b
 LNA+4BWu4XNJCElqrbn79gE/UY3C6GCKNz4RoJq9/V43AXRONqt8OKJSAF4S45MTdEr8UI0neSW
 lOk9lGrpwQo7IiZdPqo8q8oxuSaNWaseP/1xynNhDJx2r29o
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA3NyBTYWx0ZWRfX4gbmqhBRaEll
 lTVZUhg+t4rhgrdyD7ZfySb0IZDbjV85M5tvCUUw6zrD/pk2ilCnw5U+ApCwEao719yOsrBP91n
 ku3rnZ0bwvjv124DaMBNp9MTZGwAlbnuIhTKOv171y/J8JGlP1qduImnH63Ylqa1GTm3cbEO2S2
 JSFh1jX4dnmzZuglhWHN4ucTD4UqmJ1s7BgpAmJJEixY6vmYTLURodI7q5OJtBAXSVU2YtXBjx/
 6W3SEFfOxHH7OgGg1gu6FxcABa3m1OuAEJRPwSDcVXaT2wcSslz9Ineeh3qHCsAdqRCHXs0vNsA
 3fZ+btZkp0BwgyUlBNr3al2cxFeHY2+ZhDtJo7SUPxhloqJjzW7i7fTY/6BtYh/FAiNLnqdFCGb
 ANcPb8Iem8jCV0znM/CHL+EEL9uw6t06hK/j1/wAQQJlqr83U1QBlAq+4JpkHR20eSiZROu2D1K
 6uNH0qqL6AhFJSNyCkA==
X-Proofpoint-GUID: MoxLIdfIC_ZtbnQfbAGcfsrmpSdZkkB_
X-Proofpoint-ORIG-GUID: MoxLIdfIC_ZtbnQfbAGcfsrmpSdZkkB_
X-Authority-Analysis: v=2.4 cv=Zqzg6t7G c=1 sm=1 tr=0 ts=69a2a750 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=GYkPiPrV-DgmlJk3dwoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53817-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 80A5B1C164C
X-Rspamd-Action: no action

The HFI subscriptions properties are set per the HFI generation, they
don't change between different platforms with the same HFI interface.
Instead of copy-pasting the same properties between platform data over
and over again, move them to the corresponding HFI generation source
file and drop them from the HFI platform data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 50 +++++++++----
 .../platform/qcom/iris/iris_platform_common.h      | 10 ---
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 83 ----------------------
 3 files changed, 35 insertions(+), 108 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 28f352d99bf0..fd8a055c4acc 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1053,9 +1053,31 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
 	return 0;
 }
 
+static const u32 iris_hfi_gen2_vdec_input_prop[] = {
+	HFI_PROP_NO_OUTPUT,
+};
+
+static const u32 iris_hfi_gen2_vdec_output_prop_avc[] = {
+	HFI_PROP_PICTURE_TYPE,
+	HFI_PROP_CABAC_SESSION,
+};
+
+static const u32 iris_hfi_gen2_vdec_output_prop_hevc[] = {
+	HFI_PROP_PICTURE_TYPE,
+};
+
+static const u32 iris_hfi_gen2_vdec_output_prop_vp9[] = {
+	HFI_PROP_PICTURE_TYPE,
+};
+
+static const u32 iris_hfi_gen2_vdec_output_prop_av1[] = {
+	HFI_PROP_PICTURE_TYPE,
+	HFI_PROP_WORST_COMPRESSION_RATIO,
+	HFI_PROP_WORST_COMPLEXITY_FACTOR,
+};
+
 static int iris_hfi_gen2_subscribe_property(struct iris_inst *inst, u32 plane)
 {
-	struct iris_core *core = inst->core;
 	u32 subscribe_prop_size = 0, i;
 	const u32 *subcribe_prop = NULL;
 	u32 payload[32] = {0};
@@ -1066,30 +1088,28 @@ static int iris_hfi_gen2_subscribe_property(struct iris_inst *inst, u32 plane)
 		return 0;
 
 	if (V4L2_TYPE_IS_OUTPUT(plane)) {
-		subscribe_prop_size = core->iris_platform_data->dec_input_prop_size;
-		subcribe_prop = core->iris_platform_data->dec_input_prop;
+		subscribe_prop_size = ARRAY_SIZE(iris_hfi_gen2_vdec_input_prop);
+		subcribe_prop = iris_hfi_gen2_vdec_input_prop;
 	} else {
 		switch (inst->codec) {
 		case V4L2_PIX_FMT_H264:
-			subcribe_prop = core->iris_platform_data->dec_output_prop_avc;
-			subscribe_prop_size =
-				core->iris_platform_data->dec_output_prop_avc_size;
+			subcribe_prop = iris_hfi_gen2_vdec_output_prop_avc;
+			subscribe_prop_size = ARRAY_SIZE(iris_hfi_gen2_vdec_output_prop_avc);
 			break;
 		case V4L2_PIX_FMT_HEVC:
-			subcribe_prop = core->iris_platform_data->dec_output_prop_hevc;
-			subscribe_prop_size =
-				core->iris_platform_data->dec_output_prop_hevc_size;
+			subcribe_prop = iris_hfi_gen2_vdec_output_prop_hevc;
+			subscribe_prop_size = ARRAY_SIZE(iris_hfi_gen2_vdec_output_prop_hevc);
 			break;
 		case V4L2_PIX_FMT_VP9:
-			subcribe_prop = core->iris_platform_data->dec_output_prop_vp9;
-			subscribe_prop_size =
-				core->iris_platform_data->dec_output_prop_vp9_size;
+			subcribe_prop = iris_hfi_gen2_vdec_output_prop_vp9;
+			subscribe_prop_size = ARRAY_SIZE(iris_hfi_gen2_vdec_output_prop_vp9);
 			break;
 		case V4L2_PIX_FMT_AV1:
-			subcribe_prop = core->iris_platform_data->dec_output_prop_av1;
-			subscribe_prop_size =
-				core->iris_platform_data->dec_output_prop_av1_size;
+			subcribe_prop = iris_hfi_gen2_vdec_output_prop_av1;
+			subscribe_prop_size = ARRAY_SIZE(iris_hfi_gen2_vdec_output_prop_av1);
 			break;
+		default:
+			return -EINVAL;
 		}
 	}
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 00e40590d5ec..f5eb17ae072c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -243,16 +243,6 @@ struct iris_platform_data {
 	u32 max_core_mbpf;
 	/* max number of macroblocks per second supported */
 	u32 max_core_mbps;
-	const u32 *dec_input_prop;
-	unsigned int dec_input_prop_size;
-	const u32 *dec_output_prop_avc;
-	unsigned int dec_output_prop_avc_size;
-	const u32 *dec_output_prop_hevc;
-	unsigned int dec_output_prop_hevc_size;
-	const u32 *dec_output_prop_vp9;
-	unsigned int dec_output_prop_vp9_size;
-	const u32 *dec_output_prop_av1;
-	unsigned int dec_output_prop_av1_size;
 	const u32 *dec_ip_int_buf_tbl;
 	unsigned int dec_ip_int_buf_tbl_size;
 	const u32 *dec_op_int_buf_tbl;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5b157697d478..ef70472ecde5 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -794,29 +794,6 @@ static const struct tz_cp_config tz_cp_config_sm8550[] = {
 	},
 };
 
-static const u32 sm8550_vdec_subscribe_input_properties[] = {
-	HFI_PROP_NO_OUTPUT,
-};
-
-static const u32 sm8550_vdec_subscribe_output_properties_avc[] = {
-	HFI_PROP_PICTURE_TYPE,
-	HFI_PROP_CABAC_SESSION,
-};
-
-static const u32 sm8550_vdec_subscribe_output_properties_hevc[] = {
-	HFI_PROP_PICTURE_TYPE,
-};
-
-static const u32 sm8550_vdec_subscribe_output_properties_vp9[] = {
-	HFI_PROP_PICTURE_TYPE,
-};
-
-static const u32 sm8550_vdec_subscribe_output_properties_av1[] = {
-	HFI_PROP_PICTURE_TYPE,
-	HFI_PROP_WORST_COMPRESSION_RATIO,
-	HFI_PROP_WORST_COMPLEXITY_FACTOR,
-};
-
 static const u32 sm8550_dec_ip_int_buf_tbl[] = {
 	BUF_BIN,
 	BUF_COMV,
@@ -880,21 +857,6 @@ const struct iris_platform_data sm8550_data = {
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
 
-	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
-	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
-	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
-	.dec_output_prop_avc_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
-	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
-	.dec_output_prop_hevc_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
-	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
-	.dec_output_prop_vp9_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
-	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
-	.dec_output_prop_av1_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
-
 	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
 	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
 	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
@@ -954,21 +916,6 @@ const struct iris_platform_data sm8650_data = {
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
 
-	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
-	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
-	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
-	.dec_output_prop_avc_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
-	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
-	.dec_output_prop_hevc_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
-	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
-	.dec_output_prop_vp9_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
-	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
-	.dec_output_prop_av1_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
-
 	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
 	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
 	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
@@ -1019,21 +966,6 @@ const struct iris_platform_data sm8750_data = {
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
 
-	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
-	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
-	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
-	.dec_output_prop_avc_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
-	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
-	.dec_output_prop_hevc_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
-	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
-	.dec_output_prop_vp9_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
-	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
-	.dec_output_prop_av1_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
-
 	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
 	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
 	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
@@ -1088,21 +1020,6 @@ const struct iris_platform_data qcs8300_data = {
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
 
-	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
-	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
-	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
-	.dec_output_prop_avc_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
-	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
-	.dec_output_prop_hevc_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
-	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
-	.dec_output_prop_vp9_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
-	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
-	.dec_output_prop_av1_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
-
 	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
 	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
 	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,

-- 
2.47.3


