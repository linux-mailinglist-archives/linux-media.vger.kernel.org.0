Return-Path: <linux-media+bounces-56445-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Hq6KTGpvGmk1wIAu9opvQ
	(envelope-from <linux-media+bounces-56445-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 02:56:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF202D4E66
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 02:56:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2CCB33019C89
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 01:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D3B32AABF;
	Fri, 20 Mar 2026 01:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XVYNpLTn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iguluBcj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E66325705
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 01:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773971709; cv=none; b=f4KTCn/L6EgOuvz7s2RMn+xpC5fbTUe7TINuntnuz/yqLL88MK3UDsbOgFrMathwB8ayu1XuyCODv1ihAXjVJaBZERE6DtKFw2/8Fe8sBYnmJJrBF5XHtK24fNQuwCflMjiIu4RH+08v2ZWQo7Tk+q9d7jejMFT4PUOpiiQuFXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773971709; c=relaxed/simple;
	bh=xFJdeT3yOlq/oRgFq0BzLBs7EsRlJjjKB4aOCgE5Kn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fYJ7Bqrylli6Y7P+n3oFZWQ/3eu2pzFasy64qM+vcHXEKzCcAeWbPxg8usghp27kPrDBJ8ycg66E4OaSAR6jR+ZZitNK8ADN7ZgzceGF5mJxsRFnR+OHa48uPRornsXWhxNUmPyLuPSTebGzZVv590bW3l9R2YsjK0MWR2jDT3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XVYNpLTn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iguluBcj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JMkAmV4144593
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 01:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kiX3oiS3V2FER92MkVmW6VCS+AmFEidamWAh+fCmPtk=; b=XVYNpLTnYn6mMFaS
	fqYBeshBqApe+jSKplY5FKKnlVD0g3m+L1wi1P/dats9tMZOQ4f4RJufHz2DNLCe
	7piv4OIx9wluUF/SOQW/U3fgz/DEoXcUVxOYfRPLxhkGeyngxY0YtIZenA/3CwtG
	c3GKPjaRUg2JwfheHEzq3Rj1oW/YjN4Hr7GganCd4pMtv9cfSK7SJcmW5+OUEp8C
	a87U6txMevzoeiYT7HGzGE/LyS/W4nItQq3B3yPQeRrZvpvAJ5AiSv0qcPOZqZoT
	Cb7La/iSU4iF7bXgJThKNryCOP6N6cgbRLf909HPYamLsxnxFV5vgmIt6dw/WQb1
	A8XqdA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0t7urc9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 01:55:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50937cf66b5so26302501cf.3
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 18:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773971701; x=1774576501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kiX3oiS3V2FER92MkVmW6VCS+AmFEidamWAh+fCmPtk=;
        b=iguluBcjTki8OVddvisg1dmdbfyRV9s5NE40vmuNIdmCdmSvcNckPTX//LiZKoVXQJ
         xjQQ1qgfdqeWAY5aC4L+2mDA9P551oodpe+iHLyODJIKOaKy0Wh9YXHfbgIuz2Ps4DZh
         0yQG9rNlWdmYzH0/OJ70wnGJssovpZOJSZXlTbOHH9wr3xqLO4LyA+Dx8UtwFGeVo++H
         CYFYhWftyziFqCK3jjjmDMkvl1SCIyWJbRpzrGmvQH038ERl9CbSkZS5SrWPlA5fTkce
         93wCbOJ0ExTCetsBtUdMda96UaStzVwzOFnbixkMiL2TetSHZwCBELjwNV49fJxw2UkH
         VDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773971701; x=1774576501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kiX3oiS3V2FER92MkVmW6VCS+AmFEidamWAh+fCmPtk=;
        b=p6Kns2nh8nk4gV7AlVUUwnLIbklxC/g+rnKniXyurnHacZGmVDkv3pp1lND3JTWW9/
         YK42FwfFBir6XuUnUYA5MQ3W3wrU2dB/Y1HjaSRljecFyJdcH1WeVe9gtuloA4DMDCdb
         CsPz1hLlKarL6dKaySqdrF8lyIb8dZnuopDP6u/rgQoqvlyWz2SmlqT79qN7W0NbAcmj
         AljnUQa5BKfUXTcNFqaXtLPnO8t6iSgf/64ND3GVITCZu/uRp4rz84HdBi19xYLRDI0s
         JYUDQPzgGnswlLLQJsC0uNq5RxU0f/ZhKvDI1uv9PXBxWOjEnyPp0cp1If7JaOKx5qPd
         9gQA==
X-Gm-Message-State: AOJu0YzHq1SRzEun9eNky5eq6LIXkPpSKSiEpQcsXaVOaXazz4nHcUlJ
	Ux3wEK/68J1KdDl+XDZAkmZTe7HDMnZ7yBs5QhSkWRHGsw6geL5Hbbjcl4JaBdeYsMHwnWqprcS
	nIgCFM6PzA4ku8RQUgx78A5IXI88vxQkqRWlCCCmnjXMieLqmRs37wvR+tTXtNyxc4w==
X-Gm-Gg: ATEYQzw/a4RJTb7Njl5n8TCq0yKpIRTLBfNsSJuz9ybIa9OgA96mEVqdhEujA7/YEdZ
	O4bZqIPaL7xnQQLxbGsBTkWZyn9zMvfI40cyW3p7E2xEzyEs4aaT1JiWKYIMPnrbbuhHUmy8BsU
	KPG4/L1h6uWc2fDanNP9LLT/vFudR+ZfnRg/broLi9yIseqzgTC9rlNAUgcgzl0zsGa7s72iY2q
	fjWQTIK2cgQ5NB9Knt7cRvyhs+QNuG/Oyj5A7lz05s6EOYzl6ZZWWsq2PL8dHoU8g8xGrtHciqg
	yhyVLuWcCvTnBKEiHx4YlXuwJUqp3HDG9Zb4LfDo2PAd3biI1mkg0kVZjmm3AgHaHWit/YUS2Xd
	nVMjUcOkdnPCtk22IXzFMudC/wATWyYsaBMfjZxZ7aMkLAxZEzYFiYrp4YAyY9w3u1ebVc3Y55y
	YnUAJZNy3I2DvUEfV5u42G+QvUkSgSpcej8MI=
X-Received: by 2002:a05:622a:5c95:b0:509:16a1:2033 with SMTP id d75a77b69052e-50b37426b4cmr23363971cf.26.1773971701566;
        Thu, 19 Mar 2026 18:55:01 -0700 (PDT)
X-Received: by 2002:a05:622a:5c95:b0:509:16a1:2033 with SMTP id d75a77b69052e-50b37426b4cmr23363871cf.26.1773971701109;
        Thu, 19 Mar 2026 18:55:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285305eefsm232344e87.70.2026.03.19.18.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:55:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 20 Mar 2026 03:54:43 +0200
Subject: [PATCH v9 03/11] media: qcom: iris: don't use function indirection
 in gen2-specific code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-iris-platform-data-v9-3-3939967f4752@oss.qualcomm.com>
References: <20260320-iris-platform-data-v9-0-3939967f4752@oss.qualcomm.com>
In-Reply-To: <20260320-iris-platform-data-v9-0-3939967f4752@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2232;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xFJdeT3yOlq/oRgFq0BzLBs7EsRlJjjKB4aOCgE5Kn8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpvKjlNpgE/23wOC2LDjN6Gx8/lKavoOhB8zklz
 f9ig8Lu4hqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabyo5QAKCRCLPIo+Aiko
 1TbVB/9YbXJ9TJ/L8sPPEoXp/+Ws3KAe1VZ/efKMi1iDZowDdLlJHkOQ4MiAVNBBtn/l7F90QGv
 JnV5asAySAz/hOXianXZSTmG986fOZumntU1eOkLsM8Og0ayNC7fllCJ+R2A+/iK0x6xbYuImL6
 09lpu0Si7GM5+jeRzUb1XhJPWRf/c4x/BfQcCyraVF26wlFT7ly/dZpXdIjYbeI1ean+JTtPH0r
 yGKUUYTl8jWQ96wzxCewRNWIiOUvTGWtXBm5ZG1uZTssd6fLr9IItU0qhNOaRlFkveCHNUgWwUX
 x3jm9L0K4r7PL11+EO2ZbEvnxqiVsG049vI86vEOQ9vctRvR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDAxMyBTYWx0ZWRfX9c0d21ANkTWo
 yO4Ep4WnJX7x8PZYJ1c3B2FNq0k8ViiAgbVa8BQaiPpBkeP1T9bvP+l2RqYPCoNFkmaZTzLiRov
 I9gwJ80q8gkK14xzOAAozrxz75XgPjybNFzPQroukIP4y0xq4aJPExScsb1BUYZjBwGFcUN0emt
 nEoN+o2dkbp09375/Gks9l9/GC1Y6obEnDN5QtDsOL1T0tpIXZw7iq1hrb5q1dUKHSP2f5nfibs
 0yZYUoBg5BP2VLGUaRetWPjno/HeDNUKwOKs1SiKv20rvmE5rf/lgr7wUWy/1vTvO9n2Nuy+PcJ
 VcB3aAIVw+uFF88GR/CKoOAFTx3mF00ZeHWKY4wvoGGMeSO36LwLJMEUYh8FEYDOfxGqVKOXaft
 oMsxrksPSCE73LsU3BF57B9eW1yo17/cxF+pKN5HvGoA1bRDSkuLMZxqvb5UMdFRIg7weSmFSL9
 +Jozu2B6cbSlKGnzwZA==
X-Proofpoint-ORIG-GUID: oh23O2LLXseYw9fqBYz6R0auAxk8JVz8
X-Proofpoint-GUID: oh23O2LLXseYw9fqBYz6R0auAxk8JVz8
X-Authority-Analysis: v=2.4 cv=c/OmgB9l c=1 sm=1 tr=0 ts=69bca8f6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=yEfzmaBkz_6XQGMMuZMA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603200013
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56445-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6EF202D4E66
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


