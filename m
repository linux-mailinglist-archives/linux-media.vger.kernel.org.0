Return-Path: <linux-media+bounces-49267-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C31CD457C
	for <lists+linux-media@lfdr.de>; Sun, 21 Dec 2025 21:21:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 672D03006A53
	for <lists+linux-media@lfdr.de>; Sun, 21 Dec 2025 20:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C801A31D39A;
	Sun, 21 Dec 2025 20:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0xgFPw8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A0E303A30
	for <linux-media@vger.kernel.org>; Sun, 21 Dec 2025 20:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766348496; cv=none; b=VOQdQlM+mVrmx9pkwA6ytWPd9AvTrUDtJFJVBNImrH+rpIO7jSz7BPNOIG4Sa5Kzq96SrYuKSveCyxXIh91t2tNunjDpm31RFK1OvJaVIpeN4OA8HxnhCgEF5p5t9r9l5gK0pMpj8M2hSCvRfrkngGfbdJq/c2+aOayvRX3fdC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766348496; c=relaxed/simple;
	bh=oBKhzMp1hJ+73v6az/AvdfXpPOexKidE3xEhruqtk7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BQQdXmHzl0CNsyYcq8zSyicToXa7G5G2nOvivBESTsNKcblyTuGFAc3ZPuj+vXNE5hru3KKj1rUvNWvqLhyoQpXJpW/FGGuRKN+4MSbFUbhQYtzTJ/ll9SuWG6plzvkCIParhesodacshpGdSIg+zh9vIkZ8Rrw4m6Q07uBEK5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E0xgFPw8; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-941275fece4so762197241.1
        for <linux-media@vger.kernel.org>; Sun, 21 Dec 2025 12:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766348493; x=1766953293; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oBKhzMp1hJ+73v6az/AvdfXpPOexKidE3xEhruqtk7g=;
        b=E0xgFPw8iafHnrsjP0rhYplaBIuXzlTto5AKv/BBvhHScN5fkiJeSoB7ZuG7Xiutg+
         9kb2hsDvnbRegUPqkILF4bCIjsEpUsE50GuTI9H5Zrmw1Yz7CmEUcFdGzPNR87fJeX4c
         5Pj83JxEC4yAzkauVYJmqCafwr6fCc8ytdZvFjzVKAbHfGG8FRGWmio10ZBfwUYPqBaZ
         MiB+NyIySUbu6o89ylPt8HQk/lhIe/EQQFVk+aGEjzyXQUpHaSHNRgro1lTdovywLOYQ
         xTYS0Zu7Lmr3n7/mjTOjdBe5LFEyfCh/O3BNFjEH2o1/fj2mGiEdJsq93g/2XJUMvnQO
         hXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766348493; x=1766953293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oBKhzMp1hJ+73v6az/AvdfXpPOexKidE3xEhruqtk7g=;
        b=qczK+h7yxVuzilQ/OgDmnoIVzgSaCCUQTMblWIH71j0PRtGm4OFWUMhAEQ+QRf0noG
         ynluVrgfyX1qOke9THiD86yOpOTIP2FtKgAJGLTCvKSEvVa26en85diBgDzNCipGB8mi
         TF1nMCsfRiecXhAXBgKT8eHIrbrP8AASeFKKo+B/iewgTxvC+oaYm8U7qBSECATw4YRq
         kNSLAV6UUXfdlVovIB1NnW2Y0JdArf8oZ84NtqKuU7cKyxS5rek8EGd4JLwnbH++h5RZ
         nimdW/4PyFNIDddt9bKb1ozIsx3Me1FPd38z81HDwlNTTtcjciecgUJVdR/zc9XqVsoF
         5HpA==
X-Forwarded-Encrypted: i=1; AJvYcCWpqYRqCQcOS3yE7X3NIs01Ko7nDo/RBJIw0veJUgLS8quP6DIO9lH64j8I7TFgo8z5/zKh8W0wCeqonA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMenFM57i1UYIPUst2YivaGZC7Kez2UtnGh8dU6bJP/0uj+bVJ
	YBkqBNJoH9MtHaiTXLkvSaf87KkZoX+jK9+wKYCRD2I8mTmiD+unebFeEjy6e6bm0F4bpc8ETly
	mx9/6AuPAp+qPf6CXIi45TrLWiFmg63A=
