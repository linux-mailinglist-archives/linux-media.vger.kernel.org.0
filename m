Return-Path: <linux-media+bounces-14140-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F219174D3
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 01:39:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 815CA1F22D54
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 23:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581D617FAC4;
	Tue, 25 Jun 2024 23:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xkUSQlcB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2551494A3
	for <linux-media@vger.kernel.org>; Tue, 25 Jun 2024 23:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719358759; cv=none; b=j9k36XbCHBI42a/Z1mU3LmYx7+9L6KXZLKc1/zk80Fwiqi3YymvrkGvL4gj9hi8Jgsm3UgUY6c7vmTU2xTqvJ9XcNxw0iZS9yuDCqjxwAkZ3G6fDdyJ12I9UeBSEWFrTXYHmW3MbWnA1NF5Mea7HdVirdyKg4rU8w662xJP9QVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719358759; c=relaxed/simple;
	bh=QGNSrDndDsy7znAyv3HWUXfitKZOGxn7Hlaptwk5My0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F1MYWlqnLreV6zstaLx3dL0HwGQI3ZOQblFWdxkE68hALLroL3OJXD3owwBye3eJrupMZynaL+zPN6Ua+GJcXShvGZRM6eqAUCuYxM810OAOmmH0kNcOgEZfrp9HYLUBySVDYykWQvJFjOwpxfCZlaQN9cohDv+G+uK77v88/cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xkUSQlcB; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42249a4f9e4so45588535e9.2
        for <linux-media@vger.kernel.org>; Tue, 25 Jun 2024 16:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719358755; x=1719963555; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yJjV12XAs8YTnmMTkvXhbzSiugdS4KJZNqWtwvtnOu0=;
        b=xkUSQlcBnbF4toqaDFFLQ1uLKJH/KAPqXMZhGUZEASzWNqpBWoV/eDdwWQjpjizIx9
         v8viSCRj3k9mPO7xX9eAgG4c7awfM7QkR0CB9LHX4sRJzentMiRL5NXXFVJ7u9hQPUrp
         oXVQ/fk5FtFXzQ+g5bgM1JFEDpV31LmnLDryzdAxFKH3/pahXuN64P8i4Dy2PVwJyCqP
         MX8xSy/NkxOuWRbz1bfifQuwfzcf7UWoNlZreyu+oaeLOE2NuAnnqP/AtebZhU2BInV5
         NdP+lSmcW7cSSx+hqDk6ugLBonaZLCvZZ9+1BshBv3Nq5U46PWZhQiecF1x+F3IZ6rVG
         kSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719358755; x=1719963555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yJjV12XAs8YTnmMTkvXhbzSiugdS4KJZNqWtwvtnOu0=;
        b=QNX2PUSaH80k8ue7ymwitQsunWrEvAm8PLRNwhmJC1jOOB3vQTa3Zs+vSGr38zHoDM
         Y5/ia38KbJjYS2fl91TeCDsBQgFW63B8g1CziTinayyvIkurpx7bSIqbuS6QKLf+YJQp
         GAlO5aVaQLg74ahQGfpW/+n6ZXFb6ixohVqQ1j4H522qtNHrZT4fO8R8FikgsCbzDkhb
         XHrsRM2Hn4mxVAGvPNY9Q8VghNhOSMTL4C2Hk3A+wKpnIzopBp1qLVZCSysMC3pio78j
         m5cGizgvkgWMzEk/eoBSRHB+oD0i/oEiqfpTzWGDLyz4VIJDIkbM1kIWtnN+m4pIRewS
         GUwg==
X-Gm-Message-State: AOJu0Yx3Re7mJ0myrLp+A8FAv85pBL6HgQwKrmYa9FJB0+imxPoep09S
	AVnbfUJOAdMUOsNX1x2bScsnNgsdnrgEu35+rkPBkI6Gw/VY/3wp16ary94Ujp0=
X-Google-Smtp-Source: AGHT+IFA2Uu4BfBXGHIeU80NqPpZU+/Zs8jXP928i5OqkQLy2FnHSlXNYfDdGXVee2FNygHhf4p3sA==
X-Received: by 2002:a05:600c:434c:b0:424:7e68:99ff with SMTP id 5b1f17b1804b1-4248cc2a78dmr68196155e9.15.1719358755286;
        Tue, 25 Jun 2024 16:39:15 -0700 (PDT)
Received: from [192.168.0.16] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3664178f5f7sm14004988f8f.19.2024.06.25.16.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 16:39:14 -0700 (PDT)
Message-ID: <d770412c-e1d1-4e84-a72a-bc615294b5b7@linaro.org>
Date: Wed, 26 Jun 2024 00:39:46 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v3 4/5] media: qcom: camss: Add sc7180 resources
To: gchan9527@gmail.com, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240624-b4-sc7180-camss-v3-0-89ece6471431@gmail.com>
 <20240624-b4-sc7180-camss-v3-4-89ece6471431@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240624-b4-sc7180-camss-v3-4-89ece6471431@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/06/2024 13:13, George Chan via B4 Relay wrote:
> From: George Chan <gchan9527@gmail.com>
> 
> This commit describes the hardware layout for the sc7180 for the
> following hardware blocks:
> 
> - 2 x VFE
> - 1 x VFE Lite
> - 2 x CSID
> - 1 x CSID Lite
> - 4 x CSI PHY
> 
> Signed-off-by: George Chan <gchan9527@gmail.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 251 ++++++++++++++++++++++++++++++
>   1 file changed, 251 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 1f1f44f6fbb2..9ed810afc048 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -834,6 +834,244 @@ static const struct camss_subdev_resources vfe_res_845[] = {
>   	}
>   };
>   
> +static const struct camss_subdev_resources csiphy_res_7180[] = {
> +	/* CSIPHY0 */
> +	{
> +		.regulators = {},
> +		.clock = {
> +			"csiphy0",
> +			 "csiphy0_timer"

Broken indentation.

Once fixed.


Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

