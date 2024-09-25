Return-Path: <linux-media+bounces-18554-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9FE986471
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 18:05:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D62DAB38B86
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 15:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48014187337;
	Wed, 25 Sep 2024 15:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfYOUbW9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4116E26AF5;
	Wed, 25 Sep 2024 15:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727277765; cv=none; b=lYx1vkHdjU7n6yE7XiSGBHTri9PLsTnMuwIVTpxi8LCxJwhBhxEI/FAT9zcgH5jeuJS7NSX1dHRu2TrOMzVzt5YpPXICUNHhyx0UDYirdHw5JpNhKrC6j0/iLRy7EJmT8d6VfuKI08/5WB36b8tSzc4ldpvqJL6RvmKT5TIFOHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727277765; c=relaxed/simple;
	bh=E6vIP4pLFWWrtvbUIG48yyFvZgYCUGXO8NPYzOGdxp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=imuhnW5Xj54A9Tsswr+DhE+lHtoHncaYu+nighR7pjLAuNIFaxZF94MrXtauVH2g1QStbAZgMPIe40ZQwIAisvJV3TXRs1SB9iqj9c3IU5+dUCR004zO1A7OsnxoLNOkjXNq363cjJ1UKqfh0Cm2eM7//KC3NF3Q0BWW16usebk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nfYOUbW9; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-84e85d2b5baso308742241.1;
        Wed, 25 Sep 2024 08:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727277763; x=1727882563; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6vIP4pLFWWrtvbUIG48yyFvZgYCUGXO8NPYzOGdxp8=;
        b=nfYOUbW9YjAdXo5IWa6cbN6UXfwucL0/hCQ4bL/40Y3Re2AaA2Dt93FT593K3ZMhUX
         29lai2JDpg3lDxp5YFUoU7MoWUzLAvv/CakfhwNWaJJzC2kfpjAFr5gQ2RoOjJR1dtlL
         pZU0kh98uoBFlvMIaWmT809emYtNY6PQoZCebuM8Pf/P1uaNyf8KLe/XWz8X10BJvwuS
         L4k8Op6Gz81QToJfbVqF35R8E1JSUvQt7aurmOoICkrfUPXWt2Vh9QLemqcLogQ50301
         nLqWNKOeVPX8flBfF8r5fW1PmRs7EEzytPVmOgzuAyEDcFsd6bBS8hBjxLNkvpeSy0yo
         ZgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727277763; x=1727882563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E6vIP4pLFWWrtvbUIG48yyFvZgYCUGXO8NPYzOGdxp8=;
        b=biEf0ZrdCefgU/VuT21sQ+e013K4dXIbWfIu9/4sYaIoqm8Jso4UOC/cy3V86r4PG4
         h7lKK+ciMCS/ziZCsKNp7BwjZGlov5w/+j/+AVVKgGRcVi28B4l3JHyAZSSflX0nFWdN
         /6ADxz3ttJI2z3TuclctB7JyvFSEHR3BHSHAk5BSwfvnK96g/2RYCsIcHgVgWbMGqNeJ
         YsOI5H9xKHJoI9uRQH6qK9kJb9nHYK0XQvrblxKiavAIjgIXSpwlafEHnhkPsKa8q4QS
         0NR863QEUykh80tOWXPeDwANGNoDgB5KE7vpUdFgDtwOvCBrwHwhCKcSkYYa2fZc6fQT
         BG1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVwmmhFax25+GDFjzCIUdSUxUnrnbUptJyahnUfUnz+vlShhegiju2qqb/MSY2jEXN370scn0bbjV9oyrW5fxQyNR8=@vger.kernel.org, AJvYcCVybOENtjikYcqmblX/ZqH6DMcpiRNwLueJNlnVByzw8hchS1JBjjZ/nxY2x24a9HvXRcJIDk6JPsc4SJk=@vger.kernel.org, AJvYcCX3yNn/yfXa7fubZhhml30sTPZtzHjdDszwT6XTAr/Yf/J9kCuNsP50cGBLxW74hZQh3H4WNg3dYEJDnhU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXJhSSbIZ6iehpVxt3MCppsGwUKCZLe2BKr2iy09GT0szEp7gx
	9CRB4sch1O0z68CU6BPIzZBZJiVfB/TfRRiG3z7D8t19tqB3oXJbBY9ALjl5SDMwU/o+GxTnr3a
	YKtyt7vUv/UYME9EoVQ9ihsIooiHDuQ==
X-Google-Smtp-Source: AGHT+IGKodtfaaU3chHy1ljxg9SBW4VmFxTsane1zQyUhE//XpjpYSGXNRG0OflZUOYVn8866qNPFK2TbdK4d2ZT+J4=
X-Received: by 2002:a05:6122:d0f:b0:4fc:e3c2:2c71 with SMTP id
 71dfb90a1353d-505c1d36780mr2646672e0c.2.1727277762797; Wed, 25 Sep 2024
 08:22:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910170610.226189-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240924223740.GL7165@pendragon.ideasonboard.com>
In-Reply-To: <20240924223740.GL7165@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 25 Sep 2024 16:22:16 +0100
Message-ID: <CA+V-a8tuCJD=2whHdY1AjgrBz_Bsgk9CZWU=2kCEn6sWahTF3g@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] media: i2c: ov5645: Enable runtime PM after v4l2_async_register_subdev()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thank you for the review.

On Tue, Sep 24, 2024 at 11:38=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Tue, Sep 10, 2024 at 06:06:02PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > To simplify the probe error path, enable runtime PM after the
> > v4l2_async_register_subdev() call.
> >
> > This change ensures that runtime PM is only enabled once the subdevice
> > registration is successful, avoiding unnecessary cleanup in the error
> > path.
>
> The subdev could start being used as soon as it gets registered, so
> runtime PM initialization should happen before
> v4l2_async_register_subdev().
>
Agreed, I will drop this patch.

Cheers,
Prabhakar

