Return-Path: <linux-media+bounces-11352-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0278C29F6
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 20:33:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E35A82821CF
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 18:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28BB13FB31;
	Fri, 10 May 2024 18:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z4M+5nsV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D569817BA2
	for <linux-media@vger.kernel.org>; Fri, 10 May 2024 18:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715366004; cv=none; b=XAiUsVHYQ+uafmfUKLFZFbHQDKKxgplHSil+ShHfBqXFkorMKvgvva2KqN+97wWASav/8Zjoxv6n72tPio29vtVXcg1bSETe5SDIedOiwnwnn1dcBlZgTY4+RAvUET2cVnBzRKKEQOg8cyV3fpZUWTiigmIllQAckWy+jb5NhkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715366004; c=relaxed/simple;
	bh=5V6NaaZJsb3ycOSB/8E9nepCSSYaU/wkp8KeojjJGqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c9Mv0AxqZ0xYtMGzRktLM6WsAz0zqYcyijkx4jbiAGNnpwC9ECztaGoflcluIHb3+cDuC0WsRhGQDRaDzAPjrgRiwbo2zUWiltn8gHua15NtZS8uiXEPEGSSOfeh9qNCideRoeTVh3ZTmZvF9YJeuTBOm2+FcCHotmkppqrdMc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z4M+5nsV; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-34dc8d3fbf1so1748899f8f.1
        for <linux-media@vger.kernel.org>; Fri, 10 May 2024 11:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715366001; x=1715970801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D6cf5OkTy8/ggWCcTx4t2j3ZHoM3l7oNZ1OwIDi3O6A=;
        b=z4M+5nsV5hwX2MV34LO35CfbkZsVBzsz3rtzaoBk8rOXJsQuOwVU5f5i+3HN8B66kb
         zY/ZK8iMd73HTFoLH33h9T3VqZjmYRyKt9tF1qetyA2DObj4ZjXBLkmK6Si6rT/iRcuq
         jKDVIWoL9b1XSgcO2kRkS0aR0/95epIJ+lPNvWMH8o2Euk4P03F93qIm3cKfzLfAMKPR
         GmUAHNPvNRh5fusf+aKUYcOamr9X76cHm+geaAsS5YvI3gZU5sfH95UzEWfR/0zpHNwv
         qgB6/qOlqwnpCi0Fn+4pzWX2zi0xT3tJD2Ib0Uf55GzIz3SUlpjNU2ZHCCoMJHBEEQUG
         bLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715366001; x=1715970801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D6cf5OkTy8/ggWCcTx4t2j3ZHoM3l7oNZ1OwIDi3O6A=;
        b=nCakOSE8d16kZ1zmZMCjT4S9I3ZsLZhcI5g7B/tKHChE3QyOQSB8upfEJY7MECPBPw
         QGupngXlOk+htOV3iztGVCumz+ejTbC3O7bk7qR5pgUhadjvxwDc3wnhU7AmUHPfLunR
         kHh+LdcESByDuN+POtAsJkO0TR42UjVE/T5qfRGVtLqWwicLL9CC9EWB+gR6maFNrGi7
         S1Ermydy674VMHZ09Tt1D5DbLBkPIm+nOWc8qKLMhGGar9MAjNzV8rSKhGkqiy2SweCZ
         Bu6XMgjezg+lbK/ep7KjAV7DcoIowpRvOjE/9cINmoSeCyuLqApa5od+dmK94VUHKCk+
         3sWg==
X-Gm-Message-State: AOJu0Yxq28zCGEsGqY2xLDWW9eLa6HsscX8wR9Ww4tsAJnJoUHE8RxAA
	pawFTmZza3Jw9nXaT4NC0QbW86xZdPTYddFLhCNTnmmkcJZaK2DlB9yhwSC094w=
X-Google-Smtp-Source: AGHT+IElm2yB4cFYhA7Skzvf7EK7GSKMnjRoxe9T7mRmzwxlYpR9kULlphxmoxxXVATBTGiQuX7M1Q==
X-Received: by 2002:a5d:554f:0:b0:34d:7a12:454b with SMTP id ffacd0b85a97d-3504a737a2amr2218343f8f.39.1715366001247;
        Fri, 10 May 2024 11:33:21 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502baacef2sm5237210f8f.85.2024.05.10.11.33.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 May 2024 11:33:20 -0700 (PDT)
Message-ID: <badf2bae-450a-4902-bdd7-651cf3f27725@linaro.org>
Date: Fri, 10 May 2024 19:33:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] Move camss version related defs in to resources
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240411124543.199-1-quic_grosikop@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240411124543.199-1-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2024 13:45, Gjorgji Rosikopulos wrote:

> Changes in V3:
> - Incorporate missing changes in resources reported and fixed by
>    Bryan O'Donoghue <bryan.odonoghue@linaro.org> taken from the branch:
>    https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/sc8280xp-6.9-rc1-camss-resource-change-verification?ref_type=heads
> - Added missing signed-off to the changes submitted by me.
Took a little while to verify this series on the four reference 
platforms on a reasonable base of -next or -stable.

Here's the reference branch:

https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-stable-24-05-10--x13s-mmsol-integration-in-test-imx577-fix-rb3-gen1-debug?ref_type=heads

@Hans I'd be grateful if you can pull Gjorgji's series in at your 
earliest convenience.

---
bod

