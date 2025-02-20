Return-Path: <linux-media+bounces-26521-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE06A3E406
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 19:36:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C96D421AE3
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 18:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CFC7214A72;
	Thu, 20 Feb 2025 18:35:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AC42135B2;
	Thu, 20 Feb 2025 18:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740076528; cv=none; b=KpZUI8s8PWGu+1EbVWzYWly5L9DpOL+egbCwWnDwscV5s8RcOus1JXoubz+4B8/U042ejrgudG48J+7HyopGg1PyxbjnSctcKqODMxjhWZ5dLPg9s7FzSkOfgGQbYb4z0QUvOqlOqsh5SlJ66O2R9QgtPf8S+6KTjRopOhDxAiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740076528; c=relaxed/simple;
	bh=lc4tYVIXad/mhyoDCTa+KlzbPNoPTYdJb9IQsP+eoT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eD+6hNf1I1Vr2Djqf2TgMOr6AjpK9JtwMYNSkwCplt1OwmMFDofKQtpj7yjnP3z0QT8Wxj5EbPlTJEgRvbphBOoudXqobD0diI3XTsCHKwj9MNoVS1Sw3bgF8d5Iyu5m+GFzP1jletqhp4S0a9s7aaGIGgNF2E4Ag7QM1TARWtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso230189166b.1;
        Thu, 20 Feb 2025 10:35:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740076525; x=1740681325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lc4tYVIXad/mhyoDCTa+KlzbPNoPTYdJb9IQsP+eoT4=;
        b=vbdCOB8pUltf8eX8v47uAPz2m5wtf8KF4qIzyMkDBPdPi7GND0HXwBnp75OkBKmZZr
         3iEkScRz5UO9kxDahw9ay1T/nc2rlQa19a8tr+H4iGipCuVPuA2cZIcwsWjma4UFbpiv
         ZCueZqkcewl4Q1bZ9cI0jmw9ICvXDJZiVOof2hjlxGyh0T/RG+Si2oeqhx7m3GWtH3rl
         O44AwKDTI3VYLWpbnIC5kbnEAwlB802WGGzwe3rt0ApFctjOaSCxIZzvu79x7ThfZdFa
         TeK/7x03UT7RAClsTIb2x4mTQ+klJWdO9+WgWXOF4ATBMR6LzHTVUifhtnN6UqkagkFd
         TT8w==
X-Forwarded-Encrypted: i=1; AJvYcCU3oYbU4RykAZlPIMsaDj/87wXHtKqwbZwl1du/NqkZeAGT7u58nZw21JF3HgjKOAvL/zhPy1Gb6mk6Fzc=@vger.kernel.org, AJvYcCX7Yrz+X8TjWn0SKdFoSo5lWMFVaEh5IOitZN+1/vuv+dR76YmVw7ZG/ER/kLT7m9d3TgVgShFPkZ0=@vger.kernel.org, AJvYcCXJ1YYM7xGvNGiZBcMbhgb0PNYr362o2pD3ghus2JFL3OrsW0mcFb/RFRXL4uzgZzLYbMctona0fVHAOCyr@vger.kernel.org
X-Gm-Message-State: AOJu0YxhAypRmDvflbJh8yrLFz4y7uOT8DNXSQ45IaA+OrVEGcxEE859
	UeeOOxkI+PdKItaPzfnID6P4SXY+oVqqoqZkEjInBq4otPblOW27nC8LuRtjjz0=
X-Gm-Gg: ASbGncvEdYnhEfVnjr57c4Us4fbfVmsq3GgWAPs9PZ+a+be34XkunrpjfNobZmLV0nW
	ZPRZlCmB47M05lB2QAiQSH+WkSwHBN9FVP0isi2zOuSzYbwea8e3Q1m4/BdeHHVZBJqliM6YEQN
	hXTy8gDwi1fqO3LOoCTiJVdW7YHBBYrnmW+FDVLHJ5GNxc+KPP1gmDiZjfmolLcu9re1/y/B+Rv
	V+dVtNcpGwttPzL3U6ioQmB/PPYM2W3V2E+wduWA0obd3sWiZ7TiK6Dk1BKJnjMzPA1cp2H98M/
	8hS7ZDov6d09DeR68hNdLxv5654nzln+LRHulschJt7sjw==
