Return-Path: <linux-media+bounces-24002-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F6A9FADE6
	for <lists+linux-media@lfdr.de>; Mon, 23 Dec 2024 12:50:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A97B418814A0
	for <lists+linux-media@lfdr.de>; Mon, 23 Dec 2024 11:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03CE019AA5A;
	Mon, 23 Dec 2024 11:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LZbRvQnk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D40C259489
	for <linux-media@vger.kernel.org>; Mon, 23 Dec 2024 11:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734954595; cv=none; b=DEKMtUuo5xQoNpvE8MYVagvqkbLNSqh8PxlaE0Stddai3gQ/o6rriitTQkv7y6IKgC0zHnYW3PiNd/oQiFRbn34noi2DU62k2PtUjkkJ+y7rWo0IUGBuZPBB4WaZuwTBv8tys8mwFofEsgG0hiYvqzuZb91B5SQgJOzyDKbwt7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734954595; c=relaxed/simple;
	bh=6Yr21vDWuIkvsuZ47/NFrT8j3E23Ga5mNcpV2WGUrQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FF18gehqN3JCgSRRcAPjBNmrCFjmw8QNDDO/v/eMiBDwDoa+/ua3QFhU7/gHTdxJAuYBkuWsyOQrpEAdfczWc3s6G/TtTLjouT5gmLhMdhBZ9w8s9VNreKokLc4QA/1ge+yOTck4g8y0nIKNOPOYC8zY3ZS3QY2PaUfFRKVh038=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LZbRvQnk; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30033e07ef3so47824751fa.0
        for <linux-media@vger.kernel.org>; Mon, 23 Dec 2024 03:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734954592; x=1735559392; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=81jl/t+cSQKe+ACOcy5lOOjJcqHObJWTUdY8j6yLjT4=;
        b=LZbRvQnkBcIvLFWESdukXqB5GwfJMAXe7IxQN4kSr+tgZvgsn1QABAjIp5urX8koa+
         TyFrV6MUmY3vIZtWyiNjdmsuHsmXvVTw2fqAxtGE2KyJG/ZEuP26dv7NXNPAQYnxe1EC
         mKzqnnXDv5Yo77wOwKCK+2YPKpp6vf5wS0k1+dLPvOr3eOwntkPYMZRpziz2FYq8lCiz
         f1K2nKNT5iMjyrXh8yye7SHJlhNP+zOO0YG6MUOeN1Evc4GRSKtDe+7nx/RqI2iU1IMC
         62NqQWgIr7JuVV6YShK+ODvMy6K3j3ujJNr8gKW7CdeYBXb2I5ZxhjAHraWJCbk88rWw
         2yWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734954592; x=1735559392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81jl/t+cSQKe+ACOcy5lOOjJcqHObJWTUdY8j6yLjT4=;
        b=AqsZJxbNqJfGpjFUyFKl3P45B6SBDV77s/QriKJaXSEnOJVaG38KSEwOVY6q3dHG2q
         hPUhz17RjeWWtd6PiVqDMAS74hNi9lxXw8EBVv53Nbqb7B+XYEPngJWQ6J4U/xYxBJh4
         UeI1+ORwi2kfDtKV9jnK/+w/B0fTeWbp9FTfSe+M4SLo6k3FNjD/+yGPs5WqZRVGUm4T
         S6Q6G58VboENl4cP/gxnR96mU24NVUX3zKdNYfeEyvCpdHRC5BpdqGNZ6MXT+4fr5aIA
         MiMlTqqEcHEItVmFrSEVGYLkoxPbA1En5t+XzZXax87ZQfvEtFLHtjumN5pW7QzcxgFb
         D/WQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjohHsTk5FPAdH9bkza3tqKsOE6MdRyy/8AS+y2smb9FrwvQLKnES8AeEF3penAgtK+sYOyQsZ1TVAkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqS/ga3qL+sYtmG1KG4ISUJmovJ6MTyvIMn66J1rnxyq1AQKwv
	zeUFumCSoawPKlTYCXfIfiCGKuoCkufr1WuJ8uoDqS4gnTXkSNqEATTLAFHeJg4=
X-Gm-Gg: ASbGncvW3EAmSgxnCQCkWRKPpNEIbeYolT5qUhGrCS2yyRTnwz4W5pU89d3aRRuiKY+
	DfI1KKnWJzHrSabr03kLg3Iz/18Cp5kEBLoSdV48X4GO1iaaXO94B8s8s8i/+HX46HfvCTtt9zF
	fMTiMJd5gGIO6zndNSYNRld24C6dslRZnJ8+kGfAjpFSNBHuGSgqf0ltcaTbV+awcFiJMNdk3Mo
	Cu6rjH+536OTyilonsFQGd9Sbb931Nu19cZuqL1d2Wy9XhcO963+wBLmewDJx7p0evMjZZd0UQu
	+hPyePgnc7OHgrrcprEY3lAtqNJRZVt9+lJt
X-Google-Smtp-Source: AGHT+IHOzyQch22bff+q236NuBgW9EAlxYdWMJ7aLs2GLbKmy59AOI0ocsSlLrhAGSQfDmhwjLXuYA==
X-Received: by 2002:a05:651c:4ca:b0:302:1c96:858f with SMTP id 38308e7fff4ca-304583710a9mr38211651fa.12.1734954591742;
        Mon, 23 Dec 2024 03:49:51 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6c5a0sm13023751fa.22.2024.12.23.03.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 03:49:50 -0800 (PST)
Date: Mon, 23 Dec 2024 13:49:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>
Subject: Re: [PATCH v2 1/2] clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for
 video GDSC's
Message-ID: <tvfe4inkpz3zg7k3eo2nqhcujy5weozfroyf4cgftsyrgbutkm@olh7t3qsn4dd>
References: <20241223-switch_gdsc_mode-v2-0-eb5c96aee662@quicinc.com>
 <20241223-switch_gdsc_mode-v2-1-eb5c96aee662@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223-switch_gdsc_mode-v2-1-eb5c96aee662@quicinc.com>

On Mon, Dec 23, 2024 at 02:32:41PM +0530, Renjiang Han wrote:
> From: Taniya Das <quic_tdas@quicinc.com>
> 
> The video driver will be using the newly introduced
> dev_pm_genpd_set_hwmode() API to switch the video GDSC to HW and SW
> control modes at runtime.
> Hence use HW_CTRL_TRIGGER flag instead of HW_CTRL for video GDSC's for
> Qualcomm SoC SC7180, SDM845, SM7150, SM8150 and SM8450.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
>  drivers/clk/qcom/videocc-sc7180.c | 2 +-
>  drivers/clk/qcom/videocc-sdm845.c | 4 ++--
>  drivers/clk/qcom/videocc-sm7150.c | 4 ++--
>  drivers/clk/qcom/videocc-sm8150.c | 4 ++--
>  drivers/clk/qcom/videocc-sm8450.c | 4 ++--
>  5 files changed, 9 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

