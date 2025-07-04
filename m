Return-Path: <linux-media+bounces-36793-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3F4AF8B12
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 10:19:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25B387ADF89
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 08:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1CF9328AE4;
	Fri,  4 Jul 2025 08:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JsYe9ptU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE02E1DC07D
	for <linux-media@vger.kernel.org>; Fri,  4 Jul 2025 08:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751616082; cv=none; b=QeAiSFC9rTEjKyMJ8NOOd6bLCwUcCNFQaHJWAsAg9CU/H4JEHNHnsPfQvF4/aOCdydKukaDag6F8wFA0h0EmSvEyfIDYZAf43p++YDOyw6eBEW5/GN8sX+bsifl7Vhw8CD5s0DJiatxj3kSg2rAv27bRizbhrdppVUTCw9RiZBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751616082; c=relaxed/simple;
	bh=W5hy85hwlDseVRTu07tUllVYOTsjRbqVRAcm6Mv7UyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uhflxN/BWfI1esaOQaT1+6Wacz75nlswH5GNFa9GWBTgTb0Z++kOPCSvMz8y482y5zvgfOdSatsqFMP5PAJZypIOnONWaI9zX6dJt3Fgudq83JaDV8dXTFn71Cxbft8ukMDmY37n0s5axf2balv8heoEuA8lZ2oesOy1B1BcMoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JsYe9ptU; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5551a770828so686695e87.1
        for <linux-media@vger.kernel.org>; Fri, 04 Jul 2025 01:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751616077; x=1752220877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5hy85hwlDseVRTu07tUllVYOTsjRbqVRAcm6Mv7UyA=;
        b=JsYe9ptUbRq6ygTfZJ8qav+YgV6KfWWlDestKyxznjWfjFfBiF9FWut1LEiCmE4zNs
         bWCMcPoiFmzvQVT5uw8Gl0sLHU5avS7iCPu2qQheKSZFuQi0J3E+Cerssto2XrXAWaDN
         m0guWsEP08rtH53zQxzWaakfuUy5ZwGRAzdgNM5fMlmF0l/WyWGUdqqttagbWVXEb/7U
         TfaAzKbmhmSHZEJS6c2GKTIRfaGQ5pgggLhQtEctSEFSbALnaiWrSZswpNGvD34aDMaQ
         DG2IqwRes2t+rP9nyAT3DEcynYE82IjmRdLXErjKz6hJGAuLV8t9VXBEoIUncbYX3UjX
         Xtug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751616077; x=1752220877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5hy85hwlDseVRTu07tUllVYOTsjRbqVRAcm6Mv7UyA=;
        b=nZFj2K+eH/n34DV8Vtlg01aQw9zQAOyuHwQga2zmLpE5x+gTm7jFBYBENIAh2laI32
         fdpFMrxhB2RxsJBHw1d1DqDnhDrSU7s+2WS9pTBhbAf1/nE1JFrlolw/4NsL0IN2WjBh
         wLCiyqxcSIVGutra2X3s9Q3rsQaqubirlrpVlQwVei3K7RYKHkpy+PA9cZ+wZ8vNDDYJ
         Us8dZryQSZQOykUAeUKYYzdM85M32neFQDcjbXbSJrRf1DilJk9tT/JpdxsJVV2RdVUn
         hGu4VgLBTxwrqvEYhqmRsx9CxIAEcoRjYGXTObBXfw93uJH5wDCRy93HbEjeWQc3moWk
         /k/A==
X-Gm-Message-State: AOJu0Ywpk4NVA72haX4+C3cvg+k9QMgVWItk1VMwdfakHuLHy5EyFZ9L
	t4v/SAbSbU5mNTGH5r7Os/fpxrMOY674VN51HctJubfN8dxsOrSGKvURR4cXpv8iunYZkM3jzhL
	+5y/xGe2JAtYe++2gDY0CJ7oH9xgAx+g5vx+cjXTuaw==
X-Gm-Gg: ASbGnct6baTorUJ0fW0xKk6druLKrlmC7IflZf8VltzkwFWbsQowNdRK/nMkD7UJenW
	VFC0AjdfGcqvTeDz59NBqB8A0r3v0qdPI0F8YykINZUotWOIhmy+r2v9B59THHkd3z41X2PAoYA
	rxIFgpii0DXhVJBE/JgIzXxx9Gm+RwjWAHRkLyMlsdAIc=
X-Google-Smtp-Source: AGHT+IE/4XahMx0H5K8e3G6kGLPvEJmDNT+z5yGiSFu4fWzVouleMPU8+EMqNIa7ZAvHuQVSQceFfXnXHQe0peqw8UY=
X-Received: by 2002:a05:6512:b26:b0:553:36b7:7b14 with SMTP id
 2adb3069b0e04-556f1f62c4amr441161e87.37.1751616076829; Fri, 04 Jul 2025
 01:01:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701201124.812882-1-paulk@sys-base.io> <20250701201124.812882-2-paulk@sys-base.io>
In-Reply-To: <20250701201124.812882-2-paulk@sys-base.io>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 10:01:04 +0200
X-Gm-Features: Ac12FXztT7uc15QsZMvB3fPDcO72_tN7xc565ddgY25DgxMR-aqghVzmCalro_g
Message-ID: <CACRpkdanKtZBkH90yAOjm2+7+dcNri+j7wV5AFL7NHSXHi+bSQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: v3s: Fix wrong comment about UART2 pinmux
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, 
	Yong Deng <yong.deng@magewell.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Icenowy Zheng <icenowy@aosc.xyz>, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 10:13=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:

> The original comment doesn't match the pin attribution, probably due
> to a hasty copy/paste.
>
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

This patch 1/5 applied to the pin control tree.

Yours,
Linus Walleij

