Return-Path: <linux-media+bounces-45729-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CA5C12EE5
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 06:24:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10AD242773F
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 05:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7524A2989BF;
	Tue, 28 Oct 2025 05:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ddQtWmgl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614D727E076
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 05:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761629076; cv=none; b=UU1u2Z6qbIP+KTcbHMnADjotlOVuxPAvSG4pZjYZHVJ6JqVURQioo4+9TrnF1cqxyYPAMKWAti/IxAC29Jm8a8+Dd0r28geve8er/5ymTQzsJW36IFp/AiJTN6hZUadpkFm+WbT6/g0dRGvGGXagXzFaBpjreARkzZ0/JEUBYuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761629076; c=relaxed/simple;
	bh=I89tJGzHcfRbnf+TZbfEmL4g1nkwlHvwalRd1egTt7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bt3NcH88ofzfOQ4esURLHajjyDD5yABBGSYiWmRD42XsOSr8WElWeA1lDgfJ8GSZ2aXHBNdWFVnK7QdaylSZs+FqKDPAeLCrLtuuBRIpZU1zFh5/xScQz0BvJ31RYJ8aMDsilbnlWwqVUVHL43kw8AiyZ7lWYPGaJJBwdAA7+So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ddQtWmgl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S2wYDE2232337
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 05:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U687IvC9NqsMop9catDTnZXFwDB7Yeaf6lB08LXZaaU=; b=ddQtWmglEv+Qg02H
	WwTdPjapZd9oG1lqimcFQrUS3zyxjvpY7kpBFSXptJrgPp0DOKHu3TS8dJpMLkwJ
	PV+BMIMS5bzTXGlCuGuz6IsYMUampX0kjkzoohs9XOcFRn7kRXFlgxRjp4v3ld4m
	GbvdX0WRjTue9xxkfu59f24MqtFXhyHCNObeWC005rOF+hCoR/daq0oHyqFAMQhk
	aRHFJoQE8H4F9qoOU1irvZHFUa0Y6Q6WqttMk997NH5alIqIegMkV7HagpTj7I53
	HVqqxqH94RbK3VEtADsDtYVVxgdMlnZrUohz9VTMHjbT8fBR9SyAtH4p+DkTVQuY
	P81Lkw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a24wnbfjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 05:24:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33bb3b235ebso11649782a91.1
        for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 22:24:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761629073; x=1762233873;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U687IvC9NqsMop9catDTnZXFwDB7Yeaf6lB08LXZaaU=;
        b=crPbthl3eJfTEx9WVpldE7YkHZYZCKiUt00vo66CsV/YOht7JtnB8HdSUBlpnRHf5X
         cof7fmlAsmTA/Zg8rMOO+w59P6Z3epoOqpWBwI7Po07iN2Hc31NICALs4TtMfj7fSDvw
         tmwJUpwb80kGSxKEuv7HUW9yPpcQ5ZN29LR1gC2Hja5NzEEIXBcFcYkF8VOh13lz4PDI
         M4UaOqu15+gWUY9WjlumFhM3pGmebbnFtTEns/9Gu7B2R3X3bQM2QyS1+QbTLI9X0mcd
         +7YdT/wkZHOUrrcW1VYGqvX7HDdwDIOA3AiOKAXuZkpHoHfoRxxkM75Hrp/1kFdjAKUT
         YvFg==
X-Gm-Message-State: AOJu0YyrqLskxu+nRhdqa0fZrOq90KvKKUXclSeGv7cMJfAJFTzzdecp
	C7IDqVfwnInFG90q7ZGOPDpdY7p2FtN3phqEeRRiVLeJq4j+SojC5j+uic/UZLHZzT6AEZhwvdr
	20eN/lg99r8xCQlNjvbv6jGnNzhVIkpfddqA2A7MA2GFDOdTnRcF1CrtqnzQSFBkJ7g==
X-Gm-Gg: ASbGncvi2kfT39mgd3a6n/YRh/Ahw3LHSi7MH35HTCzf1ltZ8eWx4n45Iw6Hr/cu5Ye
	l6HUN+xagq32bvNTfe4pd1GS+jC4lLNR7mt7Hz62cCNhvijHicMa04Om81QZihxWjLWfnNula90
	bW7ZcMxcYN3Vu2WShwKp+yEdHWUPWGcjscvleqBbq9X1LObdic/qV7fFIR0wtF3rzmWefYUUq5a
	WXU+Wo+a3QwMXNR5nE1XJnS1QwONpSQwbeQSvE4h6V4CePJuR+mekDpJacCvsko8Rg6A/Xfu4ru
	i9Bz9SrPblvVoO6H4d+JjK77htmZXsCVPUoIh0P0/ZD0zB/+qi+TspHwDt4QRSPv6UolhjjzzrA
	nTEqfzeZWrzN05WNLV4HomCFb64V30a8=
X-Received: by 2002:a17:902:e746:b0:290:cd9c:1229 with SMTP id d9443c01a7336-294cb3baf4cmr25543345ad.19.1761629073155;
        Mon, 27 Oct 2025 22:24:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoDxeTAbDgjbaa5VLkv2GSbMcsl42sVjQq0NOWa2O/1phRcDcCRPSBpWF/Z6IVKKlq6l2h+w==
X-Received: by 2002:a17:902:e746:b0:290:cd9c:1229 with SMTP id d9443c01a7336-294cb3baf4cmr25543095ad.19.1761629072624;
        Mon, 27 Oct 2025 22:24:32 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d23226sm103101915ad.49.2025.10.27.22.24.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 22:24:32 -0700 (PDT)
