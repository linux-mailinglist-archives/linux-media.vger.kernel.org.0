Return-Path: <linux-media+bounces-44740-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B182BE3C50
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 15:43:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF66E5E000C
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 13:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAB5332D442;
	Thu, 16 Oct 2025 13:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uUeUqTY3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0FB18A6C4
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 13:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760622202; cv=none; b=UrDp3XU7+sYIB9fbpzcW9rw+ylFB19S7hTK3AyKPT+3ri3nMmjv5FUZRQolIQJWe7r22PO64+8cjiBc/fenCL61fX/ooF9G59Pb4F6XaHrwBNHQySC38SPlu5foCvQ+bHvfBSAxvOc7bMDg+gC3VGHvcc74Si9G3wpM/mdr6rME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760622202; c=relaxed/simple;
	bh=jDp9/QBfldp4RgNCkyVTB+rWmBU/cFzzvTwjjiiKsD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SkI9XqwRB+Q7M7bjo1w46Ut9PDRkcCdGuPo9Oy9ZDKCkppkYtKekRo4nht7Dj+DDLB0qi92BHYUMt8QyU8LZPDkj2OeYaW35Iz+34AK9XtyC92PbvoHfGIpgdLdt3mUkWBg+phiLEJWxwFFcEawBzO7X2AI9qxQkG1fLybyk3bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uUeUqTY3; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-57bd7f0e2daso113304e87.0
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 06:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760622198; x=1761226998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPa1I3Sb/NK9EofjdAp6afiIJMKd5znl9EBjNEXePg8=;
        b=uUeUqTY3M0yVdJekd+rbaKKgBhgIQ/FbtquqJ8k83WXKo07FS3iLkIieZOXgBnYfwt
         FJMYk44HwpdnDZcaiNnUJR6TihDMKRKTWz+nATgR4WHyEsDR42H72kQN9strCDyAne7C
         RmWPKC1mdrIk+2JmHd/F1MiMjFcLPwSq96n2V6oDf+xGSruWsH+3AvqHulpfGalEaJv9
         rKqLAMxABbbzr34e4AVSEAw11rw2JQtJrsW7pQnVNZ4Q4tGuS295DUx0W/o8CeF2Dv6W
         0vPMJ9WCyN2WDeie6X7Oapr68a7iidDrUhrdLEjKbTGHwY4v36rel0G+cOVX0w4fJhFm
         1XuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760622198; x=1761226998;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VPa1I3Sb/NK9EofjdAp6afiIJMKd5znl9EBjNEXePg8=;
        b=Q99Z+cssBz2R2rE8kc0EoK3j2Lb4HVZ1pyrYgQsDSgnpqBvvlegxsxiuggVXPVYxhC
         AK6LFGHjBO5UFry+zCq1uDazfBEbczuiCkU562POubojMXx6/qB5fzKYiabc0Y4H5DQe
         ZIm8npKZVqd8H+jPy5/9HRnTxk2gknb5aRaQINPDV6iIbSUu0A/W7bqVrESOzCAmdQXi
         LqlLl7WuUnyJRHbyeLcYLb7TqHuV15Vd8fxDt4r0Q956pQPt0K6GBPVNtIu02bKeUWnG
         Gz0z4WezG2PB9WZf+xKlbXqpf+gE6Tt6ajS3jOpqoMtKTb9Ap0dvxI0nZEn40dP5zGgX
         hOiA==
X-Gm-Message-State: AOJu0YyrtNuxTsL87r/8ZvBxSl7gYH9dzs3zxLM+GC2cP7IFeJf1+69L
	ggdmkM2wOcqD1tjTRJ7AIfHh4pX6jGgJsIZKtBcLYNHF0mp9ow9ecoS+xkV8HBjJaxI=
X-Gm-Gg: ASbGncv2dIR/u8R2nfHJk3CvsJZc2mO5HSqnyUEmBOhcsCjzK9hZT/7EXuV10Bz0O0Y
	WpiPj+vu3Wg+tdk+GRoeoAnk5PImfte1uld+q2ZJT+Lpoah4ezHj/QJzuWwO9eug2bKLWmEZlMc
	qLhhtN8P2rUDvwrnaPddBLrYVppZpfa1+eAfPdhTlALAYkaYzt8c1Tz9IXNupTY/lSl/embxNHp
	nuJpZegka3qNyUFELsYLDzSYStqBe8rrfnQXoTCYftP2LGemant3EE7n4nQdBdEGyo3espBKVBq
	8GF5/GYGajWoumk82TmpByVjJEJtYuUd9ngqtf7stW3Hz3TG4DPh0Os+UE3zHlP+EOs/xTiJ2cw
	kgxjKvK8boxMYJh7u0Fd7d+1ikQU1DJFLdUzSZwDiyJ98AVNm/NHsGWpAqWsgZIuI09VqSOL+H3
	SysHKZNDR3ey1/Lsj51tRr9/NGZpXJPgY3SEIPsSPAdUG5F/y5PTXnwHsBzKA=
X-Google-Smtp-Source: AGHT+IEsA6UFmX5BTWpr/DOMf7GtkUjTzhwEWEKu2is2k952LHuOq+Rngn7xDEvuu7cdwPIaQxIv2g==
X-Received: by 2002:a05:6512:2347:b0:582:512:f4bd with SMTP id 2adb3069b0e04-591d877125amr3346e87.9.1760622198485;
        Thu, 16 Oct 2025 06:43:18 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881fdfd8sm7032230e87.52.2025.10.16.06.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 06:43:18 -0700 (PDT)
Message-ID: <cf1311b4-4190-4557-a958-55699df495e8@linaro.org>
Date: Thu, 16 Oct 2025 16:43:17 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: qcom: camss: add support for SM6150 camss
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251016-sm6150-camss-v1-0-e7f64ac32370@oss.qualcomm.com>
 <20251016-sm6150-camss-v1-2-e7f64ac32370@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251016-sm6150-camss-v1-2-e7f64ac32370@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/25 13:22, Wenmeng Liu wrote:
> The camera subsystem for SM6150 which is based on Spectra 230.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---

<snip>

>   
> +static const struct camss_subdev_resources csiphy_res_6150[] = {

For the names of resource arrays please use a valid SoC name like it's
been done for x1e80100, here it would be good to have sm6150 suffix.

> +	/* CSIPHY0 */
> +	{
> +		.regulators = { "vdd-csiphy-1p2", "vdd-csiphy-1p8" },
> +		.clock = { "csiphy0", "csiphy0_timer" },
> +		.clock_rate = { { 269333333, 384000000 },
> +				{ 269333333 } },
> +		.reg = { "csiphy0" },
> +		.interrupt = { "csiphy0" },
> +		.csiphy = {

You shall add .id field to all .csiphy structs.

> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},

In general the change looks good, after the fix please feel free
to add a tag from me:

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

