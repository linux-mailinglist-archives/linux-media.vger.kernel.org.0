Return-Path: <linux-media+bounces-59400-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOrhApkK6mnFsgIAu9opvQ
	(envelope-from <linux-media+bounces-59400-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 14:03:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CC5451B09
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 14:03:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B35C5302C1F8
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 12:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC713ED118;
	Thu, 23 Apr 2026 12:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lxj1HHni";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UbQazFYj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BD43ED105
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 12:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776945659; cv=none; b=CrPrkV+G86dXf+gcXlIa9/wPJscAzvUsJfTzXZpwA/TJhqF6sVXX1fFqCkQylYwA5sgfxtQmhmDXM+HegnZJhpU44ho9bE8TGt9ie60FCJKtQKlZFrOUHsYDD8bkOsopfVrEI/SnDvKjC8iKGvfns8guVFD6ovuk0e6+hyHniLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776945659; c=relaxed/simple;
	bh=sQLrP2R+ayqIMN4Y0Qvfw1jSXTWgtZe2Gt3wtSGJnbM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=At/aGkYB4UynorqCpU9lQXwXBnSGGXKnbQy4kEd6QmFpdbT0/2htHAwQPnW6zOw+ET8t1ohFnZg/SGEAtDxIiOz0ZsEJfafjT8TwQ/wP7wFu/kHV1ISbAdaoxIUZ9ogSb6SvecCaN5fSuZAc5aFy4EdHgo4WEm02s52KdQosqYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lxj1HHni; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UbQazFYj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uEs63044047
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 12:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jkn3LpTIrdDz42ur7AeOGZMVRe40daDRbFlXQrDd3X8=; b=lxj1HHniDK/0snW7
	FygrDycC3kGRxJiNppCqgUH24bjl4Od9ITRuiIhwmxD07DoPyTd861iHdiWNVp8c
	9Q8MqYx9aFzxxx2tVPi8jV9mCczdmANdb5kWjbgfOkoTpX1w45p3+QIyogLUfrU2
	eLmVuxPnJqVdk458dnkMegKFQNFwLCxPpBkHfQ3WQ61TVtbq3uTBYNgAiwmSy2aU
	X9kkXG7Bcu7UyAKz8ByQEfJVrGum+tH+ac9LYk7RMgSAoAZc6XooHaNEoNGRt8CH
	uDGnv5Y5HLADF9PKlTLFPsgLw9j9Meex/31G65EUPDPJhG6K9o9Z9HNzNIlQHEbP
	9q61Cg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1jh3rw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 12:00:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b24af7ca99so89294505ad.1
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 05:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776945656; x=1777550456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jkn3LpTIrdDz42ur7AeOGZMVRe40daDRbFlXQrDd3X8=;
        b=UbQazFYjrn6KVo4VLvq3uNDkscrlPO7cypEjfDwMYLLZXKMrwCN89lLOVRAsX5xTF2
         YJhhOp92Tac5x3i35yWl2fVZC00FDS997LBG70CGYjdREvHNPDsODGoCZ6x0QMzA6hf2
         qIYAq490aVINWziaC/tvq+mizcvdhrzZGaSChdn1peLwhIj8/WToL1wJPuZtgzyX3aCy
         Bv8tPeDffDh6niIL83umEOkCeXHDiizqoKNJYGkTRzxA6od7Btb9u7u+UlnzMZljdghk
         SpaBz4eW1tBgTmy9d28WRhe6tfQz42wpUs+CMnnTK6LX/O0pIYvdP5m8RL2D69ln/SBc
         r+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776945656; x=1777550456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jkn3LpTIrdDz42ur7AeOGZMVRe40daDRbFlXQrDd3X8=;
        b=NykJpCkaxxfj/zovU92qD7rZWxZEqVi2EXDD1oIyqTb40XJHfnlO/vPo4qDSBSbuo/
         SmwdCUeYKNQmYgAdxg1wXNtpXDOyn4Wqs9qTNNspPW05PyhjWYsvfsBeWb8bC6DYwLb0
         FwY+SlzuM6aji2KpioYztxu3JYsO3jdrNYtNsjPby2zsmd3FeloukhvHUauc6cVjjvFU
         zGKTtb0P7rDUzsm5ig4p3xNLutKtsLDEdhIQalzTCQMGvSuyCTS4VWSm7UiJ4lKZBx7u
         usQzuq1kkHuA8HniFBZX1teFtIeJVvqUsYt9Xn2gy/kJf0NK58flx3OnExQnb5bkh4fh
         yVWw==
X-Gm-Message-State: AOJu0YyzzBvm9BE5JciirHhPYknI3TfYn82lfPt+6EoiLxtSqk228xjV
	4WwR4tariQga3sJZ4dxKKNdk9F4P9ZacdHPF5RtERE5JjSefd6MoZyctMDG92qWx18ySceh7/pq
	UhvZyd7aEIzpnAsRp86mtNY96hv/i8PBInVLeYSrTUPSILjYdfySvvVbXcjD1W7UzCw==
X-Gm-Gg: AeBDievtVsBMExiwfb8pzQbxkpFX5BhnVbEaU3QQIRdV6kTbQOZwCCrZL5sXPqwq//z
	IMuHq9VJsSdfb9HsGjI25AxkLmDtnRaN9t4AlA005aQt0W5mvoq6RJSovstZ/67nVWLhB0AKGtV
	ZdW8TQBMG2WjABLCPmOSVZ9H9n2/Kd06FkkBLPNbr0ux4x5BIERtVoU6UefhPt1GxDa4iDUoVtk
	kA8uxdoK/yQz8HNmAzrylGC1nntw6iiA3aauHp8R6CknypTgBLq5ZCuaoQW1sd2plHsA5rB7LVV
	pd0wmE8CT+V6yKVf/gAay5PA25WNSBhVtBbXJ1Z40rdKu01cGxzE7fZaHqMiqnQjk1+1SvHuGdL
	PF9ByxmGsqwIMhiuPHYFkikWuCPKiQURbjUgMirsBbf/gVRmMdLk5hqfkK8ObE4s3ctYcRw==
X-Received: by 2002:a17:903:166e:b0:2b0:a957:304 with SMTP id d9443c01a7336-2b5f9e85b42mr284954575ad.6.1776945656238;
        Thu, 23 Apr 2026 05:00:56 -0700 (PDT)
X-Received: by 2002:a17:903:166e:b0:2b0:a957:304 with SMTP id d9443c01a7336-2b5f9e85b42mr284953925ad.6.1776945655576;
        Thu, 23 Apr 2026 05:00:55 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm194790355ad.36.2026.04.23.05.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:00:55 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 17:30:09 +0530
Subject: [PATCH v2 5/7] media: qcom: iris: Remove duplicate
 HFI_PROP_OPB_ENABLE entry
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-iris-code-improvement-v2-5-9e9cbf00f9c9@oss.qualcomm.com>
References: <20260423-iris-code-improvement-v2-0-9e9cbf00f9c9@oss.qualcomm.com>
In-Reply-To: <20260423-iris-code-improvement-v2-0-9e9cbf00f9c9@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776945627; l=1359;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=sQLrP2R+ayqIMN4Y0Qvfw1jSXTWgtZe2Gt3wtSGJnbM=;
 b=3cNEHUszUEwGzF2oPIFZak+dnNv05TzMRC52Bzl3lDmJ2hmBPxHfLOAKEVpqjZWrQA+DvasA3
 bl2vqQsGptaD+HqV070ULVPDaWPO1Ts2gZrOAzC4repZcT7Guu6ysyd
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExOSBTYWx0ZWRfXx+SXlwK2lDda
 LkGNPxvVRkEJ/dV8kiuvrOB13IhGzyzT2Oyhbix6VaH/fMWy8OgaKnYtjqi+pPmWq57bWeAzER0
 7IfiNHxEVL6gQOY4yx3f/KufJq/72SPzVOPOtj6AAkJRuO0dCMHSDqqWXcf0Sn20KA5KW3HGW+D
 /s8PseVYO14LkAdGFpDhVM2eSBDBuVHVCKFEaBT8EG46SVC5rThelSxvZhaZa4GABbcc8hrItZQ
 6plupW5GpHTpNqQVPbSqGrml9gj/mxbwX0C5Z9FhG+WqHKeo9gWqPJjx+am5qKJXOyKoLfaDanE
 SbGAJ4vnNtEQ6M3DrijLYSnPad5evRiESBZafvr77js+IHjn1YwfNLgu2NSjsFNmncpJJgy6mHZ
 hotBr9EalTVnqrLFrtYj6Vq4nQFHrdNnq25PeZhT2prNiop1/3KTaKc9qcc2+TiexXJ/Oh75xmX
 GUFDB5Sz4bxUxAYbzbQ==
X-Authority-Analysis: v=2.4 cv=OeyoyBTY c=1 sm=1 tr=0 ts=69ea09f9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=jSGZT_DOcC9zL5wkuQYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: WlnWhWfwLLRN6FMHZp4-F_-msjNUpZqp
X-Proofpoint-ORIG-GUID: WlnWhWfwLLRN6FMHZp4-F_-msjNUpZqp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230119
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59400-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MAILSPIKE_FAIL(0.00)[172.232.135.74:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 94CC5451B09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

HFI_PROP_OPB_ENABLE/iris_hfi_gen2_set_opb_enable appeared twice in the
dispatch table, causing the property to be sent to firmware twice on every
config-params call.

Fixes: 2af481a459a4 ("media: iris: Define AV1-specific platform capabilities and properties")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index bbecee1cc2d02a8283b3465afa686319792d98c7..cf3386437102b814cf4b042a0a27f25a886dcf36 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -623,7 +623,6 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 		{HFI_PROP_FRAME_RATE,                 iris_hfi_gen2_set_frame_rate             },
 		{HFI_PROP_AV1_FILM_GRAIN_PRESENT,     iris_hfi_gen2_set_film_grain             },
 		{HFI_PROP_AV1_SUPER_BLOCK_ENABLED,    iris_hfi_gen2_set_super_block            },
-		{HFI_PROP_OPB_ENABLE,                 iris_hfi_gen2_set_opb_enable             },
 	};
 
 	if (inst->domain == DECODER) {

-- 
2.34.1


