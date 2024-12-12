Return-Path: <linux-media+bounces-23341-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9779EF0E4
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 17:33:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E78F1897A9E
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 16:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F95237FCC;
	Thu, 12 Dec 2024 16:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UaBslxOg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82191217F40;
	Thu, 12 Dec 2024 16:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734019853; cv=none; b=YLSwv7T1DCWXhou138dvrdOMu8njJO1KUqb5Au2TJyoWsn587v0sLH7cXE67WQoFFuD4Girdcqks6/qmCHqsQGe+9lDeIlKzheN8jhR7cfW8A+7A6glWNWh2Rm+6ruQvW/GgabF3/RChKRpLrHSgH7lxW/3KkeX82vHlKFIjyOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734019853; c=relaxed/simple;
	bh=E8TTZbAWIR0jzsOWYV1xtJIvxfZDCTwBmvcEuKREfKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IevxCDKHBrDOToyek4tzfamk1sSSyaEj7lfohP2x5Sa9AujSJykS9xHLbdjehVaHFSV7fUZ1CznJOEeC8ajCKY5Cwq5HtnMhvq6htzYWQGDSnhEu/XiaTLiaQ845AKMLW4DCyFJUgYnz4lmnMNCmPsE5cmcHPeDOPWzReOqN9tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UaBslxOg; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ffa49f623cso7970841fa.1;
        Thu, 12 Dec 2024 08:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734019849; x=1734624649; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYUSJr9oHr+FftcJrfxtweePljXVaDj/rdTt+vSgojY=;
        b=UaBslxOgUbr1jKNerH201d3BZKEk2thJH4o6uyTqp2zi1K9InGOdq0P6F/SuvCoWgO
         Hs6afVMmtWbzE17q/8esEt5iRLd/e+923Cb0dvOj9H5G00ohVjI4ojKHFp+a8omaLm74
         10cLiXJ4CfXEGE2pJ6XKpVcoNkEc10kP+Rd+FEut/8pF0jvXBvfVBKQuyiJ0Dp4ZH4/c
         CPHdPyXyqW58HgThXpyYeSUR3C0fphmnRHVxSPEjVKF0Pzf7Qk+nxYxvj67XARo2A6Vn
         SOVe81b9ZWeAmNE4aeVE/llLZ9C/mzIti0Vd0grAsKqC/pWF2Iy+X19Ee33Y9tPmP/7g
         hSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734019849; x=1734624649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYUSJr9oHr+FftcJrfxtweePljXVaDj/rdTt+vSgojY=;
        b=dUiWL1ScpnJ76j53A27sKOPsZurUvpoybCdpb6Ti+IaoTjUaZRG34s4pcxotlSbeZp
         jVVy5/xBzaAt5dfNXUfUFzyGx0tlPZz5J8zaxClS/hoYKDAGoX5LbThGhJz7nsQH6MVO
         +XI/65KnW6fZC/Tj2xfWOaE1ryIgSa4Di13ei4Am7SAJmeX1GenYMqQmWybigOm0MwLG
         wo6l+DDQqMwFo3u7vSk83LgvIOzs9mxSJ/BDA7dMUgCOgUm7gS7QEP/O5hL79GrLKwb7
         q6qRhFeekXc4puzP+ZZYyqM0QPRlqAao68i0gDpvkg5vay1eWrTx6RnSgoDKIrXT2TlN
         nhtA==
X-Forwarded-Encrypted: i=1; AJvYcCWBEb/OnHu1yRKdUYuxMOUFRPk9jLprUHAzXnT/SmtMdfrvSCdwrHOqK/DRUD+nKJss5q2EmqgI1mBbrRc=@vger.kernel.org, AJvYcCX1nelNfkWFTrekimUO8f0NQL+RE07prbDI3SPxb+LLZ4ifXN1XRIF9P4TKh2CsABA4ldAEoFyBOb3N/qk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQzCT6rg34yQ/fwRu+sgGDIHsaXT29vOg/6d2sVwka8IX90QzN
	fDrir7Gk7D3dlsgUoCsjFe0rRE1W6H4CVFkpvAhEZu0N2qCbDtwoVeIRrst1cuSUSuKZyGhDV7m
	Ngjq6Z1bl521VbwvupNqMhLEXzTk=
X-Gm-Gg: ASbGncs7HN+Q29L6vDWifUI/v03W9BwqozpISbukhAqwNYWrfXcVE8jYEJe6Uh79+Lh
	FFzY8jzo65G9B8AmUf0VCmsx8eQxl3tcVWqX1Er7lUcyO79xb9Lb7tnCvtw6Nzso8xyr2EQ==
X-Google-Smtp-Source: AGHT+IEfxOaxJF02cqCb3o+35QthKCmm4+8U0/gTtwd0T+FvVSHeVgyOje6efKWJI1tAN9KX489WrZ5iZFjUW8eIxGo=
X-Received: by 2002:a05:651c:2226:b0:300:39eb:1aae with SMTP id
 38308e7fff4ca-30251e30b03mr3100551fa.24.1734019849270; Thu, 12 Dec 2024
 08:10:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <01020193bb8a24ad-99eafebb-3b0b-40c0-9b28-3a0dbc84327a-000000@eu-west-1.amazonses.com>
In-Reply-To: <01020193bb8a24ad-99eafebb-3b0b-40c0-9b28-3a0dbc84327a-000000@eu-west-1.amazonses.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 12 Dec 2024 13:10:38 -0300
Message-ID: <CAOMZO5DgW3YrpMJPCTzQ-LZCopB4tNPoJhyFQrr6RBvbnBu4VA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] media: verisilicon: fix reference padding issue
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 12, 2024 at 12:43=E2=80=AFPM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
> Hantro hardware is splited into two parts: the decoder which produce
> tiled pixels formats and the post-processor which produce raster pixels
> formats.
> When post-processor is used the selected pixels format may not have the
> some padding/stride than the decoder output pixels format. This led to
> miscomputing chroma and motion vectors offsets so data are overlapping.
> This series introduce a reference pixels format that decoder use to
> compute the various needed offsets and size.
>
> With this series Fluster for VP9 tests is now 207/305 vs 145/305.
> HEVC test score isn't impacted by these patches (still 141/147).
>
> Version 2:
> - rebased on top of media-commiter/next
> - Add reviewed-by tags
>
> Benjamin Gaignard (2):
>   media: verisilicon: Store reference frames pixels format
>   media: verisilicon: Fix IMX8 native pixels format steps values

Do both patches deserve a Fixes tag?

