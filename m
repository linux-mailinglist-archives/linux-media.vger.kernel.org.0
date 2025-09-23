Return-Path: <linux-media+bounces-42992-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED36B95EA2
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 14:59:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 199323B754B
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 12:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFEA4323F60;
	Tue, 23 Sep 2025 12:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="NoeKJXxz"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B705257855;
	Tue, 23 Sep 2025 12:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758632376; cv=pass; b=NZXwvATlhJ37IyDILK9SFYybc6VXMq2fyIgEW85kYBxYJ9vOndp6YgTPe490PPy4vjKUiSCfDjWo+TrS8htZRinZemd3FiRgUZORF41qi6cyzKwBFBYh/Dtw4yuWu02EaQBLZZ3Us4ACZ4e66ynKcqrSWWR4lF0NBYPNPoPMm2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758632376; c=relaxed/simple;
	bh=b/gXvAai58Z3/BunjYnHlKuHCeLqF6XF/9xh++A0QNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pOMC6RVCOJDzQu9lymAEp9eM5aAuwIJluOQpNtA1aQfji2SU7AHpeCfnBag6Hjo9CxJQkGCp0xIzyaeaFFIyLffvCG2H9hLX5ntVgfpGWxIMfXsIRhrVFg46P/7QFUrhhwmZCJtcswmnvExiSePs1v0i/LewAtrvvFsDlvv5b/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=NoeKJXxz; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1758632349; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=k77UMTqJmyi8O2nA3KoHvI57c+HosSCH1Ou1azWNffy5QGBUVWBFfnUTRIKg2OucpjN6cryQXnnv/w3wgZZfNlcQnH23adjIZLPnXDqtE5xORsTdEhyRoIL0TNZOUIjqQAoZdlpoYt89q5NXnv27KS5QHmBWz6Ez+1Q3BOKo0U0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758632349; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ld3Mu+4XpQpKlmKIXgeP8nj7CXPhFkTiSv19YHU59YY=; 
	b=UcnwX4r1Ey2xc0knJtxLtzXrvxy5450xHhK8Jijj7jNBE+3rYoI6t5eK/U+c/RiyIP37dw5/ezIQlZSWTSX3+4808C9wtZZYSoQBnpApQSAaPF/UMZPK+HgcYUDitWGUERqQBO2JFMSUC34pvkCqCSeU8lUFbrWoo46fHnHhUMo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758632349;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Ld3Mu+4XpQpKlmKIXgeP8nj7CXPhFkTiSv19YHU59YY=;
	b=NoeKJXxzjZdD3HeMVr6Mp/cAvuNvpqqh0GE1nkkH/QFwH7kNl7xPsiKXvqO6p6SZ
	4bbk62KQykKq0giD054Vju1jY9a/7PP3VBh2gV0bLItoJe0u2KaaXCT2WLH76NHMpsS
	UnWThL1mSnpE6k0a5VJ2LXxsSp7tsY2Ja49Olu1s=
Received: by mx.zohomail.com with SMTPS id 1758632346474290.83340183401606;
	Tue, 23 Sep 2025 05:59:06 -0700 (PDT)
Message-ID: <aafd2f8d-be8e-4929-a21c-c8f066e2f6f1@collabora.com>
Date: Tue, 23 Sep 2025 14:59:02 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: verisilicon: Protect G2 HEVC decoder against
 invalid DPB index
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Hans Verkuil <hverkuil@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 Stable@vger.kernel.org
References: <20250922-imx8mq-hantro-g2-hang-v1-0-67d00eb6a548@collabora.com>
 <20250922-imx8mq-hantro-g2-hang-v1-2-67d00eb6a548@collabora.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20250922-imx8mq-hantro-g2-hang-v1-2-67d00eb6a548@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 22/09/2025 à 20:43, Nicolas Dufresne a écrit :
> Fix the Hantro G2 HEVC decoder so that we use DPB index 0 whenever a
> ninvalid index is received from user space. This protects the hardware
> from doing faulty memory access which then leads to bus errors.
>
> To be noted that when a reference is missing, userspace such as GStreamer
> passes an invalid DPB index of 255. This issue was found by seeking to a
> CRA picture using GStreamer. The framework is currently missing the code
> to skip over RASL pictures placed after the CRA. This situation can also
> occur while doing live streaming over lossy transport.
>
> Fixes: cb5dd5a0fa518 ("media: hantro: Introduce G2/HEVC decoder")
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

> ---
>   drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> index f066636e56f98560d9b1c5036691e3c34dd13b1f..e8c2e83379def53ce7fd86d6929ed4f5e0db068e 100644
> --- a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> +++ b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> @@ -283,6 +283,15 @@ static void set_params(struct hantro_ctx *ctx)
>   	hantro_reg_write(vpu, &g2_apf_threshold, 8);
>   }
>   
> +static u32 get_dpb_index(const struct v4l2_ctrl_hevc_decode_params *decode_params,
> +			 const u32 index)
> +{
> +	if (index > decode_params->num_active_dpb_entries)
> +		return 0;
> +
> +	return index;
> +}
> +
>   static void set_ref_pic_list(struct hantro_ctx *ctx)
>   {
>   	const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
> @@ -355,8 +364,10 @@ static void set_ref_pic_list(struct hantro_ctx *ctx)
>   		list1[j++] = list1[i++];
>   
>   	for (i = 0; i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
> -		hantro_reg_write(vpu, &ref_pic_regs0[i], list0[i]);
> -		hantro_reg_write(vpu, &ref_pic_regs1[i], list1[i]);
> +		hantro_reg_write(vpu, &ref_pic_regs0[i],
> +				 get_dpb_index(decode_params, list0[i]));
> +		hantro_reg_write(vpu, &ref_pic_regs1[i],
> +				 get_dpb_index(decode_params, list1[i]));
>   	}
>   }
>   
>

