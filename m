Return-Path: <linux-media+bounces-13953-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1611691293C
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 17:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C413B2E60B
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 15:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C7C081AC3;
	Fri, 21 Jun 2024 15:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nqu0vAR6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2210F55E73
	for <linux-media@vger.kernel.org>; Fri, 21 Jun 2024 15:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718982357; cv=none; b=Mk3zuOCYXDo+1vrNykKNFgeYw1+eDWkn4iyZa0Ij07QjrYxZgV5ZKA645dUdz58kCbfx8c28Dne+zhhr42orMWZrOs19ddtXWxTb9shQzVFMFZRjMHhFxetu9A4bS/+wraNGJtNtc2NxDDQQzmNjfkEFyOSMXBlQWEjFGRSS9Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718982357; c=relaxed/simple;
	bh=G+mYgkoXZiQsyDpucn2Iesz72bn8U+Hhkl0q0srU2NE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZOD3sDp6XuxqGgf0Fzv6n+3Wh0m3TSmduU4FXF8txT5tOgwg2IU8bhVlDEEjMOIXHmIwBReWtBUA0+Ru8s8WsHAs8IGOqiqLU3yhncocpYZ0Nc4F9u4CiPAdQdElHIWvCo224hOSwAZYI6X52R7ZWp+dIiX3UJhZezcDXFQ5BH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nqu0vAR6; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52ccc40e72eso1699644e87.3
        for <linux-media@vger.kernel.org>; Fri, 21 Jun 2024 08:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718982354; x=1719587154; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n0zXKUpFt3HIy66YqTJgW3hPCLpl7FlzWR/y3/jevlk=;
        b=Nqu0vAR64jyg+T8Lit6A00XAT+pc6jvbStvhXYqJzszPtL9YKhVAKZLgkngi37v7b8
         1zhAMMdNE0iqS+b4HEAm5QNrmL231zLSbzuD/K0N3JmVl1xudyInrgPMAKBS0O4skQk7
         SNe47BW0I/9qCAPS4zR6NTrNrRsjri+l4o1V/92e6rNZ62LaWlHmkmqWd3UNGPPK2AT9
         SsEF5qLBV8fM70hHrbj4N46MF1mPHKwrOCzwj38drzCpysrB930N+kTuxG4QX4pmFalk
         U6lHUb0DIDC5wVnAnnAvdoX7Q2uYDy2kDEIE6OgMdn/Ra8jPHRIMyvfpkBwxDAKRPe06
         +x8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718982354; x=1719587154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n0zXKUpFt3HIy66YqTJgW3hPCLpl7FlzWR/y3/jevlk=;
        b=ZU812mGEXyHavlpYt2MoxsSpnj3xlWbRRJU7DEuSGKIxH0b1rfDmbgpc1VzecwtB9u
         xR55RiSBbWbrDnhDenutzFyVT2kDn8JCR6OTUxeiXEBewgLvpJzjDR6rQYdLcTS8PEMY
         gZgkyn8Jgt3Yuuf4/nENpIU/R5pFHDFiwIRcFrZmf0eM+/lDPyp2Bvzhm4zWgGQc9aUW
         yJZvjl+yOTCnteUlDTvHnSED2SlGC4NomynuiZceXtcjl9C54hSicYu74JrwuOAM0YQi
         ak3hlTm2esrAvn6yZUVC3z2NiBEA3s3Lq8FSjVrkKTihJLEMlZPI/DIvJZNJZ+/NtMo1
         oFbw==
X-Gm-Message-State: AOJu0YzaXdjyewsSX1foL6rcOp7I2TZv68MIIpaH6gyRcLrQYJHzuLKs
	PzGB8O8diC5iZl/Ma0VphPsaRFOsNOh2vsd++jwBRjAaSI/HKqP/mHfB740J5s0=
X-Google-Smtp-Source: AGHT+IEfL7G9aHS6bfUhymdTWrbANj27kvbkwNl8qgMD31/YD89xOjyVWmB/WolaGLt2Pb5aDV58fg==
X-Received: by 2002:a05:6512:5cf:b0:52c:8984:6b63 with SMTP id 2adb3069b0e04-52ccaa33da4mr5246271e87.26.1718982354242;
        Fri, 21 Jun 2024 08:05:54 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4248192243esm31996695e9.44.2024.06.21.08.05.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 08:05:53 -0700 (PDT)
Message-ID: <01e915ed-b190-42fd-9fb7-4e96c673c5d3@linaro.org>
Date: Fri, 21 Jun 2024 16:05:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] media: qcom: camss: Decompose register and link
 operations
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240522154659.510-1-quic_grosikop@quicinc.com>
 <20240522154659.510-8-quic_grosikop@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240522154659.510-8-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/05/2024 16:46, Gjorgji Rosikopulos wrote:
> From: Atanas Filipov <quic_afilipov@quicinc.com>
> 
> Split link and register operations.
> Add dedicated link callback according to SoC identifier.
> 
> Signed-off-by: Atanas Filipov <quic_afilipov@quicinc.com>
> Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # sc8280xp/sm8250/sdm845/apq8016
> ---

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


