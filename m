Return-Path: <linux-media+bounces-57535-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFamG0oJyml24gUAu9opvQ
	(envelope-from <linux-media+bounces-57535-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 07:25:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C45D13557D5
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 07:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7961C3016EF6
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 05:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22AB434676F;
	Mon, 30 Mar 2026 05:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jk2MjDRJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CqOGOFr7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCAE36CE14
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 05:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774848315; cv=none; b=DMUf2x0OG4ITmlZBOqj1Kw9wSwGxclCgMNZXSwafUm3vFjssYGj2ZhWf/Y0s/woOFnefKgG6nFHE46sROxhAMFZWWy7pspItVZyw7QuzbrRhf5IRnkYV3N1uKCTi2nqCp8z84MoaXpne30bQe/savnYqlW6+TKTbl2iWTVUlXY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774848315; c=relaxed/simple;
	bh=D3lO0lhg5hTvmGKJ2ae0KlsLLu8OpKls2Vh506RLu80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JtccN5hrFrdI/N4yJFOII5gp/soqSJod2Q3XEYxra7+h3wDUeBY+9OE+f3onPeODd5sT5s/nVuNbiaNkdlksBZw9qJ/PpEGd5udGd2P4z0/J5AM+FP8nqnCCwAH6GnyyNiG2f6qiXcYmtzMBa7SgGM3lDmTyORAjcIkl5nGGzVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jk2MjDRJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CqOGOFr7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U3oX7H3931721
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 05:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UmA43w79rLl8gL+6ejapyPIrbFnj/6/3VIIghM3uy5k=; b=jk2MjDRJU8RmKdg8
	w/RB3dFeD7f0NRQSpbnWEdTb9j6GXYDMIc3qGNdzN1zA8OnLf59nAAmB1lOeU5B4
	B9gsSdsj8soa1JH9pvVgGQ32Dc7eDyY99/uL5QryRwBGUxnwY0aMhXd0uqWuyLIA
	OYc4qzLzBgpkdKaCD/L5hQ+lMjeMQUG60ALhVbPW3SWoJQtsL8fFXhyfpIy6AEAu
	Tt/gOKaDOOFmjNrv3xVgLeuG1Dr8AjrP4Bsb6kJ47ibPsQo3oUKqsxZbQG+kgs2Z
	STMQkyQKYNrRATfYk9DOjG9nMWvvnZ+rfuSodfcKWmmwRrebaqAl4nJxNRzXQAzb
	b5TBRw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d64pdcurn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 05:25:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35c12a3bbb9so4597785a91.3
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 22:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774848313; x=1775453113; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UmA43w79rLl8gL+6ejapyPIrbFnj/6/3VIIghM3uy5k=;
        b=CqOGOFr7CLQohgEWMz7GFoCw+mFO+rATtzxbfPNE6vSeWSngULiUAQBLnxwpCNQQlk
         68E2rKstMA1+RF3pWXHCo7cgKb4bY0JC2/pBTb3km8kCu27JvMguEXb6l8TW2b/3i1CI
         84FbVOpZtRO0gzsScrDW/TgOOOujzM9PC+qIsQLCNL3hRtz5IU3oUTx9qEvisjDGA3vM
         1retOuriDMTb3ubgCEp2PDcU7yJ2JLYyQNr9jmLdmmq9gOqO8ufD5vSg3/GItJqPCNvb
         LOxtGgHUuR6Q8NG+nJo4pEUcfqKOgJzqgqbVC8g3xBEZ6wNAcRk0CV2AYPMuxFKbkoKk
         9CTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774848313; x=1775453113;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UmA43w79rLl8gL+6ejapyPIrbFnj/6/3VIIghM3uy5k=;
        b=L8wCYoe4kPNwH6SlBMdfo6FDbzt0t5AFKmk3PDYpFGt6IJuIxvIPZHxeXPTWTGiWml
         h1YQmlEESLDEmnJFKdfpaH5nHyGxpn4iEwkxuTnDo1jxigexNYYsDwBj0AlDuI97CnWo
         wyAju9+FevVVSGfsXYWAOxP7/jlXinhkTdgeetDP4L0QFnqnFlbY946ds+ZTpoQcuFfK
         AKmMrkcneRQ8xQSfJOVJPd9d4wOePVNWlOGY/G5yM0LUrfLjeEHe7TePdI4LAHlwWb6d
         FeUMeksX8YCf1hbnyKEkKx72X8hk+YumYkEM2z5GY//9g5Pdh3tDlFoTbmKsJsrhBBsW
         27zg==
X-Forwarded-Encrypted: i=1; AJvYcCUD90bjt/5egV/1zBR7/ZSrm4fZft7l0yw7sI4pZdorfvQkjxZV8L2D+Y/8dqb3MHKieN15Q6O9bzD7ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YziRPIvRYYcqM8xbpX7ZTyzzKQ6A1tneALpx4So0U0jB2aprXeO
	lJoVssSaVmdrIiMVABPzX00J25brewKPqLgPWy7BvPOssfmDdyj2nTbXezQIUMMvggyxwz+M5Qg
	61rtkcW/CiguOiP/49Lak1+up5k2djVPWSTpNPRW1CsEIPiM32YlGI08S2j0Bu6l9lw==
X-Gm-Gg: ATEYQzzgJeedLN01yljfjpQCse5RPvZV15GDjdFS70MHQdOONQN+2p8oxI0JTt3hP0X
	41VpPL/JtaloPV8sY8giGJ7IKXuxkaKZqLbLIgoEJVrZ8hUfJ/5zwj241ydBoDUave9jIM2OKdG
	MDEEOabkOLo7zjN8BNWK3tFuf+QQAqHlWTgfyiJWbPG0ml+/1u1zT8upcox1+9TeZDElms/Qi7/
	jRc2S60W91P8rw9E30sTzwGrxwES6bBZY3at5Fn3o30I5+jMkzOlZejeRGFKxcH20vxitRD8/Ii
	LjUss2Y9B7mrh7dpLlUyyHV8nLC5OAG5+r2l4p3z4DMOX8uV/LoXOWsBmWZTRR6asPj979hZBWH
	L1+mwkmX6eEZ+JqraL2CnNB3vKqBvDF2AUAhMwDt8Pf5MbS6vDK5enA==
X-Received: by 2002:a17:90b:3d86:b0:35d:b00a:3c54 with SMTP id 98e67ed59e1d1-35db00a416amr378972a91.22.1774848312869;
        Sun, 29 Mar 2026 22:25:12 -0700 (PDT)
X-Received: by 2002:a17:90b:3d86:b0:35d:b00a:3c54 with SMTP id 98e67ed59e1d1-35db00a416amr378917a91.22.1774848312353;
        Sun, 29 Mar 2026 22:25:12 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.233.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d950d9b12sm6892152a91.17.2026.03.29.22.25.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 22:25:11 -0700 (PDT)
Message-ID: <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:55:02 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 2/5] media: iris: scale MMCX power domain on SM8250
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
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
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
 <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _NVBn2JU85C7Lx7dK_uzvcTiCAJ-Ufi_