Message-ID: <b5bb5cdb-643a-73f9-bac6-0d2876756bb6@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 10:54:28 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 6/6] media: iris: enable support for SC7280 platform
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251027-iris-sc7280-v5-0-5eeab5670e4b@oss.qualcomm.com>
 <20251027-iris-sc7280-v5-6-5eeab5670e4b@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251027-iris-sc7280-v5-6-5eeab5670e4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XIY9iAhE c=1 sm=1 tr=0 ts=69005392 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=53nKSqg9CZMqh-_UtzYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: _8oqeCnlA3qeMh66TuEFOYcywQ0c7QLd
X-Proofpoint-ORIG-GUID: _8oqeCnlA3qeMh66TuEFOYcywQ0c7QLd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA0NSBTYWx0ZWRfXws7QvpJxMK1t
 +5sYoVg3XcQ2h2VJ5b2Vc0VAvP1TeNMzVn5whstWfgFdI29YEgX15J4Wd/w+01Y+BvOj85+Od+m
 swwnrO1xpGUcwu2x0T37TCvJC7CRNIDR22CIIlmU9ixBapP6fhVq2wk7MQF1FaxuncEPava8P3h
 XOQlnrKEkuyeL1YsRm4DeztBV9VncLppSw+c+Cn0e7toveJzEwT4yn1NkDtIJH9cjmPvJMPfd2B
 aPAEsG4UwZyqNsPAdToiBlEBFytkfk2goi+e3FKoYdLT46VuM5Lyu/CmozvQt1zsa+uufugtthA
 EDmNpZrdeetQFfvW0MZ2U0zEMToR06d/lCWGuZfdSpC1WlbONHNC9PHVCWOK6VwPR8flJYGO4ZS
 9QouQ332O/yIMcVW08a8nJl1zSRxQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280045



On 10/27/2025 5:57 PM, Dmitry Baryshkov wrote:
> As a part of migrating code from the old Venus driver to the new Iris
> one, add support for the SC7280 platform. It is very similar to SM8250,
> but it (currently) uses no reset controls (there is an optional
> GCC-generated reset, it will be added later) and no AON registers
> region. Extend the VPU ops to support optional clocks and skip the AON
> shutdown for this platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |  4 ++
>  .../media/platform/qcom/iris/iris_platform_gen1.c  | 53 ++++++++++++++++++++++
>  .../platform/qcom/iris/iris_platform_sc7280.h      | 27 +++++++++++
>  drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
>  drivers/media/platform/qcom/iris/iris_resources.c  |  2 +-
>  drivers/media/platform/qcom/iris/iris_vpu2.c       |  6 +++
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 34 ++++++++++----
>  7 files changed, 120 insertions(+), 10 deletions(-)
> 

<Snip>

> +
> +const struct iris_platform_data sc7280_data = {
> +	.get_instance = iris_hfi_gen1_get_instance,
> +	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
> +	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
> +	.get_vpu_buffer_size = iris_vpu_buf_size,
> +	.vpu_ops = &iris_vpu2_ops,
> +	.set_preset_registers = iris_set_sm8250_preset_registers,
> +	.icc_tbl = sm8250_icc_table,
> +	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
> +	.bw_tbl_dec = sc7280_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(sc7280_bw_table_dec),
> +	.pmdomain_tbl = sm8250_pmdomain_table,
> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
> +	.opp_pd_tbl = sc7280_opp_pd_table,
> +	.opp_pd_tbl_size = ARRAY_SIZE(sc7280_opp_pd_table),
> +	.clk_tbl = sc7280_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(sc7280_clk_table),
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/vpu/vpu20_p1.mbn",
> +	.pas_id = IRIS_PAS_ID,
> +	.inst_caps = &platform_inst_cap_sm8250,
> +	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
> +	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
> +	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
> +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
> +	.tz_cp_config_data = &tz_cp_config_sm8250,
> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> +	.num_vpp_pipe = 1,
> +	.no_aon = true,
> +	.max_session_count = 16,
> +	.max_core_mbpf = NUM_MBS_8K,
May be I wasn't clear in previous comments, what I menat was.

max_core_mbpf = ((4096x2176)/256) x 2 + (1920x1088)/256

> +	/* max spec for SC7280 is 4096x2176@60fps */
> +	.max_core_mbps = (4096 * 2176 * 2 + 1920 * 1088) / 256 * 60,

max_core_mbps = ((4096x2176)/256 ) * 60 fps

> +	.dec_input_config_params_default =
> +		sm8250_vdec_input_config_param_default,
> +	.dec_input_config_params_default_size =
> +		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
> +	.enc_input_config_params = sm8250_venc_input_config_param,
> +	.enc_input_config_params_size =
> +		ARRAY_SIZE(sm8250_venc_input_config_param),
> +
> +	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
> +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
> +	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
> +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
> +
> +	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
> +};

<Snip>

> @@ -318,13 +328,19 @@ int iris_vpu_power_on_hw(struct iris_core *core)
>  	if (ret)
>  		goto err_disable_power;
>  
> +	ret = iris_prepare_enable_clock(core, IRIS_HW_AHB_CLK);
> +	if (ret && ret != -ENOENT)
> +		goto err_disable_hw_clock;
> +
>  	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
>  	if (ret)
> -		goto err_disable_clock;
> +		goto err_disable_hw_axi_clock;
>  
>  	return 0;
>  
> -err_disable_clock:
> +err_disable_hw_axi_clock:

Seems you missed this comment,
This label needs an update s/err_disable_hw_axi_clock/err_disable_hw_ahb_clock

Thanks,
Dikshita
> +	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);> +err_disable_hw_clock:
>  	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
>  err_disable_power:
>  	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> 

