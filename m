Return-Path: <linux-media+bounces-57392-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHHMOsUTx2lUSgUAu9opvQ
	(envelope-from <linux-media+bounces-57392-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 00:33:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BB834C523
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 00:33:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D9CB3068251
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 23:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D65B2D8795;
	Fri, 27 Mar 2026 23:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n4bSSAJN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dq5rYIRT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6064839281D
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 23:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774654135; cv=none; b=FKHH4CXodc4cZsKYjBt8mFGtrqFsSMAr0d9l1Y56G64odxsrKkK/kmUsnfz05Ayp131+hzNDzCKqPGQc4B7DBzEVS19yeWHuQCCaJKSceK26BMaDopb0idMQvMNbZ80J3quYI1yEFU+VyVgz59xum/EfnKXFcoilmKZS/SaNrIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774654135; c=relaxed/simple;
	bh=xFJdeT3yOlq/oRgFq0BzLBs7EsRlJjjKB4aOCgE5Kn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nwsCJYi5nMrrNUybOwx8y/97YmxNwHGw2vriauwXno/vFO9se9/v7L7M+E33tgXT8neYIOicj9WNzUBjrWme19iZD4ahfV3klIgR4lzw2atETdTJWBt/Aad90xbkEFjNo4+ZzXBV0epWp+L3PblJPBuFClB3e8SSYibFChs5XyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n4bSSAJN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dq5rYIRT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RN44e91525896
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 23:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kiX3oiS3V2FER92MkVmW6VCS+AmFEidamWAh+fCmPtk=; b=n4bSSAJNDFooxQxG
	+S0V3GGikP+dmUmxUYSI5db2ehNnRbVwfDpnPUV1dbsH9MmzxD7tecujL9YVjsn+
	qrFrh9jRkrX8g5EqExB+0vLVDJYvkQMDqF2jbIqsOBrZkHVuw/qUnbDVKF65UtRE
	d2Rzrzz1QOLr3NzAETJPKrnThqlqz1Ag56c5SWAG8SnBFr36ahUYkldLPE93H+/9
	irv9NFuYs601q69i4XcEJdDg6LogArRtaGyClP3Uv0vTSMmhu4ZhpGzDu8zEr0Hx
	xEevQwgF6Rwg1sQtnvKxh6o+2UsAr1iZ9gk4EYIuBFa6matTnI4PIeDBOBhAotBj
	RSCbXA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5vf6savr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 23:28:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093a985e21so23053151cf.3
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 16:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774654133; x=1775258933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kiX3oiS3V2FER92MkVmW6VCS+AmFEidamWAh+fCmPtk=;
        b=dq5rYIRTttVAFdD0mDlWNYynEbY9ub61gSbR8c6lNaBqj1ge+fIhzijmxkmgTuTe6N
         yp2sNTotDPDp03Od3G0kEGgqRajLX7d7iBeDdteOQU/KenICiH7deX0HdPIefuqlqT63
         3p/ODgKGMpwBGa+NH6wHS2+8YPEJ+apJI3HeFJV4QECeHf6Pf7TYdyJrRR10YULfxETI
         X/zDtEaNteqZEHw3VKJv0KaWt+k3Nv/nSwBRvv/AtmALduO/Dhv0gMFbxinaYHzF/eUK
         Qp5BUXqzc+Byw39t2OWqLwaThfJhufNL4Um79JOrvQiW+GoWo4Frak63xHlzx/DwmCj4
         EeRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774654133; x=1775258933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kiX3oiS3V2FER92MkVmW6VCS+AmFEidamWAh+fCmPtk=;
        b=ifF3Kyu54PYmsIfSELVr6fs7Sq0gO2zTV8c6mbWo5e1oGAeok+hyu5HHpORolqLLeg
         ns61cbH89BoGxMJJe90qiIBwvaOi8O49moGqoLKN0qs/pJs8+3Iucaq6ne0gdSmu6K7u
         B3AND65hRFn9Xz61VGoj4PSjx9SbASWk9sufonwWRSWlGZncLbMHU0ZGoyMyKFjhMFMl
         wzBlgVfL3dnLRiGJb4bVmq79qO+3T8hi2Mx0TliASnH1B72UVMy3cH40QoP4VGl6ztQR
         OCta/h+Aegt9yI+5K6Zq6DwNPkMnB+efjVK1rzGXbyaaXpVnlKRKkc9K5WbmOnoIIP/x
         AQ4A==
X-Gm-Message-State: AOJu0YyKDVMHrA85xE6rZnKzhrTTOOp3Qiwo78hAZp2YsEVWFMatZIEG
	Pdp080IoU9szsFlXvzfswGnZDSL5fCRqcKcEt6Clo+XsF9xBzpt4fBvNbnifCjqZ8fIq2PzhkAZ
	Ag1OKm3jtxGfofZuBUfwS2hhPhdGnGj/P+bOB1WZ/SeRR9h1vx5dCUnzh/zq9WtzElg==
X-Gm-Gg: ATEYQzz08pDMGBloN+3aszNRG2iotiuQH/vR21ZsNglJjXwTIwjeqlc0rBF9ba4pZiu
	ii+/Tc1oTMPjlhvoskNiGBQlocSWeJeyXFqFu6INtocTn9JPLm/q1cTilb2mj0CE/GmvBtPY1Pq
	iEjGCg5NEy+IjxeE9peLtGTS0NxkSY9zm3zq6gEuN+5jeB7P/eQD/XT4+FcmR1b1Y8V3CkfWBev
	byYQ8pgK9ihMN5OD5Twv/zth2LQbkyI0UIttS77K85MCeFeUsp2l50bfyhndNc9pW9y2E2NtRam
	0d46/tNC4uvEOKx+EPC8siauhFMr7/N1LPWvKOtgV1Eof1H6/36rNtPiG8947VUR/d4FU97b6wh
	4WG6IWGIcDmVM+4D/tNoFuIGGqO8r6qman9g5PRPM9+akSUiNjG+tc4yGUjOmd1qHN8Kcghu2kD
	ZB6bXJ/tGZYsDnmnqfIZeDJyOPiBdrL/jKdn4=
X-Received: by 2002:ac8:5f06:0:b0:50b:3c7e:a33c with SMTP id d75a77b69052e-50ba391a1a7mr64638701cf.38.1774654132751;
        Fri, 27 Mar 2026 16:28:52 -0700 (PDT)
X-Received: by 2002:ac8:5f06:0:b0:50b:3c7e:a33c with SMTP id d75a77b69052e-50ba391a1a7mr64638531cf.38.1774654132326;
        Fri, 27 Mar 2026 16:28:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83729522sm1177991fa.14.2026.03.27.16.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 16:28:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Mar 2026 01:28:38 +0200
Subject: [PATCH v10 03/11] media: qcom: iris: don't use function
 indirection in gen2-specific code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260328-iris-platform-data-v10-3-46b92bfe7b52@oss.qualcomm.com>
References: <20260328-iris-platform-data-v10-0-46b92bfe7b52@oss.qualcomm.com>
In-Reply-To: <20260328-iris-platform-data-v10-0-46b92bfe7b52@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2232;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xFJdeT3yOlq/oRgFq0BzLBs7EsRlJjjKB4aOCgE5Kn8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpxxKoJkbS0xXQbX5XbyM2uOG87ScKh1z/jaayf
 IBdI+KDyQCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaccSqAAKCRCLPIo+Aiko
 1bLwCACKdwmcSusnFmzpaRvfa8yzxiGYxL60Mwp7+0QTU3vmOFw9agKjOvgeNwmvSxQ/kUICvZx
 UzncWn+j/ATknLssZoCzBlFz86LR58cxtER18ZspERLvc6L+4p5+RJNqgZvY52iaY67zvwD6IDf
 Lrgpzd4x3epR7ejkXdYMUUs9UcOAGWSVrhWkBSNNFEh0WxOXrHlQod0qghkkiEYvF0iEcAFMcQ0
 bY89ZQxedYt7DLp4G5T/iC1uKV5q6bpETEGzaE7l1wVaJcqCo+S8bu41SmPyw4ZhlhVU4alvTsz
 F+MomIMySZ0riZoD/A7RB5TS2WBdwbLIxG8RpA/nUdeLPlJe
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=X/Zf6WTe c=1 sm=1 tr=0 ts=69c712b5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=yEfzmaBkz_6XQGMMuZMA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: WsLnNQb4_ydCRjjSSAlZe_zbW1oSti7F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE2NSBTYWx0ZWRfX6xQ18OtGXGiV
 Pqy2tts0gAI3nRIGajn67MIyKoFVMtqpZ1DUKADwCDh9qyxFylBbAEfwpAWDJzeDtpXPh7vYwwg
 CoRsOUmKz1CLWWV9UyKCvUsbyv7jW/thME+BLNLrH7DWBVARr/g7nD28SIxkUKMWMd7Atginj8w
 jENv8y5dRaf+LLulCGuk7liVTSnTeJpAK5R3kRxP65pXYQi+6i7XAle2Dhj87YjzlP8pw8NzdY7
 jxBs7TXZV0Fh4899sYNBISM/ZyVPUyFTK4CxsclQFijQ9tYbNIzflso5GoaHXFsyQsVLolcKiiJ
 cse3Atsl2pGvoA1fXk8WYNM8McyWY7Wjdvh81rcpW4wdKc4zanuydrJZgIxwB+2FrWxvRohcIwV
 Hq5MfSz5eOGgD/y8JTVgCxMlpXAY7FxQTLwwP6GVIc1w8vA8Ka8pfwr42UyS1veSlLHTTDrEiAq
 iIMKS+4i/QOH/dhMslQ==
X-Proofpoint-GUID: WsLnNQb4_ydCRjjSSAlZe_zbW1oSti7F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270165
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-57392-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 46BB834C523
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

To note that iris_set_num_comv() is gen2-internal, rename it to
iris_hfi_gen2_set_num_comv() and then stop using hfi_ops indirection to
set session property (like other functions in this file do).

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 30bfd90d423b..e4f25b7f5d04 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1205,7 +1205,7 @@ static u32 iris_hfi_gen2_buf_type_from_driver(u32 domain, enum iris_buffer_type
 	}
 }
 
