Return-Path: <linux-media+bounces-40709-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD902B30C58
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 05:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFF1E176EE6
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 03:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BE8A2777E8;
	Fri, 22 Aug 2025 03:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gj4/G62q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA10122127A
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 03:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755832281; cv=none; b=YKoilrbUs7JXwZpAEKReCJSMFCc3yKDxVtvI0C5i7MFddzhdU8GC2aZT5o5z8AZaZl0IcYmnOnhQhHkb0cweedqY1ieoHS0ipWC5fIHcZcQ4L8FIxpuYliJFynAfo0grg5h+GHatMgjdQEypwqTLmhtTMV0Kj/Xch/tWikh0Uwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755832281; c=relaxed/simple;
	bh=Qg0tKoyStlqwSRv0HhTWh/TwyYqr/JJMQJP72gTLj9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YVEEPxYji0l+X8rZ5QbAgVFvpquhvdxSa3xw28CGlFXsmtXfcNUhH6Yj9FAbJq+efCAwdrwcKeH7dtiwIVh7qDTOgv7sp+ak5IFL8zuTvky5nnGfDaaMitpe48GkjMNhzzFmO4311lIHr2SZDXstGvsiHfoyxIlHA78SmNXHUW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gj4/G62q; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-71fb85c4b59so28257637b3.1
        for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 20:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755832279; x=1756437079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5vYyHrmF/bUEegllwDeFAZ8/aIhsfymLG3ivU9KTho=;
        b=gj4/G62qMV4JsMWg03lFbqaXdcH8pfrn1QgpknR40Vqy/M1iDROZ8WyVrJ/jQgmQIp
         1IfvLaxUA4eNmQf3lQMVfsVVioEzHqkohxKuUKfZjB9CGlwrFF4fxgVijWKRa616BzHm
         XkUYG7lUC93hUknfWSxWFMkBCNp8fyKAz7hMZF7d7DO/WzEiMBTnXOHkiXzn3u30yUKs
         F5n+Cz3cjXNpFs22xiNIriMoiRplHnjSz5QKUM5ijCPeTjnqDKVmzZozZyA4M1JXO95I
         CKZEkYJCnyQE4essGopK+mVtrQRU0pKIXRc37s2HRzy2ZC/rJhnloF3igmys+1Y2jbgv
         9Qqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755832279; x=1756437079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G5vYyHrmF/bUEegllwDeFAZ8/aIhsfymLG3ivU9KTho=;
        b=PqcPpNyxKw2KStrou3bONwrFDlAeyrKr+p6C4Y8qXbRVL+MMaQbOz5T7NbCRgVIH4n
         5S1RiVPQdFhbomFkiVmsqgYFldq8Z4SqNnm7sq0/6GTZtCVJo+eOB1jnumRHzS9IAtkr
         wVTYJTcNFuYfsdsbkFhqMIHy5z4nx5gW2rR11tNpwyoCzir7bBjwYZ/EAqzCG28ZIPBN
         ZxzLQHFEpS9EeREjtvp9MAI/6b5ozWojsUoSDNxz0MfqzyahGi6+2Uewr2D7Tv+bhAkM
         L6LfVFXWeRmapYeDWQLg6qM9Dn35n+YO+9CVVchVQdIhWfobmHhccechkZZzBkGdsvhH
         PsRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUc53pdkA0Ky42O/RsUoxPAJCAT2Z1v1iVrz5kZBXvO9Pc8W/wvYZWdzuAALuxNZ/FCnPehH3iDqp4kcw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+GUVrtZChqylnNg/5iqK1pAjPhvdAKCHFrkYNnPZsxvWHwxr7
	4DrvTDBdf0M42l3azP7NSq61nocr673ahDmBX8yRDHuC987ImvUHeX//6/sCkj7yYTnyCZvrPFW
	9SbV3K8eTrzpxTelcpp9yAYb0tuXVsyo=
X-Gm-Gg: ASbGncvc/fci0Z5824E9RLPAu20wGFoCM1Pcj61YYgMMcysQbDarTZkn+oeVdaOsVPP
	gkEEf0m/CXs/WVzK6FI2Bs7GyOOp2Xica90JO6OAivE+WOLwRKRDzSSeGdIMYgQlkTfzPm9uAI4
	gbTd4WSokpKx0qQpSQSTnRcSFZ/DB5eLqCyQWqrck07U8CuZxGP5XIIRDCbRvOwr73vphuKIkZS
	FnuQ2g9AzuTemmRKVyqRw4aPsrZ0bmV/O5WJNE=
