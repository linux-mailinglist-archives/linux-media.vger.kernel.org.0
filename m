Return-Path: <linux-media+bounces-38018-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5604EB08DB0
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 14:59:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87F704A70B0
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E00C2D661D;
	Thu, 17 Jul 2025 12:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q91iohkk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83532C327D
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 12:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752757164; cv=none; b=sAoseJ+zX8a2mlCFf77xCPwxAWTmvyTZK2crQ9nlNseN3SZUdOLoJed05+d7DCkMEtbGdqsunJZy8gbdAIw95DlXhTMBVGhtLpngjCx7n5WYqpLVGSlYPhyxhfW/hEymYWCqKwi0EK/McH1fvubRb1j7V6531Uv2UCjCzGDq0eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752757164; c=relaxed/simple;
	bh=NazyAH6+gsaoyyq+9VO0xIsOYw4Q0V5xmekt5T3PZiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PhVWjP98kO4DDjA0JrBHx2IRzR1hKwxjrzJc7sFj1iNAKYJrUXSpTx2MYmLONjlYfP46d9pf/3+O2dR4SUHRkXgVmOif0wCNx+YCK9FZQBDqxq+S8X2VGD2QdSashTpsTWZgazzxVhWysVgk8YfxGOVJTjBWROBwbBWlb5+DtDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q91iohkk; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a522224582so449258f8f.3
        for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 05:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752757161; x=1753361961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BeXlH9kxjwQMEYf9Z3/E3bIdL61oLglThcLuAKSoRCU=;
        b=q91iohkkLeAj2j1hIAsCr9v6xWahtgrzaSuiqYC75q1vtqk7GwehxerV5Ko5/kbF/W
         7O1PdWoieMynJ2CJvlrpD2YB4cCwb/HSrFOBt35R/s/TLJFb3qkFRJiLJqfQIVZgGcB+
         8Y4enUC5hM33lUhlu7yulcpPcuJaDwVw2G2PvQevw7L71IfIscWI8HQmKj2ompyCYgpZ
         8GmzaYrA2grjdM4e7sTrZAn5SlmInVp5MmRw7qRMjPFIlqxWv9WY79ogMXoUT+8sy5cZ
         wLkSH5lYSGRWk1rOKCknJ4EY4oRlhMR2kVnN6tRgXST1+by5wHApeOhBuqQfolFAxhnx
         lS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752757161; x=1753361961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BeXlH9kxjwQMEYf9Z3/E3bIdL61oLglThcLuAKSoRCU=;
        b=j3ps+zLYw3EPWJ6P35jteSMOuHeOnKJFTGNkywJL/KKD5S6x6Eb908ciVXMm9EMm32
         Lm9yDciK8piChDcF0Wxwd9lrXKFIvzw2Cr6pkrNmAOdnu4sjyHlt9yFg2cn6VDz7ns1G
         /+VNL8lNTX9yR/eFlH+Tp+8sb+C4cC+iqlWAg13TSzNM1HUU4kMdze5RS9sL7xHV1v8Z
         Yefc8OsI3EiJvxEFo2zLGLRRRC4zl8i4t9Wmx6CQ0suSWQp3yX6rhCo7BLVyf/0x7j4l
         yTvaP5ssmG7qh/lLd3uuUTsjbUBfqIj1A4wUtCbgJC0x8iz4ecDA7Gs20f02NmxekIZz
         zGYA==
X-Forwarded-Encrypted: i=1; AJvYcCVFgK/e538Vk6M+l4iXx8DfBSF9MXbY7OTCE2NUfDlZXCfhOQO78dgj9eLPf1FJVa987sryU0svcguzoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRRo5u0yrax7DPBxvrjgWUsZNAIls4kk3BfJdR7aF67ov1LO/x
	4GOzXb12QHTPHhRGsbIcYvGry+SJy+x9Uzf3fcBIFDOg5Z3AnUuS5G4N0Qg8GEBzCJM=
X-Gm-Gg: ASbGncsc6LcGCJnAfSd/rz8dLcgA0vBDWTIDNX08tqa1Be2/VnYbyImuD8qGxGXf4I5
	VLRJtYL+ZGybdgNWWKTCJwWp8NGbR4zlUQfhlvuwFIedwLa3fNli5B+NsUCf29s6H0JprsYdh+U
	LUnjFe3ryRh81cpAOyOr1zceYERiNARY2uRa0KjpPz6Ji/Nflpx0Mlwj85l1Obs6xorJvyQNTRe
	tOxcFpftKhAauCLRuaW4qQhEV8FCIrSymKMANgxXGAjlqvh49bYaOKl00rjMV0SG8wf8S5J5tXz
	jDDPNWcqSrvOB5tqhPN7n4kahfyuKyfBrTJvykr2c+j9SBvyBbdL0sN0Yafbp0e5lOx3BjlbRu2
	AGIww7F7Hf4ii65KDcSU/biprzAmbpwHvpnjhcX9Je0heOKCG0eiJ3A716c3x17sg
X-Google-Smtp-Source: AGHT+IHo3vHr64NV7F+0RXnNGZqyQwEggq77AYSR1w4iYu4MR8Hvcl0X6/LKB7Yn0uoOvs2MpQCVPw==
X-Received: by 2002:a5d:5d11:0:b0:3a6:f2da:7fe5 with SMTP id ffacd0b85a97d-3b60ddc6571mr5596225f8f.55.1752757161148;
        Thu, 17 Jul 2025 05:59:21 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc9298sm20689436f8f.44.2025.07.17.05.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 05:59:20 -0700 (PDT)
