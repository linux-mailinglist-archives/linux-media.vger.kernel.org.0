Return-Path: <linux-media+bounces-17461-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CF8969A2E
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 12:31:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4040D1C23343
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 10:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12BD01B9851;
	Tue,  3 Sep 2024 10:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OobWbnEq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15DA186E32
	for <linux-media@vger.kernel.org>; Tue,  3 Sep 2024 10:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725359449; cv=none; b=gZd0i+ibTGy4VFQSMx0/2vxZo3pGCcfPIvPk/wAXY/37rq/nT2sfljMefaVHV8JVY8ZR7aobxxuhsBxwZ924aqAfF4JMkNImkEyMek/+sfgthgXNHNHdPj43qVoskvuASCWFJcYbg2nxZCrHIQnZe2wFg8jK+CTUMgjsah2r/uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725359449; c=relaxed/simple;
	bh=9/LvUuCS4XhoIwjDWaQrgiAmfj0naOBxYwTFNfhl9BE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WFzqm3y298c3Dt28TDSTvemmpbuD/cDzWBtfd+rEuonMbiUy4kdZRAadv50Mw5d9UXM7hl7MWwILLb8GpldqVOtwfIz9bs63SK77VX12apa0vKzFEjtadWd1xMKwULmsyMNn5HMY9JBjJX2rWfQJk14YVrae5QS7H6yHRcLlIsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OobWbnEq; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a86910caf9cso1062089066b.1
        for <linux-media@vger.kernel.org>; Tue, 03 Sep 2024 03:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725359446; x=1725964246; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTLDxucwjwyWimGcHcYMGMu+uTN8r9AsQdQdKm7NNO4=;
        b=OobWbnEqNzEAPb8PbsIcz4180cJ6RUpR7Bu9hsYr5xRp49q3u3jsOvGmwv+ciBAQfw
         VwhoiFAcy+vZXy18iXOq3ZkwrBC5FOd9m33somT+KyP3iAh37IQtwwkuCgF/mYY+px4P
         MNQnBOYbRAw5XdfSjESvuh1IZdPaGJfJoaSnsFPsY7+uKgs7f/RSdwu2O2T9/aE8se7d
         K+EVoJNDBPM+jznU4PmYjAg60GAGSsE3odPyPg/3FZtpazz75BIGJ7v3usKvRPqcxm1o
         x9h7q9OWRikpXXS5G5GLOCYvxQk8Tsrqgb1ylUl+536jRrTd0a9AZ0x1VsYjJBzCBYG6
         S+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725359446; x=1725964246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTLDxucwjwyWimGcHcYMGMu+uTN8r9AsQdQdKm7NNO4=;
        b=aD9cy/QY0LKga2vEm39K/cCwzi/JKX0C3ehZ+58quHfoo/2jkGv3xJCNGN2pS5eqrR
         UJHa8FlV+X/9VKbb3BzhYZejdm/6hPjT6ClTIsDJrJtGINxDd8d7rBzypVmE6VWqrz7W
         3gIf1fclq8VMP5stefSfFk0kQZH4Lc+GFWnhiZBO19rQPJHEcaOyaDFLEr/latH1u1ZO
         DxyYePdznQiinivnkL54Z8jWinWW5pGPfOxtUBfdR7P0sNhvMFvk1Vwsv4r12Vp6z7oh
         KziDGP1U//nUQmRuBOs9xUcBy/IDCxRFZ9rbZftHgpA/ajlkR+SR1SaOOquQF/JRpvS8
         uNXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWytM54W/3Y31DgfgHsSZaOP5oJ8fhfeKvGllUTqgjhAmhUz2TWyK7Hu4i6ksIqXvCX2udJivEqVURegQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKCZR9uuOiMmRA35BkubQxLIPiCK9CFiv3JeNadgw+suLWOVxf
	fOEOe/US7P2iZFktj0/cmDRpsiJlmqiXW1GcU9O9NK5XkDCPN1RQV4BP+WQSBbIMyV0g/Bsf6wC
	njyV0v2+vgYg6VTfpeXzVGQ60Ftk=
X-Google-Smtp-Source: AGHT+IEyXns+ABOcTXdlkH9hENJxAucp6nOJeL5bX94OCsp6Pynerj+R/8vKwFIsLTYECUazbiO80sbfehXtBf2CIUw=
X-Received: by 2002:a17:907:e209:b0:a7d:2772:6d5f with SMTP id
 a640c23a62f3a-a89a2924aa8mr1254672766b.23.1725359445903; Tue, 03 Sep 2024
 03:30:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902095229.59059-1-hdegoede@redhat.com> <20240902095229.59059-3-hdegoede@redhat.com>
 <ZtWpi7_S5d7NZx61@smile.fi.intel.com> <a3363c07-6595-450d-abe0-c1ff4a3e9955@redhat.com>
In-Reply-To: <a3363c07-6595-450d-abe0-c1ff4a3e9955@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 3 Sep 2024 13:30:09 +0300
Message-ID: <CAHp75VfZEjq+ep_5yjTr+-mPi5F3XurWDrt2tNUX+PW5k-HkJg@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: atomisp: Improve binary finding debug logging
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 12:27=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
> On 9/2/24 2:03 PM, Andy Shevchenko wrote:
> > On Mon, Sep 02, 2024 at 11:52:29AM +0200, Hans de Goede wrote:

...

> >> -static int __ia_css_binary_find(struct ia_css_binary_descr *descr,
> >> -                            struct ia_css_binary *binary) {
> >> +int ia_css_binary_find(struct ia_css_binary_descr *descr,
> >> +                   struct ia_css_binary *binary)
> >
> > ...for example, in this case you touched both lines, so making them a s=
ingle
> > line just reduces the future churn.
>
> Ack, fixed in my media-atomisp branch.

(Actually there are more opportunities like this that I haven't
commented on in the previous reply. I hope you have already found them
and fixed accordingly)

...

> >> +                    dev_dbg(atomisp_dev,
> >> +                            "ia_css_binary_find() [%d] continue: bina=
ry is not striped\n",
> >> +                            __LINE__);
> >
> > Now the __LINE__ argument is redundant as one may run-time turn it on a=
nd off.
> > So, trimming it while converting to dev_dbg() makes sense to me as a on=
e
> > logical change. Ditto for other __LINE__ cases.
>
> Dropping __LINE__ is the bit which I want to postpone to a follow-up patc=
h,
> the messages rejecting certain binaries as not suitable are not very
> unique and the __LINE__ print is necessary (atm) to help find which check
> exactly is failing. Not ideal I know, something for the TODO list.

Yes, it's fine, after I sent the previous reply I saw that the
previous implementation was a simple wrapper over dev_dbg() and
__LINE__ "issue" was already there. I.o.w. I agree on the followup!

--=20
With Best Regards,
Andy Shevchenko