X-Gm-Gg: AY/fxX6lAZWJFtPDTgpCt6MSuxg8mcUW6T4C1lI5Od3UGNP+wHq/Cf9nm/FVnOlBWAh
	V5ycuHhYmSfGGpb+NJeC39S4725UvnIlmcCj2ZCPvujE2taPyEX1tUx4YfaqNKUUJHv8hoicc1x
	+70EAat4BVCUFUpuqKfMzMtqdvgSm/uTuPs5pMCbCd/kGg/f24pya/J1EFKZcoT+DnxHCNeVqEa
	zadViyyl3n0xhPE/JIRw3PfrAO8xa2rv37DXnTM0hSHFyQP/FurFPBOF+tAd8LXe+OHe3D9
X-Google-Smtp-Source: AGHT+IGNX1KWbZW+X7Vu15e4TEYmG9Apb1dHFJoi0iVd5B9bGXq7NXXGKMpqsLn+MLQypzG1QRUM0+5drZSihC+idZU=
X-Received: by 2002:a05:6122:1ac1:b0:55b:305b:4e38 with SMTP id
 71dfb90a1353d-5615becda17mr2970598e0c.19.1766348493341; Sun, 21 Dec 2025
 12:21:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1766123192.git.alex.t.tran@gmail.com> <6f34ec79ac21d5ab9ad3fafe34a0bf6aca49a10d.1766123192.git.alex.t.tran@gmail.com>
 <6d5b7422-e1b6-4bfa-8dbf-e95c3dd19f57@kernel.org> <20251221-courageous-subtle-sparrow-75fa52@quoll>
In-Reply-To: <20251221-courageous-subtle-sparrow-75fa52@quoll>
From: Alex Tran <alex.t.tran@gmail.com>
Date: Sun, 21 Dec 2025 12:21:22 -0800
X-Gm-Features: AQt7F2qNWWuw8hvJljHA_XYIMEaC2niJuQ426cQJS7n2EFrxa2gnNdLbe_mL-3Y
Message-ID: <CA+hkOd71SszRFyoxaPDMMPH-JnJLfeL_8783EX_3V-6zps-wAg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] media: dt-bindings: i2c: toshiba,et8ek8: Convert
 to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, pavel@kernel.org, sakari.ailus@linux.intel.com, 
	mehdi.djait@linux.intel.com, laurent.pinchart@ideasonboard.com, 
	hverkuil+cisco@kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 21, 2025 at 7:01=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Sun, Dec 21, 2025 at 02:15:10PM +0100, Krzysztof Kozlowski wrote:
> > On 20/12/2025 21:42, Alex Tran wrote:
> > > Convert binding for toshiba,et8ek8 from TXT to YAML format.
> > > Update MAINTAINERS file accordingly.
> > >
> > > Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
> > > ---
> >
> >
> > Please use scripts/get_maintainers.pl to get a list of necessary people
> > and lists to CC. It might happen, that command when run on an older
> > kernel, gives you outdated entries. Therefore please be sure you base
> > your patches on recent Linux kernel.
> >
> > Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> > people, so fix your workflow. Tools might also fail if you work on some
> > ancient tree (don't, instead use mainline) or work on fork of kernel
> > (don't, instead use mainline). Just use b4 and everything should be
> > fine, although remember about `b4 prep --auto-to-cc` if you added new
> > patches to the patchset.
> >
> > You missed at least devicetree list (maybe more), so this won't be
> > tested by automated tooling. Performing review on untested code might b=
e
> > a waste of time.
> >
> > Please kindly resend and include all necessary To/Cc entries.
>
> Odd, I see this reached DT list, but was marked by one of my filters.
>
> Everything seems fine, so apologies for the noise.

Originally, I sent the series forgetting to Cc the devicetree list and
the CI notified me about it and so I resent it accordingly. I wasn't
sure if it should be labeled as a v2 since there was no content
changed in the patch series (just adding 1 missing Cc) so I sent it
again as a v1. Sorry for the confusion and thanks for the tip on using
the b4 tool. It will reduce a lot of mistakes made like this when
running git send-email and manually inputting each maintainer and
mailing list.

--
Yours,
Alex Tran

