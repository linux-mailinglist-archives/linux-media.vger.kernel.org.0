Return-Path: <linux-media+bounces-19696-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1333999F4F0
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 20:13:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE06B1F217E9
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 18:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C8EC1FAF1B;
	Tue, 15 Oct 2024 18:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="LWYFkJOp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC34018870C
	for <linux-media@vger.kernel.org>; Tue, 15 Oct 2024 18:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729015991; cv=none; b=YxrabknyROuo6D66wSyRJEYlZo6BwQsrqjY3vIKqm7r/4Ha7AESOU6hsYvBU3z27pfrC8AgyYchKbN7zLrsS6YuLAXablIA9Y25uokPJ3NBXciZTTncJSX3E6U8iuAgv5C7c3rketmAkVZW0cxcHQxXMcwmILLDngesrqSc8OJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729015991; c=relaxed/simple;
	bh=2AaojpKnjmW9HaHN+cfhOlEiwUr+JwKrOUeuBkUAitY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kf7YQqISwxszDcvojrwYhPcGCYAvYm4GrIQz7eJTFcVj5hDGqkSBeWX/j8kIsa1EgSXLQQTsIGZg7V7yTD7PeHdTyjpkLsughEdxtfdrv6gQeTgiNNOnU0L2B6hiQfTO7F3aIcRuZuYnhGItRIuTHHI3TnqeBSipSCxv70gdYLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=LWYFkJOp; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5e7ff0d4681so2110372eaf.1
        for <linux-media@vger.kernel.org>; Tue, 15 Oct 2024 11:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1729015989; x=1729620789; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5oxml2lN+ntX74kObb20hwl1g01p5AhViL60OxChXmk=;
        b=LWYFkJOpmhwlBlbY5O6sGcou6sfk6qOrfpnOh3kmbu0dUPEw+XbWusOtljhZ0Pu0uh
         ardW0gpU5K4IO9J6M7i+GgDjnJl9MoU0Lu2CB1E6AMw05uiq3VM3WxJfYiBudEm8FfQQ
         TyOcLbK9/p6UhiUfYxFIcBOW2NL7nnhqwLBz6d1ahW1WBYicU91PbIFz41rJixURbWcU
         BMPYljupmk36Jkgcfz2kspru0U5E7Xw0zft0vhnuDQ9AwcgmrTgkoP01tn5vG67/5qPU
         /RqCWeYB3/fNucMOB3ZDbFHP4tHhKe6/irTeyLFtnINbhTxXSMKOagERMBV7bV3Xuc1T
         on4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729015989; x=1729620789;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5oxml2lN+ntX74kObb20hwl1g01p5AhViL60OxChXmk=;
        b=I0ICLz0p0SR5L19J/IrXs0kSodnIKQOnKs+e4DrH1tXtjHlr0BDXYzMbb8BvyNfpyz
         wRRQLKc7HHpFVqN1hB4AqyJKjUDW/85hJYiBE/YdxSpyirsY76HgINxtQHOf8Y2MN2eT
         8D6Jj6HS8uwvTcXZW+4xpJmM1VPtgmwzN8piErkDouz8QTNJAtYgVeSvb8UdCXYBPl2j
         sKrpxTXMKKnMpsZZMqKCqI2+se+2vWw7gZcCwRBxiqokrm+gnX3BSGS3Q4NmBcDQJIE6
         tcvOCta8qyptptUgD0WBzMHmDCyzMj1kniNs+DrdEK7tewdWgSeSBaOhVRUzc4blFmcV
         i+1A==
X-Forwarded-Encrypted: i=1; AJvYcCV2DFdK8y0H3mz6Jgn2Stio8orit/dXXaK+zYlD4lvy2d7FMjLmHDpEZPJHLL4b460bPaGtmRZuhtv0vg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5bB9BUYbvfrqmB+O8fXtqjNledUucS7Rp5oRk861eIotfTA7B
	AVNMC8fpgbZj/b0hC4EWAtQpfymYeN0Px7pHCtvekpfQsQ5oAeNlYWhs0k4/HLQ=
