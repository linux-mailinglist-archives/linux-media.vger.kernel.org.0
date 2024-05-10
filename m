Return-Path: <linux-media+bounces-11351-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ABC8C29E8
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 20:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8BE51F24772
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 18:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 806274436C;
	Fri, 10 May 2024 18:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="exrv/JPa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B49E3EA98
	for <linux-media@vger.kernel.org>; Fri, 10 May 2024 18:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715365777; cv=none; b=tX3v2lQ0Y5Cc7w5rwxvNyHnfloybv1dQbgarE8z37N9FiH55aj4fH5ziIzINznUwqD3w75D2SRZrMruu2OBInqzDcvj939bvGjQG9BTIYTsgVcbgq1am9cuCaQsbJ34NoOeByHYaJpFlZw3pOSg/hZOg7EizioK8NVTUMHkJc9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715365777; c=relaxed/simple;
	bh=EgK6fR9aZKsoYGeYx2mAvEsnIF6BMRocn8hw7CrzdSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LVwfLSjkasdu5PV9sjfjVFAB9+sejatK3jA6hsWZz5oTVPkgAn0zqY3iYQ2qp9g0LuBV/96KY0Zwib+dfmaVDq/AMooIKG0Fhfs9BvTFFhUiiP2VhzLrn76KuiOFvbu8L+XDyQyZzECDb69eB+Ug10CDHeoeJEt5p3QNIPt5eSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=exrv/JPa; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-34db6a299b2so1776964f8f.3
        for <linux-media@vger.kernel.org>; Fri, 10 May 2024 11:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715365774; x=1715970574; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zt3EkIKwnjg38v0bTK+4D69dHc2YvVLV2wDfHrRVqgw=;
        b=exrv/JPasyUrrgLGmIiAsPRARZ5E4SHGxa0kVfzNjE/FNXHymr33dmc4JqRo11v5lY
         pGGrPZQidfR9Dhi7S8g9lMgxx6kas+kkJmfpQuSje5zi015C/FVKQNW7VOwXPNoaL6J8
         gg4Z2G0WrKRExuc7hnZKA2ElVRS5ri6nTLUOEw2M/UJbFF0lZ2civ2+QM1Qb8DrCkluS
         YZE0OHRQgIBPzM9H44uJ3SA7zSmLA5M9psMtOpBR52ht0gk6+TTyFz3N9rp+fjqwhEZ8
         vS91jdhI304A/oVMGqHCHXwyckIC+dOFq8qlrWCTk2OlJnwudtclpmtr6fJ5qMUfNCxW
         /qSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715365774; x=1715970574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zt3EkIKwnjg38v0bTK+4D69dHc2YvVLV2wDfHrRVqgw=;
        b=fHxdmwekl6VFK1YtJcQO95l1Da5Zx6h2CRd3EKRuvrEW32RzeMzlDqzD0AjToFvdzZ
         15XLxY8qSiNbThOJaLsT5s9HCHUB3lRxnID11aCBws7+w7ASaTF6Prgd1U05y4KBxuzy
         9X7i9S55uVmnLzpLiFkvv8ZlgLsvWO4gQ8qkQ46ixObVMAhmeFqrXslvUsALdeXSVMAU
         Ro0b0Jf9U8+3MYCHI0bwZd0ar/Z5zTX668SQgiI2/b0v2UZiPbC4rqULmbEmfooEAmLb
         ihT4YBnk2bPdHiaoL6O1tsJCNGSfP7uuM5CRW5yZP895ySLVb4IB2irfSPYIc9vZktxa
         IgWw==
X-Gm-Message-State: AOJu0YyVMx7lBaN/pXhM5J/qqvuStwQ+pnnmJx8MVy7YLly+NPDevVDF
	+zZqHtWZz3cYu8qEGCeKQWfUQFWFMg/oqht+sXx2VrUIUjgsLamb+quhYzHioHU=
X-Google-Smtp-Source: AGHT+IH7mAoXaXavj8mRmL7l6DfAUlfhF7EyxxACp4n/W9aIfft0HitTTk+c0fC32xST4ImnnFrsng==
X-Received: by 2002:a5d:4e8d:0:b0:343:65a8:406d with SMTP id ffacd0b85a97d-3504aa62d37mr2871590f8f.64.1715365774680;
        Fri, 10 May 2024 11:29:34 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbbc887sm5150649f8f.98.2024.05.10.11.29.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 May 2024 11:29:34 -0700 (PDT)
Message-ID: <cf7e023a-3d8f-4c49-a167-01cdea634daf@linaro.org>
Date: Fri, 10 May 2024 19:29:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] media: qcom: camss: Decouple VFE from CSID
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240411124543.199-1-quic_grosikop@quicinc.com>
 <20240411124543.199-9-quic_grosikop@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240411124543.199-9-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2024 13:45, Gjorgji Rosikopulos wrote:
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
> ---

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # 
sc8280xp/sm8250/sdm845/apq8016


