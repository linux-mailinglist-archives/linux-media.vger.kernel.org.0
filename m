Return-Path: <linux-media+bounces-40533-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A0DB2F06A
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 10:02:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD1B23A85CE
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 08:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C4112EAB79;
	Thu, 21 Aug 2025 08:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lPXpavYv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31432EA14E
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 08:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755763288; cv=none; b=LnuFrPEVMGvc2J2a7xWwTPsZQAU5YIrpDqpTO0WrjHxkf9zs9gg91D/TWC/TcJxeYBeqRq+zR5JtnWLSiE1eOZmqec7C3u3Qiav3U1fs8k/Wy+3aX6wWyyQ3stvCMgZKbHxG1P/leX0knYkaIq88EfBMmnEG3VsVNetjF/4PYns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755763288; c=relaxed/simple;
	bh=oZLJpaFA1XQqrArXlzUBWsQNthOhGI0qtYmaSRqQPTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YWtF7RL/l2XdC1DaMWVjMumo82eu+bCJItYwELW7R9Rjg08FKQTyF7ctvxv0mamI7Xd3UkbCTSYKSIDGprh952Tol6zQ8AvmKdPkG9EHswNI4eYGWydkO0if3eeIyIaYc/5EnaTlagpp7z3V18/oIbmJlNRcMbAPmefGalMs0Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lPXpavYv; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a1b05d252so4945335e9.1
        for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 01:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755763284; x=1756368084; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iNGT98klqSv2rZl0EJTYaB+wlY9yv0npHx6OP4ljkeY=;
        b=lPXpavYvHhVKV9hUtYe8IH3KqW1LI6mGgoofrXSLMjgtFK2hhEuX2V589fF4UFaS/d
         lLyu7i/mkUkhWlGL62hoqhdA6/WNDkruw1OBGLY4CPEfLaMaWSEgKkjXwgOZSApn7+b4
         sTwwe64yXZPLXsQ0kIjjIzlbEGXEtMIsIBYgzXczpmFuTH18LVrAHgHWfjl+RCEo5+WU
         eykx/hedcZUAZVx4RdMEmhcbyns/CHatxJgarQARMYAxzRKnO2SWCUmqJtCijOxuqhKQ
         sMR7gUYQUMtD7DUdZ17dIYYq7g89zaROF9callkTBZ9znyulHElpY7HLVyOX4C/i+r7T
         3RFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755763284; x=1756368084;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iNGT98klqSv2rZl0EJTYaB+wlY9yv0npHx6OP4ljkeY=;
        b=pwng9XlaGK7ME6xjgjR0hYEimfcZybzUmncVFgaMnk33sXcOSwm7Evu4Bnuwop6h/h
         qjG+mMBnxQV+t60Q9UbzApOb47vgpuScjgbmnDvvdSeZ8N39RKJJdc3DMB8bKZ2cYdup
         NltVlXUiThqPjngOuQaDvempeaVcbSs8UcBWHvIQufiVU8tpMeKJrMTNd++XDSVlYgpe
         ykMtaku9AmRmqjYAgOqpCkKgH0pAFgVPeZnaFlNVin2KdQL2ZwEMFGrEO85wGED3bEcp
         hN7hN9YTqGiHJD+zrYctnSgv4iTgqvB4b3hdSxjVjzhJYausYVXM0uVuWb4euuqPSSmO
         KaRw==
X-Forwarded-Encrypted: i=1; AJvYcCUyT9QvnOgr9rv2JBIDRZP8WvPwS4YLYmqTjKcgRCiKpxMneZGfxCku6Sy6QMGOC/V4jI593FmG5kjANg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcze55Lafo3p97TRtaGWI85lynUJlQiKxYZx2KDU0qmubNoG7X
	I+6bXvrQO3XFcOGOZD9n8k6IsKv12Q3ccsAVKs2uuqZX39ljWLeEbSWmUnT0IUpveG4=