X-Google-Smtp-Source: AGHT+IE/1zf76YUX911aLGIJHXfaOZW556q/vVashhOD3oqJyrmYteHGq4kOCjf4Niews2uJm4FHLQ==
X-Received: by 2002:a05:6358:248e:b0:1b8:f18:3e6e with SMTP id e5c5f4694b2df-1c340d1aef5mr251119055d.12.1729015988990;
        Tue, 15 Oct 2024 11:13:08 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:15:862e::7a9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cc22959b42sm9345366d6.76.2024.10.15.11.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 11:13:08 -0700 (PDT)
Message-ID: <5be2dbb2a0a3a7964a064013a5271f585247ec22.camel@ndufresne.ca>
Subject: Re: [PATCH v2 2/2] media: imx: vdic: Introduce mem2mem VDI
 deinterlacer driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Marek Vasut <marex@denx.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-media@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Fabio
 Estevam <festevam@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo
 <shawnguo@kernel.org>,  Steve Longerbeam <slongerbeam@gmail.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev
Date: Tue, 15 Oct 2024 14:13:06 -0400
In-Reply-To: <0da39b8f-4cca-438f-9a39-40da7c34c895@denx.de>
References: <20240724002044.112544-1-marex@denx.de>
	 <20240724002044.112544-2-marex@denx.de>
	 <85a5a42667e5867bc45da31baf045d4c9557f5f1.camel@ndufresne.ca>
	 <6b45e30c-b215-4f7a-91a4-fde05d78f737@denx.de>
	 <b1c5fb155c77355ef2889b6e054a5c0696481ebd.camel@pengutronix.de>
	 <0da39b8f-4cca-438f-9a39-40da7c34c895@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le jeudi 03 octobre 2024 =C3=A0 16:57 +0200, Marek Vasut a =C3=A9crit=C2=A0=
:
> On 9/26/24 1:16 PM, Philipp Zabel wrote:
> > On Mi, 2024-09-25 at 22:45 +0200, Marek Vasut wrote:
> > [...]
> > > > The driver is not taking ownership of prev_buf, only curr_buf is gu=
aranteed to
> > > > exist until v4l2_m2m_job_finish() is called. Usespace could streamo=
ff, allocate
> > > > new buffers, and then an old freed buffer may endup being used.
> > >=20
> > > So, what should I do about this ? Is there some way to ref the buffer=
 to
> > > keep it around ?
> >=20
> > Have a look how other deinterlacers with temporal filtering do it.
> > sunxi/sun8i-di or ti/vpe look like candidates.
> I don't see exactly what those drivers are doing differently to protect=
=20
> the prev buffer during deinterlacing . Can you be more specific ?

drivers/media/platform/sunxi/sun8i-di/sun8i-di.c:

                src =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
                if (ctx->prev)
                        v4l2_m2m_buf_done(ctx->prev, state);
                ctx->prev =3D src;


What that does is that whenever a src buffer has been processed and needs t=
o be
kept has prev, it is removed from the m2m pending queue
(v4l2_m2m_src_buf_remove()), but not marked done. At the VB2 level it means=
 that
buffer will keep its ACTIVE/QUEUED state, meaning is currently under driver
ownership. I also expect the driver to start producing frame on the second
device run, but I didn't spend the extra time to check if that is the case =
for
sun8i-di driver.

As for GStreamer wrapper, since it does not support deinterlaced, it does n=
ot
always allocate this one extra buffer for prev. If the driver implement the
MIN_BUFFERS_FOR_OUTPUT CID though, it will allocate matching number of extr=
as.
Though, this has a side effect at driver level, since start streaming will =
be
delayed until 2 buffers has been queued and any way you need to queue 2 buf=
fers
before the driver will produces its first buffer.

This comes to the next reason why the wrapper will fail, since for each buf=
fer
that is pushed, it synchronously wait for the output. So it systematically =
stall
on first frame. As the author of that wrapper, I'm well aware of that, but =
never
had a use case where I needed to fix it. I will be happy to accept support =
for
that, though in current mainline state, there is no generic way to actually
know. One way is to thread the transform, but then GstBasetransform class c=
an't
be used, its a lot of work and adds complexity.

We can certainly fix gstv4l2transform.c behaviour with adding
MIN_BUFFERS_FOR_OUTPUT in upstream drivers. That would be easy to handle wi=
th
adding a matching buffering delay. These deinterlacers works for Kodi, sinc=
e the
userspace code they have is not generic and have internal knowledge of the
hardware it is running on.

Nicolas

