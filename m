Return-Path: <linux-media+bounces-50329-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4933DD0C6C4
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 23:13:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE244305CD17
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 22:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FDA433064A;
	Fri,  9 Jan 2026 22:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U32wj1li"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BE23033CD
	for <linux-media@vger.kernel.org>; Fri,  9 Jan 2026 22:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767996679; cv=none; b=mwr3Q5BgZS9wqXO+IwYpBEWnoZGQYdECt4+kw3XFegUaLDwTmdNVpB8NZH6rAHDuti5u8BXn2wys6pVtgkpzY7dI42Zc9egK9RPcPjFDbymo5Xy5t4S5G+PBwI0kgiqM5wXNOYe98MNZrzSqrTgNLQXbcYtJMtMLcOohkWr+5wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767996679; c=relaxed/simple;
	bh=R5Do4/w4LV+M4OYcCoPCvYZSX4xUkM8QUdWEFqvuFV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kKADdNAi0ndyChbIiz3ZU6IW7r4+HWagBRdjv6XHARC/o98pUpPYknhuZaQmlHAhAd5FRKA8w/24FsrEDRcjw8s1vHda9f2Nia+jwBPDqSKYFSkRUTUQU/VjUKBkAsizBaGNFh3F7mWJk7RBlwbR1HVwxXVYmz4cDW/dQLQgYpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U32wj1li; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-432755545fcso2751146f8f.1
        for <linux-media@vger.kernel.org>; Fri, 09 Jan 2026 14:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767996676; x=1768601476; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJAnP27Y4Fg6m5YuP6Z5EKo9hS0YnZFZlZA3ta9U+jY=;
        b=U32wj1liBxWRgpyfoMCCN2GMYk0vuuBEZ0Oal6o4CNl8+4QBWpTg3tzby4icFTUVPN
         7dFJaMEGR1nPjchpUKQ3+iVWFhrh5UiyXecJLePL+7lOlcB30Vfzsp33GjOVLKN81zyO
         zez74xiLQsaqxoCdX7OE1amEbWfPXoBNK7+Fbmc9Ck6XEBhzQa59jkz3bwsBcaQZamn3
         6UMjjxwlkLRz2AO709QHwsCH0/Aea4kcn5CTS2V6O/gX2EJXvH3r+LB2T1hzqi9HMMR7
         fZElJYcq0crzSXL/PyQvWWYrJQ67bo0U/ZEqCEBEQ6GkKD7f/WSXpa6lJROlhS491Xd0
         N6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767996676; x=1768601476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yJAnP27Y4Fg6m5YuP6Z5EKo9hS0YnZFZlZA3ta9U+jY=;
        b=VVgX7JvcGZxB5GCeTIy3Yt1GpFhT5bOwlmXO7du9K+UrBlMEdnqMSczfVPgyOQok7+
         EMvHBORTEzOkkbMcIIM/CFokZKNgguponnNBShz5jq/xc8mJnMq3lQg/KhYwqurkKtUI
         UwAntZCmu69AEV+75F84Q5WSWUMc9WLSZ+8/4NRGhOtY7da3UaqdY70rgLBHhMogEHkx
         QA4Ogsk1yAaoTXG8LRelFEZRkBV4xNN6iussnFXV2X6nX8hXpm3SwzA2m5uzI63qwQ53
         YXXMMIG85LxkWMZhQJu0PD4twDkgUKyfVI9T2scdSXcp12QmR9QBe1bP8z2GIPS2m3bN
         n0rA==
X-Forwarded-Encrypted: i=1; AJvYcCVed2ZEJPs49X7iQH7ROibQORpftDs4qfam4jXh00xEk16at3bxRfexnEhQ9+Ttn03YgkNrq/o6n+AsDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwS58vrjNjTsVgm27iyNJ4OO2Bzr8N5qmfcwjCVin40tjFt9lyL
	lB1wLJ0T/2CXDXZaDlDXebxXkDoUfHjid6Bo+xtPx11ktUlayhF47d8dB3D27ybj/2orek5DBk9
	tCfRUzs5tzrP4DJ2zPk9w2PPSp1cCsrA=
X-Gm-Gg: AY/fxX4VtR+xnE+Y0eYQDuzkBEJY9AVXA5cfpZNkY5G976WewNbZsUMVH7m0sJAw/0l
	rGO7VOs1WJqz/sIJMhEAVtO9X+1+JO4Wg1dAoxARXfqi7VuqmjJDq4LFUlIyR9he9Uhf57uyBL9
	A6OHGKj39cgoi2Z/dAFdaUJn8Dn1KJ0yDLSwxoWOssu+rjSD6VXM4fM7L4nL4+FAKYOFG8csNfD
	n/1lsFJHe+Vo5KVyD6IdG40AavSAh3GiXs0f9Mb7PQdKpy918kpSrrraEa21ryGOilyrqIG6R7r
	xp1/7cCB5QrKV9uUMXSFTgiSvNHjukrVXsAVZTJn0leYmAbrBQTswkVvfw==
X-Google-Smtp-Source: AGHT+IEv9F2TE9alvzSAaWWvHAOaOzQkaWEQ73Q6cawx9cBLTLWPaIJAupHAzQr3PBKhgFozn6nbDHkKRuF6Z3FVUo8=
X-Received: by 2002:a05:6000:25c6:b0:431:9b2:61dd with SMTP id
 ffacd0b85a97d-432c374f48dmr14339503f8f.38.1767996676484; Fri, 09 Jan 2026
 14:11:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1767114395.git.tommaso.merciai.xr@bp.renesas.com> <a9eefb0e3bfd7c989fc537fa6caed37f18084215.1767114395.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <a9eefb0e3bfd7c989fc537fa6caed37f18084215.1767114395.git.tommaso.merciai.xr@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 9 Jan 2026 22:10:48 +0000
X-Gm-Features: AZwV_Qg1Zb6okpm8iExAr_5JEcgpUrB_Ww7dFmqug7FTRe7N-V5EDDCfGAHEhBU
Message-ID: <CA+V-a8tmw8QX7T6yo3Zd6PKno=K9BseYRTTT006hWOHYrX2Cvw@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: rzg2l-cru: Drop redundant buffer address clearing
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Hans Verkuil <hverkuil@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Daniel Scally <dan.scally+renesas@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 5:16=E2=80=AFPM Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
>
> Remove the clearing of cru->buf_addr[slot] in rzg3e_cru_irq().
>
> The buffer address is already managed by rzg2l_cru_set_slot_addr(),
> and explicitly setting it to zero here has no effect on the driver
> behavior. Removing this assignment simplifies the code and avoids
> unnecessary operations.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 1 -
>  1 file changed, 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/dri=
vers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 34e74e5796e8..8ae6ef82a0da 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -709,7 +709,6 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
>                         return IRQ_HANDLED;
>
>                 dev_dbg(cru->dev, "Current written slot: %d\n", slot);
> -               cru->buf_addr[slot] =3D 0;
>
>                 /*
>                  * To hand buffers back in a known order to userspace sta=
rt
> --
> 2.43.0
>
>

