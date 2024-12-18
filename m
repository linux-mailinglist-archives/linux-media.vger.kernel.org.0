Return-Path: <linux-media+bounces-23712-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 106919F6A57
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 16:46:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC38016B9BC
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 15:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950E71E9B3B;
	Wed, 18 Dec 2024 15:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DSJog4uP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227FE199FC1
	for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 15:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734536797; cv=none; b=MqeYwMsGfqHqTvK73odxpST3yVp3Z+yS75JunEH4d1kciBNuEghNNc04vxYBfV8CUNG19X+Hs3mZCvfHe7Nx8eoX0oS9sRHccPBRVW3TLkxqo/QlvEuLRD0KNA0TVPw8ER3oblV4wROtIl0xWt/ToxmI8xcej5xEaLb4+/X/dcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734536797; c=relaxed/simple;
	bh=xZf5lDO6YWOldIM2b2LrsHZ1Z40MqjFt89oMQDqpyWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=To7LoSFj6HGVvjpL9cKRFPWUQwbHK89PnIPfPTw1fgnymHNHwjKlUYZsRM4N43C45zZwkO37fttm5PQxu6kRIyutTX1AvKb9sG8xOUuzkJ5IYfdL6QYGjlLQTjoGqTjBREBhezcXOiaEA516ZPCZXUx5chY+XsWlIvIdOZB/oGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DSJog4uP; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3862df95f92so3410129f8f.2
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 07:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734536793; x=1735141593; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z2EgEzFAv05oHHf42SmQUCrTJ+zJjNHp/i0ikqKZxNY=;
        b=DSJog4uPNsF97xi+f5muWVzJxmIEwKlV/qm1U0UE4XfvNLKF6Cq7+zIK7JuqPlaKnA
         QO4LcslgoiXMn72L2I53NOQWMkABFwx3epx3InqX3SEyVdbcM9PKXjlvqXOSJ9mP3dlo
         +rmOScDukXEUBd+ZOa8HdhGXhFoNW+I6nEI+RWR1ojJMDTBEf8fZ0lkX71/RTjkWtmwM
         AYfcnqOzpDk8EWWpUi3AVNzMNeWtS5LsSakOEWX44KQMCldKsd5mOQCkVeT9fycxYhwl
         ASMjYTPT+ArIL97nq01W2rONtWEQXr/6wxUX/89/DnpsmtqTO3KMLOWbB+VBqQ2F+XM/
         5M7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734536793; x=1735141593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z2EgEzFAv05oHHf42SmQUCrTJ+zJjNHp/i0ikqKZxNY=;
        b=SrIxr6Uy5Euo3uUTx9yCp7DZWWFm0F7gjKRwgJzFPTvAXXOq9hAWF9hkZOY/hARl25
         EuqeQ0OsHT1wu71DeSePP6HZcQ/MsmShbghfuRN0Gj8yimA190IJ3/IhmsB/zyrtXORA
         7mvZoMBLk1PLovRxYam0ursU+0d3llHi03eL4dwYHFNY+fKOqOQBKlgbKqbOPQlvXEYh
         ZVchC1U4GkNtj7ZdvPYI529kqT3zCnkohWTsO7JznQaXSld62u73SuJCg+LJ/aEAdtq+
         V65BldFDsIyvZVHvGoP5wgKzvPbwHImOzFX9mSFGV7sL48tPteGteeHAIy4XpWCwtc9x
         y1SQ==
X-Gm-Message-State: AOJu0YwVjC+pMiVomJKhomSQZhr0z+9TsWZ7KYwCzUx+z/kyj3JHtDmS
	9IU8qJsVYkLk/mLGHHpKjx5In3Os4LcDytf8lC+I63owIBNkdNuMTBToJMsQN/Y=
X-Gm-Gg: ASbGncu9744J+7Xf9kvMSZXNa3zx5W2a75a38UenzqrvJBf9l54iUGiPYzTqIgPP5AM
	V20xpXPvFUmTJ+zqZ4vTn6iTdAkatUd/brP8zYpFMW5zWC3DZCMz305L1nWR2Nm9BD5Yb+audti
	NptdiTh+DXwSodIhBq8JgPdhNHjQhn4f2j/O2zneVplWFk+kr6i6/7b+Vz4Nvz3Nmn8Z1+3Vuir
	v7spMfihHyXkBcpY/6C63oi71z9JwQT1Jc6SDbp1BSveaccTypjdY9T+3fh2x1AOGhEaw==
X-Google-Smtp-Source: AGHT+IG94GoRiVcfFjPeUr2RpQNhCg6SxCkgVbLJvvqBnNPFRTM2uJUi3bA+OHTMbyjY6cjgVGYoIA==
X-Received: by 2002:a05:6000:4014:b0:385:d7f9:f15d with SMTP id ffacd0b85a97d-388e4d4b616mr3100855f8f.11.1734536793336;
        Wed, 18 Dec 2024 07:46:33 -0800 (PST)
