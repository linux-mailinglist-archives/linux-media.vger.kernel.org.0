Return-Path: <linux-media+bounces-21212-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AA69C30B1
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2024 04:10:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB5F11F21766
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2024 03:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C46014600C;
	Sun, 10 Nov 2024 03:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="cm2HOsUd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E362CAB
	for <linux-media@vger.kernel.org>; Sun, 10 Nov 2024 03:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731208243; cv=none; b=TmorIAMHxX8Kqp3NnNlK2kvV+VqsEdNGsCgYflqGWlrbIVkuHcTn9hIEkh1K13ekQm69Ixp1TbObHv21+XHXLwnbHbkJgLloUBRZVOpojWOcS07/MmKuCZ6gz6hQsIFn8O8gthNJ9RGTdgDOo7B2vW7rYtVDNLudI8HVfxKEFPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731208243; c=relaxed/simple;
	bh=cQlKNhd5NE6RwBmoxY0OcVryhkWPxYxqlNQtOR1DQls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nfehr5YxWVBk8HYQQ3CICZKe3x5j2ROrDCQCs9GlDnQ5DYhBygj3vCtLyswI8D8JMSo5hPmppIAnvEgu/dkEHb6rSuW4xIKaju5ScjtZQMYeuD9u1ZtXVzdr0lMHxGrqzvBQnWja9VBHvYe92aLoiDGvhREuUSSpN1YR14Joods=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie; spf=none smtp.mailfrom=nexus-software.ie; dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b=cm2HOsUd; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nexus-software.ie
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4315eac969aso19542085e9.1
        for <linux-media@vger.kernel.org>; Sat, 09 Nov 2024 19:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1731208239; x=1731813039; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zGxEFnmS5fq8tk5sA1fqqLEk9HyDO1wqcsP8ouvekQY=;
        b=cm2HOsUdx85pqUS1bc98v3r/axAU0pzhBo3xU26kafhTwItiHw6oSE3PILQUg1oAqh
         ICtQg4uEgJL8hg1nfrPsY+RwH+wpL2kGL03sw7GGb6arBjU0LSRtafn5SIDI7hrfaNXk
         DORgyH/pJWgM052qdJp2ZOJ3WdE+uFqvPE+AzkJ7srIRsSb+kef2mf6YXNU/q7MQ7AJx
         vykSPbxc7b0HHUB9mVYiTOx7eof1xQy3ZAppBazJvUcKX60k4b+FeWxvxuR/zhVw69E3
         UzmP/l2yhVURF9B0Nqtj+JXznJUBaykZfiGAkAWYDtgU2omngUh7IRS/02VKrzyOuV+H
         M7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731208239; x=1731813039;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zGxEFnmS5fq8tk5sA1fqqLEk9HyDO1wqcsP8ouvekQY=;
        b=uzW01OqRO4+jCGICnL9ixE64AEjUnExtNbC9N5RjyQ0Sw4oRlTbPOi1U5C3ajgupBu
         ZIcCgXNaM/0NSOimtqz9c/X3d/MnVE00pHd2dM1G21TlagjtErdDkyDVyISxVthr6zDa
         ZpC53R/eLt8dd+QoFixzKyTBQc/BDq/9iTy4g2kUeMXaSEBmMqBXzJYj1Gl9OMPAGtag
         kequm4ab73eF8g4fkBwLkTnrIfvYW6GIEm9AqRgdkAY0arjbMNJKqtxSBFSXn6WTGzH+
         TD+KcEBryCAXlp3AEGimzF5hC7Qm0XLf63CWKJJkknhekMmjjnICqvn869eocLiPhha4
         0Nsw==
X-Forwarded-Encrypted: i=1; AJvYcCX2wwlv2NlNfudcqIr4eNA47QFNeUsubGEKe26j18bndku9Fph7Je7Mst+2uPUq49TOvMNMhRDcm+kn5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTtVx/qWsZg5lhrGlGm9aatCjWzBu/NT39EYWT3POWC8Hw36ZJ
	cF6ruiF9ih3iR7PTND1oZjpCZglH4hyPESinRgxxKUN5dVqKsO7BJMXqREm00xo=
X-Google-Smtp-Source: AGHT+IH5aQ8aQ1R+iLcbezixKAMbiVAd6tXCGBPiuHyJUqk5Nwvv+Ivfc/HUeFLxpFg7fJTC26pjWw==
X-Received: by 2002:a05:600c:4fc3:b0:42c:baf1:4c7 with SMTP id 5b1f17b1804b1-432b6858e60mr70055455e9.4.1731208239337;
        Sat, 09 Nov 2024 19:10:39 -0800 (PST)
Received: from [192.168.0.48] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa737721sm165333935e9.36.2024.11.09.19.10.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Nov 2024 19:10:37 -0800 (PST)
Message-ID: <841a9469-4fa1-443f-88a6-bfbe11b74487@nexus-software.ie>
Date: Sun, 10 Nov 2024 03:10:36 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/28] media: iris: implement iris v4l2 file ops
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Jianhua Lu <lujianhua000@gmail.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241105-qcom-video-iris-v5-0-a88e7c220f78@quicinc.com>
 <20241105-qcom-video-iris-v5-3-a88e7c220f78@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20241105-qcom-video-iris-v5-3-a88e7c220f78@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2024 06:55, Dikshita Agarwal wrote:
> Implement open, close and poll ops.
> 
> Open:
> Configure the vb2 queue and v4l2 file handler. Allocate a video instance
> and add the instance to core instance list.
> 
> Close:
> Free the instance and remove it from core instance list.

Its a bit odd that you describe the purpose of open and close but not 
poll, despite listing poll along with open and close at the very top.

Consider adding that text if you do a next version.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

