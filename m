Return-Path: <linux-media+bounces-3145-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A9F821608
	for <lists+linux-media@lfdr.de>; Tue,  2 Jan 2024 01:30:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0607AB211F9
	for <lists+linux-media@lfdr.de>; Tue,  2 Jan 2024 00:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2011B381;
	Tue,  2 Jan 2024 00:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fAJYnrS9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595F7379
	for <linux-media@vger.kernel.org>; Tue,  2 Jan 2024 00:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3bb9b28acb4so6015007b6e.2
        for <linux-media@vger.kernel.org>; Mon, 01 Jan 2024 16:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704155397; x=1704760197; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ph6TDL3JYb6QU+ylfDz9PufoDKnGEKXnDpwEDgPhJMc=;
        b=fAJYnrS9+kh4H4OfHEgcWJbnHJi45nv403kxXL9DVwyytcCAtdQZ+Eep69W72U/oDd
         nTysTcFu9wghWVvmki//4Z1ZOQZYgHMIUow07jXpq+NoMRX3SdRPHA1nLTI5UQ7o3W2I
         HYXfDsquiRnUztW2EmRYeG4Z9KIuj17BpdMpf1y3z1AaVRBqfXyAy52aQhhhLCGJuM/0
         0uH8CR0y0n5qFkGTvjdHwnFPLwTGr+g1sdEiDIlGoa55kayihPVfWNOnlY+PP7cNGy60
         9T5E/XaxnSWU2+4riRQBTM+LlOEd4wGAIyRgIYzSzQj2wsWYkhs51Xz1QC28lR8sve4G
         E8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704155397; x=1704760197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ph6TDL3JYb6QU+ylfDz9PufoDKnGEKXnDpwEDgPhJMc=;
        b=jG2Hz4J4d3QdN3Yk7x7mY1rdDRX6A69xT3OOlLbaobEq7jkPYOXf+rDBdTJoAoa88/
         Q4Dy8i/cpHu9oUEnRABppKHa90C+DlpIB59KSLIxDKQxJvwbfQK7vC2R341wpjDgSrsT
         XhlhEe0kR59hFWz8MtbeyeVDO1CGrkP+0URRCjJIhD2KBgY3IIMePbc9MdMTUeELFldL
         Ux4tDBzLL/SactmfcHI1WnoMVWnpCUfe/ggS35AOTehuYpTIt3QNVMNDlPMsx6lO9mg6
         H9I9bnykmrTAahWjQXfJ6hQXlZ5XIic/xT2VlQL9rQH7gGw7Us5qEtWxL0cXxzy7Jd8q
         MUSg==
X-Gm-Message-State: AOJu0YxknFvGV5LteV7oKNhBv2KlQ/wymESHNZubxMrgA777O1o3wQYg
	EexzkcyuYNVSkTbua9YJOJOi3j2CJPMlZG+NP7Q=
X-Google-Smtp-Source: AGHT+IHrwOvyHtB9syDbyARAjWpBYE0MoRi5r7DQed0Kdx28vHGvdLRwDvKzM9ZVp5buUu32iaJdpzESJuATkKqmCak=
X-Received: by 2002:a05:6808:384d:b0:3bb:be52:49fc with SMTP id
 ej13-20020a056808384d00b003bbbe5249fcmr14602556oib.84.1704155397327; Mon, 01
 Jan 2024 16:29:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231231103057.35837-1-hdegoede@redhat.com> <20231231103057.35837-11-hdegoede@redhat.com>
In-Reply-To: <20231231103057.35837-11-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Jan 2024 02:29:21 +0200
Message-ID: <CAHp75VdtJ2WhZKNH-HhsTfSUQykxVcqDqsW5aX-dbwuQeLG+PQ@mail.gmail.com>
Subject: Re: [PATCH 10/15] media: atomisp: Fix probe()/remove() power-management
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 31, 2023 at 12:31=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:

...

> -Note this also swaps the order of put()/allow() and forbid()/get()
>  so that the sync versions actually work by calling allow() before put()
>  and forbid() after get()

Missing period at the end.

--=20
With Best Regards,
Andy Shevchenko

