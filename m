Return-Path: <linux-media+bounces-60063-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MlQNc4082nvyQEAu9opvQ
	(envelope-from <linux-media+bounces-60063-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 12:54:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6C44A112B
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 12:54:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 19013300B46A
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 10:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 900663B4EB0;
	Thu, 30 Apr 2026 10:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="anWNTmEu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nzp4Zo57"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E223B3BEC
	for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 10:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777546437; cv=none; b=YK1RcCPPfedh1+00mxssshAHtQt9RVHmz0XUZGMeSYlkxW5ZarrmnFy3kUitEumMsEwoQ2prQU/IPnE4fItwd0HvpGWuituN/YmZhSbm1vRT4VEv+veoefebck9/J6Mdu6pGMUz/cHjFOpzTAuT4d6+6N2FGjwV1LD2tYnn1JaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777546437; c=relaxed/simple;
	bh=kYdI5l4GBJqpYn6R+hCQX/thjSx8hd591kFqo8rU/Ao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=suIkbYiLqjHHlRInFIV/cLyBB/FHq60Q/ugdrKc9ZZgKPVghHmBrVVlm6J6xOo9bJgMXiKTxlNlUVfxukRy91mRZ7+ai+/uqE12pZ4pR1TsrLaDHlqUoBpbNGiAuar1pHn1SKAUc6MUKsZonqIqEs1IKJKcVi7oZ31mFBrnJ4P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=anWNTmEu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nzp4Zo57; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UANrsp1277700
	for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 10:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VvQoY5V0MZI8XGYTkLu2HUsdKc19JDiJ99j4fREKgB0=; b=anWNTmEuJ1B9AugJ
	Z0a6hWJFWmn8nIzaeD5P5rEXiS+JQhHdnlnwWtIOOh8BkmZcoJnWqgghu3nXguDy
	mXGMLDLCUZsVdNqWrpVcIYLxr+A/pXPfB7Rt52yUfv8uMXLPTNmf25qaEGb0dMMU
	Nijqiu86J8vMBcw/eCaZYrW/sibQj2Sl/JOX76S9oBvfjr7+sKOBgsXFWbYmk5f1
	3xgDmi0Lmz1RG1/K26tWl0e2lX40oqD8UnbQX+ZdQYU7R6QYYPBXasjNTm0WFGzY
	BQU26w+Tj6aa0l0rEtFjQ8ny38bx0U9MUObfiE48mTJ/W+7leD83AWIyT45zmjIO
	GbMfHQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv2cq0w3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 10:53:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b9a6d84522so6740275ad.2
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 03:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777546420; x=1778151220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VvQoY5V0MZI8XGYTkLu2HUsdKc19JDiJ99j4fREKgB0=;
        b=Nzp4Zo578sWAv3nqvSrHU0s/2Kqa2B/eIKe11+MdBmZr3sQcWqHE6bF3998kzvDkSa
         Lyka2dmohbmgmENC5MaVoKBezVxrGqnivEnrQFnIfUbPbc16vINGAA61kdH0bQYBycDD
         uhsjmCaJKrkstYFW6PIHkEq+IX3ai4HBbWAPuAPVb8x4sxQdnNLbjbAjDr99Wf+37DJl
         Mz0LNyAOxXHmQ2NeYQhx0O63QKgkjgxTB428TxWh8wwC7HWKfDq697W7egYS92XAhakv
         uYc9NRoQ63su5m8lyiroGULMm8kqnkgGMAMnQL2ekuZcZJ6/sU5OgjMzmJch/+X6on0/
         7Vfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777546420; x=1778151220;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VvQoY5V0MZI8XGYTkLu2HUsdKc19JDiJ99j4fREKgB0=;
        b=gkZgasKgEqknW1CLoKscAJPjbuUOUfQaWAm89eh0AMZYSim2DEc1Aa1Wly7/5IyfxE
         dSRUEfcHNoUg6nhkKR/cmgZK3GeHAPt3dAwtqhAjiDlTqo5zLma8G+TTtdrEu6BVh6QI
         4pdaJj4aR2tMFy/lcUtvRb5zcu6ZHRCKJn2vVSxsuCSRvprNNPnLCbKcA0JkPFdBF03w
         5FN0EZwOHnPvFpVGlsBxULo0tsyFzLRK7kPAsLWlCkGas3dXdWOS/g69v8GxzNHc2BW3
         ozYy/QOjXgr4sPZKy1kntrtM/Ekpwl77z65fJP04c/PPu2yoDdiuTgrSOcBoGCSsHzvw
         zidQ==
X-Gm-Message-State: AOJu0YyM0iVKHLtNW6oR052zvLyRQ5g0C2x1YPCjcoo1NEuVz0tEuzb1
	M/w2XnBzUpPAXNelb93MwQ7uw+6sUm1VGKNjXqztOQ10h863ZlbjlDiXyw/KqYCwAOIH3kqLi+T
	jVThaaAJtv7TdYEGa3NksDTFfK5Q4WYEjnyH4P1ksHe8TxUoJLT3iWqvKwFDg9NasZQ==
X-Gm-Gg: AeBDiesxIkwscXVvF0wf7lrbLtOMnr0dIY/9cwj0Y8wuuXJ9R9T0pXYeHEgpMAc8eEX
	ItsuKR7XzXyv/douK27IJQ+2IHxS8TpfMwT0wl6tBIJ+Y2HVtJfmHCU5XJ1e5Pz/ZtH3uu/yGbD
	AG4HrYvSW2FvtiXBWbmXnJvT6YSWM2XCsASSHt35HcglL5PPbWsu9dzuJeqRs9IlkIbIY7c9lV0
	Mz1EyP2ALo2a31hJ4q/KT+vEqGEsi8cDrWpgViDpWzpkE7h0Ymy8MiRwMADxweHi05jJ4f17PJj
	sIgCU2Ysi7rUA7V+VJQI/v9wP4CqvqOpEknUaND2uAdRjcnaLR8aAj4Bg79LEqNl98ogaXJ+G3g
	zeTIqqdrUuaEjD7ybyWtiulGxFPcV3bb1HG+Srx0uxdMLRL29Fjn+3PKh5/qJlyE=
X-Received: by 2002:a17:903:368c:b0:2b7:88f9:9c3d with SMTP id d9443c01a7336-2b9a232f847mr17204925ad.12.1777546419683;
        Thu, 30 Apr 2026 03:53:39 -0700 (PDT)
X-Received: by 2002:a17:903:368c:b0:2b7:88f9:9c3d with SMTP id d9443c01a7336-2b9a232f847mr17204605ad.12.1777546419204;
        Thu, 30 Apr 2026 03:53:39 -0700 (PDT)
Received: from [10.0.0.4] ([106.222.229.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98893f3e2sm61448125ad.38.2026.04.30.03.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 03:53:38 -0700 (PDT)
Message-ID: <09969567-b791-2502-4028-46cae13db3d0@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 16:23:33 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 3/5] media: iris: Add platform data for X1P42100
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260429-enable_iris_on_purwa-v5-0-438fa96da248@oss.qualcomm.com>
 <20260429-enable_iris_on_purwa-v5-3-438fa96da248@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260429-enable_iris_on_purwa-v5-3-438fa96da248@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: P90lV-pgSzlDJNLoyA-FAATImvrLM9hK
X-Authority-Analysis: v=2.4 cv=aYRRWxot c=1 sm=1 tr=0 ts=69f334c2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=sQGdqEwRzC/zEhaLYLcr+w==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_kvchVDP8_-l7kQr3B0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDExMCBTYWx0ZWRfX4/h5Z23V2pnH
 EzrAKzb1wgBXO3+rLpNegbX/+JZnXgbQNXe6t0ubcKE3mQlDkgoz/DNKMKjQkWpPETmEWSHWCt+
 nqiBkXWsNVLrzY8QHmKOZYDZso7TPY92bqEySq/Tz1VScxoY2h6ZAHAuTsIcRgP2B72Gysd6SnT
 8etUZO/uJz9Fr4uGJWeQYz/PIFkd/RrBliSDdCSpxl7QkPIgK5qhkRKADhFXfYzLmNCCzIGdOZO
 9hJ3pQQRZX+j37/ZhJOefR4nRe2qNcRLybgH8NZg+7Imn4hFxwyO2kyy9dX4JvTYC48HDlZk0eb
 ZZmp/uCN0JES+yHWkJ+P52KMHel0R2aepIlbgAVj/eTWYLgsKUfLmD5UpLoJ9ccjppadnhpfG9c
 jUUnG5UH6snKi3q/0v+FtA48TfUZjDQi/rJU/NnPIa9BIlt2Mu1TmoCXfuOn8LTkfRC/rz5wntZ
 RLRXUTP80WxyhKtF75Q==
X-Proofpoint-ORIG-GUID: P90lV-pgSzlDJNLoyA-FAATImvrLM9hK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300110
X-Rspamd-Queue-Id: 7B6C44A112B
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-60063-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/29/2026 1:13 PM, Wangao Wang wrote:
> Introduce platform data for X1P42100, derived from SM8550 but using a
> different clock configuration and a dedicated OPP setup.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 97 ++++++++++++++++++++++
>  .../platform/qcom/iris/iris_platform_x1p42100.h    | 22 +++++
>  drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
>  4 files changed, 124 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 5a489917580eb10022fdcb52f7321a915e8b239d..2e97360ddcd56a4b61fb296782b0c914b6154784 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -47,6 +47,7 @@ extern const struct iris_platform_data sm8250_data;
>  extern const struct iris_platform_data sm8550_data;
>  extern const struct iris_platform_data sm8650_data;
>  extern const struct iris_platform_data sm8750_data;
> +extern const struct iris_platform_data x1p42100_data;
>  
>  enum platform_clk_type {
>  	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 5da90d47f9c6eab4a7e6b17841fdc0e599397bf7..e8b1b92a6329266d22b06e84c47c477d1a9d742e 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -15,6 +15,7 @@
>  #include "iris_platform_qcs8300.h"
>  #include "iris_platform_sm8650.h"
>  #include "iris_platform_sm8750.h"
> +#include "iris_platform_x1p42100.h"
>  
>  #define VIDEO_ARCH_LX 1
>  #define BITRATE_MAX				245000000
> @@ -1317,3 +1318,99 @@ const struct iris_platform_data qcs8300_data = {
>  	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>  	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>  };

Add a comment to mention what is different from sm8550 data.

> +
> +const struct iris_platform_data x1p42100_data = {
> +	.get_instance = iris_hfi_gen2_get_instance,
> +	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
> +	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> +	.get_vpu_buffer_size = iris_vpu_buf_size,
> +	.vpu_ops = &iris_vpu3_ops,
> +	.set_preset_registers = iris_set_sm8550_preset_registers,
> +	.icc_tbl = sm8550_icc_table,
> +	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
> +	.clk_rst_tbl = sm8550_clk_reset_table,
> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
> +	.bw_tbl_dec = sm8550_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
> +	.pmdomain_tbl = sm8550_pmdomain_table,
> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
> +	.opp_pd_tbl = sm8550_opp_pd_table,
> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
> +	.clk_tbl = x1p42100_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(x1p42100_clk_table),
> +	.opp_clk_tbl = x1p42100_opp_clk_table,
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/vpu/vpu30_p4.mbn",

is this the correct firmware? shouldn't it be vpu30_p1.mbn?

Thanks,
Dikshita

