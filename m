Return-Path: <linux-media+bounces-23708-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 102CC9F68CE
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 15:43:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B57C1898E04
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 14:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B4941F8906;
	Wed, 18 Dec 2024 14:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nC2LltGM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6696C1E008E
	for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 14:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734532729; cv=none; b=Vngq7vc4xg2sE5OyaNbixO5F2ITOOqYhS8Ip5fFKd7hcl72lzCzD5eEYd/AQ6Km3YOt+SGpkykAryVC/vhgf5HIUqEvjs1b3OHVlGrLAH1Jr2Ygnv16hRgQ0Pa24hVlkWNDMJYZsqA1+f4UKNT4GN/QMisYk+Sa4Shrsk+1lBuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734532729; c=relaxed/simple;
	bh=sEhBhw8wRBkd06+vC3YRcJbPoivML6QU2MjSbRUk1JE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MnR+sH/tFZavVSwn/dugXJE/MqX5oKQKH6/jJwE2Y80RsqRCqW/LJQgsJCYjfaZUWCN++EQgZsWC6D7WH6C9Rc97Zhdl6FIk8h4Ng2gAWCguAth4nP/IB0qcolEAmm59QYPrrxjfClRO96qHsbOrhvEav0Nrplz2yA7t0HJ1P6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nC2LltGM; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2166f1e589cso68261325ad.3
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 06:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734532727; x=1735137527; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sEhBhw8wRBkd06+vC3YRcJbPoivML6QU2MjSbRUk1JE=;
        b=nC2LltGMkBWAeWcYsqoKDMgE9wit28OlA3VWXYIjY2jj5dPemgW/sZeHL63s37Tk9V
         MaLdhS88r7gs5r6Y4b5pJMmkwU/1ipk5LcuxSPY7RBwDzppXHQi2C1iyyHSFZVN3MZiV
         nOgWOrV+Ttt9WuQYWJ+do/HG29jSOgvYfwvPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734532727; x=1735137527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sEhBhw8wRBkd06+vC3YRcJbPoivML6QU2MjSbRUk1JE=;
        b=RKpb/PIFUmRThZRqGeay4EC4LW5zA+72zwxf3mTScB6sA7DT7ln2GnIdcOnfRMosuo
         SnTB48kPmBz+kcH0Hd5VVeHEA1tRsAVxO2WTsoHXlKZwO6XhfuqHZ/pAlKTIXwkRdxMD
         kIQNVQT2nTzoFjpB+VDwn2RkGOQ9uEcuDjKLPX3bNH9AVwBdOe+vvjgj7n13ZvV9gEn8
         m/S/ndiQlr8jgrBJp+vm9irdCVyol+pKZfKzw+DRkCeFb4NjmZzey49rNcwUTQm1ptES
         o6PvFV7r9I0F0vKLEo7Pn3LFXT8cNdKwiOtsYwTQyGuZawFY+KDvd7da8d4Fs3lReI/b
         Rahw==
X-Gm-Message-State: AOJu0YwbValU6jczrhUpnJGsaevjJnW8YKkfES0wd9HjVRw3HNmKVVhM
	QC8Gj7FdEtGaG4N3kGgryfD4lzTHyNzUyFKfzfXmUHANZLRvMaD02FUpSLekH2fBNM25QsA34dk
	=
X-Gm-Gg: ASbGncsIjl8h5rFA517xkOoHeBPqxcrVVAH6AAqTPfItmlY0GO61pYpO79IZWG2iWCR
	P7mo1XeZJq8qr9Q1WYtVmYNUMDwcDYlNUzPOl8ivk6nlAfz8HwDZnTqv92TdK5i8GziKNDhp9p/
	7W6P3ywUeZTpMX9XO5e83JGLcTZKsr0WWiKtSKSx56Zo6kXV4OQdj7NZmNpFUHLMD1xfSSTRolu
	Ja6my9QD4TMZpoojTuAmxOSkE1zZuX+3rt8LDfjSnOSPHWr1glZyMK+0tZjaOrccoYC0zU1qoaF
	GDQOXiNisvaZ6QWVs8t+7Zw=
X-Google-Smtp-Source: AGHT+IHkRvNSmwLnZR5nEvSnqJfM5WfL06y8n/o/qjhK2juqC8KzopIOtauKiKjjVT8/WlFU9EtmeQ==
X-Received: by 2002:a17:902:f648:b0:216:48dd:d15c with SMTP id d9443c01a7336-218d7229e58mr39564875ad.27.1734532727219;
        Wed, 18 Dec 2024 06:38:47 -0800 (PST)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com. [209.85.215.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e54062sm74917865ad.124.2024.12.18.06.38.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 06:38:46 -0800 (PST)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7fd4c0220bbso6181475a12.0
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 06:38:46 -0800 (PST)
X-Received: by 2002:a17:90b:6cb:b0:2ee:ee77:2263 with SMTP id
 98e67ed59e1d1-2f2e91a4d0fmr4369025a91.7.1734532725940; Wed, 18 Dec 2024
 06:38:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213-uvc-eaccess-v1-1-62e0b4fcc634@chromium.org>
In-Reply-To: <20241213-uvc-eaccess-v1-1-62e0b4fcc634@chromium.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 18 Dec 2024 15:38:34 +0100
X-Gmail-Original-Message-ID: <CANiDSCvL_C5mgGoXz9zWjJA7fXizM751hjm5jadWsRiymTRYsQ@mail.gmail.com>
X-Gm-Features: AbW1kvb52yj2sbMxM_1uDygLEPKRrSHKKRayDwV2RH2nA3KvtVfgdEKgLrc_hIQ
Message-ID: <CANiDSCvL_C5mgGoXz9zWjJA7fXizM751hjm5jadWsRiymTRYsQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Filter hw errors while enumerating controls
To: Hans Verkuil <hverkuil@xs4all.nl>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Dec 2024 at 12:21, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> To implement VIDIOC_QUERYCTRL, we need to read from the hardware all the
> values that were not cached previously. If that read fails, we used to
> report back the error to the user.
>
> Unfortunately this does not play nice with userspace. When they are
> enumerating the contols, the only expect an error when there are no
> "next" control.
>
> This is probably a corner case, and could be handled in userspace, but
> both v4l2-ctl and yavta fail to enumerate all the controls if we return
> then -EIO during VIDIOC_QUERYCTRL. I suspect that there are tons of
> userspace apps handling this wrongly as well.

Actually it CANNOT be handled in userspace.

If we return anything different than 0, the structure is not copied to
userspace:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/v4l2-core/v4l2-ioctl.c#n2929
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/v4l2-core/v4l2-ioctl.c#n3490

