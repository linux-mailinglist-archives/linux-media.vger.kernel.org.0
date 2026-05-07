Return-Path: <linux-media+bounces-60728-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEojE4k1/GmNMgAAu9opvQ
	(envelope-from <linux-media+bounces-60728-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 08:47:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B98F64E3AD1
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 08:47:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AC913079081
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 06:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F7B634CFC6;
	Thu,  7 May 2026 06:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDn7cQW2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jaf9cUiC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C81734029E
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 06:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136150; cv=none; b=ou8nOcaSrZi5bCh3++/5zLteMT9Yx+BRgChFhpMx05ki0jjkQYzdJYDdIahul4fxU76khQWD+75xE2Quv/boof7bdGbl0vAtBuOsNRhsJpzYBK2bEL/eVsm3vSdbKqK1XqYoF4cJWjIlAm+YiIU9DGYr9z2psK5iTpD9jS6DiF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136150; c=relaxed/simple;
	bh=ZdJc8AvhriTsIRcOHzN5auyXn7ecjHGNn9BjFnnyB7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O/jgHPFeRoCy85Jj4tBKYSmCgjn1WjWopQfqqJSMKQD3RY6cay8aKKwJuk4ovYsAj3Xpwvj598JHq3uJcdXvk+Gcy93/VuP8s+zdpCYrOEzLNrY01wC34W4KP7rix8PG3Y2q+KGrJyjNnl4YMne1l85NsjvGGaAaCP5QvlORnNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDn7cQW2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jaf9cUiC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6473eAPS1669566
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 06:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n5CVd+ehIx8O41kke6U0UyyBtCCOo+HF2cSNN8xWxJs=; b=lDn7cQW2+43TLeNw
	0N7OZZTznVc4j/mU+LaQ7W4TmA5OLyJ0/sYsBNRJMeb2PHu7ImicMzhC8+rZ75zZ
	YsktBvSpTrfJ5Dv72v6hjy7EsBiipILe52UFYfseW+gN8jE2fBgzaXk5QaPDACJg
	9koDw3bKJi2fvAQUW/6IEeboegxJO1ydAxESs7Y7JJcvDrdCgYDqwnN6Fkhs7p2l
	fJpk4ukXcEUqGOLE4KnpXhfEkUCs7tiHC9O6fq5Ih4Dv/tW2ThmlEvbKR48EaHwk
	DRIgU0qvEc1LjMOenmSJzmVnXz56c3xDgR/Z3N0xjnRgIP6xIjVD4UGiKNVCS345
	n9Othw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1p0j8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 06:42:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb6d713ddso8131701cf.1
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 23:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778136146; x=1778740946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5CVd+ehIx8O41kke6U0UyyBtCCOo+HF2cSNN8xWxJs=;
        b=Jaf9cUiCaDvTLe8PRMu7SnvV56Mxd3rQCj6+otsv6uyiWpxqM5NqZX/YVM37kGJu0X
         KL48PPUE1yxJH8lspc8CpNj391p8vkaRoO4GbzoHlLCQr2YLhGbhAB6QTS4NYPIFYB5v
         VOFlZfi1Bfnguaobh/+WFCC4Ggj5xMYMOH5yRcE7qRV6lBZ36Bz0htK+sFkAXmesyCyc
         cZuDSIv1RFrIr6iv8iWikICZf7AO/IBvzwyNgGl1styVVUoeyZmzTyuNpc2AnEsBSk60
         zNWcctdBIGLjNjXQzwNu5jTa4M+lzrhpoYDiQKtj5wCUiBTSp4EvdlZA8QB+JMhKpzoV
         FFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778136146; x=1778740946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n5CVd+ehIx8O41kke6U0UyyBtCCOo+HF2cSNN8xWxJs=;
        b=BsZRjWnMlo+CdwowUAtViZ1kpxu0n+j88LTi2ig+FLejgBDczgAZpnNWaFWzvwSLMn
         BK8aAjBP7ppWoujEc8I7jGBWpCjSTE/LkDhTYIWepIopeMbzBoM490Ok0XNrYHAbonvn
         F3RevuzQG6eh96CT1hW01i8NqFqtNYztyQ8GtDKVN48WvrwkLET8cPrIeYgd9Bbrzmws
         3kpkGffE8OGb6KNlbRMfUZd5frR/K9ZEtrK/7fFg6+lWeF1i8krn1RWVyr064W/vt9Pi
         pGO+YdRlsj8790onvqvPfzUPJLcg5xxup6stPGNR9bgWsojw21QCI29k1p5eQuSNA7E5
         RUzw==
X-Gm-Message-State: AOJu0Yzsx8cqx7zJ9dpF5wJ1lJkHh7I+9nV+YCwPrxIbd93Ro9z7V1jq
	KufRTCYdPsv6ET2oC3O/jrJ7t/eQpKHWwRBnvKVsWyYEHEDFVJaNC0SJEz01CZs2ata241t6W+x
	jm0yPqJklkplZkVHgp2tsd7lJZoP/gBTMO9elNr9YGikDG67ktllWuAGZuwFhB/rguA==
X-Gm-Gg: AeBDiesQBTZm/X/rClXmUA5698PMp5bjjJETYQxBc6gQj0RuU801j+PRzrKLB1xdtPO
	D1pfI/+Zr41UJ3afVtkh4gmg/IXs3WkRchS/QbYPhqmzJac3Ep2qfX4t6JRGYd2d1n8qrYvcI1T
	owG7Y/aLR9+fiYpywk9zljMFFVteVkE6c3FH+Q0DWWovfPCS/BDflt+9d2mbBb2hQMl6+yCPNJO
	RnD7CzHOou4mZmZCp2EVZSDVOPVVf+0jERceRo2EptYCdwCT5206IbYqAdmDtXrlB6g8tuzRccW
	JtpZO9K5LiIpEh6jM12n2oULb+HV+7buh26nopKBDj1uvdIIAOHxHFVZTPWRkSDu5YA+YiT+VOY
	a/zfIGZ49GQye1cM0INh+A1OnGlLuuJMZov9tcwS1oA2Ek2r+gcJm3VX7Pi+4wN/rJQAA0n75YJ
	7EuTWH2Q+WagE0P/z0DdSNIa053OMottWpHZRu9rZ8vPor/g==
X-Received: by 2002:a05:622a:6096:b0:50b:4b3c:7554 with SMTP id d75a77b69052e-51461be0cbcmr92212411cf.10.1778136146416;
        Wed, 06 May 2026 23:42:26 -0700 (PDT)
X-Received: by 2002:a05:622a:6096:b0:50b:4b3c:7554 with SMTP id d75a77b69052e-51461be0cbcmr92212121cf.10.1778136145990;
        Wed, 06 May 2026 23:42:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8722c2d43sm3334694e87.40.2026.05.06.23.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:42:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 09:42:07 +0300
Subject: [PATCH 07/16] media: iris: Add platform flag for instantaneous
 bandwidth voting
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ar50lt-v1-7-d22cccedc3e2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4928;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zj24yvnYxl+X+T0YGve2kbEBRN+/OwMEw/Rc6DepK9c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DQ+O6y2ErTklv3WQVCfGPPv6sVS5EZ4DiBIr
 gLa0VTWoPaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw0PgAKCRCLPIo+Aiko
 1T74CACAxzhPNdSlvc/RIF7/l3ZLZ2yT13zNhMFIr92Azks21y2sy2Rzwse/nNCb+qiiOZg8Pqo
 PXArCCacGNbr9iKAiuVtbtxwH5/MfUsKXkmMvQ+VZQxk15DEOP+Wp+yv1GIEANK7+zfRFkA7qol
 QNgtMTycw7Cfti5XsAYKrmThvgLawgLKvpUVoIMcvrqKJocb2wythJC14z/0Rtrg1ZkuojASBF4
 5ZDajfS15y12wti+yFMpQFSfZ9BrTKovWHpdMF2sd1KZWbuTnhN8u59m/U4YPfxkpjc+d78ZiHt
 9GTQNRJ0XL6Y3xskjUH1uhALtgg43VNwtOdPyI/7IW3Chq4j
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MyBTYWx0ZWRfX2oIZ+9+QV5+X
 AWD00HCuw4dhvd6Ar/rLJLJlBXBIz3m8Ew8qB53aqFEEs74Hw4M8ZgtBjVDmojOP2UyVpltzSS4
 vxOt6gQjIRhsXEn3z+B77Xuxgq4E1tEtItlSovwidjX7I4iE+ynmx4P8fuLPyCRRhsINPv+XvJV
 1WEyKsv/HPVAorLzr4tswq+pkajy1jfAKxQWDFeasGKXdbemy28d3DEybsAzw8cPnhh8RvED6jW
 2pRB1dA4fg/8gi5J87retQ9W0eNqGUWa5W1YLbYPKNP/anSXAtInQEuIxj/S+rl2KOHUFbyuX+8
 mH+Tnjk5IGE842hBn9sX9PG9Q0bdus0bZkCzBrGAbjRA1/RxN3H2+vU98fXxL9y6TE9254M3K9z
 RGjdPr0Vq2dZMQ8wOr0+3liBq8F+QCleEM9JrU77N521eEPSjvPUyFsXX1J2gHcoMqCzn/lsdau
 ntElMcXx1/sQYhkQvlA==
X-Proofpoint-GUID: 0FXVrvjfJsGWHTbAMcfjfKgoJWWbb90p
X-Proofpoint-ORIG-GUID: 0FXVrvjfJsGWHTbAMcfjfKgoJWWbb90p
X-Authority-Analysis: v=2.4 cv=K4IS2SWI c=1 sm=1 tr=0 ts=69fc3453 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=hZPXDZ8rEFHKWOVG6IQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070063
X-Rspamd-Queue-Id: B98F64E3AD1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-60728-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,60fps:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

AR50LT require explicit instantaneous bandwidth (IB) voting in addition
to average bandwidth (AB) when configuring interconnect QoS. This
requirement is due to QSB (Qualcomm System Bus) 128b to
QNS ( Qualcomm Network Switch) 256b conversion at video noc in AR50LT
which is not needed for other IRIS cores.

In preparation of adding support for AR50LT core, introduce
platform-configurable IB multiplier and enable IB voting for all SoCs.
Existing platforms default to IB == AB, while AR50LT requires 2x peak
bandwidth.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 +
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c   | 2 ++
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c  | 4 ++++
 drivers/media/platform/qcom/iris/iris_resources.c       | 2 ++
 4 files changed, 9 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 51d8faf6fd1a..e1dc226066c1 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -284,6 +284,7 @@ struct iris_platform_data {
 	u32 num_vpp_pipe;
 	bool no_aon;
 	u32 wd_intr_mask;
+	u32 icc_ib_multiplier;
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 238c7b17ed4f..c7e6550e964a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -97,6 +97,7 @@ const struct iris_platform_data sc7280_data = {
 	.num_vpp_pipe = 1,
 	.no_aon = true,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
 	/* max spec for SC7280 is 4096x2176@60fps */
@@ -128,6 +129,7 @@ const struct iris_platform_data sm8250_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 6e63f279efbe..9cd438939e53 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -109,6 +109,7 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 2,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
@@ -139,6 +140,7 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -177,6 +179,7 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -207,6 +210,7 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a..caeaf199cef7 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -18,6 +18,7 @@
 
 int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
 {
+	u32 icc_ib_multiplier = core->iris_platform_data->icc_ib_multiplier;
 	unsigned long bw_kbps = 0, bw_prev = 0;
 	const struct icc_info *icc_tbl;
 	int ret = 0, i;
@@ -36,6 +37,7 @@ int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
 				return ret;
 
 			core->icc_tbl[i].avg_bw = bw_kbps;
+			core->icc_tbl[i].peak_bw = bw_kbps * icc_ib_multiplier;
 
 			core->power.icc_bw = bw_kbps;
 			break;

-- 
2.47.3


