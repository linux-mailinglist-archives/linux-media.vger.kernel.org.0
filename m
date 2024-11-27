Return-Path: <linux-media+bounces-22159-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 465779DA5B9
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 11:27:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7BF2B25ECB
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 10:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9501D198E89;
	Wed, 27 Nov 2024 10:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DMn+fCTe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5C81974F4
	for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 10:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732703218; cv=none; b=fJJEItJLwK2CrKK+rzYAcBlCUVd2Iy6VpuOrZbALOW+63Kt5MTqYrOOEPsj3G0WqQ1U7UYWbax6SFdYGTyOF4gb6Wd6Lk4QAUFz/O5QL7S8ZhKiO/eQKExQd6ByWihLrcs+xA1TfGGFnXIkGYg5O3U3ET2XhyaZ/idpsWHe5g48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732703218; c=relaxed/simple;
	bh=S6bt788GwhrWwpfabdGGotkjGPQzcxS0+bPJYUswNRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lmi7RkARgBrfKeYW7dWa+y2CuOr87pyna2RSVPe4cojfDY6H8f2/WhZm/zkOYjaO8aCKLg9+2xXg7y5ZUlfV0BEEpSkYpVGXAyBqMIZmgAAzak2uMi0FPRCMqcGX3zbRibvsAiZfvdoLko3CixkPTRWAhPY2NUFTVJUjCqI3H/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DMn+fCTe; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-434a7ee3d60so3591455e9.1
        for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 02:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732703214; x=1733308014; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7+cmfbelmRSaQQFPiUTQDZitDA2TYw9iUjlwm476pkA=;
        b=DMn+fCTeeMNZZenU8eF6Bzwf/t94dPxrqp5g4hCwWZubvsx+228sefVDGPRV/Kz7CY
         QcDbKFvOX546yja/sDHj/GcxLcyFpQ27FnbU2mN3oTbl+jg4r+UOxtRzF5iMvAup9RFF
         uL1uia41dWn9QqEOii59AxmL1OU/RWL9f7eanGJqqbsmyvHFMhO+00Sb2MnJGFlDNltl
         Y+Y7fYTP+wkd6F/HPWZNqlEkFQkebNuqnwD+W7/KkGgpreQb2nxbuTziSGpMxiwz8NJb
         Oph4zW06pyDElFKPOPXDDKcOHVKav1xD/xE25hV7k1YprkYFbEv8j270RVHN9Ll4qM2J
         MdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732703214; x=1733308014;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7+cmfbelmRSaQQFPiUTQDZitDA2TYw9iUjlwm476pkA=;
        b=XuCdAdxxaugQDxJhtDEIarc33sG5UhbS+6q9Z5FtXCUQGG2CVzow4TGOYKaar/BX60
         WQYIp3wlRHfKMwjxHo+px/aFgMzDBDxoXO6YheslP57F9ejLt3I3IwNsd8KsnaQtElio
         UredHUYGk+q04NUXvSrOqzZGjLK2mw00RdFJM5miEVfVkZ8NKNSX+xyU5tGdDhFM5yyW
         JkbSlEYXj1EXLR1IC8aqM6TcDaHoZXDPfPW9ueANbXmXW9xmMawkMujYcK60W5HFDk2Q
         LIWnrV0xKruz4n5DLv9YUztjwD0tMzIQafM+yM1aTsASmMBlmAD1Sl8fgSbgKPIgp426
         itBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSiOofFrrGOMVl9TzQOotXS+w+pfG3vJ3aDt/tljqbnxC8JIpz1keNrHLtMdLXngNxDwvVxAARxg6nZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdx7RZeBdnnWuqPMgr2h1nkK5sbc4EktYvBMpevN2+msjT/wSo
	JtJ7+dIMCPd14JjrHkkXEI8DBLi7o6po7mVsjPIyH/xorfPFNZywV4i4Ymf93vY=
X-Gm-Gg: ASbGncsCHUBJhZ/HoiB5U2rzohoUxx4EPfSdecO6w7VP3QVphcC/aCN7ZnG9n/7tnd6
	S+Of45BV/DwT2+fTVLu/DHu5WmL3L06F50yKIfkdNgo/Kwzt55XiqwQiCDPG0Z/Seor80yX7VP7
	RpuvGOCwZBpQbkM7IaWOK0mj8S0a9uaxk4UnGt3/RDKW6TyrDETo8bznpFJBY/9YpBXgdaQyfzG
	VZkfXH+tOg4iUdQVc70edejvtbfUvJoeILcuzXexYqZ++mndvHdtr2Ieuqo2CQ=
X-Google-Smtp-Source: AGHT+IHg6WbnrX0TF7Gf5SRVmRbOlRCRzVlxg9KnxKtMXHlYhNgEnOW4AlPtq4E09rvfEVr0xHICWA==
X-Received: by 2002:a05:600c:1e88:b0:434:9e17:190c with SMTP id 5b1f17b1804b1-434a9d816aemr19447135e9.0.1732703214187;
        Wed, 27 Nov 2024 02:26:54 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa76a981sm16464015e9.16.2024.11.27.02.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 02:26:53 -0800 (PST)
Message-ID: <fab23e56-9ef0-409a-b9da-a866e92590f4@linaro.org>
Date: Wed, 27 Nov 2024 10:26:52 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241127100421.3447601-1-quic_vikramsa@quicinc.com>
 <20241127100421.3447601-6-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241127100421.3447601-6-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/11/2024 10:04, Vikram Sharma wrote:
> +		dovdd-supply  = <&vreg_l18b_1p8>;

You seem to be missing some supplies here.

I'm not sure if we've covered this before but, it looks to me as though 
avdd and dvdd are missing.

On rb5/sm8250 it looks like this.

     dovdd-supply = <&vreg_l7f_1p8>;
     avdd-supply = <&vdc_5v>;
     dvdd-supply = <&vdc_5v>;

Can you point to the right supplies here in your dtbo ?

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

