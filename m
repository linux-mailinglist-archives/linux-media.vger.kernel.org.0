Return-Path: <linux-media+bounces-24818-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BA5A12D18
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 22:01:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E05EA3A6FD1
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 21:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96301DB377;
	Wed, 15 Jan 2025 21:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b8rogVbZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30FE1DACB1
	for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 21:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736974869; cv=none; b=APLU4B9ox9phfoMmoum/5Lvk4gKo4To21a89BXa5bs5AoiVliUn70KfEl/nuGCRZgN5it9uasaqDQDHco0nYjF/XsFWs/s8O/3WM3WOwFRanYWXpZDMKkgJy5NGmY70OvX5cBWI6xh8ri48zwJByyZDv1I0PW/9b0LPuYaeQNzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736974869; c=relaxed/simple;
	bh=Yru/S4SXBY9NO29A74t0YcdN+foUcuveHw4jgqMb01M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZnU1SXYgZEPQucqs5NhTJO9lOy6lZQWPi+PxVoedpEFemIq+y5SRHjylxgK7SEVSi0/IQWfSvP9006d8tXbKapbPETP7deQAsbcTLZNjpltCmBDL3sJh6l4AUT5sCDZPRVHlULZUCnHp4Z1W7eEv5FYp8nZcoxZdoDUCIUFikbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b8rogVbZ; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-386329da1d9so134478f8f.1
        for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 13:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736974865; x=1737579665; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xzLGGAQlqPStmsjhVya2d8yxZkJH7fx5YrloQvwS7X4=;
        b=b8rogVbZujdxeDJjqYY2JrCwxgIHs63Lsj1U8AtO386vHUn+pbNsh8Yx+uChQySA1H
         A8vjmwf1uQqcNHYEjyTS7DKUK4VJFVQu62ESJV+JhXUqwiBlRLy3XcmV3uHWVPI5QeER
         MA/OstJWBT2Gx17UCX3xHjyMCvOjyEYT5Zcnev1KA0mHDpjgawCa+tpa/6EU1nA7MLAP
         7kRnPRl/TIx1CBnk6e/OScYZc2CTndaYQkCjP25QWnC7kDweCRbFUP1XnMiV5MnHxHGt
         qku1rH3q5YG1IrjATd530fFlnRcbOnyr30L9bOFH8pH0zrVgzk/mQmqqfCRBMaLGMWbg
         gZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736974865; x=1737579665;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xzLGGAQlqPStmsjhVya2d8yxZkJH7fx5YrloQvwS7X4=;
        b=UT9bVhm+ipfp4/HEFUo8TiJAV3Vj/bhMdnnSPU9hM54hcg8FNTWXdnQGq9Iw9e0oGU
         XoNxrqHhvk3jzJ/ss+BJ0zYn0NWJ+yxiyoSE0AUauQqoshEIabJLAmeKzjErobG0q13I
         MAJpitdF8lY7zdveTdasqIbIRm6EpnAxWAZvUUUFsOoEO/IomwuNbg2mH5PFaRMHSbPZ
         nzPa32boTp6XAOOXZoD90bkfDgwnkTh5KTaU2SIugPlK3PoZmnYsxwgc+phPSL48FJe+
         Rjd2PkgAkQSqwi38jdmsglIdgYgo7VgV3YlzFK523C9fh3vxFTUZSRPls1QHSozshnrU
         /C4g==
X-Forwarded-Encrypted: i=1; AJvYcCWeepm9q1bySPa4uh4QfSB3kqna+wZ1AE/D/Xrk93EB+6dWCvMLvmgFaydJNDS63BJyfv0v5jJn6T6xsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcTPBn6H/ByfbyKUW79hkjURrRR+vK25WO4ZfRcY/yOuY+Prfx
	YBljViIbZ00QS9LpEqTYfFDv/RClYA9RLu7C8eAzSwfAqlEowD06L4m/NC0Vmdc=
X-Gm-Gg: ASbGncu64GR7RZpDfhlINL0wdabb93+8BtulLikawXCmKKYxr0IetF0eykerhfZQM4Q
	SkJ1Xc1OPpu3yUl1EmS3jXGA5m2xt2wW+LVRhuy3XrieqdxgnJbHmqKaC42yFcVmV8x0/CiJprN
	Acaz7txANpguHoY63BtFPfyjBden5cy82GbPaFHWiz9krh94SJ8dhxQ3gaICx3g17VFuH+c98SW
	rVqh5Lsra7/kWxLtUoolqKlpedGm6Da82KEdMv8hTx0QWv9nkxyHUF1OH2NiULQ0dwGlQ==
X-Google-Smtp-Source: AGHT+IHTg22Q+fG9klizKomPZryDwOzxB/InrEh50EdlHpVQwJM10Smqg7fSX+Z4+PMIk0to3OjhDQ==
X-Received: by 2002:adf:c007:0:b0:385:eb8b:3ec6 with SMTP id ffacd0b85a97d-38a872e9356mr18598719f8f.29.1736974864869;
        Wed, 15 Jan 2025 13:01:04 -0800 (PST)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7528076sm36591545e9.25.2025.01.15.13.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 13:01:03 -0800 (PST)
Message-ID: <238411cd-1bcc-496a-9077-07bb6c4892ec@linaro.org>
Date: Wed, 15 Jan 2025 21:01:01 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/16] media: qcom: camss: csiphy-3ph: Move CSIPHY
 variables to data field inside csiphy struct
To: Laurentiu Tudor <tudor.laurentiu.oss@gmail.com>,
 Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org,
 hverkuil@xs4all.nl
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20250108143733.2761200-1-quic_depengs@quicinc.com>
 <20250108143733.2761200-6-quic_depengs@quicinc.com>
 <79b3e4d6-becf-4bcd-91fa-768b4098d01d@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <79b3e4d6-becf-4bcd-91fa-768b4098d01d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/01/2025 18:01, Laurentiu Tudor wrote:
>> Reviewed-by: default avatarVladimir Zapolskiy 
>> <vladimir.zapolskiy@linaro.org>
> 
> Nit: Something's not right with this tag.
> 
> ---
> Best Regards, Laurentiu

Doh.

@Hans could you possibly drop the "default avatar" when applying ?

---
bod

