Return-Path: <linux-media+bounces-15016-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E127E930F7D
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 10:23:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60C9CB20EA8
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 08:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 133F81849C1;
	Mon, 15 Jul 2024 08:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nk1OY536"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C43B13B294
	for <linux-media@vger.kernel.org>; Mon, 15 Jul 2024 08:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721031771; cv=none; b=YKcA3VZzIrbP1dXIqXc9/LAiHz/+8wx9wmaPNqpTXziSIjdVNkhkVwW/t4pR9YbjS5fxGhWKUDuv7IQYC8BhQIkK+YxeKBukqi6HStc3ZD+0w5jLXoAM72pUBUriOOI2xAaO3YZ5JvJOJIte9HHs/DZYpBM0hXmLy4iyF+R7j+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721031771; c=relaxed/simple;
	bh=L36mM9kQrS9p/p4Y6qIxqqLG5IWaYsdwHYYb7f0HXRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H3RXeMHbtKFkYy3ciIc6IwpnaJthPoWc1xR3Bz2RFOf/dt1/r6wGiT+Ulc7X0DcRfkPl9atck3rTZ4pzcu030FoEEdactinTU5rjR7r5yvgHpL/HObagjT1reumxw5qaATt1LnTYlJl3sfA9aQjCvwAhJI/W8C6xvvXcXcmdJE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nk1OY536; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a6265d3ba8fso443401066b.0
        for <linux-media@vger.kernel.org>; Mon, 15 Jul 2024 01:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721031767; x=1721636567; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UxvuVs2RYdJvTG90vVQNL3KW5LdM1oQjpCuXib7OYPg=;
        b=nk1OY536eQZe0iJ01Z1MpR0ZMF0uTG/YPkX7yboukd+EAapdja/zxtHslTIehXEoKD
         95FNiz+WctiazXvuzzF73WXFELYS8zdXCQndnsqKcmxcPtRXfN89wgBwOBlsFaJ4ApO7
         CbFtrfssCM0mE+1/QoxXzAP/tLYJ42q0Xmya0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721031767; x=1721636567;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UxvuVs2RYdJvTG90vVQNL3KW5LdM1oQjpCuXib7OYPg=;
        b=OiJcpXcEKGtNROh+/YHkSfaW5zmyzQLNGUE3FLUXRIOmitU+5XqnTbftRDKcJ6Rwtj
         RTNhCNWKO8QLGHFXX0gD0i57yLEqNiAbUN45fCFrUuRMdJsHXj4t24Dwl5m/9nZ10XCI
         v7xs0M7f/AHrfIfeiVRjXsp8AwNsdKxu+zeLLbUQN+QF9/g4G7l+QSa9S094fK6Bw5gT
         x8nIy747JZI768wjlXskTJx2qGnBruvaGDmOclU/dgFdE5qaGwRo3xW/L1Hh8ejJX1aP
         K2MpEL/UeCYCCfmGymWIxiu+zbr5jPMpwOaHOTOExWRfcr6OSD16EnkU7zA1ulymo84n
         duBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeKxQe+mpAS8YkKb6tOd3OIyuS0GMeXgwiYGqrjgY1ZpmbvLFwI+ed1Ns4vASRJsSBjiDK13c6Q7jf7RlDEsEZ22KU/GkFQDKBAsA=
X-Gm-Message-State: AOJu0YyVmAQeCrlR0tv5CVxXXW9TFwIQ6icyvtghW6dy+raPQHtlrTPY
	MUDzafu6M/3FuJOZWUtE8oKBOuXffzl0qpnLo3DLYxkUcQ9qwPC+HbUpaAf31hAzlFCMtpyKe3p
	HgA==
