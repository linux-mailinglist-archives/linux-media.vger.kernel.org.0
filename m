Return-Path: <linux-media+bounces-52094-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBBMDv+8gWm7JAMAu9opvQ
	(envelope-from <linux-media+bounces-52094-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 10:16:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DBFD6AC9
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 10:16:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D92EF303CEB3
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 09:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2166B396D11;
	Tue,  3 Feb 2026 09:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KTyiFKKP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FBlG3VFr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303F137AA6F
	for <linux-media@vger.kernel.org>; Tue,  3 Feb 2026 09:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770109902; cv=none; b=rKSIfjFmk1JPKv5Ek4Dqsc+d3Py8ih8UbAT0a5emwC/vMzr4SH4bpGeKOHcBHP7XmWga2Mvu5mG3J9Ya8WN1PShxU51chLfU3muYMigfKZX7FUgSEdKiJHxPNz7E/XTUg/K5Uz23SA9rkd3/vNr9aLCtblNXQmHd0MbhCLTVraE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770109902; c=relaxed/simple;
	bh=cVfXsmh4g5Jnpr+qx6yCihE26g/+bryyh8mxmPKssz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WnwgcSF4LSPLfbADwaaO6dNdJyiEQ3zSUEZ6Uw6A7ASpDRIyzxggykHBJoQ3Kw7RoA1Q2qK9UqZOrR/4oY5ShQPFhswADui1/P6hIbvdq7/WE+JZvtGi0X9NkhjVRTcWu6I31+D7+n+Ih4V8JyHGJEOeSyscFl7APVeKczZzElM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KTyiFKKP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FBlG3VFr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61369G3l3459128
	for <linux-media@vger.kernel.org>; Tue, 3 Feb 2026 09:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	51y+zk9oPwAHrTNnzHu+UYWMQfDx1dP+m7ewZ/BKyNE=; b=KTyiFKKPCKB1Ho4W
	7KcUorL7euNmrvAP60siFRIOO7488FdIial7MpL8gDwuXQeNSLhgt7PI8EvaKrzC
	ALs1h+qnRrUznx7rmRIAViCMbSAuHouLcuSr/h2Hv39ZiJVSms9OXE+nppmzO4w/
	uoLaeax0DRCUo1XiCdQwKKsGiVWf6fDVd7kV/PUn2XLlki06u0alOudMIKLqL/xr
	BTMPRb7HcX5OrbQlyZUUtLaaA1Nx0e6h8eDmw/0s5zoZxla93X9wYeE0SZbxY4ge
	zy2T6udHFbsObvYaNHQkeGbn7OqNmsT8hC2aoZchF8YW7extMH+rnMEbnSnb1bBT
	i/iJ2w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2trbkn07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Feb 2026 09:11:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0f47c0e60so16134985ad.3
        for <linux-media@vger.kernel.org>; Tue, 03 Feb 2026 01:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770109899; x=1770714699; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=51y+zk9oPwAHrTNnzHu+UYWMQfDx1dP+m7ewZ/BKyNE=;
        b=FBlG3VFrWUa8bMWwBg52DyYACOxWWKhw4LRmvHuLmKF3etpgtFLJ0xb2Ttth1RtzO6
         iKMgbTU9wkNDEjuhJNWN14vevOvCuXMMRflr+GxqDG3c5dwSR9v9Cw2T9BTdzjar9cnD
         T2tm3SRy6HkGVOBnXsASJ1xpngwAzNzi3ApzTpZch+eyfzJH4jM+xjJZ7wQPA6RJ1+2B
         c0gm6/AJGIH/m5wjg660xHBfs77S1zKw8DnbmD0Ym+yOV4nT70/Q812MU+J6z06IXjwq
         kmS5gwsxpygXUh+mPI11RcYnrD9muyzpj0wRXfbNYD+HaoKb33H6wNPjEei/iT1Lcdw9
         9AtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770109899; x=1770714699;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51y+zk9oPwAHrTNnzHu+UYWMQfDx1dP+m7ewZ/BKyNE=;
        b=sbO88yFdrVfJIhl5kXBILgLB+igIiL7Acboh8bjfSitxd4+P2gpvyGBVxwoo+KSNqo
         ZfSLWkyuha8zuhYcROvUIRcHYFF3MskDg6Pit3uG5/g+eeCIFmU5yGv4TlyqQovgyuYE
         JtDsvRSHZ5QgBE6UvEgbOtMa58CDvPtiIs7SSEOjZ8fwyDijddAvTI3dsd2sbvBRCHs4
         po3GNaj7BwWFofhR05Vq6ZZcoV5UsN95xrCzDkJrUoiaVZ49BNBnEVdWm31m7nbK33Pd
         5czVYLiSBhOKjsLcNZ+ZmBQkjCXRhe64al1stITZqNhW8xSXcsZIUUefbDa6p1dn0icr
         QumQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPZ+NSgUaUaDHRT4jiiLW0srRbLCq17Mj86wwJHY5JiSYmGN51emPZl7QTiTbsQQgy5g64As8ZbDQ8dw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+NrEoJ8AvlwPkJPrzej++1uQAFA743eYMb4xENxw0ZGENDO3Y
	X+WQbTXU4hgn8ihzCWbEqiTxh+Cvc28yNYnD+kMROWAafAsHwxwcVoxgmmn/LcWoqU0Xi9Yr6Fh
	6QyQxYWGjNgZH35oGpMES2bmdmGBvjd74a24U1g0j/OM2H8cZmkH+XT7oX6JC7m5mkw==
X-Gm-Gg: AZuq6aKHDaRbG1Rrw3jOkZt1q59i+JrJVR7ZXuMydPlhj+ieyxjFWM3NUgLU5RlW/iJ
	9+dgLyyfbhDAJ4R2100jC4XMIWfRf+N3xs3fvMe9xUlDZ6TQ38qLpfqwTJPCP1PcPmmqm6DEpNw
	8O8FkGdD45JRR0qW6QRkUCTX6YjCUfLJnSGMG6Y9KH6bFz5vfLqNDyAONizfBTFrxYI/YeTRkd5
	uJJbIsUF7XdVpnrfOZZ+MjkcdsD5/cGKXzVs8bGEYipGEOZDwSjvXP6qyKwZvbOn6ywUlzGjB4A
	+bH+xaRlmANWBD9p4w6frQeRoPjprGgu2daD1QZ8McnBn/53DpRhhAZ7DVlINzGY9SQh9mfYO0p
	+D8KTXuWB85cpHFt44Eg9GlgahU86unm5BjlMpuCESFsj
X-Received: by 2002:a17:903:2f91:b0:2a8:d9ea:8b59 with SMTP id d9443c01a7336-2a8d9ea8ce0mr151911335ad.7.1770109899116;
        Tue, 03 Feb 2026 01:11:39 -0800 (PST)
X-Received: by 2002:a17:903:2f91:b0:2a8:d9ea:8b59 with SMTP id d9443c01a7336-2a8d9ea8ce0mr151910935ad.7.1770109898539;
        Tue, 03 Feb 2026 01:11:38 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3eecc5sm178047315ad.17.2026.02.03.01.11.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 01:11:38 -0800 (PST)
Message-ID: <2f387069-f7e7-e3e5-f66c-c0d9e7fa92a6@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 14:41:27 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 4/8] media: iris: scale MMCX power domain on SM8250
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <20260201-iris-venus-fix-sm8250-v2-4-6f40d2605c89@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-4-6f40d2605c89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MJTnDdMBIe_Bnn7X72_K2nSkVS72o7lq
X-Authority-Analysis: v=2.4 cv=dcmNHHXe c=1 sm=1 tr=0 ts=6981bbcc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=R0B0fMNruX7Akzlv-IwA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: MJTnDdMBIe_Bnn7X72_K2nSkVS72o7lq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3MyBTYWx0ZWRfX2WMUctVfzEuE
 s7+mLXJ0dfmu0JQOPkJvlmn5F4mFq8G7vWdsbAAfcjQsMUKeqoZj3vqj503dvfY2pk6s/kbiD/+
 GTpn3rf4jwABJu155i3i0FSs7PXBNEDRFsSXMLtNhyt85rEuTwdTdpeD5292QASyvyZpy3hngNN
 JC6HMiMGhpuEliRD6f1h70LY686KWWpCAQYVClD2q2ZffkoeefcBXb3A0cuqYLjjcF7vC08Nyct
 agj8Q5ziKIGmEppPDanGa7xRIr6pxrLRTiROOfU2xracTy18hbTfzL4DOgUnX2/WvkB3ZzSAGF6
 jd5DJXcuImriTl1a5jiYNqFlUb4cBeT+nb4rcyHtyH3J07GNetiITbOEFn0eVt0WchYi4OSI97T
 kZ9brxtL2hacOWEp6RwPi/nvozS/sDIJgT9tv8aycibZ+7FfjYzjcIiCD2tMWHI7CM4i4MFo18P
 HRRvEHLBIjkeG76WTmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030073
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
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52094-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 90DBFD6AC9
X-Rspamd-Action: no action



