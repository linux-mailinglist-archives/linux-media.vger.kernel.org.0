Return-Path: <linux-media+bounces-12682-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE1E8FF6FA
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 23:43:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95AE1285D85
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 21:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E3913C8E0;
	Thu,  6 Jun 2024 21:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BsKw04Yo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F037271B3A
	for <linux-media@vger.kernel.org>; Thu,  6 Jun 2024 21:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717710183; cv=none; b=Q396vc6RhKcJf3XAuadz1G+/Iuyms43c0Dc1fG1v4yADKJCbs51eG+F5tV6gjd/WhfS/O+IgMm70RNoqT4lH0E55qOVmdVuIZnyfhqfbB2qmaSw6I3rum7MITZDoagKYFYogGGhF18kWXHq0UglwtAziAiYCDIAeijIlkRnUfqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717710183; c=relaxed/simple;
	bh=8QcoP9elePGrki8qKC3K7LhgN0LevPniv8odvWFrCGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=d3bprILvTV13cKrAnYUO6oki9ud6vJRGDHOqpCC+tM31/LWg8vxjXZ9cghpvNaeMjQuyt0n9Qj/sQHczhU1uKo1488ryWH1KYnHXGteGFQWipFpPm8uStsJOTTJ+4xhMx3LxPjj6o3S8lvFf8cJzvnpSnnFFIQLlR/6gJ36t+ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BsKw04Yo; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-62a2a6a5ccfso15537607b3.3
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2024 14:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717710181; x=1718314981; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WacZzqR8Ryy0rLLKzqomKyf3FjbuWmhZNovF+wzqrKg=;
        b=BsKw04YoMhjF+brxpUncFJEaLpFxRf+yTjIuE5pzVM6pz5on2U0/9t/9WS1weMPUGR
         3n1z+BHrgwSGU6Rnvm+3FcwWrNAmfC6RcKhyv6bthZJqZj8lywbhZ6yMXo0Rd643Qq5Z
         uJNHnSs+vhMWGdLgobKSMwFLKg7v+WxDT5PZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717710181; x=1718314981;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WacZzqR8Ryy0rLLKzqomKyf3FjbuWmhZNovF+wzqrKg=;
        b=uLQ2Z3o3RZ7UVZI/y374kyXPM4f/r/dW/HdLKlW8ciKjI4dcNxlFPHhGTV+/aydTq0
         k95WB2KqKNsFahiqaJRxVS7m9GiyzuLt56Ef7Ck1aMZI/sh0HL2FfxNKdhicdAGftsM/
         mLreibuxSgwf5hnm19zwNR7GYqq4qX3vYxvCJRaqqfRXVfi0vt7dCy9bDex5pQCDH4El
         l7E3UqiTrnc9dRTCGxOC49LpriVreAYY0kqiNoB9Zf+QyHy+hXf6S5GpNt3F2+JHt8CJ
         iGL3IydhAC0Sx99jQpk9XUucLXiSoIJggdDGQjj9sdOfGt6ySHyUYH+EILlYg+A2y3O/
         kt6g==
X-Forwarded-Encrypted: i=1; AJvYcCWma0No2BKiXSUazkAOpt+GGaDsAyKSS0uIyDL7uwnY86hF4jH6X4IF1knwN2u+VytNXdfan8s0G2HxqfPJThCWMFFmQQ8eYef7Qtk=
X-Gm-Message-State: AOJu0YxGUciF2XhJNEtkt/ZZd5FRvPRkNPIxY+ikft+NXNkBtMXhs4lb
	ryP268DTz82wiv1ingpAQhmTKPRcSgmPsAdVTF+X+E7EiuNj32ck5p7TVPMMkg0Jq/ZIEgqRKnm
	jHQ==
