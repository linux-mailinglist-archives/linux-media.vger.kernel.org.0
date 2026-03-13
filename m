Return-Path: <linux-media+bounces-55562-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FviFDyFs2msXQAAu9opvQ
	(envelope-from <linux-media+bounces-55562-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 04:32:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A954627D22F
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 04:32:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D275D317A3BA
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 03:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A5E434C81E;
	Fri, 13 Mar 2026 03:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DWO+UtPg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MXOW47Dz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3E9342538
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 03:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773372638; cv=none; b=QoUG4W5FUI/GckWwiC27EN/CLfsmSpQXQ6agBsf5U6RRfecxsVvzeL9gry6aEwGMgjUAcKsvQSPB7iqpzRO5GRA88szGYKSit11rODLNiKq6FeYadmqQkN/rojgspI2WdJqP/bqWLiabEzqM18ApVTqvigpO4N8bPk290UGrBIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773372638; c=relaxed/simple;
	bh=x2YTsex1Fv+Dc4RVscR+kAhkDi5JIRV/gMadA9jhh1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ou3Lek3LMGcgVsG+Vy1dVtLFrLX2CQxAjhfhmA/NqRNwEH+shbD3n21R7PKV/pasAzIMZ5aJj7dQCAT73JkTjmU/Be8rdyRCG/1tO0xtsg5/kmBVYNALsjhD1siWUOpmu7VZuuDLSyprGDQuHlDWDcE05Hr5EgyZ0w8X/PW7sE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DWO+UtPg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXOW47Dz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CInoQP4027638
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 03:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gl1IWKRec7l4UUGWy7jC01iWiWXGTiFco1mvc7rwi8w=; b=DWO+UtPgB7aptxi7
	IpWiRFy46Yyu5dlnvr2iOJMHgoM9/JBoHvgrDNNRiytAUxGgHOwLa4LDtxuvpJ65
	nAMzAKvGaLul3l3Tv0Ej1veqNjHLYC8a/icnTIdvP33kF0yDwnKSSNWogQPmeB44
	or1oSiyoh2SyeFy/UNCDC+SBX3XLo17GHNUCT3U6E5Z5+iQ1x0wqd5ne41/LowpE
	8M0Gb5hwBjpJKrXD/m9cb+wXUXwTqlAbzwHkgAiVdXgz9i/WmKbm4jdfN3W7NnPD
	j0vusQQW5Y2CU+vI9pbDzcGAMZ/KFTZLeizSjZMByDZu6iQi/8bpoR2MWr7/sCn7
	9JVltw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh54v98v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 03:30:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd767c51efso223597485a.2
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 20:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773372636; x=1773977436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gl1IWKRec7l4UUGWy7jC01iWiWXGTiFco1mvc7rwi8w=;
        b=MXOW47DzHB0vzx7zjdcxJUBRi6V4WK2sEiRLeGjI/0Qn2YND17+4WBggyl8c8nd8js
         4XXE8GOsFk246jYHk3XLxLs1ZscqVE7rYvnXsb+3zuuB8N4WtmKCY+nMctlMFHl+ZeAd
         5vWP2IACMi99FGbGqaP522YT/VOOXysnqeAv+yEjZogqazwGK8vPOkwdv3rXTDPoiLd9
         AiZCOeACDndAlEuDTGfIbO5LfTOY4KghuD6nXUrgW6mWt5XxUUsJoOOpDGjw8O5l6kah
         fqJ4ORQz7XjNEqqc3nW6yCxqPD+RxOfiAesV8UtGV46nXU1zjdve0Me6sHoy6DYIV/KQ
         qnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773372636; x=1773977436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gl1IWKRec7l4UUGWy7jC01iWiWXGTiFco1mvc7rwi8w=;
        b=jg8X0rX8Go6RatCapu4w30eQOugKZZbB5OfHdEpFGTJPKoNodti4/zh/QZ7d7CkHv8
         Suaqu0Pp2WfbM7LYMzntE5aS9XGRR3aR13H3L+JHTgsUTrIm5YG+6wgLOS/D8Adq3sdO
         b9jn7x3AfcPVI9X2Ns6Yn0L7puTjFsnG0I/8yi5G4HZxe82n27ylwpA8cQg7G7S5FRMs
         UjtTdeFDtF0mZd2EgXWgz39EoBcn6LCZQIndZCBbWS8cOVvc7wdF8Ic1EnTN3zBhKT1e
         5soGsl8kLBBGPhjN23Lph2SAB+5eCJR9pWei2PabkfIlRi5g0aB1Cu+Z1h33WG+mqiKE
         tCwQ==
X-Gm-Message-State: AOJu0YwO75bE64BQy/iiyjHlSUOe5nhJOkZG+QDSs3pbA/2EwBfysYB/
	VaCwxM2c3KctVve0dhFsrYu2m75Zp+xQ/eYHQf+rtrrYLjQLt4Pn8VQrvSVch1gIcfdQ9asxo0X
	d8JWRKTb2S7JYQ6qbmzR06y4Txvuob7zzvZV3/QCzRMw+NqeVsCHN412m55sBRqsbCA==
X-Gm-Gg: ATEYQzzLTasVKLMP7a6KTk0+IXbkqOKNqUtih1Bmqgqx5uB92dHqPKv2FKzGwacaZxt
	FFXPgyADOHQMklqmn1GIfsta2sZ1iugsfWKj4hknJGR0/dh2VsT5PaZDMwIBuFaIsrQgynKkxL4
	7oQNwBEZnIHqpkvy7qEucXUPl1gURHIRjFVDLkbUiIsEcR1zFvW1E9vPyW3HG0epYEVDufTnaV1
	yBgeyBBHsKtQBMUe9VovsTkVMYasgdZ1tIjDxtZ08L/+MoeIU94JgLLhCFApP/y6ybfSyo+1zS3
	wFvLl/OOf3LFhpfTqeOnDB/mvSl1qTWgWIq4qLm0iEIVUShVlkaURmSeLXtMlKSBBPa17MsNg5L
	AIPiYDzwJsO+HNAVPgVuOwZ8pF7nigdz9pH7pmG0/+/wx2gmeucn0bxl+MQlqtPlheOxK+efeN0
	ddAuA7B9W8O/cXL1r7RMFKc8qp5zLutJ4eFIs=
X-Received: by 2002:a05:620a:4589:b0:8c6:a70e:4c79 with SMTP id af79cd13be357-8cdb5ba8083mr290617185a.80.1773372636030;
        Thu, 12 Mar 2026 20:30:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4589:b0:8c6:a70e:4c79 with SMTP id af79cd13be357-8cdb5ba8083mr290614985a.80.1773372635539;
        Thu, 12 Mar 2026 20:30:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d93576sm11254901fa.11.2026.03.12.20.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 20:30:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 05:30:20 +0200
Subject: [PATCH v4 3/8] media: qcom: iris: don't use function indirection
 in gen2-specific code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-iris-platform-data-v4-3-14927df4906d@oss.qualcomm.com>
References: <20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com>
In-Reply-To: <20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2169;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=x2YTsex1Fv+Dc4RVscR+kAhkDi5JIRV/gMadA9jhh1I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBps4TMTRzfcsEsZy5IeJo7L2BBe8xgRKPhVMs+J
 55uXhHYT8yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabOEzAAKCRCLPIo+Aiko
 1UPwCACmHuSMTDuKpdb9PpcYhT/QUHJze0v8N06kQoJZrjCXj3hjzWJu6PI1qqKSJRc3XswclS6
 41y2pW+6ZZGtnOeunap5Wo6+6W/uqLo4Y0Eua+Eb/fQezFv0TAIbYX9jfZ40owTE3rmrne5e0+7
 7p1OMYkQFTGsjXj7TwNaIpWIbHC/mHzTQMCfiXsA4GOYnWwpW5ELPgOTwqd+bJrUjeGf9D+bT/S
 6tsLD2GTMdzfLRvFCCc9xOd8Uj51ELiVrULuEp0p8jhHyzy5pNrvO8S5B3YuiLQzhUEGJSq4+ui
 0ydO0mX9H2dqWqBh7iqnhYq13k7NDRYKK7HCf/9UUNPu39B+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: LDGWevO83d2g2OHRDlhMLSyTRNnceFL9
X-Authority-Analysis: v=2.4 cv=BNG+bVQG c=1 sm=1 tr=0 ts=69b384dc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=yEfzmaBkz_6XQGMMuZMA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: LDGWevO83d2g2OHRDlhMLSyTRNnceFL9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDAyNiBTYWx0ZWRfX8cFA7dByrxdk
 21TEk+U3j3NkfM2BqpVE7ez0UmbpWO4yli7PA0VNUl5aOU6HLK2GCyKRs+d5gjSUV8kJ/2yVi9+
 6riT/kU/lNIfVe/95Oolq4ylV6YPfQwSe4mYvX7VnBPV6BPGHVC9e7H7ogkuuQH52RILLXn5KeF
 SEWKJ80M/4VrtMkC20DkaeT2LzjXAY4waJt6s049Y4rYr5YNAFaNn4IGMuw1Jj7qhfYkeQjoJBM
 j2pM6/yPIZjXFcEtTYN0MWy1XIUqWQ6Fsqhj2oHCWoklt+Bzni6nDeTY58T3CEZoOqJ1h1ZYI4h
 tVsJ5BAXwF2iPCPvvj6FTQOL2fvI92DUwSBXkg/mJeDptOdiddb6AL3D8CpJgt4J3xdiH7tMQnh
 X+VWNKNEyVlxuwa6Mna3jj2udzMclCNiRWbHutHZaVvhBCBfsF0ZWNjaJ13CnrdtgFsEjkwIO0O
 ukn9OxzAPRU0X4O59pQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130026
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55562-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A954627D22F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

To note that iris_set_num_comv() is gen2-internal, rename it to
iris_hfi_gen2_set_num_comv() and then stop using hfi_ops indirection to
set session property (like other functions in this file do).

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


