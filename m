Return-Path: <linux-media+bounces-9842-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A430C8AC480
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 08:53:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA835B212B0
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 06:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97817482FA;
	Mon, 22 Apr 2024 06:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V/QMPY33"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4505481CD
	for <linux-media@vger.kernel.org>; Mon, 22 Apr 2024 06:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713768804; cv=none; b=msJJ2q5fAJnmJMBWR0Gzw+VlJfxQyg4G3M+wHZjAffxkxspHNe/6FFlYvRTC2IJhJ2zpghA5apxPk21CLZ328sN4bNk9GZfbJmN/ZxUYJ2+63JfH/dsO5D8BqZQhtLy9WkmXahvs82CE4mm6bbag9otv9cCR+JtZvLaegbhAQK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713768804; c=relaxed/simple;
	bh=WyWHeoU/Ff7umbOe8XQrl/qZdNdvHSjb9SSotewTso8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pXOcguJJ+RPu48gRp6qoCs01UgR/7JK8icVMaSPZkm6HLwaQhsCn4HksiQrmrsi/Zr1egIrd92/AkSgjV0uhSb28Xji9dnJ1OOoLb9tV+ztjLAmlupcjn9F6BQaWAKXXMBmB2C2fKZOSDLC/sKiRwTHmcV0Vu/yQyh656l72Ecc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V/QMPY33; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-36b0ae2b7d7so15957225ab.3
        for <linux-media@vger.kernel.org>; Sun, 21 Apr 2024 23:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713768801; x=1714373601; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dg+W9++cTuSKiuuJU3BmFvsGHmcNsDKvQ8sCokwEeZM=;
        b=V/QMPY33gthdorvf/TLe8mOvKeYu1WDBKkJQsxqw77NFXa321kB7TqCIjxXObMt4av
         GIjjc+H2hy+CT7yPi7+YCN0R0Z65R6OwFjSDl0bYbSIdn1+D7XaJC5m9X0EA9+kP+Iwv
         BFczUZylB2H/67C/bKcerYqHyL8G2PdOOVhd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713768801; x=1714373601;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dg+W9++cTuSKiuuJU3BmFvsGHmcNsDKvQ8sCokwEeZM=;
        b=W0WDEB9MvmAd7cDdpkFEwGcCJ9p6W+arF1IQxZnq+GAQ+EtY5TgBevN4+GVL5PCKcP
         dBLbt7UqcHtzXNUsS6Cgu39IW5Iv/gIfxC+9NAr2hzcJG9/rKWMT5Sk8SIla7sOynJJs
         0Jds1aV5TQ1osi75zDBTVBsPtCFw/mz9uD2hf/nuYFxZbjOcK/ew1cmQfjsiE560uyz7
         SynvTby41xsXq2ATOXLoPU5gHM6T29ONj/a5Nu5/G9pA28QdehblgvvCYvvptEJ3oHYC
         DeGuZigFJMZ5USqJHfnkMmJDWdQ1rarAHCbWQlLWZ5THpNoODYsCDKDS0tn9yhYqHh7C
         FMxA==
X-Forwarded-Encrypted: i=1; AJvYcCWZnUg336+8EI3+Yp/sD0jtYmzcjK6kpaJDaVE6FSchOyacPSmYye95KhAyoMyuFF83DamF490YTt3KNc6WNbVktFkqBBMAUNNhlJY=
X-Gm-Message-State: AOJu0Yy6fl4lktplh0EfOy1gJB4pkLbiqJ52ykTCB4mka0XXtwuzfr3b
	N2JWeJkIfab378tHvJ4ckZ3JKSgz8WsOwwzk0WJqv+gYw05XauV2qdiNSjGrf03+YoBCJLegzwH
	+gQ==
X-Google-Smtp-Source: AGHT+IHKqOwruEQ+7HrhJ5/6sLWEwu565byTFTmu9GwELP7wEvPusc0JFfn5xMPLKaCgPGWHOyOX9w==
X-Received: by 2002:a05:6e02:19ca:b0:369:8f73:ed89 with SMTP id r10-20020a056e0219ca00b003698f73ed89mr12164340ill.2.1713768801578;
        Sun, 21 Apr 2024 23:53:21 -0700 (PDT)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com. [209.85.166.177])
        by smtp.gmail.com with ESMTPSA id q5-20020a92c005000000b0036b194cdea4sm1997469ild.32.2024.04.21.23.53.20
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 23:53:21 -0700 (PDT)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-36b0ae2b7d7so15957205ab.3
        for <linux-media@vger.kernel.org>; Sun, 21 Apr 2024 23:53:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWDxWaq2aUIMP1pYvsPgsW8V2f4QT8Zfac1SEsgAZW7xMj6iNoVST0JjXna/B8xBMEUlW1AWmerh8CID6FgktWVdWaLvbO8Kmr0sWo=
X-Received: by 2002:a0c:ec88:0:b0:69b:1aec:88fb with SMTP id
 u8-20020a0cec88000000b0069b1aec88fbmr9872064qvo.23.1713768779447; Sun, 21 Apr
 2024 23:52:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-6-2119e692309c@chromium.org> <124e35b3-5b0d-4bd7-848a-5c848b339157@linaro.org>
In-Reply-To: <124e35b3-5b0d-4bd7-848a-5c848b339157@linaro.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 22 Apr 2024 14:52:43 +0800
X-Gmail-Original-Message-ID: <CANiDSCt34D8-Ys+DbEQM0SyFdBF4WoV5_+xuuCjVbf22kT0xfw@mail.gmail.com>
Message-ID: <CANiDSCt34D8-Ys+DbEQM0SyFdBF4WoV5_+xuuCjVbf22kT0xfw@mail.gmail.com>
Subject: Re: [PATCH v2 06/26] media: stm32-dcmipp: Remove redundant printk
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Dmitry Osipenko <digetx@gmail.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bryan

Thanks for your review

On Sun, 21 Apr 2024 at 07:15, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 19/04/2024 10:47, Ricardo Ribalda wrote:
> > -     if (irq <= 0) {
> <snip>
> > -             return irq ? irq : -ENXIO;
> > -     }
>
> You're dropping the original intent of the driver author there no ? when
> irq == 0 they want to return -ENXIO.

platform_get_irq() can never return 0.
https://lore.kernel.org/linux-media/cd4aac19-c4cf-4db0-a18c-42f1bf1441a8@moroto.mountain/

Let me add that to the commit message.

Thanks!

>
> ---
> bod



-- 
Ricardo Ribalda

