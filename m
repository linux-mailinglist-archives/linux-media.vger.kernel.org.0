Return-Path: <linux-media+bounces-10566-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0787E8B8F75
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2024 20:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 861E01F22773
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2024 18:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C3D1487F2;
	Wed,  1 May 2024 18:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="QJ7Agjie"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C5F147C93
	for <linux-media@vger.kernel.org>; Wed,  1 May 2024 18:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714587501; cv=none; b=QrSwFCL5tGhzkgDbQHJYkBxy8EafIOaAyfRpRmWDfpNEAMykoM18F3I8lTjUXYSzCtzq5sGU5N68QWYudOQaeZVw3IKEXd6xD4nDcsdfiQPq+6t8KrCzM0q1hxO66cYLXhQvzF8u1HIgeCeOXeqwpWB2H8xPADNrqy+4rgrgxXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714587501; c=relaxed/simple;
	bh=iHx4pHZora+tx+qHSAKQzX3398H2wOjiMaSj41GtAuA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jcZbJ18UWgKE5C9SBmvN97I+l9X++UjoK5VIP9aP7H8qwQrSdAJQEBVnkG62p83ZvXJvT3FGoQG4fcYCb36EaUce1FCznGUAYdZFOdh5MMUe+TumrIl7AY580sSqIweoNQIoqfNEzdzcUxg+UV2/P1yqLFtIvzaqcoqaT4ZSU+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=QJ7Agjie; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5af88373b2bso1934664eaf.2
        for <linux-media@vger.kernel.org>; Wed, 01 May 2024 11:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1714587499; x=1715192299; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=P+ilE7LHysgerm34X3VBI2LSDwbZAC11W+iUOeY+UZU=;
        b=QJ7AgjiekJk/SB7nr/rgy6HVqjUEzQpOfbFKqzxnBnQlvBj9gNCmY7hU6MpqpV+Vgq
         punoInUIe+cAlOXmjsgrcpK7mtRAG52NWmdaGHAq7fTeUWJXQa/kSM6pooAfKku/fI7k
         fwkUktcmNiJNgAN3qGK9oC2FwA8aOZrHQ3/heaOI8fcbv1S470ztwu9pv9jbajM/vjxA
         bk6Jh7PlxzBvdjCfpQoS1p15iIQ8mPnP0rZLv+b/lIBQW2xbiPc+9CshY8m2NNzKygI7
         y3TUgm0N8rtVDezVJOyIlHT5sIK2k6Lks7sW7wwEdcKr2UAGOmljl9j6DFSNSfL16eMF
         0V/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714587499; x=1715192299;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P+ilE7LHysgerm34X3VBI2LSDwbZAC11W+iUOeY+UZU=;
        b=d02vBwW2HTrNuvE2gwP337VNDMrf1XA4cYWYHRLWtYvYQnRA9gIOWqzgHi7oiB01+j
         c22tupVyIgp1KN7vu5uuihC3bu3SjASPIUlVpdBhrB4SGv11Lr5ISiWIY7HnacdEoYFy
         wCqzG7gOWPiqyZBJgoND11WATfBV7W9TMr94w0DQd/KgSSeNA5+0zSlBwu2pAjT3Ov+N
         DtZvkjtizSCD8Y8b66b2BcBt6t44C1BSHIZxw+V4lmdNJJAr3JPp0R01df5L3I2UWTQT
         r4zMqq2vP+QuntyQ0tPHf1aJNGhMGlTVfo6/1eDfit2a0RXRy0vghMICPX4wwMXjpy7S
         T4fg==
X-Forwarded-Encrypted: i=1; AJvYcCXNTkXpWJvf/H0YGjY1QBrXDiLWF5oBO6fI9FrWWOq5GI7vKvkwwRCeVlL6A7H8z+2D6zT5dZ4Ml64LiTH8eWtM0HkDjlIbAeelWPk=
X-Gm-Message-State: AOJu0Yy5ZAPCnd8scLZP78p115WLNdXT89ADYMMVwxbY5uju8HKK9gYl
	sLqKVWICjd1CA72LJwGjjjON0VoSDDntoIYbGpyKX2Tct9WR+lRCFVX5yUfnUe+I2wmHyVa0ciI
	nTsQ=
