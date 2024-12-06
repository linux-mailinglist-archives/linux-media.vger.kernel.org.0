Return-Path: <linux-media+bounces-22795-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA839E6B28
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 10:55:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECFFB1883356
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 09:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B61C1F9405;
	Fri,  6 Dec 2024 09:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="O+k0W8sL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457E41E102A
	for <linux-media@vger.kernel.org>; Fri,  6 Dec 2024 09:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733478889; cv=none; b=I+82DA6dz2SAmpAlladQFvl1x6B4nTvVoyx6cC66Ph2hwoKrwg+0zUm/Xmbuqs0cDJD6Tx2MAt2Zu9MhlMYs6q6+yR2cHsqW2mkXMEGSpfJpVgSkx564eCFQ2UbSfIIueqtmPzAoR35lZNy6SCcwJOIU998a1bwMrFPfvq3bTK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733478889; c=relaxed/simple;
	bh=mriGpAishqlGoHGFUQtapkfT3yTLEgExu+TuBeZWk+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z3+Cc4aRJu2lE10uD4YqtWdU4yUgfY4s0AqKzHYhIeZJZiRy7ic//rnbkkutMgjuD7zwvxur7eHn5O/As5ulinAkZqXWpKphqeC/MHyl4ktC4FIbGyef7jsl4uj5Nz7eWjjdDmKSjgztgkTr5h7/7lKDl/l7dR9lZg5Uwz6027g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=O+k0W8sL; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-724d23df764so1829690b3a.1
        for <linux-media@vger.kernel.org>; Fri, 06 Dec 2024 01:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733478887; x=1734083687; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ew2s3pne/yrZPglMKeXGwfYSi02uG6Ez639Ie0PXU+A=;
        b=O+k0W8sLb+mAi5hFhSuHGlrjFKYLSbrEgGTZU7WKt3djB8r+U+x1jyMs7oHifyQ2PR
         kxWkDIcVFJP1CgAnPpAK+oco0x1zbmPcVExzy7DXNGfejTN5bZHqWX8frjyT3zbkmNWM
         /zLIt84ytDMH8RCrmR227q+Wh1X/NYqphsar4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733478887; x=1734083687;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ew2s3pne/yrZPglMKeXGwfYSi02uG6Ez639Ie0PXU+A=;
        b=OtNc1CaRLpfSEsGE881oTOtBDARIB8XHji1kGfAE8NlaGG5nM0x1x/5JWzmmnmOPkT
         2bGActa9jEj26jKLD/F7ZZNg2P4I5/y8uxWMK0W/c1GLWRmg8hHCJi5HtsS9jKsDzL26
         IdoV/vJsZJP5CfE+b7ztZSN5XGfhoK+j/UIW7bWaYiZ/LXWMqu1a4BUpuvkhAvZVyXJ6
         VwKU4U/GsmN0BW8rpaMaOsKu9RiTf92v2BwtttMx+BccIyhO++Im+sj+O3nJzOiuO/Mi
         Xuh369wU2qBT6v6RiXOGg+2UMWSd4k1HYME6ma+1/w3DS8qDyzPf3aR5nAA7wly6GyDr
         iWaQ==
X-Gm-Message-State: AOJu0YwcJLI5VU0SCgyf3PFD5GW312RrIcb4lVmvbXR86Eg8m/1q2WH/
	lzGqqnl0B0EzU1ySPoXLlXM2xlw7RykIaiqHTMy32d90h+GMdCFrAbYxXvskCiznPWeUOaj2bR0
	=
X-Gm-Gg: ASbGnctpOwJxVzuBrU+1uMIkxoW/TzDwd3hmIDFrKTubBUGnNijPvmH9QOTbDf6/JSj
	Xl64pGwwWE2O+nKvCXxp+YKoS8t7MiHcYPmXIb8AbBgy6KGUYP50hpDrZy9l1HwKBgoUcXE6qy5
	xnvcclu7G+/1day4cJG1L/wvNvaaYtGPTGml6jCLoHj4+arKhteGnP5G91l6sTHqWMJE2cyuxOm
	0/7ImSn9Rl3IJSep0oiO7pbN9D20zL9GHdye+kLs+vGBme7Ut+NHvRd55EqzGKQPY3sabYv+s/R
	2r0tqWBjgXnm
X-Google-Smtp-Source: AGHT+IFzuutvGAZ3Ev35s17bFCQLPYLwFgVvVbnn2sb+3r1KA7YlWd+0CBdmo2qDrUOJPg1Smh9Waw==
X-Received: by 2002:a17:902:e5cd:b0:215:7ce4:57bc with SMTP id d9443c01a7336-21614d3b228mr33737265ad.16.1733478887115;
        Fri, 06 Dec 2024 01:54:47 -0800 (PST)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com. [209.85.216.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8e3e5f2sm25415175ad.13.2024.12.06.01.54.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 01:54:46 -0800 (PST)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ee8647dbb9so1475189a91.2
        for <linux-media@vger.kernel.org>; Fri, 06 Dec 2024 01:54:46 -0800 (PST)
X-Received: by 2002:a17:90b:1a8e:b0:2ee:7698:e565 with SMTP id
 98e67ed59e1d1-2ef6965450fmr3090839a91.8.1733478885309; Fri, 06 Dec 2024
 01:54:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
 <6752c7a9.050a0220.137aad.10fd@mx.google.com> <9b9e5da5-47fe-4dac-b897-b5482ee784a2@ideasonboard.com>
In-Reply-To: <9b9e5da5-47fe-4dac-b897-b5482ee784a2@ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 6 Dec 2024 10:54:33 +0100
X-Gmail-Original-Message-ID: <CANiDSCtsom57dTUf4Sv_4KTcCNd_YCLW7PN+3Ootwjb7RLNuLw@mail.gmail.com>
Message-ID: <CANiDSCtsom57dTUf4Sv_4KTcCNd_YCLW7PN+3Ootwjb7RLNuLw@mail.gmail.com>
Subject: Re: [v4,00/15] media: i2c: ds90ub9xx: Misc fixes and improvements
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Dec 2024 at 10:50, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On 06/12/2024 11:45, Patchwork Integration wrote:
> > Dear Tomi Valkeinen:
> >
> > Thanks for your patches! Unfortunately media-ci detected some issues:
> >
> > # Test media-patchstyle:rebase
> > fatal: invalid upstream 'origin/base_branch'
> >
> > # Test bisect:rebase
> > fatal: invalid upstream 'origin/base_branch'
> >
> > # Test checkpatch:rebase
> > fatal: invalid upstream 'origin/base_branch'
> >
>
> What about this one?

You were lucky enough to send the patch while the server was updating :).

Sorry again

>
>   Tomi
>
> >
> > Please fix your series, and upload a new version. If you have a patchwork
> > account, do not forget to mark the current series as Superseded.
> >
> > Best regards, and Happy Hacking!
> > Media CI robot out on behalf of the linux-media community.
> >
> > ---
> > Check the latest rules for contributing your patches at:
> > https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> >
> > For more details, check the full report at:
> > https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/67825296/artifacts/report.htm .
> >
> > If you believe that the CI is wrong, kindly open an issue at
> > https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> > to this message.
>


-- 
Ricardo Ribalda

