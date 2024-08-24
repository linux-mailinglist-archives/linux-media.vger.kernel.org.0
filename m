Return-Path: <linux-media+bounces-16706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD46A95DF27
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 19:05:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82F251F21C56
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 17:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1295E47A6A;
	Sat, 24 Aug 2024 17:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZbgGzLCU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4F13B2BB
	for <linux-media@vger.kernel.org>; Sat, 24 Aug 2024 17:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724519130; cv=none; b=D/BbrNK1AmZ3cTVJ3s2peOKlbPV97t+H4ttHmpNzw1PQjAe9CU9bS2FBclI0y0KRbsZptM8PW98xDdUq5mQlcNLzK95DnUZtXD+ncnMrfQlayo1tXOYYKGeOyHl8QSt2pP3mQ/XmgIGHxfvIs67Rq+Sd+sACBoLrzqmvrntj8bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724519130; c=relaxed/simple;
	bh=YZb3KQcDwKbRfBpA1jL8YOTnhsu2wLksJptIPtsdgs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cQbd1dTegle2kA66coIpOErmeo4qN87F04+rFRLrNfwGmuLDXbi7wmmh6wJ1IAVBIGkpw/NOAkTm+gNFKwjgt5CTUKZ6A9p8jTs7xwI3Sy06cRULQRbXVBVNc8XMjf8fFmi5jEJ3U82hxpry9rUCX5xknyu2aquutan48vsHiCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZbgGzLCU; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5bed72ff443so3607433a12.1
        for <linux-media@vger.kernel.org>; Sat, 24 Aug 2024 10:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724519127; x=1725123927; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y1wqIXwilhWQe12ivt8ypdTnldhiR6eZgAaKOzl3oFk=;
        b=ZbgGzLCU8NeN1kyPzEfZytA/xl6HaCYC6XtXQdS89SSfavtANmLmWN9q/H8Q1s+xyj
         ZNOTBZZknjRbAjkX3XROvIuzLxxUaXaCZ1tpBQldyjM4vA1Dm1+k2xvwkiiG3h1V9VTQ
         8puTMyY1YDu7Lpw5HE7PZHdLesG55ApEmHWTCb8HSAfEOtv0MpQ3Q5TMgJ0+KA0lAXrL
         k2FfYM+S1pa5cVeZyZZ4T9YKLXpLE49thy/d9eMQdDts7KGJE2h/g2rna75gVzut8v5M
         7ylGX4TUhp7xt9BP4by0Zn7hfo4e2gontjVu143Ex/JR/XgReUBT4tdVVsrPITnZr0ek
         dS8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724519127; x=1725123927;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1wqIXwilhWQe12ivt8ypdTnldhiR6eZgAaKOzl3oFk=;
        b=L+3y1HZVsrUHnO3N/eoqmG96uZltRsM33LlcRUJVb0oILmR6g1aQHl4L+4IiDMWnuT
         4pJCLaFg8ORDnsTPsPYQ/YN+xn02oi9zz3Fj3bpGpM+53QLVboYtJ2AQ9iaPoa4DeRbh
         Sm7qdDnNkvzYEXtYH7z5RCNAS/Uas9fBkHwF34Z6jibkumZ6mtBU4Lz8GavGXaXCr9HA
         PdbJEe7RHA8c2Um+tg6H5k71AZwd6fYpbPV5R1+2g5ax5VABCCGzKVop6FURvpat16z6
         dnLhYB9pRZ61erzEbKkXskMpa6r9C1/FmzqLIb+MN2Mwf0HRUHEnIYSFeht9iKTU6Wph
         OkJA==
X-Forwarded-Encrypted: i=1; AJvYcCUK9t/0mIXYCHY9Ed2rYNXKtAcrk7i4Czk1OJn+djO8iUNFA/3bh9U5jjLWmttG1/Se6hKo41grWdVG9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLXTwTteribuHRnIHaFSduRVKFIvD0IFxf2lJRMvkeQuBbIi5I
	jQBjU9sSKkDA+PDJxKQlsGypNizQ3wWjU2BZvb+rretsP3D+J7dUEKBPe6jODUs=
X-Google-Smtp-Source: AGHT+IHt3Su7ap3ryr5NK4u0osd07i4VrChxnechoJXjiVeQ4wUl6du3KIaeBLPXMzicWs8zA0kISA==
X-Received: by 2002:a17:907:d15:b0:a77:cb8b:7a2d with SMTP id a640c23a62f3a-a86a54d1920mr377553966b.49.1724519126872;
        Sat, 24 Aug 2024 10:05:26 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f43661dsm423115966b.100.2024.08.24.10.05.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Aug 2024 10:05:26 -0700 (PDT)
Message-ID: <26b7fd84-34cc-485e-83eb-21daf99020ee@linaro.org>
Date: Sat, 24 Aug 2024 18:05:25 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 00/13] media: qcom: camss: Add sm8550 support
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240709160656.31146-1-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>    media: qcom: camss: Add CSID Gen3 support for SM8550
>    media: qcom: camss: Add support for VFE hardware version Titan 780

Before your post your next version of this series, please make the patch 
submission titles consistent.

e.g.

Add CSID 780 support
Add VFE 780 support

Mixing SoC versions "sm8550" and/or including "Titan" - what's that a 
reader might ask - should be avoided.

No harm in including "Titan" but if you do, include it in both patches 
and explain that Titan is the codename of the camera block in your SoC.

---
bod


