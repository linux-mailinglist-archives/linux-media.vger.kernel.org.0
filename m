Return-Path: <linux-media+bounces-35111-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F121AADD7EB
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 18:50:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E49A840236C
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 16:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 062862ED841;
	Tue, 17 Jun 2025 16:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KuXylERU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCAE2ED159
	for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 16:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750177844; cv=none; b=TwqcwLj5RN3kCiJwKMZuKXsAENGps81AGPqy+X4jVYxWsrd4KVkpP/CYR2AlCIu5VD7X+dTUBbOHk/cKNILXpKjOtJHz6nzYsAnP05/PJY/eKmZRyMVuiYu/z+z6NujOrFbAFyPEIk7y54sRA4VuquFSLxjiUPO1JqO61AaAhsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750177844; c=relaxed/simple;
	bh=92dyse23h6JXvee3dXbWSUKtGr8lwMEvpeF5vbNoRAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cjZ37Fj5bkmqO4y9moecLw416yh87MmT1vrTRfXhIrS7ycMI3fSbxC7hu00THt1tlIhYvyRVqB6RiFZLjYmLmT9yC22I89zBgtpATedJZYQn+f+6/2rdRLvzO3lB4zbEcNH2L++nY9L1jZAwoJE9ZUqpVoCME3Zf0NSdN8EmTow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KuXylERU; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-553230a9753so639109e87.1
        for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 09:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750177841; x=1750782641; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SKWQGllLmr+qLQbLghsrgPHsywgYjq7ibiyjzz6QaX8=;
        b=KuXylERUUOvvc7NklI5IQto4ZnlF5KY31+ceYwIeygryizrK0qt/Us3G2zwaBYpkDB
         /wwLfAlfxVlw8rOAoHYulm0mtfUUaabBc7n79u+HP4Dsh46y58Jcj0qAgORYH0ZKMv7/
         2vGiUaMMqXRm/RB5CurXioprnS+tbQDjG0/8K6aRZTyAoJfUIcDK/dLisxyehI99q+/y
         JWQP7kdrmu8fBwvibE0qQOTuLi4B/Sy+DFONMmDVjFsB4hwJAZ+NRzGd3MvkQmMS+o7x
         oXWbuS36FWW0pHGxJl8gLEOxBsO7kpq03FjL8nNkdOmNxOg49jVFOG0TH6rC+g6roK7R
         zJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750177841; x=1750782641;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SKWQGllLmr+qLQbLghsrgPHsywgYjq7ibiyjzz6QaX8=;
        b=xQlsEOQbAPPkcuUAvtzoLoj+p+RAy1a/WyKGwGBUkmRMKiRGc31hFJIbPPtRP3rv1c
         RtoqHthPHhPYZ1IHDG3qk7KaIA/30xxBtMvA9I1qwTAO8zwf6ZepHoVANQQK3Gb/Nvvu
         1B+eSlgUp+p+F+A6RXVGjUxn4WHGz9yegcUlI9yiRmmL0WKD/JMEZ0iYkyVif4W8lQpL
         oWlkz8uU4lMMYtjxT55Aq0Pl+25u80ABkNDc0fBerR5KkCbItlBc6OewVVc8049hG9F3
         jsqyd7G6m8TWGq9rYPbUxk96oITSU2jLHx5Oor1vUYZcLaJl23sFzRlFb1AL4wK4EYGx
         SiYQ==
X-Gm-Message-State: AOJu0Yx+F2aGOto38ihg1PcZ9CausRbuTzJzkjCd9t5wffZlH+/tlSQ2
	vSHhyQVBKCtn5wfRMX8NBmzuVigBhWXCud4B4Kz/reh574xZhtrYOWvEYxoEKZmpbt8BouiC2Md
	4Xzmt
X-Gm-Gg: ASbGncvJFtBfsS+SxucgAee7Hd1i9szDgSqXMydkon5DPQcIKluAiTzjyOEkzfuxSUZ
	afMvkSbyJlUSQ/rptNI+KvLV58IaLHtijtQsF9OXSVCiSwTzMhrvLn7lYuBEjC+Wszp2seY5d2a
	WYGq0WekQr8jZSa/YFXdZOIKGFM6lVzxdV9aMqskdB0UYoHy8vh0Si7KrQdSflqdBeG9rmpShQk
	RDEvrZ8Asda+3NsrLkD1KqA/eSbx7zZ42+L9a5lZrfH9unUs6uXZdluWFteTymR38k7gnjXrTnR
	7g0V1JbdiFdVey0Thb+U5XgLTJCxi7DF6QmxSpAkkhs7YwsFs4PeBGwmAgb9Pi6iOVhNmxcV8ej
	c5Z4GVfPlX9Eb2dWVMx40yKZAHyQC5D0XuK1oxlrX
X-Google-Smtp-Source: AGHT+IG1O0EQZqSHWUxhKDiVNAb4CQwzoQEy891M5j0PGfDaKo0e09AEW2bjqZxxn8TyTHtNGy5IRw==
X-Received: by 2002:a05:6512:b97:b0:553:2a74:b455 with SMTP id 2adb3069b0e04-553b6e8b1ddmr1127584e87.4.1750177840384;
        Tue, 17 Jun 2025 09:30:40 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac143a7fsm1982363e87.87.2025.06.17.09.30.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 09:30:40 -0700 (PDT)
Message-ID: <53de7a8b-b0fe-4a56-8746-d2019d26eee0@linaro.org>
Date: Tue, 17 Jun 2025 19:30:37 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] media: qcom: camss: change internals of endpoint
 parsing to fwnode handling
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
 <yzkDfU7Mw7hBOVlBNpZ3U-n5SK8AMuFq-cGYPxp-hdzeaGy5aLQdZ28j3eJldg_18hj0x0H1y6EV42d1e1Zlng==@protonmail.internalid>
 <20250513142353.2572563-8-vladimir.zapolskiy@linaro.org>
 <69563c23-42cc-486d-9c01-3467859e7860@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <69563c23-42cc-486d-9c01-3467859e7860@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan.

On 6/13/25 12:30, Bryan O'Donoghue wrote:
> On 13/05/2025 15:23, Vladimir Zapolskiy wrote:
>> +	fwnode_graph_for_each_endpoint(fwnode, ep) {
>>    		struct camss_async_subdev *csd;
>> +		struct fwnode_handle *remote;
>>
>> -		if (!of_device_is_available(node))
>> -			continue;
> 
> The change to fwnode seems fine I think but, either leave the
> of_device_is_available() check as-is or move its removal to a separate
> patch.
> 
> Changes should be as granular as possible.
> 

The change from OF handling to fwnode handling assumes that there is
no more room left for of_device_is_available() calls, it passes away.

of_device_is_available() here is useless, CAMSS ports are not devices
and they are not disabled in board dts.

--
Best wishes,
Vladimir

