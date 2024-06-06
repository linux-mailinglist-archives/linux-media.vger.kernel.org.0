Return-Path: <linux-media+bounces-12662-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B768FF062
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 17:20:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F243328E2C9
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 15:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A06B196D91;
	Thu,  6 Jun 2024 15:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jG9shmfS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77140196444
	for <linux-media@vger.kernel.org>; Thu,  6 Jun 2024 15:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717686496; cv=none; b=TOr5nj68vGp5MAeKumRDz7m5Kvjo3AybDDmCCPij/ADQi+K9bIE/jLrTHKg3Ga+mNTZOti8HgfAa3rB2wqbS4qCYU+v0NDjHZ4ja7uIasvoQuXLUfujI9C+OYqiLqtgqAd2dMBZj4L62mG5QfOeB+SdJwjV5r1RZrjMFSJxgrIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717686496; c=relaxed/simple;
	bh=LAk/q91CswqoB5/UVCCWI4bZ4s/lb0BgYdSRSL+GjlY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PjRUeJw00yE/QPjGjQv2QiD3kpEs06sE0OV29zyGchL4R4y+vlG+G4HiDxsNwus6W67uE859XIUNwIotETYWVk2vj2bqpW9e3P4m6prz8Y0I8skV6uybsIXLRU7HAvsYE5Y1lRfi86fgx9dXkqmjVBsYJfUQ0aWdK1MrQV1CBsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jG9shmfS; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6afbf5b88ecso5508016d6.1
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2024 08:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717686494; x=1718291294; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VOMrfuVO3iMlJuOu/rq9oULsps7gZI/Oq57LGlTzOIU=;
        b=jG9shmfSyD9Jo5VpOYlVRCLvL0crgk0XZcNmrIAjkVKF5aJOYoYjdrJ/nM77nJoQdA
         yaweYt9I+UFLKwtIOAyMapjmKsZrKx72ZUsfOWBgoKzYTanon4LuObXJaElZyBpHgpQv
         8ZRMmYeYvgZ74H04eE5g/Do8sZIqOIsqjJr5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717686494; x=1718291294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VOMrfuVO3iMlJuOu/rq9oULsps7gZI/Oq57LGlTzOIU=;
        b=jwsf4zlEss1fFAuC+sbY0Vq9CLeflKCiP+qDDouqbOie0snRGcLmjDPBGjZXROiGbV
         PBHvmPUTisQDe8IGqqS5oFkR2kfD4W8QV5yzzgCJmuBWpCjjDLpv+FEDCosRJ/Q1Xxs5
         l09vIaTW34TnNHuGVfdXUVa55yxTYTLm8aDgz3Akis+EadHXyVbMo94Fl3nm0sXC4RfH
         OZbcN9mRZ/YdGvc9nZ2b/ZsPAJITjLJxsb3s3UraN6RHKNFbi/GEzpFcmtk8tm+Y2iLP
         4BKR4VhVX1gMCmisxKs+yVK6oQFHuMyZBWG7rhnyEclJXfcP5KBYeQGStN/HzIhj/BSb
         bDow==
X-Gm-Message-State: AOJu0Ywn9c250XuGpsWmPSEvljMs2BN41Ng2FLwGnaY5BYhu7SeMLYRD
	isx0tAVhp17juS82C5C2CWtAyfMPn3b+tlwlNv9KX+vpj7osT776m8szc/0wRarxxw6xBu3tKT1
	iVA==
X-Google-Smtp-Source: AGHT+IHoeSCcwjJxwHhl5K5SAwzvOk7gzUUf+NeWNcfiYaY7NSkEkyjHODYPjNzy77a2yvGtbY3Dyg==
X-Received: by 2002:a05:6214:3f8e:b0:6ad:83d3:2e8c with SMTP id 6a1803df08f44-6b030a42033mr81133686d6.46.1717686493942;
        Thu, 06 Jun 2024 08:08:13 -0700 (PDT)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com. [209.85.160.177])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b04f6afdc6sm7050706d6.47.2024.06.06.08.08.13
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 08:08:13 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4403385d2aeso5351371cf.2
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2024 08:08:13 -0700 (PDT)
X-Received: by 2002:a05:6214:5910:b0:6af:cd19:e206 with SMTP id
 6a1803df08f44-6b030a98dc0mr71631546d6.62.1717686492625; Thu, 06 Jun 2024
 08:08:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ-JD0YbaZaB-iB_HkqjA5EZmzcj4MZ1FBqwLFv5PGQDpy6hhQ@mail.gmail.com>
In-Reply-To: <CAJ-JD0YbaZaB-iB_HkqjA5EZmzcj4MZ1FBqwLFv5PGQDpy6hhQ@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 6 Jun 2024 17:07:56 +0200
X-Gmail-Original-Message-ID: <CANiDSCtkjcvMqL5wN_CkFHbs_0f=f8c80zYjSpuCj9NNHyUAhA@mail.gmail.com>
Message-ID: <CANiDSCtkjcvMqL5wN_CkFHbs_0f=f8c80zYjSpuCj9NNHyUAhA@mail.gmail.com>
Subject: Re: UVC device not listed in Supported devices list and is not working.
To: vdm736@gmail.com
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Vadim

What have you done to test it?

Can you share the output of dmesg when you connect the device?

Thanks!

On Thu, 6 Jun 2024 at 16:40, <vdm736@gmail.com> wrote:
>
> Device ID:  041e:4095
> Name:  Creative Technology, Ltd Live! Cam Sync HD [VF0770]
> Manufacturer: Creative Labs
>
>
> Vadim
>


-- 
Ricardo Ribalda

