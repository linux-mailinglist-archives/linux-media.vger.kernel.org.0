Return-Path: <linux-media+bounces-23074-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 005FF9EB708
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 17:50:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2773C188276F
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 16:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAA1722FE07;
	Tue, 10 Dec 2024 16:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P6SpWtgv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77452153DC
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 16:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733849427; cv=none; b=Z7aloWNaLQ3XANi9g1qKBv1ZCFEAEHmAaKckeP/88TS4MR4c/3h8Jbci4dkFU2VE2AfhQcXrEICmHG4/QTHpT4dMb1qI6f6X6nWRx9GWMkt29JjUL/ToTLMTsNBEYVnmPeh/oLTJwXRcuTQ/nrp6c7uPRtWFZEfn2irHt36rzQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733849427; c=relaxed/simple;
	bh=HsR6u5GkvXD7ULQKj36Umti20DpL+0zqbiGBiz0zkCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SutZLSPcj6+d8oipw0HC8lSZVSPYd5/gFTxvlNmT1/w3Pl2rPihrw+Y/3Hh2QJFtoczhh3sEqq20uo5YLD/7oeC7KYyttTaWE1b4my47Dj/tZQ6HgWTb8bLA/LHcXGX7PgslL5DrnfiRfMOpRqALAuj79lpANXbzEYR8HUuleTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P6SpWtgv; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aa662795ca3so543054066b.1
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 08:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733849424; x=1734454224; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+DqC+MYPAbbx8P8+tjZh10yMabSG3vK45igpyvKpPMU=;
        b=P6SpWtgvXhHKgrUpT+/e4fjpT0O/APs5D5bdJWqnVxZJ6MUrQ/8VvBHtvwwR6ds62t
         JLjImABkpA45cz5Y8mQNsoxanWMXu6xocmp+rX7uYcHi6uryK0tksVWoe5QNBY8lPD2f
         zWuWirUhqHJPBd3FwdAxgOJeTJmstFS0zhN7pgHIzoeZC/p3lPYMKwW1eXS1sXgO8vm7
         j6Ho2Yi20dFXzsI0qxRnQZ2OY3A02eAV1sLImgNy6dWFKEgxAfDFAl63s4ixydIBF5Oj
         cNFkUQK/qTpo6N6FKlMHzmsnXLgefdaS4o+RPQrzAlZ1ChpU9+lI1uFKLEbK/E3z7sEE
         1gjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733849424; x=1734454224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+DqC+MYPAbbx8P8+tjZh10yMabSG3vK45igpyvKpPMU=;
        b=D2GFTjn6qsWH2aLJzww51GoI9rKe+reUnENNov3rAWjbWhWthPidTZsLfpE6c/96vS
         CT94u3gB+zeVMSez2YyMPdRvNz3bPqEHR6Hh/28YZw0Lz8VYW27gzVERmkRZSmF0Xcq/
         CD98wggqrtYKTQGJw3L+asBhmR/ohXINg5YnvWEbljcxbaHXvvyl2/aYAKsf9mYp8yOZ
         liqTQdi1GQgRY7GPOj5RHQ4Zdbc1IyxTlWpVfbNxN7YrG1EsFJcxzyzRNkP1VPArudpv
         ROh4t7rmtpdRl6cBSlLK4UyrV9Lg9OCwzUXl/J1ESdMkEcSrmkpU9XWQcNklwDzUUcm7
         FDAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWklVCcahVwbu9O7dt/VtSWzh+mzMy0hICLdp2i+eIQcjbphTNd60QhEWsV9Xvo/Ge8953z/POj5Llu4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdAFr2+tdlc1umOW+ReSGVvSUD/bFz5fduHY3tVR81Sq+kBBZI
	Z6Jde9wT3X9ltwROODdC2+GUSFkY6BEks4kmTYGR4xSfQXrQgqQhtfA6okzdVnewDB6tgFSpdEh
	EmddxFQ9yaIjLTl76rmYRqJrp4pL16eR2Q+iXPg==
X-Gm-Gg: ASbGncvyejCtVJ6GCJgeEN4iz/ESC8ZJgNtDhpUzhuR1WalSzq44J1FjweBbv1VNqot
	xNRWZy/KcMbblQx3VOO6HkaLYKWpJ7aokbU8=
X-Google-Smtp-Source: AGHT+IH1qOThi05+FQaxtQVOf1BOtPYsAHF4Eo2G34Soq2l2ruTqO8or8v0sP6hLQ+NYFOkce6I3HslaJ3ZMDDi5J3A=
X-Received: by 2002:a17:906:2182:b0:aa6:54df:6abf with SMTP id
 a640c23a62f3a-aa6a01c0fb4mr427827566b.18.1733849424185; Tue, 10 Dec 2024
 08:50:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210-qcom-video-iris-v8-0-42c5403cb1a3@quicinc.com>
In-Reply-To: <20241210-qcom-video-iris-v8-0-42c5403cb1a3@quicinc.com>
From: Stefan Schmidt <stefan.schmidt@linaro.org>
Date: Tue, 10 Dec 2024 17:50:13 +0100
Message-ID: <CAEvtbuviHys9V6Fa7GveUP0mWH4fJf=r_5iLCVh0bbhy8x=H7Q@mail.gmail.com>
Subject: Re: [PATCH v8 00/28] Qualcomm iris video decoder driver
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Jianhua Lu <lujianhua000@gmail.com>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Vedang Nagar <quic_vnagar@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

Hello Dikshita,

On Tue, 10 Dec 2024 at 12:05, Dikshita Agarwal
<quic_dikshita@quicinc.com> wrote:
>
> Note: A harmless onetime error log "Lucid PLL latch failed. Output may
> be unstable!" is seen during bootup.  It doesn't impact any video
> usecase and is currently under discussion.

I also see this coming up on x1e (not surprising, given its basically
SM8550 for this part).
Any chance we can get this fixed? Merging this series and introducing
this error is not very reassuring to use the driver. :-)
Maybe getting the QC clock driver folks involved?

regards
Stefan Schmidt

