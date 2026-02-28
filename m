Return-Path: <linux-media+bounces-53815-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLuJMWSnomkK4wQAu9opvQ
	(envelope-from <linux-media+bounces-53815-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:29:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 650351C1603
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43616306A3A9
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 08:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB4C2C030E;
	Sat, 28 Feb 2026 08:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RE9xrM5x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="amz6iI4i"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1203D902F
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772267340; cv=none; b=l5euYV2ONeYi4e4icr4+X4pjFKRDbons+hymazhGM1qp3/WQvfSrKi9KDr5Jj1Jtr/ExXtgza1VHHiTt3UhBptSoJ8jnP+1zApwPH4P0xZ3BZqNAjyDrLM+kj9EvKOQOzGbSIIouPB7DuFAoOmNdAecG3+QMu2zdr0dE4+l+ZF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772267340; c=relaxed/simple;
	bh=cozHaXyel6vCnb2b5CRPNm/bE4FmckiolWb20IIUyEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ViT4MRD7YjbhTd2h0YUKnvaq7RlqIw+Np81dxxi2Pknm+oq5GM9XiwCadulcUcN8W0Lc18qyxqWgANFqYb5WxyeGybniRl3/3t2chP4Q5ME1Brjnu/N2nkWSmM6a8yXE1OLBweU1WA/hsD+LKxrk+Z1Bf9BnrjRYg8DHKRUaRD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RE9xrM5x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=amz6iI4i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S6NZE52377032
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5zBOTIVuC5vt+qq5eN9os89kcIjnyYdPrkuDKQfByL0=; b=RE9xrM5xH3mtaEG6
	kp99a3RhcseAozufv6MoEpaZmKyqYy6p64d+Wy0DeESUQD1PwETGMdi9z+/nJiu3
	yJnGdfRGSwSRND3l8FLReFXpnmVd9evTu+PX4geJfRx7AVjoVPfVaXyZcGBGO5vv
	zoKEnbfc63K2PrYuD73jQRMw/P9p9mp6X86xQaCqQIXSuOklA/CqsyizNesZHFxF
	paTLzBb0DqoY+rwSi8ij5Ylb31QFtCSff49Gvty3wHJYipCo1V3c5u41/anFAmkG
	ckTtBQr24d2uAR5H7wNdptD29RWCUDyK9XJxsiqQSCugyQ/5Ra5TBIcjfjqd/tlD
	x7n/hQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshd0j57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:28:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cbb8040f48so2534821685a.0
        for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 00:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772267337; x=1772872137; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zBOTIVuC5vt+qq5eN9os89kcIjnyYdPrkuDKQfByL0=;
        b=amz6iI4iPn1SwgoMRyZ56O3WUKKivtsSCqGA3OxQha+SR3dCRotzBqbOLv4IKPhu+s
         vJ05uYRHxt6QHiMGadl37s0AoR9TwzVtmKrY450fcpN3g3/UjL01uawCyrC6XpA2PqKU
         HJ05VrAfmM+TSw6BginqkrDiQq0V+ybrPUa1mD2kWJGAEUW3ONhqEF91cj1xNhC3qc9d
         vksjRy4kE5rEQwt7B8rCoZ9AP340K9t8MN2yOTyHtbosaa60q9GZNFkxpbM341azZHXT
         1F9Th/g3b+WuA5NB9l4RAsH7Tt5IFJIOzFQfak2OoRdL4N7caU2BTucvKzORuQlExJVh
         toGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772267337; x=1772872137;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5zBOTIVuC5vt+qq5eN9os89kcIjnyYdPrkuDKQfByL0=;
        b=aJGMyAJeTlkxGtKW3C95KbqailXE3ZpXwjGWdky2whXeqMMXInG1pMHQZhJTNXzJrF
         pmRyMmkMdJ57YRUMe02oRLUSd+iPozFloPUnPDsI8oiLJrLuj/SM6uVr+b/SaHaXvL2d
         Gej6iWggx16uzgHVdKDn6CZJtGW1MSgj6HN21Pailsu3stHr8xVHovoYfa3BBtoPROX0
         soW2186JPo3AmV0F0vx5HvAfqVXCMJ6o03D+KrL8B/svZshJUpGMS+Fj5JnAdWsQ+fIP
         L4R0XiPhVQWTJ/fR5h4O3V8U7k7QJ4YKW+P1wIK85PSuctLBuHyAk4WT/jKvblfzWjPG
         c1aA==
X-Gm-Message-State: AOJu0Yzx+d41tWc+QSBcJc+fgYM5JCkFnSEA6jHsGyeirOZdTn5x7C7L
	0ev6EFRw1eu7c8lqKVcj/4a8SnGUkVeNuWtLdAosb6Dw3cpuUxE46VtftBH9rqxShPj/iJErE1o
	D62qtNHG7Cwv3VQ1y8HKx4vds812HiIgR1zsugt/GxR5UBTBweW44FI/x2kZcSuQ/vA==
X-Gm-Gg: ATEYQzzyh17vrv6QO/7vH1syW9YuIY6HnCRrC9RedX4Kps2Fd1pdJBSjKY3p1ZDXYMm
	bQVY31B1tIFxUWck9DGL/boV9nJ30J1DYpKld2xilO591HnszJgA8vEz9ME7wHg6QIynrFTjNQ+
	JK/atgtrXPEHsP0wjRvWyg5MCXHsUtMD9JGOJUJ63hG3i9+XQpsyCyvKSVPbWENTQfjb3+FglEI
	hZDHp4w9of+BekREF7yz7AS/SqSjpql0X4ljgPTotohoLmGQLw5hQ+KXz1tHD8Xsx881w2EcTSd
	i79Ilfa0h3X6F4y3WE9yb3UcZR5L3cbe00VQSmvfkFMYzgkjDNKdYxpy17Nz+bNn3xgYXCQfyoN
	gbeBU6qikiij2jW0C0xCxpU8gG5AFtfQmi+PwB+jQs1gOuh/zXQmmt0VO83L7heOUgOrI+TyvNi
	A+aRNM54pRXl0fgPTWbczdoQtWa6Nh8z9hsmQ=
X-Received: by 2002:a05:620a:2945:b0:8ca:fe5c:ea6d with SMTP id af79cd13be357-8cbc8e747afmr699132485a.59.1772267337470;
        Sat, 28 Feb 2026 00:28:57 -0800 (PST)
X-Received: by 2002:a05:620a:2945:b0:8ca:fe5c:ea6d with SMTP id af79cd13be357-8cbc8e747afmr699131585a.59.1772267337020;
        Sat, 28 Feb 2026 00:28:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2f4b158sm17970711fa.6.2026.02.28.00.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 00:28:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 10:28:47 +0200
Subject: [PATCH 02/11] media: qcom: iris: extract common
 set_preset_registers function
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-iris-platform-data-v1-2-c2c53539f948@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5636;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cozHaXyel6vCnb2b5CRPNm/bE4FmckiolWb20IIUyEw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpoqc/7tzem7tgMigNx8zMPYdeX4rmL3itFyb59
 WgpclI5gJOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaKnPwAKCRCLPIo+Aiko
 1Ye4B/9m4Nhvw1os+48NDmVIfU9zvgh0vomL+eNtZVMkEVOSmDxbnnO3dBoVZ7xQ/d1u9Z/dIfE
 ztsAC9EJEUEhEkMlhlU+JPFmX1W+4wh5MkvdZilhQL2KPxntkeVALQDvt7mOzXl0CUD51E6bkiw
 Ys21HFpfxMwt5Y78I51ZUZEzWQodJoJ4Ab60bS3IZ+LNpozYdXHtp+qZ9W9kcxU7NeGbjyqARic
 3wd3Hazqpd7hBQ9hkpssQz3O3B9+5/rBwe+Va7e9d2nmvURHpO09j1IW7hFU4hfVeTBviabgQAW
 fEgAgjxsKrVQv0zBKop1O0x/E/Y+MBz8PyqSYZ3Y0Kn0571+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA3NyBTYWx0ZWRfX8/aoF8budC5a
 10SHEC2nzbetbiaTq3koN1vR9d4qNEh8bODgTcV0eRaTOX/MayDrthtUBRccUOx9V/t+xHykaNr
 AnjUflbC/oBEINNqYnvfiT3306/chQmC+lk7ojrbx89uhEzMYvIPDVGdwvXkXwjxMY02YsbU+JN
 fsDrtIN67FTAyqpVo0gWouc9Lj6D0a/kXoU+0Yk+ZWZWABGe131fSvSWUAadqE9Cb6rBj/DRSMP
 Ny9vltH+htNYGy6cHZibWrVSIYrYBB8KhEy5tzRUrsiUgmGdMdi9HOOeqqnb1OzP9tyCQb8pCev
 gttXCtuFIca6IYqCgBtfmxNHWyUpO8EoV80nxWq4gU+gO8PPcuD/SvkZNluBcwzo25+dVv08rJF
 Vn94ULjDdXgA7Scujgxn6UCGMCsxTSbcvnDSwYp7Dd71VmWwQxm9wbdhphzdHAo0Wsyepd/NOKx
 QGrBywpUM9fv0Bl4/Xw==
X-Proofpoint-ORIG-GUID: 859hnQxSUbEcryUBvgetQXIidDxWlDsH
X-Proofpoint-GUID: 859hnQxSUbEcryUBvgetQXIidDxWlDsH
X-Authority-Analysis: v=2.4 cv=COYnnBrD c=1 sm=1 tr=0 ts=69a2a74a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=h-rriOPNHJBWU_5FlFgA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53815-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 650351C1603
X-Rspamd-Action: no action

The set_preset_registers is (currently) common to all supported devices.
Extract it to a iris_vpu_common.c

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_gen1.c |  9 ++-------
 drivers/media/platform/qcom/iris/iris_platform_gen2.c | 13 ++++---------
 drivers/media/platform/qcom/iris/iris_vpu_common.c    |  5 +++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h    |  2 ++
 4 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 1bbdefc48d71..a3eebcacba7b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -260,11 +260,6 @@ static struct platform_inst_caps platform_inst_cap_sm8250 = {
 	.max_operating_rate = MAXIMUM_FPS,
 };
 
-static void iris_set_sm8250_preset_registers(struct iris_core *core)
-{
-	writel(0x0, core->reg_base + 0xB0088);
-}
-
 static const struct icc_info sm8250_icc_table[] = {
 	{ "cpu-cfg",    1000, 1000     },
 	{ "video-mem",  1000, 15000000 },
@@ -343,7 +338,7 @@ const struct iris_platform_data sm8250_data = {
 	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
-	.set_preset_registers = iris_set_sm8250_preset_registers,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 	.icc_tbl = sm8250_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
 	.clk_rst_tbl = sm8250_clk_reset_table,
@@ -397,7 +392,7 @@ const struct iris_platform_data sc7280_data = {
 	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
-	.set_preset_registers = iris_set_sm8250_preset_registers,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 	.icc_tbl = sm8250_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
 	.bw_tbl_dec = sc7280_bw_table_dec,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 1f23ddb972f0..f8754451ac18 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -756,11 +756,6 @@ static struct platform_inst_caps platform_inst_cap_sm8550 = {
 	.max_operating_rate = MAXIMUM_FPS,
 };
 
-static void iris_set_sm8550_preset_registers(struct iris_core *core)
-{
-	writel(0x0, core->reg_base + 0xB0088);
-}
-
 static const struct icc_info sm8550_icc_table[] = {
 	{ "cpu-cfg",    1000, 1000     },
 	{ "video-mem",  1000, 15000000 },
@@ -917,7 +912,7 @@ const struct iris_platform_data sm8550_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8550_clk_reset_table,
@@ -1018,7 +1013,7 @@ const struct iris_platform_data sm8650_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu33_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8650_clk_reset_table,
@@ -1114,7 +1109,7 @@ const struct iris_platform_data sm8750_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu35_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8750_clk_reset_table,
@@ -1212,7 +1207,7 @@ const struct iris_platform_data qcs8300_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8550_clk_reset_table,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 548e5f1727fd..e07e47dc9977 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -485,3 +485,8 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	return ret;
 }
+
+void iris_vpu_set_preset_registers(struct iris_core *core)
+{
+	writel(0x0, core->reg_base + 0xb0088);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index f6dffc613b82..07728c4c72b6 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -39,4 +39,6 @@ int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core);
 void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);
 u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size);
 
+void iris_vpu_set_preset_registers(struct iris_core *core);
+
 #endif

-- 
2.47.3


