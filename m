Return-Path: <linux-media+bounces-31123-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7251AA9E231
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 11:42:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6393317697F
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 09:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567B524C08D;
	Sun, 27 Apr 2025 09:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PmBP1r2b"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E15522A;
	Sun, 27 Apr 2025 09:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745746933; cv=none; b=HaaLMAtdCJ3Wz8ohKeVeu9bmyprcsXiSyWRt0NzEucUD9kiBlJ1PeG78F+U8tBRZmDMARS7VL+7z6FtQ1tfs/e977cVmpiEWBMwPB2R2aswunHeWpqoi9zjuO7CUhE4JOokKIe21qxL1TP/QIg4p5fS4E2EcbxqsQoBZNLE/NJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745746933; c=relaxed/simple;
	bh=WeWv1lTR4Cz6U+a0W5VUhdpVN9hPno3jYJ40Y2Ayd3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=chZCV4PO12w4Y1VJyr0ZRp6PYvVM9Lcp+gJF8NLv939xHgBnAXMulv3XdL7WPpnUfUzCsWZ1KweYcE3wKDcHrh+cY2jL0h77hUiBLjv/ZdoJccBI0F4N5qgQrJgTs+f4ae0X5tLIiPHZEUCYRHl3hthRSIWAScuFhK5CE9V2D6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PmBP1r2b; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb12so5776853a12.1;
        Sun, 27 Apr 2025 02:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745746930; x=1746351730; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sUm2tdGNzQpek/okxRC8Q9aokg5d8ZxiDafgIrXClb8=;
        b=PmBP1r2bogehRqvSzoKqyxAYb3UiKba1EjMe+RBwA4R34pI3ApVXfmDsph54n9lsDY
         qcvsna9yoOllMBC9lQk2OyvD48bw4Pam141WdSkLuhnPsx/fNjqhgfX1CJ0phtKoC8iu
         uOg1NOFIMblWq6ZYmXc7qAT22Ms5wpTz4EYmCwrySthj6aGMHHnLvKjz5YwsCwzc4qbV
         2rL7qU2XPBX2RuXeehlP3pgx0NWkhJA1FoXJWNxg9lW22t4K2llByqQWtPCD8XeStv9G
         KGKcDUwKtn/g/0pr/xPIH8Zf9jDepO88vkrucBx37xHKtZlz/bsV8/1kYqBa9A5Bghen
         bFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745746930; x=1746351730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sUm2tdGNzQpek/okxRC8Q9aokg5d8ZxiDafgIrXClb8=;
        b=dKwh/cxxgBq//2Csi1Utb9bmvlMzWpWIZklAcvR6A1FgBq4eXcE3lj6cfdgLf0++BX
         QSxvbEVbf/gaLKaTMfiWj796YxekblMm7t7K+AkgYb9eX1lYOX+aY0vYmNRIy0YDJajZ
         M4OksE4J4IMkpxSjCCP+XpAKykyUfXBKBX/vNnROk+3bLnLqBlaOeQuqsp00mj0lE7DZ
         oJvZzcVd/ZdWQxAX4FJ3tFQ3zc3hfKMterRsIGCCj29n3rsomOhebaztQwT5vk1K/Uw+
         vu4qqQoHVh2p22pwVtya3PCQ4glEyMuWEAUDZb8oWk9MsaXs9Mu/YQVsz78C3NlITMT4
         Feqg==
X-Forwarded-Encrypted: i=1; AJvYcCV+GJc+qEUX3Ihb0TLXaK/lVGbwyMgcS0w/Tg774ibeRrZGE08TXjvM/pzpvUYp4gBmgJ+kIO9qIyplRvY=@vger.kernel.org, AJvYcCXh8CpOEOew7cs2OvHvTV4HByWm3ADolp0GBrYjZDmcx8CqU1/F7y4hirn/YPPkyY+pTMpfokDo2/FDb0o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs+IErX3omDYKMAM7D8V23566+yxV5Ly4nsJtckoKsfeVBWleA
	lMdK3BKKZv1ha+FQQOPPotWMTITGj+VlU4OOJt3uVYQWh2hbvwI0T4/btvd+OXzbadIgANIgivP
	86qRSDOo6//aYOAdDf4VhTOhFn4ECFprd
X-Gm-Gg: ASbGncsElV1vroZKtgJ0YfWxuCAyusd6xk/ZeFO9vMn9ieAxaGWzPqMQmSvzmJadpOC
	5rZe+edqS7HqGQGx6duvR8Ghs60pSDk2I9GRkCIftqTx1YA1koChfDy37KUO7YL6PyPdGbTFZJE
	zyRzPb/1I+3eB5t/LjX8H3Ww==
X-Google-Smtp-Source: AGHT+IH5jQUnA2B/pG0yjJ+c5eAt/zVMEC83LMjJjQG6jFe/SY+MDyUb2eyQmTSLhmwx6ffbT/H8a0GIEhvgstDGRq0=
X-Received: by 2002:a17:906:c142:b0:acb:baff:fd5f with SMTP id
 a640c23a62f3a-ace8494530bmr414639166b.35.1745746930301; Sun, 27 Apr 2025
 02:42:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250426201508.522222-1-thomas.andreatta2000@gmail.com>
In-Reply-To: <20250426201508.522222-1-thomas.andreatta2000@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 27 Apr 2025 12:41:34 +0300
X-Gm-Features: ATxdqUG21tK6vMaYgL9D6nlj0mgqeWRPn_oEvEJT709RhPKX_ICRJe5ZMWUcYck
Message-ID: <CAHp75Vef0DuupHr9CAaU9qnDEw6O6KRPaO51uzrKXPwvfAiiJA@mail.gmail.com>
Subject: Re: [PATCH 2/2] Staging: media: atomisp: style corrections
To: Thomas Andreatta <thomasandreatta2000@gmail.com>
Cc: andy@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 26, 2025 at 11:15=E2=80=AFPM Thomas Andreatta
<thomasandreatta2000@gmail.com> wrote:
>
> Corrected consistent spacing around '*' and braces positions

Missed period.
And what is the correct spacing and why?

...

>  static unsigned int get_crop_lines_for_bayer_order(const struct
> -       ia_css_stream_config *config);
> +       ia_css_stream_config * config);
>  static unsigned int get_crop_columns_for_bayer_order(const struct
> -       ia_css_stream_config *config);
> +       ia_css_stream_config * config);

No, this makes it the opposite. Please, read Coding Style if it sheds
a light on this. In any case the kernel style is to avoid spacing
between asterisk and name.

--=20
With Best Regards,
Andy Shevchenko

