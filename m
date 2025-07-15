Return-Path: <linux-media+bounces-37731-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC5BB05212
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 08:44:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05A094E2C5C
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 06:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E183826D4F9;
	Tue, 15 Jul 2025 06:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lFQf0uOE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F332CA8
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 06:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752561888; cv=none; b=kBVHpWKlre39hQEFueewLS5pArbcBNETuEDgXamo/zMBIEFHC7Z7MJw7N7xxLIo68PeXzy0N2TrN3F5Gb0BoU2wft/WukG5TvRKHiumG8SmQk4zJD+5lVGlX7lhlyt0AmJAQGHQouv+/kMOxFDpSavpcs8x1nXzqGH4Mm2JQ+TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752561888; c=relaxed/simple;
	bh=R/9lqfE5mzB7t5nTZk7gl/4huV9onD2mkEXutUdkvJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PtJofT4VdqB/BCj/t7XE5tWcP4nsCB32h0KI68frM6PLwvnotfwztMNEx8xXCgCQl6d9Jc6MKuc4sb9E5UrPIcrGRQD0sr5CL7BMDTK8rmR2Dun75snQzM4oKGt6nkBGrs+oVLblK6JyxT1+6J/BEOgfV1B+7k5UO8Y1WACh/2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lFQf0uOE; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4e749d7b2so768808f8f.0
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 23:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752561885; x=1753166685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ig/rHW7suI4HX7zb1V3+gnBiDUNJyG608kAWJVhPdJc=;
        b=lFQf0uOE29EkDzRg4v1TuOjNxjXQM7FaAiFwUjl4kqRc6KCj5GcNRY8ZixlJQvwBQj
         2woXfgML7NsaF2LeojmtBEyDWAIPVnQ9NUx5ORPfOBodPInCnRrm+khOvNikPV2JsAMY
         lxxso1GzX6C3Aas+y2v1potII0B/PmCGwFkqF0HEg66Tw3QFJjL9sm4TMD05//En4S5h
         A6osPHKZWcYDseR0yc9JaIfGbYaxIkNlejEqwlHBkdax+ZNMmyEFR1lguJ80aIjx7Coj
         Ly2b0uZv/qXZR56S3Ud8yzZLAPOBjaMmOLjbrcwNz35UHTqHgX2/jAEy6qPu4CHuGy6g
         LrbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752561885; x=1753166685;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ig/rHW7suI4HX7zb1V3+gnBiDUNJyG608kAWJVhPdJc=;
        b=qDZa9cjes603m/aM/cx8jUacATre5JSLjZRftDlv5nxCb/rCZC3BpKdeoBf7oHYPmw
         /VFuUVUfeusnTr3E/9xYIq13Sba8zGBiJBQUju8tavS5+jraSM1s03PVqxolnrf7xPD4
         FMBnAkUqj35eqvP94biOK42CDSSc+4ZNjzFya2A10zL7MeDMNOKeVTTjxxMMgOkmZeUl
         vjMcCouvprOlVNhJxvTXEW3w7IuFb/V9jCKvxaV508HBBP2X3OpIpVNOnvZk90A8jeEK
         g0nuLMeX6hGmBly94oNq1oSBe+ama9Kt2+Sm6275V32PVn+WIwEhBVXaEhfU2lq2pZix
         YMdA==
X-Forwarded-Encrypted: i=1; AJvYcCVsQ+nSSXv7AUr2BJQiFesdBRcr9/5qO0eJBiWPaubH1239bx75K5I3hLYEW/MsF0M2PfIrKA79dS91sQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWNSuVscepkYjoK0PAxJR9tGwwlrOb0tUxTczPwzjH1mMrk5nW
	asL7nImnrjZSdy1WtAJ641eSD64kEWg5MtLHvtuCV7l29nQpHLugmqG05MAxfpT4dg0=
X-Gm-Gg: ASbGncuUojILN1U2XrvhDuTsatiSyMSDvSFkgkX5YL0sxBHS2s+vQghH/0aSddOydz/
	OnpCgLfOuO7+m3A85kQFDK0SVW4cMnkxyhekPgiC8/vGKgQe0poCdJooygix1GD+O0agK2Pt2P+
	gCNEFiNZ6kdlASZ7Okris7GJzmaO9/sRMxzYrrEGqCj/2TW696bDuvgPbz0cIiDHCEmZRzg9xQ5
	/go2n+kBohyuoHo5z1JBho3QFvtgUkcka9tduptacCQbCGxKufR5h2CZFBNYpq2xERcDW1VeQyV
	LAgXD+l0ItPYxED8Ot3alqDiX6PT99MrsZax/g9X7i9LgRHpap8ePG6apdE2dESKnwVEdYVzS/W
	VKb6KmZD1C22OJGgjL+/zhHiss9x1KRuDeoU21eBpMQ==
X-Google-Smtp-Source: AGHT+IE4JpMnkWKgqq2q8I05VmCT/NPVZVUKz5H2a4yK1ZgVEja7568Iz0K3v1/RVrSCTQYtYxMCUw==
X-Received: by 2002:a05:600c:3512:b0:453:c39:d0b1 with SMTP id 5b1f17b1804b1-45629123a98mr1762745e9.2.1752561884848;
        Mon, 14 Jul 2025 23:44:44 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc2464sm14599412f8f.38.2025.07.14.23.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 23:44:44 -0700 (PDT)
Message-ID: <b83cc20b-44d2-4635-a540-7a9c0d36cdb5@linaro.org>
Date: Tue, 15 Jul 2025 08:44:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: MAINTAINERS: Document actual maintainership
 by Bryan O'Donoghue
To: Vikash Garodia <quic_vgarodia@quicinc.com>, bryan.odonoghue@linaro.org,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
References: <20250714151609.354267-2-krzysztof.kozlowski@linaro.org>
 <8772c48f-348b-8a68-2099-562a29b9dd8d@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <8772c48f-348b-8a68-2099-562a29b9dd8d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/07/2025 07:51, Vikash Garodia wrote:
> 
> On 7/14/2025 8:46 PM, Krzysztof Kozlowski wrote:
>> Bryan O'Donoghue reviews and applies patches for both Iris and Venus
>> Qualcomm SoC video codecs (visible in git log as his Signed-off-by and
>> in pull requests like [1]), so he is de facto the maintainer responsible
>> for the code.  Reflect this actual state my changing his entry from
>> reviewer to maintainer and moving the entry to alphabetical position by
>> first name.
> 
> NAK.
> 
> The roles and responsibilities are well agreed by media maintainer(Hans), with
> Bryan part of that discussion, w.r.t code contributions to iris and sending
> patches to media tree. The only reason Bryan post the patches is that Hans wants
> single PR for patches across Qualcomm media drivers (Camss/Videoss)

That's the maintainer role, so Bryan is the maintainer. I am documenting
actual status and your NAK is naking what? That Bryan cannot handle patches?

Sorry, this is already happening.

Your push back here is odd, impolite and really disappointing. You
actually should be happy that person outside wants to care about this
driver...

> Hi Hans,
> 
> Incase you would like to split sending PRs, as the contributions for Venus/Iris
> would be significantly higher, let us know, we can pick that up separately.

Considering quality of the code you sent as Iris upstreaming, you are
not there yet.

https://lore.kernel.org/all/1690550624-14642-1-git-send-email-quic_vgarodia@quicinc.com/

Please learn, read how the process works, what is the responsibility of
maintainers first.


Best regards,
Krzysztof

