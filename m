Return-Path: <linux-media+bounces-14196-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AAECB918A59
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 19:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DBE71F23302
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 17:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83DAA190050;
	Wed, 26 Jun 2024 17:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kv2GH5KV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7266DF4D
	for <linux-media@vger.kernel.org>; Wed, 26 Jun 2024 17:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719424215; cv=none; b=hO+NSe8LEseHMIlDEHKrkfqvuYn/W84HXGg4S26LMpJPnbHg04zwVWpRzTipUO5PsTNqhc/zJYc9nrN3uFxd0AkJ3lkahYKebCUijZisgD7eTch0Lz7oeLeQC+93xbzd3QA4B/0G5K5wUiY8dnQHr70uRzr+tjV/MqPeIAQ2NS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719424215; c=relaxed/simple;
	bh=Bq10NkdpYCn6xvX8J5Zbx9QGsmvlHn+HTTF1xq8GzT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OxvrRBNcWW5Ufcxy3t+sqBjBA2pk4CE99fSqVO5swzKnqV3us4i3CzFB4STKiLZjaZY48eUY6KuVf6P6ld5d4e6AV376LI/OI3CTJdUcYDp0GaR3257ChpI5lDVQtDaT4r704E5N0T9G/40NO587KebbBfdTWFjBzjidPmBR8yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kv2GH5KV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC0AC4AF0A
	for <linux-media@vger.kernel.org>; Wed, 26 Jun 2024 17:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719424214;
	bh=Bq10NkdpYCn6xvX8J5Zbx9QGsmvlHn+HTTF1xq8GzT8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kv2GH5KVJOzkpTTqB9Xd8nhCmNKpx8oTwPp8GnpG1vOqcbg79Tp4xtQtweVWE2z5V
	 ZsLlG2Pm7hibVQ1EpX6BF9zDF0SJpZYZzX7yRPrFX9+sSUCTydtYrfGe2IYLodS+86
	 yZ49oj/vVSET7MAkjUVZN9wga1j7GZmtvu3y6r9362k6fkwB5TUPVubtsyGFLm6SnU
	 FPrH+rPFuS237MTDUBja/+/mS/Z4RAvmImXwzrC1hQd4rUWFkszlP2lRjzN3fO2RaU
	 7ntfwSB4os6fOcLhCh3lvmDY0pIq4LFyHXsdoyIyoqTILJ7/EQeChSJCLzCptGgp/d
	 AaysxkeVixCvQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52db11b1d31so1777481e87.0
        for <linux-media@vger.kernel.org>; Wed, 26 Jun 2024 10:50:14 -0700 (PDT)
X-Gm-Message-State: AOJu0YwmcVhrZeMILnaNnRh14KMH0RhriCVMA5u5Df5eCsP6UpfODubS
	NBcCF56AxqtmfGFAycSD2flLYKca72lmASdni5gmFSX4R3zqbeEI+VLTdczmH9hML5ArnFqV4Ua
	lJD90mBqFrTj4WyqjnnTySz69ZA==
X-Google-Smtp-Source: AGHT+IHk2JXIOMBA0+T28A0yQKX0WzCkBVHg/dmNh1o3kKCBH09uTAgsYglgmt+vnOf+wqd1bNwA6RSLXACbcy8MXYg=
X-Received: by 2002:a05:6512:1304:b0:52c:fd49:d42 with SMTP id
 2adb3069b0e04-52cfd490d9emr3254614e87.14.1719424212699; Wed, 26 Jun 2024
 10:50:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240626160144.87871-1-jacopo.mondi@ideasonboard.com> <20240626160144.87871-7-jacopo.mondi@ideasonboard.com>
In-Reply-To: <20240626160144.87871-7-jacopo.mondi@ideasonboard.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 26 Jun 2024 11:49:59 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKe1UHEBuwxXRg1tB-1StJ6C2_ixEbmQCR+e_Zmkcrjig@mail.gmail.com>
Message-ID: <CAL_JsqKe1UHEBuwxXRg1tB-1StJ6C2_ixEbmQCR+e_Zmkcrjig@mail.gmail.com>
Subject: Re: [PATCH v10 6/8] media: dt-bindings: Add bindings for Raspberry Pi
 PiSP Back End
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, 
	David Plowman <david.plowman@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, 
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Sakari Ailus <sakari.ailus@iki.fi>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 10:02=E2=80=AFAM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Add bindings for the Raspberry Pi PiSP Back End memory-to-memory image
> signal processor.
>
> Datasheet:
> https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-proce=
ssor-specification.pdf
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Sigh. Use get_maintainers.pl and send to the right lists/people so
that automated tests run.

I know I didn't review this without that happening.

Rob