Message-ID: <7cb32560-b7af-4395-bb58-04dc4bbfa420@linaro.org>
Date: Thu, 17 Jul 2025 13:59:19 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] media: qcom: camss: tpg: Add TPG support for
 SA8775P
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250717-lemans_tpg-v2-0-a2538659349c@quicinc.com>
 <20250717-lemans_tpg-v2-3-a2538659349c@quicinc.com>
 <e1335aff-00b4-4505-bcf5-0eb8f2974a75@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <e1335aff-00b4-4505-bcf5-0eb8f2974a75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/07/2025 13:54, Konrad Dybcio wrote:
> On 7/17/25 5:20 AM, Wenmeng Liu wrote:
>> Add support for TPG found on SA8775P.
>>
>> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
>> ---
> 
> [...]
> 
>> +static int tpg_stream_on(struct tpg_device *tpg)
>> +{
>> +	struct tpg_testgen_config *tg = &tpg->testgen;
>> +	struct v4l2_mbus_framefmt *input_format;
>> +	const struct tpg_format_info *format;
>> +	u8 lane_cnt = tpg->res->lane_cnt;
>> +	u8 i;
>> +	u8 dt_cnt = 0;
>> +	u32 val;
>> +
>> +	/* Loop through all enabled VCs and configure stream for each */
>> +	for (i = 0; i < tpg->res->vc_cnt; i++) {
>> +		input_format = &tpg->fmt[MSM_TPG_PAD_SRC + i];
>> +		format = tpg_get_fmt_entry(tpg->res->formats->formats,
>> +					   tpg->res->formats->nformats,
>> +					   input_format->code);
>> +
>> +		val = (input_format->height & 0xffff) << TPG_VC_m_DT_n_CFG_0_FRAME_HEIGHT;
>> +		val |= (input_format->width & 0xffff) << TPG_VC_m_DT_n_CFG_0_FRAME_WIDTH;
>> +		writel_relaxed(val, tpg->base + TPG_VC_m_DT_n_CFG_0(i, dt_cnt));
>> +
>> +		val = format->data_type << TPG_VC_m_DT_n_CFG_1_DATA_TYPE;
>> +		writel_relaxed(val, tpg->base + TPG_VC_m_DT_n_CFG_1(i, dt_cnt));
>> +
>> +		val = (tg->mode - 1) << TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE;
>> +		val |= 0xBE << TPG_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD;
>> +		val |= format->encode_format << TPG_VC_m_DT_n_CFG_2_ENCODE_FORMAT;
>> +		writel_relaxed(val, tpg->base + TPG_VC_m_DT_n_CFG_2(i, dt_cnt));
>> +
>> +		writel_relaxed(0xA00, tpg->base + TPG_VC_n_COLOR_BARS_CFG(i));
>> +
>> +		writel_relaxed(0x4701, tpg->base + TPG_VC_n_HBI_CFG(i));
>> +		writel_relaxed(0x438, tpg->base + TPG_VC_n_VBI_CFG(i));
> 
> Please provide context for the magic numbers> +
>> +		writel_relaxed(0x12345678, tpg->base + TPG_VC_n_LSFR_SEED(i));
>> +
>> +		/* configure one DT, infinite frames */
>> +		val = i << TPG_VC_n_CFG0_VC_NUM;
>> +		val |= 0 << TPG_VC_n_CFG0_NUM_FRAMES;
>> +		writel_relaxed(val, tpg->base + TPG_VC_n_CFG0(i));
>> +	}
>> +
>> +	writel_relaxed(1, tpg->base + TPG_TOP_IRQ_MASK);
>> +
>> +	val = 1 << TPG_CTRL_TEST_EN;
>> +	val |= 0 << TPG_CTRL_PHY_SEL;
>> +	val |= (lane_cnt - 1) << TPG_CTRL_NUM_ACTIVE_LANES;
>> +	val |= 0 << TPG_CTRL_VC_DT_PATTERN_ID;
>> +	val |= (tpg->res->vc_cnt - 1) << TPG_CTRL_NUM_ACTIVE_VC;
>> +	writel_relaxed(val, tpg->base + TPG_CTRL);
> 
> You want the last writel here (and in _off()) to *not* be relaxed,
> so that all the prior accesses would have been sent off to the hw
> 
> [...]
> 
>> +static u32 tpg_hw_version(struct tpg_device *tpg)
>> +{
>> +	u32 hw_version;
>> +	u32 hw_gen;
>> +	u32 hw_rev;
>> +	u32 hw_step;
>> +
>> +	hw_version = readl_relaxed(tpg->base + TPG_HW_VERSION);
>> +	hw_gen = (hw_version >> HW_VERSION_GENERATION) & 0xF;
>> +	hw_rev = (hw_version >> HW_VERSION_REVISION) & 0xFFF;
>> +	hw_step = (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
> 
> FIELD_GET()
> 
>> +	dev_dbg(tpg->camss->dev, "tpg HW Version = %u.%u.%u\n",
>> +		hw_gen, hw_rev, hw_step);
> 
> dev_dbg_once()
> 
> [...]
> 
>> +static int tpg_reset(struct tpg_device *tpg)
>> +{
>> +	writel_relaxed(0, tpg->base + TPG_CTRL);
>> +	writel_relaxed(0, tpg->base + TPG_TOP_IRQ_MASK);
>> +	writel_relaxed(1, tpg->base + TPG_TOP_IRQ_CLEAR);
>> +	writel_relaxed(1, tpg->base + TPG_IRQ_CMD);
>> +	writel_relaxed(1, tpg->base + TPG_CLEAR);
> 
> similar comment as before
> 
> Konrad

+1

the _relaxed() writes make me distinctly unrelaxed() and the magic 
numbers should be spelled out as bitfields with clear names. within reason.

For example 0xA5 is an obvious output pattern of alternating 1s and 0s.

---
bod

