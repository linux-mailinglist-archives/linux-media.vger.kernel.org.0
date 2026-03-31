Return-Path: <linux-media+bounces-57782-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2G+QGKCuy2kpKAYAu9opvQ
	(envelope-from <linux-media+bounces-57782-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 13:23:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA73C368ADC
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 13:23:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C87130470D7
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 11:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11EFB3D1CB3;
	Tue, 31 Mar 2026 11:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vE5VV2zk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C793A5E65;
	Tue, 31 Mar 2026 11:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774955986; cv=none; b=eOTTlLnDWvkgOPfO94I/L/rT0D91oqH3bUwtGL6Y24BN8O3rDz7S2+/JIrYa07xsXsroCrk35dIddrotDECnBRlLMx7Acny4rjH74rRC2+PYe6+X6b8d/0ErUSM0uFkZEhL2EPUkV6jvF3ccJzjEDMbYxgiBMFcGAoryvCH1lyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774955986; c=relaxed/simple;
	bh=ZnDW1YU1OZ07ojqBOp0PfWuBUEGetEGfTQ0tqVxhf08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kdZcKvpXXmQgtI98hLep9aaPie3jC23M9mGAPt8ZIgdXW3Ih579lqtbs9zQ4OCSe36RG/3sqQMtM7I4KVRucz9fZeiBggMQKPSkQILrftbolEKUs8jzOhUWClLbK2b1q+XqerRTVXH4gqeIXnKW99blsT1+JNnDXUOS5wv5Vu+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vE5VV2zk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7B53C19423;
	Tue, 31 Mar 2026 11:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774955986;
	bh=ZnDW1YU1OZ07ojqBOp0PfWuBUEGetEGfTQ0tqVxhf08=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vE5VV2zkAusrFlj2hvEIJoBuq/gLYl2nqmKS0MZRbJmA+O+Nx25OOkQ9RKbxblOfV
	 S5B/DSMhS8z6cypn4dRP84kKmXv4q+amO6JOgCOayp2W+lPuwk05KI6ILUJcc3oHdB
	 743GQtkSzShpdp0VuUxeF0qpP6Fd7KEDwlTRuXsM3/bRsCmX8EcauBv5NJbDQ0V1Jf
	 kageaPFFqHwlZ8lJpBKBNS193gvvEYO+hZysBtRJ29fnuJZq8BsfKN7fazzbhzb5bU
	 t2QncRVEo/6f7HpAlg53wv05nOfAmzaZCncChMvo6CIsAoA/C8ADo4C/pwW2g5tVrd
	 PKw7n3gwEOg7Q==
Message-ID: <62bebe94-f22c-4a99-b558-fd530fe37c7e@kernel.org>
Date: Tue, 31 Mar 2026 12:19:46 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] media: iris: scale MMCX power domain on SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Ulf Hansson <ulf.hansson@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
 <9DynOSHOdFz_RbNlLUuDUtQ3mZs5zW5pHr0UtUtXeU5s_43qnkK-at1mGkKJaT6LET06dWAf06BTG02GdukDRQ==@protonmail.internalid>
 <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57782-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: BA73C368ADC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09/02/2026 01:32, Dmitry Baryshkov wrote:
> On SM8250 most of the video clocks are powered by the MMCX domain, while
> the PLL is powered on by the MX domain. Extend the driver to support
> scaling both power domains, while keeping compatibility with the
> existing DTs, which define only the MX domain.
> 
> Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
>   drivers/media/platform/qcom/iris/iris_probe.c         | 7 +++++++
>   2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> index df8e6bf9430e..aa71f7f53ee3 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> @@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_dec[] = {
> 
>   static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
> 
> -static const char * const sm8250_opp_pd_table[] = { "mx" };
> +static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
> 
>   static const struct platform_clk_data sm8250_clk_table[] = {
>   	{IRIS_AXI_CLK,  "iface"        },
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 7b612ad37e4f..74ec81e3d622 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris_core *core)
>   		return ret;
> 
>   	ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
> +	/* backwards compatibility for incomplete ABI SM8250 */
> +	if (ret == -ENODEV &&
> +	    of_device_is_compatible(core->dev->of_node, "qcom,sm8250-venus")) {
> +		iris_opp_pd_data.num_pd_names--;
> +		ret = devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data,


ci is choking on this.

=>

drivers/media/platform/qcom/venus/pm_helpers.c: In function 
‘vcodec_domains_get’:
drivers/media/platform/qcom/venus/pm_helpers.c:910:41: error: decrement 
of read-only member ‘num_pd_names’
   910 |                 opp_pd_data.num_pd_names--;
       |                                         ^~

=>

include/linux/pm_domain.h

struct dev_pm_domain_attach_data {
         const char * const *pd_names;
         const u32 num_pd_names;
         const u32 pd_flags;
};

=>

struct dev_pm_domain_attach_data opp_pd_data = {
	.pd_names = res->opp_pmdomain,
	.num_pd_names = res->opp_pmdomain_num,
	.pd_flags = PD_FLAG_DEV_LINK_ON | PD_FLAG_REQUIRED_OPP,
};

---
bod

