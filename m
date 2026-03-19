Return-Path: <linux-media+bounces-56289-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLSfI1CRu2mYlgIAu9opvQ
	(envelope-from <linux-media+bounces-56289-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 07:01:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5272C6786
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 07:01:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92BA831720AF
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 06:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7530139B4BC;
	Thu, 19 Mar 2026 06:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SGLwEzOA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sz3AH2ln"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4808839A06B
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 06:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773900002; cv=none; b=W73p/e0YeL9z3hYshpjCD184J+ubASIeWEeACxcfp3lg+D/NxwRYCiF2o0TwP/S+YVOe+b9Vy6rowonoDNRawyAqE7jmfZ99hNVweRWw+IoSv6lTG22SUI1o//hJXQTqCZdNBvS94sfm1LCkycF7ZWie9Hczgse1P4zZZP6lR3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773900002; c=relaxed/simple;
	bh=x2YTsex1Fv+Dc4RVscR+kAhkDi5JIRV/gMadA9jhh1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ng5Jteza2nrbLrdC/wMsTZ95iKAc4j92lezADsf/8o0EJ5mj8jQvj5bkrXffVlZE7G9Ohna7iyd/mVO1H8/Os3V/O+EySDhY1KPGHkOqVCMSmTf55x+AlfX5NuXSf+LqFHNBMZZatY2doI0hiDueQAeoWHzUl5QScJPeY6YnAic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SGLwEzOA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sz3AH2ln; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5XdCZ831283
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 06:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gl1IWKRec7l4UUGWy7jC01iWiWXGTiFco1mvc7rwi8w=; b=SGLwEzOAohQR8PGA
	p1znTz/iUDnVY9Y4ctKuTjN6VD6GkhnRAwy6TXf54BefKHgBwdYTcOdCkPQNpcD+
	ygBQSHSP5bGwk/ppI6Rs6sD5HXBR3unzs9iAF2AmQX+XZ7YbqA19jsFZGd5Oh+yn
	sJig9Ie02t5pHwgRErcerkoEU1OjAPkLvCOiSwVnvkwyanbnfjyZJealzMMODPxf
	OMeftyT1M0rGEs0O5LpUiRPHW4SNQLiVLa9WgkrmX29nrJeizotVzND21ZogPkRN
	E9MpsNacp0KFiNNJH6tGUusnk49sqC0IpK/MZC2ukbfz0wpljSFW7bnb5E+TGyfV
	2r3Ymw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0032j3qx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 06:00:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509159f57e0so50220601cf.3
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 23:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773900000; x=1774504800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gl1IWKRec7l4UUGWy7jC01iWiWXGTiFco1mvc7rwi8w=;
        b=Sz3AH2lnVwy+boh0wK96Jx805R++cUh6ZRL24wnHtK3kJxEPw3hubZsPibNU114Wk/
         5ltHTqAjvOUrRt9uzgvtOJVh4MatzVElMeUpBfe3MTjPB+AP+RmVHUYMv5lFiX27e/DX
         zebLc1rOHPNA5N/7j/zrUA/SfdMzshrIcR2Zy+1lu3qLKbf/CYduusc32kBpdamPMA+i
         P2LEuou1jGX8CsUKfFfNdato/iM5q7OzaXLogvMGLh50jiTsC/Z1xF/GN8qI2lAbhIGL
         6ig1/85w8Ea5OskKHtWuEf4RZq7pZRwmy6GeuoKXb7tiOgMnErYnuGZDC7Ug3lvFEe+6
         Zi5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773900000; x=1774504800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gl1IWKRec7l4UUGWy7jC01iWiWXGTiFco1mvc7rwi8w=;
        b=TaKgoiR8v4bSXcdlUQYxQ948F7wvIAG07H3oHYg6BosO9UoRYsyWV8H+xTIReG1nXb
         hvXsicgI3bCd0Icd66XV+NysKAznhoTxccS1vodLndJhu682fizKW8zmg+4nIRaYPOqj
         0vMQmuKhC5Llcm5JAzuXMiZhUmAhwGVD90VJG+YlFMv2jgn9311Gmj87Se24D2lqkq5c
         4bQflrfuuSCjLRr3h3cDMeaS3J1TS8iWOUwHOw6UytC/u/IubgyUsVtuUJTtkd7gAL/e
         aiU78/GTyyGRYA9F4rj6YlYjk4SXkBR50BwC6/Z0Xh4ZcFWyCtOnRViT41SHnZfGXUKi
         itrA==
X-Gm-Message-State: AOJu0YyHIo4T3Ujipznj8A6IobaaKMky8XqyabVaTqVRfActIHI299ws
	fCRncpRwqJVV+TBzUIDiU+n8c9EvQmfijQJb1TdLDQ3iwG3GU3AgPjfD6E+McvLG8D5t5Vnf9a+
	zwFA3gvjE/i7Wj7vcDi5SSX7GPoUEE09/v+7fCs+4MwJvsJM1B50hOdNTjGYqLuTgkw==
X-Gm-Gg: ATEYQzyNh6V35OtgyYDMg/qG6vqXCOIvYQFVYW8sdS7Q+hiNjoYF0tD4nDF1v5acFkA
	BxqRWDisNoLhUubBoEBvSv4H5L/v7ud+fwYZIOt5oFpklYOpOeiytL0dqhdSQm1R5c0c+3VJaNt
	s68NaTTBKLmMHwxNn9LieW10X/84oxXj9WBUv7iLlkmXGLVvVnH8/hz9KOkYAQ5aSGzIVDd9ofM
	5KJUq46Cg56AqHnWfhRbopl9oVQNwBJ52bXKxWtzsh3m+Qz6BGC0QVe3ZVEM1G91WBHIIuvgml1
	qPj5s3wzqAr5gV0PmB/tfab4zaaukGVJobVHlWQ0pTwUBnESZpLmZCGAriLmsMq0RG2LjsmEyhQ
	Hze2vxJk2H9v9o2cXryZvo0GIkDyae1pyP9BTd2rCmrBbYKvCN7H6lsMYDM/35rUSP0A0bdSJDl
	p4WDir0hNlfqL9IUbvZffesrgXbBC8/pRtSY8=
X-Received: by 2002:ac8:5d02:0:b0:509:15aa:cf06 with SMTP id d75a77b69052e-50b1474418bmr78773801cf.2.1773899999593;
        Wed, 18 Mar 2026 22:59:59 -0700 (PDT)
X-Received: by 2002:ac8:5d02:0:b0:509:15aa:cf06 with SMTP id d75a77b69052e-50b1474418bmr78773591cf.2.1773899999216;
        Wed, 18 Mar 2026 22:59:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c7415asm993174e87.56.2026.03.18.22.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 22:59:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 07:59:47 +0200
Subject: [PATCH v8 03/11] media: qcom: iris: don't use function indirection
 in gen2-specific code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-iris-platform-data-v8-3-55a9566ebf60@oss.qualcomm.com>
References: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
In-Reply-To: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpu5DVd2XFQuIcbOczoHU5TvYM0qX7nn5Rmtgz5
 /rdMmgjnSuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabuQ1QAKCRCLPIo+Aiko
 1cPOCAChOWRdECNn0NqCGxn1L1y082KStvVckkBpuTDWcFF0xWSGLO9E13hu/lYNpsIBcza4Xsb
 UVCh2iZA77nyZWzQeROi5mF+mhBHzCe2Jh0LotFK6UjhrYpHAvVkKZjROXkEHqthukIFfvT8p76
 ys0w/icDY9YzUH34Acuc1JvK9HHH/kMO/++NtEDFGwJuCgH2yNzy6XtlDVXmAOtc3bPRmKb9aoE
 4rKwVy22YcjelWft9d8P6njr+uql3pNXsBO0lHVf5yRC94dYnKzSSyBr3WvOHYwnh3PVqkMkE5r
 Ekhqwivp9xdzRjT6xC0FnuPKOHMaQ+bvtXL05VYnE0zN8QdP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: XcyMhvLxZi-_VcydM2H9LWVqfNrS2uKO
X-Proofpoint-GUID: XcyMhvLxZi-_VcydM2H9LWVqfNrS2uKO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0NCBTYWx0ZWRfX0veAqNgVnrPn
 Y7Vivb2BqB6LLLT3hbb1KZbC4EUOcF/79C783YkECA/8yGhvRit2XcyMKcm4HJFJOyQIOTvTb0y
 g0VpkPHYrSkXvcUAuqyZSZQtDX5tDDgVNXm01xmz6EkQqzYnJsizJpI5w+CV2b45Okln9mAKUMJ
 yfz1yo/EVgZqYZNur9a1E4OfXFR9XYy/Eu4jdbAR/tfXfL2pmzhhZ11FfOa4v12ekJ+NAmhp3/t
 AnoEJWTeYZ63GktOVxo4750w6/Cd+Na86zEhJscWV6ZQu0SlYv1Tvo9/n3Tz7QkcOUtCKhUDGRV
 gIW+gPPp5c4HnYHLKEREp7iRoI0ecHfo+puRJ9lapV4YJrq++tEWDhUvrms1P266gWaFJhXiP/m
 FowUxMpA0sgOmC/YDQQF1cnJUR01CBxkABSh3ZEfkcI9uIB8wUCnwwD/dMfJ6FEmWTp+0bmyVKu
 Wdlswk8vTXsI9PZnynQ==
X-Authority-Analysis: v=2.4 cv=WO9yn3sR c=1 sm=1 tr=0 ts=69bb90e0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=yEfzmaBkz_6XQGMMuZMA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190044
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56289-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: ED5272C6786
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


