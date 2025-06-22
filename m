Return-Path: <linux-media+bounces-35539-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2ADAE2EA1
	for <lists+linux-media@lfdr.de>; Sun, 22 Jun 2025 08:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5600C3B694B
	for <lists+linux-media@lfdr.de>; Sun, 22 Jun 2025 06:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAB921946AA;
	Sun, 22 Jun 2025 06:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q47gAs/O"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B5F347D5;
	Sun, 22 Jun 2025 06:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750574179; cv=none; b=OykBu/mb84h7Llp85ImwaNluu9H1DmtAOzVNTJOn5RUpdQtMRTzVscRH+35f+bPcDLAqllOZf3P7HTH5rNEd0yapad+WdeylDvt2+H0H+HQM/A2n1UST0G7cXStEiqGpJjITD/97xlbzssL6n6p428VdQRnyJ1PdnETJLTyxiJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750574179; c=relaxed/simple;
	bh=PZqo15rE3h+XT1t6UwJXJ9LADYPiTh0vUkhWJ9S1hFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bqdn/v+cea/pKK32QiZ7MlIEi3a4Yo+BzX/vYUj1GvZX8gTUZ90w6XqXwDv7bvuqMdT3xEYLZwaL0MiA9A0v7MyIsaJUUG2drT34WtbApprqG43PMKxUXxS4Or0TxjmpCFqS3QhGb+rG9PTMDRu4/l6JRXpEGcw5lnojHfXo3K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q47gAs/O; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-70e7ebc21d2so1072547b3.0;
        Sat, 21 Jun 2025 23:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750574177; x=1751178977; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzD7pRtS55YhqOklNM425lZiJRQ0GtjKMB2DT0SmYpA=;
        b=Q47gAs/OrfT05ZsSY+KVPpgjwGv1bY0zo+NB2ftL/O8vJuEOE8SKphqecJ7hUvtY46
         Xc+DZx5X36U18vAgRZT5Mc43qr+P8FZyqjxakrbYjKQPtI1ZhimDNyYDBdFZjkEy2wZB
         tQuBajKReYaMC9Wcq6U9N82zyr4E/qyGHathDuo1rrgMoYWTxC9EsjXxpAuOS4HDKatd
         mMeCj7te4qZ2kKkIMVl/0PtgDe7PBmqTXTpSxEGs3Hg7TkHBwVbZwnjg9kZqsdpWku4l
         5JaTZamp2Gp4r9Y7orA0gnGLeOQrrTjqudaNtsN34hbo+6r9J134oIaghyPA7nlBpkSp
         Yl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750574177; x=1751178977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzD7pRtS55YhqOklNM425lZiJRQ0GtjKMB2DT0SmYpA=;
        b=nnAFeO1F91X/cwQ5mdZNV1NRUwaK42xnI1Or1ynWNRw+GP6dZm1WCiABmAK3PE5w9v
         F+FFbNrYj4TIaU3zVixwiJd/FAxvOM/K02cI70kiogpGwb+j4FMXjx8ccqZJICIXJWko
         XHY/0D+rzEYajgjydILfhjbe36VClQZdrTIj6rsAPFSYIgwdd2SjHrBF2ZncvoqEFfQ7
         VuqiYZ7WGwpyznYxSu68p5kGOGgPqVDmrdQtgv3iAgciNx5ZScLazYbGGNFXMOuAI2an
         P8UDBaXsg11+avjZIAdvvd05WmYHkB+FvmTpBJqju2cvwlhJMg3e2TKPVUTuYex/5zj5
         DY+w==
