Return-Path: <linux-media+bounces-35554-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBC4AE3214
	for <lists+linux-media@lfdr.de>; Sun, 22 Jun 2025 22:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A618188E013
	for <lists+linux-media@lfdr.de>; Sun, 22 Jun 2025 20:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F92D13AA27;
	Sun, 22 Jun 2025 20:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIp1WzTO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338B330E841;
	Sun, 22 Jun 2025 20:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750625560; cv=none; b=oGwvvtukHlVxbmZOfWEpaC+DiO1gjP3DLTAdCMfj5bZwvy8scgYOoYp6D5dR8FSUSu6K92w9w+hsRB1ks48TcrUENDyz/MB+H9Mw5FHKfyGEV+BJkIHre+SWdriwoJ/bNsE4GlWa55t0hkFZ3BXYvRn/HJy1oG9aBzGjrcs+PZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750625560; c=relaxed/simple;
	bh=R2UBeNBYcULuRw2pi59GwqeuYVxQopy59/u5SIVP69Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CKrI+1jIUAHKWAgQt4A0Ychs5/oHDCQOGcOKiRNNFHDbl/VW24c7bpvRqnwWmNvbF+BE394pFmXtI4m1andfNlfY7Q74v3WjkX5BPgnznQ1Mdz+b1sRL5rg8r7iTzc6RVzEzGGzx3KB0DCWpLPdyh3qYdE2odhjh4AmwsU77NeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIp1WzTO; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6088d856c6eso6845577a12.0;
        Sun, 22 Jun 2025 13:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750625557; x=1751230357; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAf+0jG0AUw6LWitXHvxoj49OUYpodhaHnqwUI4Oedg=;
        b=JIp1WzTOM5xh9KOZ0S3jPBHITbMJkB7zmceB3DABa7ynQHwIh5zxDVlBpNyoL0Cw6a
         8tdTfQ5DJaUHOlUcCQYPo+ESwVj8ycuFZ00WbLBtca7p9riC78/MvznRvbIbNMHFn8Ij
         xi9Uptzwu5p4NWnqMB4P09CtRHt6g7je9cFtlDTVxqxNeXl0Iv2vXOZkbFwAgLoXEnVV
         QPPi7BVT/zK8TYXkKRmRbWKI4ePQ/1WvphKyBW/RN5UmGkkm1T4h2HjRdEQhjYuRhw2f
         0r60EpDepQR3PjIqZPfNe3ARRqPEBICW98R5bCyXcB79ZNL3bO39fkJNFIDzTFAhdH8a
         RC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750625557; x=1751230357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAf+0jG0AUw6LWitXHvxoj49OUYpodhaHnqwUI4Oedg=;
        b=UJaqkazha185pmzxNJ3W19qUjSNiDu/DlmsVUSkKvDw4WoE4QN0Siww1FwW1rjx2J8
         o+ixr+55JsHj3dyq+liEvUITbjwy/i8K+kaUJGswh44zucM3IacJ+r/T+WcnmOXsihes
         yDGjnTZyDTZdZKgoV2Pg+5cio7hzU/PPpZ6OnzOAD1gtZ3Hvsj9jpd7S1YRjERTpfs1O
         G17uMpa88hAC6QhOuk/y0nsZIXbwPKWsJGCFCu9H1+zL6s5A0WsZ27uEQglxyb5241LS
         nPJfTC0nQW3xwyeVXsSdFsuqoLqkgNotOeEslEDZkwdiOrtvuDccvBkpJ3YchgsGWAYk
         qrsg==
