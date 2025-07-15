Return-Path: <linux-media+bounces-37760-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D66B055C8
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 11:05:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC08F3A827A
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 09:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83AD42D4B65;
	Tue, 15 Jul 2025 09:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wd6djG0R"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7F12D4B67
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 09:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752570297; cv=none; b=d218420F7HvoEE4J6vJ7eewfNaECcFuPiz2Wfn8FGbx8j9I52Ey03Kz+HajCqrtL/8FBAMIGMQzrvKbG9/AdsagwFN1HAVH4YtH9/SjwnomUzN6pvNW0FjJkB3p94GwfnrHjT3VvCUsUa0KscF700LaeLx1AHkiJhY3gPCvH6xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752570297; c=relaxed/simple;
	bh=bCcO5BWOMg4zWppoYQdyYeZG6014gqukH8Wo1eDYPK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nJzLTTFFGLgLICs8AfZLSpSD1dpbfPY0lLu5UATDlr/yLZJIePbtaCgdbg74/pVIQFnMrVVYb9AlSJWUpojV7i9oLGn0tIhXtZOpLepWgwENogiPKZZi2Jy9m+b0qSYrnf7sEKGY0qF5Xag33VdkuMLf2BIJIKRmCjQYiMCWujI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wd6djG0R; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-3a6d1369d4eso2924585f8f.2
        for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 02:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752570294; x=1753175094; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RC35Uaddkl3Qjbyo7ZQPMdSP8Ho5N5PGV7tzcTZPgxA=;
        b=Wd6djG0RpOPMw1MY0CzUIAkwYGpBz+xAZWaPE2DZRmWr2HA/PISoKFZnanMhLsQyMp
         DTYVeQle1J8/kVc2644P2J6mF/vWX/xyZR7ziU+XOJdBK1aILQTwwzuYp4Fbq/LW9etF
         ci/be9Y0RPhBHaLUiU+JgnrUs3CyVyycSW6Bi1Z+RZJD/6j39Uj2opwJaPhBmo44UQmx
         lJVJj5635NXXT+8+qDNE/pF5gIfEvMkFzW+UZL98huge3FxflgwrJpGfxCnrszlfRhho
         3cCEahsB8y7qz2sWmEAEtARN8FurW/jx5nPmtr52KEs/4ZTDV3XIm97jPH689yKaQ/jn
         /uwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752570294; x=1753175094;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RC35Uaddkl3Qjbyo7ZQPMdSP8Ho5N5PGV7tzcTZPgxA=;
        b=hfMXNCvb3jSj1T/T+cR18b4hSa6hyxWl0iNpdI4s2bKIqW03K+OlkQJfO7N7qtIULR
         9YWs+f02Hrl1nAO4moGgqY0Q/WQmhcHL2qEr5BY73beeS92kN0hKY5vjGh2KbmgxI19T
         e+ILodGB2E9xb1y0Vx+KDI8LdZBlnxXcFxQ5oQorHM9Sr9zovRrYt4LxvflzsJptW2rw
         s+gbGeMlyu+Bgwy5tR4MGSeIoO497m+hbhYYpDG0KiejtUROzVFRIGLcOb2b4QGB5nVs
         5WOnXxuyqzsx/MDJ6zp1QdoIA2/U0jcz7TSMALilmhK9lf/3eZiGIMRfayzhfuaSSom0
         Tvsg==
X-Forwarded-Encrypted: i=1; AJvYcCV3YXyvqOzB5U8g7/gTkBF3z/ZeMlnBMGjwIsQ9vJ1I9YZHSu8BW80L2FTI8klGnOv/s6yrA0Pp88fWPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRPpEQQNbg2FWNiQjm3zfoRYqauVs7LPopSdf8awnQAq0bjEbF
	6V1jY2Ot2PYHs0nKy2DhDiYrgPwNVm45AVuH+z/ppf+tZ8MwXoYBUCpc1rNx0th31Adbap+Xa3e
	GtQs9zdo9ji9e
X-Gm-Gg: ASbGncunIySGukr/NKfQyYVeDv1su5CjKrTYJBtUE0SdjTilGb+E3HlfamTw4cDP1Ho
	1cOEOqQIU9dmdwKVNy+MznP2t8ql8Ry0LohZwOienxew9zSjwcrHzBMhVhbY/7wrEkb5LzzDsYl
	G4dboOzJo7q9fgGY5j2XmrVifosKGGzE+RceNE56Zo0khJpUEpeLy+6CKpwaid8Rttb1icYZV4L
	8nLlfRSnvVjmPYNdcQj0FLopUWfcV02cxrle2zSelH4vFQzc1mcyZ1V74og8T1Zj/OCFbLni39h
	uEoOCc53TNuDV3zQGmKOo1wDAgN7oZ4nmVLN5dis+njesaZDufLoMg7nnJMbekXp2tHk+5D0qRi
	T7sJxV12IhAMfCQJT0IQalnFkGrbD1O+IEM6bUhBLDnzaqZzzEFw90F5xBFbIFqw=
X-Google-Smtp-Source: AGHT+IH7ZwYaoq1ijwhyR8CQGw2jNG3G9MrFh5JCTUkvpu9ErJbmnjvF+ugRsyGoX44jMF3p8DMzxw==
X-Received: by 2002:a05:6000:4818:b0:3a8:310a:b1dc with SMTP id ffacd0b85a97d-3b5f359b173mr11825598f8f.56.1752570294340;
        Tue, 15 Jul 2025 02:04:54 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45627898725sm9928635e9.1.2025.07.15.02.04.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 02:04:53 -0700 (PDT)
Message-ID: <944ee7e4-e937-4fa6-b527-f1ffdd397fec@linaro.org>
Date: Tue, 15 Jul 2025 10:04:52 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: MAINTAINERS: Document actual maintainership
 by Bryan O'Donoghue
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>
References: <20250714151609.354267-2-krzysztof.kozlowski@linaro.org>
 <f1283a01-db49-417d-b4f5-2488aad2d237@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <f1283a01-db49-417d-b4f5-2488aad2d237@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/07/2025 08:18, Krzysztof Kozlowski wrote:
>> +M:	Bryan O'Donoghue<bryan.odonoghue@linaro.org>
>>   M:	Vikash Garodia<quic_vgarodia@quicinc.com>
>>   M:	Dikshita Agarwal<quic_dikshita@quicinc.com>
>>   R:	Abhinav Kumar<abhinav.kumar@linux.dev>
>> -R:	Bryan O'Donoghue<bryan.odonoghue@linaro.org>
> 
> I think it would be good to add here also T:. Bryan, do you use your
> kernel.org repo or the freedesktop repo from last pull request?
> 
> Best regards,
> Krzysztof

Freedesktop - the media-ci lets us test a whole bunch of stuff so its 
convenient / less work to issue a PR from there.

---
bod