X-Authority-Analysis: v=2.4 cv=UZpciaSN c=1 sm=1 tr=0 ts=69ca0939 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=5/Y9Gi2N1OwmQbPtUd2E/A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=R0B0fMNruX7Akzlv-IwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: _NVBn2JU85C7Lx7dK_uzvcTiCAJ-Ufi_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAzOSBTYWx0ZWRfX7+QwMcRXo9dO
 KUcOoicG21jcwYyA+1zfzVxRGfwOSIMukcRHiAa6ou86UOCuHSK+5F746MA2hwo9l/EKuW/fu/8
 COzRB/ddxeRwWL3wQ9Qb2uox91zr80hiO9AmELq+6jq/BQ76G1zAzL5iQSkS27T4DqZ9J07Hq7g
 lWybhUsPn5X7dH0uB5o653zaHqGyFJeRoqj2wZk9+Ed10yVT/6k2pqJPZ+Ba8FtwrjeouoEs8Bq
 a9nhmEH6+XKNCQ72NfQ8Q7WipH2VsuEUYAulwN/5UkiKaDwgw93mekBDBlEPbxEB7pbPgPs/6Z7
 rjfifnz+pof9pQL2DlTFaTyy6zfhi75QaHDXXkw0q90NnhoeqpmxaI2MUPEs5HgFsEtxXWvwR4w
 ow8sFevg8b3ButbcKd+2qYuPB+u7aIy4h4GWJwr+cItuyOsqgCxvbDOncSDpMPppV3TBRj7dj5D
 VdmopCWi18NYEYJpFyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300039
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57535-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C45D13557D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2/9/2026 7:02 AM, Dmitry Baryshkov wrote:
> On SM8250 most of the video clocks are powered by the MMCX domain, while
> the PLL is powered on by the MX domain. Extend the driver to support
> scaling both power domains, while keeping compatibility with the
> existing DTs, which define only the MX domain.
> 
> Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
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

Hitting below compilation error on latest kernel

drivers/media/platform/qcom/iris/iris_probe.c: In function
‘iris_init_power_domains’:
drivers/media/platform/qcom/iris/iris_probe.c:71:46: error: decrement of
read-only member ‘num_pd_names’
   71 |                 iris_opp_pd_data.num_pd_names--;

Could you please check and fix.

Thanks,
Dikshita

