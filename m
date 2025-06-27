Return-Path: <linux-media+bounces-36066-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D46AEAF74
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 09:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95A38189FCDB
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 06:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E26121ADB7;
	Fri, 27 Jun 2025 06:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RbMattDY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91EB21ADAE;
	Fri, 27 Jun 2025 06:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751007562; cv=none; b=d+dE6UGk43Otiz3rZOW1uekGFrMjuxQ4xH5CunVlgddVI/LX0NlpQf8YPKg4Q7n9MJlq/Um+t9L/sRandV0d4hP/452xWabF5d9gx0HBr4af8VNOkdPx/ifAmh6nyJs6gA0YcYcIc88nyfflVlotP0s2RbpcbUyjk5vV4RjdYb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751007562; c=relaxed/simple;
	bh=WdWVEfpJgxRMWzUF0VMsgV/Wr9vf2FxeqiqykC9OATQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u5H7wL7sPqH01dw0i0C/1Q1PxnXCYH0+QTn5LbbNSF6z+rvDrhhQl7cYaMEbtWpo9vvo2MVsGpJdWHelWACH6v49674JuhzOxJkq1/rhGhSXFsaCGkH9mXMaAW11hzPVeFHOZvRUFcP7jiLkTjU+Y3Fi3kneXBM/7D4gWMmuXdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RbMattDY; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae0d4451a3fso289658866b.1;
        Thu, 26 Jun 2025 23:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751007559; x=1751612359; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlXypzUn9k5HtMzPQR4dnvaBprfSwN8h+TU/oblYn18=;
        b=RbMattDY6k1PHke+lENHn3/WWJ+wsHUSkOda6v7iTxQWtq/6ZzihfPG4XBNj8HNGvQ
         stYA4rP3X0otUQvCjvE68I+cdrppVUZFzXb+HcfIlFJP42JWfnOOZ8B7vPg6l0aFHuyv
         OtiicNJyXqQ83Xwi7TDr7yThJ21QdKTzVdDzH5hKMOyvVAjVgHdZO2MLOi1EXre/V12g
         4K7yUQg9nkRsv5OIErpQDmBQTYr54zivlqGxCaJdi3hMPNXbJFjjqDdKF83zJixvlNLx
         wqBzryoIa7pILBESi8fYZj752DwxsopFKIVxF5Jt4lozXgxgiZNK4ysbubNsPTNeMo+i
         WeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751007559; x=1751612359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HlXypzUn9k5HtMzPQR4dnvaBprfSwN8h+TU/oblYn18=;
        b=cueLSefokhiLjFpTGx4w4/kvryxydPuTMvqJe4AcFn9jdbOTBlXt9GkJaktttHS/8Y
         heBedBNomEvAblus9OoOHOWiS2lAsdjUEzuElYMqIMJNkDCaOB2W5PKSIPFx4ODOg608
         cMk7iD3yAyJT0Kq5ttddGnha6xv7h6mXJN9jOj5l7abZ4zftIRJgfAt6QK85A4Tmoj5T
         9B3xLX5dLhHhEECPzRkspi4I9qprJSamz6R7zB/4YgsVBZQdfbvddbp09XkiQ4QOo44+
         +2o/+N1+uuQbv72rpa6V8SxxDpbOYM5kqXXnGGY6LGVVhx2dkPT2cUZMjESWYfizGcB3
         codw==
X-Forwarded-Encrypted: i=1; AJvYcCVIw+aJOptBlq1XvoErfVUJRDAVYW+G3HGp/lxPkGbG13LzSH6U7NX+ZlAVMbqUffj8qnGAWehjVGGsZB8=@vger.kernel.org, AJvYcCXoSxSB6Wqta7tka7C3oabuzEujcOKY9Y/oWve2orTd+pqw6FANzcP6tIUUDJZuiMa+adGJSVs2/XtE+nU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrN9fW/Dj1ZBJpXt7KPkKc2VSHApEpp3x1Zvi1tc1S4L6bDr3i
	83A+GX7qeCyzaGt+YuciwdPSx2/wAB8is9wtIdP6Hc1AgrBfnakZ5d8dqQOmL7pNRi+jzl0Pw4n
	Y/72oPn0M871O6byTLvv1B2x0kpOvtqhWq0VF
X-Gm-Gg: ASbGncsBZh8ve75ZFOZ8bSVzPHOCQEcxEGX7lQQgPg/7BhjwI/Nl0rlOHnKEY0ojLzo
	1xqkkbCzoraBap5DG6kmm9sdBFxf4BoiK30aPZQBcKnMFcqMkOX5sxsckiFiAWsVtN30cvPXVVM
	twAOjOoM0Yp5gS5sSfReMAN3WT1ACHhEwaKWu3/r8g+QCYSA==
X-Google-Smtp-Source: AGHT+IEmWbRtk76xsYUG7tUxzQkRkJ1wrXitDqF+1SHZis5RQWtxqj7D4XE70D3ATd2L8od2NXySpP+GMSxtY+FbAJM=
X-Received: by 2002:a17:907:c15:b0:ad8:9c97:c2eb with SMTP id
 a640c23a62f3a-ae34fd88214mr167722766b.19.1751007559028; Thu, 26 Jun 2025
 23:59:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624170746.47188-1-abdelrahmanfekry375@gmail.com>
 <fdaedc62-2beb-4f18-9e4f-f60ef35e1b38@suswa.mountain> <CAGn2d8ND8Gm8E=CwyNbejmOeuqwk32zNCV-EW-k_N6GTOn7aZw@mail.gmail.com>
In-Reply-To: <CAGn2d8ND8Gm8E=CwyNbejmOeuqwk32zNCV-EW-k_N6GTOn7aZw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 27 Jun 2025 09:58:42 +0300
X-Gm-Features: Ac12FXx-PMWf0TVMwD4Ez26sP2r6fcj0O18xN9CPdd3xTV4ObZol-SVTCmOY_30
Message-ID: <CAHp75VfQ9geeSOjSq8GoBuk_8ZrrCrkgpLxn1nXWgHU0dLnavg@mail.gmail.com>
Subject: Re: [PATCH v3] staging: media: atomisp: remove debug sysfs attributes
 active_bo and free_bo
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, andy@kernel.org, hdegoede@redhat.com, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 9:39=E2=80=AFAM Abdelrahman Fekry
<abdelrahmanfekry375@gmail.com> wrote:
> On Fri, Jun 27, 2025 at 12:32=E2=80=AFAM Dan Carpenter <dan.carpenter@lin=
aro.org> wrote:

...

> > The other things we discussed can be done separately.  It's also fine
> > to never do them.  I'm not your boss.  ;)
> >
> I think I will continue working on it. I'm very excited to contribute
> to something as big as this .

This driver is a rabbit hole. You've been warned! :-)

--=20
With Best Regards,
Andy Shevchenko

