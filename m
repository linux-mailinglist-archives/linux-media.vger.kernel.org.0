Return-Path: <linux-media+bounces-18286-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8571978C42
	for <lists+linux-media@lfdr.de>; Sat, 14 Sep 2024 02:46:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B22C1F27D6C
	for <lists+linux-media@lfdr.de>; Sat, 14 Sep 2024 00:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D691933D1;
	Sat, 14 Sep 2024 00:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cowlark.com header.i=@cowlark.com header.b="EeQW069E"
X-Original-To: linux-media@vger.kernel.org
Received: from mx2.mythic-beasts.com (mx2.mythic-beasts.com [46.235.227.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F8E184
	for <linux-media@vger.kernel.org>; Sat, 14 Sep 2024 00:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726274742; cv=none; b=BSyd0XVmvIEZ4QtmLapEEJNJnKJISJSJd4bN8KlM8D0O9nm6GgychFyxfkGmMZZAnBB7owc3hv70P9hk0WQW66NQIhwX5MKzFHp1JCSqP/WnIsijinG/3DJEO27up57XyFEIPUo6b6dhbpv7JgiYuOHH669E9Ni1VcVjMXOlrDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726274742; c=relaxed/simple;
	bh=FfugT7F/R8zYS6SHuXG1pZhpOetnl5+TM+H8bMx3g/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bYlvHvDk9i3BJtHUJIu8IP6yxW5w287PS9oo8VWJlWqxT026xsiYnOC25nUgn4bPTaUF6lHhlWv+iYt5697dd6BYZv/n+uWVjnj3zW/C8x2DWaBBdp5o+M0P/35OoX6HYHcatHs1v6KAif3tKs7UmaL5VvNiNUl5Om3lUhyeYOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cowlark.com; spf=pass smtp.mailfrom=cowlark.com; dkim=pass (2048-bit key) header.d=cowlark.com header.i=@cowlark.com header.b=EeQW069E; arc=none smtp.client-ip=46.235.227.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cowlark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cowlark.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cowlark.com
	; s=mythic-beasts-k1; h=To:Subject:Date:From;
	bh=fIXJ9gAG7+saQsy2+ar5L8y5ERk3HvAa/4d4CDPpbWg=; b=EeQW069ESxFuN5kzRJbWonngS7
	r+NC0CpCWaqmw7jjHpAPN/mpAmrxffFaXJywsBdu5wpMZHUrb6BzF5/eJwBaLnfmdoxspf3lGW0so
	D58ROBb8hW9Ft8vJ7mnCtnNXN43Qws/BRUfez2MhC+ODmb2Azp7115+3Io43c28SW+SNC8myFbrow
	6gO0OsqKz4bR6qQCnbuHJMMI5XoIxixQShdXUhEX7Etca/0Iw/GWzkcqnPcLSfCQWTDpJip+nNFIA
	vw8MbHVyVjGPSZ8WXfYZKohqKwNxp0JIRwPYexG8JTjldNDdM34pBo8QlXyu1+WyEuR3AlAGVHI8l
	yf5Dx8lA==;
Received: by mailhub-hex-d.mythic-beasts.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dg@cowlark.com>)
	id 1spGPi-006sw6-N9
	for linux-media@vger.kernel.org; Sat, 14 Sep 2024 01:13:22 +0100
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-205909afad3so29985605ad.2
        for <linux-media@vger.kernel.org>; Fri, 13 Sep 2024 17:13:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXJIuQ5oZrc9Xid1qasRAn9fplHjnWjAAVZQDnI+3yOpeHel/QkVPtQba2VnauTsckHLdrl9DoSdcV4Ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YygcOcmAgfbc5m2X41DVyn5zp/W9ZUMBEcHSAJdJQ4MIFg5GZOl
	eLRP8ugmFFuFBzg3c0UcAebPeHQkymmewgDiFGVo+tli3WGeffO4T7gRjFeNCRuBvEA5cuULgla
	B0X2fTbbg0NCeX7zBQ66365QLX7U=
X-Google-Smtp-Source: AGHT+IH5J79OXkVkT509gkH/UOZKFn75oUz4Ml5Fev3mzmek6nqxoQDw0dpPDgLTFz8/e9mvIDNeY1Y7oFVslQC599k=
X-Received: by 2002:a17:902:ec88:b0:206:dc2a:232c with SMTP id
 d9443c01a7336-2076e32fa72mr132708755ad.15.1726272799705; Fri, 13 Sep 2024
 17:13:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALgV52gdx5m3eP88Sqa4s09qy+N4rpaZ8UHFXfphkCXZUxyNHQ@mail.gmail.com>
 <CANiDSCuOojPtX4M9Q7DOe4sR-DpuKp1Rzzpa3NrJxV7HuzAAeg@mail.gmail.com>
 <CALgV52iM3B4G2Sa0jjuMcEZtE+rn8B80NOMWj3i4jEUCiVVnRw@mail.gmail.com> <20240913234037.GB9669@pendragon.ideasonboard.com>
In-Reply-To: <20240913234037.GB9669@pendragon.ideasonboard.com>
From: David Given <dg@cowlark.com>
Date: Sat, 14 Sep 2024 02:13:08 +0200
X-Gmail-Original-Message-ID: <CALgV52i7=-jH-EmQQb-gaYAs7vuS1bPxyUv_PSvrTKyRYewWuw@mail.gmail.com>
Message-ID: <CALgV52i7=-jH-EmQQb-gaYAs7vuS1bPxyUv_PSvrTKyRYewWuw@mail.gmail.com>
Subject: Re: No uvc video support for D3DFMT video GUIDs?
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-BlackCat-Spam-Score: 9

On Sat, 14 Sept 2024 at 01:40, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
[...]
> UVC_QUIRK_PROBE_DEF may help. Please check if it results in any change
> in the kernel log messages, not just if you can capture frames from the
> camera, as sometimes multiple quirks may be needed.

Thanks for the suggestion --- I tried it, and the kernel messages did
indeed look a bit better, but I suspect only because it's not doing
the GET_DEF anymore so isn't reporting it as an error.

---snip---
[23584.241771] usb 3-5.4.3: Found UVC 1.00 device IR VIDEO (1fc9:009b)
[23584.241775] usb 3-5.4.3: Forcing device quirks to 0x100 by module parameter f
or testing purpose.
[23584.241777] usb 3-5.4.3: Please report required quirks to the linux-media mai
ling list.
[23584.246791] usbcore: registered new interface driver uvcvideo
---snip---

Still doesn't work, mind.

My gut feeling based on looking at the compliance logs and no
experience with how things actually work is that the format selection
commands are a mess, maybe because they're not expecting the client to
actually try to select or enumerate the formats but instead just
process the frames the device gives? This line looks suspicious:

---snip---
       test VIDIOC_TRY_FMT: FAIL
               fail: v4l2-test-formats.cpp(473): expected EINVAL, but got 5 whe
n getting format for buftype 1
---snip---

5 is EIO, so if they're failing the request incorrectly that will
confuse all clients which consider EIO to be a fatal error. It should
be easily quirkable; I'll give it a try.

