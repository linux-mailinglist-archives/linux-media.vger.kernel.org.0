Return-Path: <linux-media+bounces-45492-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E43C06142
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 13:47:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1D2FE503D1F
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 11:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0591D2C0F6E;
	Fri, 24 Oct 2025 11:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XUZpa/ro"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBACF254AF5
	for <linux-media@vger.kernel.org>; Fri, 24 Oct 2025 11:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761306339; cv=none; b=qHblBa5wPHxP05JhTge1fZqjeyS46JoSdzXuzQfdTzxQuWX9Nw/NG0kncgtpmnfCOWdMKvirKjDhROSAEHWWkkKGDx1ZcWh40tG7KYxGsfndOrmpZxikfpsxgpdPXgK5K6G+dX97Ja92WR4wLRRKk3yt2CRPoghA3TmECi5TRMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761306339; c=relaxed/simple;
	bh=luQ7I+dQpgs4csu6w7EuEEhvuol5CB8yAgkxGJFsrrA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W0mHJsGNmutf0ZyzbGJtVDzLJBVcKf7nRh45VxXG8N3fHakIwmJfUudYfT6WN7effZsnnDbE8CUApkF2hkfDQ0ejPZF3kQ2j0BGiU3utHzxzqWkX9qLBlnJTLSW8rWwP0rpDuis3dmGc5xIBYS3bpyLE/ULGeGj2QqnJiQ24MAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XUZpa/ro; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b6d5c59f2b6so83122866b.2
        for <linux-media@vger.kernel.org>; Fri, 24 Oct 2025 04:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761306336; x=1761911136; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/R28RbX6yacDRN8EZS9Zv9Q6wLPVR7alXUhujea6//I=;
        b=XUZpa/ro71LflahKLks/t2Ipvkk26qb+krJodvno19QNsdPRQXj75a9MQc0+vsqLNV
         ADRpKrGlw5kFilCkKNG3X0nEnXJGIHfbQN9BX1OOrbmouJvvwZ34d/8GNLrDlgtEOyuC
         mcfn1wnsQ5Dvt+4LYmnFK066p5R0e+wKXO3j/1optJKXmgI9j78ETbzXPGBQPvxGRZX7
         Obs6ESXcYoveZbOTSx1DbcazR28GJai1Yz2+q0LECFEDOdo6iM6+zbAN2cdk/KSQ2G/m
         rvh4yVf3SEh8rSiBbumIWHVUXHoqvLYBN27Rroe10UPL/KYl1RyFrQ+ZgXoxb1RN341N
         KQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761306336; x=1761911136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/R28RbX6yacDRN8EZS9Zv9Q6wLPVR7alXUhujea6//I=;
        b=tyWthq7lEyvFUPobT0ztFFTLyuEe5x7IkPD/7tDrpCrLeR9XBiqf8KMtKGkUE/qbLO
         O06CIjNBE3MqwXNDBxG6WbYeQcwwRqLDIrS7DSvrk9IsaUWH9HTWbUeXe/OJA8igG71v
         Q2OcRA/z0YlgBXEVDOqn0gYDQHJQzSkz2pKskEsUuJCx+80C7AbOl6FIv8GRh1C5NhaN
         8Y8Dt1MqyfYQR5NAduyreHt27b05L7FQbU/QIYO8647ilSR4QxyrdinYVruFjq56QMe8
         S4h01oCG8QHtK1/rGH9qYC8AHggI6uVnXI7qu44zfMqkVm/LgPCeOQ1btDrQxg4/XpEv
         LH1A==
X-Forwarded-Encrypted: i=1; AJvYcCXrsZb1u7t2t+2iDT6pRQuDXX9s/SIyamM6O0HFpfI6bqwuq3RCv4/krEYQHTT8VeMoV0ngwiumhszQyw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr493pFcJNHROwN0PkjOgoB8aXpQxFcqPtWakyG8DCYhqxhUC9
	sIwjjwIjXUq/pG7BJ4Y77N8okDepCPfNxFqtQSfNc2lZWyQogM//xQc5R+rkrwI82+zhlO/HTos
	7wKymac6Lijfk+wTIK19KkTqJd76W3QCr2SJtbiA=
