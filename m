Return-Path: <linux-media+bounces-54693-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id n1odIB1sqmkPRQEAu9opvQ
	(envelope-from <linux-media+bounces-54693-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 06:54:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5BF21BD70
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 06:54:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C906303AA9F
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 05:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 514D136D508;
	Fri,  6 Mar 2026 05:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MY3S1sSR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QAYNA9pg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86002347BA9
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 05:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772776467; cv=none; b=J/Kn6tabP9KJDwAOjfF8ooTkmtHHuT7DD0CGqrncSfrbDBFIaunsr/9Ifa3lAn8u3/4bVkv/EwQ3Q7uADf3fQVG3Cq4CZ7/aW67vE8uzdpCXbZT4/ER0ov/8vjnqtji4ngSPPRv05SSptFYoqj/v5Vh54vVA5SVPvnWbpWywhCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772776467; c=relaxed/simple;
	bh=1MCBxd8ONA2ZUl2TduqrnVLDK4eXrvcft7zMT1NrBr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K+y2PooQMSpr+E+5q5fB+QsV6ucBMMkvIjdEpJ6zeAJfndsqRcC9A6N11WCooiq0/ACFIm+oVj6QMozXMvEBE0naMvUHQGLzSZwGcnC5CPh7MyWvA/JXmmmz1bpibk7//TNb97pW23bdaeFSSf0/z6Cr4QpbtGHa0m/RW30vIQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MY3S1sSR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QAYNA9pg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264aeGD3220032
	for <linux-media@vger.kernel.org>; Fri, 6 Mar 2026 05:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QchZutdopGk7w2wn9deKlArVUAYhCfHgl2W9GAhcmFE=; b=MY3S1sSRejsUE7Al
	QFUg53eSFcZ0Ic0TojdBWidN3MJAmab0f5Eeqwu5evtgW+3RoVGfzgSFOVsel02F
	z7tZq3nwPWY3LMaKLua0bMz7+kZWS3xBRA34GHQGLpFXCC1wXsMsg2oJ+x53/FHm
	yi+fyXWg78dYRiAjJHbqvR9rtTfi6c4eFsPtN7FV0PqXJQuM+UvBLIJPE5TQM1zW
	WT4B5igPFPSmQ4R05mtLXGavmyighqBCzmdS+TDg41OssJ6NKHpAa+8z6sDBVppm
	08k19YLxR4jxz2cMA+iyrDxqUt4OUjY4i3cZ+YGUQoo8CcdYmn4kANJpdf3Q86wh
	zYqgcA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqf25suk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 05:54:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae4b96c259so58171925ad.1
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 21:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772776465; x=1773381265; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QchZutdopGk7w2wn9deKlArVUAYhCfHgl2W9GAhcmFE=;
        b=QAYNA9pg1dJDriC+Qf1N+bq/RaKLI2D39mFVkC/ZC57ZGN8AtYJbFxqlUCZPrXYfXK
         epDhLDlCK0lyhe8vGZBqR0E//i25XOn5IyivV4YpklIreLT9YLQ5NGGPceHKYHPFbHp3
         VJcDWhkKu7IG6YCtObqisRgQPsNSoCmrTtD+rx0vvyvetpq7k87xF5Jwv0b+js4Ojegf
         nvZuswlY4rNsiWVeopBj1AHv7wkDVyolZUAWZalkLN/z1ulr9KWTltHZdtwCR2Hc5niY
         vxXwZqLU8Z2dY4Y2K5MiMnQtKpAnndFxK+Z009m4zspTakoTjVFNMxLoTbBr8bHvfPNF
         Pozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772776465; x=1773381265;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QchZutdopGk7w2wn9deKlArVUAYhCfHgl2W9GAhcmFE=;
        b=ZqVE91W0GQ/5jA4LWj+bvmokOGa1chQwR6FXefdaqHELKmE5GPINFTjComnrmLUIt9
         Mcd7Nm77QInYAnyDj7tXHIvFWeT3e4NmhPyJzMbtU6da/9cVb3xOzT3oWxGA+tj1uSRh
         7pBLP3Dg+trCbLsiPaG8dsq++H9rKEZcgamk89Wos/kCPfRjNE9QzHR3Rd1+hUNLVuIW
         Vq4ldfgfyeIy8imJ/p6UiAlhIwaF4zGO/FJT0E42PJqnMIaCHre40euaLJABkIKBaD/y
         DXPqtM+tJmOLLn94iYcqfyKowrkL3EMQKsEoknl6ihsrmEeYH7+NFSutSwNb9830yZtL
         ejig==
X-Gm-Message-State: AOJu0Yw6L7cznD7kG2c/yCTo8RFniju5KycEA/5F3vQ6VpLui/Q9R9Rv
	Deav0kePXy5Y/rtaV5ssTS34OyEZDd6Y45X3t3cDB2MErx2fknMTqBlGJLJTDi+mzY+SPYKVDwk
	+VQOzgIX98tWK1jh5g1NxcP7da3fibywpmK3EAksH1D6xGLdfJ0fzruujiAhFUCVZxg==
X-Gm-Gg: ATEYQzwx0qTc8vLOfjM6BEFrkxyBteuHVsqOAe3ZYEZn9WkwHzb34ehfOUi7u7gw2hi
	pI8mIoKdQkWl0+FPmYkC6LP52QAyDHw0vmwdhd02/FrDQRdJRp9vbTHU9D3y+zJa0ZW+a1kPks0
	eUbJgpSxkXxvsiCPZ0PzCMT0Fo1b+6lUKMRcr7KqjoiK9QUlJ542W5sjzXWocodAbzBGPv0FiIL
	rz9Dpp81cNaPKVw9tHtuIW3jHezX6ISIPBcjSpuNCKoIb0Du7jNcwioaaQr8dpjWQztnQ1EQgTt
	RVktSD0ieYFG1ssbZqhCeuM2g9fWZWWJclPLC19zlwwpniZV7nhbSJcrhSmJ5c/ncEnc4comvbY
	VCwM34TJ/twLtEL8cxWz5JxMVluIEd7PB1k+UIeHNIAuqKmuEDT0dZw==
X-Received: by 2002:a17:903:3bac:b0:2ae:4ac7:bcb9 with SMTP id d9443c01a7336-2ae75b49d80mr42893275ad.9.1772776465091;
        Thu, 05 Mar 2026 21:54:25 -0800 (PST)
X-Received: by 2002:a17:903:3bac:b0:2ae:4ac7:bcb9 with SMTP id d9443c01a7336-2ae75b49d80mr42892995ad.9.1772776464613;
        Thu, 05 Mar 2026 21:54:24 -0800 (PST)
Received: from [10.0.0.3] ([106.222.231.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840adb42sm7652355ad.81.2026.03.05.21.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 21:54:24 -0800 (PST)
Message-ID: <a673b388-eee1-c786-8f39-79fb2d76ab0d@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 11:24:20 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 02/11] media: qcom: iris: extract common
 set_preset_registers function
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
 <20260228-iris-platform-data-v2-2-acf036a3c84c@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v2-2-acf036a3c84c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FMjmtMxHpwL6IjAAP6SkCOUTkS-kOMZd
X-Authority-Analysis: v=2.4 cv=Uvdu9uwB c=1 sm=1 tr=0 ts=69aa6c11 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IrIcjQS8YOhLhDNCWt0oYA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=iAAPGlyahXlDWQVVwjIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA1MiBTYWx0ZWRfX2P4sc36ACVkD
 GQEmmyiMfIDpsmo6EkhgJWIyjSZV+qZUub3pkVdefBjyet8UewGzpa2y0uC/6p+6Rf8a5R+ANbJ
 Z0FBfL4+x3RhdawpEZGfqQvEQi2pUfWhl3kx864ZwYfRJgwhc43hFESYBzpQyzMm5zpLNP0onol
 lB8eZMCuURdM23dZGQKlYaw+ttXmn/5igpOcsb223LuOmrtY3NglVctQWuJKLSwsUoZJjyU+aXR
 ke8YNRZSH/6WSr64IxDkXE+LlSk1eZi2EpqAytj2A9b8x9W3gm0qY8MvAYzAkkeVDVir65vt1FU
 HM6CpoGVNDfKUkTo5NBX+cJjrPtZ2G+F0vkyIPl1R/kkNPDbYNXqwwQ3dei16KE4GHXE5fXOtd6
 kRYxSMIsQhl8SYzeQ/noAEKDIYl55tm1sRAeLj6hqPRPN7JXCHRmndRrh+tZQN2DvQ8u+F8/Zut
 iSMpQ2BfMwUAhAGMSdQ==
X-Proofpoint-GUID: FMjmtMxHpwL6IjAAP6SkCOUTkS-kOMZd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060052
X-Rspamd-Queue-Id: CD5BF21BD70
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54693-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 2/28/2026 8:56 PM, Dmitry Baryshkov wrote:
> The set_preset_registers is (currently) common to all supported devices.
> Extract it to a iris_vpu_common.c
> 

Then it can be removed from platform data and can be called directly since
as of now its common for all supported devices, this can change for a
different VPU variant eg: AR50LT and at that time it can be changed to vpu ops.

Thanks,
Dikshita
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_platform_gen1.c |  9 ++-------
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c | 13 ++++---------
>  drivers/media/platform/qcom/iris/iris_vpu_common.c    |  5 +++++
>  drivers/media/platform/qcom/iris/iris_vpu_common.h    |  2 ++
>  4 files changed, 13 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> index 1bbdefc48d71..a3eebcacba7b 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> @@ -260,11 +260,6 @@ static struct platform_inst_caps platform_inst_cap_sm8250 = {
>  	.max_operating_rate = MAXIMUM_FPS,
>  };
>  
> -static void iris_set_sm8250_preset_registers(struct iris_core *core)
> -{
> -	writel(0x0, core->reg_base + 0xB0088);
> -}
> -
>  static const struct icc_info sm8250_icc_table[] = {
>  	{ "cpu-cfg",    1000, 1000     },
>  	{ "video-mem",  1000, 15000000 },
> @@ -343,7 +338,7 @@ const struct iris_platform_data sm8250_data = {
>  	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
>  	.get_vpu_buffer_size = iris_vpu_buf_size,
>  	.vpu_ops = &iris_vpu2_ops,
> -	.set_preset_registers = iris_set_sm8250_preset_registers,
> +	.set_preset_registers = iris_vpu_set_preset_registers,
>  	.icc_tbl = sm8250_icc_table,
>  	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
>  	.clk_rst_tbl = sm8250_clk_reset_table,
> @@ -397,7 +392,7 @@ const struct iris_platform_data sc7280_data = {
>  	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
>  	.get_vpu_buffer_size = iris_vpu_buf_size,
>  	.vpu_ops = &iris_vpu2_ops,
> -	.set_preset_registers = iris_set_sm8250_preset_registers,
> +	.set_preset_registers = iris_vpu_set_preset_registers,
>  	.icc_tbl = sm8250_icc_table,
>  	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
>  	.bw_tbl_dec = sc7280_bw_table_dec,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 1f23ddb972f0..f8754451ac18 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -756,11 +756,6 @@ static struct platform_inst_caps platform_inst_cap_sm8550 = {
>  	.max_operating_rate = MAXIMUM_FPS,
>  };
>  
> -static void iris_set_sm8550_preset_registers(struct iris_core *core)
> -{
> -	writel(0x0, core->reg_base + 0xB0088);
> -}
> -
>  static const struct icc_info sm8550_icc_table[] = {
>  	{ "cpu-cfg",    1000, 1000     },
>  	{ "video-mem",  1000, 15000000 },
> @@ -917,7 +912,7 @@ const struct iris_platform_data sm8550_data = {
>  	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>  	.get_vpu_buffer_size = iris_vpu_buf_size,
>  	.vpu_ops = &iris_vpu3_ops,
> -	.set_preset_registers = iris_set_sm8550_preset_registers,
> +	.set_preset_registers = iris_vpu_set_preset_registers,
>  	.icc_tbl = sm8550_icc_table,
>  	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
>  	.clk_rst_tbl = sm8550_clk_reset_table,
> @@ -1018,7 +1013,7 @@ const struct iris_platform_data sm8650_data = {
>  	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>  	.get_vpu_buffer_size = iris_vpu33_buf_size,
>  	.vpu_ops = &iris_vpu33_ops,
> -	.set_preset_registers = iris_set_sm8550_preset_registers,
> +	.set_preset_registers = iris_vpu_set_preset_registers,
>  	.icc_tbl = sm8550_icc_table,
>  	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
>  	.clk_rst_tbl = sm8650_clk_reset_table,
> @@ -1114,7 +1109,7 @@ const struct iris_platform_data sm8750_data = {
>  	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>  	.get_vpu_buffer_size = iris_vpu33_buf_size,
>  	.vpu_ops = &iris_vpu35_ops,
> -	.set_preset_registers = iris_set_sm8550_preset_registers,
> +	.set_preset_registers = iris_vpu_set_preset_registers,
>  	.icc_tbl = sm8550_icc_table,
>  	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
>  	.clk_rst_tbl = sm8750_clk_reset_table,
> @@ -1212,7 +1207,7 @@ const struct iris_platform_data qcs8300_data = {
>  	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>  	.get_vpu_buffer_size = iris_vpu_buf_size,
>  	.vpu_ops = &iris_vpu3_ops,
> -	.set_preset_registers = iris_set_sm8550_preset_registers,
> +	.set_preset_registers = iris_vpu_set_preset_registers,
>  	.icc_tbl = sm8550_icc_table,
>  	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
>  	.clk_rst_tbl = sm8550_clk_reset_table,
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 548e5f1727fd..e07e47dc9977 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -485,3 +485,8 @@ int iris_vpu_power_on(struct iris_core *core)
>  
>  	return ret;
>  }
> +
> +void iris_vpu_set_preset_registers(struct iris_core *core)
> +{
> +	writel(0x0, core->reg_base + 0xb0088);
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> index f6dffc613b82..07728c4c72b6 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> @@ -39,4 +39,6 @@ int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core);
>  void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);
>  u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size);
>  
> +void iris_vpu_set_preset_registers(struct iris_core *core);
> +
>  #endif
> 

