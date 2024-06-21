Return-Path: <linux-media+bounces-13947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C87C9128D3
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 17:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A81B28BD13
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 15:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7472482CD;
	Fri, 21 Jun 2024 15:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hC0rpCk7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DEB38F91
	for <linux-media@vger.kernel.org>; Fri, 21 Jun 2024 15:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718982255; cv=none; b=boejWZnzD50eLtnQTMEh0JYtfJ2lnkhdBBcoTrByq/dfV3ZZoyE29UBU23pHl891hyKBKqw0cewBz2GaffEuFyAswrPsworWeB48s2th1ewNLcdvyHpGTuJUNntPPYqZcFh5/NBhBCk1H/Lz4/xo9w+1tvbxH73w6ZQvSivrK9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718982255; c=relaxed/simple;
	bh=tGxhqw3mLbyQg4cUxLWRr6aTTDhcpAjGVSBMHcj9ves=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lbX722X9HhOlTDLNZDjc47hARTkg/IyoFaRDjyM6ra7dOofJ3M/ANVsfc0aeVGD+9+Tg6bFtRWcGaUNX8vnNAR0sdm9M6rT6CojytEKU2ZyQpSejZPU6EdyF4+Ui8+Zdf2F03qJNo86n8taSYAryiJTosLurj/AxyTy/wDLaPGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hC0rpCk7; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5295eb47b48so2634447e87.1
        for <linux-media@vger.kernel.org>; Fri, 21 Jun 2024 08:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718982252; x=1719587052; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6JvYMRLvuuvL4w7w35/VjTNcpNDV51nrNPfhIyrJ3tg=;
        b=hC0rpCk7Nd3LE9CvfjyPcZb3bzjmgcFkXmroF5UzWrb67ba/KI7bD5aQ+MUP2fXljF
         MuGzPMsR5EQZzhx9em8r+0EA+B3ltF48nKiFr0CEMNbPgyE1pbDEpgSHSQYiWuPL8FaO
         cF0I0i6Fo82emN0NUG6Ik5+3bisOVAmRBxxYE3gJH5rQMQ+wbcjkmWRnemj6DpinD3XL
         KrsKrPR47POfGZ7X00SVxs0CVn32puAXl+NxhMN3viYP6RZA10iRtiuClvLwPkjfCkHs
         GEbzsU2cDJMSB6tnM2GWX/Df3+7OZoRWsyuv7DicpgOlvrBRiuwwVaiIvnrGDSwxWE3i
         kBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718982252; x=1719587052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6JvYMRLvuuvL4w7w35/VjTNcpNDV51nrNPfhIyrJ3tg=;
        b=K1bqjoCWTKU1GR6YrODzRRbJQM3JqKCSp5Zoa6aKH8lDAWWa1GFxhPuoslp4ul3w45
         mV5RK5MVHmW8GNI4Pfs+wbeMvxd908KP3ua7gbcR6YNSzXDZqCjsOaYSOjTDoujDxxzZ
         T13Cp2YW0JW+dfTKeyBS16yAS++IKhyA0eUYmL3M24n9KOcK2azFz+VUmmHIabi1wCC8
         Nc+CjkGrrdm7Zgoo27uRgSuHnsqYMHRjNXFMAjeO2i2hVlR/P9d/vyLgA0400bzrQ0tU
         nyicGecFsrryQ1qZ6QoDlowfiv2DKcMH3ImdKJCI2HaqWVfU4zlqms5c+VHLrM0cIba6
         bpIA==
X-Gm-Message-State: AOJu0YxvhEHPHYaXqf4gdGc/07wPOa6JLt/mr+VTV7IuzxKgmOaIHCLw
	cT1I2oCAgH0xpz1upGG67nRfE/Ymxu7wf1OVBMLwyeWz6OZR3auN49TScZ8bPnJKlmzYOkA3rnp
	2lJvxBg==
X-Google-Smtp-Source: AGHT+IHsoccQ6WNTSCRvP7EXynKaqiN40TtOBGADHnLgqIHVRwl6CbCcueYYZRBTQP0LCEkJiNpa/A==
X-Received: by 2002:ac2:57c4:0:b0:52c:9e2d:2683 with SMTP id 2adb3069b0e04-52ccaa55878mr5449345e87.3.1718982251688;
        Fri, 21 Jun 2024 08:04:11 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366389b8985sm2013455f8f.43.2024.06.21.08.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 08:04:11 -0700 (PDT)
Message-ID: <46cb6ffb-68cc-4d36-81f3-f0be0fa6aafc@linaro.org>
Date: Fri, 21 Jun 2024 16:04:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] media: qcom: camss: Add per sub-device type
 resources
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240522154659.510-1-quic_grosikop@quicinc.com>
 <20240522154659.510-2-quic_grosikop@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240522154659.510-2-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/05/2024 16:46, Gjorgji Rosikopulos wrote:
> From: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
> 
> Currently resources structure grows with additional parameters required for
> each sub-deivce. However each sub-device has some specific resources or
> configurations which need to be passed during the initialization.
> 
> This change adds per sub-device type structure to simplify the things
> and removes the magical void pointer to hw_ops.
> 
> Signed-off-by: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
> Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # sc8280xp/sm8250/sdm845/apq8016
> ---

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


