Return-Path: <linux-media+bounces-31340-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2B4AA1B6F
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 21:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9AA727B5355
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 19:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6C725F97C;
	Tue, 29 Apr 2025 19:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rf0BKcOU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395C2259C9D
	for <linux-media@vger.kernel.org>; Tue, 29 Apr 2025 19:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745955643; cv=none; b=T8g8cV5KqbhwdyTtNCNl0J+TSoFoEOcHbb6hXFKyHOzwbOt0Dx8BwusMvFFVkTe5+YMmztPImGk0pk52ExBnw38lxJ7xp2fTMcpv1zH7fhPoYiA/2Qf4fbz+lFppUCJkkJu1IzRJVfgSxklyNMxdcjJqDwDe3gTmCR7N9Vyrxu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745955643; c=relaxed/simple;
	bh=uyBW2F53VjXt91VxFs8QcOadp66bOPozuITiEZzqW5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gKbGdmexPh8CvrYB+B+QCK7vrZPAGQtGnlo4HdqOoANlAbIooy2gZKHHl8BdZLwk+40cJG8srlnrp/iaMtbZla/h3MNfEV3DSfRzSdc7VoWk4ebu4cEH2d1Y6SxjDbmGn/pocOwVNGy8DR46VQqERprDjWOwlXfmTMrYUdk8A0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rf0BKcOU; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39ac56756f6so6490094f8f.2
        for <linux-media@vger.kernel.org>; Tue, 29 Apr 2025 12:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745955640; x=1746560440; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S0PbBEsPipY0WewKQtcQRsKwmeC5ZS0HYXbMTYUT+Lo=;
        b=Rf0BKcOUUiwJ/A2Umzhj3/fn8+p3+40lItBl9QGD0Vm1vAgLAgx1mF/Td/SqfWXMXE
         Iqu7x1f4bcpVIFfRI/WkVaUGfaUGThsOxeu04AE4I1hQ+nTTqWu+Kt1zNoGB/yxDp09k
         mjMOSwhjIRFwj6l6UBwCJH9jtip+RQ3zlmrns7DsSemYWF1A6SM/sAiUASvwNglyN0JG
         u8/jj+4EX0nV/kpuSHYCLVk2mr5voM62wgCQhILC/vaG58v6MVUEpTKto1EkcGXVBtVN
         NmbDSL1ucE5mYzDdqszwLk2VDb7sYHBfTPwiWv8yUlMysi+KpJgroKy7/FhYZXlx+fQU
         Hn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745955640; x=1746560440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S0PbBEsPipY0WewKQtcQRsKwmeC5ZS0HYXbMTYUT+Lo=;
        b=htj+KXhJqm55fuhND1fZ6QAuhLQnNIl6cJigacJ9gMsS5lgxxN5K9O9pqNySk0DCgr
         RVCugK5tAOhw8wogFsF9LBhlfs0w59rj3Fl91588v4zD0FJDYZlpTXjM8MNudcOviMVH
         laJWcp5j2PrRrDpZXVuQiE8nhNWQgwhJfE20du2D6+/sjJtat4G+cODYVDbnWaIdIM1T
         IXVgphQYNWlHJlz/iV69oPyOZ9u4qrURW6DzqZK3+MS57MSNWhbErc/NHKKsIX17cOAM
         7XMKwsMeHqFOe828dQydFS2exqi4X6dYTHQ+RmCejqwB8LwA1iotGzlIbl3VgCoISBl1
         qe6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWVdGfwSb6TuUme1UNiKscXKkm0xyJZKcQD+l2gRULuc5zIHY22pN9Kb8qYcmR6W/ZC1QWORJ9Ue1wiZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt5oEAe9pBbFK6Cs5xiMyseIXyaysT2EmAQloA/H38EMxsvCR3
	+dQEBIuhfnFyx2HCg2MOgQlfGZIKnoGbytpCaIVwQzOCdgGsJKTG88W5K0MYMvnVEYjmUP/p8d6
	MDqk=
X-Gm-Gg: ASbGnctquzf9FL2twkEuuydMMBPxijbtgo3iFcNJliCxeyR1RmLwe0H2OwuqY2eaQvF
	m1V8lw21R9ihMSB1UGUmoEETMMaWBKDWmLpObEUuBTbeQ3c0xjGOenis6Z3un7j25s5ZsbSXJ/X
	8Il8MYczZkDQogs7J+BJoNpD9Gj8P5U4iBGE6m2cBgrnRwxrKi7IDvheq8S3nwqO0aNb/SJsvzg
	52sW48iuGK84i8m/oiDgeOvQqXSk/zxnaHVbSQf5xNy0utpAACcqzeDTi7FFPu+/Dj1f5QFkDhv
	GotUfaAuY/WUPQkk0uhQbglKPN2hp5xtFZp6ncJfm96NtuZ4wQLjf9CjUKvUeR7teBn79gSdgGY
	tnnIzOg==
X-Google-Smtp-Source: AGHT+IGdtirTulKWn3yLeBQ9FLdZchJ1HiTAtu6x9e+yU+nlnzwUCocNO4vXYUU28KgjdJMHGmXGhA==
X-Received: by 2002:a05:6000:1a87:b0:39e:f89b:85ce with SMTP id ffacd0b85a97d-3a08f77c159mr564828f8f.26.1745955640581;
        Tue, 29 Apr 2025 12:40:40 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441af882ee4sm20920745e9.39.2025.04.29.12.40.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 12:40:40 -0700 (PDT)
Message-ID: <000934a5-4934-4d21-8859-897fe48474dc@linaro.org>
Date: Tue, 29 Apr 2025 20:40:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: qcom: camss: vfe: Stop spamming logs with
 version
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/04/2025 19:08, Krzysztof Kozlowski wrote:
> -	dev_dbg(vfe->camss->dev, "VFE:%d HW Version = %u.%u.%u\n",
> -		vfe->id, gen, rev, step);

Please just change to dev_dbg_once() instead of entirely removing.

Same comment with the other patches.

---
bod

