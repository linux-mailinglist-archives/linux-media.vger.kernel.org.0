Return-Path: <linux-media+bounces-61224-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNbGLi7tAmryygEAu9opvQ
	(envelope-from <linux-media+bounces-61224-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 11:04:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A01751D392
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 11:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86B2F30FE566
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 08:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1AA3A6EFE;
	Tue, 12 May 2026 08:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H+css+vK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KQc8VoR4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AAC39D6CC
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 08:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778576151; cv=none; b=YhVospH5fR/VnyeM1eXHspbH9dpoe3X4y1DXbE9qWReDEGuoYQFghynd/Sqd56FR4dNjDrAb09Yh7Tj7/fPE9SGE+/cTPDsrqFOPV978LdPrb+ypd0xsUQy05+nCqRZyuG5aYavFEgp+/kac7s8H15o0ohmM+HFRF4QsZvTnVF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778576151; c=relaxed/simple;
	bh=oKyxv1kvMdyRYLfpJoBQM0SLvUyZbzRQr78EWfmIvEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aoiCUmWKs5YkZYFL8C/jBddSJxONVvPIm4naBiqbc9F9stfC1hj+3Pr2VikIIYpAj6bnZlp+wZxFVCtwTNfwLTySHsrSfz8IwgIZfnQxMhAosOLyMM0jqMoFxYgYJkbw6lUW5jBeIeMSRFTfZXhNIks+V9rh+B3KwPdpYTm62Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H+css+vK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KQc8VoR4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C4TFw21183964
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 08:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fUMIIa00afYZEA5MbAYNO41DoI7NKvRkyQl5PMTlsFU=; b=H+css+vKjMod976+
	mdNUAettKOoF5WvuHJKYFQRBUwE4ZUN1R8q6B1U2OBQsn1P2Iq+9zIZj6zXbqLxt
	IisGi6iQ02quDfmxtvT0+Pcs/ddUqTETLMTx9Zew1ePmBc/AXpW8+zTeLWDnxwze
	uuM7DESM03nE11vbpLdLKiQFHyvtxj+c/FAC61yv/e3bUcfpsai5PWW6hn3FNnUk
	EH2t1IP6nkOjND37bGK7PYZ3enEqxjqjkNgVaQy6Y1gnsM4Fx9AqvU+JmIk9VamK
	Qn4D5KR/dqLOEfI5N/rG74MGQcW1A/asKAw3zF1o/3Pb9zs/QLVzG/LfMcm+T90Z
	6EnlUw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nuyab6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 08:55:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba86e35aa1so80521685ad.1
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 01:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778576138; x=1779180938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUMIIa00afYZEA5MbAYNO41DoI7NKvRkyQl5PMTlsFU=;
        b=KQc8VoR4HyyNo5OlfdD7rzghR/ONFHr1qXV6wDBRQSmHoo0Bjf3Ln2fYcJHSOWWrq4
         dwlVOgz8Vfl4PZC/yhYsiiXeidglVJ/jaZ+M3zMgy28bCPqPt9UAcutbhTyg4DKyWL1x
         1cKCc1nUxIHNUanUb2KxnYQtSIon9k5rt0PVAK7xk3IVoblJVBIduGXd0RSMC/spT0Mr
         cLQggWeyG8OzArbOr+OyqHkkSkkrR/8wr8fJPvisx97KF6L1/LKn6W5VrMkTFyO0/JQW
         YBACokC4EWsKzuSrPLxVlu/n/kZkDHYJtjBEABF5ZNGEbKA5aX7JJLugtGYsY6V9LGSz
         ulcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576138; x=1779180938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fUMIIa00afYZEA5MbAYNO41DoI7NKvRkyQl5PMTlsFU=;
        b=fdEE/e8gj5nAgNCOmYfRV54U41exjQ8hqCsPH5w2rE3iGnZ1gGmGhk/vV2idmONYK3
         gBnjI9N0N3AN1HedUcFLFQ3phtkRy2xZXIJ2JyBcY92Mt1utXcfgCvcOC49kitzHxwGh
         vtPVfVIpo+a9vmrgZm0mkttkVroMHbqAN4O0gAlBteSjHC4p+mNuakreygkWVbK8bZW6
         SnjrzYVHXgiha7OjD3R/ri2W4mMTqltJYmZgCpZYlqi3bMpq9nvvXsLrNnD8sfIBdb3l
         +9fbNNt7CJDTGJzB6zCLRpyS2BUjlDxehDK0CUxgOnkSokO0dxle9gZkrK8qkJiatu93
         TkOA==
X-Gm-Message-State: AOJu0YyUdK2tGvbJ7Tl6fsvBhA4KLabMNzsqSKccoX3nClr/2OsVWrE9
	Kacf9Q6QAawJksa8dG/DFBTYgOGccZjBgy9Et7OR6vLE2lae16oK0OglBe7hMY7YzE26Tct6dQN
	EH4udLnlQXRWf27c1HGES4D/YGx97g0Uji+2bH/KUbe1i7WykSeoYGc+7vHafLg2HMQ==
X-Gm-Gg: Acq92OFbJr4KpUV0/eJz9dy0FkVHmFgclVBhhssAvll85uhcr/yx7a41TF3J+E3sk7l
	gDFlH50vwpmQgona5vL5hLtWJiI0/oAEf+yrUBBpBrTT+ZBntKG8NaaDUOhUDstY0uQmRYSSB9k
	BCzLYBGH6JaH55yoGR1ASAWV2iiayBeRyrOkHEJBwNT7Zkr91FEQnp6kHTm/HMY4yPifYuEsgxj
	gy+RaGr/0e5JyU38pitnJbxqryByG4fOsjQBD6IfVbcznrxPKxYVvPfR4qJh1S1KGjZF3DGtAR6
	2aw4SZFdBESOMpxF6T/K/R4TplkMZ9j9tCijBJdz7xPtj2zPLDRCJDVorwWk0BB2tQf2L/y3OwK
	zsT4sIsly3mmN+h8WzDKXu310GeR0dkAVEYDD6v+Oz3kAEgy9z7b4W1m4lW1Nry0yTdLyGbuedA
	a4yDJAqMeUzlcqEjb7/cDI
X-Received: by 2002:a17:903:37c5:b0:2bc:e628:9cc7 with SMTP id d9443c01a7336-2bd012d5bf8mr24144875ad.24.1778576137624;
        Tue, 12 May 2026 01:55:37 -0700 (PDT)
X-Received: by 2002:a17:903:37c5:b0:2bc:e628:9cc7 with SMTP id d9443c01a7336-2bd012d5bf8mr24144625ad.24.1778576137140;
        Tue, 12 May 2026 01:55:37 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e90854sm127641405ad.66.2026.05.12.01.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:55:36 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Tue, 12 May 2026 16:55:14 +0800
Subject: [PATCH v7 5/6] media: qcom: iris: Optimize
 iris_hfi_gen1_packet_session_set_property
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-batch2_features-v7-5-4954e3b4df84@oss.qualcomm.com>
References: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
In-Reply-To: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778576115; l=9503;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=oKyxv1kvMdyRYLfpJoBQM0SLvUyZbzRQr78EWfmIvEI=;
 b=orPoYIW33IQqzM3j6w/JUwIqmjRRRDk6d3p3IaZXfDZbBnkhYbt104RyWP//mD6TzXP+i5ozs
 YAhAfE7p+Z8AoeLLTa3SaOLQUgH4LqmI0NUcnmGDR9DN3sukvBBvZQY
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: 4B3sS-5g9OMWHysmboqQc2l_xWkSi5aR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA5MCBTYWx0ZWRfX8wmkmxCLw2X0
 xvFgUzWPFWsK1yBjql370NAlgUBdrP8sLcdj/PR5zuqIx0eSkc2C4qnwsOKHxjYglbJ9s9T0qgx
 UghphoI6ZrM+tSXc/qMCCIYKdcO3ZKB4LyDeiHgtaBbGesby4/86Pj84iumdw9+7xrs++6eUhDN
 ehoqNDAdMR23jwf76XWhf7rhfEcNxz2nhqjpspbISXPMI6+ENrz8ybygUjq6yuGFf8Q/C9MppCy
 gXzEY54KDS0+KRGXDgtuuiTRBazXUrQ893Vc7KmE4M8pif8FvgRfgwuODIIIwGGA4YOog02XSwV
 nILsoES5UDKQIJ9xyb/sxdbrm3DDuNDg8iAZSf50NF50ZKUuoz1AC4LEWeEbIYgQl6Qs3JdCnwL
 qUkycze6W0QpsDatM6OZlb9b0sAIN2DcJoNB6XOWkY97jC0gIxbCZG7zkjpQ62e9GXmHbYDVeRk
 KwltPq5P09IYM3ArrlQ==
X-Authority-Analysis: v=2.4 cv=UZ5hjqSN c=1 sm=1 tr=0 ts=6a02eb0a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=7zm3FxsWSslHyZ29AF8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 4B3sS-5g9OMWHysmboqQc2l_xWkSi5aR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120090
X-Rspamd-Queue-Id: 1A01751D392
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61224-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Modify iris_hfi_gen1_packet_session_set_property to simplify size
calculations and remove redundant code patterns.

Previously, packet->shdr.hdr.size was incremented by sizeof(u32) in
every switch case, resulting in repetitive and less maintainable
logic.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 50 +++++++++++-----------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 4cb54e5e4f1f15137d08027ac9a0d46c46784ea8..7674b47ad6c49adfaf16b444c8ec7295b230a529 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -485,7 +485,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 {
 	void *prop_data = &packet->data[1];
 
-	packet->shdr.hdr.size = sizeof(*packet);
+	packet->shdr.hdr.size = sizeof(*packet) + sizeof(ptype);
 	packet->shdr.hdr.pkt_type = HFI_CMD_SESSION_SET_PROPERTY;
 	packet->shdr.session_id = inst->session_id;
 	packet->num_properties = 1;
@@ -498,14 +498,14 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		fsize->buffer_type = in->buffer_type;
 		fsize->height = in->height;
 		fsize->width = in->width;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*fsize);
+		packet->shdr.hdr.size += sizeof(*fsize);
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE: {
 		struct hfi_videocores_usage_type *in = pdata, *cu = prop_data;
 
 		cu->video_core_enable_mask = in->video_core_enable_mask;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*cu);
+		packet->shdr.hdr.size += sizeof(*cu);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SELECT: {
@@ -514,7 +514,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 
 		hfi->buffer_type = in->buffer_type;
 		hfi->format = in->format;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*hfi);
+		packet->shdr.hdr.size += sizeof(*hfi);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO: {
@@ -533,7 +533,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 			info->plane_format[1].buffer_alignment = 256;
 		}
 
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*info);
+		packet->shdr.hdr.size += sizeof(*info);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_BUFFER_COUNT_ACTUAL: {
@@ -543,7 +543,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		count->type = in->type;
 		count->count_actual = in->count_actual;
 		count->count_min_host = in->count_min_host;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*count);