On 2/1/2026 4:19 PM, Dmitry Baryshkov wrote:
> On SM8250 most of the video clocks are powered by the MMCX domain, while
> the PLL it powered on by the MX domain. Extend the driver to support

Nit: s/it/is/

> scaling both power domains, while keeping compatibitility with the

Nit: s/compatibitility/compatibility/

> existing DTs, which define only the MX domain.
> 
> Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
>  drivers/media/platform/qcom/iris/iris_probe.c         | 7 +++++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> index df8e6bf9430e..aa71f7f53ee3 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> @@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_dec[] = {
>  
>  static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
>  
> -static const char * const sm8250_opp_pd_table[] = { "mx" };
> +static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
>  
>  static const struct platform_clk_data sm8250_clk_table[] = {
>  	{IRIS_AXI_CLK,  "iface"        },
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 7b612ad37e4f..74ec81e3d622 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris_core *core)
>  		return ret;
>  
>  	ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
> +	/* backwards compatibility for incomplete ABI SM8250 */
> +	if (ret == -ENODEV &&
> +	    of_device_is_compatible(core->dev->of_node, "qcom,sm8250-venus")) {
> +		iris_opp_pd_data.num_pd_names--;
> +		ret = devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data,
> +						 &core->opp_pmdomain_tbl);
> +	}
>  	if (ret < 0)
>  		return ret;
>  
> 

Once above nits are fixed.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