X-Google-Smtp-Source: AGHT+IFEsZ/SqsWiam1A06K+ytTms0YzHiGBXLJ8EeD/zXK6eKm+ZBmWIpsOd6rRZ33Gy4Hy75rmbg==
X-Received: by 2002:a17:907:1c07:b0:ab7:f221:f7a0 with SMTP id a640c23a62f3a-abc09bf5687mr40274966b.46.1740076524801;
        Thu, 20 Feb 2025 10:35:24 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53232039sm1500667766b.9.2025.02.20.10.35.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 10:35:22 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abb8d63b447so171753966b.0;
        Thu, 20 Feb 2025 10:35:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVyUFLxsEqnM91oUxQTxNjYAwq24F9x30LwiUMSkLPnr+BwYI3nCw2Wm8eO/N5Juit+cIGEtOwgSpE=@vger.kernel.org, AJvYcCWgmtFeFRRpd8vPFjnzliCE9GaQPUTLaG9GyGn8pjM52na+vWrtfcRsTEWv/oDMBiBRn80MqNFe5RmVivnF@vger.kernel.org, AJvYcCXoMEsYO97/iTMIm0Ah0oNBpkdL/Tg7sEp8N963CGTjoT6y12hPE0j7NJzsuorAWHnES1uhSnx0EdCvbdw=@vger.kernel.org
X-Received: by 2002:a17:907:7845:b0:abb:b322:2c4e with SMTP id
 a640c23a62f3a-abc099b3857mr45311166b.3.1740076521525; Thu, 20 Feb 2025
 10:35:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <716BCB0A-785B-463A-86C2-94BD66D5D22E@live.com> <1EFD4096-FB85-47BB-9952-E014E463DB1B@live.com>
In-Reply-To: <1EFD4096-FB85-47BB-9952-E014E463DB1B@live.com>
From: Neal Gompa <neal@gompa.dev>
Date: Thu, 20 Feb 2025 13:34:44 -0500
X-Gmail-Original-Message-ID: <CAEg-Je8VaMGxztdu9+Uk5dFJeYaru=nFSZhpVczM79GaCYURkw@mail.gmail.com>
X-Gm-Features: AWEUYZmbr-UkiwBE7upLCEsKo9jbPsLOn6oegnKRI3ia0qci58WpHW4Q4ye6O0M
Message-ID: <CAEg-Je8VaMGxztdu9+Uk5dFJeYaru=nFSZhpVczM79GaCYURkw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/tiny: add driver for Apple Touch Bars in x86 Macs
To: Aditya Garg <gargaditya08@live.com>
Cc: "pmladek@suse.com" <pmladek@suse.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, 
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, 
	"linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>, 
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>, "corbet@lwn.net" <corbet@lwn.net>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
	"mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>, 
	"airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "apw@canonical.com" <apw@canonical.com>, 
	"joe@perches.com" <joe@perches.com>, "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>, 
	"lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>, 
	"sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
	"christian.koenig@amd.com" <christian.koenig@amd.com>, "kekrby@gmail.com" <kekrby@gmail.com>, 
	"admin@kodeit.net" <admin@kodeit.net>, Orlando Chamberlain <orlandoch.dev@gmail.com>, 
	"evepolonium@gmail.com" <evepolonium@gmail.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, Hector Martin <marcan@marcan.st>, 
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>, "asahi@lists.linux.dev" <asahi@lists.linux.dev>, 
	Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 11:47=E2=80=AFAM Aditya Garg <gargaditya08@live.com=
> wrote:
>
> From: Kerem Karabay <kekrby@gmail.com>
>
> The Touch Bars found on x86 Macs support two USB configurations: one
> where the device presents itself as a HID keyboard and can display
> predefined sets of keys, and one where the operating system has full
> control over what is displayed.
>
> This commit adds support for the display functionality of the second
> configuration. Functionality for the first configuration has been
> merged in the HID tree.
>
> Note that this driver has only been tested on T2 Macs, and only includes
> the USB device ID for these devices. Testing on T1 Macs would be
> appreciated.
>
> Credit goes to @imbushuo on GitHub for reverse engineering most of the
> protocol.
>

Can we credit them as "Ben (Bingxing) Wang" instead? That's the name
on their GitHub profile.


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

