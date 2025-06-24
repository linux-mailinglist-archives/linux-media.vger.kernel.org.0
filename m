Return-Path: <linux-media+bounces-35810-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B76AE6CFC
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 18:54:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B4093A2BC1
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 16:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A192E3B16;
	Tue, 24 Jun 2025 16:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwQ8H5h6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409B126CE3A;
	Tue, 24 Jun 2025 16:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750783886; cv=none; b=hk6IX4EVzT2S5TpapGWH+nsBeymEMHKS3FrMUuypHx7zxDxNFpMw26u96jw8j0zWQZXd8C2jn9XnosLBQtmndU69njFj7FfFF5X71NeFQtnYnF0UFu5aI2Cr2EGbdFn2SQGWNr144LqkXPkPL/pgXbMMkhuDvT8Jj79UZtzVUgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750783886; c=relaxed/simple;
	bh=AiSxuv5HxZMNtApOoLbB35JJtKGcdtw9e0HZIZ/TyZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XYuHcBEJ476uItfN2wgilZA4AkZjCn9TXzjCSmPoAcShDXQHfspcuvndHESHjAcAr3PEaOdRxYDxJme6bvNRnGGFShTUsBt/tvCW+WmBTHpIoUdvxhY5xw/l5mgdtWxA+xLQtWmB5onCFXNk5iXlPQUdNk9929bKFt2APs+wn7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jwQ8H5h6; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-70e2a7a2ce6so5781277b3.0;
        Tue, 24 Jun 2025 09:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750783884; x=1751388684; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1aNMblES8+W9zguUJXcCu5sB/4LcjKP0kbkG8Rw2PGQ=;
        b=jwQ8H5h6SndZnXu+xghinLkcXG3OX4fwius4U2UED1qX9lINgZnG0spOoKcpYhVTj4
         C/Hz3rYIC9d4ySrKImw3xbEf6FGCR1QaL9qFQgUGbW/WdYbRhp2uEIdpMCAbn/2gsu0V
         m5vpNi3CiEVkVuKO8KTvv7ma9N/qqU0R6Ov2kaR7GB+c9fL47Yt+J3y2+MYVBNzWmwrI
         LJl6xQWW3OPLBp4vi1w+FgaP6I7Sp9lJ+ZcKOv6qvvXv0ncwNlUlJFXVeozAmj+LDU2e
         Sa/PbccDfc7rV8TAFCACtAtX3HUcWMXvzngBAfeOv5EYh/5X4/nYJ1y65Og+jr/LoRi/
         rHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750783884; x=1751388684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1aNMblES8+W9zguUJXcCu5sB/4LcjKP0kbkG8Rw2PGQ=;
        b=tL4Ozwm86CAYLQne9xkxLxUJcGb2TSKuwwHvm5yhqg57QflfE2kn79uFCHxYdJFm1v
         OGESl+PE+1idTwd2Ja049w5NRYxuCMdYKqs5RhNz6vqeDI1G4/uuk05BZJbzeLgx36bq
         iIHxgnpdRdcadsiZ4SbnOvz9Z8A56tqmqhEpahJxpGBuztHYJsCzjXH3P2wQNJ5eMtIM
         NdMph8kt1kVv0kpwkViwX5mKIoYa9ypeh2yOMd1kc6Qf/T4Bd5mfklP4Sp6SRFVOf9aR
         I7USYHRARXHOwAfH6URkQactYBVyo7OAh5EJnztE9wa5fLGiqI4lc5gq3TjcfIGlKa5K
         gOmg==
X-Forwarded-Encrypted: i=1; AJvYcCVu/NR4OV+sF3tjfDmIe78soxGKsIW91Lo5QG2zhNCdubb+mg8uvhrGwW5GEc6Z4yZ99v20m7LqsK0bAco=@vger.kernel.org, AJvYcCX5z87JJ5xL/sKs+xn8OEpIodogXGhl28sCOg4Vj7G4O7x6g9dSjP+RGaOVJrDSNZmP3jZUgmNArlPybO8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2SwIb7VbzcXUg8eKnPt3CJhw6SfFPKBFWHRUPFKgwEr4GHoQ2
	O0SRATqmvfvVIVSnW4MbSkHC2Ou7unNNsqsYgZAtUXaZxHH1fevtPyCg9oFLMGJajpWfsbhGsoV
	bc0j8pyZgJ2PRi71c2TC7RnLhujO4r39wpLj6znQ=
X-Gm-Gg: ASbGncsCgfijkwo7EXJeaDzEUloZUmXrCy9/ay9gYWtIVzPDfuEtiN4l72BTCFnogop
	0RL+3UNvAbdeYYUn29FSWjf/IrMDH21MElusxsIlSWCZdKKCx9dBT+dX+OEzkKZUIgRPG2GVrYI
	Zuk/DXsx2pHtb86bUcULwZXTD1RTI9d0VVentb8CR22QpD
X-Google-Smtp-Source: AGHT+IFvySyYmmprnpyVyhwpIu4WBOO54IkG3q4Wj4yrofJybtMktjxvro9rxh6SNN1fBpdkveNbK2qrkNRqB/JNu0o=
X-Received: by 2002:a05:690c:9418:10b0:713:fff3:62ad with SMTP id
 00721157ae682-713fff363abmr9550197b3.8.1750783884004; Tue, 24 Jun 2025
 09:51:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624144943.39297-1-abdelrahmanfekry375@gmail.com> <cef03d37-715c-47a8-81d4-0872d505c39b@suswa.mountain>
In-Reply-To: <cef03d37-715c-47a8-81d4-0872d505c39b@suswa.mountain>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Tue, 24 Jun 2025 19:51:10 +0300
X-Gm-Features: Ac12FXxABhb6t8CKkGLO-NpOFkS7LjmlrS7vwFTKrrjOeRsEPArjRkBlf_f3hNI
Message-ID: <CAGn2d8ML8eTcN2G18B7FYkapROnOeAKJir5fJvOXDdXTLY43aQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: remove debug sysfs attributes
 active_bo and free_bo
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 7:31=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Tue, Jun 24, 2025 at 05:49:43PM +0300, Abdelrahman Fekry wrote:
> >  int hmm_init(void)
> >  {
> >       int ret;
> > @@ -130,14 +48,6 @@ int hmm_init(void)
> >        */
> >       dummy_ptr =3D hmm_alloc(1);
> >
> > -     if (!ret) {
> > -             ret =3D sysfs_create_group(&atomisp_dev->kobj,
> > -                                      atomisp_attribute_group);
> > -             if (ret)
> > -                     dev_err(atomisp_dev,
> > -                             "%s Failed to create sysfs\n", __func__);
> > -     }
> > -
> >       return ret;
>
>
> It's really unclear how this "return ret;" is supposed to work.  Was
> that part of the sysfs_create_group()?
>
yes , but still it can be set by hmm_bo_device_init so even after removing
sysfs_create_group , ret value depends on another function.


> >  }
> >
> > @@ -145,7 +55,7 @@ void hmm_cleanup(void)
> >  {
> >       if (dummy_ptr =3D=3D mmgr_EXCEPTION)
> >               return;
> > -     sysfs_remove_group(&atomisp_dev->kobj, atomisp_attribute_group);
> > +
> >
>
> You've introduced two blank lines in a row here.  (checkpatch.pl -f
> will complain).
>
noted , will fix it , and send v3
> regards,
> dan carpenter
>
> >       /* free dummy memory first */
> >       hmm_free(dummy_ptr);
> > --
> > 2.25.1
> >

