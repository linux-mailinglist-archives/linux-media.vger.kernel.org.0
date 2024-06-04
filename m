Return-Path: <linux-media+bounces-12545-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6140F8FB9AE
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 18:58:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F94CB247E5
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 16:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7D1149C42;
	Tue,  4 Jun 2024 16:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TVuusFJm"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5448149C4B
	for <linux-media@vger.kernel.org>; Tue,  4 Jun 2024 16:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717520277; cv=none; b=KKe0uxlsnjjIu1v8O0P79JrxHjyVJRBfJOegeju+J7Bpiq2M1tkOXGi/5Pch1aytqd6zq9c+1shMLFXSBiOJY6cDJDqUJEc+OexN8S6aHN5pGz6nuUqIB5vuE1SQ9Yf27ZW3tN2vx7fcVCnPw5TipgWdUQ2N7DXX3u5YFxngt+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717520277; c=relaxed/simple;
	bh=RkA7e5VFB9vDGncRO2ENgvDla8M7CYM9lNNkMQHPHjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UY0Fq7rDVuJs5EolLCDeI7V2ry6BuCw2WHXgvOHbqQQH6WF2EwFsAJUzPNvV40VEVOx3lkncuGPgejF5+ioX5+lKYMTzQ2UiDEnF+ohN6kEfVpkFmjnXd2cIPpdnquR0tYnm1l7L9NclALZegiMsRyNAxwEISLyJ6gzao40C+bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TVuusFJm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717520274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7FlX28DSjTWRjXtSMBvpppmXKszHkVcXXC6fhlzabpQ=;
	b=TVuusFJmog3rOOCZr/0MvUXw9k7ueG9o5L35qjYBaNeEyffqS2IlR+7DyoII93WKEpuH4K
	mresTtAmQFg/NkNyXv8ivy0F21KI+F6OaVq27m0PA16ippIOs69bK+9H27EKNJ5sqKj5pP
	eR1OsHkq1ut3CjR1UN1RBChEK5bKLE8=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-x4u28x7iOsqGEcYJpp8umA-1; Tue, 04 Jun 2024 12:57:52 -0400
X-MC-Unique: x4u28x7iOsqGEcYJpp8umA-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-52b950b3dc7so2611298e87.0
        for <linux-media@vger.kernel.org>; Tue, 04 Jun 2024 09:57:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717520270; x=1718125070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7FlX28DSjTWRjXtSMBvpppmXKszHkVcXXC6fhlzabpQ=;
        b=wDpNWT6+OAR6KSLeibhoC4ljwzkst5t4GOTho93FvfK3jY7haQvYOsGue37FlbFbNh
         k2QMkte+VBTTASvb/jkNVyozCVKZCK5SAjcxJvS8UohPMYpRvY7BzJ4oNVUDUqfxUC9J
         ghV78u4jwyxQndG1Ql/xisnhrIY+jAEnZ87e6aoEvhYilqjy02k1RNBpb8cZeOz8lZR8
         h9tBTMr9YhklAd2xTfEqrNcmudxOmcyzVjbKxCWyjeY8AtQ6B0D/lrR9wp0lvokN5UAL
         ICu+FZP/QG5onUZU+TR4V5zEcTVk2AMcRY/YiTFd991aMMZlIDUAx6MAGeIfv/v58guv
         F5ow==
X-Gm-Message-State: AOJu0YzEo/rAeqJIGyD6sA5ybsNviYl6EYvcMd75HkmOZcS+ZhFAonQL
	nLrkE/y2k5RAggfq5L3Dw8fifVWpOQdRwdHlSnk6xtmJOYhrVHaBK3HXDu0wDgwaerJHzUBhxCK
	8eNo3TsnF9EnYK4HtEi1Zvi7zhFKgEmfQ8GMUedV2/E3N+AxorxyYUwWsPL94+vj8fHzh4wwLlb
	0PwrM7Nxh88PAu5t9pnXyKa19iDA3y+EG6gaPSD7lsL/cKvHJ1
X-Received: by 2002:ac2:5606:0:b0:51f:53e0:1bc8 with SMTP id 2adb3069b0e04-52bab4ddfc8mr86638e87.25.1717520270629;
        Tue, 04 Jun 2024 09:57:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4wSSfNEw8aNNDqHpBo3l7lPJzfGTn2sLVN21KJCoB4BOxYwvcVpV6j8to1YnsX1hnCWOJYABnXy6WcA2AAiQ=
X-Received: by 2002:ac2:5606:0:b0:51f:53e0:1bc8 with SMTP id
 2adb3069b0e04-52bab4ddfc8mr86621e87.25.1717520270219; Tue, 04 Jun 2024
 09:57:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240529100301.127652-1-sebastian.wick@redhat.com> <b7097390-1609-4faa-8e88-9bfe5a00641d@xs4all.nl>
In-Reply-To: <b7097390-1609-4faa-8e88-9bfe5a00641d@xs4all.nl>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Tue, 4 Jun 2024 18:57:39 +0200
Message-ID: <CA+hFU4yNeQmJRNZT2eSKtdX6pSv-oixNRRj-O5--8R-gK5oo6w@mail.gmail.com>
Subject: Re: [PATCH] edid-decode: Cannot support NonMixed MS without MS
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 4:16=E2=80=AFPM Hans Verkuil <hverkuil-cisco@xs4all=
.nl> wrote:
>
> Hi Sebastian,
>
> On 29/05/2024 12:02, Sebastian Wick wrote:
> > When `Max Stream Count` is zero, the sink does not support multistream
> > and thus cannot support NonMixed MS.
> >
> > An EDID with Max Stream Count =3D 0 and Non Mixed MS =3D 1 can be found=
 in
> > linuxhw/EDID ./Digital/TCL/TCL5655/1723FF2DC6D1 at commit cff7fe4d44.
> >
> > Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
> > ---
> >  parse-cta-block.cpp | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git ./parse-cta-block.cpp ../parse-cta-block.cpp
> > index 4d2afc6..7cd7a3a 100644
> > --- ./parse-cta-block.cpp
> > +++ ../parse-cta-block.cpp
> > @@ -2498,10 +2498,11 @@ static void cta_hdmi_audio_block(const unsigned=
 char *x, unsigned length)
> >               fail("Empty Data Block with length %u.\n", length);
> >               return;
> >       }
> > -     if (x[0] & 3)
> > +     if (x[0] & 3) {
> >               printf("    Max Stream Count: %u\n", (x[0] & 3) + 1);
> > -     if (x[0] & 4)
> > -             printf("    Supports MS NonMixed\n");
> > +         if (x[0] & 4)
> > +                 printf("    Supports MS NonMixed\n");
> > +     }
>
> I would actually leave this as-is, but instead add a fail() message
> if MS NonMixed is set, but Max Stream Count =3D=3D 0.
>
> It's really an EDID conformity failure, and it should be reported as such=
.

I'm all for adding a fail() message but I'm afraid our implementation
which tries to be compatible with the output here won't have access to
the MS NonMixed bit when Max Stream Count =3D=3D 0.

Would this work for you?

    if (x[0] & 3) {
        printf("    Max Stream Count: %u\n", (x[0] & 3) + 1);
        if (x[0] & 4)
            printf("    Supports MS NonMixed\n");
        else
                fail("NonMixed MS support indicated but MS is unsupported\n=
");
    }

>
> Regards,
>
>         Hans
>
> >
> >       num_descs =3D x[1] & 7;
> >       if (num_descs =3D=3D 0)
>


