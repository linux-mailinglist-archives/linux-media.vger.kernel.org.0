Return-Path: <linux-media+bounces-12634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 270338FE339
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 11:42:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B645A1F22D8D
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 09:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9FD0174EF7;
	Thu,  6 Jun 2024 09:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X8+cdrc1"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE3215EFDE
	for <linux-media@vger.kernel.org>; Thu,  6 Jun 2024 09:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717666949; cv=none; b=cWf120O9bndFCijRPuS7322tPmKW+/2qLXZzlTXcIp/tYr6XnQCn0OyMirp5x+h5KAMtlAVL56ptViKlKgE8974lbBlof7pIkmve5GihMKKqr1hdVYhgvDdknmAadNTUKEWJXxhkzlzngqRMxb46LVubOPndb332Zp20IJftd/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717666949; c=relaxed/simple;
	bh=6H1wG9N5l2e+iInVVdl7g0No8wZY5GPd160XwE2gGTo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sMlHTIHGt0Ytj98j+MbtttkZo4Pj8FRFQUa1PKvuRBZi0+kx51yxMcUnZMaX0DYL7s49j+I2U9Ic4D2diMxYjifXWgzH9VLUiiccmw+QFlA73gXnqMxXvlcVVm9gZRaSlo6VENuKHEW3SU/SnxNY9UdDJo96GWU0LXgmRYwDIBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X8+cdrc1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717666946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nTG0WxA1/ehcejE2qPoJSflcBhwV1tNX/VAz/OMQeYA=;
	b=X8+cdrc1hC4suYcgivcQTzR8FSMX1xRxXAtlKVpYSGt3GcdT+0SLyIjT9d3r74YGQAKhE6
	T7m8XdR7KWD4x5oBJAGfLoxFUShAChz0a5UWkX/VT78phnYJwZypIEWLr8DiCvtQYIcQ+h
	X4UAt6T2Qw5VbUpYGm1Bx68SXPH4sN0=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-YFPVmDs_MRu1_QWNAP-sGA-1; Thu, 06 Jun 2024 05:42:25 -0400
X-MC-Unique: YFPVmDs_MRu1_QWNAP-sGA-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-52b98e99f0eso505400e87.1
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2024 02:42:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717666943; x=1718271743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nTG0WxA1/ehcejE2qPoJSflcBhwV1tNX/VAz/OMQeYA=;
        b=uwsknCP1SbBUluVKbci+c+gBZWIrHosRdBqEbq+2cSvqz+3/F9juPBXROCFMdYhKsv
         6V28h+JnQSKeMZSj2xkliVtbbDl7jOVflYUEKp0S0zksMHQ9ebpXv8KhOwcHCjZ4VDzP
         pApb7RiQ903b0WN4ikFEaySMDZJIkuBP6D0b2g32Qxt1r0JUPZPjT4ZqeUNOKautdJWH
         HQUaqim2r9sEFmB2kTsXaajOBbMoIwo7DQ2fOta2yejJ/rfhtzy07wJQYZasrvHkMj+b
         sV96v7lj0rL1Qp0L7k4k14jFI62YQN3klrEWj/3T3yPU8XIaVcbLSj++IFuXxV5Y2AdB
         tezw==
X-Gm-Message-State: AOJu0YxuMT6L1nAfU8vhyL7JQy+AiXQ6ju45Q+oKx1MUy7YvYpTYx5wY
	V1KGIadF1eL7y8QpMCHSmc2nKNJjop3oIlkijNTitlJPbcFxwZfb1Y39TZkcIIqNklboVoaao0f
	Ok9QSoHTOv5Y6WH+d8f2tvHWTaNwrFSz6sij3rFT/VQZYdxAcdoCNRWI7X4IxLbCEqnREs1kDdR
	rWGMJSdALSjaT9ey4710jybfg/rP0FnKuYTnUeCzNVl1/nng==
X-Received: by 2002:ac2:41d8:0:b0:52b:846e:a144 with SMTP id 2adb3069b0e04-52bab4bcfa7mr2838890e87.25.1717666943376;
        Thu, 06 Jun 2024 02:42:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSk+odkjfj63PK9/ZWMD6JeQM03wY/I6iIY1IwpnPDXcLjL8L+OUMIPToN4/2OGWZM4gJ8aHog76fVBhP8+RI=
X-Received: by 2002:ac2:41d8:0:b0:52b:846e:a144 with SMTP id
 2adb3069b0e04-52bab4bcfa7mr2838881e87.25.1717666942971; Thu, 06 Jun 2024
 02:42:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605110907.621053-1-sebastian.wick@redhat.com> <46bd56ac-e29b-4534-8bf9-90a5196170b4@xs4all.nl>
In-Reply-To: <46bd56ac-e29b-4534-8bf9-90a5196170b4@xs4all.nl>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Thu, 6 Jun 2024 11:42:11 +0200
Message-ID: <CA+hFU4xFJErt99NUFr4bW2jhT2pU14SUa06heKy_s5qTzhUthw@mail.gmail.com>
Subject: Re: [PATCH 1/3] edid-decode: build: compile with -Wno-variadic-macros
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

When building as a subproject, I get warnings:

../subprojects/edid-decode/edid-decode.h:516:23: warning: ISO C++ does
not permit named variadic macros [-Wvariadic-macros]
  516 | #define warn(fmt, args...) msg(true, fmt, ##args)

I cannot tell you why this happens though. I tried to reproduce this
without a subproject by passing different compiler options and trying
different standard versions but did not manage. So, I'm not sure why
this is needed other than silencing annoying warnings in
libdisplay-info.

On Thu, Jun 6, 2024 at 8:02=E2=80=AFAM Hans Verkuil <hverkuil-cisco@xs4all.=
nl> wrote:
>
> On 05/06/2024 13:09, Sebastian Wick wrote:
> > Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
> > ---
> >  meson.build | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git ./meson.build ../meson.build
> > index ca57652..80f810f 100644
> > --- ./meson.build
> > +++ ../meson.build
> > @@ -7,6 +7,7 @@ edid_decode_args =3D [
> >       '-Wno-missing-field-initializers',
> >       '-Wno-unused-parameter',
> >       '-Wimplicit-fallthrough',
> > +     '-Wno-variadic-macros',
> >  ]
> >  edid_decode_link_args =3D []
> >
>
> Can you provide a proper commit log? E.g. why is this needed?
>
> Regards,
>
>         Hans
>