+		packet->shdr.hdr.size += sizeof(*count);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_VDEC_MULTI_STREAM: {
@@ -552,7 +552,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 
 		multi->buffer_type = in->buffer_type;
 		multi->enable = in->enable;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*multi);
+		packet->shdr.hdr.size += sizeof(*multi);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_BUFFER_SIZE_ACTUAL: {
@@ -560,7 +560,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 
 		sz->size = in->size;
 		sz->type = in->type;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*sz);
+		packet->shdr.hdr.size += sizeof(*sz);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_WORK_ROUTE: {
@@ -568,7 +568,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		u32 *in = pdata;
 
 		wr->video_work_route = *in;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*wr);
+		packet->shdr.hdr.size += sizeof(*wr);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_WORK_MODE: {
@@ -576,7 +576,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		u32 *in = pdata;
 
 		wm->video_work_mode = *in;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*wm);
+		packet->shdr.hdr.size += sizeof(*wm);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT: {
@@ -592,7 +592,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 			/* Level not supported, falling back to 1 */
 			pl->level = 1;
 
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*pl);
+		packet->shdr.hdr.size += sizeof(*pl);
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER: {
@@ -600,7 +600,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		u32 *in = pdata;
 
 		en->enable = *in;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*en);
+		packet->shdr.hdr.size += sizeof(*en);
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE: {
@@ -608,7 +608,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 
 		brate->bitrate = in->bitrate;
 		brate->layer_id = in->layer_id;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*brate);