X-Google-Smtp-Source: AGHT+IF1HCkCy6svoRSUaJay/ejc/HUt4v4zLG8zTx3Wv9JE9ETe70MGVLv0frMwhmaGkbrliSN91Q==
X-Received: by 2002:a05:6358:949e:b0:186:11ac:36ff with SMTP id i30-20020a056358949e00b0018611ac36ffmr3382409rwb.9.1714587499343;
        Wed, 01 May 2024 11:18:19 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:6448::7a9])
        by smtp.gmail.com with ESMTPSA id k8-20020a0cfd68000000b006a0d7565fbdsm2394707qvs.87.2024.05.01.11.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 11:18:18 -0700 (PDT)
Message-ID: <3cda1b1fa2f689cccb8f212b1a9949cc54a51a70.camel@ndufresne.ca>
Subject: Re: Discuss the multi-core media scheduler
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Linux Media Mailing List
 <linux-media@vger.kernel.org>
Date: Wed, 01 May 2024 14:18:17 -0400
In-Reply-To: <3321FDF4-15F9-45AF-A7BF-36C5CFA863B2@collabora.com>
References: <3F80AC0D-DCAA-4EDE-BF58-BB1369C7EDCA@collabora.com>
	 <77872a349e77e61e69f160629e1b53a97bc472e4.camel@ndufresne.ca>
	 <3321FDF4-15F9-45AF-A7BF-36C5CFA863B2@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mardi 30 avril 2024 =C3=A0 18:39 -0300, Daniel Almeida a =C3=A9crit=C2=
=A0:
> Hi Nicolas,
>=20
>=20
> >=20
> > There is one use case that isn't covered here that we really need to mo=
ve
> > forward on RPi4/5 is cores that can execute multiple task at once.
> >=20
> > In the case of Argon HEVC decoder on the Pi, the Entropy decoder and th=
e
> > Rescontruction is ran in parallel, but the two function are using the s=
ame
> > trigger/irq pair.
> >=20
> > In short, we need to be able to (if there is enough data in the vb2 que=
ue) to
> > schedule two consecutive jobs at once. On a timeline:
> >=20
> > ----------------------------------------------------->
> > [entropy0][no decoder]
> >                      [entropy1][decode0]
> >                                         [entropy2][decode1]
> >=20
> > Perhaps it already fits in the RFC, but it wasn't expressed clearly as =
a use
> > case. For real-time reason, its not really driver responsibility to wai=
t for
> > buffers to be queued, and a no-op can happen in any of the two function=
s. Also,
> > I believe you can mix entropy decoding from one stream, while decoding =
a frame
> > from another stream (another video session / m2m ctx).
> >=20
> > Nicolas
> >=20
>=20
> I assume that the cores can be programmed separately, and that you can fi=
nd which of the two
> cores is now idle when processing the interrupt? i.e.: this is effectivel=
y the same scenario we have
> with Mediatek vcodec?

No, there is only 1 core, that implements two features. The scheduling of o=
ne
core in this case is still complex, since if possible it should be fed with
multiple jobs.

>=20
> If so, this is already covered.
>=20
> Basically, whenever a core is done with a job, that will signal the pipel=
ine to try and make progress. =20

In current model, a job represent the executation of a task on a single cor=
e.
And that task is limited to one mem2mem ctx. In MTK, to fill the pipeline, =
you'd
need to pick work from possibly multiple mem2mem ctx.

>=20
> i.e: you push `entropy0` and `entropy1` at the beginning of the pipeline,=
 that will cause the entropy=20
> decoder to start running. Whenever the entropy decoder is done, it will t=
ry to schedule the reconstruction
> core with `decode0` and start working on `entropy1`.
>=20
> When the reconstruction core is done, it will push `decode0` to the pipel=
ine=E2=80=99s output
> queue and grab `decode1` (from the queue it shares with the upstream core=
) to work on.
>=20
> That way, all cores run concurrently, so long as there is work to do.
>=20
> =E2=80=94 Daniel


