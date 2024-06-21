Return-Path: <linux-media+bounces-13950-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE4991291B
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 17:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E401B2DD27
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 15:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70624F8BB;
	Fri, 21 Jun 2024 15:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dneqHQnV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA21482CD
	for <linux-media@vger.kernel.org>; Fri, 21 Jun 2024 15:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718982318; cv=none; b=kOOFRobvmztEO0pCLz6HHhhyCNd012v5zUiXqExJBMjnnbC5FLr51E2P92mvKQPkvZgGgraQZRFtI2MBhe7jD6wjmX5VXIbHx+lnvl/nylu7FEQ8V4TGr5/xRGcvD5TjBlWQvrjwuifN3Te3+Bf2edTxuHkUldsxuAKYaEn+xYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718982318; c=relaxed/simple;
	bh=DbK6higfe7RhTaLhmfwC/Grx8A6gbZF1od7EOZHFL4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HOGI93kjMEnp7oKVm0A6rH5RdQrg/kQMtiul8nZhZitQZUtrJW94NYxp1SmEnlNJxrBLlosHW5KmFaMsfoE/wjH6vqWsSToGyzRsuKwe2n3IhDtFrSzZNeOzex6viyD08PSZZ0kSguSWxfPcwjIP2d8DSF6vP9CFfAIX+/RzzOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dneqHQnV; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52c89d6b4adso2043253e87.3
        for <linux-media@vger.kernel.org>; Fri, 21 Jun 2024 08:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718982315; x=1719587115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KL+caV3bObP7DUH8YCL/l5YyKNUFeXJack9ymoYjDFc=;
        b=dneqHQnV3U9aFZ5F2PlqhGQTZ+Dm2UJPEKRtrDEdjIN5SnFQJTJ6s3mVBKBAmRwdIA
         4t4Q9l1yn4rioqe0TFEQpf8u1mEpzyC4CXoeppENGlGtNJ9tPe3ZXICZFILvuHJS2srJ
         G6ARtr5pneB/Qe9tVBfkNb5vZiwQK5FMpNzdP4Lh3nuzgeGifHLemt5VVL2AXvdpCMcR
         ZXloGPWtAj6Wh2MbvSB28mnq/lXMsjKOo5JgoSThli1MIPHYGrlN2B0Ic2A/N1z/FBGt
         ddqrqwvdZ7PQLfih88fLAEUI//GQIA2mL9naJBAPDEFpPFZ6dkjb52K0KUy/8i4FLahe
         7rvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718982315; x=1719587115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KL+caV3bObP7DUH8YCL/l5YyKNUFeXJack9ymoYjDFc=;
        b=RkuxrZ5un06MSMNShz340dXDeU65UAp8++Di2I0hs3uJklrJ0LlA+7RpWBIC1Z5XW7
         gcyLvnbB7A1aQDAzOzmmx3tUava8cwrjKBkZiRMXlwUf0TM54F2LpJzF0QLmASS4E90t
         fZmCAFlS6OkKfmOEIfyI6bTJNCh/5YAJmy2NYZftTIwjdYsXKmWSdot6uS4XziuDooM8
         y+IQbp8CzjXoCzBeMoovjmzbDnPtNkU3iYZwT8tyXMQAWFO1h7frXZDYPLRaOyEyjlTU
         s//cv1Tb8rBfNuiQmFb1H8HTyKx0K5Ci1vaoXpXw/Z5hfWHVXLy3MbupuR4jditKjTBx
         0QKQ==
X-Gm-Message-State: AOJu0Yxa00MkHqvmmhxKCcICguLF38mPEUaLoi7p+PLbqjJhetdVhLJa
	ewJFPhzcahLkoLioO09EwUJf8fECctyTF9pmUWPOXxpIe+hPlUGiYTqESHirEkNQ5o0hQhIRk7m
	AuNd/SA==
X-Google-Smtp-Source: AGHT+IGsYW5E7uf/KbDXifPNHcbq1v81WG03XDebIVGDazzAUcQRsCDHrOB1bk99MhX8ASjli1bMsg==
X-Received: by 2002:a05:6512:4de:b0:52c:a5e6:989e with SMTP id 2adb3069b0e04-52ccaa5b9a7mr5137111e87.16.1718982314819;
        Fri, 21 Jun 2024 08:05:14 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d208b0esm66941475e9.38.2024.06.21.08.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 08:05:14 -0700 (PDT)
Message-ID: <1008283a-6831-4eda-8d3b-6af56bbe834d@linaro.org>
Date: Fri, 21 Jun 2024 16:05:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] media: qcom: camss: Attach formats to CSIPHY
 resources
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240522154659.510-1-quic_grosikop@quicinc.com>
 <20240522154659.510-5-quic_grosikop@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240522154659.510-5-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/05/2024 16:46, Gjorgji Rosikopulos wrote:
> From: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
> 
> Following the example of VFE and CSID, attach the CSIPHY
> formats to the subdevices resources.
> 
> Signed-off-by: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
> Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # sc8280xp/sm8250/sdm845/apq8016
> ---

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


