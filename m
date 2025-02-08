Return-Path: <linux-media+bounces-25836-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 645F3A2D931
	for <lists+linux-media@lfdr.de>; Sat,  8 Feb 2025 23:09:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC75A188781A
	for <lists+linux-media@lfdr.de>; Sat,  8 Feb 2025 22:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B10E244189;
	Sat,  8 Feb 2025 22:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zI+w0ylH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C1F24394A
	for <linux-media@vger.kernel.org>; Sat,  8 Feb 2025 22:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739052570; cv=none; b=gXd1S0Q2jqgnSaa6hkP8+Sh6Bpz0p2NlSYqLvOrLYLculN3clHcsTnxAGr5TLrtpM6M+ODA+QJywIswe18QlYvK8mpNVo3NTLWpQr3ttnZkI4Joi0xwFww7nf3KhGuWy7NU2ad8dvoX0cImOJKYpCGJfIM82PvoYXT4tshfxUN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739052570; c=relaxed/simple;
	bh=nbh0lUP9+B3S+rH9TsK6SuaDCZWSaxFbqXXgX6kTQM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L22jgX6/dLf75oTJl7wK3SjpEMwDJ2T8+2rN2HNpQLfhL5tUbFLHbydbb+1m5aVCj2oxN/s6AcxpV8dHl81IRj8cOc6jAnKkRVbh0Wf2q5AkBy1cXbeIj0XoLpRJ+bci6vNBVSojdd8I8ElTnXoyZK3/+U9UcBUWYFeQRRU5ugw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zI+w0ylH; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5440efe97baso3774994e87.3
        for <linux-media@vger.kernel.org>; Sat, 08 Feb 2025 14:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739052566; x=1739657366; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qTHcKUL0A9GikZYj1YTvr/EhlWV7sWgF6MMVtB1N/9Q=;
        b=zI+w0ylHtIKcWCDf5JCPH4CobNz97bPRa0iCKNK+66ZCfHwvMvA1UZErij8irRaT8U
         zan5Je+57zc0avCroPWKkO0ZSasD9zGLirKy+Fw9PD2HV6K0X8Zq1xqFitPAVN3cV4BN
         TdlpniSciuDd/Jeu3usGaN0fmlaHkahWrISbSV9Zt8XPSJFp5acbJPvIaskWCr988Tpw
         6u1rfkt/km4EYPUqwvY5wDz6q+5pIjW3oqyYAHH7l+V5UqD2mmgI4IczOU1nb/Yz8m1m
         8WFnVqgE+vc9evRQvxxd2pJPeiwa6WStY6YE8zgAXo5Y0exBGP8ExT7TKxabtPrHTTG5
         2sjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739052566; x=1739657366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTHcKUL0A9GikZYj1YTvr/EhlWV7sWgF6MMVtB1N/9Q=;
        b=jVhDFu6Kirzqrf6gSPMQ+HtvnKdcEDSm8bGhsOECiBew29wrDgPnCGLV3MgTOO0498
         gmSv1r3Speq2IeihkLWK/0NAMe7Y0pRwTl65ITSmVTX92L3zhjgyk2JtLM+X96lnp7TZ
         K//Q/uefFDSrtzPXfgjXksTL0err7vgm+HpdFQZvFjXKgk7sNBnzLZWq4VqGAl4FQJJH
         jGddMO1oSBARfqVr1wXEsq+KtpvdvNGJr8KTc98Nn7FxmpyPPa+Z6tpz2yVpGoGssd9a
         u4OYe6OIXHA9hT81R5dI2DafaHHJwxXdL62LHK9OdQr+Cr7GCIfRwr2FacTTtqmtErgJ
         4gaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlKQDJXPn21QWKt/DzPwIDATgsCqWF4bF2Po8a4bxer3Wx6lvOrw0d9yMHNfIvQz0bAmiHqy85Uwqw/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+evrX0jQ+lVrssnp1CPYoyyRFxHibOiwBKhT5oJR/ghK1r5CG
	CxcYbz6KsDCV1EeEMVxfLJmTb6n/b8s0voXtiKcIQagmeuPtTfefwEGtwUwZ19U=
X-Gm-Gg: ASbGncuDY9ICgKj+fZRThp6sKm/B2uSnt7STMzRV7LXu/1Sg84tWa3UFt3fUq6Y5iHz
	962wBlp7lY8bkU0AASvC1TsP6LQZTiaRiFJMmb0GHx8oL3wtDs8hp7KwSXtxb/pQaAKBEKUzFV9
	zdlypnt+O38bSsiswzMlemTBW0W17yexD3cW+Ia8Chpwvc3rA1H/Gbt/CgwsPtcz7f7GRjvVMeF
	6Z/Bh8bZP/03lud8t6BfNdf1B5OtRUO7diSiD/As2CY8vSsVsUFQTi9nmGuikKVUg3EqB0vuUQx
	77Q4TbTxhUmXO0Vz4U57ywyojM/ygsOkJPIPD5Z5oGHwaBaDIukjOddPQ/vkv8wmskNU2kM=
X-Google-Smtp-Source: AGHT+IGUH3UmhIKInMLmECf90pr5INGbeBJEBwOwexzDKJYYzBRhSekRFOt84/bINUn54xlSrNAvSw==
X-Received: by 2002:a05:6512:1247:b0:543:f1a0:9e82 with SMTP id 2adb3069b0e04-54414a96211mr2604148e87.6.1739052565570;
        Sat, 08 Feb 2025 14:09:25 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441053ed99sm830251e87.3.2025.02.08.14.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 14:09:24 -0800 (PST)
Date: Sun, 9 Feb 2025 00:09:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org, 
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl, 
	cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v13 2/2] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
Message-ID: <mn5zxr72jn3qbn6uiqnzg6qf4s4bydjvmvqqxhd4wvrrmtf3ii@hoau7ge4wfk3>
References: <20250208165232.2371889-1-quic_vikramsa@quicinc.com>
 <20250208165232.2371889-3-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250208165232.2371889-3-quic_vikramsa@quicinc.com>

On Sat, Feb 08, 2025 at 10:22:32PM +0530, Vikram Sharma wrote:
> The Vision Mezzanine for the rb3gen2 ships with an imx577 camera sensor.

Qualcomm RB3 Gen 2

> Enable the IMX577 on the vision mezzanine.
> 
> An example media-ctl pipeline for the imx577 is:
> 
> media-ctl --reset
> media-ctl -V '"imx577 '17-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -V '"msm_csiphy3":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csiphy3":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> 
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
> 
> Signed-off-by: Hariram Purushothaman <quic_hariramp@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  4 +
>  .../qcs6490-rb3gen2-vision-mezzanine.dtso     | 89 +++++++++++++++++++
>  2 files changed, 93 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
> 

-- 
With best wishes
Dmitry