X-Google-Smtp-Source: AGHT+IHIgFqXwkCHAs2qP0uR0P0uAK16PPOEU6mEJk/llOsjNpqekpbnDWSsekIx3sVa8McuEpU8iw==
X-Received: by 2002:a17:906:118f:b0:a6c:7181:4ffe with SMTP id a640c23a62f3a-a780b89cae7mr1071105766b.66.1721031767492;
        Mon, 15 Jul 2024 01:22:47 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc820d68sm187607266b.190.2024.07.15.01.22.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 01:22:46 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a7523f0870cso440687266b.3
        for <linux-media@vger.kernel.org>; Mon, 15 Jul 2024 01:22:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWi9eAJTKxbPfeLt36KU7chtvKWTNMtLCE5wIgN0iLGVTayJCkIDUFac3MzO9n3Ou3iKPyo2TKFTaB0ifYKoN3PWkwEVtXcYdblQQ0=
X-Received: by 2002:a17:906:46c9:b0:a77:e2b2:8ec with SMTP id
 a640c23a62f3a-a780b68899dmr1183961966b.3.1721031766301; Mon, 15 Jul 2024
 01:22:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628-gcc5-v1-1-7cd56f04a6a8@chromium.org> <7dbda1952c9e873823d4e6d2a9534f1b3b945c4a.camel@pengutronix.de>
In-Reply-To: <7dbda1952c9e873823d4e6d2a9534f1b3b945c4a.camel@pengutronix.de>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Jul 2024 10:22:34 +0200
X-Gmail-Original-Message-ID: <CANiDSCvfamZjwOohT8ZFOr-m2SB=r-MCsrXGHtkfEkeYyEo2Nw@mail.gmail.com>
Message-ID: <CANiDSCvfamZjwOohT8ZFOr-m2SB=r-MCsrXGHtkfEkeYyEo2Nw@mail.gmail.com>
Subject: Re: [PATCH] media: imx-pxp: Rewrite coeff expression
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"

Hi Philipp


On Mon, 1 Jul 2024 at 11:30, Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> On Fr, 2024-06-28 at 15:11 +0000, Ricardo Ribalda wrote:
> > GCC5 cannot figure out that the expressions are constant, and that
> > triggers a build failure. Rewrite the expressions.
> >
> > The following gcc5 error is workaround:
> >
> >  #define BM_PXP_CSC1_COEF0_YCBCR_MODE 0x80000000
> >                                       ^
> >     BM_PXP_CSC1_COEF0_YCBCR_MODE |
> >     ^
> >  #define BM_PXP_CSC1_COEF0_YCBCR_MODE 0x80000000
> >                                       ^
> >
> > drivers/media/platform/nxp/imx-pxp.c: In function 'pxp_setup_csc':
> > drivers/media/platform/nxp/imx-pxp.h:582:38: error: initializer element is not constant
> > drivers/media/platform/nxp/imx-pxp.c:374:4: note: in expansion of macro 'BM_PXP_CSC1_COEF0_YCBCR_MODE'
> > drivers/media/platform/nxp/imx-pxp.h:582:38: note: (near initialization for 'csc1_coef_bt601_lim[0]')
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Can you elaborate on how this is triggered?

Building the driver with
https://cdn.kernel.org/pub/tools/crosstool/files/bin/x86_64/5.5.0/

It might be easier to repro with:

ribalda@denia:~/work/linux$ podman run --pids-limit=-1 --rm -it -v
.:/workdir  registry.freedesktop.org/linux-media/media-ci/build-ancient
# cd /workdir
# CROSS_COMPILE=x86_64-linux- make allyesconfig
# scripts/config -d MITIGATION_RETPOLINE
# CROSS_COMPILE=x86_64-linux- make olddefconfig
# CROSS_COMPILE=x86_64-linux- make drivers/media/platform/nxp/


>
> At least I couldn't reproduce this by just copy & pasting the
> csc1_coef_bt601_lim initializer and the required macros into gcc 5.4 on
> godbolt.
>
> Can this be fixed by using GENMASK / FIELD_PREP instead?

I was looking to make the change as simple as possible :)

>
> regards
> Philipp



-- 
Ricardo Ribalda