Received: from [192.168.0.10] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8011feesm14235843f8f.21.2024.12.18.07.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 07:46:32 -0800 (PST)
Message-ID: <2d5a519c-deb1-486a-9453-7f2131e162cc@linaro.org>
Date: Wed, 18 Dec 2024 15:46:30 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: Remove unused hfi_core_ping()
To: linux@treblig.org, stanimir.k.varbanov@gmail.com,
 quic_vgarodia@quicinc.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241216220628.1018633-1-linux@treblig.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241216220628.1018633-1-linux@treblig.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/12/2024 22:06, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> hfi_core_ping() was added by 2017's
> commit 09c2845e8fe4 ("[media] media: venus: hfi: add Host Firmware
> Interface (HFI)")
> 
> but has remained unused.
> 
> Remove it.
> 
> It was the only caller of the ->core_ping member of hfi_ops,
> so remove it, and the venus_core_ping that it pointed to.
> 
> Note I've left pky_sys_ping which seems to be the lowest level
> definition of the command.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>   drivers/media/platform/qcom/venus/hfi.c       | 23 -------------------
>   drivers/media/platform/qcom/venus/hfi.h       |  2 --
>   drivers/media/platform/qcom/venus/hfi_venus.c | 11 ---------
>   3 files changed, 36 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi.c b/drivers/media/platform/qcom/venus/hfi.c
> index e00aedb41d16..675e6fd1e9fa 100644
> --- a/drivers/media/platform/qcom/venus/hfi.c
> +++ b/drivers/media/platform/qcom/venus/hfi.c
> @@ -138,29 +138,6 @@ int hfi_core_trigger_ssr(struct venus_core *core, u32 type)
>   	return core->ops->core_trigger_ssr(core, type);
>   }
>   
> -int hfi_core_ping(struct venus_core *core)
> -{
> -	int ret;
> -
> -	mutex_lock(&core->lock);
> -
> -	ret = core->ops->core_ping(core, 0xbeef);
> -	if (ret)
> -		goto unlock;
> -
> -	ret = wait_for_completion_timeout(&core->done, TIMEOUT);
> -	if (!ret) {
> -		ret = -ETIMEDOUT;
> -		goto unlock;
> -	}
> -	ret = 0;
> -	if (core->error != HFI_ERR_NONE)
> -		ret = -ENODEV;
> -unlock:
> -	mutex_unlock(&core->lock);
> -	return ret;
> -}
> -
>   static int wait_session_msg(struct venus_inst *inst)
>   {
>   	int ret;
> diff --git a/drivers/media/platform/qcom/venus/hfi.h b/drivers/media/platform/qcom/venus/hfi.h
> index f25d412d6553..0338841d5992 100644
> --- a/drivers/media/platform/qcom/venus/hfi.h
> +++ b/drivers/media/platform/qcom/venus/hfi.h
> @@ -108,7 +108,6 @@ struct hfi_inst_ops {
>   struct hfi_ops {
>   	int (*core_init)(struct venus_core *core);
>   	int (*core_deinit)(struct venus_core *core);
> -	int (*core_ping)(struct venus_core *core, u32 cookie);
>   	int (*core_trigger_ssr)(struct venus_core *core, u32 trigger_type);
>   
>   	int (*session_init)(struct venus_inst *inst, u32 session_type,
> @@ -152,7 +151,6 @@ int hfi_core_deinit(struct venus_core *core, bool blocking);
>   int hfi_core_suspend(struct venus_core *core);
>   int hfi_core_resume(struct venus_core *core, bool force);
>   int hfi_core_trigger_ssr(struct venus_core *core, u32 type);
> -int hfi_core_ping(struct venus_core *core);
>   int hfi_session_create(struct venus_inst *inst, const struct hfi_inst_ops *ops);
>   void hfi_session_destroy(struct venus_inst *inst);
>   int hfi_session_init(struct venus_inst *inst, u32 pixfmt);
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> index f9437b6412b9..a9167867063c 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -1178,16 +1178,6 @@ static int venus_core_deinit(struct venus_core *core)
>   	return 0;
>   }
>   
> -static int venus_core_ping(struct venus_core *core, u32 cookie)
> -{
> -	struct venus_hfi_device *hdev = to_hfi_priv(core);
> -	struct hfi_sys_ping_pkt pkt;
> -
> -	pkt_sys_ping(&pkt, cookie);
> -
> -	return venus_iface_cmdq_write(hdev, &pkt, false);
> -}
> -
>   static int venus_core_trigger_ssr(struct venus_core *core, u32 trigger_type)
>   {
>   	struct venus_hfi_device *hdev = to_hfi_priv(core);
> @@ -1639,7 +1629,6 @@ static int venus_suspend(struct venus_core *core)
>   static const struct hfi_ops venus_hfi_ops = {
>   	.core_init			= venus_core_init,
>   	.core_deinit			= venus_core_deinit,
> -	.core_ping			= venus_core_ping,
>   	.core_trigger_ssr		= venus_core_trigger_ssr,
>   
>   	.session_init			= venus_session_init,

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