+		packet->shdr.hdr.size += sizeof(*brate);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_VENC_RATE_CONTROL: {
@@ -627,7 +627,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		}
 
 		packet->data[1] = *in;
-		packet->shdr.hdr.size += sizeof(u32) * 2;
+		packet->shdr.hdr.size += sizeof(u32);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_VENC_H264_ENTROPY_CONTROL: {
@@ -637,7 +637,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		entropy->entropy_mode = *in;
 		if (entropy->entropy_mode == HFI_H264_ENTROPY_CABAC)
 			entropy->cabac_model = HFI_H264_CABAC_MODEL_0;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*entropy);
+		packet->shdr.hdr.size += sizeof(*entropy);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2: {
@@ -662,7 +662,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 			((max_qp & 0xFF) << 16);
 		range->min_qp.enable = 7;
 		range->max_qp.enable = 7;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*range);
+		packet->shdr.hdr.size += sizeof(*range);
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_FRAME_RATE: {
@@ -671,7 +671,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 
 		frate->buffer_type = in->buffer_type;
 		frate->framerate = in->framerate;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*frate);
+		packet->shdr.hdr.size += sizeof(*frate);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_INFO: {
@@ -683,7 +683,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		plane_actual_info->plane_format[0] = in->plane_format[0];
 		if (in->num_planes > 1)
 			plane_actual_info->plane_format[1] = in->plane_format[1];
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*plane_actual_info);
+		packet->shdr.hdr.size += sizeof(*plane_actual_info);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH: {
@@ -691,7 +691,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 
 		intra_refresh->mode = in->mode;
 		intra_refresh->mbs = in->mbs;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_refresh);
