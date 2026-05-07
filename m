Return-Path: <linux-media+bounces-60695-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNMJAP3m+2kaHwAAu9opvQ
	(envelope-from <linux-media+bounces-60695-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 03:12:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F374E1DFC
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 03:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8CB21301994D
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 01:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A134D282F23;
	Thu,  7 May 2026 01:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ePfdtdGx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DrUgYsId"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A73D274670
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 01:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778116261; cv=none; b=Txcu8K7zNn3a3xjFyabRRyM5z31xCgSIbkiohHsR6+8DXD+Upk6+AfRhhBVRV6VTtw8nncIxYDpz1TWJx9bDbA4lnEFFJF69ZOeTYfx6ZtId8ac1aNil4EMUSJE+a2FzHLi2DzJeAoYasMIhKoH/xd+J0P7Wgr1tA4brcjfGVqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778116261; c=relaxed/simple;
	bh=I0GJCkT+M6rzwScGE2nHMtdPm0YonKxq+nwx5NI6V5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K+et3FphNZNRY8scsVLCXy/bWmMe4P+5mz76XsgaCwoFhBpeNHFFfV9R1qS8TRbq71x1XjGCKdjQo36D8FzCcy0IJC545WrPtrfnAhsrHtTq35K8+SnJvuLzrPsPqVOng+tweSExmQdQzhXxaOGc7lUxJcBxPf0eiNKqbBb1Ltw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ePfdtdGx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DrUgYsId; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646J22Qo2581367
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 01:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SyQqdK9jmZKeNVXJQVvQIDZmFlPQgBoBYfDnZTubWOk=; b=ePfdtdGxMCS0JA5F
	yx5WxhNux3TR9r0AQrHStgqnf8SJUpCajgzo0j8nC6RkeQi4BRjb0fm3sV4neEVh
	jf82vWR9/sDIZf7HnUWzJOszkj6pfbIOrCRAGMVGwQg/g58yQJDWXZb6/MKerjpg
	ZKRdW71d3AFk+7ywimcdPQ3Yh0r2WzGZOs102fMxoJDhHNHELc97UwUXU7ucdZi0
	8Hf732ha9b0cYuHsr96v0H2mvLFplY8bg0jc7QeToskH2bNWzyBRu6qAxQdbovfn
	WiL8NXgX9R1KnqpakuTY2Nr/K3mqKyRVPQDE0dcJs9RukNOIKde/+AXnB+XndQmT
	/0acGg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyyvw4024-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 01:10:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fb3403e99so5560841cf.2
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 18:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778116258; x=1778721058; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SyQqdK9jmZKeNVXJQVvQIDZmFlPQgBoBYfDnZTubWOk=;
        b=DrUgYsIdI4I0G9ExUmSQYocXKARlFpJymu74bDwiMB1Y/ptnPInZ3m3YGlc3eCdzaz
         Cke7fPDH/KSFJ5Ccf5KmjqN5c2ztaf5FHfA2HJ7go+9AIB4TcIVlVnlWhGXsiZDPr66I
         NTfg4zLMvB07hlolRAodn+3BU4Qdad1tHcmTvLr/Fl3QAc6w4Xdd+MW2omxCA65kQrCz
         QRs+ghE77ohhRJNSIj9PCqFDs6/BCgUv9Cto8MYxPl/D7QJX1K7hZlx/nHCG2BzMgZsB
         pcJPQA3ojqKBaxWGb+g9P7HEtx23MkdJOYa/iYiLKPP2S+KtuucTIxqTvVrCw2KBXz55
         5MVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778116258; x=1778721058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SyQqdK9jmZKeNVXJQVvQIDZmFlPQgBoBYfDnZTubWOk=;
        b=S2+pYVMWtT/tTa9maCngHZdoYJjw9JKju55Ibn0qTEL9VQW84iFA7/7KWViwHwxFxK
         RnhzadjdIM0RgGQWZS692hBhW87MZAuCA/VAiMrhhFQoWtTRCaGhguhUuZUwRDb2ZzR3
         Lgkma7m2SSh/QQUeYcj6tpnqszjCFBgr9g1HhOnjrjT85nW8abuJfNwPnKCy5+8FGOOY
         VbfcYscTUa8mIAyvkUCy41EMnYf3qDi9ZM/C1FiE7hWAV7jYicjEZkzdGZrymRCNwTJZ
         U60vpT87oPiFcTvf92+DjqrMjW61RyTiJM3XwfLYSzLrUXsIuidiXWF846p3QSYe44PK
         ZoQA==
X-Forwarded-Encrypted: i=1; AFNElJ9sc4ekIthbYMrZ2K73iOG8AqtlpLBb/71VwNqpCIe9h91e67B3DlzLByf67Peps9XRtzKs5vhhTU0Wzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjj7NyXBtjGadd2wi6NMzWTOpJAzhlVaN6DoR04mYAJ2bAGZQ1
	GMTNWS3L3aHmWtsJTsjjn8pTL7S/JiEagwDi3oIDAKlHgYD3GPCwIZ/Eh8yoxlgmDOSVLj6zXg9
	HZTWpaTvJMOpEPQCGRe7ooOzW0a6KiERAj0JwVOKxV+q34+CXR2U5lFtD1BxaGUezbQ==
X-Gm-Gg: AeBDietQFRgM3MwmIOrkfFHqRvUO11qT+ENd0n/xdiU5+kkKNUU0EgizIAEPRbCDUug
	lIS+DrvboH6Dgq+5rSH5NibF/nduH3JhHKw3RXMV19meNqJmCUxBNDUUyhUkS/gD+rXmqZ2JaGt
	wrCSla/EksGELRNCQlfNI44i72/3UVqpSMdATaBwJ81QBMJ+QsO2baaDq4g/k+bqOYYZpGiq+OJ
	aKm27TYdyNU5r0+ueSrLxZluPlaKknUFM3hLDyhrqZZVkbtSt2wmw16595T5NvV0BpiwKIT8rFg
	jpGljrEZkmuxrcswiWP9fZhcupw45q+3tQrzzlAZRLMB7gM5qoTzC73QEXA1LC5mcvynBSlujoa
	/7WK1Ac0iepEIHb4AR7UpPO4JrViGpmA7EsHDXnSjpYWWWTiAwUJPkQULo7tryacFPen4X/pO31
	GbYX8VcxhbERe1t4wScOTOjWQfHnfRCvmpfruCn0qNuKkIGw==
X-Received: by 2002:a05:622a:8c3:b0:50e:5f71:62c3 with SMTP id d75a77b69052e-514621dffb4mr72549851cf.42.1778116257875;
        Wed, 06 May 2026 18:10:57 -0700 (PDT)
X-Received: by 2002:a05:622a:8c3:b0:50e:5f71:62c3 with SMTP id d75a77b69052e-514621dffb4mr72549571cf.42.1778116257381;
        Wed, 06 May 2026 18:10:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230e00sm5221967e87.29.2026.05.06.18.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 18:10:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 04:10:43 +0300
Subject: [PATCH v5 4/7] media: iris: don't specify ubwc_swizzle in the
 source code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ubwc-v5-4-e9a3aee53c49@oss.qualcomm.com>
References: <20260507-iris-ubwc-v5-0-e9a3aee53c49@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ubwc-v5-0-e9a3aee53c49@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3286;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=I0GJCkT+M6rzwScGE2nHMtdPm0YonKxq+nwx5NI6V5w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp++aUre/t8KcqA8iF+dzqb+jfk/P8fCGpcHh7W
 c5lxfHndMuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafvmlAAKCRCLPIo+Aiko
 1UoYB/41Mkd8BxBKnEtCaBmmwKRaMk4FvBk76Ws1YkAM3GZrAKe0YKnb/jjPIlYaH4GpR2e7wCN
 ixdSauHYdi4wtG4DvNdbgZkamw85A+9na54K8GHb1GUMfGRY6xcMCkncYQMuBT5UViYaJbuUGex
 ihdOveqy8QvS+aYovcZEgGtOi1MR3NuoUYpM4Xzeku1DAR9IbdBSn4Xj0bnTcI3L67jxLbHsUeA
 6yT/FtTn/iWyQHimRgjxs3JXY+a8OWpC7rCnQ1kXz/aXZk02k6IHjPnCci3csjR7jZCTBawMuBj
 oBPNIBwYKCj2Nu+nTLRrnLg7YEcnH68dwwc7qLkvxpnl5r2L
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=YYCNIQRf c=1 sm=1 tr=0 ts=69fbe6a3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=4H5-pPW84uT1T8hsIVgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDAwOSBTYWx0ZWRfXy2D3+lMlYvXx
 trIin5lEJekFI3u57oanYlNCSydjU22vdUu7SJPZeXdmS3Iv9FtSBfeEHo9bMAGf+jbDiwdvTL1
 Fd+4seuwrfja6EJYChwosO4sIWlG3q6icQD9H3EJC1wGX+ajqkVmY8qZmxevTBfM44Nxw/fbakE
 oPfuolAdFgj064h37xmPlNpRf0zwGmRN78YoqB5CIhCNoLiyoclrYS4Dt9aqpzrCg20/KCp7/8v
 Md+vPocXG2z/1CzcXP2+wU+OH2yIubeRi7WgsiD4Q6/Fx5gVkhfRqcp//1K7bAWkHBejHgAn2el
 aCKvboioeQm/5HsGSZ/dU6l+5DBlRq04PQ1FtRzkOnrD5cVR+kqgiaFdyO9DkQUKbVo2qCuHjLF
 BJ1zrdZJXQtbiJhL1/Bn5stmAJ/Vhp3c4tzNAjoMKuZIlV+lf9UYE8cTzdcRMe2PIf/jy1Ac85A
 j9PhzTnt3GweJb3nPLQ==
X-Proofpoint-ORIG-GUID: DTHDAxiaPwUPR2gMKOYEZUANEyYfiPsu
X-Proofpoint-GUID: DTHDAxiaPwUPR2gMKOYEZUANEyYfiPsu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070009
X-Rspamd-Queue-Id: 02F374E1DFC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60695-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The UBWC swizzle is specified both in the Iris driver and in the
platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 6 +++---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 3 ---
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 3 ---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 6dc0cbaa9c19..a4d9efdbb43b 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -170,7 +170,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swzl_level;
+	payload = !!(qcom_ubwc_swizzle(ubwc) & UBWC_SWIZZLE_ENABLE_LVL1);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL1,
 				    HFI_HOST_FLAGS_NONE,
@@ -180,7 +180,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swz2_level;
+	payload = !!(qcom_ubwc_swizzle(ubwc) & UBWC_SWIZZLE_ENABLE_LVL2);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL2,
 				    HFI_HOST_FLAGS_NONE,
@@ -190,7 +190,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swz3_level;
+	payload = !!(qcom_ubwc_swizzle(ubwc) & UBWC_SWIZZLE_ENABLE_LVL3);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL3,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5639eb5a75b6..e217f15ef028 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -77,9 +77,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	bank_swzl_level;
-	u32	bank_swz2_level;
-	u32	bank_swz3_level;
 	u32	bank_spreading;
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index bdeb92e0b7bc..8072f430bd26 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -792,9 +792,6 @@ static const char * const sm8550_opp_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.bank_swzl_level = 0,
-	.bank_swz2_level = 1,
-	.bank_swz3_level = 1,
 	.bank_spreading = 1,
 };
 

-- 
2.47.3