X-Google-Smtp-Source: AGHT+IEt8PH9/sXqPDbYtckv5kTTfLPn5oKJHWIGi/sdlPO8MD6VYwtNnxskjLMg1Cft09p+xydf65liGokfDREYBRE=
X-Received: by 2002:a05:690c:8e07:b0:71e:57bd:f2a with SMTP id
 00721157ae682-71fc9f6b0f7mr44681547b3.21.1755832278410; Thu, 21 Aug 2025
 20:11:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250818093159.612208-1-chandramohan.explore@gmail.com> <aKdWnKdSDs2j73F-@valkosipuli.retiisi.eu>
In-Reply-To: <aKdWnKdSDs2j73F-@valkosipuli.retiisi.eu>
From: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
Date: Fri, 22 Aug 2025 08:41:07 +0530
X-Gm-Features: Ac12FXyI8CJxEnrdzUP15elpoDm4F6JwNduF5hnyReTTklvEz5zEGZlo0cj4N6o
Message-ID: <CADBJw5bgK9Hcs3SwB0fU0yjiAqD1OZvc5RQT+yVHRAX7EjCG=g@mail.gmail.com>
Subject: Re: [PATCH] media: v4l: Fix dereference before NULL check
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: alain.volmat@foss.st.com, mchehab@kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, shuah@kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari Ailus,

Thanks a lot for your review and suggestions. Sure, I will choose an
appropriate subject.

Thanks,
Chandra Mohan Sundar

On Thu, Aug 21, 2025 at 10:57=E2=80=AFPM Sakari Ailus <sakari.ailus@iki.fi>=
 wrote:
>
> Hi Chandra,
>
> Please choose an appropriate subject on the next time, this is missing wh=
at
> the patch is for -- see git log if in doubt.
>
> On Mon, Aug 18, 2025 at 03:01:57PM +0530, Chandra Mohan Sundar wrote:
> > In 'stm32_csi_start', 'csidev->s_subdev' is dereferenced directly while
> > assigning a value to the 'src_pad'. However the same value is being
> > checked against NULL at a later point of time indicating that there
> > are chances that the value can be NULL.
> >
> > Move the dereference after the NULL check.
> >
> > Fixes: e7bad98c205d1 ("media: v4l: Convert the users of v4l2_get_link_f=
req to call it on a pad")
>
> Fixes: requires Cc: stable. I've fixed these this time. See
> Documentation/process/submitting-patches.rst .
>
> > Signed-off-by: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
> > ---
> >  drivers/media/platform/st/stm32/stm32-csi.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/medi=
a/platform/st/stm32/stm32-csi.c
> > index b69048144cc1..fd2b6dfbd44c 100644
> > --- a/drivers/media/platform/st/stm32/stm32-csi.c
> > +++ b/drivers/media/platform/st/stm32/stm32-csi.c
> > @@ -443,8 +443,7 @@ static void stm32_csi_phy_reg_write(struct stm32_cs=
i_dev *csidev,
> >  static int stm32_csi_start(struct stm32_csi_dev *csidev,
> >                          struct v4l2_subdev_state *state)
> >  {
> > -     struct media_pad *src_pad =3D
> > -             &csidev->s_subdev->entity.pads[csidev->s_subdev_pad_nb];
> > +     struct media_pad *src_pad;
> >       const struct stm32_csi_mbps_phy_reg *phy_regs =3D NULL;
> >       struct v4l2_mbus_framefmt *sink_fmt;
> >       const struct stm32_csi_fmts *fmt;
> > @@ -466,6 +465,7 @@ static int stm32_csi_start(struct stm32_csi_dev *cs=
idev,
> >       if (!csidev->s_subdev)
> >               return -EIO;
> >
> > +     src_pad =3D &csidev->s_subdev->entity.pads[csidev->s_subdev_pad_n=
b];
> >       link_freq =3D v4l2_get_link_freq(src_pad,
> >                                      fmt->bpp, 2 * csidev->num_lanes);
> >       if (link_freq < 0)
>
> --
> Regards,
>
> Sakari Ailus