X-Gm-Gg: ASbGncsf7MsfpnZkzxxIyJB+IkDGmMC1yLjS8zH/tBG/uDum3ntH82sOeYjBslVG6rW
	QCACdhkCcmzdCA9pgJwneRis4sT0XhmtDjbU2dqIQzEJ76EErOYSIqL39peH7xmvVh0c1k3HGsh
	+uahJWpaB/lQe3A03sjqnpZf/nBHG2Hv0TsFX+eOWqpFD9QY960/UxWo5XAsGCGH3xyRIXsCcDQ
	aEp7dRJlfJ3FjOOEMq85n4L+U5ZnABv2ezpi2ipnWErTHb/2kVzxUKv9cjY9JaKYX0lPU5pjzSl
	gXbD4bK02UJlRxmB+ZaZ86l5ILXe9FW4HqzcTMG6Z+2+CXFSS5MLSqQpHSuOHzj0wNFBjGMgG0J
	2GydIHqTpVKP8vU7b5bA6jhoGCGr7+qY5Li+aoxUFO13tZ+omPbvg5HWcMyqT6Kc=
X-Google-Smtp-Source: AGHT+IHCjFPjgsVt7tr3xezlGae2i3luW4j7fhzwL2N2wuLceLA5EUcPHt7ylepsbKjsUGTs+yYXqg==
X-Received: by 2002:a05:600c:45d4:b0:459:da76:d7aa with SMTP id 5b1f17b1804b1-45b4d84ff9fmr10651545e9.25.1755763284010;
        Thu, 21 Aug 2025 01:01:24 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4dba004bsm17558505e9.24.2025.08.21.01.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 01:01:23 -0700 (PDT)
Message-ID: <8f337afc-32aa-47cc-afb5-7d5785d3e377@linaro.org>
Date: Thu, 21 Aug 2025 09:01:21 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: firmware: Use correct reset sequence for
 IRIS2
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250820-venus-iris2-no-tz-v1-1-9ebcc343195a@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250820-venus-iris2-no-tz-v1-1-9ebcc343195a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/08/2025 16:16, Stephan Gerhold wrote:
> When starting venus with the "no_tz" code path, IRIS2 needs the same
> boot/reset sequence as IRIS2_1. This is because most of the registers were
> moved to the "wrapper_tz_base", which is already defined for both IRIS2 and
> IRIS2_1 inside core.c. Add IRIS2 to the checks inside firmware.c as well to
> make sure that it uses the correct reset sequence.
> 
> Both IRIS and IRIS2_1 are HFI v6 variants, so the correct sequence was used
> before commit c38610f8981e ("media: venus: firmware: Sanitize
> per-VPU-version").
> 
> Fixes: c38610f8981e ("media: venus: firmware: Sanitize per-VPU-version")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   drivers/media/platform/qcom/venus/firmware.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 66a18830e66dac2acbe11751a8c250876e20d795..4e2636b0536693a86dc51503d01dc2bca40b532a 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -30,7 +30,7 @@ static void venus_reset_cpu(struct venus_core *core)
>   	u32 fw_size = core->fw.mapped_mem_size;
>   	void __iomem *wrapper_base;
>   
> -	if (IS_IRIS2_1(core))
> +	if (IS_IRIS2(core) || IS_IRIS2_1(core))
>   		wrapper_base = core->wrapper_tz_base;
>   	else
>   		wrapper_base = core->wrapper_base;
> @@ -42,7 +42,7 @@ static void venus_reset_cpu(struct venus_core *core)
>   	writel(fw_size, wrapper_base + WRAPPER_NONPIX_START_ADDR);
>   	writel(fw_size, wrapper_base + WRAPPER_NONPIX_END_ADDR);
>   
> -	if (IS_IRIS2_1(core)) {
> +	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
>   		/* Bring XTSS out of reset */
>   		writel(0, wrapper_base + WRAPPER_TZ_XTSS_SW_RESET);
>   	} else {
> @@ -68,7 +68,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
>   	if (resume) {
>   		venus_reset_cpu(core);
>   	} else {
> -		if (IS_IRIS2_1(core))
> +		if (IS_IRIS2(core) || IS_IRIS2_1(core))
>   			writel(WRAPPER_XTSS_SW_RESET_BIT,
>   			       core->wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
>   		else
> @@ -181,7 +181,7 @@ static int venus_shutdown_no_tz(struct venus_core *core)
>   	void __iomem *wrapper_base = core->wrapper_base;
>   	void __iomem *wrapper_tz_base = core->wrapper_tz_base;
>   
> -	if (IS_IRIS2_1(core)) {
> +	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
>   		/* Assert the reset to XTSS */
>   		reg = readl(wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
>   		reg |= WRAPPER_XTSS_SW_RESET_BIT;
> 
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250815-venus-iris2-no-tz-f9b52f33c4d0
> 
> Best regards,
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