X-Gm-Gg: ASbGncsTdVicSdwLh9A3JhglVvJ/TYRtxBaqXat+ACn4W7VKTK8gtq/GZQdA0Jolw//
	RTGBl01h8zaVNZS2M1KawxL98NJuIdTszeFRszrtnVm4nRk3rHNtxwlEIPIl4K6Oyy76NVwGL1f
	+jkxqJnBE6wyk+vUpfwG4BL798WN7MY/VIfJC8O5MxOGyK8uBecPP/tN9PKbTAJvg9WBeRdhOA8
	IIUR2UamrRofc+GAzuCcvakmaHlqkHRkdd5tv+yOVofPY+SA0+P8gxQpZmGoQ==
X-Google-Smtp-Source: AGHT+IHgefdKWBp4DSP0OZeTnT1lsDnS/0NfPSuvV89rxgZtDvuvJFpp1w6Eu2z/MODOJmERGtCFa0kYRNc4jhuZ5l4=
X-Received: by 2002:a17:907:2d9e:b0:b6d:4f1d:8c9b with SMTP id
 a640c23a62f3a-b6d4f1d9e1amr718193466b.28.1761306335909; Fri, 24 Oct 2025
 04:45:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923175927.4380-1-raskar.shree97@gmail.com> <958a157f-e01d-499c-9f3e-d19e33b1de74@kernel.org>
In-Reply-To: <958a157f-e01d-499c-9f3e-d19e33b1de74@kernel.org>
From: Shrikant <raskar.shree97@gmail.com>
Date: Fri, 24 Oct 2025 17:15:24 +0530
X-Gm-Features: AS18NWDn1I4rwo93D59ybEO92j04rZTcEYiBcCfdMNzbbHmY8edIh09vy7uLs24
Message-ID: <CAHc1_P5+xz5JK=dHQGBOt_kfCyeAm6mcX2zbjgE0WtR5mnDqdg@mail.gmail.com>
Subject: Re: [PATCH] media: saa6588: Fix unsafe debug printk macro
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: hverkuil@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 4:05=E2=80=AFPM Hans Verkuil <hverkuil+cisco@kernel=
.org> wrote:
>
> On 23/09/2025 19:59, Shrikant Raskar wrote:
> > The existing dprintk macro used an unwrapped `if` statement, which can =
lead
> > to logic errors when used in if/else constructs. This patch wraps the m=
acro
> > in a do { } while (0) block to ensure safe usage.
> >
> > This change resolves the following checkpatch error:
> > ERROR: Macros starting with if should be enclosed by a do - while loop =
to
> > avoid possible if/else logic defects
> >
> > Signed-off-by: Shrikant Raskar <raskar.shree97@gmail.com>
> > ---
> >  drivers/media/i2c/saa6588.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/saa6588.c b/drivers/media/i2c/saa6588.c
> > index fb09e4560d8a..71d34d229564 100644
> > --- a/drivers/media/i2c/saa6588.c
> > +++ b/drivers/media/i2c/saa6588.c
> > @@ -50,7 +50,7 @@ MODULE_LICENSE("GPL");
> >
> >  #define UNSET       (-1U)
> >  #define PREFIX      "saa6588: "
> > -#define dprintk     if (debug) printk
> > +#define dprintk(fmt, args...)  do { if (debug) printk(fmt, ##args); } =
while (0)
> >
> >  struct saa6588 {
> >       struct v4l2_subdev sd;
>
> I think we can do better than this.
>
> Looking at how dprintk is used in this driver, I see that in almost all c=
ases
> it is preceded by a 'if (debug > X)' condition. Except for one occurrence=
 in
> saa6588_configure().
>
> So I would propose to just drop dprintk, and instead change dprintk to
> pr_info and pr_cont. And add a 'if (debug)' in saa6588_configure().
>
> Actually, v4l2_info(&s->sd, ...) would be even better, then the PREFIX ca=
n
> be dropped as well.
Thank you so much for reviewing my patch and sharing your feedback.
I will drop the dprintk macro and will use the v4l2_info() helper as
you suggested. I will share the v2 patch shortly.

Regards,
Shrikant

