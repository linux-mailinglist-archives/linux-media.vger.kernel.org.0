Return-Path: <linux-media+bounces-26571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EB3A3F378
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 12:55:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DA6A3BCCB6
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 11:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46BA420A5D1;
	Fri, 21 Feb 2025 11:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="PEwTXyFW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96196202C5D
	for <linux-media@vger.kernel.org>; Fri, 21 Feb 2025 11:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740138913; cv=none; b=bz1Kd9l/g3r+UMAiZf9ynlmX56RU/x10jd6eWj/XnGEZtc868n8sJup52Ht39TuORG0C+7rgQB/9yUYgDFFPSXBPdpliwWKg36tEwf+4FC4SfpshlvhhUrAitHy8y/apDiIzAH3vIfhA4mw8idRERtbPVgd3/HRuUfvnRlYmRPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740138913; c=relaxed/simple;
	bh=o9hQaggU3Tdo3Rs75yT1Fva2Gn/BPjhpQH2KzuyJ2gg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X1tmn3T+lqzg2Zlh6Z9FQ8fWdXQ/dGPw3TMXaoFRzlQp9ov/tjyFJeGV1PXfRiXsCJ5AZNVMQkRTykWxeWp/3BZ1SGglaVWNbO6UewuR3nDjOZS5waWWVMX/BnoJbhrSibCsQEytjx3sbOjFFgAU1+E/9ri3/IP2Y06xu/XzC2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=PEwTXyFW; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30797730cbdso19816181fa.3
        for <linux-media@vger.kernel.org>; Fri, 21 Feb 2025 03:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1740138909; x=1740743709; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3/iRbyF06sKBSuXAXawsdJPOX5Xxar4Ru2tRuKb6D2o=;
        b=PEwTXyFWcoHXeYuZSt6B89z7njQlQ9r6soBg6Axpyt8IaMsdAiV4tja9DltEeEcY9N
         6bCcWqagByNttbz+14oOH6YO4YRQgrCU+6/mtn6Ggk0nJeM0i/sj6zJaZEZQAd8PUTKP
         OG6xYHq0atNlMJ8NfDdAWaDl9VVAkMXcF8MZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740138909; x=1740743709;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3/iRbyF06sKBSuXAXawsdJPOX5Xxar4Ru2tRuKb6D2o=;
        b=OffVzQLbyFGufd8GqZwe3lKYymQ/gIoz3nqoQRuyF+aKCGYWnKfLndxsi3gWeK2eY0
         ipbprkstC/WBtoDxBUlsl7Pbp0oKs1qwVs5P2/plHRXttU/aDWEycq5J8YqRqmVSwEbc
         thxrz05Ud13oCrjkIHR22h9FNDKwY8ZVkeNJuT7vDzcIR/SUNOvysp7ju8dzY/CcKpWM
         roSAo/RGDbnUh1EHp4UvEVSgu0fyRUZZcCnacGpRM8EQSx5082/CYq4avcnKlxVZJWcb
         V8AuR/CffKF5uobzdcjCaGyfZHxJ5XmVrWsuH7tWKhLGNrPDTXnu4sMeqXJvSsHaCZn4
         DSSg==
X-Forwarded-Encrypted: i=1; AJvYcCWuzVNywZaQMwjp26M3G6rK2K5ROhz55tGB2gnD7ZDQrQtMN4G5Qv3YZ3Lhv40taV2glf3S+7txWsVw6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx95IQEVKea/LjtDPf8RV4AURFnsJi59aHFmF53Og8IXm6UdBbL
	N52UxcNAf8JpmyMCeTw+mkvGbJRelbfgdo1upTLrrk3wJ20510oyYShorApOf+jvySHP1p+12u7
	I2ekJHeTivLRrvbHLO1yP/4DTfCF9JNeOs4voug==
X-Gm-Gg: ASbGncvnT/JNjq/P6Cq8klAGIpNH4BPYOOuox+wbKWwlUAunFZD8ATj9oYriJXJjsv/
	YH/gJ11t1EbTn6oPzRwo6CEtE8YOy/nJ3iBuZGnlpHfxMc/KwtFbjQ2TMhOULNkV3nDwa6kCCTY
	saKvgv4d4=
X-Google-Smtp-Source: AGHT+IGq/dIo+A2JknCfxBPtCWEXSb1e8s5WLFM0DZHAgz+xRkivavGxrBcVWQ1kfkiIjnKC8wn9G/O8JUziZ5NiZwc=
X-Received: by 2002:a2e:9b97:0:b0:308:db61:34cf with SMTP id
 38308e7fff4ca-30a59899cafmr8679651fa.14.1740138908700; Fri, 21 Feb 2025
 03:55:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com> <98289BC4-D5E1-41B8-AC89-632DBD2C2789@live.com>
In-Reply-To: <98289BC4-D5E1-41B8-AC89-632DBD2C2789@live.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Date: Fri, 21 Feb 2025 12:54:57 +0100
X-Gm-Features: AWEUYZkag0YCbmK4501eSholWPOVfmEf5FjMGyae-nYt_GMpw1QMs3yS9iwYbxw
Message-ID: <CAKwiHFi_nngthth0wZkaPviVeS+8SWDtTw6gJcDAHCqiwXAG2A@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
To: Aditya Garg <gargaditya08@live.com>
Cc: "pmladek@suse.com" <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, 
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
	"mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>, 
	"airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
	Andrew Morton <akpm@linux-foundation.org>, "apw@canonical.com" <apw@canonical.com>, 
	"joe@perches.com" <joe@perches.com>, "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>, 
	"lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>, 
	"sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
	"christian.koenig@amd.com" <christian.koenig@amd.com>, Kerem Karabay <kekrby@gmail.com>, 
	Aun-Ali Zaidi <admin@kodeit.net>, Orlando Chamberlain <orlandoch.dev@gmail.com>, 
	Atharva Tiwari <evepolonium@gmail.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, Hector Martin <marcan@marcan.st>, 
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>, Asahi Linux Mailing List <asahi@lists.linux.dev>, 
	Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Feb 2025 at 12:37, Aditya Garg <gargaditya08@live.com> wrote:
>
> From: Hector Martin <marcan@marcan.st>
>
> %p4cc is designed for DRM/V4L2 FOURCCs with their specific quirks, but
> it's useful to be able to print generic 4-character codes formatted as
> an integer. Extend it to add format specifiers for printing generic
> 32-bit FOURCCs with various endian semantics:
>
> %p4ch   Host-endian
> %p4cl   Little-endian
> %p4cb   Big-endian
> %p4cr   Reverse-endian
>
> The endianness determines how bytes are interpreted as a u32, and the
> FOURCC is then always printed MSByte-first (this is the opposite of
> V4L/DRM FOURCCs). This covers most practical cases, e.g. %p4cr would
> allow printing LSByte-first FOURCCs stored in host endian order
> (other than the hex form being in character order, not the integer
> value).
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Aditya Garg <gargaditya08@live.com>

Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>

