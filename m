Return-Path: <linux-media+bounces-57475-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHOBHXJzyGkNmQUAu9opvQ
	(envelope-from <linux-media+bounces-57475-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 01:33:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E193504FD
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 01:33:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 89602301E7D3
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 00:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB32F1C8604;
	Sun, 29 Mar 2026 00:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="emX9csn1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WNAcVLEn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A6F10F2
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 00:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774744413; cv=none; b=t6bbchGFARMvQfjB+jReXIxH/Ga7ydfEAbgtjrJpJoUG9ciLnu++IzR+Mojfxq1ocn8ymABW/gHskFsgeniOJNJXi4G5n004Wl0ZuNBwL8bnnpGvGy0y3qh4FghSzCUWs2zPuzJFT5HnPncvxxSWiN/HOeDnTSGRB66yj3DFwyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774744413; c=relaxed/simple;
	bh=xFJdeT3yOlq/oRgFq0BzLBs7EsRlJjjKB4aOCgE5Kn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d5s2T/ioXGDlWSKGeDa0BFcMmnJtkprn0C4AWoBNkpGEfK0rtjxoo7PuPgPRA34FYizRbNJgbwPOenVKqQPdmXfg+GaMVvO4bPGEwyMyqAo4GEoGwkJ9HaTi5Ur6Og51HuYkckHgNAuzk2fD1fQOuAqu7e2jpIlcViOhUv3uG/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=emX9csn1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WNAcVLEn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62SLTa52034728
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 00:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kiX3oiS3V2FER92MkVmW6VCS+AmFEidamWAh+fCmPtk=; b=emX9csn15O9f3oDC
	E/xucefxBmwrHfMUpWP7uV+IN1TMfDK34NDnWXRzYS6EH6Z6FnKvRggqdUHdZ34V
	Y5HOjkvpSw5AKTbUsu/YOuOg8lHlJTMx/V5HN/joiagmhzYegjQh5qJMLBodvh6I
	8pCN3hLRgO+Ow3bg8He+50qCAk51SBzWT604CkVpanaB5cnVfvOnheX9ygInVAW6
	bP/zTHtQAT9Fmy1EtxRYV3wLA3zSt7fgSi7ou/8DfVW16TkGDnT8M/ChoTxne7cL
	P2CueVbMTgkxJ2Hem70dszLlJ3PhHPC2INHtbr9S/sgywM/aA1czSrPO26DKUwVi
	L3X1hQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d672u9t0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 00:33:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b317c40acso38675571cf.1
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 17:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774744410; x=1775349210; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kiX3oiS3V2FER92MkVmW6VCS+AmFEidamWAh+fCmPtk=;
        b=WNAcVLEnTzbX/DnH1842K89ffeh9QqzDH48Q4DIBu4KhXdlcBXYlTGAEapdJGiQrVG
         q1ObC8Z4B/sw9hObq8HkokqextkIOrepk8Fv01AKreff5yCQvfvUmf38N6Q8bbnbI5UL
         rb7Sa7oDV5heqL7+X5aDHOjE6sVAxrs8UqrWRC1iRJTMhhBGABajG79Fxm6j5OFUem2q
         DJmx973cgIBWpn+fdUOg4nxzwMLVEd7nCsxAuhohF3Mp1pAKeR7pe+oJpjCQvAYTloam
         Pz/cwBxP4nih+VjObsWL5aS6cLB7JHDp7IsbQv9WI9Gy9AtErMOtREyHfNz1lTdB5TWe
         p8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774744410; x=1775349210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kiX3oiS3V2FER92MkVmW6VCS+AmFEidamWAh+fCmPtk=;
        b=LWmnAZq3H+MOfQ9F2z8c9Ewn/7krPFff6lGDRVWqrrWd2kkrp62ewqtUHL4yaH/DZ6
         mQ1XDzX46jQsv+wqmCXUtIU2MhqZXjF+Q/zu7D9wRgdU/k+guMIzQRS3W/IkoZTPeC7G
         HqqtVUftXXsT27X/GdVs2fBUN5jPge/FqdbmCJPdUg6sfVWuijRfgXE1xLPzWNnt4PKj
         zbhiNKojFg5VAjBIEiQcGl0WF488gGmvlsPC4GSCyzzg+1m0F5BZfDd0IJoIm/JIgC6C
         OK+krrrJy6U+FLIi+3DShtbpOU7uMXrQ/zEP0BJfKvxHr5ZR47EWqUj0+3sFP26sch9o
         rfww==
X-Gm-Message-State: AOJu0YzEYB1LDR9uwkFYUUjH+8hQwtA5CkUAjyI4PWhpH3uc5VUQetcb
	hfPrE+VxvjKy3vqNuZVs9z9G+IM7v+bX/8r6Wxps3HvFqtb/qexyFuQOsCFzo8SXNdIftZgz06b
	cIEI3KGO/5k12+8XOOA5BxojaUaVk+MbZD1ifdW9Hg4LOtuMIE8OzZD/LpmjmdsNCqw==
X-Gm-Gg: ATEYQzwOfBbbhB4HMSYvK3NfMIgJT1k2TuUkk2RVEqxpWEiWq6Stg/E/AogR0iHePr+
	K2mcIDOOvoyrv02FoPxfb6OjqRNmWaWe/+JPLowqXTYt2Y2hgWfxYEsaECS/na1U5suxFy3F+97
	UCPp/Lp165vuhletAD7nnGXP6oeHt6vVSPnmo0FyhQ2ttdZWpePmzUyYBukCLt2eqxB38ZxODgd
	ALNoS5Y96j7PViHwzKJSO39M2tY7JZ0eIa8Alt1WHTevfUBODiyYcfdoE7STyefQT9G2c2SYInM
	yeaE5muIRILqEh4djaTJ6NbRkvAIb2mHCeLiTWaJbPTZFe8julZaqdyXKfuGoXO84BUCRdHT04h
	R8hVI8XqAqhrps8aCu5T+nRUJFDImcUm3+y10Sr6VOQhihH19ayNW4ptIPZpxhJWcetdEDgGs72
	F0B5kkLyUUE0MV6/JO/lGzeqwMnzJ5K/LAmXY=
X-Received: by 2002:a05:622a:118a:b0:50b:4226:9240 with SMTP id d75a77b69052e-50ba38bc18cmr105035781cf.41.1774744410309;
        Sat, 28 Mar 2026 17:33:30 -0700 (PDT)
X-Received: by 2002:a05:622a:118a:b0:50b:4226:9240 with SMTP id d75a77b69052e-50ba38bc18cmr105035581cf.41.1774744409805;
        Sat, 28 Mar 2026 17:33:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83892035sm7024731fa.22.2026.03.28.17.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 17:33:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 29 Mar 2026 02:33:04 +0200
Subject: [PATCH v11 03/11] media: qcom: iris: don't use function
 indirection in gen2-specific code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-iris-platform-data-v11-3-eea672b03a95@oss.qualcomm.com>
References: <20260329-iris-platform-data-v11-0-eea672b03a95@oss.qualcomm.com>
In-Reply-To: <20260329-iris-platform-data-v11-0-eea672b03a95@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpyHNInGI/3Yc1tRS837i1viN2+9lYRCUWtaBP9
 Q5R4IozO9GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCachzSAAKCRCLPIo+Aiko
 1TCSB/9GxZF7wdcTgjKxVAYo7SH4+lFuAUjpuzE1XfFe8eb00/oXcvUr9YVpKk6vKC2rmr5O/fL
 UUlSQ0KJEKlRSrExwgyxgqkDdEEEL59ehIio6nrTbleinfW5YPEOWfl3gzey7SbxwXnDSABXWUC
 jEwgqNx/Z8XIYgpUes59NRJPS2CSRWu8kDIKmScvCPaBU1TVAKO4W2jQQmCHAUeKMDbTLcdtQ3Z
 Ywh5P1op48z7TZlETXXYLx6WOsspc67MCPN2iXh+j4YZJxYbDfcoQ9imOaeYCtILglZ9VWq/rt5
 sVFxi5MzG+TceXcEOYLwAuYhT8ATh0yclLeRSuZF/kA5+N98
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: -05PboEGQF-VHeklxVx0u5dNPLdvagzI
X-Proofpoint-ORIG-GUID: -05PboEGQF-VHeklxVx0u5dNPLdvagzI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDAwMiBTYWx0ZWRfX8wOrOO655UoO
 X/4CLx34F6404Mr1wEsW4rtpqFTI+VJZh9YG+nrW5aLP8mVZPc7/UQ2bXu6uMa5WsvSE5N6oDkQ
 2t5IVsGPX1M3W//fn7ex3opbz+Rbrc3ikLd2UGTx8seUv13N7ycr6uXhHJod1f59nN1eWtCfrhZ
 ZbmMfP1D97GiRDwS6ba0rQHPnf7Z1tpUgj+5mEk3+6xyufZSVmH3CiLECwJXnyNG8dqt90LTDQy
 R2kWmN7h8WtAov7xFOB61u+uehNUFFqk8cYeWket0fS7EWACM1Xqv0H8alp7w9NX+RWDLQuaRyl
 B+1JMF6x9T2fAlP5m6KItlAFwniy8QfwOBvGvUK1D/PzfqdvZ/aJCsbKdScKf3VRwmDcT7RJwv1
 1sedYqJ3QbRFRLiumwuxgr+7t0aD6t3UzsBks3L4Ql+nPHfD2zVB72ykOXfgm+sSWRVMMljIZiS
 YmuNgBhiATE0cvbVexg==
X-Authority-Analysis: v=2.4 cv=Ae683nXG c=1 sm=1 tr=0 ts=69c8735a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=yEfzmaBkz_6XQGMMuZMA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-28_03,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290002
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57475-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 10E193504FD
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


