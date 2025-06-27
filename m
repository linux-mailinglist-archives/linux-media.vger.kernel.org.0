Return-Path: <linux-media+bounces-36070-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A74AAEB035
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 09:37:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 939243BE232
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 07:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E58121D3E1;
	Fri, 27 Jun 2025 07:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAgKAGKh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9170621771A;
	Fri, 27 Jun 2025 07:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751009833; cv=none; b=M0/aPzJytiKIwUVYHLtgpVF0x64bYW3Y0dvEa2qwlHTmp3NoQYgp6cghbZdG+QeUhkw4dWiC09CqIU4fJMmHrLhkj0LeksSp8fU8jL2IzhgPNHEGa2IUlF6D+0ywOo5pj1gBohxUa4O2bBM1AVlIHCrwUHJ0bfZr9iPC5nNUyy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751009833; c=relaxed/simple;
	bh=iNtT7Ig4gUsAWw009qIB0VjlU9S39cJ9P4Au0J+rgaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UmaqNXWntl/Go2HyM9fIdQkEv3/iic6vUQl03rIkw81h2DhoMdUpF9y85ChW6t+6w637qHRWllydZXAbprXdO++nH59kbDpTQjWBgnURHumqdNlGchaq7D4uGSYUYPbKwN0BswZ5oqdO/QUNPg/0aQcugxxC/2H158wDeWRaRhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nAgKAGKh; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7150af9d35cso1678637b3.2;
        Fri, 27 Jun 2025 00:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751009830; x=1751614630; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sA0r3f6XV4xU1B5CfRo9ELlQCW7Ef8m5W1FCGlyqw8=;
        b=nAgKAGKh+HgnZAN2H2QB8fFLMv9U1tKHk8o86vgjWk2zxWcbwpztV7hGRq/2mxAMp9
         FI0C44eOTaDqwDKXWkqCr5zGH82z/qPMv3UvKEgRtv3KL2AXUHNuHwZ/w4K6fAf6su0E
         YjJ4Gp6cCGKi/ayPWTfiQxJc1+QNWW16SgUKWmQdUMgX147Ixx2GFwaTNetQ3a4a1GhY
         zkltYzVDzR0DBsMHT9f5iW3SUFd18hOWrZquzRWVwQxB7Xgd10J9Oy+3Mi60h46tLyts
         iWiOhwPLVZi5U8luzf9epaLmBUCipI2mknPr3369e9CLcnOVpBHTYDuwzjbcRPoYML2c
         5JQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751009830; x=1751614630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sA0r3f6XV4xU1B5CfRo9ELlQCW7Ef8m5W1FCGlyqw8=;
        b=BNYwb56jhQc+z2hj9aqc88+g6B/W15f4xGKqv1meHlaqr9l/m/EqLQOqDaZWR4ln7/
         qey639+OOwZ57Rl5z3J+VkrXOSCA9g2RbSD1rLJwA5ET7dTafpolx72R06gxfH3JXYu2
         sqocC6gbAAY2DAhan10ppN0FO5gUuKdzPWLxe3AGgYmVzFkpNu6o6Ab96N4huYQ0k6Ej
         68rlqNcO2BNMmYPD7LIPaV88w33winnDthkNbsBvEdVj7uADvmSdC7I9Hp236jyyKJAx
         zfhL7ugjOkO21h9ah4CHsb+yV99hnKYCzl7RncUHuyOdBZBq5TaxWO0EVBJynyZutYDm
         o27w==
X-Forwarded-Encrypted: i=1; AJvYcCVDKA5QjAT6X+VEGa7VNDQe3lLnkbM7pLt719DwEcuekuY4EsYg8dcFk70VVkHgnb4hhuy7YBI2Dk+grI4=@vger.kernel.org, AJvYcCXREzLDWIZlegDJZeFAmSZ+0ZMWOokolXBRtvdl/OMD7wc3pyUJFAQYnUkf49WsaXV3l64lHzKAme8WlNE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDJ8C9r3eI7cPhAvnpaak5bQTAbNtwcARRx6WQCritx3cK0Xh9
	VPs4llRHBRfrcb08UIpHIecxwVEHiq1ugQ29iVCTAbuzjiVRuVjUr7OOST1PFMHZumXwTUMdhJD
	91hGFb8Nzq6x3BQt3/nLR2RlzAX3K8uo=
X-Gm-Gg: ASbGncsud1mS7abQiSNbE8HtxLdyr3nk+hCHAZ4lh/vI3MxGsjj6d3MfN4Gj/jwm77s
	6cCJqxjg32C5OQr2rWA1c8Zka629Nc5lEOzjpdRLQx8qLMPlfMMZIt8bmGGfmZ3Eu2Zh55wXGtk
	+9NpjiknHYyOVxWzuzML2H/+L8aAyfMjQ/jWo1SVIDgQ6Vog==
X-Google-Smtp-Source: AGHT+IGXrRbXdekGAxcLwEUiLasd+6MZyxZ2iVrP0RGSn67kPXOVJQQMOGBlvg/6NdE2FE2/MYbSnknHoEAJHioHdas=
X-Received: by 2002:a05:690c:dc8:b0:711:457a:401f with SMTP id
 00721157ae682-7151717952fmr15019877b3.4.1751009830383; Fri, 27 Jun 2025
 00:37:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624170746.47188-1-abdelrahmanfekry375@gmail.com>
 <fdaedc62-2beb-4f18-9e4f-f60ef35e1b38@suswa.mountain> <CAGn2d8ND8Gm8E=CwyNbejmOeuqwk32zNCV-EW-k_N6GTOn7aZw@mail.gmail.com>
 <CAHp75VfQ9geeSOjSq8GoBuk_8ZrrCrkgpLxn1nXWgHU0dLnavg@mail.gmail.com>
In-Reply-To: <CAHp75VfQ9geeSOjSq8GoBuk_8ZrrCrkgpLxn1nXWgHU0dLnavg@mail.gmail.com>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Fri, 27 Jun 2025 10:36:59 +0300
X-Gm-Features: Ac12FXybXbhduWlOSQ9Z9m0DIJUDxuKrI5GJg7A1TRboqkqKYi0C3Vv7Qc3bI3c
Message-ID: <CAGn2d8MVQx_bkC8_TtcV4-WyO--kFs2Sm4ho5Mg-uFW+15_93g@mail.gmail.com>
Subject: Re: [PATCH v3] staging: media: atomisp: remove debug sysfs attributes
 active_bo and free_bo
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, andy@kernel.org, hdegoede@redhat.com, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 9:59=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Jun 27, 2025 at 9:39=E2=80=AFAM Abdelrahman Fekry
> <abdelrahmanfekry375@gmail.com> wrote:
> > On Fri, Jun 27, 2025 at 12:32=E2=80=AFAM Dan Carpenter <dan.carpenter@l=
inaro.org> wrote:
>
> ...
>
> > > The other things we discussed can be done separately.  It's also fine
> > > to never do them.  I'm not your boss.  ;)
> > >
> > I think I will continue working on it. I'm very excited to contribute
> > to something as big as this .
>
> This driver is a rabbit hole. You've been warned! :-)
haha, well, i guess there is only one way to find out .

> With Best Regards,
> Andy Shevchenko
Best Regards,
Abdelrahman Fekry

