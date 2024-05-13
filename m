Return-Path: <linux-media+bounces-11430-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 653788C465E
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 19:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 965A51C22B64
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 17:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DA1324B2A;
	Mon, 13 May 2024 17:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J98GTKTw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312C52D058
	for <linux-media@vger.kernel.org>; Mon, 13 May 2024 17:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715622201; cv=none; b=KyYa/u+7mqZuyLQ511/okdsGbqwlI8aBaxBLD/2AWls1ctL0yvAQhVSAWaO58RZw9S9QC5lAaFGsK2if0aI+rWOAbdzCcRjcq+JTT6GqpfjLDvXqImRy+SwBaKXL5p1/UzoSejm22A3ZepRUWHSaJgqy3IvGMu19ePD2fVbcUxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715622201; c=relaxed/simple;
	bh=CejXXsjOA3SIu2w4YNwZ/Z+ltOoM4sfK/JZcNG8ud/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gfYc1MsV0pomms70K05KAVBJhdTSIaERJ5V7Sy6nPFnGL0af+nkJbmyvoMo6E8F75eSfp1vCaIOCccOa0D1Gsq39rpDD828nbx3o1R+TUNANg84vC8mhm7p977+7FzLSDmrk3y/62CeQK1nq2iaqydi15bTtpXzNIoAWl/saC50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J98GTKTw; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a59b81d087aso1166687866b.3
        for <linux-media@vger.kernel.org>; Mon, 13 May 2024 10:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715622198; x=1716226998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CejXXsjOA3SIu2w4YNwZ/Z+ltOoM4sfK/JZcNG8ud/g=;
        b=J98GTKTw3D0z+xU+CR0UUBU22I88kwuahpsOh4pPHBwWv3JURsu2HOPNfYFy4ZZtrd
         lC5SteOWQUt1FKTWrrdT4U92QnltFp7dd70V5klAerhRgqi7AfCCvvtK51vXZQfwuSQC
         Hc1b+CrNHtskuouFlp9CV9RQdOSLlrbXF/A+z7HlA6yY93R5Wd9B3ks8Tw+G+2Lklv4b
         1U13sUshsYRhDVlzVIUMOIF34ADSR3IfqiGWnvQmfyqJoAkHM9gxdGXzs08s+fgXkEvP
         QC5kBEMTyI0C2EJgKJTEwYt9x7sVJPgtJxB/V+RKlUrN7XhX3Mf8aQXm9TjGoKFcsi4s
         2Ocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715622198; x=1716226998;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CejXXsjOA3SIu2w4YNwZ/Z+ltOoM4sfK/JZcNG8ud/g=;
        b=tvrdI+W3/7R38jlji97Iiq40Ck6Mzk211zjkZZYw9OQyY6mVliUM5u4l99sJYk35Xi
         TlDzFJhZoIqO8rUR+/Fw5eCaGVOhdqnvC7XzkjW1l9TVhsQZgxO5Rr1aH0cpuHaC3qqN
         NDkKmjC+q9Y0NJSUxhaWylqiI6LVxeH0WxEsXdwso9qEISsfxqv9tlvZOQCNMSbaS3AL
         bG7q+Me+nyUCUlZQJmadsOyR7EvXhZc4SUUDYG3wSLiDW5qLBjneo7sKbpzShIFdrV3N
         8sbMwcUEQxdnf02wVCya791F4DNvMT8ZZTca0GS8YvQ7qPim3JR6tE1LpRgGqzZBLOj2
         0feQ==
X-Gm-Message-State: AOJu0Yw58QcDR+ayss/ySJGE/e13FfvFYxqFjQnrCDRq4gHCmOrlL+yD
	Vy5IcPr5BBrk7zWjtB2exKn5J7YT4jT4eUzwc6qF7yQ/EFwm6GlorZmjEK+9n1O+dLPFVo4XMKL
	OeNT6c6rT
X-Google-Smtp-Source: AGHT+IELKDh/+p7rTu+QYWM0Kfw5Umh5ct8MWUA/OEgaNq1Sq3Gqglnpa7+36cmcM3bbU55BfNcgHA==
X-Received: by 2002:a50:bb0f:0:b0:56f:e7b9:e67d with SMTP id 4fb4d7f45d1cf-5734d5cec3bmr11655801a12.12.1715622198507;
        Mon, 13 May 2024 10:43:18 -0700 (PDT)
Received: from [10.1.3.28] ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c2b8f7fsm6393355a12.66.2024.05.13.10.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 10:43:18 -0700 (PDT)
Message-ID: <12bfcd12-28ef-4fa9-9a46-f370bdb4cce8@linaro.org>
Date: Mon, 13 May 2024 18:43:17 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] media: qcom: camss: Move format related functions
Content-Language: en-US
To: "Gjorgji Rosikopulos (Consultant)" <quic_grosikop@quicinc.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240411124543.199-1-quic_grosikop@quicinc.com>
 <20240411124543.199-6-quic_grosikop@quicinc.com>
 <c6797921-2c2b-4dc1-866e-011d10c9d3c2@linaro.org>
 <d53fec3e-e46c-4185-abcd-e621818057a5@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <d53fec3e-e46c-4185-abcd-e621818057a5@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/05/2024 17:52, Gjorgji Rosikopulos (Consultant) wrote:
>> 0 as an error condition indicator is not very common, at least it shall be
>> documented in the comment.
> The original function was vfe_find_code. This change moves all format
> related functions across the sub-device files to camss-format
> I believe that 0 is default format

For this series changing the result code is extraneous, agree.

We can debate such a change in a standalone patch on its own merits.

---
bod


