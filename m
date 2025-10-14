Return-Path: <linux-media+bounces-44340-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BD2BD78E3
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 08:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3ECEF18A7141
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 06:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6915529A31D;
	Tue, 14 Oct 2025 06:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M92qNUA4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F27323817D
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 06:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760423059; cv=none; b=PM7JEUGEYfWp6La4ncnVjuoghG+ek6R0PD3hDwWS4Mp3i2LXMXvlD8eMqMBL+rGEWH0O/pz2Jr4uIWILyl3pWjdbsOzvJZ1iJPkGTS+2C5odsNEyqymX5T8kTxTYwm0wk5/LGK0Jauy0npJyjQTHRO4v1eBE/EwKAg+pIAlNsfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760423059; c=relaxed/simple;
	bh=J5ZWxZ4J6RiHJFUSyjbtH8ixVWhSfftecmXz/5zx52M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CO2joS9BDFwjUv5WRwnZsb0o0xCJNbZ/Gve9zU/QDi2McpTyKCF8Zdv2iYcUW03M+l0rvZFKz+2sv6vdUjab/o7wE/dC5+jbzcc3VwChH027ycf/rIr2enqKU1+J48oXCSPPVjV/9Z7NJYWv+jwpB60DTZeBbuC3vRxhE5Wdjkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M92qNUA4; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-373a1ab2081so47026181fa.3
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 23:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760423056; x=1761027856; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gGRXKutu/443JXYsnpKtjoDYUO54weBZ/DTnPPJ8Gvw=;
        b=M92qNUA4IEqYghDdV924V0+9xslEmTRK5mbZ59o0zZ8LSpQKh7ykzbaZEIAU3ndNvL
         8qF1xexd3OY8e3iHnKwVFR7d32VPcuJ/FgjhoATig1kU/tG18gZZ/6OZI/6PpgXvnNOC
         Vv0s31U8IyFIzGb6JlW12d82+uS8cT+OWnuTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760423056; x=1761027856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gGRXKutu/443JXYsnpKtjoDYUO54weBZ/DTnPPJ8Gvw=;
        b=sG2zVznTpZcKTNNJRGykZ72YaHyU4ZXSRF3Y5votJ8egXe+xeih3yHjZqTZIUz1kTU
         qbutP3IvVcLwEOfDZl8VrPqB34M+mYJPcDbUW9mwPSx8MNHDUCTtaBXgeIPFBZWz+BCY
         PRpJ308eqx07kHa4R9SF3SDWbz8fvxY7x8P6dUb1xoMBsYsetnS5xQf9Q5eu/8P6Uixl
         yLA53mGL7Tg8GX4yOiBan7FJAO8S7ws5G6Cax6zC45JGrZarsfLps2/dLNyJSruxAKUm
         uUjxTR+rGoXtskSbk+cLRe/pt92mPJ30svj20wjB0Y5s92kEAvRJDYHLQJcCa88OYQ2M
         rQdQ==
X-Gm-Message-State: AOJu0Yw15pBx77kGM8RWZCJwGTWjxpZWV0do/EuJcAHObVj0rn9METNj
	Juz31NbryVrFKMWVumg8F/HMhHos8oVPYcDe7zHFKBg6PTDiVqKiHuearPstzemYc15icfpX7B5
	OXE7TqyjQ
X-Gm-Gg: ASbGnctQxCbu12J/CqaYycnFJvSkdFgZ9DdZNeschNMKpuV+p/FVC2Ms1bP0xWy/kcD
	Jlo3nu2tyrW8rqHswAuQb688n8eGTbuYqD8W2rzfAQQvgzAZ/TG4apeXwZuDd9quCryF0sNnZSE
	3pcTnxlhL4NLzxCsAThP01/7JPwkFRfbdpbxKXRmVbDSiOhnlJ6de6MyVOz9m8+PNe8IeQs+NAX
	36zDx8RRAZDkSxLbxKQpZs/XiZninD2cT8qbd4cxh5mcYk5AaklkJH1ePDdQs45sbgOdwu5exr+
	Xn5X+4+9LDvAdsdZY3BB9EohI9MNkazovROUbmssBGNY2FSDSg50Vpttkl8DwF0aoIvKW1W9vBC
	kjeIREMQzYyOxnkEmOoEsyzURXc7mH26DAP7l8o8PknOzFA/GZygTcy3gClJMi3gwFR8TwHEeon
	XcPke+IAODAoz0Sw==
X-Google-Smtp-Source: AGHT+IGj1rex7TPNWtbJ7C3cW/21nyABqcKn4pUUtIGEfRuprHBZWNz9YAmeAecHLOEuNC8I9tV7VA==
X-Received: by 2002:a05:651c:502:b0:376:46ba:864c with SMTP id 38308e7fff4ca-37646ba8d72mr26744721fa.46.1760423055769;
        Mon, 13 Oct 2025 23:24:15 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762e77ca04sm37511941fa.4.2025.10.13.23.24.15
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 23:24:15 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59070c9111eso6062276e87.3
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 23:24:15 -0700 (PDT)
X-Received: by 2002:a05:6512:2205:b0:57b:478b:a924 with SMTP id
 2adb3069b0e04-5906d75f620mr5875981e87.12.1760423054842; Mon, 13 Oct 2025
 23:24:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010030348.it.784-kees@kernel.org> <68ed624c.050a0220.3ba739.64ea@mx.google.com>
 <D1CBCBE2-3A54-410A-B15C-F1C621F9F56B@kernel.org>
In-Reply-To: <D1CBCBE2-3A54-410A-B15C-F1C621F9F56B@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 14 Oct 2025 08:24:00 +0200
X-Gmail-Original-Message-ID: <CANiDSCu6xZAuSF5_M-4BMRc52hbSh_1QfDQqaeGR4iD5fdQjQg@mail.gmail.com>
X-Gm-Features: AS18NWCLpYvV3tYiHthU9gzravKuHuY57f5JGLmV0V1Ocq-sTTkxSoAy_gsF070
Message-ID: <CANiDSCu6xZAuSF5_M-4BMRc52hbSh_1QfDQqaeGR4iD5fdQjQg@mail.gmail.com>
Subject: Re: [v2,0/3] module: Add compile-time check for embedded NUL characters
To: Kees Cook <kees@kernel.org>
Cc: linux-media@vger.kernel.org, 
	Patchwork Integration <patchwork@media-ci.org>
Content-Type: text/plain; charset="UTF-8"

Hi Kees

Thanks for the report.


On Tue, 14 Oct 2025 at 07:41, Kees Cook <kees@kernel.org> wrote:
>
>
>
> On October 13, 2025 1:34:20 PM PDT, Patchwork Integration <patchwork@media-ci.org> wrote:
> >Dear Kees Cook:
> >
> >Thanks for your patches! Unfortunately the Media CI robot detected some
> >issues:
> >
> ># Test static:test-smatch
> >
> >drivers/media/usb/usbtv/usbtv-core.c:157:1: error: bad constant expression
>
> Where can I find what this test actually does?
>
> >For more details, check the full report at:
> >https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/85913402/artifacts/report.htm .
>
> This webserver appears to be misconfigured to send compressed output without the right headers? I can't actually view this URL.

I will follow-up with fdo maintainers to figure out what happened.
there. On the meantime you can use these url that seems to work:
https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/85913402/artifacts/report.txt
https://gitlab.freedesktop.org/linux-media/users/patchwork/-/jobs/85913398

Basically sparse/smatch do not seem to understand the constant.

Thanks!



>
> -Kees
>
> --
> Kees Cook



-- 
Ricardo Ribalda