X-Google-Smtp-Source: AGHT+IFF0xnH9mxKt9+J6yzyTH4iIZaSR7Uvn/WBkAIEUpAtR6tteAQmKelpqFi5ydijF3ILWmUuKA==
X-Received: by 2002:a05:690c:6e0b:b0:622:ccd5:3fa1 with SMTP id 00721157ae682-62cd55ccccemr7569787b3.12.1717710180670;
        Thu, 06 Jun 2024 14:43:00 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62ccacbc39fsm3987317b3.25.2024.06.06.14.42.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 14:43:00 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-df481bf6680so1628240276.3
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2024 14:42:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW71S6KqnYRD1XJnpjgbF7GqYdxdvzIyL9hy9EMeEfQ/Co2TOSejRP2izjDb8rjRxL7cKF+n+4+kgZCmp+DMuFLWw+8TKgYam+v06g=
X-Received: by 2002:a25:874e:0:b0:dfa:9aea:29de with SMTP id
 3f1490d57ef6-dfaf66e63a5mr669440276.55.1717710179248; Thu, 06 Jun 2024
 14:42:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ-JD0YbaZaB-iB_HkqjA5EZmzcj4MZ1FBqwLFv5PGQDpy6hhQ@mail.gmail.com>
 <CANiDSCtkjcvMqL5wN_CkFHbs_0f=f8c80zYjSpuCj9NNHyUAhA@mail.gmail.com> <CAJ-JD0ZhaOy_H=zP76=GA9Tf+cnJxfAQOcDZdB7BEumf2jB8zQ@mail.gmail.com>
In-Reply-To: <CAJ-JD0ZhaOy_H=zP76=GA9Tf+cnJxfAQOcDZdB7BEumf2jB8zQ@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 6 Jun 2024 23:42:43 +0200
X-Gmail-Original-Message-ID: <CANiDSCuaFG9Rm8hXdD2QKF6sj3gOgsiqQ8iWFyNQQxvN6M_dfg@mail.gmail.com>
Message-ID: <CANiDSCuaFG9Rm8hXdD2QKF6sj3gOgsiqQ8iWFyNQQxvN6M_dfg@mail.gmail.com>
Subject: Re: UVC device not listed in Supported devices list and is not working.
To: vdm736@gmail.com, Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, 6 Jun 2024 at 22:12, <vdm736@gmail.com> wrote:
>
> Hi Ricardo,
> Thanks for prompt response.
>
> I used Cheese and guvcview applications. Both of them show the message
> "No device found".
> lsusb command shows:
> Bus 003 Device 003: ID 041e:4095 Creative Technology, Ltd Live! Cam
> Sync HD [VF0770]
>
> Below is output of dmesg command regarding my web camera:
> [25837.672097] usb 3-2: USB disconnect, device number 3
> [25886.880046] usb 3-2: new high-speed USB device number 5 using xhci_hcd
> [25887.125008] usb 3-2: New USB device found, idVendor=3D041e,
> idProduct=3D4095, bcdDevice=3D10.20
> [25887.125014] usb 3-2: New USB device strings: Mfr=3D3, Product=3D1, Ser=
ialNumber=3D2
> [25887.125017] usb 3-2: Product: Live! Cam Sync HD VF0770
> [25887.125020] usb 3-2: Manufacturer: Creative Technology Ltd.
> [25887.125023] usb 3-2: SerialNumber: 2015022758232
> [25887.135812] usb 3-2: 3:0: cannot get min/max values for control 2 (id =
3)
> [25887.767654] usb 3-2: 3:0: cannot get min/max values for control 2 (id =
3)
> [25887.769434] usb 3-2: 3:0: cannot get min/max values for control 2 (id =
3)
> [25887.771620] usb 3-2: 3:0: cannot get min/max values for control 2 (id =
3)
> [25887.772591] usb 3-2: 3:0: cannot get min/max values for control 2 (id =
3)
>
> If it is not enough I can send you the whole dmesg output.
> I filed the bug for that problem (bug number 2064882) which has a more
> detailed description. They refer me to support.
Where did you file the bug?


Can you try this:

dmesg -c
rmmod uvcvideo
modprobe uvcvideo trace=3D0xffffffff

and after that share the output of dmesg and uname -a


Thanks!



> This is actually a known problem. If you make a Google search with the
> line: "ID 041e:4095 Creative Technology, Ltd Live! Cam Sync HD
> [VF0770]", you will find some information about this kernel bug.
>
> Thanks,
> Vadim
>
>
> On Thu, Jun 6, 2024 at 11:08=E2=80=AFAM Ricardo Ribalda <ribalda@chromium=
.org> wrote:
> >
> > Hi Vadim
> >
> > What have you done to test it?
> >
> > Can you share the output of dmesg when you connect the device?
> >
> > Thanks!
> >
> > On Thu, 6 Jun 2024 at 16:40, <vdm736@gmail.com> wrote:
> > >
> > > Device ID:  041e:4095
> > > Name:  Creative Technology, Ltd Live! Cam Sync HD [VF0770]
> > > Manufacturer: Creative Labs
> > >
> > >
> > > Vadim
> > >
> >
> >
> > --
> > Ricardo Ribalda



--=20
Ricardo Ribalda

