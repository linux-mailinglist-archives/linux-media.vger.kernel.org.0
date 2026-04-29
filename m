Return-Path: <linux-media+bounces-59965-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJgWHTb28WmElwEAu9opvQ
	(envelope-from <linux-media+bounces-59965-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 14:14:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFACD493F0C
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 14:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4475B30EE81E
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 12:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5CA3F787F;
	Wed, 29 Apr 2026 12:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lI2BBOK2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FtxGM3LH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D82D3F65F9
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 12:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777464618; cv=none; b=gyK/q+kWWkSMmbrPg5hLVbAj6ZRxV6RaS4nqIC2PKFRfSc5BxiQ4AzountBezr8fZmDMHOPKlrGb2Zp/iwOZ6u12OzYS+gu0PDD8IhQjdAnMtUuIyKny8i/L5qf/Mc00JAjDxMQf+SdGfMS7UWthiZmYkm3cK9sym3PcFg6a7Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777464618; c=relaxed/simple;
	bh=qxvKX9/kALOOQ0fCmKsBP9ieR1fADfuvVGl6xKY/RII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GFWLuyIrK2QDf+1jx/W1jWF49q14bGiUIoBfQ9nUPiKUpuCbnvzFxuxbv+ytTJyEeh8Z5UMLv8rEzahKt2Cxo5vWf/FWhCCJy9yK844Zo05qPo1sIz3X8+340vctTfbGGo0PkwfRj+D4KWS/QGnnJ/kKTQJ9mR/aER8coHjUZK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lI2BBOK2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FtxGM3LH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pplQ901798
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 12:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MVJEwmzv8LNtLor1XkUcdHcBKYnBZzXeL7Dsfo+fVDM=; b=lI2BBOK2MRxnEoc+
	yAbH6NZV/hY4cyltHgSoJYiNYeQF8Kpxu5SCElpVVpTtbccIuZyhhYLQci/cBICf
	yDAJJmX/G95GkwRRGtVG5zG5BFjVURBlIDLj7BddkgigSer7FsLBMdaDoNeDE9ej
	n8kZoBfvrEE6CIBW0PcF86uGtEN/aIZvxk5wrZcQ/+kfQieaZJu75tkRsKiM8Sqo
	03fvUkClrFMP13MTGuvnqoO9iR6HG5HFebnGGu45NoOJ7YGdnNL6zbIXlq0H3/2K
	CDXauNVq//mRx0KBLcUtPUyzOrUGRqc8GFAjVZlsVbZRj332GWF/p6SzKuVbtfzU
	PqFCpw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dubq9hkrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 12:10:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2d83e7461so216360065ad.3
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 05:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777464616; x=1778069416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MVJEwmzv8LNtLor1XkUcdHcBKYnBZzXeL7Dsfo+fVDM=;
        b=FtxGM3LHtNXl/TjGyT8azvP9+5oULrqr+sr+UjDBb9VL2PShNr5X3YTSVEYc0MUpng
         YqKKRMddcEdqwHEFRt7GfX3gC9LIgPgQvJ4Pj5bfcj9FTyuaG7dnSVup3fXWiJqDr1ae
         pSbj8HA9TyT8yxru45rwU78i8fdm9P2PVkbsrb2Ch+75glj+JEYBMRZvlbAB37xokGR2
         WiFUHd66yXrdE86bTqvtbJEOR8Xi6kHnq2eDrbQSXgcGkvNKtJgUJUELfFEBeEnM9QB+
         /Bo7vprbref0m3CKo8zMqeBOIPy+/taHP+CFO2cz2Fgw310k7SLe16tli1HkloZhuzI2
         ifZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777464616; x=1778069416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MVJEwmzv8LNtLor1XkUcdHcBKYnBZzXeL7Dsfo+fVDM=;
        b=VocNBQ8thRIMosFLQOiRcvsG9Ui1Vo6Y+xSEVXLAcjYYg/QNJU8E7Dm49lKtt833if
         ZQpI+Ctcp4Ihk3p8WuZUnLSG4/jmFZ5885dBvKZtvU3kyp1o40rxlJQD+luo+CpIFWFK
         z1GJFCmzRxZSp+dI426Bt/LztCOJMWdI+TndVNOCHv4yZmppX2PDM0gXEZOiI2X5Rnze
         ReGrx7efYIB6RBISOsqlQPoHtqBDpxwVYGYKL4tQ0sSQFuwsRnbmUW6WyYAJo0OD7CZV
         9vtZWR0gMM59+pYZfESii+DYYdI3KYyy08CBxh2/d/u3M/Hcixj/8MUeik5XyIzA0Gz2
         K0rg==
X-Gm-Message-State: AOJu0YyAvLJaVforBPhb9cmgD5jskdH+IK1ckIAw2UxAiTuMckLvdb1N
	wpgIDweIQgEulffpJ1Z/NCk3XITjKbar4DvTLjNgdoBs6p2h8oxmw8DaOsGcCrOf7Emg26O4zNl
	cIVvOGJ6JuIh4gH0N12I6tgHNnU+bnmVFk1kUFUuTfOKRJw76Pwu21Jt468dgR/7NZg==
X-Gm-Gg: AeBDies0fE6vDg26/vTMFEhWnOAg+EZhFPmr5mF9javOX6ny9I+bVe3Kn8zb4Dzsc8h
	pGV9HmN5sgy4gbn6jQL44wNDvBbjikGftbVfj90Jlu3Kw93uzU02d67SUC6Me/WjE9AYmx1KKhM
	g+DlTTN3jMeMfWQk+1Nhkazo7f5srzn6BLwQ/ZX+bBZL0O9/SMLwlezl8jHxADftGUScQHQOKiG
	qRr0y/Y04gH8DAhqcfZ4vdBpKZ6Wjnufzqs9U+urZf4G+HSvlX1Mrgtsgx+nC0fhRFQ8YSFsfnY
	/fCnDCFPGVhdY2K37gDr4RYcyavb6tOqUnsBS5WwPxiHmRhTdML3pZdbBzPpLdJklvtSD0aRODY
	Sge3BwTbPgKj2yVtnU6Kps2Z4ZOF+hDcYR+aL38PMVZ9OyV3OTIP7/VbAJClh+D67WcCbxw==
X-Received: by 2002:a17:902:da81:b0:2b0:62dd:3a80 with SMTP id d9443c01a7336-2b97c4396e6mr79811705ad.17.1777464615566;
        Wed, 29 Apr 2026 05:10:15 -0700 (PDT)
X-Received: by 2002:a17:902:da81:b0:2b0:62dd:3a80 with SMTP id d9443c01a7336-2b97c4396e6mr79811255ad.17.1777464615073;
        Wed, 29 Apr 2026 05:10:15 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9887ad80bsm21482765ad.37.2026.04.29.05.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 05:10:14 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 17:39:48 +0530
Subject: [PATCH v4 2/3] media: iris: Initialize HFI ops after firmware load
 in core init
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-kodiak-gen2-support-v4-v4-2-1b607d13f9b8@oss.qualcomm.com>
References: <20260429-kodiak-gen2-support-v4-v4-0-1b607d13f9b8@oss.qualcomm.com>
In-Reply-To: <20260429-kodiak-gen2-support-v4-v4-0-1b607d13f9b8@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777464602; l=1693;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=qxvKX9/kALOOQ0fCmKsBP9ieR1fADfuvVGl6xKY/RII=;
 b=icFsHTnkuMqij49OkB0PaxhZHrYqYSdtIfHezOdrneZBbYa34AXuESTEV/BoDVcx7qxnsU0Uw
 FVKum5/FkXbAQ0z4ddCe+ohzU91V1VHhM64zsAdBkZ3jZjuF1r8iqEq
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-GUID: x_ArZa6naNt3OWVIqzwwtJ7TgNF-t1D9
X-Proofpoint-ORIG-GUID: x_ArZa6naNt3OWVIqzwwtJ7TgNF-t1D9
X-Authority-Analysis: v=2.4 cv=Wak8rUhX c=1 sm=1 tr=0 ts=69f1f528 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=u1mmxsKKFvk7TXqck8YA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEyMyBTYWx0ZWRfX1a5SCUBVg5NH
 Dw/5ppWOF7XZG5kQLLhIUdM4k86cQyTvUmguBUzIbShVSRuqveqAQgiWB67XiDfxaFNMnk9YkVO
 dtfyLFm5JMrE5WLFdle8McXKrJlt897wm2CTLWhSaUQ15shDvP/c9iCiHygcL4t4xdvDUtgPiYc
 WFB58r+uI+Rbz9gBZVHQE56ppWsZB9+OyxrI4bajvzQWl2p7CKo4ANQ2NnWajO3tLin7XFF5u2V
 XVwERl02qAJaaAD2o95xNzLx8zIMIAeTFMBqQrX6kOAUSTcN+B8kdM1q0O3NzgBP5whEMnlEA0m
 PyLMh8x7rqQ1kisK49NMQeQaSOSv3+3/5xB63sYraIhjvDGeK8z51/hteEtMHtuG5s1UWvjX329
 rSDBGrjxjretN5UPJ0TiBRz6+YCdnbXODQkoooetJ6igL7pXbPmEdq9YQ/amYx5lI+StIwINdpX
 z3PBEQu6gwOlYeaXIAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290123
X-Rspamd-Queue-Id: EFACD493F0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59965-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The HFI sys ops were previously initialized in probe() but, we don't
have firmware loaded at probe time. Since HFI is tightly coupled to
firmware, initialize the HFI sys ops after firmware has been successfully
loaded and booted.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c  | 2 ++
 drivers/media/platform/qcom/iris/iris_probe.c | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 1f326f696d08014f5ebfeb0b99cfed70665fd6ab..52bf56e517f91e98569ee02986183971266e1c76 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -78,6 +78,8 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error_unload_fw;
 
+	core->iris_firmware_data->init_hfi_ops(core);
+
 	ret = iris_hfi_core_init(core);
 	if (ret)
 		goto error_unload_fw;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index d36f0c0e785b7de0e3527e0a824942db0fb79133..dbc15edc602b72fdec8bb2d8d3623676afee728c 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -266,7 +266,6 @@ static int iris_probe(struct platform_device *pdev)
 	disable_irq_nosync(core->irq);
 
 	iris_init_ops(core);
-	core->iris_firmware_data->init_hfi_ops(core);
 
 	ret = iris_init_resources(core);
 	if (ret)

-- 
2.34.1


