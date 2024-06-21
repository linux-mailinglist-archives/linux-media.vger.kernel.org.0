Return-Path: <linux-media+bounces-13948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E47A9128DA
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 17:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B1AD28C4A1
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 15:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2E4482D8;
	Fri, 21 Jun 2024 15:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bYtJYBs5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7573987D
	for <linux-media@vger.kernel.org>; Fri, 21 Jun 2024 15:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718982284; cv=none; b=TzH/KlbiXN9XHC/6S9YLn3AcuSvdPByv8dwafplc14ZMil62P6ORtFmoeGOUXZkWtf4BhD92TNpm4yneGjzq16PlhkhvTFyQxFJchOnwZe+tr79mf8JMs2wcnzDIjCpy1yHT43Z8+am0fQGlcIc0FQ/M+VwEDgWkH7goAePQ8so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718982284; c=relaxed/simple;
	bh=r1fY6Qto3WnTSZU2EOR09gWAkNGeq+niwkknygan98s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WkNCs9gpveW74l43d0eR1d/XbgXAThs4FSyZKdMlMchLsZKkdSGFfSHJRcRh/659TzcvsZRZBA5EHKr8xyRjSinG/wUv9Pjs7YqMi5icVKsHiHt/r4F8u9p7WI3OfHvRcR+t7Iky94P6rBxVkIYQxhMSrhcnRvPkmHEkBJ/w+0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bYtJYBs5; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42179dafd6bso19643795e9.0
        for <linux-media@vger.kernel.org>; Fri, 21 Jun 2024 08:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718982281; x=1719587081; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dk28BPsKYM+XeiCl+KoyoYMQGxSVOU9MqtqG9sbIyVc=;
        b=bYtJYBs5BMxMNOMAHyHFLxuWzVyE5RTLhx5jE5urvkCjsudaGb7HfpNjrR4guk792v
         Z9NGtbOdewsH+tZPNQ3h3yjGY1XCAcRVOWqKd1u/mPbIR44njb/D9aiIkibpPJnWFNnG
         9BZoY+nmnNfZLBCNaQS76j59cfeXAmKvCmCxl5lPrrV703L7UjJBdDpF2ZRgKTa3BHy+
         de2GiWFN3XN4vo+akYLK8vixIWq5HcTPMZmbi6+LScnoVDdXq/luuNMHi5kfNFKHfqho
         RRnBclV5n4oWXZeG6wUakPqptrQ3PCDIJQpMp3CCcTqUvY93xR6UeTQdoAaXKbLLevlS
         GfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718982281; x=1719587081;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dk28BPsKYM+XeiCl+KoyoYMQGxSVOU9MqtqG9sbIyVc=;
        b=sC1OdOcHc9BND3SWZQ3diXzFnPx2PBhsVqS1j8i/ymBVtDyYTd2+9of1uK32n4WRTj
         lh4u5mTjgxShvnGEJ7Q7owVl8dic0MdDQtVvo54h1Z6fPwEHgGE9koBIQy4c8d50wY5E
         AkeB3pX17WCilnX6TwaNvsta5BC+aSKr/z9Df55GrGjtlU4EapOofwSMFFzVeOlYGx6d
         7Bp6qVRBNbWrR8A7YnTZ21dnTEBMBovwvhr65WsZP3uVcUF/9c6OpnYkbXfGWMtsoYPR
         BAIYtNBR92jdsHG3j5bV5zxbGBjZYTI1cKjGjUYos1eFJgY2uDa8JtEzx3ExsrVQaLLA
         orJg==
X-Gm-Message-State: AOJu0YyoJhg4DUy3+nefjUDVyrpZXzLCLqXvRSwy+fYNm6bu6/YjsVIC
	Cjur1Y5MeeQrtl7lTNMuSmralxG+MC9jxGu6ZIp4Qw5elb8QrKoL6YUZV2OCdRg=
X-Google-Smtp-Source: AGHT+IFWNqsQQw2V7TDsQkJB6YzliZ7pPGE+MbOl/MORssIwbIbZrQnCfksipOwhmW8zCnD1SbSoPQ==
X-Received: by 2002:a05:600c:4302:b0:424:7871:2e9e with SMTP id 5b1f17b1804b1-424862e58a6mr964945e9.6.1718982281416;
        Fri, 21 Jun 2024 08:04:41 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a8cba50sm1975992f8f.108.2024.06.21.08.04.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 08:04:40 -0700 (PDT)
Message-ID: <20367ddc-926b-4395-97da-eb42344d3f6a@linaro.org>
Date: Fri, 21 Jun 2024 16:04:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] media: qcom: camss: Attach formats to VFE
 resources
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240522154659.510-1-quic_grosikop@quicinc.com>
 <20240522154659.510-3-quic_grosikop@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240522154659.510-3-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/05/2024 16:46, Gjorgji Rosikopulos wrote:
> From: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
> 
> Video node formats have direct dependency by the sub-device pad formats.
> Remove dependency for SoC version and move format definitions in device
> which creates video node.
> 
> This commit attaches a struct to the VFE resources that holds format
> description, so it is much easier to assign them to the video node.
> No need to use a switch-case.
> 
> NOTE: The mbus_bpp is used to calculate the clock rates and is different
> from bpp which is the bits per pixel written to memory. We need to keep
> both values to not break the calcualtions.
> 
> Signed-off-by: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
> Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
> ---

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


