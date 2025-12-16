Return-Path: <linux-media+bounces-48842-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DE68CCC0A6D
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 03:57:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 062533027A78
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 02:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F2E2F12CF;
	Tue, 16 Dec 2025 02:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GN5v7eVN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7BE244661
	for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 02:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765853852; cv=none; b=cpwRAWDKEM4GUgmmkf9suM4RUZggOAaMWjAGNPZFYkpqfwGrAIVqPL7Dwgw+l3OQRQDOIcTjSyv96DCwEiYjpWy3zYZnvJTA/h1UMWnZ482+5QOCYxbD2sc90p6+HRExwV01no47LR5m/UTi1YARdsSqMdMispIPVF/AKWqoN0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765853852; c=relaxed/simple;
	bh=Z8iRgijXBAJCkmq7ftKDCoWf9fAzuJgGLGIomFyztW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bE1Ea2sjKfiwwxpfpAYibHUUhT0K3XTd5DJUKVu/ECEYabRJoM76WNLcjPKwDVi8aDDFq3rAhwAT5SnuSJyHAw17Hy8aAXkC5hha8YeYMjBOJgTVUXBQx8vbG4TsRzpdpWO53ppZu4KNUHRyqZh7z36QVNaV4wfG1qhyeqk0rwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GN5v7eVN; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2ae24015dc0so2013822eec.1
        for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 18:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765853850; x=1766458650; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8iRgijXBAJCkmq7ftKDCoWf9fAzuJgGLGIomFyztW0=;
        b=GN5v7eVNDocIHXjcf266vI+N4oJKbPBrUFHVk1YKz4nCKX1bnbw//EVInxDNzooqK6
         rl+8j9Atr4smDIyd68Sc/7Dj7RGiZ4CwJTgwGy2CuY9hiVCcKTJWrxa+Binve/AJR4TK
         jXu1Lips0W1w/FnL8qc00L2viDG62+5IiKEkB1wOGYw4SCiO5/RbAeeFzq2S3lLlGZAW
         h25UD2Rye356WS0GKU+wetAbTosCEKD0umpg8ONN6qzY48Kr8iNBjiqsR6RbmH+HB6gO
         SybfJ/SiYT1mRi6DXsVTGh/XB8UTAx0D0kHxH/o5ysR6kad88BfOZCu5IaVILqGJZ7/y
         88qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765853850; x=1766458650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z8iRgijXBAJCkmq7ftKDCoWf9fAzuJgGLGIomFyztW0=;
        b=aISR6Fu1VXw8CDM50hTdsenDnx2IUbta/4JiBpF0xC70ifz5lUacN4+VwIeDlJ5jRM
         +88BeSnOiqUpfNMW98AG35nBWFckwVVGQY3jeBq7p1nnrEVnwVdPH8LXlE8Zr0PF9rEh
         2e7XfEBmGtcTq53S/xN6XbufkjG1aSF/qienJmvIUZQ6R5evGpZ2+ryOBbKOqE6eth1z
         gE+AoNtdDyX28JH3ef593Tfxiy1UZhjz2WkwQyjKmBpZ4xOWe18o9/84PqlVG5yvvFTZ
         VgLtN17bAN96UcIHuwgSZmcZ9j6qBJKM9L3LjdPcLK7lGj+bkO1U/wn/kvJSTccbMPto
         2yAw==
X-Forwarded-Encrypted: i=1; AJvYcCXX7GV5FXQ/LwjsU8EBLGYwjg9F8AiXw76ckBKVq2BKThw8+3LwDF3qcb6n59iLMUAxwHEUHm/fq0dDjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw5yRu41x+wVsoXn2PuJSvRuNZFduQcIfMqKHgCiBs03goobem
	30yIcctMvaNLe7Y5ZNaaPCoV2ApE2YB38I+D/VCTk7gCk9fUCWw7GdMa5K8/QVAN7aMwpYWn64m
	QhDlzsM0or7xMxValtqGAnYGfTpEaiylmd56E
X-Gm-Gg: AY/fxX57NOFDma+DFjIyoDnh/hn+iu4cXcDs8bJst46XPELJtayUZ79FljYKT7b2CWI
	q8Rd5t/PNGqrjubIPP553HFaco6zqkZ09WXXyLVAEzhG5Oskp9K+j3NKA3b90RM6h5lwCblT9om
	/ezLhAE9y6KBUl/pQklFPqKhUVLHsF5CY7FViLDngb9mBqRNOVEzjYSov7NB7mRtMmt7EMqUFkF
	DrNGeqvcHuLb6R9Ckw5BoU/vLvnDojPvXAqj82Tfpf/tvMSCDNDBehQVfMeuvwKGJTEVrblEG6q
	c+8l62x6n7Z6YNkzjs1niSlcNjFOkoqTlwOBXAJS
X-Google-Smtp-Source: AGHT+IEmFIRCB+NAMxFoW7NCu2EFfhycW+AT3HI1Uqn/SsrYT/ucnDyesSfp6Xa10GcXBafzpye3n977T9UkUk+Zy6Q=
X-Received: by 2002:a05:7301:92c:b0:2a4:50c2:a74c with SMTP id
 5a478bee46e88-2ac1c5e0f00mr7467013eec.8.1765853850345; Mon, 15 Dec 2025
 18:57:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120084926.18620-1-opensource206@gmail.com>
 <832f4621-53af-465a-a5e9-f7d65a082481@linuxfoundation.org>
 <CAKPKb8-qyqMmp6c9OnO+AapRRJyE8ygtQUyuUqK8+C0LvMTYTg@mail.gmail.com>
 <CAKPKb8-8ctSewOwBk7fFUMVnb-F_gXnyXS8gd9xJ-fpnW1_ZYA@mail.gmail.com> <b5240bd1-eee7-47fd-be70-88435519b12a@linuxfoundation.org>
In-Reply-To: <b5240bd1-eee7-47fd-be70-88435519b12a@linuxfoundation.org>
From: opensource india <opensource206@gmail.com>
Date: Tue, 16 Dec 2025 08:27:18 +0530
X-Gm-Features: AQt7F2pRUPSU334W5QuvuRUT6OO0P6AaHjMG-_zvKNM_J0-ZzWt6rZppHZNDsZg
Message-ID: <CAKPKb8-VW3C8c-BmwLEWdLXZ8LVuH_MDMdVzzFs6O8QWmpDeuA@mail.gmail.com>
Subject: Re: [PATCH 0/5] media: vimc: add RGB/YUV input entity and improve
 pipeline support
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: kieran.bingham@ideasonboard.com, mchehab@kernel.org, 
	Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 12:40=E2=80=AFAM Shuah Khan <skhan@linuxfoundation.=
org> wrote:

> >>
> >> Hi Kieran and Hans,
> >> can you please review?
> >
> > Hi team, can someone please review?
>
> I will send these up in my pull request to Mauro - it might be
> later in December of early January.
>
> thanks,
> -- Shuah
>

Thank you so much Shuah

