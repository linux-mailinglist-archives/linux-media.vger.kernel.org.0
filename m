Return-Path: <linux-media+bounces-7188-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5089687E519
	for <lists+linux-media@lfdr.de>; Mon, 18 Mar 2024 09:42:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 064381F222D4
	for <lists+linux-media@lfdr.de>; Mon, 18 Mar 2024 08:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30FD28DAE;
	Mon, 18 Mar 2024 08:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="gWzGAQRd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09B225757
	for <linux-media@vger.kernel.org>; Mon, 18 Mar 2024 08:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710751322; cv=none; b=OyRFuIDkhG8GFsss6sMcmZqCJ2TwLhWdszqAvbAMTeHK+vpLJI05wtIqALJ8xFCTsh0PwK3Ou0GpQZHHfv92RzGM2zn8adUI/Hh2J59oQ6J7hLOAWc94eJ8k4eaVkn+pXKplGKQLPBRb3lQ1Ype9QGbICK9ydRPXRnZYd3kcCPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710751322; c=relaxed/simple;
	bh=/Ao+rO9SYdti3VAE+xg23jyg7XXRQAwBbXmqo0PcSys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Un0XFj2DsHK5GuDLH8ZYskR1ZeCal9unuVz8TSCbYmARj9dVRzGDeTQccjGZK6QWzOF2E6IGbJeJT11g3lD0wbY4xY1Nr+bfRghKqBIRP0U4CDmMEKiXlZFapyRDo8olB2sRukGNgcf+7egtCayhW25trUVqOw0w7PvPfLMCW+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=gWzGAQRd; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dcbd1d4904dso3859989276.3
        for <linux-media@vger.kernel.org>; Mon, 18 Mar 2024 01:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1710751319; x=1711356119; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VIYSHAzUIRDojyXoAAjEUNZdKBZsmGjQo4tf8URh/nU=;
        b=gWzGAQRds3KPLEur/AKy97iaStaFYbCPhFa77YwxLX5x5pRyScgPw38g3pkPRKWcNs
         QeHRlakv/Y6IXjTlJ40zQGdrKeCmsd4nwXb/upaPBy1Lufq0Aq59Fmni4jXmN/LClpjY
         xLqU2nV8kppFIi/0SqxJE7091klTmwXQz3+AOfapy8NWk+Z7tKECRFYpcQmvuFmjkgZs
         d5E3nELDFKNyMiDVv2n5eLJXe/VPgllbSOj0xSCK1jUUWwgO4+AbJAjpIEFT30jhEUlV
         bZ9da+uV/kOrTLywy007+LeZbajHzJGfwNQAGuSslC1HjUuNvW16DKTvo4r5KaBYKfWw
         8Ibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710751319; x=1711356119;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VIYSHAzUIRDojyXoAAjEUNZdKBZsmGjQo4tf8URh/nU=;
        b=OuYIWZENYHILBEzrq/PFUgjiIM66LsIATMDoHdRUN4o5p9djsvh3KiC3xjPanfP2Zz
         l+5YfouJBoIF4s2ydTNzOjdofLRj65Z3USFSMhtXryKzr5khOoaEQUH6C55cJMSZI4ua
         aNveQWMoNqTVVF2B3Ths4bYv18jvN7z5UNFpPwKyhSPISVgqypW7KWcS+eqW9zg+3/4t
         IqNMBQA881t7lhDC5UQTVrHOjBxYdrdSn1xlU+pNP9LTMq4OcCeTfs/6F4gD+4uTvpmm
         2qI3lOI0wE28vg4XGlofe4cUV+gkOB19CcT8Sb6kectGlUbUZp3IEan0zC8+pjQ5IEaj
         k5xQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtAQWC6JakQV34G7QkDLuiNY37a4vEDGKyH2rsBzOjRTcU9J6qX6B+55LgJUUl+ATAhf8xzO0s9HE83YaBeau/C9LRDVJRB2ilvrM=
X-Gm-Message-State: AOJu0Yw5w7M3sbr6LbzpCEZGEBKNLfNeJ2vnTq7QtNEBbVNWnUxd534I
	mRkdXzYfaUz3DYYcEeclrhJtMacrpv4OGS7mZWwmtAIAImNkkoh9MJYyQlx/ghfqgMom1syxzl0
	KCzjbuQo6FJL6TKlEmvKl9pRU/b+WYikmxqvW4w==
X-Google-Smtp-Source: AGHT+IF8wwv3ZYqOOUIu6PR6XNV2RjVzHn8LILTUbDnyIninSmaNrCNUbexvDIyHwBt+lTK8AMVnuSEbUvEpBilkN18=
X-Received: by 2002:a5b:a84:0:b0:dc2:4f34:c964 with SMTP id
 h4-20020a5b0a84000000b00dc24f34c964mr9280814ybq.23.1710751318958; Mon, 18 Mar
 2024 01:41:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240315-mc-graph-fix-v1-1-91d59d752614@ideasonboard.com>
In-Reply-To: <20240315-mc-graph-fix-v1-1-91d59d752614@ideasonboard.com>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Mon, 18 Mar 2024 08:41:23 +0000
Message-ID: <CAEmqJPoMmneTZAjJgOMRpd_B_236jh8NU8bpnaK6Odvnd1zcWg@mail.gmail.com>
Subject: Re: [PATCH] media: mc: Fix graph walk in media_pipeline_start
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tomi,

Thank you for this fix.

On Fri, 15 Mar 2024 at 15:13, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> The graph walk tries to follow all links, even if they are not between
> pads. This causes a crash with, e.g. a MEDIA_LNK_FL_ANCILLARY_LINK link.
>
> Fix this by allowing the walk to proceed only for MEDIA_LNK_FL_DATA_LINK
> links.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Fixes: ae219872834a ("media: mc: entity: Rewrite media_pipeline_start()")

I was having problems with the Raspberry Pi Camera v3 module (IMX708 +
DW9817 VCM) that would crash in media_pipeline_start().  This patch
fixes the issue for me, so

Tested-by: Naushir Patuck <naush@raspberrypi.com>

> ---
>  drivers/media/mc/mc-entity.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 543a392f8635..fcafe5c59052 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -627,6 +627,12 @@ static int media_pipeline_explore_next_link(struct media_pipeline *pipe,
>                 return 0;
>         }
>
> +       if ((link->flags & MEDIA_LNK_FL_LINK_TYPE) != MEDIA_LNK_FL_DATA_LINK) {
> +               dev_dbg(walk->mdev->dev,
> +                       "media pipeline: skipping link (not data-link)\n");
> +               return 0;
> +       }
> +
>         /* Get the local pad and remote pad. */
>         if (link->source->entity == pad->entity) {
>                 local = link->source;
>
> ---
> base-commit: e8f897f4afef0031fe618a8e94127a0934896aba
> change-id: 20240315-mc-graph-fix-8a2a245d7346
>
> Best regards,
> --
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>
>

