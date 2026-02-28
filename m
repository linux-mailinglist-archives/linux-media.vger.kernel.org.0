Return-Path: <linux-media+bounces-53844-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKqbNL8Jo2nY9AQAu9opvQ
	(envelope-from <linux-media+bounces-53844-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 16:29:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB051C3EF6
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 16:29:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C0C430EB6E0
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 15:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D1F47D947;
	Sat, 28 Feb 2026 15:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EDo742fm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NUFSq6Rp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86A947CC7D
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 15:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772292403; cv=none; b=rdCKqpyO+/LMTrL7knkjmIb3PhNO8322aQs3DXQx+JLJJDoY58bFcPaIpiG3soK/LY0zPpR+7NYSvefV2+O8n7Pummrl4X8Oi5dGURD41MVMHc3fYaWxtCnJcSC88pZD64Vl9WDaGVNAonlFtgBeiHbaOSaeO2p343KP1jCLJAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772292403; c=relaxed/simple;
	bh=1Kf6KXU4l/H3LFKNax4FrB33AhXXcXlylE0Nbe0Lz8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s6L88OiuLlE8r7D2XqHKyCaVSIeC9WlXW/Q2R03NtVg5pyRvtDwu28gmx7BkJzE7l9xrcYZsGvzvSj87oXfKz7TaCnntE7aQiaFVM93g13n5iExlaJHvm/DQZuLNNaZMFUY9Dc9g9Uujio7nqQJ7co/wO0QKh6/HqFm8MNbqNWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EDo742fm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NUFSq6Rp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SEP0w83333606
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 15:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LsBjgLUYF1aZBbJeQlRJX02GwU16qfWJ7mXVf2mm2d4=; b=EDo742fm1U4pjaFt
	14ATFu8PIkQth83hpJRJnNoJp/iGgkzoc05C3mq2CwYPczZv7wyX7K66ZbroCFc9
	AHTxsaAt8o1wBxTAyJR1mauvJC23cqIpXOgSqn4rp4SOmK9XOQo4/kEnZ8TJS95Q
	XffAAKGSLV6hceS71Z1EVPPrj/EjT1coMgQkgsIBMywIK11/l8A/+oZI2XaovRS1
	ADO8Eb4uWzL+kMj/KHdHG4afiDkgPqOsheHBJAgrUUZI4667+gjD3+YHHYw3fLCs
	9o8dJsmeP22e2sXqZb/YASMiMA2Ryw0IyafHsDPrujoIJ1juHIkz6cXDjb8BXmhg
	lh8XQA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshd161k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 15:26:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ca3ef536ddso3092336385a.0
        for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 07:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772292400; x=1772897200; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LsBjgLUYF1aZBbJeQlRJX02GwU16qfWJ7mXVf2mm2d4=;
        b=NUFSq6RpnC1tDsvmENtw1v8+IGkhcPwLns7a8QF6dydND9ZwajK78cszowOaNscxoI
         1XHZGGfdKeXTfh5IfoSNtLYdoI5iYbcApCMESzLMPvT6fzAqwAE/czUPDGctcW9d6EnV
         uJ0J/rBCfrpRsTSDJqxA6Rr1OBceRf9fshf/sizws3rOXYDfn0LUTEtVU3tM8uYgrFd5
         ys1MTsdYjl0ZmOUIMpmsBiWDLQ275cgS8VWzRJtW5OyV8jcn1Y5ZhvROAbQTqTeF6X0R
         bVx20qpT2Px0LXNEm4cQrpV8NlOb1J+moAuN+bJC5TgQdJh6j7SAYt7+bLp4wpOBZgZe
         lCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772292400; x=1772897200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LsBjgLUYF1aZBbJeQlRJX02GwU16qfWJ7mXVf2mm2d4=;
        b=bMzOaj9Llg5kol06oJTJiKNZ1bI3N5UtXfrPCemjjRB07JYN34smodOeDbwsubLC7s
         XQNQNwB9h5kEAl8MYuu3W558E8LNZhNN80gICrnbOiwV0zTCKM+W1hQlTUD+SVWHFp/k
         m5PH5VSKcz9JpVK76/XYPp6yGHW0rCLxbkS0ZLICRIurKSySCj492cx/5ZzZpJ35F0U4
         scpYAIW7K1QaeaWarhxbY6wdeZ2oQIzEGEFZcuxiRROfnVJs5nUkxpBLldNlQFnkLJyh
         lnztRzDJHEZb8wFh1N3+qBFoNoC3H1T6r4qGKc5xTsGCU6KeG7SuRJ/rl2otK6ZiHyD/
         g4Qg==
X-Gm-Message-State: AOJu0Yzg/PHVNKJKLercKzrRm5KfAQcJ4lkZCQwrycXc9cOKVAvXepv1
	Fie+Dz6OU2mH4diAy6bkfdf6of/uooOCAuAdzuaoGLDTPoiE4haM0Sg+g3k+T5UISdWtkB7qXFg
	I8LvuRQ/1jxPuzWZCX93UtunGMQ9OSLhSqBHQKSBlW2gk7D09wW403HsshorWZr4aAw==
X-Gm-Gg: ATEYQzz0sXxEwu9emo5g2dL452kwYy8O6O5RGiG2yYwvOwsOz7MgLb1YxbLqCNH0cXI
	oD2pNCzQmqCHg/mnac/tWH6KTjvsDIqEb/F5EIy9GLiiceFpCYe8Ot+Vv3+sBoQromHtDW7gYEP
	V4+I5bnTgUKJP+p9+NBXZriFUFhdu0tNy1n22A46mNglZtgKTx0gkgTJrLgG0y1XBtJSbqTn6I5
	b75q0pyv6BwsX5f/Z/uOiFTRi6PuHNBjWRM95mzbWa1CmVI8hdFjy5ofPZQtyNFE3kyuhNzzaDa
	iCFVUGuF+1ty0G6lxjV+mebPaVBrYuyoXZDEbFVL52/Z8UGVXXYVlkmzUCXxmkNUqSNTm9LhlG7
	Vk7G+97ko5fzdOBwRFOaJ4k4ojVSturKyFzxni5C3uDqqtlwUgu+BFQEq4wGMpkR6Jk13SgcV47
	JA/eoiYZsRAUphxDzY6ET/QsIiVmQL5YnM7cI=
X-Received: by 2002:a05:620a:1a23:b0:8cb:3d7a:c009 with SMTP id af79cd13be357-8cbc8e4f79dmr792112685a.78.1772292400155;
        Sat, 28 Feb 2026 07:26:40 -0800 (PST)
X-Received: by 2002:a05:620a:1a23:b0:8cb:3d7a:c009 with SMTP id af79cd13be357-8cbc8e4f79dmr792108885a.78.1772292399646;
        Sat, 28 Feb 2026 07:26:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115b57922sm625558e87.63.2026.02.28.07.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 07:26:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 17:26:33 +0200
Subject: [PATCH v2 06/11] media: qcom: iris: don't use function indirection
 in gen2-specific code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-iris-platform-data-v2-6-acf036a3c84c@oss.qualcomm.com>
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2041;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1Kf6KXU4l/H3LFKNax4FrB33AhXXcXlylE0Nbe0Lz8s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpowkn9Rkxhu8q1tIOJNFLc6Hb0OW4uCpE/0ULV
 4cb/6Ga1ZOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaMJJwAKCRCLPIo+Aiko
 1UkdB/91mSSpM5aORi+V4Fq5qbye4ha6nI5ILJpzuTF5H+jJdEx5P9ehg4pRPewJENn0DlSPOEX
 fI1tEIw+I/Yj9AtG+ax1ZLMT75i/MgicNQDHFMxiJRPbAWcOPZOIJDQh0neTv0XRqVLO6s+YhlD
 oFTOD3g32oDRBY6VNg08hRAmbA8mhejkstrttHG2I/pbcHkhLu5c2Zhwpy2QPDlLFmw9R2usRfG
 AKKX2yEjKi435+on2cIQYNe96Wbzh5pyesI6jYPP5L/Z0YldY1xoqvccONRzu7VAjJcsK80WiXG
 BRbPbaLjNE3sszuC9knCQklzBTVQTDPp8QcGp/INTDkj1pba
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDE0MiBTYWx0ZWRfX0gXnZFJAaJAX
 t2r3Fn9LimHjfW9SJLHb/txYfI8YzxKejwMRXxwylqtBzmSK5relteQ5VXo/C2janacIW1Puzx/
 2sHKqAd+WATL16Tn+HYhiwktWELs5yJLgJkEQ/E4m+z4oP+whXJnLY6gYBdZJTq9XLltDQnET9A
 hcY1tLp7ub3/G6q+LP95AhwNq7TPhtdqbulI6tApblcSXIPmDFFFgerY7rr/YcOdBMuwvWXou0i
 Nj8Ha8ppv4kQhs5xXYbhRzpLH0X5NveSyVWQXcSmMzgMMhwb3se0J2w/lARu5xdJgkz3rDv5nw7
 xI/Dn2PoJ+L5g1ZSeLiEbGP7kQh27q+IQMCPNh7ueqG/KC8fT8GyQw68yyz4ZAhpz3DyfQumRYB
 02Pzhop0tpTZ/Cnm0g68ODYqOCwlKR6ojcpA7oeA0CTAoz4Ou9PmaE6DZ8KtA55b4KaE0rWkXdT
 yTdVfAUNMog68TAYXPQ==
X-Proofpoint-ORIG-GUID: qScyzeXJjQ9PQjhOhFLFoU_B4lypXAVY
X-Proofpoint-GUID: qScyzeXJjQ9PQjhOhFLFoU_B4lypXAVY
X-Authority-Analysis: v=2.4 cv=COYnnBrD c=1 sm=1 tr=0 ts=69a30931 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=M7otsm39oOdpNaC3G74A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_05,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280142
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53844-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4DB051C3EF6
X-Rspamd-Action: no action

To note that iris_set_num_comv() is gen2-internal, rename it to
iris_hfi_gen2_set_num_comv() and then stop using hfi_ops indirection to
set session property (like other functions in this file do).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index fd8a055c4acc..93ce7ac3a19c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1295,7 +1295,7 @@ static u32 iris_hfi_gen2_buf_type_from_driver(u32 domain, enum iris_buffer_type
 	}
 }
 
-static int iris_set_num_comv(struct iris_inst *inst)
+static int iris_hfi_gen2_set_num_comv(struct iris_inst *inst)
 {
 	struct platform_inst_caps *caps;
 	struct iris_core *core = inst->core;
@@ -1310,12 +1310,12 @@ static int iris_set_num_comv(struct iris_inst *inst)
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
@@ -1347,7 +1347,7 @@ static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iri
 
 	iris_hfi_gen2_get_buffer(inst->domain, buffer, &hfi_buffer);
 	if (buffer->type == BUF_COMV) {
-		ret = iris_set_num_comv(inst);
+		ret = iris_hfi_gen2_set_num_comv(inst);
 		if (ret)
 			return ret;
 	}

-- 
2.47.3


