Return-Path: <linux-media+bounces-9491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 097028A6663
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 10:47:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8CC67B24AB7
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 08:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17BD583CCD;
	Tue, 16 Apr 2024 08:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JOG43zU2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BE4629
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 08:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713257245; cv=none; b=u6KBU0Sck9GtyEEWIUoJqrnbUef3MK0nme3s1ftC0E0uczeV4K6JOAKoGqd6T2zZAM42Q29URwarQSU+UQTYabXva/PHUY5cz/NCsLwpfiX0e32ADCShak7iNQ+KlUAHEAbEnW5X4w/NlkzZLUgVu5axhU1W0o4osOjyU94iMNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713257245; c=relaxed/simple;
	bh=+YjD1kVczgIpZpwc3pkofZBwOBnPI8au9Bf6byXPai8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S8GsZGg/V2eUxjzM6SXQcsUbrIPyDrPRfloqKFtE5GifBsqjFMPV9B04xNnH4tquqxQbgoiBnLMB50D/2p16GrwRsBBwURIMnhs/uWmlfgMD5SDZ858xTnb5sF11m96jLDLSLLedYPQjv4w50FJz0GMdZyUY7udnZNoIiiQRmwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JOG43zU2; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a51ddc783e3so508588566b.0
        for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 01:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713257242; x=1713862042; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NkM0I+aW0wUUvGJQ59wWIPVhiqCpaSf/yczLNzgYK2M=;
        b=JOG43zU2//QNW7OsVbqlbQRAgppXQV937ebODQQXf/hvIQaq/FD1xndX4vRIHMD4O8
         neAsbc9lqzrUzn5TUAmotDaV/Ywhqkpe9LBAwQpofA829aPr5oNQflxOfYhHZN8S/Ad1
         7FYvz0fllkkV4nBN4uCqD+/Tx4GJWAlmHoEQl+66CH61jsBHKj8A7qKsZAsv4Tj0GywP
         ghCgy3pErd6glqQNIrc4sk9rd6d6w+GirqSWQjzj1i4p9NdNzWkB5fevAQcn5WDSKlxk
         hKmkGBl9VJ8kCCX5nD85kMex5mJBMDB53NaYS31NrW6sksWmxs3CZFf/L+V0v1FZl6Wn
         gGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713257242; x=1713862042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NkM0I+aW0wUUvGJQ59wWIPVhiqCpaSf/yczLNzgYK2M=;
        b=qE/cJ+Bd0N2h65AaPBol8HDdXofy7T1H7UuYs18UtEJpi3F1KvpeA6fBKUc/UbKlIv
         /2pCIREjhGBq/Y2OJLd2bZycm5VUCWDDoDlfUEfvWwcz/NeNPlMzWq1KdoOggIobi2Xk
         yqcdxYvdETUUovNHMU3M5ARBUGhLti5LWeJWDdnvUhnRzs05D/jL2jmoGz3VOH72yniW
         Iggzv4nrjZ32W4pMcG7SzDz+EqJFWhyX1XaeWx/lz/VetBurWkAxUNaf6+0N0XXj83Va
         7wc/srnGe8J0MJZBfdcxmRtZC2blKxz/4bztMnYuEJCDpWWwkqnp+1egpxHbre9Eyeo1
         wYMw==
X-Forwarded-Encrypted: i=1; AJvYcCUhJFY/npRlbrMRQBkL+iXheo/EerwYIzgC/RrmnV63e1Zv9Nuj8ARaz6wr30DkWWwGLhvB8zNpa1ChvfaBWqV+3NhBQMfMd9CD/TE=
X-Gm-Message-State: AOJu0Yyen4vbx+rXazTMmmakt/b501wyhNG4t23Cf7hrY7sqtb4SoIhT
	YKJZNCC98wftX7fdXqfDPKFd2bTIE+vac76ys5pdFczfmdyFQW+hhk7zQPyZm0w=
X-Google-Smtp-Source: AGHT+IERiWoYGa51YbGEPmkvByvhia/eckpCcRSCGVJVNIFEmOLsj+qs5GtIOBV8MGWtuu2neCmDeg==
X-Received: by 2002:a17:906:7145:b0:a52:8a8a:59cb with SMTP id z5-20020a170906714500b00a528a8a59cbmr2572423ejj.61.1713257242155;
        Tue, 16 Apr 2024 01:47:22 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id x16-20020a170906135000b00a51a7832a7asm6572111ejb.199.2024.04.16.01.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 01:47:21 -0700 (PDT)
Date: Tue, 16 Apr 2024 11:47:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
	Abylay Ospan <aospan@netup.ru>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Dmitry Osipenko <digetx@gmail.com>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	Oleg Drokin <green@linuxhacker.ru>
Subject: Re: [PATCH 00/35] media: Fix coccinelle warning/errors
Message-ID: <a003494c-a1a9-4fcd-83d8-766a75d6bbb2@moroto.mountain>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>

In my opinion, it's better to just ignore old warnings.

When code is new the warnings are going to be mostly correct.  The
original author is there and knows what the code does.  Someone has
the hardware ready to test any changes.  High value, low burden.

When the code is old only the false positives are left.  No one is
testing the code.  It's low value, high burden.

Plus it puts static checker authors in a difficult place because now
people have to work around our mistakes.  It creates animosity.

Now we have to hold ourselves to a much higher standard for false
positives.  It sounds like I'm complaining and lazy, right?  But Oleg
Drokin has told me previously that I spend too much time trying to
silence false positives instead of working on new code.  He's has a
point which is that actually we have limited amount of time and we have
to make choices about what's the most useful thing we can do.

So what I do and what the zero day bot does is we look at warnings one
time and we re-review old warnings whenever a file is changed.

Kernel developers are very good at addressing static checker warnings
and fixing the real issues...  People sometimes ask me to create a
database of warnings which I have reviewed but the answer is that
anything old can be ignored.  As I write this, I've had a thought that
instead of a database of false positives maybe we should record a
database of real bugs to ensure that the fixes for anything real is
applied.

regards,
dan carpenter


