Return-Path: <linux-media+bounces-55635-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHB+A+jds2ktcQAAu9opvQ
	(envelope-from <linux-media+bounces-55635-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:50:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A073280CCE
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:50:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 25367301B85B
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899E4386562;
	Fri, 13 Mar 2026 09:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HPsUIKkz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73982375F98
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 09:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773395368; cv=none; b=LzNqv6/VI4aEsOkMX+JkrAbc4B63ES4vF9/hQAQe5Se8kAc761Nvd1e1Q2JmW23ciCwfW7r3yL9hH0u3Men4dD8r4bIBg9Vk2ql7o454uou1V6IBPU6oIlenKfjRMTl58feQ++VnQzPImssF8raKBBkLHHPVo/1p1oFJvXHAGJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773395368; c=relaxed/simple;
	bh=IwcaY8eaggeIn6MMtHGJ1IROj49OmXUpwa6sUyG68vw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VycadYxwsSTLP3N+VV6o8D64u8smkTLFf3hwJRNKD53TQJ8+H7oCjx63cziYjEBWPATaxattSumPMUmDbicOWPn6Coo1OARH5BK/WG7/sS8qkk/nelxhdrVbPUFQf1h1w2m2XGqothwhDeAUPjaedHs6d4T3Wcnzy8jVApQ/VRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HPsUIKkz; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b96d784828bso297896566b.3
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 02:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773395365; x=1774000165; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M8FS5yYGjX67AwqiomjlT3iHM2nG+cI6PJzSIUbSTVE=;
        b=HPsUIKkzS5xXndD/Mu6md4Myn8EJoc55Ws3BZlogUARhzhof1toQw+RAjE3ZVjb8cb
         tF87CBbgITMEEB48oxjljByJND1a2aOJbrYKHiDRQOsfPAmsYptw4oqpSwZkyt05W3RM
         DbgwGRkiX/Y+Q/o4trKFnRCbGGTo2xFPEQyW4gcxup8lby4mx3HPNi9Z8TOPiQaeb3JZ
         kyG3AeV+SflD+56TSLJxHY5F/5+KUGTCQBQ45+NxmahqUCsgoFSFdxzx+d9CbogbDfR8
         FLED8HhCVNTZpwEVappKHYmvCuTkxqVij6aA7E5VyM80MiNugQj1S73LZsa0VXvOo45B
         PjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773395365; x=1774000165;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M8FS5yYGjX67AwqiomjlT3iHM2nG+cI6PJzSIUbSTVE=;
        b=ggNUmD5LqGuCA2Y/xfZDMuKlp4V5W0mmYc8aJw1lFah13iS9R/308CD4HcXXFMYCeH
         4cisgB+bN1L8EseG4aUsrIw7HIYzuSqhV+awsEbxfGjnhJ/wDymJ4ZxzuH47vJ3L1JYs
         52TGRs6vy6HKneM2LtrNUUo1slrJMQc0M0Tjj488x7wTqg5ZxAb7Dj93PfKRep0xOjM9
         nxtpKqE0jAOTrgjTLNGDspnwyH4hvnoKzRRyvUIFpOi1590V2/tbsT4LGki6Y6eomnno
         qdGteQYocuB6Kd1Rw6o8vRpTX5RB7GGp1bJp9+t6s6cixvDb8Et4zwmT+ahad7dDVVOw
         zRPg==
X-Gm-Message-State: AOJu0Yxw5EQw1jjegg8s/BsWL5ueECmNvbtzmquChGHSleq2yI/v08nB
	sxhgOWnuQPgCmE0TCti6fyPruOWdKwxvIQUN/6/sRqCmhUTLEjnJov2+Qq1KsIrge08=
X-Gm-Gg: ATEYQzyDPjwbFwa4+OBjnaGGQEo0cMJqleK4CbFpz3VIulhtGYBXCddvx82B4pOD1xp
	VqHlVOOg8iyAepqDYfS7iQ/REngiFCb7m+x+HBF6Ndd5bg6vtyt1JK3L1FnsP80ytRIaoVAp9TU
	CLCZbQTfa+Bff4KZiIuwBUQyUMIiyHNw/KvtWEM8lB+WrwHY77MFiIXmJU8JeoAVAZf/XNzX+Ou
	guhX38iQpHZlDKtcamTz9HNnAPO+XCafrQ9UVmDXXAQ6izmjhBjaH6K/3JPTPONXUpbREW+nNT2
	0oVS7haXxxjEzOiWlxCnPiCKI6/pxC0LRqg4hxCYyn9OAQ0Bx+3EXvJMmw/GSLAsR6/5au8oRl9
	Y7YK0PR9eod71GI5MDGfFxi+KMurHnBx7PpS1Dgx+ZGebMlLa1xDk85JHlDyqUq9GXoe35VcbQg
	cea3mMh4BQ9Ej2rDTN/gE3atvQm2y3kYEViEUO
X-Received: by 2002:a17:907:7294:b0:b8a:f61a:edf2 with SMTP id a640c23a62f3a-b9765352458mr149879066b.50.1773395364637;
        Fri, 13 Mar 2026 02:49:24 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.176.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976d0b7722sm32825966b.66.2026.03.13.02.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 02:49:23 -0700 (PDT)
Message-ID: <e29545a0-ea31-446c-abec-866e3572c91b@linaro.org>
Date: Fri, 13 Mar 2026 09:49:22 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: qcom: camss: Add missing clocks for VFE lite
 on 8775p
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260313-vfelite_fix-v1-0-2ee7de00dee7@oss.qualcomm.com>
 <20260313-vfelite_fix-v1-2-2ee7de00dee7@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260313-vfelite_fix-v1-2-2ee7de00dee7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55635-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 0A073280CCE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/03/2026 09:42, Wenmeng Liu wrote:
> Add missing required clocks (cpas_ahb and camnoc_axi) for VFE lite
> instances on 8775p platform. These clocks are necessary for proper
> VFE lite operation:
> 
> Fixes: e7b59e1d06fb ("media: qcom: camss: Add support for VFE 690")
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 40 +++++++++++++++++++------------
>   1 file changed, 25 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 4a0bf8acd7645f8cd8c1b4cb9b6ff6f3a54d42e8..d325539defbecc7f4fbcb9d20fb69884e109a459 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3746,15 +3746,17 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
>   	/* VFE2 (lite) */
>   	{
>   		.regulators = {},
> -		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
>   			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> -			   "vfe_lite"},
> +			   "vfe_lite", "camnoc_axi"},
>   		.clock_rate = {
> -			{ 0, 0, 0, 0  },
> +			{ 0 },
> +			{ 0 },
>   			{ 300000000, 400000000, 400000000, 400000000 },
>   			{ 400000000, 400000000, 400000000, 400000000 },
>   			{ 400000000, 400000000, 400000000, 400000000 },
>   			{ 480000000, 600000000, 600000000, 600000000 },
> +			{ 400000000 },
>   		},
>   		.reg = { "vfe_lite0" },
>   		.interrupt = { "vfe_lite0" },
> @@ -3769,15 +3771,17 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
>   	/* VFE3 (lite) */
>   	{
>   		.regulators = {},
> -		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
>   			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> -			   "vfe_lite"},
> +			   "vfe_lite", "camnoc_axi"},
>   		.clock_rate = {
> -			{ 0, 0, 0, 0  },
> +			{ 0 },
> +			{ 0 },
>   			{ 300000000, 400000000, 400000000, 400000000 },
>   			{ 400000000, 400000000, 400000000, 400000000 },
>   			{ 400000000, 400000000, 400000000, 400000000 },
>   			{ 480000000, 600000000, 600000000, 600000000 },
> +			{ 400000000 },
>   		},
>   		.reg = { "vfe_lite1" },
>   		.interrupt = { "vfe_lite1" },
> @@ -3792,15 +3796,17 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
>   	/* VFE4 (lite) */
>   	{
>   		.regulators = {},
> -		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
>   			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> -			   "vfe_lite"},
> +			   "vfe_lite", "camnoc_axi"},
>   		.clock_rate = {
> -			{ 0, 0, 0, 0  },
> +			{ 0 },
> +			{ 0 },
>   			{ 300000000, 400000000, 400000000, 400000000 },
>   			{ 400000000, 400000000, 400000000, 400000000 },
>   			{ 400000000, 400000000, 400000000, 400000000 },
>   			{ 480000000, 600000000, 600000000, 600000000 },
> +			{ 400000000 },
>   		},
>   		.reg = { "vfe_lite2" },
>   		.interrupt = { "vfe_lite2" },
> @@ -3815,15 +3821,17 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
>   	/* VFE5 (lite) */
>   	{
>   		.regulators = {},
> -		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
>   			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> -			   "vfe_lite"},
> +			   "vfe_lite", "camnoc_axi"},
>   		.clock_rate = {
> -			{ 0, 0, 0, 0  },
> +			{ 0 },
> +			{ 0 },
>   			{ 300000000, 400000000, 400000000, 400000000 },
>   			{ 400000000, 400000000, 400000000, 400000000 },
>   			{ 400000000, 400000000, 400000000, 400000000 },
>   			{ 480000000, 600000000, 600000000, 600000000 },
> +			{ 400000000 },
>   		},
>   		.reg = { "vfe_lite3" },
>   		.interrupt = { "vfe_lite3" },
> @@ -3838,15 +3846,17 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
>   	/* VFE6 (lite) */
>   	{
>   		.regulators = {},
> -		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
>   			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> -			   "vfe_lite"},
> +			   "vfe_lite", "camnoc_axi"},
>   		.clock_rate = {
> -			{ 0, 0, 0, 0  },
> +			{ 0 },
> +			{ 0 },
>   			{ 300000000, 400000000, 400000000, 400000000 },
>   			{ 400000000, 400000000, 400000000, 400000000 },
>   			{ 400000000, 400000000, 400000000, 400000000 },
>   			{ 480000000, 600000000, 600000000, 600000000 },
> +			{ 400000000 },
>   		},
>   		.reg = { "vfe_lite4" },
>   		.interrupt = { "vfe_lite4" },
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

