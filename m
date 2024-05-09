Return-Path: <linux-media+bounces-11181-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F27918C087B
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 02:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F1C2B219C7
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 00:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A1E5DDDA;
	Thu,  9 May 2024 00:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HsVB4zK+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E207464
	for <linux-media@vger.kernel.org>; Thu,  9 May 2024 00:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715214752; cv=none; b=KJb6fo2hkI1ZDCXUGSGeqqDV2X3lfnqclrnzx3bv1ajLqDgnRjaPvToyBPMpl5AyC/Zp0naFxL+f4h8oDdCY7nC9VUuATKTkJqHU1Au83psDfMWWpZQyzrcSfhLm+ZGdLOlYD5GM8Yu4jBwONJYee4uRZ5W6Cddzrg60NGddOkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715214752; c=relaxed/simple;
	bh=T6DfjAKmCP4P7gljf1X/c/Is1kBU1uRxx+KhHzVTU74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lqsQYEEppA3rW3MA+wTcQZBDjpvrTaYQZuEVbm8OKp0qJyw6qVSfrl7AgbsBYCg3vQ3o6AmN+fnMftZwpY1KRObztnK5y7Q/S6xqfOwpO8Ndgbt5l376qqdAtd8B37iOcyF9dYuuVVKy3f+506wo0Z8YfZrsjkEx6wMvW4jZh/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HsVB4zK+; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-41b782405d5so3624505e9.2
        for <linux-media@vger.kernel.org>; Wed, 08 May 2024 17:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715214749; x=1715819549; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TKnK2bR4e/sf9zkj4k5cJS7AirdVOFFlSBIdz2Kq58o=;
        b=HsVB4zK+tH1ktr1XindumEfzY4b06bsIAr/vgjYGyiRM1f1JnYYZlQOTpoOnuNIq4g
         9NOH6sLEbmGHXKCz9xjbEfjpu2Ti6+5KVOADXEVKLSHwUaQsCkE2D176HbCiKFjbTnf9
         rj+ZW6pioHVnknBUFwEt2jHpcccFAF6UQFEaqSP9VT57YiWzIS6tRR5CXMvKwOYBVT29
         GePRRwdRoLLROqkYt8qHn5HAqDZi2q7J3JgRVjgOTtwxvf2uRmRCbLosO3DDxGLLfSaR
         2bZz354EolKkiv+Y7j3Vkx+048Qd7NT1qDQrIpFwBWhIX5eckOf3nuRmM1/CFGD96Hlx
         LcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715214749; x=1715819549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TKnK2bR4e/sf9zkj4k5cJS7AirdVOFFlSBIdz2Kq58o=;
        b=vWYYl221SgHqaAb2xw0g6BEz0e2bbepbPYE6OiUxs+par0IzcuWyHWbieJJjre/5O8
         z3KahvWpLKw0MHvGlWM4HxYZiTM9DREHiu0coDYSlix+E4II4yKegk1ath1bxG5pBzn6
         iKUKta95t3xGw/IEAfg3qK9aL5z08tk2Ut2KUcd9a8rztviWkP2Ix9UFrTZDeDTsMPjb
         uppwkM3wEMYY47Hxnm7ri3zNcyzFwVUTuHqeSxwvInDYkiCWF//e79ymgRhBdvPFvBwY
         6SncWRaLcoZnWsDJ6+wr43HAkfEGPbi6M3fVOucjHHkxomtpTXsXzCNTWnvzy/sclE+x
         GjPw==
X-Forwarded-Encrypted: i=1; AJvYcCXR6gNPHxVf4fNLh+xBakynJrz9jRK32vHAWy4HF6ca2p3oTlVs0igLqI0Ll8Xm8j3vG3YZYtY5wJpGFqvvJHAjde+gXr5A6fqHDxE=
X-Gm-Message-State: AOJu0YwIOB9pV5UyCcBB26+3Fm1aExNwy1EOdHYHDrNfe4gZIWRca0J1
	z18N0cFPWfOWhQ0lTyWKKs5UTNamUvd+MXPAILED+0cx3ByPl8GDcB3qxn38Mi0=
X-Google-Smtp-Source: AGHT+IFhTLFcY/Cs5a/adjpOOYnjYCfR6iOR9IpjqCZyWjXtTiOiFCPiJs0TbWvsU2EG6+KqWeTdUw==
X-Received: by 2002:a05:600c:46cf:b0:416:8efd:1645 with SMTP id 5b1f17b1804b1-41f71302d2amr37959545e9.7.1715214749152;
        Wed, 08 May 2024 17:32:29 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f88208cb8sm39197045e9.47.2024.05.08.17.32.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 17:32:28 -0700 (PDT)
Message-ID: <cef4bf31-35d9-4304-804d-5384018c0900@linaro.org>
Date: Thu, 9 May 2024 01:32:27 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: i2c: Fix imx412 exposure control
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Martina Krasteva <quic_mkrastev@quicinc.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240506-b4-linux-next-camss-x13s-mmsol-integration-in-test-imx577-fix-v2-1-2e665f072f8f@linaro.org>
 <dvyed4grpazqk7a3tz6dqwpkd76ghtrt4euinxt3kycdeh63ez@ljgfjsfhypix>
 <20a0300a-ac16-456c-840a-e272f49050a8@linaro.org>
 <bppn2qglcya3xbfy7uey5cgybyanxthhweqv7foojwi5rvqwmk@temzdedvecfe>
 <CAPY8ntAJJu8RM66xFr4dGWtZJVhsjjXEecT5=YKBVr+0hVL9+w@mail.gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAPY8ntAJJu8RM66xFr4dGWtZJVhsjjXEecT5=YKBVr+0hVL9+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/05/2024 17:31, Dave Stevenson wrote:
> For reference certainly imx327/290/462 which are all siblings in the
> Sony Starvis family do calculate exposure as
> exposure = 1 frame period - (SHS1 + 1) * (1H period)
> So 0 = max exposure and bigger values are shorter exposure time.

ack

> I'm not saying that the imx412 driver is right in doing this as well,
> but it seems there is a trend with the Sony Starvis family to program
> exposure in this different manner. Don't discount it as wrong for all
> drivers!

Understood. For the record the rpi imx477 driver writes the CID value 
provided by user-space.

https://github.com/raspberrypi/linux/blob/rpi-6.6.y/drivers/media/i2c/imx477.c#L1376

With an exposure multiplier we don't support upstream at the moment. So, 
I think this patch is the right fix after all.

---
bod

