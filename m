Return-Path: <linux-media+bounces-12556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2261E8FC434
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 09:12:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D281A284EC3
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 07:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3438F18C32F;
	Wed,  5 Jun 2024 07:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frame.work header.i=@frame.work header.b="OhYYjzmA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A09C190495
	for <linux-media@vger.kernel.org>; Wed,  5 Jun 2024 07:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717571541; cv=none; b=D8QwrDJijhnqbd3x1g8c7XKuNPBUo9Ig+Ba/BcmKn4zix6awgNF++943lDQUPpxSOuGS+knmJsVpO2TNk9NkCrOruwWzmOY3HyszDs1R0NDX9x4pfjxkTD3To2mNLY5NPnjPM1ieodY4/Mm73TCcZvxvYtO+KQjePAthwQVEF1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717571541; c=relaxed/simple;
	bh=26mtsTLc2/54w7UyobgmLs+Qq6n767mjhQh1DfsmIIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GqkdkzAbL2ifG+wmeC3rV10VvnkHDcOjyo1hTMuoK7p58xbhfKNWioaqDKIREeNaUKIEvR49EvwD6s4WW19WchwIXWr39/uesVh23gpFuoL6NTGzQ8rwTESTDuEO/ySy0Jz/C9QFruuSY5kxXNWg1MMXBA0DFf3eCbta3mls9fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frame.work; spf=pass smtp.mailfrom=frame.work; dkim=pass (2048-bit key) header.d=frame.work header.i=@frame.work header.b=OhYYjzmA; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frame.work
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frame.work
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2c195eb9af3so4968489a91.0
        for <linux-media@vger.kernel.org>; Wed, 05 Jun 2024 00:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frame.work; s=google; t=1717571539; x=1718176339; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26mtsTLc2/54w7UyobgmLs+Qq6n767mjhQh1DfsmIIo=;
        b=OhYYjzmABnyp/uAtFF6DYqeB++s5KNY3AzCEn9qkrDzdmzOPpKAHsLroyYZTCNUuGR
         TI7rnpk5PuJZfLNCPSRe3IQURmJZxMPNM3fazHVtKp7iwyt4h/F+BnLCzwW+YV3iwwtQ
         7ZJ/3K8jFhSSc8KjJc6zMqysG4XMQueFwl5hPRkTz7GaVxw2EzsdthkfT6BC1CSGZpVF
         Ge5L71M7uZg3jjuimtevJERA0OlcYoDgsHcd4atUhpXbhqfDYB1+yBx0pEVwSxVBuVoL
         +b/6WjPdJ5nDL6/0FnA3geJHlTrmas023uEkkjzRGXb8cU+wbbDmjf7DLPP2Y/CAyXrJ
         uwvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717571539; x=1718176339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=26mtsTLc2/54w7UyobgmLs+Qq6n767mjhQh1DfsmIIo=;
        b=JkxFl2fMOmj1HoRIC2VEsQxSbj5PRscy9tV31+e+AuWNpdFS/Oe1ufhy7GB8d/2dvY
         e21zTH3MGRQbgmh8poBwmiW/UE5JQoU5ZKcoaWEWAFIreJkttCr/E4LJuq8+XWVSgfAs
         HVULf0EocOfzW9I6PauVIrpsMWTMBrpdsADGIyjavHn19dptZaGwqvFlpI+fR12S2zpc
         7H92BvUrie9KgfoTBmgtcgH8/JUtFqvzLX0jgTGSVI4uTj2+1Et6w7nUAWPMObGOJp8n
         sYZ3K0TfkvedZvaNyQQ4jhQ2Ej4xQeOQwlMvs5uyjD6AkBqQ508XHniYEw9DXF3u9FgU
         SplA==
X-Gm-Message-State: AOJu0YzDD5dGY1PfdUZ6yvxkuSwXd0YtkXReo74KElFvr4es+5M0st7b
	Fey/lyH6FNnBmOe6vLuv27FQy7QoBO/lL8OA4UujOXVGI7fCeCKH5KorCVTZKlTYJgEniAGMj0a
	F1oAeMwxpl8g5yGy/mkY5LgM0W8dUnyKsm4PB0Q==
X-Google-Smtp-Source: AGHT+IHEC8eN9+FK2Z75e0prlwa8QQR4pJJVr6w/QZeJadS46uJMYPESbh5Zcrb4VQJP4wkXtRwdwJ7uAxkc6DSuXGE=
X-Received: by 2002:a17:90a:db4a:b0:2bd:db8b:ca78 with SMTP id
 98e67ed59e1d1-2c27db55fd6mr1763743a91.33.1717571539458; Wed, 05 Jun 2024
 00:12:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240602065053.36850-1-dhs@frame.work> <CANiDSCuhOhrN3FaCyFeGgnJ8BD_YDU8ZHq8MrXG3icSNN+iiKg@mail.gmail.com>
In-Reply-To: <CANiDSCuhOhrN3FaCyFeGgnJ8BD_YDU8ZHq8MrXG3icSNN+iiKg@mail.gmail.com>
From: Daniel Schaefer <dhs@frame.work>
Date: Wed, 5 Jun 2024 15:12:08 +0800
Message-ID: <CAAjcXz6xW2y2X8686hmGsS0erkZj_+ehBkNzYwtTig5e3cxOOA@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Override default flags
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-media@vger.kernel.org, Edgar Thier <info@edgarthier.net>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Levin <ktl@frame.work>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2024 at 7:50=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.or=
g> wrote:
>
> Hi Daniel
>
> Thanks for the patch. Some minor nits.
>
> Feel free to ignore it if you prefer your style.
>

Sure, that's also a nice way to do it. I'm okay with either one,
whatever the media subsystem maintainers prefer.

