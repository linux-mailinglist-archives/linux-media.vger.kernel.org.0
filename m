Return-Path: <linux-media+bounces-49655-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 10209CE8881
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 03:15:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A1123016185
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 02:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E889C2D9EFB;
	Tue, 30 Dec 2025 02:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ToMo+OWX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44811A3154
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 02:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767060936; cv=none; b=h0ygJobIkxrmEESjIZc7HGo6GJSU6WpMLuRkKoaqopFykANPXPqXyL4W3EsapGd5RIxO076x2u4b7KPmS+l2Y5AG5OSzgX4WxzeEt1H6UqJwcup7sYUY9ap1jRN1P4R28c451m/jtnuwdNrGTBbxoQ89UuZH4t57p8NbtUG/kxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767060936; c=relaxed/simple;
	bh=ZG4Dy8XbUrlgcEriKWoDsAcny2Cr6dB26N5m5m/1Lhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BgXS6Tof0HsLAu1qMyC/2glKIX9nnkdDgnO2tlOuGZSrEbM43A+6xImaJiJV0OgiY51suvAHtGuYbbvqNJ8mVjx7DB77hCJY3v2Jo9+SbQbtrDjBtbpKFckAvSpzWKI1kEadsS9TGkqOcLtI+HWEFh5eQtsmSk7Uwxg4bO75L/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ToMo+OWX; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-88059c28da1so91935396d6.2
        for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 18:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767060934; x=1767665734; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4CTvsfTuWHAFbMUmkHWBKdKblUj5Rob5/vs3j6ckuD4=;
        b=ToMo+OWXyuLQTD265frTE46FVYqHrdrJlpkvBUr5F6JTtfpdzuMQTW5bsvfSL+jgoF
         AbcG4yc31+D87B1Zaogtd3fUhIRv9fIP1V+BkBavEvN2tlqi4Pt4BhceETHGk56Aacj4
         KaO1UAfCKebzBB6C3KwCVKGA8B9gShmHUJthwXCurOZtmuZRhfVWhtnBE1Yc8AnJL9LO
         n3CyRfxRo1D2Uc0gCdSe4j86Ypc4861AtvLLqfX6+nZD9mq9l0oBav/Xsit2XQ5XNuUp
         5U4Lb9K9hx/nRev0O2fmQcLJ9P4PZM3K2XXiygz26HqUofthsmXuThyeYkm73M3/Fo/r
         u7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767060934; x=1767665734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4CTvsfTuWHAFbMUmkHWBKdKblUj5Rob5/vs3j6ckuD4=;
        b=kkco4jK3ZFPXvDTgauaUxxFf5K8/b8lyRA+bkdZ3ybQPk70qoDl7HLbMKOHDw2BqQY
         6mxWwwR/9hum8/uAvYAD+ehtPYujlwiFsX6qNetIqr08w/L2i6b1XQ1OTmeaz/eMce+5
         Fi5vWLVxbfsERSLJctUaKbC7rJ2aadFAnxMhUPAZrjcJvi9bADidpAg0AOVSOxNmwwNW
         yWGgjzUJ2Rmp1MlLxp0W95fTYCUnpxcU0wBgyC+wVY3XlT2XB1TYOQIzTyxvJScQ/IYZ
         whkZIUUuHrG4A+aTyDLkKbia9CDeJ4TCsjlfcf8KGGS8jwAOZzFidSCvXeIuNdtsVj5L
         qDUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW47wphx28A5ph0Aw+F4DfV/a/wveBkoSapaffRGT5qUX733IC3avc3mnYQ6Lf9Z5aWD9fshX764pKWbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsSiV5qUOtRoqrCI5D9nKsIYuEcPK1tGdwPUAuC1xU5qY4LdlC
	yIFceruFNGR7OwfakP9OVyqYyVnqwSzIuzbm9zR2zQjFnl+Daq9DE/2Ki1jmuQ==
X-Gm-Gg: AY/fxX6wWnYgr5CiowSo86hc9Oc6zYV8NFa64LdP3QW9cXQV+hgkINHJgjeBn0X7Vok
	ENQ2dasgIqha7LnuVnkMDYmlOn/6yRNy5hXC9C5VyKf/l6K4a4BNBs81Qd/hASnJST3II99l5kI
	TImi3uM7druUjQ1Sp0UHtw9+VbNjoqOPIbgdQOllaIKi74TvTu9FPFFYMcIaGAK7jT9aTn5f0ff
	YzAXGBEpJ+qGct0KLsHhifFhahotNOYxacGOgFKpko62nQbD1pA8oOUobBjJm4rNKtu45idWUkz
	sinSU0TWRP9fbUso721eVk+5dvUU8A2WkY96cg9nLuTUeQsOaLmjCvCT6eFn1lfRFxgwJE756wG
	uzFqrnrMNAyVrf7sNVEcyezXZySGcl6AtVi+pk6sdAzd6ySphciopkJ/ouEn2xg+zxpQCzFIY/9
	puRDq2SKDnN5dqpw==
X-Google-Smtp-Source: AGHT+IGPi74lMGY512ih57p+7byf/j2B0jGfqIGMNE2IPmwFreQextf4XtV0o/a+3koK6DFeMX3Esw==
X-Received: by 2002:a05:6214:3206:b0:888:57bd:8c82 with SMTP id 6a1803df08f44-88d7f5b4860mr527175506d6.0.1767060933911;
        Mon, 29 Dec 2025 18:15:33 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d997aeff4sm256934226d6.29.2025.12.29.18.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 18:15:33 -0800 (PST)
Date: Mon, 29 Dec 2025 21:15:52 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v4 2/5] media: i2c: imx355: Support devicetree and power
 management
Message-ID: <aVM12D1NHYQRGSuS@rdacayan>
References: <20251211014846.16602-1-mailingradian@gmail.com>
 <20251211014846.16602-3-mailingradian@gmail.com>
 <98fc4559-11de-43ba-b601-7575cb9d246e@kernel.org>
 <ff9d571a-9b47-4f39-8589-d4c7b190d3bd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff9d571a-9b47-4f39-8589-d4c7b190d3bd@kernel.org>

On Fri, Dec 12, 2025 at 02:45:35AM +0100, Krzysztof Kozlowski wrote:
> On 12/12/2025 02:43, Krzysztof Kozlowski wrote:
> > On 11/12/2025 02:48, Richard Acayan wrote:
> >> +				    imx355->supplies);
> >> +	if (ret) {
> >> +		dev_err(dev, "failed to enable regulators: %d\n", ret);
> >> +		goto error_disable_clocks;
> >> +	}
> >> +
> >> +	usleep_range(5000, 5100);
> >> +	gpiod_set_value_cansleep(imx355->reset_gpio, 1);
> > 
> > So you just keep device in reset state forever :/
> > 
> > Please see other imx sensor drivers how to fix that.

Sorry that the reset sequence is too confusing. The reset sequence will
be changed to GPIO_ACTIVE_LOW.

> I already told you this at v1 and you ignored the problem and never
> responded.
> 
> NAK

Anyway, I'll move you to CC for the series and carry this in the next
revision.