-static int iris_set_num_comv(struct iris_inst *inst)
+static int iris_hfi_gen2_set_num_comv(struct iris_inst *inst)
 {
 	struct platform_inst_caps *caps;
 	struct iris_core *core = inst->core;
@@ -1220,12 +1220,12 @@ static int iris_set_num_comv(struct iris_inst *inst)
 	num_comv = (inst->codec == V4L2_PIX_FMT_AV1) ?
 				NUM_COMV_AV1 : caps->num_comv;
 
-	return core->hfi_ops->session_set_property(inst,
-						   HFI_PROP_COMV_BUFFER_COUNT,
-						   HFI_HOST_FLAGS_NONE,
-						   HFI_PORT_BITSTREAM,
-						   HFI_PAYLOAD_U32,
-						   &num_comv, sizeof(u32));
+	return iris_hfi_gen2_session_set_property(inst,
+						  HFI_PROP_COMV_BUFFER_COUNT,
+						  HFI_HOST_FLAGS_NONE,
+						  HFI_PORT_BITSTREAM,
+						  HFI_PAYLOAD_U32,
+						  &num_comv, sizeof(u32));
 }
 
 static void iris_hfi_gen2_get_buffer(u32 domain, struct iris_buffer *buffer,
@@ -1257,7 +1257,7 @@ static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iri
 
 	iris_hfi_gen2_get_buffer(inst->domain, buffer, &hfi_buffer);
 	if (buffer->type == BUF_COMV) {
-		ret = iris_set_num_comv(inst);
+		ret = iris_hfi_gen2_set_num_comv(inst);
 		if (ret)
 			return ret;
 	}

-- 
2.47.3


