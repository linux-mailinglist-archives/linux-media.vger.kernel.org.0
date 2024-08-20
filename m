Return-Path: <linux-media+bounces-16534-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 748EE9582F9
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2024 11:43:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A24621C20E76
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2024 09:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CAE118C02C;
	Tue, 20 Aug 2024 09:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oLgNv9mI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30D818C02E
	for <linux-media@vger.kernel.org>; Tue, 20 Aug 2024 09:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724146816; cv=none; b=aP05kpUh1QYE6ka29pI++ghLA+RBfCUTgxY9/oRGOLgRSeHf6fTt7LPzlsYov9mFpdrTGgsWn2JM1XY05FEgvlg+ahApP3QefngfHr5Ba1jCaEeJ76/12AUdqoQ2sfg3wSeF/1/jf7yDfuFkc9vgC6/srM10bGS665dTo/O7KJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724146816; c=relaxed/simple;
	bh=h4dh7CaNB4WkQEEbJfH7tP75tDnRV7swdehH667kjlI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sLLcBrJPE4gk+aA/SgZH62a2rA9Dwc0mLopGG9RV9P5Ff6ZgPDEfhy/Vc9oR+TdqM86H0W3EBdVsTA1MpxMx3hn8DcfwDlo8miZqc3tvq5ZRdJ+DJ2yiPucfEBvJaKtAbuTU+jP9Aq/ypMqr48j+BOEJ8JHUtbEw2dm2N2aZhHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oLgNv9mI; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52efd08e6d9so6276390e87.1
        for <linux-media@vger.kernel.org>; Tue, 20 Aug 2024 02:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724146813; x=1724751613; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fFuH+vZGVMrawIFZ7bXsY051cjH5fetWTgyPYqHJdLU=;
        b=oLgNv9mIgJz9p6WDjv8mmZg38HfutK9OHtDCBgFE/DJehI5G6wmqBgN691EqjYXRea
         cYh1vsqPnH5jIaNzvXcPQi/IyrNAzjHW8E9x1uZebru8MP4putmX1v3iVpbVbNmqEomo
         ma8hZAeBtR9b8VWxuYV/GlBb4AAbApo19ce75wybjUEvaALdJUZXcZnnkxE/lwb+eI7W
         j3JKuotpKw2W3Xe2xn87fzMhx8E7DMC1XUHx5qlblsLvVNaxLFUyIZAB/GpeUTr5YHoH
         /hVwZ7kW3K0TKJhzFdN9InRlkfWsXVB4HSabTMpbL/B3oLf0D20wAoWI9QY+0U/dB3sW
         +TPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724146813; x=1724751613;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fFuH+vZGVMrawIFZ7bXsY051cjH5fetWTgyPYqHJdLU=;
        b=DpfTE6ouJuoUj53lfVphgfjgTAEWdgc9KTsVtSvi2m4mm7g2tPD85Yf9R8jHVl7HSO
         d/3FqP/IzbYVfZwe5hDssMJgvbI+He5j5LQMCFzEKKOxnsPSAQQw9vt2CaaL2GApZX5C
         1v6AQtCqx1AywE5ZSGB1jMzp/d7iKkhktnpGVRpn1rYCzdHsNSAITG9bSxgo/m/aab23
         /aZsJrVZRKIHGjSVz4lmiw/WNfNHNC5PvV2QGsXpgn0cXi01KGVPewfC0lAKvBZugJ5o
         BSnICnbbaXeynXklV/9bdg5sfxbl9LUzwNc8QUKXXchV9dy+BQidsZw37ub5Au5zYEif
         fVMw==
X-Forwarded-Encrypted: i=1; AJvYcCWDsu0G8f+tpz3aoypjoIOmAIMWtZSp/hvMirHn0gyKGB0LC4iD7fDVO5Lkep8g700Ya3i167J79X12nkjDOxifs2bPYU22SiWeFW0=
X-Gm-Message-State: AOJu0Ywe8Xy7qNVgjpwYYtL7in2HPk1Udo7+xOuUBAnBSM4pRb4PVazb
	nlwKM+xFjRxFpGRFUyz0WZAUd1w10R3jJz0YFJHF70w/nFC2Wrs3YAHGUvBf5w0=
X-Google-Smtp-Source: AGHT+IElGwWSpEpk2zE5tI15XFgx0ouOncTxY/I2E06xW1H3aGfFZLK5sqWddHYBVO3wGlvPkVE/0w==
X-Received: by 2002:a05:6512:ad2:b0:52c:de29:9ff with SMTP id 2adb3069b0e04-5331c692a14mr9861915e87.2.1724146812511;
        Tue, 20 Aug 2024 02:40:12 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83839470ebsm740650366b.159.2024.08.20.02.40.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 02:40:12 -0700 (PDT)
Message-ID: <ea5c2d1f-5ced-4084-8478-c722ad99be46@linaro.org>
Date: Tue, 20 Aug 2024 10:40:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: sdm670: add camss and cci
To: Richard Acayan <mailingradian@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240819221051.31489-7-mailingradian@gmail.com>
 <20240819221051.31489-12-mailingradian@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240819221051.31489-12-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/08/2024 23:10, Richard Acayan wrote:
> Add the camera subsystem and CCI used to interface with cameras on the
> Snapdragon 670.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/sdm670.dtsi | 188 +++++++++++++++++++++++++++
>   1 file changed, 188 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> index ba93cef33dbb..37bc4fa04286 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi

This looks neater - better indentation for example than what we have for 
845 upstream.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


