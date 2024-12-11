Return-Path: <linux-media+bounces-23160-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 755C29EC6E6
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 09:18:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB4402824CA
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 08:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60DAC1D8DF9;
	Wed, 11 Dec 2024 08:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IoekGvcc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BAB1D5CFB
	for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 08:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733905112; cv=none; b=AF3kKfNwAd87KvlYFnjC0mDsZktEFR5Yymdp3qeh5RzqmCGaTjY6BQFgm7CECu4Ss/zGfyRgTQgkM6+xAtxZTdaH/q9RJAZBM6lx/SGtcesrtPUda/fxDiwZa7dbwZpTs8pyjxvYmTo4gzQi5LNu5tXKIwhbMIQpD/rR9ZfPCFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733905112; c=relaxed/simple;
	bh=XskHzUQ0wP3xisQAsDVTIVaMiwmap3TuSXWv2UwOOoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dnuEDGWSHWhth9mJAP9OkhfTbHE3PDroMRJXwnUMKaCeYqQkLYtrHNmBWt7J2y04wc9hd98RTkdwkz9uT2nT/E9AV9rLadjnMggcL0xqzXJSIHLDdbphzlVIJ9CWnMDYktF+A/YXWUg97+dNS+pLNRAQv0+LJlRw/r6jjHz3+1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IoekGvcc; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3004028c714so38042041fa.2
        for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 00:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733905108; x=1734509908; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XskHzUQ0wP3xisQAsDVTIVaMiwmap3TuSXWv2UwOOoE=;
        b=IoekGvccNyR3/8I0UHPuhLZecAyr4HJw3FrGwOlZnUyrpVBWhfdQVmXdzzu49yqvat
         1uMWuL6AJP5/rHSQRtmBLqHoP4gdsWWeZX0hoU3V3P71fSlzxMZgUpqiIfkxvkR77BeS
         HB2xqPsWS8TK4jmjivCUlpiXyZ4ZzdD5LuqQ/owoA4WnFLVodhfbCCKM3l9NTxUREITk
         P+r9yEoGDmBSLyznzXbHDdK8AsE9XAVrjfESe+flsVXPOaEqUoLluDMtFzHk2eSi1PX5
         CEl5D7XkONCmF1YX4dvA2bh965GgrnYMeJWeZpPCkJLGaqTSacwNZp2FhgKA2BKqQdu2
         zQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733905108; x=1734509908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XskHzUQ0wP3xisQAsDVTIVaMiwmap3TuSXWv2UwOOoE=;
        b=UI/dxb7BVUlHZh1jZz6BB83yeLK+VniN7LMgqaZKiKcel6OcomDM87ej8I24NKtX6e
         vz6xC4uZQn8/0EYrfgTcnuHzDc5uUg/21KCxA54ATC0lxcHYoW32UdU6RQk9b7NCI58M
         7vUNFKgLJSv8WSisvmP0Uyn6ZZ/AQBeoIhrxxzVdLnUTm1CzdDoV0DDCWw2IOnFB/d7E
         6ZiA7DCJ91saC6PRgVAiHwGBF1DD2sQI5FHuLDWHKqioJWM1yjDmVpIOSldSv2KscDJl
         0dO4lfvjcfH/00+3zpdbdqNmtfJ1B0vokL//ZPSA3Vv0sRThQHRlU3NttI83zreQa3ar
         rCQg==
X-Forwarded-Encrypted: i=1; AJvYcCWdssED2RxyJw2OerKTybtGv6Sk/dUpq0HEXrGI1lynwy0ofe/fhBRPfqUGfqnGYBOEp9zSXiYWIZpbQA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Up9mbd4A6/x4xUfa7k9Kmt78KYCHInk/+Qy8tdu7jEO2mXYG
	dGlwPvLzTW0R3SCRTBCCpEOusQul+As35izE/lrAAfjMc9H1UiQmQOiE/5oyFKrmZYjaaDGeQu2
	OeP+f8t9uvGbzQMOnHCybZTgheqQYKWBbgLZYcw==
X-Gm-Gg: ASbGncuxuRp2SVI+nxJkoHktEpnkFP/cC4eHwOyYn9OooGeXADTvlehyp9i65epijEi
	4ZdcfNJHfdN3xwp7iZaVmVfrRGK5wtbjppNxABo6CB1UG/o6bv9zQo8Ak/taP7/oxpro=
X-Google-Smtp-Source: AGHT+IEyqSnEBMMtZyEj5jF6bo6/CxMQUAS8l/Vem+Q0Tg0zwJltPimb/BXxYNi4dNa8OIsM4j3xdj7bHzlce3zdJRY=
X-Received: by 2002:a2e:bcc6:0:b0:2ff:c95a:a067 with SMTP id
 38308e7fff4ca-30240d08829mr5734311fa.13.1733905108362; Wed, 11 Dec 2024
 00:18:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211-const_dfc_done-v4-0-583cc60329df@quicinc.com> <20241211-const_dfc_done-v4-8-583cc60329df@quicinc.com>
In-Reply-To: <20241211-const_dfc_done-v4-8-583cc60329df@quicinc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 11 Dec 2024 09:18:17 +0100
Message-ID: <CAMRc=MdJuy9ghgLHxbygdHME2EkttZ7zBMJzCis=t94EUMbGiQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/11] gpio: sim: Remove gpio_sim_dev_match_fwnode()
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>, 
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev, 
	linux-sound@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-cxl@vger.kernel.org, 
	linux1394-devel@lists.sourceforge.net, arm-scmi@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-gpio@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-hwmon@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-serial@vger.kernel.org, netdev@vger.kernel.org, 
	Zijun Hu <quic_zijuhu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 1:10=E2=80=AFAM Zijun Hu <zijun_hu@icloud.com> wrot=
e:
>
> From: Zijun Hu <quic_zijuhu@quicinc.com>
>
> gpio_sim_dev_match_fwnode() is a simple wrapper of API
> device_match_fwnode().
>
> Remove the needless wrapper and use the API instead.
>
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