X-Forwarded-Encrypted: i=1; AJvYcCVrewS16xLHVdboO41nDulG6uaGFdlgBRjMRVvHVDI7363sBb2NmKxVKGpjcUxNRhb6km57qFzlwNavv6A=@vger.kernel.org, AJvYcCXt535wp4yxaka8+djHTaJK90Obib6OdWhb65rm/T7WZJNrQaMAQWTjW5nzhCY6+8CsdBlsbo1AxKxea5I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKQUc1AU309/PFdMTiVL7VzGVtPl0RoQB8xN5RCv+xb8nmGcIb
	N4SvLbIdnYkdMBl5qiTP6o8vSMRLbm1Gz9GTmBpAczq73tJBz+4rPT9f2Gs4U6L5IANa14LfVCH
	FRl+RLpDVKEw63IM0vyDm8JrYulS+KLs=
X-Gm-Gg: ASbGnctyCmNPUhgOpYzbJIXPFy0kfAVzIScNg8BFlK8F2CiYF0c568Hgm4KNMYu6ead
	6BZso3/XqCyNkBJgqVxDsAXm0f7+VXul0yFsLltoHrKyC3340eMd3g1BRsf3VKoPBF2l4eRCu+C
	vBMV9ZKE4SKq/4zwd2BpAIxi/S7gmPRzA9+t5msoUhPuM=
X-Google-Smtp-Source: AGHT+IGE0Nm84BxJVBfgJK7xoWrkgP+TXpOyV781uNHUxD8p6X5GCK+FLDCNi58BLWcAV/v5kSnIkOElD9c6ZKvhD5M=
X-Received: by 2002:a17:907:7e8d:b0:add:ede0:b9d4 with SMTP id
 a640c23a62f3a-ae057413febmr908334866b.0.1750625557391; Sun, 22 Jun 2025
 13:52:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250622065340.184048-1-abdelrahmanfekry375@gmail.com>
 <CAHp75VcKQGvcgv+72=9CY9yvvmzTDUaiP8xZZzQCyd553_tqYw@mail.gmail.com>
 <CAHp75Vc7=WYeay0xsvVd5NZ-mm+WdU1LrzzFAE1GrdpzH2JjEQ@mail.gmail.com> <CAGn2d8M9_NG5f1gpksdrMkUs_0Q2LBS=qAZeAciF9-j38Nq6Nw@mail.gmail.com>
In-Reply-To: <CAGn2d8M9_NG5f1gpksdrMkUs_0Q2LBS=qAZeAciF9-j38Nq6Nw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 22 Jun 2025 23:52:01 +0300
X-Gm-Features: AX0GCFu3kMpWblYdOlAmUTNgRy6pJxasbC-PUTWd-9zbTQa3PPPKPHbfsp7-CUA
Message-ID: <CAHp75VeTbMORBBd0N65w3m4nZ8s6GUKaK8u40P_+Ki8yPPyCxA@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: Replace scnprintf with
 sysfs_emit in bo_show
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 11:42=E2=80=AFPM Abdelrahman Fekry
<abdelrahmanfekry375@gmail.com> wrote:
> On Sun, Jun 22, 2025 at 23:39 Andy Shevchenko <andy.shevchenko@gmail.com>=
 wrote:
>> On Sun, Jun 22, 2025 at 11:37=E2=80=AFPM Andy Shevchenko
>> <andy.shevchenko@gmail.com> wrote:
>> > On Sun, Jun 22, 2025 at 9:54=E2=80=AFAM Abdelrahman Fekry
>> > <abdelrahmanfekry375@gmail.com> wrote:

...

>> > > +       /* Changing to sysfs_emit changes the behaviour if failed*/
>> >
>> > This comment, besides missing the space, is useless here. You need to
>> > use the comment block for the proposed change.
>>
>> Also the text of the comment is a noise. You need to explain better
>> what's going on here.
>
> Noted , so the comment is enough if well written or i should do something=
 else?

First of all, it's a bare minimum, which means that you should go
deeper into the code to understand the issue to begin with. Second,
the comment should be put in the proper place. In the code it's
useless as it describes something that is absent in the code for odd
reasons. Talk to your mentors and ask them for help because explaining
more is basically doing your job for you. And IIUC the purpose of
mentoring is to make sure you learn something and have acknowledged
this in practice.

--=20
With Best Regards,
Andy Shevchenko

