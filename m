Return-Path: <linux-media+bounces-14485-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E69A91E7DC
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 20:40:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0F23B2342B
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 18:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B721916F298;
	Mon,  1 Jul 2024 18:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fwdLyA/i"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352C216F29A
	for <linux-media@vger.kernel.org>; Mon,  1 Jul 2024 18:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719859112; cv=none; b=Vk4YoF2qZXaVvv+7y7O+saxctTFxGYGleCXs94Bym4bEqKvwpWPxDqOIC6V3cPyqUlyRT0tgczXwBNqhCYO2Wyfc5fqf1e0Y6Uf1b05SivvgkvR5fFIodMY4DULPoQmRPv/4O2eoCma8uCQWh7j/Ywujdw4cIzFnLGy7lXbY5tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719859112; c=relaxed/simple;
	bh=Q5DNZJkle1fuxyMGLV0LWFww4L4pTjWDcEYU/W0hd8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZtbWe7k3PFE/h/J2zhNXQAVgDM+9f2prLA/Kqg5aO4a7Bg8FqzyanG9xUz7Bo6Or2uEeiA1BmJ7kuBQ0Gf6hctsd8gSibNMeAe4ZRDIESLmddXo/715mR4X3FwtWYbphXrdUGkt7WcZ88pI3tc7ppfrkshCI0rLtNw5ZVAEeRDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fwdLyA/i; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52db11b1d31so4758341e87.0
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2024 11:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719859108; x=1720463908; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xP26RievRLgoMdQuIRbJbPKYmkTq23GGTz7uClqgRXw=;
        b=fwdLyA/iHnDGUsQ2bJXdt9QcnmrdaMubyZnIKnbyeowy1xTS3j8ZIYlFbmslyqZMp+
         H67HJ2bJHGHqX5VQ/lX3ssWBvtVpvNNrxKoepzN6Aogwe8crMF7Tpmjfgkj/agobKBkP
         7uBo19YiS4t2wWHHRtxOnxiEg6lEhwj273cFrMxxLx3cwlvevb6Wj+w0lrTYB+2+dA8r
         ZUqqlLe5DwsMqeOHdQT3sghsAMtZkGg9K5xDO3vtL01Id8zprOR/tVWyfoW0kwCLDBrm
         UWr8qx01+Df0rMJltaH0HbofmahBP+fUcohVbMitwQGfmCxxV8r+sVclEqHSGHBNCLA/
         zYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719859108; x=1720463908;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xP26RievRLgoMdQuIRbJbPKYmkTq23GGTz7uClqgRXw=;
        b=WrQ5anISShYCoCHW4wPZ0Hi/eU2L5YDXGWC5f8UhNmqHAUn/jDG1Td1r8VyG9uO+Nt
         K+bYKxW6VQR1fGlHmZqGyPFAl0E26aFtvMERfUrwTmESOuMZg2DSwiMZL4dRRwOdM+Lf
         9Zrj8VeumJv+Boku7yIZbCw5C9M8sJJucxwwF2I2GM7SBMGg1VsM9BjPQiXs++r24EC7
         Er5zdS9LZxIgViuZAy3g0SmUyDXIBfY+SFWQ2a980Y+GT1MUwyTr8+6DRX61Uo/YA2Ps
         nPtlrdzAJyY2jJzbrc6Q0UPdnjD133NWKlC4+9bv9iSL2hjvqLJaWZ2nBjKa0SdnG4Xx
         swbw==
X-Forwarded-Encrypted: i=1; AJvYcCWX9i3i8g/v5x0rQEeeDsvdm9Y2Ezj9O1bcBshWgy6Hf2bcgDlWRExyhuqGtjdu0x8aDgMjxu/8KwG3czdawIotT7PXS14qCl/nU/U=
X-Gm-Message-State: AOJu0YxJWUrlGJz3t81CYgfI/UX+Io0MbtMvnCl/mDF7V4KGn0Eedetd
	VzjYvPENGUHsGLSc7HKvE/lgeiv2n09G13AsP1CynalSEEINp2tfb45R9CEhuhA=
X-Google-Smtp-Source: AGHT+IFRqsXEzTxzzMdgk4SiVapL0WO66+w+Yg4eXPAj4F/TWh4MZqDqfszVl6/jbUBXlWx+Q4x6eA==
X-Received: by 2002:a05:6512:3baa:b0:52c:d943:300f with SMTP id 2adb3069b0e04-52e8268b961mr4075257e87.38.1719859108356;
        Mon, 01 Jul 2024 11:38:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab0bb88sm1474303e87.56.2024.07.01.11.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 11:38:27 -0700 (PDT)
Date: Mon, 1 Jul 2024 21:38:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kapatrala Syed <akapatra@quicinc.com>, 
	Hariram Purushothaman <hariramp@quicinc.com>, cros-qcom-dts-watchers@chromium.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Loic Poulain <loic.poulain@linaro.org>, Andi Shyti <andi.shyti@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	Hariram Purushothaman <quic_hariramp@quicinc.com>, Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
Subject: Re: [PATCH 3/6] arm64: dts: qcom: sc7280: Add IMX577 camera sensor
Message-ID: <uuchyzhj67gjcsj4ijlrefopuhtflenbyb6wjyjkvjg7evavku@6i4z3ac76fwa>
References: <20240629-camss_first_post_linux_next-v1-0-bc798edabc3a@quicinc.com>
 <20240629-camss_first_post_linux_next-v1-3-bc798edabc3a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240629-camss_first_post_linux_next-v1-3-bc798edabc3a@quicinc.com>

On Sat, Jun 29, 2024 at 12:02:37AM GMT, Vikram Sharma wrote:
> Add support for IMX577 camera sensor for SC7280 SoC.

Note, the subject and commit description do not match patch contents.

> 
> Signed-off-by: Hariram Purushothaman <quic_hariramp@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 9ac251fec262..1c99ee09a11a 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -5167,6 +5167,39 @@ cci3_sleep: cci3-sleep-state {
>  				bias-pull-down;
>  			};
>  
> +			cam2_default: cam2-default {
> +				rst {
> +					pins = "gpio78"; /*cam3*/
> +					function = "gpio";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +
> +				mclk {
> +					pins = "gpio67"; /*cam3*/
> +					function = "cam_mclk";
> +					drive-strength = <2>; /*RB5 was 16 and i changed to 2 here*/
> +					bias-disable;
> +				};
> +			};
> +
> +			cam2_suspend: cam2-suspend {
> +				rst {
> +					pins = "gpio78"; /*cam3*/
> +					function = "gpio";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +					output-low;
> +				};
> +
> +				mclk {
> +					pins = "gpio67"; /*cam3*/
> +					function = "cam_mclk";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
>  			dp_hot_plug_det: dp-hot-plug-det-state {
>  				pins = "gpio47";
>  				function = "dp_hot";
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

