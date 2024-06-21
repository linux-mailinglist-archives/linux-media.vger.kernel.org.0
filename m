Return-Path: <linux-media+bounces-13954-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 399139128EB
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 17:07:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E473C1F2997C
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 15:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253625A7AA;
	Fri, 21 Jun 2024 15:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GkRVuqFI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1810612D1EB
	for <linux-media@vger.kernel.org>; Fri, 21 Jun 2024 15:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718982374; cv=none; b=RKwMyaxuFLSf+WzzpYmhb4KZ1pCHNQmKR4CqK26Ve8nrAJGgefhFENb30hPTcDL3pIQLOqpnfxyt5bFEj2DQp5mDD3aI0ppdBvwQiamQkvvxewdZ5pOpILbeKfFNvdXoN4coSMtdiVkABTPEP/1+52hqAln5x8AKrxGG4KQ/nN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718982374; c=relaxed/simple;
	bh=KIq2vtY9qM91UnJhde07LqckDFTuSKg/5Ph8JpMdh2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y305zA6auFchxHJoB1688qFkDMo+rpcE5vglyN2iFkaxYraQUqt52CF3a6WIK48ef+M0GrRDoGm9SXqIlTh8uLtT+GsqX4vkto7l92CEI1DuB2Rbz1IREiuQ85o+X8Ztm3eqa7gi1Fv3yLcX1VVnK2tRBGmjh653rhRWClHOZ8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GkRVuqFI; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4247f36f689so13686505e9.1
        for <linux-media@vger.kernel.org>; Fri, 21 Jun 2024 08:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718982371; x=1719587171; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BP5DlVBjipSk1p4cQPpHRbKc5ISqz6jYjFtQC0DyCyc=;
        b=GkRVuqFIkp38NR84SU8L+PdAVHDGgRfMTe4ygIVViVbqJw/Gjzmmn+AOC+6Xbavn3N
         /6YOd7ZLa8dZ5rfv2qBdTlhIUaEIAy8ynC7++RLd9m9ymhbz8M+JjOIwGEUQfX1zVIAw
         xn15sab8VrdTuG8ycN455bU9MnTjda9ot/YVe0/KVS6Dv/0dCifR+drcKz+K/K/Ais8N
         k4XLtj0gGYVsoGZvvvXO/fFflcGQz/smKxFPgtXa7cIOj+HUK2XRohiTMgjq8Fuz99gT
         yfVdX4BFoBTodKe8N/ngMJfjUrnkHvtgWD2zk6pSQPqB/OF25g/T6auJeplgzpBsxFz4
         1RjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718982371; x=1719587171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BP5DlVBjipSk1p4cQPpHRbKc5ISqz6jYjFtQC0DyCyc=;
        b=UCFiP8Lx5Gtjtv5VZ3eoRmJYbe7CD2i4Z4aUGWe56cK3TCZMpHDD2WEv1E/nuSsmNN
         CaIgmn0ccaNt3D9rzwtO+p/zUS5btjXO08X0jrGHq+WkPF1VNj218B6RLuViG9A4sZiI
         CBP/nVJBkvd2TrUIXc+YHRyZ6f/rEHlFLarfJX4m8LQEbPj46sP3Le+n747q9SjxWvla
         D/psb4A/x7hZm5TnLB+G06pWO19lceeY3OtF2zPNwdSPH9HhMR7N61uyWPPmubYsQ14I
         V5efwh+sVz1MAIkFpk0qmq5ckaQ/+9xeJUfOFJOPpMhglOghxCw4V2cJ/DzIuL3UnUYz
         qKyw==
X-Gm-Message-State: AOJu0YyzVCot19eDkpFdTMhDASgVAiq3mLf6bzcWBHgGEDKvSG/9BpZ6
	l2zi++3jBI7mqob0V460EWl5aat+NgF4kZyaYkRtF+yf2aQoJ8TmQA7A9FiX094=
X-Google-Smtp-Source: AGHT+IHHBo2mNBPPzrQ61HU71s2NqdGBN/GsYGlKnm+7ZW7VdfZfbNbVUtky0Nd/hnsz+mF+OJOPHg==
X-Received: by 2002:a05:600c:63d6:b0:423:b672:9d64 with SMTP id 5b1f17b1804b1-4247517dde6mr63390095e9.18.1718982371436;
        Fri, 21 Jun 2024 08:06:11 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0c54c9sm68710035e9.27.2024.06.21.08.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 08:06:10 -0700 (PDT)
Message-ID: <ae88c6fa-a55c-42f9-bdf4-6850405e9ccd@linaro.org>
Date: Fri, 21 Jun 2024 16:06:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] media: qcom: camss: Decouple VFE from CSID
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240522154659.510-1-quic_grosikop@quicinc.com>
 <20240522154659.510-9-quic_grosikop@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240522154659.510-9-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/05/2024 16:46, Gjorgji Rosikopulos wrote:
> From: Milen Mitkov <quic_mmitkov@quicinc.com>
> 
> Decouple the direct calls to VFE's vfe_get/put in the CSID subdev
> in order to prepare for the introduction of IFE subdev.
> 
> Also decouple CSID base address from VFE since on the Titan platform
> CSID register base address resides within VFE's base address.
> 
> Signed-off-by: Milen Mitkov <quic_mmitkov@quicinc.com>
> Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # sc8280xp/sm8250/sdm845/apq8016
> ---

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


