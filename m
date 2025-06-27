Return-Path: <linux-media+bounces-36075-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1C1AEB1EB
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 11:04:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7CFA57A7E60
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 09:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B4D293B69;
	Fri, 27 Jun 2025 09:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8ME8cDw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C42222590;
	Fri, 27 Jun 2025 09:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015032; cv=none; b=hMAJIphW5xnZosq1wOlenjppdiOwqOl0NxagWmr1H4PUXK0VvHC2mhRVmtNl/V9haiOTiAJHMnlypvR+WI1Add8MUYEWvUAcb/PbB0ZIaX36iwy5LD3P9CRvEv4vkEg4YdQ1R3x6JyMgrytQcA6m8/Hc465WPJV20vmsIdb91pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015032; c=relaxed/simple;
	bh=SkT01FuiroIHQcsTRFpB/e7tKPVnTyJoT7yGqpKBv3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G7nxjodLTutSdVBZs8yzZudBHnE8yKaEuHGxWZjgAze/mKqC3FlhrlJji3TVdEY2aAzwifX1Iog5zE44gjHde9k0xlQnkb8U2qK065+5l+ZCovqjQ6EPvC0VLhNP40I33vqnCivmDZMoeFXgXPsL0buoJ5eVdIz2XW1W72GNWQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8ME8cDw; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-70e3caa3f7cso1403367b3.3;
        Fri, 27 Jun 2025 02:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751015030; x=1751619830; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxPXFm/2Af/O0czSgJFjpR6ljpGP3r1+LOljZ09h6rw=;
        b=N8ME8cDw1BIMkfuXB0WG0ElQlHkW3U17C67Wgz+4E9SAal8vP8PjvUskV1wyEgJoHg
         jbYyIrG/BoNxj8LOyZd+jqkFbblv1gwQfnMU7dfE70tR2AM31YE7qs/2zaHH0vCTJ7Hh
         HhONzU0UpQRkLxlo6SYORtQjZXYDQTjR7VhTgYUow+uJrxt8y6tfXGVaQBm5IV/xOjv3
         Kq3nwN/u+VZHNeo7o5kf0yEu5cKRHY+p0uBldWziPb+UjTc2g08SaUE+a1Ri3Bye6isu
         5U8ZPKIfw8JcEDuKPOL+DAZoKo9vZbqm7Lmtcv85DmxI34XAyqzZLiao+fY+wcJIPe3X
         ekuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751015030; x=1751619830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxPXFm/2Af/O0czSgJFjpR6ljpGP3r1+LOljZ09h6rw=;
        b=wJaZve6x9KvNh5pqPaEYmoDJ7e7bbF4B23Ywm+3476F/ginz78B2S+7D+JYp2x9SWb
         zgUlURLTatSGOoL4XW3+hNigvgVAnxBZXcRx879FU0RXGzzG0QBU9BvAZD0cTNRRUcqd
         yB4vKhWx3bKRZmrcvCPu5HD5J6RPWqppey+6vo6o1IAS/kXO0tnYQp0E/xS1nD7hW/qw
         uZl3LqJEe2K3XQqhjNI3lVmAPjzLqIYgTrwOuaz83HFU/DEetuqUNTMNi3jyDXmBB1OP
         ZjqoB1vyAMvxLiD0fEHcWxb2hkyJyyRhMfjEnInPa1+ZnQ+Ktsarq4sEcMKayCxMVCLR
         Guug==
X-Forwarded-Encrypted: i=1; AJvYcCUYXqXDMwzFINZVKu/SusxfyV2/pFxaz8b1TIeiolNwxDUXJlv8BEv6xIWHOrg+BgKIXq5T55ilvi1tJ6Q=@vger.kernel.org, AJvYcCXp5b7C81NywhBmLbv9NJHY1nBZ4cOsVov+UT0B9Rc4M1LeD2kdANde+bHuSpbQg3gdLTGkMshpN+gcrWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YypJIjrM43flE5eZo0Rnvr69ZCdf1Hzgn9J9HFufcKHzkV24cqo
	6UOt6pQY2GbDd3FFd3UzMQ7OpVlgULPUJGRZHqeymzjeO00wqd1Mqrfmo86H79ZPxRZmTfYdgXo
	e6rZmyHcg6O8721mjlGcBlJ2A4x5iN0I=
X-Gm-Gg: ASbGncvp9WAuwxjRaNovrlXGiyjSF5T9q1F4Nv9sm3/+Ej4jp2CY5zmvSUa7wiyiQ0p
	mXt7N1Dg008LVmM1d37Kaa6i27zGf0JHLGryE+Sf0zgKyvIzZgGOV29XMxq2SsFuFmIZmRj54Ze
	uuSs1hhwoIdPUKxbnj2ZyitBBrqcoa/QQZr+jepNJ0/Y5JBg==
X-Google-Smtp-Source: AGHT+IHxWtIJzA7AjqYBeRaD1K1kJoZF1TThU2Qzy0U70LW+zaf9l8TXpjHPTMMpS0pxvero1s7YpQzkzOAIKEGREi8=
X-Received: by 2002:a05:690c:4a01:b0:713:fff3:62ad with SMTP id
 00721157ae682-7151719d791mr15585547b3.8.1751015030205; Fri, 27 Jun 2025
 02:03:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627072939.21447-1-abdelrahmanfekry375@gmail.com> <aF5Y5MurVIn1mUk1@smile.fi.intel.com>
In-Reply-To: <aF5Y5MurVIn1mUk1@smile.fi.intel.com>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Fri, 27 Jun 2025 12:03:39 +0300
X-Gm-Features: Ac12FXwOUEosg--SmicR1srEOI1Ci9W95VvN9pfI47FDKsi8dSoopfUooLVYraM
Message-ID: <CAGn2d8O-X8mgmf9kED=XbFYAoySs6+is=dorkz4yPbrSLiP6Nw@mail.gmail.com>
Subject: Re: [PATCH v4] staging: media: atomisp: remove debug sysfs attributes
 active_bo and free_bo
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	skhan@linuxfoundation.com, dan.carpenter@linaro.org, 
	Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 11:40=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Fri, Jun 27, 2025 at 10:29:39AM +0300, Abdelrahman Fekry wrote:
> > The sysfs attributes active_bo and free_bo expose internal buffer
> > state used only for debugging purposes. These are not part of
> > any standard kernel ABI, and need to be removed before this
> > driver may be moved out of drivers/staging.
> >
> > - Remove active_bo and free_bo attributes
> > - Remove group registration calls form hmm_init() and hmm_cleanup()
>
> ...
>
> >       /* free dummy memory first */
> >       hmm_free(dummy_ptr);
> >       dummy_ptr =3D 0;
> > -
> >       hmm_bo_device_exit(&bo_device);
> >       hmm_initialized =3D false;
>
> Stray change.
>
sorry for that , will fix and resend it right away
> --
> With Best Regards,
> Andy Shevchenko
>
>

