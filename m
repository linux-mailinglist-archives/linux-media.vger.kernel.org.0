Return-Path: <linux-media+bounces-18302-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C798A97987F
	for <lists+linux-media@lfdr.de>; Sun, 15 Sep 2024 21:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05C881C21AEF
	for <lists+linux-media@lfdr.de>; Sun, 15 Sep 2024 19:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541021CA68B;
	Sun, 15 Sep 2024 19:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cowlark.com header.i=@cowlark.com header.b="pNLMKwsi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx2.mythic-beasts.com (mx2.mythic-beasts.com [46.235.227.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E1B1C9DE4
	for <linux-media@vger.kernel.org>; Sun, 15 Sep 2024 19:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726429057; cv=none; b=ROoZPf1kT4tS1968RhiUjXbGDIax2w9kwB/9UUStct3GQ6maaT0/PfO2tRPyYgge5hHucOFxXYsqMsCUWclwqvZddUKZ2EydqhWBUK2dKgp9aEBvgLQPNBgWHFDHh+lgmheYZ8D5zH4z3QfBR00bW8NWKS51PCpuVXdnlAj55S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726429057; c=relaxed/simple;
	bh=/FoIwVNC1/eYtPCe6C0oOHe+8Ojk7t+VKHlOXZA9LKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QWoskgtAteG6l03p694amc0ntgmii69kSldVSOG9sbQK0N66OaG303Q34QFlHpwtlPZsBl0fxELi5nVCUwi4epbRbnLWzK2Gac0DOVqV/Xvww2BSpPFkBxCUxz23dbSH0xJdpEX51PZKrDUJHhYIJRNddT72zAf+swB08FTzDrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cowlark.com; spf=pass smtp.mailfrom=cowlark.com; dkim=pass (2048-bit key) header.d=cowlark.com header.i=@cowlark.com header.b=pNLMKwsi; arc=none smtp.client-ip=46.235.227.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cowlark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cowlark.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cowlark.com
	; s=mythic-beasts-k1; h=To:Subject:Date:From;
	bh=/FoIwVNC1/eYtPCe6C0oOHe+8Ojk7t+VKHlOXZA9LKY=; b=pNLMKwsilORLhSXq6W0j4izT+M
	UHdMTouiEqVdJBIef6W+dPzEghmrZSruiFf3m+g7b/nErkDY3ZVDsp5chpezi15PFRLwW6G7mG5AP
	dLIXuRc9U4a1wQrVqRRyzx4UFBCf0FzxNXr5BUEKD0cicjYrhICBnHrlcF/6XtKZVb+ReibO6mgCH
	Bn078mwPE43DK6VTIR6eOYKW+qk3K7VQx/0gg47T2OtewGQw3B9ocBa81Orr1mw/N0F2298oNiaH7
	pLhqe1JElC/qNDfg34g5q+0FSbRasdkom6zQK0VfQiVEN3l9Srw6OH1cpJ+wQVW5TMThqn0TSRyAj
	CQbGlDdg==;
Received: by mailhub-hex-d.mythic-beasts.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dg@cowlark.com>)
	id 1spv3o-005sKc-0t
	for linux-media@vger.kernel.org; Sun, 15 Sep 2024 20:37:28 +0100
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7c1324be8easo3444175a12.1
        for <linux-media@vger.kernel.org>; Sun, 15 Sep 2024 12:37:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJINwmkRnRTm7fRl3yblin5xl15oemrMysy1Whw1gCWXmIiMplmiUeFMmtGRoDwgbRSsfsW2MAQ3l4jQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMRGabW8o2uGW39Z95Xgqfi/GocPrUjndPVsDYMjkneG2iDgoo
	G5wTmSR3Gdg5UGuDlHp4WhIGROZSia5MFcPzzPD05LnG1MFdqrTEKU7sPrg2zQwcP6MaTOAbcVS
	b5+qw2wIIJRzkfH8XCG2LApriaYc=
X-Google-Smtp-Source: AGHT+IHDmFR+OYfL/KCMKzBMacd7CYR3c4xbcYhR8gv/QeFISWAyX4CGZFAU8xR2W79/4G2ALnuIvrA2GPoxqyq5PG4=
X-Received: by 2002:a17:90a:7445:b0:2da:8b9f:5b74 with SMTP id
 98e67ed59e1d1-2db9fcb93f8mr19437551a91.13.1726429044188; Sun, 15 Sep 2024
 12:37:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALgV52gdx5m3eP88Sqa4s09qy+N4rpaZ8UHFXfphkCXZUxyNHQ@mail.gmail.com>
 <CANiDSCuOojPtX4M9Q7DOe4sR-DpuKp1Rzzpa3NrJxV7HuzAAeg@mail.gmail.com>
 <CALgV52iM3B4G2Sa0jjuMcEZtE+rn8B80NOMWj3i4jEUCiVVnRw@mail.gmail.com>
 <20240913234037.GB9669@pendragon.ideasonboard.com> <CALgV52i7=-jH-EmQQb-gaYAs7vuS1bPxyUv_PSvrTKyRYewWuw@mail.gmail.com>
 <CALgV52htoEjohXv7NLTAb7eCy8nPujWtcd82prNZ=jWrVY7wyA@mail.gmail.com>
 <CALgV52jhPHmfaVnbskCXZw-8N4jYFGtowaVMmVL3NwUg1Jiutw@mail.gmail.com> <20240915093922.GJ22087@pendragon.ideasonboard.com>
In-Reply-To: <20240915093922.GJ22087@pendragon.ideasonboard.com>
From: David Given <dg@cowlark.com>
Date: Sun, 15 Sep 2024 21:37:12 +0200
X-Gmail-Original-Message-ID: <CALgV52gDq5V1n5oPqz32qS9V-ZndmNVHt2w5H-FE-C5y4cZJ7g@mail.gmail.com>
Message-ID: <CALgV52gDq5V1n5oPqz32qS9V-ZndmNVHt2w5H-FE-C5y4cZJ7g@mail.gmail.com>
Subject: Re: No uvc video support for D3DFMT video GUIDs?
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-BlackCat-Spam-Score: 9

On Sun, 15 Sept 2024 at 11:39, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
[...]
> The linux-media mailing list is the right place. Please CC me as well.

Done (under a different thread).

[...]
> -32 is the -EPIPE error code.

Yeah, I figured that out the next day --- apparently understanding
word wrap was too much for my 2am brain...

