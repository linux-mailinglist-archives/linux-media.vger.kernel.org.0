Return-Path: <linux-media+bounces-53819-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKhGNWSoomkn4wQAu9opvQ
	(envelope-from <linux-media+bounces-53819-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:33:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D231C1690
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:33:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 178D830B2BAC
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 08:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB52B3E9F9E;
	Sat, 28 Feb 2026 08:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QiWZehNE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kJwH0aRw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5B43E95B6
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772267354; cv=none; b=ZD36ZjdUkW4PTx1+zD6bZqF8OH9n3Z59NX8MSnxZv8ptW5isU/Al+qz+PT8LZyrMIvxU0xU7wvjYukP0G7DcYGgiwjEE8Q2WlEPStZeglJine6jVaKUjzGSdowuBs68IeILytlNvV5zMUABf77KHVlAMHzDaWAJxF+XV+OSE/2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772267354; c=relaxed/simple;
	bh=1Kf6KXU4l/H3LFKNax4FrB33AhXXcXlylE0Nbe0Lz8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=teL2ofXZcOVir+nWgKmp7HG7+oG/BOC1T7M+/6KRqx/kJT/LmEc/ZJ8GIqzSlqNNJLt+YV/i4oUeQnI7yrWr7SqH3oy4+MMokQSBMY1Du6gZY7ujsMcS+WGT3iXcK70D6vP8ToWrlMiB3pxjKU200n6Iwm4QHrfdxUrf7oe1WZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QiWZehNE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kJwH0aRw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S6Nd1N1782379
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LsBjgLUYF1aZBbJeQlRJX02GwU16qfWJ7mXVf2mm2d4=; b=QiWZehNElJ2D+09s
	trzIxCRhst8ERnY0BnDu/v027pW/KyHUVejsDR+dwKLG5hnd71ko8aURM3pOT7uV
	0HzFjsF5u/Y62Kz5/IDlfWIDX9oo3XkgfZMrzwSvTrYmTxxn7Vqa8cZhAUyllICS
	dzAJ31RF9KzUfLX3MDphIxWGdRBJsyOFdh+pRyBFcj7W2P/bO9rNY1m3ZP3VYGAT
	fALowp44iz92mzUu3c32XpkAinbKPz2mvmoKhkPLgbzJTvq3MtYGTSQBW4W+Rf63
	NVWYUxypgQXHV7yLtabhj1Ja6CmxbsdkgY+p4gh9+lUjY6CmIpyH8kYtdkdKZKjw
	INcujw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgrrj1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:29:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70b6a5821so2046013085a.0
        for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 00:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772267346; x=1772872146; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LsBjgLUYF1aZBbJeQlRJX02GwU16qfWJ7mXVf2mm2d4=;
        b=kJwH0aRwtFbn6RjHppvSJKOkFzOmMOx1XVzqOcBwKtyLYoAbKYOUAiLmworNaugvZ+
         z1TiHkG8lVTphKDUOao0jGe4th1gdfl831S5CSpMz+T34OLuWWjfe2lylt2esxt07E8G
         qQswr/km6aLzSh8tc2kS2BfoNdsOfB2IfIFJMkjvYtrAvKXHFaVB0C6CvWfUhKuaadXr
         6hg+aX+IeV+X5T2OVhDbrotTMprGLtrc9SCrfM/pCC87kNDMjucVNfc9s2Jl+yc7XoIe
         xTVLfiJIjV8URnL9TwCRn+GFP9zClqn3NsywXYKFrP4N0SCXa7vEQ9T4NwdBCM6+gjzt
         L/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772267346; x=1772872146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LsBjgLUYF1aZBbJeQlRJX02GwU16qfWJ7mXVf2mm2d4=;
        b=PK3vCSGQmfaJKE10JtOzgZDOrMScOX7ECnXEn1VEanG5wz4EaFN63/I+deb1d2h38C
         gm9SmgG8TQxjOGG1fRqkxc3WydC4OYzlV9v9fS4GGAb/s3p2eQ2kac2tyK2O+wYT0Ktn
         Pi2SONLG8oNxvq44UUKi4broIfYS9W3mxg7dmrXGXTJzJjb+4fa8XkBdZFhuSOqAtcf4
         in089TOtihg8MWX648QHrxXSFbM35YEU5/GzQH6IdWhhGfODMNOirpyF7Wnr8ZO5GGmk
         4CH4y4hcp65kS2/U5LpKS+3kmlzI4G9mvH1SjBTkEcUZtUVSJcju3KaQEV0bS29Ys/rt
         QsQg==
X-Gm-Message-State: AOJu0Yx0Z12W93sH3bE+5H2Yo2T0EvrXyOORmCZEXK0BABn+5BweuAwF
	UbkETT3dN2sL9TD80sbPxGcdOzRJXGVnZ4Xjh2ufZd4EicQHfUgvuohcfMdK1RaDfgS+XXJwYGR
	wh9y7SsoGxslU69QBZdSkptx5vKJ7vTONTBL9pkbiMLpm3SfARayJr/4xq83lkcJScw==
X-Gm-Gg: ATEYQzxY+9uL8iNPOdX22Q8l1liVYZeFNa5D6ZHifPlQBTCmmyaLNf4xatOLwMcoT66
	lUMSoO3QbJhEesNs7it27q5vJ0jJLE78V/VnpINaH7Efgv/Rjk0e8BEi7PcK2tb9tKJSgyg6OfV
	vrgrPOb4sP6YlKo638wSeWfza2Pjdov7WQe3aM8f3uM2LaDK0muEukXRJ0KartbDWBLmX7KvMgd
	b6fWhHt+RwvLNc4mMRJzU8sbKoUlcmX8X0fVHt3bKZBfPxL6FLVVTtkKmM/t5q7YaXEbGHRO9lh
	kPtdBuRgj6I9t5AUKA2TwCjBr+WiR81tdRERxRV4kH926Cb+awIjBJekMT9HEu2+xUSFwO3zZlb
	+KKeEVf+SQfEQ2AMwriI+psRT1mKgKpnQmLb6seIcMBt05vAukwBLD0CnPK2Q10gvCsKyE0nF39
	iPLwxBLsnjr1lZNQOpWihtF7fZvyOIyvcSwg4=
X-Received: by 2002:a05:620a:4152:b0:8cb:bae9:9f46 with SMTP id af79cd13be357-8cbc8e2a446mr676122185a.77.1772267346482;
        Sat, 28 Feb 2026 00:29:06 -0800 (PST)
X-Received: by 2002:a05:620a:4152:b0:8cb:bae9:9f46 with SMTP id af79cd13be357-8cbc8e2a446mr676120485a.77.1772267345975;
        Sat, 28 Feb 2026 00:29:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2f4b158sm17970711fa.6.2026.02.28.00.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 00:29:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 10:28:51 +0200
Subject: [PATCH 06/11] media: qcom: iris: don't use function indirection in
 gen2-specific code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-iris-platform-data-v1-6-c2c53539f948@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2041;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1Kf6KXU4l/H3LFKNax4FrB33AhXXcXlylE0Nbe0Lz8s=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+ai5Q4zM6P9WP2vls3/Ziof9HXW6feXTn00TpW/33HdU
 /9k+dOcTkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMREKA/Tfb7U2VIbvy5BOq
 LXbsKBZ245ZeLhZ3dd/OhDff+lp0T7//9uTh3SMfQ7ccdrTi0LaxTeQ5UHBsskip9sZ4Lebs0jV
 GrH07+s60LDVfeOaX+EmX4vuz1cO6vBv/NRftb3m26fSWZ2ZPtzctmy81j3f23Pql6uaWVSJ5H3
 J9Qs0ZFQvn1RqW7FVYk/tRdBLLlktd3cpPl3vL3s+6GuMv4OitEntodtSSkCvMbPsfvgmL8BDoa
 bl4tMbR/VADj4RFrqZXpEmwVoWOf0KIjNcXHp+f9ts/yP7tmlz4Me2+zJ2zTMob01N49H56t4bM
 qLF4dLb8S9Fan0U+KjydEXycFnHfyqbpnJr5v7X0E8sfAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA3NyBTYWx0ZWRfX26jCTViPeWCz
 LUOeiunWwF/IAnycCr/AENNWbMR0aHG8vE+NzMs7EJVpi3+1O1sajzoU0hdowXtROhn8Yk0eCNn
 idzhAA4hWOfeboSSJTYKqgx9Nc47hQqCLUK7hGdOcjnzBFWJ641K3f1gwRTyFvpORkDzoflZyHB
 nM2kAt3FyeLk3BInMgdp3mYZ7QZ44pkCKovcZ5XAU35rpFTOnfCkx3gBrt4S/Ha91InVr+EW6hK
 5K63L0328ihAQGlfCC50AHuk3CH6/B3q17au2l0xy1RSqKHbecCpwsN6L90ntatx/olp6d1v/Yu
 5ak+nCnGNZD5Jj24eBFL9MvRDfJdRCfthJLQ96bc8u+mzUPN06vqbjagrH9QVqv0bcMXnacbFR3
 UsiTRXbMwkfqNI3NDb2CZH5VJrjSOwaQoy1y3wPbyHTbFrv4z59Ff27n7gFImJ4qhIQ7rZTPnBL
 EZaESoPBv1wIQPVshdQ==
X-Proofpoint-GUID: RBCbzSonzcOfjnbazwsFmQJybgle2eZo
X-Proofpoint-ORIG-GUID: RBCbzSonzcOfjnbazwsFmQJybgle2eZo
X-Authority-Analysis: v=2.4 cv=Zqzg6t7G c=1 sm=1 tr=0 ts=69a2a753 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=M7otsm39oOdpNaC3G74A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53819-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 81D231C1690
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


