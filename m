Return-Path: <linux-media+bounces-40127-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDD9B29FF5
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 13:03:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A999820309E
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 11:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81DCA2F1FD7;
	Mon, 18 Aug 2025 11:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gKi7dEQj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443E430EF81
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 11:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755515013; cv=none; b=ROp2TsSV/RapZ3iBsc+xaLpuhMnEO5mRHvzoymuXH60+ASyPPAdOk3aixYQp2UQq6HJFiT8AykQ9+KL3evDfwd18b2LCoF7RzGDrlODl2CW/aujOtzqtWzt1tqDJaQaNS5jF0w1fxMbyj9Qp3lKyprJabM1R+3IyrZo3+/eZ/pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755515013; c=relaxed/simple;
	bh=4Vrnl54e8ENja3qpeQbW9kYQAacjBD4IHfjVX06fN1g=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=jDVB/SCdJTeu8OgMaxfkan4gJBY9DNuOxrvsfU2Cb36BRvDntMVFM0/YPR7sSq8Sb4BnfgoQhdEZL89Qgu88zPR1313Kdk5yqc9p+7H0Ju5mWyaLZDm/O2I+Tk9KIYCGKBDmHNRr5exT/XJclIgCkHcvxoyWD9uy0EN+J7GQJBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gKi7dEQj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45a1abf5466so21547075e9.0
        for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 04:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755515010; x=1756119810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1Ua8O/1O5+5nB5qEW6QCnDHLWUhwcA6cIXBt4qTLsb0=;
        b=gKi7dEQjpn1YlC8zkQsd25Nx026YFeWVE/vuDPLB7uE47HAMF6RQYL0ieBFVB/Xsah
         dbnnJNH+JYTqvM0kZq8THRMmYBOFZilJ68/t4cde/vE6bzwupVMm8H6iZGJ6oIsa4fyk
         igMyb40lW2OFw+iaqxOgf4pba3asuC1JCfO6Aoy1hPDm70konwWs0le7HiLEDirrzuIs
         Cl5QdHLKM7Oj76Lko1Sov4u2Q4Ur5zdhMm/sMnjE4HYoUaEvpj8FTj+0Sk09x/8G4OXv
         ug6ksrYMFYZykmbeimDwKnPYg/pT/cgFJymQcL3mtw/MDywFC+sRc9kOmjZsbnRK+6Nu
         NuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755515010; x=1756119810;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Ua8O/1O5+5nB5qEW6QCnDHLWUhwcA6cIXBt4qTLsb0=;
        b=wHG1WSCRT+yqVexhAmxovbgLqPe96bsbmrOzC2P1EVsLDFS+2pf/sdmkPG7IX4xSBM
         JwpW0u0x2ihw1qdngR09bKXhypjGg/oFDcbLjik3qVPUS2SUArASISCiOrECeg+iAcwK
         F36LzB7uF3BmuoUnxc0iMWp/HKGiF2tf58Q5ENXNrCUozEy7i/BeAz4+hMvlqAxdqSGl
         zKP2/Joc43yf2Fd8R9dtQrKIiFRbKFGJH0pMQ8K+d1pnlXahkLU0JqyZ+H6rvv/rkn6y
         Da9ezSpP0E3xT57RNRmEZmLsacgWzHPMAPVaKeFFTRJK5ptpGFCo/6uNhki1JlTkQB4K
         +vcg==
X-Forwarded-Encrypted: i=1; AJvYcCWYRmghdHwQxnAOSHhiN6voDCvnIkVw+zpIVqtFrWx+Ss9ScpATsT2l4DFWfTZzR9OO9D7IY7hTfkH1IQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq9DVhxHkTBIvO/uycrWhlXLexz0VE81gnLApiCpFVTKqjor5f
	IGSwW+Htst1jzUbGk3VqIV266u8ZxyuUA86GJwd6rVTLJFz3A6cieDhfASry9AAkClE=
X-Gm-Gg: ASbGncugvtV41XvMQ6O7juAoQv1uUSToLF/s24xxLFXa3k5pRJMoF06v951vOX1/WHJ
	UC2rdNdrcIOC0z0ouNqAO2QzWmRL+oJet9H8chxSvg39NFKaCzI3vUVFYu1Z3iFlAsCYnBQxlsZ
	AFPEK2hGowlYu3YWOHtiCToDmAYDDz73SskYT9Ec4CV+0PLN7xx80hO5/bgfiRkKO5SR81IkBgP
	7ylsk2ByJ3IyLhgQtrkd03XBxTbbE8anZOsB/tR2DprSf0v6bQn/QBtyrZ8nJ+yXx/SKnUdTELi
	XfLtUTXK+j4Qo1HdPpBLPNXP9TnwQ3MJ5/KvYk/0AIQzyA3tMpIktxDgit94nT+zqMviWVCi/if
	+OHaObpDLWO8kAMuZ2IoG0r12cYa7CVcIW7HW8vOk+eGnmqv6ebaDC/BLGlVSkPU=
X-Google-Smtp-Source: AGHT+IHHmd37mBk/UuuFz6An0XBY9iz2o54JOg/oul5o+HNUvG1nx/R428eD2ETm/rl5tKc9uMFbhg==
X-Received: by 2002:a05:600c:444d:b0:459:e39e:e5a5 with SMTP id 5b1f17b1804b1-45a22345439mr84584705e9.5.1755515010400;
        Mon, 18 Aug 2025 04:03:30 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a22210ab4sm129022355e9.3.2025.08.18.04.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 04:03:30 -0700 (PDT)
Message-ID: <8c2e9767-feef-4d1c-8100-d66eb1207016@linaro.org>
Date: Mon, 18 Aug 2025 12:03:29 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: Fix firmware reference leak and unmap memory
 after load
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20250818-iris-firmware-leak-v1-1-1e3f9b8d31ce@linaro.org>
 <61f9767f-ee4e-4f93-b84e-59ccd422c98f@linaro.org>
Content-Language: en-US
In-Reply-To: <61f9767f-ee4e-4f93-b84e-59ccd422c98f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/08/2025 12:01, Bryan O'Donoghue wrote:
> On 18/08/2025 10:50, Stephan Gerhold wrote:
>> +    ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
> 
> You're not using the latched pas_id declared @ the top of this function.
> 
> With that fixed.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

No I'm wrong you've moved this to a separate function.

This patch is fine as-is.

---
bod

