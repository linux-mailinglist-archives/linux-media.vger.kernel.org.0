Return-Path: <linux-media+bounces-60721-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Jd8KEs0/GmNMgAAu9opvQ
	(envelope-from <linux-media+bounces-60721-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 08:42:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DAC4E3948
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 08:42:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1E5A03007897
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 06:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F09E33F5A0;
	Thu,  7 May 2026 06:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sqb3+cLB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FAppLtr0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A583633AD85
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 06:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136134; cv=none; b=LHETvE/dfJXurmaWNR7GtgToqORH4AUQlCX61Wm727Xd0wrIlYJdsNrbaCKbnePVoGKHPcSSBc+PgKcoMQ6PD2IJsSvsNyFQMKYM4xlsh/qjTy29NhKJwK5PjK9U3I3LV6XKr3PYk3UfBbD6sChwfNuMTri0s8Ijh9D2hdK8MGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136134; c=relaxed/simple;
	bh=jaIRCRQ3d69KBHmHN0Ry0EKvqFuijis4q6NGjtukHfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r8fuKt9TRIVhNjipCOFsEPVdKawNO/znMIYyTgnQ8CzkqYJ9U8XrHmEYiShlyp1ZCJMdz52F/cQT4c4edDajBZVyxPfPFROjFFa7wbF2uhg1jJBAEl2tA/kum9k3bilYsqJnt8kf7KX/5FOUUSi3X+t5lwYaZo4NXX3dbpC+pPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sqb3+cLB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FAppLtr0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6472C8eS259453
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 06:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B8G0+2ZSIN+qIPIG7cPGxhr6UssK8Trq7L9tfiuvmrU=; b=Sqb3+cLBJX6M6a/Y
	jociyz9Xcge8h6fNurnPLQfCC5TPZusgyVubo93xQ+Tr4D0W8DUCrUsc2Fw65PET
	uA0g0lKeP2PghiHKIMg7JH1GU2+7U0esn0gdC7QeT8CR8BupACk0OVlvrDYgKHUp
	QCJMAy49L3ZEaX+bTPw/NJT/0gL3+fxPwfG+X+rj1FYhvD/HpM1N21NYNGSsbttr
	X6C8XdlrEQJMmklSb3pujVmjk31TF/3wccjscx7AU6YiRU3A+qgl85BbmE9f1LbT
	DWdLMbHvXaW43qzTvp7D0L4c7FXp7KG2Fl5KjCsZe1XZlkhibrPDHIjRf/7o0YlJ
	4l4Dtg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hr8rst2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 06:42:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d84b5f73bso15547541cf.0
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 23:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778136131; x=1778740931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B8G0+2ZSIN+qIPIG7cPGxhr6UssK8Trq7L9tfiuvmrU=;
        b=FAppLtr0NP/qoOMLLzy5eRMnL2vxUzTcFf7NviC5kbPIZERg7O4Y5y4S7yQ4qqqP0q
         mekaborvkWqAh7dc9NwNJSm1gVAcYH3JdNgnojeOsjJf0/+9RfV/PeTBDuiLsfq1m61h
         WgDeUAceKe22ERVCyIWeIwcNT40HnA6H09uDwWL2YfNQ7RD118BGP1bFfLtgiI8Ft4Vg
         uN8VpctIvsmJ7S2f92OeGCj8LDbZotuW98QOxxoXOdbQsUgkoreDN605uBnX+1VsNJIJ
         YHHARlhpTN3JPrC015CdwgAKsKPi4ek/UbCjBNl/vZeFfECFpXCMtrxGAXcEWuqAUkju
         oE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778136131; x=1778740931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B8G0+2ZSIN+qIPIG7cPGxhr6UssK8Trq7L9tfiuvmrU=;
        b=YKKaNXdRPegWll6wITcJ62DOkiitzbjdX/4r3A1PHq8veu0/ZXfhucQrH2wv2Nkuwp
         o6ch4lbRqv4OTAvBnwqt6cd+/FB45YmRUXJQCpM/SkalGOb+RUe8Px69wKzxq+HqrrAx
         ca589pefmbApeafwemRQMdKQtyYDYzl/GgwZ0R54SoweJa6ICaKkQ/r0ka3mjQakPsFE
         qs75+RWMOzd4+BeXaHYe3aF49xA51l37KSjuv6KcFL4RMubItYxZ1Lily8Du4fHH2RTX
         c6h3XSDwTx3PC3s1MGZsJl1PMhl1G5LJJhMLKAxtjiRgk2P652DToJhTuveH3nWcOQaW
         gY8w==
X-Gm-Message-State: AOJu0YzbwpskAkPnNjlPFwslyhwZYWKOABLkiWWiDtbNwEw7nipHa8V5
	tqkPkkD5mb9RGdqXGlFwRhxAf2VzypGh1oKVL7WSqhJIBkbyRy14C3puV37e7Rg2tmrh2lCbVRK
	O8ZUoPIwy8z8geoHkAWeZqik8wFjrxEnqFYu4gKqcfiYhlddJlr/yH3HlmUa2QbDZJQ==
X-Gm-Gg: AeBDiesXzKSpdecEbvNMMYmnF8FSQUsQutHhMLUwLxyFhRP4AMx6W9gVtecq1BS4PiO
	r/IgHlOGQ00zPCWpSouDnXrN2aokZ/9wis47TK3sZKB9LybAYZ1wC+Yi8IoRCwPve/UisYLZFGy
	7buKO1FitHxWvTsGX2RT7Ac8zBO+iIHSBJE2y2vgOxKw5DVmyQC/Dao6nd+WkGWXFxIQhY3EXSb
	a9wILUjGIZ+tpJN8veT6DaRFZVFSDU0lL0Afa/iTV9kM8NxBf8Zlv9ik0MrH7QlTbxsYehAEO/n
	B0p6rHs4R0BtNq8+7R11B5+qq6M3a1DxlyDijhT8ua7d4GqCRDEbaZSym8mkgNRZNScjNkZfX8c
	eXZSjO7E3cVjsHa8/0fUijeZGS/zFgulPaMSkomd7cizRT6HrAIuvM0q0iEW2oUakKboviPWQIv
	nspyu+AD+K+S5RC1peuYGMyYCb7GLDALTZHzbY/+wETJCY3w==
X-Received: by 2002:a05:622a:4d8c:b0:50e:d316:fa33 with SMTP id d75a77b69052e-51461fce4famr95530241cf.39.1778136131605;
        Wed, 06 May 2026 23:42:11 -0700 (PDT)
X-Received: by 2002:a05:622a:4d8c:b0:50e:d316:fa33 with SMTP id d75a77b69052e-51461fce4famr95529971cf.39.1778136131205;
        Wed, 06 May 2026 23:42:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8722c2d43sm3334694e87.40.2026.05.06.23.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:42:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 09:42:01 +0300
Subject: [PATCH 01/16] media: iris: Skip UBWC configuration when not
 supported
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ar50lt-v1-1-d22cccedc3e2@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1079;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=53Divj+Z2S6t3+tbeAUvd2qjozMuWVZK/b7AyLFa9bs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DQ9WEne1cLGwyNkAVonc9IE9/EVCM7kGFClO
 lpVTKdLAkeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw0PQAKCRCLPIo+Aiko
 1fdcB/44RBJLJQ0xHeBwE8QYUivW+pUw5XJmoYLwZSqHDfcZ8MsMZchHgMfrc7Yhu8PRYmy1/nz
 WcK4zYVEtouSH8sMk27IICKPgF1Ixh4B33J/+a8BwoLV73rfr4gQhFVqMyVROf+rRQHtQiywqDf
 xHnv3kugeq68RbYjbSLE5paSrsBOiKW6DFFysOR9mZpka5K0d2B7/KZ+s5X0FNE5m4HQP1A6OQk
 koosVq2v27bHQf+pf9vpgo49zMVz8VZ2sbAS9DSjvAxcPzEAgArioFWMYrsZRfzjRSFK2VAI3Mr
 8TbPDXzoEFGZ++vwDilk/h/EaKEZtibPrKau8qJjPZw0+l34
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: uVWp-8wuOfaOSGUHcRJ3Tf5SIgC6gWpw
X-Authority-Analysis: v=2.4 cv=caHiaHDM c=1 sm=1 tr=0 ts=69fc3444 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=wrkyJH6U6m0Jdbs6q_kA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: uVWp-8wuOfaOSGUHcRJ3Tf5SIgC6gWpw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MyBTYWx0ZWRfX4OylD1XanV0G
 VCsQUK7Sl7ko9S+yGMNOEJBSW54p4RWYwpgfvxnoX+61t8ecMshfKrjUTfb8dJXI4jW5WttW5sZ
 eYH5xN9Jg00zOK6AzgNGmBPTLi7tIx7oPLvwFkv1e0kiKUIdj1qdIJJUFv9ieIi/d9JyMyNXCXc
 oHDdrWHBjUe9ygmvjhaxQMu/vwjlOriSkm9byPH2rwSfjvAlN0iiqqtQdVPVUxldah0KdplPLu7
 fwGdy3t9hOmKis+vBOIPO7ZQuNWazjL1aDhf/Ep+xCReQSnYjcTKpnBJc+5j+QxGEvjw6W72WZf
 uXhUqE3T/upfBN8vvYHhPkaCFaqb91sDgXxnIM2A2ujs9IPFYoc+533+duWHL9HE/XgrW4CcKEE
 3gvV9DexAyFGVtWJY6D2ick3aHrBK7rCFv5ZuHskx3YchwVdYg13SWY21neeGCsJMtPWUx8BO2o
 oCh5br4QXpw4MvxF9Sg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070063
X-Rspamd-Queue-Id: 35DAC4E3948
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-60721-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

UBWC configuration is not applicable to all SoCs. Add a check to avoid
configuring UBWC during sys init on unsupported platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 0d05dd2afc07..6e04175eb904 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -140,6 +140,9 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
+	if (!ubwc->ubwc_enc_version)
+		return;
+
 	payload = qcom_ubwc_macrotile_mode(ubwc) ? 8 : 4;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAX_CHANNELS,

-- 
2.47.3


