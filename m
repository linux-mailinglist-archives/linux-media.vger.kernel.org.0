Return-Path: <linux-media+bounces-26520-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2256EA3E2F0
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 18:46:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A2577030AC
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 17:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F137213E6C;
	Thu, 20 Feb 2025 17:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PRqyBaJW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5316821323F;
	Thu, 20 Feb 2025 17:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740072897; cv=none; b=QCCvuBKlWDZVivZsqIIyRLvth3otiaRLpe1Zyzo+QHc2iK8Yw1b3Exf6WLUDfP7u8UNuUC4zkM+1cAh+QunnceuOPrTdNq5uUNfv5uahoPm0cRalgp6dP3uupQ2i+iWvisc7WUK/27ka6NahgPGDTbLvJJ8Z3sDWRsF24Q9YsSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740072897; c=relaxed/simple;
	bh=3j5meLBzlPzoYaZHYVuzGBPkwAKe4KxyEluapquIWYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hLU5gJLkjhlf3SyRBJX0f73JVpDJbWODNifxUwZM4bJ02opxeR50TKojp7daGYcgCZZXvBOSrva2SyQBzAkhj6nJKV7K05gPfpYQn93g/L9NrmINPXiw5FebZpTBHllgXZlSIPSOh3IxVMU9lbIi/JmUzf46fGVrwwnHWzZSDFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PRqyBaJW; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4399deda4bfso8925505e9.0;
        Thu, 20 Feb 2025 09:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740072894; x=1740677694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3j5meLBzlPzoYaZHYVuzGBPkwAKe4KxyEluapquIWYM=;
        b=PRqyBaJWkh3aRkpFd1+gt0nAYuY5VXK3pLsVmcN+akUbBWAqxBEzDFMSzkYhdbGd8n
         4TQSi/Zr8lFkdB2gIwKSKUodhFhb/p25aPHMiSEQHRc/Tns0rYAX24Ca4m5jHN/Jghrr
         uOR9NT24S1vJfAl2ieSEAThsI6OmvHjJHxVhSuyR0AQ6SnX37xEAHoSlAXTyqtfTpjIi
         epajFG+4BD4s60M7UJbmPjafz0P1pABtTyfIxHQSujVDoqFgaQG5d5IJYvtAh3B4OkVZ
         nOz/LvWtcmls4FgbKxCc13kL6lw2th+M90MiV/+cGO5ybYt4u1Kzsco0abji3UaOR1E5
         40KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740072894; x=1740677694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3j5meLBzlPzoYaZHYVuzGBPkwAKe4KxyEluapquIWYM=;
        b=OJbyGdKQiBoYxHSdCbjz0Eznmmga/z/850sMiI8i6XmurIjr1hKtfcFRm+BCzzywLH
         jlx/YZIXsdz5r/G/RSePOzi5RybhlXhmykyicSiPHp77A+21KDdj9XYD/TzvhlMhSL9A
         UkZlF+gTWPnUy51vR7RR00l1mEJtZHh6ItpRCy/+kxjlW3KrBGb7h/wLQwZavEu7jcyd
         QHS5rQc7coCkqXhG5w4THl6zcEIF/nvJTmD4VomItyJ6L4UCPOOtshAbHKSIiJEBD7ZP
         3c3gGgW3wI5pTRTtM2HKVZ10Z1jsWJXub7ZM+kb1SF2Zvy3TlXxB+qiryUMUJzsqdkgs
         hnEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5lfo6z2N7JwrT0YD1vesypqPUy8R85uLhMkyK13/vzvdBEvz8E0IMjiVobZKh7Uc1zQ2Ic8jUW7eoA5o=@vger.kernel.org, AJvYcCXzo7Tz8yge/Q4ZQ3nPERvImiur1MWZ31cM8+eO7FkSpAyRf8/pm/aWmgFCRKGNJUL8h6BQlx0EBCS5IPg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCOrviaQ0VHA8Q7cUNckHp/MwyHYmZhlWmbH6g7AGgVPgugHA5
	Ytw8inccutnprkpqegGnF4lzf3j6oMEEJ4ZlntLCoDTOyqqn/i3K
X-Gm-Gg: ASbGncv9uqiiI5RoCe8Hb9uCnHyO4tUK9O6Lew4MkcN/koXim0A4C69k2JDm3uT2pWj
	CAbdaqMmFtRqJr3R5PKsO1w2Hk1iBokfCDocCHlOShZKkkyDFucpwB7rQ9ARMHV0AbmfnxczBhJ
	UggeBso/OfxodLxwWWPU0hlKAYq3xU+ZnbeYKNfPaM+klX80nYOq0gyKKO5jfyMHWh5a8zGmXSn
	LjzezEGBTCs8nwmb2VSPy3XdQDJBrmFZRNWcd3hgIA8fB8mtgghKqH0TWLrrVvbT9DxnjOpCe+N
	aZATe6LlnkURFP9PkwwkmLF8w5uIVYM+Bm6htG9hfYT9GU8gg6rBA/811ChdwUeTAAI=
X-Google-Smtp-Source: AGHT+IEPmmiKlS/ysPrkAIpR7/izG7EDUAs9G1mfa/hbF+C9JMVOv9VrwAD1oHez+9k3pqPo2/fSbg==
X-Received: by 2002:a05:600c:5493:b0:439:9e8b:228e with SMTP id 5b1f17b1804b1-439ae21cdddmr609075e9.20.1740072894371;
        Thu, 20 Feb 2025 09:34:54 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43987088ecbsm117191125e9.31.2025.02.20.09.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 09:34:53 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/4] media: cedrus: Don't require requests for all codecs
Date: Thu, 20 Feb 2025 18:34:52 +0100
Message-ID: <2235304.C4sosBPzcN@jernej-laptop>
In-Reply-To: <b3ab99a1-2e72-4b7e-8569-f7fe9beb3018@suswa.mountain>
References:
 <20240731164422.206503-1-linkmauve@linkmauve.fr>
 <20240731164422.206503-5-linkmauve@linkmauve.fr>
 <b3ab99a1-2e72-4b7e-8569-f7fe9beb3018@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 31. julij 2024 ob 18:56:15 Srednjeevropski standardni =C4=8Das j=
e Dan Carpenter napisal(a):
> On Wed, Jul 31, 2024 at 06:44:14PM +0200, Emmanuel Gil Peyrot wrote:
> > From: Jernej Skrabec <jernej.skrabec@gmail.com>
> >=20
> > JPEG decoding doesn=E2=80=99t need it currently.
> >=20
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
>=20
> Does this change have an effect on runtime?

Ideally, driver should allow only JPEG format to be used without request ap=
i.
Other codecs still require it (decoding doesn't work properly without it).

Best regards,
Jernej

>=20
> regards,
> dan carpenter
>=20
>=20
>=20





