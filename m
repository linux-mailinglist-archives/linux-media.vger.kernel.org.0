Return-Path: <linux-media+bounces-44631-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E05BE090F
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 21:58:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D7EA85086E0
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 19:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5AE930103F;
	Wed, 15 Oct 2025 19:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WVanscR2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F391DB13A
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 19:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760558285; cv=none; b=r6/k48IKhnZjPcxmANrh+52glVnOIfi4GT0d+kNchgye4TKppBWURz53Tn5ymLZ3cXy5v9RVshzFW5poIkRhDeKhKFBQJcpcemDYK29ybLKBAoKcuxfcF2caIZh+IwmEeqoVFvgt0fmBQu5rIebthIg0PWtDSDfhhRLWqHQaKfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760558285; c=relaxed/simple;
	bh=iBbCAcZjhrqIgbhQqYVKivZiMNzfmlkCukX9J1hV+qw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kJueZuLDiRWYGt26ynmWqu2Cpm/SdZ0OIch9xGrPoN9qp1nzZYdsq+GhEnmb+f/e46vEfdjpD6VJeIZC2dLckTqL81+WuWwVzNrIQ7WHplKXVu8SlXjSG6ukMmy8OrdKSWRbUzeAEuzU0oPgvMKJatqeqHVZU0X1Eh1VZdjy5k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WVanscR2; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-639e1e8c8c8so13568426a12.1
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 12:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760558282; x=1761163082; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X93ngL5NMyRYdgDq3leVhpEnsjXz8ZNeGovlsQr2X3w=;
        b=WVanscR2qQIOyHYPu7MjcziLqHLtqHtVZkRAkqdOtQmZVZMOzFTBQtRjabYSIwUjJc
         M1QkoE2Vc1K/OaPWiToZiLgGnruyaQbw3TFm/7p665StFQRkWWB2tdHalF8zgSReN03l
         a68FgWhr2sIDEthfjdoab8f8qcI+E40i7Q0iInLeJVd51sYVaScrcVhvekL7kxu3yU0W
         uIdwXN2Irw+QvgYLjFYqKfiYdjdNCFq9kvQgWiMGC2rqU23L6jDVYLG4hQ59OBtatbHY
         /02bJPFe1wmMls8B56Xd01Y80NJPtGOLPc88jihshRvK6PmQ+7nzcDh+ugRq6qPBSAvv
         8Csg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760558282; x=1761163082;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X93ngL5NMyRYdgDq3leVhpEnsjXz8ZNeGovlsQr2X3w=;
        b=fevLNu++3vVJyf7dgqkcnMtjsTkPko162we/m45ChIJeoWvuvdpYr103yYz/QIj9tl
         dy77oC8v9lMj1qJN7i0ljYrBvL17/vevNfgMFvrKoBlQrk1vxAJ81D8MgSOwPfB+ZQW5
         U+hrHNgkR8LyYT3pOFKEiyDsZDSK0UQ4XNR6jOv9ivYbaCP1D8SVb4QPnOUnme8uZG7g
         0AjmzbYBU0CXm9sqQ6TYffGO9Evmm1W2yW1oDMmPhKP+h/ZPiFvc5oTIPzv2Fv0lDWcN
         LAxDTCnAk1wqyZQv7kBpK4LHH0t7dDV0UbtkxPN8IAt3kqJa96QL9/xIoTe/H2We3PfO
         FUOw==
X-Forwarded-Encrypted: i=1; AJvYcCXE+ekVyVK+QUgrs9sBqS+xVMpdwkzqXkq3vtnhCyWo4KmdXLd1u4db3PooUzv4fsyV3/bFzpnBjpMcmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyikcluTUqu0Gly/fh6WI1lPx/9jsutSYCCQxINYqZDvBaKC3Zz
	PCrbPx/AMzzFff/1eZBeDiIwWMSx3JYXj4qTU3PFMTnNxXEMbXp55ZwEc1r7RhYtPYg=
X-Gm-Gg: ASbGnctxjmzrABXl7VcgF7Eh71nEyoebaMvIqM05Gh4WOw4UI2HcCoe9+y6Pw4fFxUy
	u5ECF44OXgjYB4EN/5cbhePrHHzQzTfIEFIm4t+zuzMubjIYRjYnKDHBeMQWclwBgwjjiMxSM1S
	YkbbG5Q3uBEf7JVmWVd8TRqR1wIktzA5piJY+Gdd/heB2LrYpDG4x5mNcp97kYetBWUlk9UYyJS
	CUujvS9BZy4nDeO2bixvyEZAWklovxzASL0Pk6LgLQIPJ7vDerTnw6tkUhoiURhA9X/3nZbSdbM
	Y71lSgXzufvf/+e8+Hnf507pH6wkKZOqDfYr8rfJgcIN43UTCIK8eW+PcquYP1zp2awA19FupeR
	ThKFcJeVpTGf9eUi2pUab56eL+/yF9o4Xf0+2SO6jA9FzjL0WLuRh0NHGD8zg/oCGx/ggjFjM4k
	3wX2uMM7E/zmy/dkyxW35QGA==
X-Google-Smtp-Source: AGHT+IHf2Th1L2XYSlYRjMvRiaQwEPPv0rm4KoRAruPpObpOgoCaczpFuMinqPxSmwcgVKfFpOWD/w==
X-Received: by 2002:a05:6402:23c9:b0:634:c03f:c605 with SMTP id 4fb4d7f45d1cf-639d5c75dbfmr27308818a12.36.1760558282021;
        Wed, 15 Oct 2025 12:58:02 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b71443sm13887338a12.26.2025.10.15.12.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 12:58:01 -0700 (PDT)
Message-ID: <ca8189d0-a518-4716-8b28-e36571cbba5a@linaro.org>
Date: Wed, 15 Oct 2025 20:58:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs8300: Add support for camss
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251015130130.2790829-1-quic_vikramsa@quicinc.com>
 <20251015130130.2790829-3-quic_vikramsa@quicinc.com>
 <b4207e22-8d9c-4223-8b28-272d2650661f@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <b4207e22-8d9c-4223-8b28-272d2650661f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/10/2025 19:49, Vladimir Zapolskiy wrote:
>> +            power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>> +            power-domain-names = "top";
> 
> 'power-domain-names' property is redundant, since there is just one 
> power domain.

Its a required property of the yaml.

---
bod