+		packet->shdr.hdr.size += sizeof(*intra_refresh);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_VENC_LTRMODE: {
@@ -700,7 +700,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		ltr_mode->mode = in->mode;
 		ltr_mode->count = in->count;
 		ltr_mode->trust_mode = in->trust_mode;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_mode);
+		packet->shdr.hdr.size += sizeof(*ltr_mode);
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_VENC_USELTRFRAME: {
@@ -709,14 +709,14 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		ltr_use->frames = in->frames;
 		ltr_use->ref_ltr = in->ref_ltr;
 		ltr_use->use_constrnt = in->use_constrnt;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_use);
+		packet->shdr.hdr.size += sizeof(*ltr_use);
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME: {
 		struct hfi_ltr_mark *in = pdata, *ltr_mark = prop_data;
 
 		ltr_mark->mark_frame = in->mark_frame;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_mark);
+		packet->shdr.hdr.size += sizeof(*ltr_mark);
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD: {
@@ -724,21 +724,21 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 
 		intra_period->pframes = in->pframes;
 		intra_period->bframes = in->bframes;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_period);
+		packet->shdr.hdr.size += sizeof(*intra_period);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER: {
 		u32 *in = pdata;
 
 		packet->data[1] = *in;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(u32);
+		packet->shdr.hdr.size += sizeof(u32);
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_VENC_HIER_P_ENH_LAYER: {
 		u32 *in = pdata;
 
 		packet->data[1] = *in;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(u32);
+		packet->shdr.hdr.size += sizeof(u32);
 		break;
 	}
 	default:

-- 
2.43.0


