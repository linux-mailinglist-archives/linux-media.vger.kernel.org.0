Return-Path: <linux-media+bounces-25084-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C6AA18873
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 00:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C7AC188502A
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 23:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA6EC1F8F0C;
	Tue, 21 Jan 2025 23:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f8VJWcSh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970B2199223
	for <linux-media@vger.kernel.org>; Tue, 21 Jan 2025 23:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737502814; cv=none; b=I7xQEUormdy7yCypSYgPdkCkF7QtEuTW/fEL50PTbynjuIeWKOmQZhIoulYc25OkyYjOOLGqTndIOEKdxdmKvQ8+LSteBs6VZRcunGjeOsVqhdYCtnjRGYO+a1JDTbSjCybnxNM4b3Fdhg4prwJaRFX2W6H2Q4D8naXQzCpWh3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737502814; c=relaxed/simple;
	bh=TCOCQ3bkKIctxb2lRs9F6kGeraIlr58WRXM4dWXLbcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PHPC6ONrLGC2erhXcS7bFKORorREymEXUF73wv8CEFVb7FD2qF525QdwWTMmSNJNQXONy5kxAucwsW6qasF0N6s1/ORZ7BEU2Shb52wLLKEs0gFvLFQlLsvgRNEaFKGLUx3lnDsC12FcNarmQr+SA1fsRLzi7uLDQo4VPUCQl60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f8VJWcSh; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30600722804so3749201fa.1
        for <linux-media@vger.kernel.org>; Tue, 21 Jan 2025 15:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737502811; x=1738107611; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mta+AIdpMSvwE6BUNwFLh/nPE1lBGYV5zcqSpOUlngQ=;
        b=f8VJWcSh+umvEIH8gOU5BWo/uCnzMw3tmLJ9D0LV1aKavluF84JnygHq1mViJ3xPRE
         ccPkjRzJvK5SODrxbpmpo9peTX77w9wFPYVmSjbXp511p3I72RAYJFnb0uib6cVJVYuC
         svw10iYjru3nolMVkHDYdchBjgq8PZ8cHVuk7D+Od43strawMoe0VlKCwtQnM1IkncB4
         tWEWWn1yfVvYtGKyMZCLvMicP9CsSmR+UayYF363uIOn925m+3XaraW4AVdcaLAouh0e
         C22F1kzxSyMbTmr92Waz8GBXgAv+2Wf4J5ZcZldurkMP4J8y1aCP2LOeN024UQGbQs1J
         zLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737502811; x=1738107611;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mta+AIdpMSvwE6BUNwFLh/nPE1lBGYV5zcqSpOUlngQ=;
        b=Vsiz2u0LKr7GmFsBCjeFKVNxy6HucV50c+93FSOSKhrxunLixHVkREOCsfwLpLjo2s
         NrtL41OMOIYbd6Y+Sj50wvTogc2lVdxgCKgWTaEdA16V5NnMecBxyuukoIXtWEqM2X/Y
         YX4nr1xI0BFzDPyhz7CgiCQ7esCplVIa4dXz2anRxpw3cD1MHqkYOuixlAt7wmTDIK1z
         oOjixS2fdj1mu46C+2gfa+uWDE55cE1UStb7gIoLLBBtjEWobp0HXRYLkJLSMJqQ/yxb
         YNcQwnJ2Ht1a3SCejTFZKYkhhIo4Y7GFYZSuZLGQsjygdJMW22hVJVTnPwwq3X3lHevj
         KTSQ==
X-Gm-Message-State: AOJu0Yw839EsPf896IK/6ho6I9Y14FuYPgzjJqgsMvnssq9cbJsy8cIM
	Yhw1ojgTgBWKdlZjPBXa872N/j2cF7QXLKi+00KRZek5WmR5aua/14NKkOn88HtMl0j5T+aR32R
	x
X-Gm-Gg: ASbGncseRJQVhP2xhiXfib/I6eeZMNxpR8eqQeFdVZvqy7W9l0k6ZbwyfGVoX70R4VV
	E08pLdQHLxBECDTPdV0lmAWAiA41jd0ikSr48679mcgK6/Uw4F5cNiUGlxpT9xK4dSCwfAa2UGD
	AiT0iqnEQVWT/clH3NxX29/h04BHPhpyMwg51u8UJfhYIEXF7ILkp6bR2FqKcJDbGrK77T5p7h/
	0hVpkjXNSy47Im1iSJACZq3rtA1/zqaPYeaM07yTsi/TnT9efzzZGgogBUEIc7N59Kvnf1bQX07
	zpqZayOhFbequ1xZ11fNsxmkfywDKJdmIWi/OMlvjsGluWmm
X-Google-Smtp-Source: AGHT+IHceqea2DhrgZA2WSoQHa5W3uiLM2vb1SJRgqehIuMKTpetHNtLR3dhLF9hU56gKqpIbz34kQ==
X-Received: by 2002:a2e:a9a4:0:b0:300:29ed:b7c1 with SMTP id 38308e7fff4ca-307587aa08emr2040321fa.7.1737502810692;
        Tue, 21 Jan 2025 15:40:10 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a502a7csm23033251fa.93.2025.01.21.15.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 15:40:09 -0800 (PST)
Message-ID: <b4ed07d5-0905-4bfc-ab41-da86776ed972@linaro.org>
Date: Wed, 22 Jan 2025 01:40:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] media: qcom: camss: Use the CSIPHY id property to
 find clock names
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Depeng Shao <quic_depengs@quicinc.com>,
 Vikram Sharma <quic_vikramsa@quicinc.com>
References: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-0-44c62a0edcd2@linaro.org>
 <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-2-44c62a0edcd2@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-2-44c62a0edcd2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/20/25 17:46, Bryan O'Donoghue wrote:
> Use the CSIPHY id property to find clock names instead of relying on
> generating the clock names based on the control-loop index.
> 
> x1e80100 has CSIPHY0, CSIPHY1, CSIPHY2 and CSIPHY4 so simple index naming
> won't work whereas and 'id' property allows any ordering and any stepping
> between the CSIPHY names.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

