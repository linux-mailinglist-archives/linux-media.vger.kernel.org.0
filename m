Return-Path: <linux-media+bounces-23473-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F409F310F
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 14:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A13FE1883CB8
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 13:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55099204F93;
	Mon, 16 Dec 2024 13:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NU1RGrOO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1B51B6D10;
	Mon, 16 Dec 2024 13:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734354054; cv=none; b=uUfC8oDEh4qyKH0UTDY1JrvfPXLfvCWXUKrfHqj/J42/5WQa+zHtjK0Z761PMa/eUyLo/6YoHV1K4pbbSwMOijEGzg2TtSbAKBKxdqo4midOxNdk6giuN5ZY7h1clh/7+Q8C1yn7y1D3cqVW69OnoSZ/Eq2yIrywJD+TctmvKl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734354054; c=relaxed/simple;
	bh=YXTvZR9SdBjMgqkJ+mObfuctc5EgI3M5pPmKYsfxVJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pvzSW2U7O1UyuKbJhhkhloO/6KBtpfUs/qAbZi3t5eQ6QBsHUP8kWGviJ903VLgtlgBUBgTxi6HBLr0hfIxHAPXhjYEvUbzw3tOH7A2f8ien/ONWhvVyv7UqhhrqQoC/OcdD9v82u8tmscOR1YKASIomjOVphFEg1joAEMzfu9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NU1RGrOO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F66FC4CEE2;
	Mon, 16 Dec 2024 13:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734354054;
	bh=YXTvZR9SdBjMgqkJ+mObfuctc5EgI3M5pPmKYsfxVJE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NU1RGrOO+nh+WjtAvZXglFfqFwVqK2uLVRcdZSNGB2PhHxB1OGgaM6ikF/aq2dhbq
	 c+5XizMz2LuImqruhoWEElzMoZKDtHhUbHXKDSPB97t73zu70JlrJZ95h1+DwaMjsf
	 hKydvT17PmN8j0tGwy0J+OaATpwTuIXRnBxPdjgvfXjgkL0Qx/Fh1ODwvyXKkSxxvC
	 4yV0q1HJbXpt/8YEkoqCa2174/ltYbhi9ZA9R/vFswwmoAliOsrOdEs6Imbww3gbOM
	 G6ivZ8cTHPdIFcMMoJzoAPptruqy03rC9EbR4cIwyOcRU2V1cZIk8UjRb/ZE82Szlv
	 Gx9e8uc824fow==
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5187aa2c97dso1211842e0c.2;
        Mon, 16 Dec 2024 05:00:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU/LXwQ1Zat+PoLoeIHDGGMOC3mHxgg1WW5+l/wchkQyhPx3V5LNfcZI4Qh9DgWhbTWW/ziUDcOga7PaAk=@vger.kernel.org, AJvYcCUwdmDMLKGj+WUXcYy9RXc1OutUN3joHrQ2Dl2SspM5sc8/zuStoz2i2IxeILGw/GiIvgqrsIh04HzRhHU=@vger.kernel.org, AJvYcCXhxWilIeaK7WWmvhtFqn8e1xOqmeqIy9wfZCkgspfQBwIC4suX3Lb50pruJlA7D9G/ecED+2IE66yPW0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjqNfwjGp28cl0n5TMhr059KpICR57b3kveiooBjAXEnA+r4w6
	f5u67ne33Y7Q19p7waTVuarEQDIk9d1PmEwvKmBYdJW+jtB+rkkkd+Oz/+VOMDdT1h1qnnOdFsP
	SQv/BJJK6Cs1xqIGhBhJ4l1wOJr4=
X-Google-Smtp-Source: AGHT+IF0NX75zBMHN2+/94hqFgD6YqWH31pTae+DJQdB37SSNbAvnCAkSPbCZVF9hNwaTmj0O1/ATMkX05XGbbCeJJ4=
X-Received: by 2002:a05:6122:2228:b0:518:7eec:be7a with SMTP id
 71dfb90a1353d-518ca3a69b9mr9373102e0c.5.1734354052698; Mon, 16 Dec 2024
 05:00:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241207-imx214-v3-0-ab60af7ee915@apitzsch.eu>
 <20241207-imx214-v3-7-ab60af7ee915@apitzsch.eu> <CAPybu_0Bdc03UrJNO42S1fBTvpuHUUExvkR1ont7VKdw2XBuKg@mail.gmail.com>
 <76b604796a819d30f5b1725fa9b50b96e01e3589.camel@apitzsch.eu>
In-Reply-To: <76b604796a819d30f5b1725fa9b50b96e01e3589.camel@apitzsch.eu>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Mon, 16 Dec 2024 14:00:35 +0100
X-Gmail-Original-Message-ID: <CAPybu_1ebAMrw=Q7M2G7gBNNOCBOR94W6UntdB0xTKo8DAA-fA@mail.gmail.com>
Message-ID: <CAPybu_1ebAMrw=Q7M2G7gBNNOCBOR94W6UntdB0xTKo8DAA-fA@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] media: i2c: imx214: Add vblank and hblank controls
To: =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Vincent Knecht <vincent.knecht@mailoo.org>
Content-Type: text/plain; charset="UTF-8"

> > Is the handler->lock held when we call this function?
>
> I'm not sure how to test this.
>
> > Can you try
> > running the code with lockdep?
>
> /proc/lockdep contains
>
> > 00000000f9299231 FD:   89 BD:    6 +.+.: imx214:901:(&imx214->ctrls)->_lock
>
> (no idea how to interpret this line)
>
> and dmesg doesn't print anything, when changing the vblank value.
>

If dmesg does not complain after using it I am happy.

Thanks! :)