X-Forwarded-Encrypted: i=1; AJvYcCVmVoOQU2oY+GBZQ4w6+6tiHnxGjxLlkMv1nxZw42kHTkOskJcrGdeH24JE3DHxBuDdlc4c6fdEHcQNU50=@vger.kernel.org, AJvYcCX3kKnBC74MhMWPystcwJrK3WoM0B64AauMWF9vESgfyV0WJNGhH9Sc8rbGBIRf0p0c+789EmgxQUdzXAM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4PR9inzy5aqCyHD3pJlzzs4gZ+hU1GNdNEWOTU9zJpB3GZ3Kr
	acsihEHCJ8lGfG8LgSIcS/aE53ZlbEEUIs/AkU63kAw9iIR3AII8Jww5ZV6A4cZA8uWeHUMFU/y
	HdfGTY3Hw3mT59eLeq7BHSc4KO3Yhuz0=
X-Gm-Gg: ASbGncvxiB5jiwzEMJJOPFVIUQFHefVoCgW3z9VjwMpS7z3CnK25c45qZ8GqZs8YSXq
	2u+I90gpkx8M/2hTp9C2OUpzl1PAvJus+hU9b9uHLtBV6W6npfwA6ZiJgLjbV2KxC/ZZE2YLMy+
	O03iGzjZHB0oq7UHN/OO1q1j10WN5KzoWz57OmhP7QHw/xYQ==
X-Google-Smtp-Source: AGHT+IGSVFJ6FBVy4wd4wNXb58fhsghGVUPG5VHLiYXGX0otXbvmB94A6oX3E65nXtKfNXK2/ICjCd87kazL3IE3W+s=
X-Received: by 2002:a05:690c:4b10:b0:712:a286:2ca2 with SMTP id
 00721157ae682-712c654cc21mr57287357b3.7.1750574176471; Sat, 21 Jun 2025
 23:36:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250621062944.168386-1-abdelrahmanfekry375@gmail.com> <CAHp75Ve3PWgkwncVv5tGxzjWkF+Nodtp=Q3dpCejfSRD1BFMig@mail.gmail.com>
In-Reply-To: <CAHp75Ve3PWgkwncVv5tGxzjWkF+Nodtp=Q3dpCejfSRD1BFMig@mail.gmail.com>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Sun, 22 Jun 2025 09:36:05 +0300
X-Gm-Features: AX0GCFthVu5QuHF_fiQfBvZwypdl2HGtpBjqpLtf1jAkutvlchtXvgCPrRQPSG0
Message-ID: <CAGn2d8NgZ1YMj3eSsujWjF6ppwMkOTJLvk2hVcXfUdkyq5TdyQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Replace scnprintf with
 sysfs_emit in bo_show
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review
On Sat, Jun 21, 2025 at 9:25=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sat, Jun 21, 2025 at 9:30=E2=80=AFAM Abdelrahman Fekry
> <abdelrahmanfekry375@gmail.com> wrote:
> >
> > Convert buffer output to use sysfs_emit/sysfs_emit_at API for safer
> > PAGE_SIZE handling and standardized sysfs output.
>
> ...
>
> > -       ssize_t ret =3D 0;
> > +       ssize_t offset =3D 0;
>
> It would be good to move this...
>
> >         struct hmm_buffer_object *bo;
> >         unsigned long flags;
> >         int i;
> >         long total[HMM_BO_LAST] =3D { 0 };
> >         long count[HMM_BO_LAST] =3D { 0 };
> > -       int index1 =3D 0;
> > -       int index2 =3D 0;
>
> ...to be here.

noted , thanks.

> >
> > -       ret =3D scnprintf(buf, PAGE_SIZE, "type pgnr\n");
> > -       if (ret <=3D 0)
> > -               return 0;
> > -
> > -       index1 +=3D ret;
> > +       offset +=3D sysfs_emit(buf, "type pgnr\n");
>
> This changes the behaviour in case the sysfs_emit() fails. Not that
> this is a big issue, but it should be pointed out somewhere.

noted , will make a comment about it.
> ...
>
> > +       /* Direct return of accumlated length */
>
> accumulated
>
> Don't forget to run a spell-checker.
>
noted .
> --
> With Best Regards,
> Andy Shevchenko

