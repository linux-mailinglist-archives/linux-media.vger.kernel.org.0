Return-Path: <linux-media+bounces-2632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA26817CAE
	for <lists+linux-media@lfdr.de>; Mon, 18 Dec 2023 22:40:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4693E1C21D2C
	for <lists+linux-media@lfdr.de>; Mon, 18 Dec 2023 21:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6DD3740BA;
	Mon, 18 Dec 2023 21:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gVUmpJuB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944A01DA3A
	for <linux-media@vger.kernel.org>; Mon, 18 Dec 2023 21:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ca0715f0faso45603611fa.0
        for <linux-media@vger.kernel.org>; Mon, 18 Dec 2023 13:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702935612; x=1703540412; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ZP8jFHXWTr4vb3Y+JKCeFx8DOpmH9c0oYrJg8N3eYg=;
        b=gVUmpJuB2uIUzkebpvqUgpc4XpFE1KAJ0FFY0+t9neuvNXVWkkJlb+JjC65GzCluHW
         9ZnMzkOEUoqLdQnuU2+sCVl0CEU9c+LbwYlFogw2m2JF8/aU6/Z8LNE5/L/NJ+fYlDlq
         EryhKDcinAw2W1S9ICqJa4aRO7gox79vLysRC52+vHNFqiYabGqiX1NNxZsjBnZKtCah
         jTUef7tc5Xj7QSN0gHyKXBEUZ86rPA1pUxCz12wgYR8MykPSAuhsHvfFpVUE6qbIl36p
         UhN2EL9ncO4eoFh1bG3l6RiaIGJHQYjceOGt9eHMuS6LiOsWawwgsoHwVKFjfqb/Zh0o
         5nNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702935612; x=1703540412;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZP8jFHXWTr4vb3Y+JKCeFx8DOpmH9c0oYrJg8N3eYg=;
        b=TYsOkTf6X3rV+jQl2uc3y0hx3i+LwOt4pFUpEPieNRg+3ZKcI9espjF7EdVJoPrbP5
         sm1BfwnP6D/kzd2K7iDD0TE9o76qaU+PVycyXxZFmRhV0LA9UcAak8YTj+jl4eBPgWDO
         cAXAwbXLw2+To+nCJpnmtQTODmCorcGZX0CH5+cf2f5oQWcH1oqBjGZ7d+DESbt+qhN1
         dwfHruzmi3bAzVGtM5Pfe4nRuFHibIk/eyoxrFlD4kgSDm8o6Dcc06hyOu89VxH7dlLk
         fU0xAmY+j3ntUIfPAsq+3wBtOYDJn0VIC8mw6nUWuux4Z+eWyNXPbO7ljEkacyJlSL+x
         d7jQ==
X-Gm-Message-State: AOJu0YySYREjdyMMZs1qtx+40GOzpvZf7Bs52aV/meQcDpDEmST4l3tT
	J8HTAUZy01VqlDLCOYqI+0Wiug==
X-Google-Smtp-Source: AGHT+IFczDoqn8AaBKyIt177lFj05ENoSb4SGBopxiZn4ZATbfx3W8h02XeSUF3wtck5EyiETRHOdg==
X-Received: by 2002:a05:651c:1690:b0:2cc:5fac:a506 with SMTP id bd16-20020a05651c169000b002cc5faca506mr1567523ljb.16.1702935611675;
        Mon, 18 Dec 2023 13:40:11 -0800 (PST)
Received: from [172.30.205.119] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id n19-20020a2e9053000000b002cc6ed62a66sm622005ljg.83.2023.12.18.13.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 13:40:11 -0800 (PST)
Message-ID: <2997fa9b-2702-437c-ac46-118808f1138a@linaro.org>
Date: Mon, 18 Dec 2023 22:40:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/34] media: iris: add PIL functionality for video
 firmware
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stanimir.k.varbanov@gmail.com, quic_vgarodia@quicinc.com, agross@kernel.org,
 andersson@kernel.org, mchehab@kernel.org, bryan.odonoghue@linaro.org
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com
References: <1702899149-21321-1-git-send-email-quic_dikshita@quicinc.com>
 <1702899149-21321-11-git-send-email-quic_dikshita@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <1702899149-21321-11-git-send-email-quic_dikshita@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/18/23 12:32, Dikshita Agarwal wrote:
> Load/unload firmware in memory via mdt loader.
> Firmware loading is part of core initialization
> and unloading is part of core de-initialization.
> This also changes the core states accordingly.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
[...]

> +
> +#include "iris_core.h"
> +#include "iris_helpers.h"
> +#include "iris_hfi.h"
> +#include "iris_state.h"
> +
> +static int iris_core_deinit_locked(struct iris_core *core)
I suppose you meant to call this something like _nolock, as
you're calling it with a lock around it

> +{
> +	int ret;
> +
> +	ret = check_core_lock(core);
> +	if (ret)
> +		return ret;
> +
> +	if (core->state == IRIS_CORE_DEINIT)
> +		return 0;
> +
> +	iris_hfi_core_deinit(core);
> +
> +	iris_change_core_state(core, IRIS_CORE_DEINIT);
You're casually ignoring the return value of the two
above funcs here :/

> +
> +	return ret;
> +}
> +
> +int iris_core_deinit(struct iris_core *core)
> +{
> +	int ret;
> +
> +	mutex_lock(&core->lock);
> +	ret = iris_core_deinit_locked(core);
> +	mutex_unlock(&core->lock);
> +
> +	return ret;
> +}
> +
> +int iris_core_init(struct iris_core *core)
> +{
> +	int ret = 0;
> +
> +	mutex_lock(&core->lock);
You may be interested in scoped mutexes

> +	if (core_in_valid_state(core)) {
> +		goto unlock;
> +	} else if (core->state == IRIS_CORE_ERROR) {
> +		ret = -EINVAL;
> +		goto unlock;
> +	}
> +
> +	if (iris_change_core_state(core, IRIS_CORE_INIT_WAIT)) {
> +		iris_change_core_state(core, IRIS_CORE_ERROR);
> +		ret = -EINVAL;
> +		goto unlock;
> +	}
> +
> +	ret = iris_hfi_core_init(core);
> +	if (ret) {
> +		iris_change_core_state(core, IRIS_CORE_ERROR);
> +		dev_err(core->dev, "%s: core init failed\n", __func__);
__func__ still seems overly verbose in my eyes

[...]

> +
> +int check_core_lock(struct iris_core *core)
> +{
> +	bool fatal = !mutex_is_locked(&core->lock);
> +
> +	WARN_ON(fatal);
> +
> +	return fatal ? -EINVAL : 0;
You can simply inline this:

if (WARN_ON(!mutex_is_locked(&core->lock))
	return -EINVAL;

[...]
> +#define CP_START           0
> +#define CP_SIZE            0x25800000
> +#define CP_NONPIXEL_START  0x01000000
> +#define CP_NONPIXEL_SIZE   0x24800000
> +
> +#define FW_NAME "vpu30_4v.mbn"
This doesn't scale, at all.

Konrad

