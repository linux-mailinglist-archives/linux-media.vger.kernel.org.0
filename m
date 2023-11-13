Return-Path: <linux-media+bounces-288-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 067A27EA286
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 19:04:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B39EC280E9D
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 18:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79CD122EF9;
	Mon, 13 Nov 2023 18:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qO1JFdIE"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C94522EEF
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 18:04:14 +0000 (UTC)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86CE610F4
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 10:04:12 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1cc79f73e58so5705ad.1
        for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 10:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699898652; x=1700503452; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANsBnkxIEizgy+Rx0aSYLP0EtZ8VynwdjpRWu4uknns=;
        b=qO1JFdIEn4Nvh666UXvPHmpz+qydWVvt55AcYooiAMrHZeUoTEmI8D+xCDQva1cqBh
         0sUl6x1SUm859jcNbNGhFFkfUTNnlqmXVuNluts3VAlhHMAJPjAX5w4tBJl3G4HgTt4V
         Mw/oZjLfs2YvTTCqo0cCgX1MgIbIyMuPO+qvwc0z4Ci8EW2MzvPntmK11QmYMw0ecGMl
         pkl8utneiyxRJXJq8PUHxtZGpDTgjuAwE2P13Dc869L1SX0VXRKwgwyokXM9NIVrng4M
         rGdGsDc0mueDs8xFCuUb22cj0DfnkhHnmEN8/6iLjozS2tCMUl4gOP9VtDmgZN/xkBWC
         3cXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699898652; x=1700503452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ANsBnkxIEizgy+Rx0aSYLP0EtZ8VynwdjpRWu4uknns=;
        b=d89ZtjURofQkAflj5zvzO5DAyYzBWI5/bIPYu/qffV9+Y+rNCzr96MNmDtFLAKxje2
         6eELUW7UCosGzslcXKIRw8wsE6lK58mJ8cdKeq/ovxOIzprqmdat2tG8bBrBSVaR8YVf
         5MywXUjslO/4vCyXGGS5ithqX2CAC7BaYFaWDG3rJ6IeME2JH/3Te1lK7UFnrxHKQUMa
         G/jXsd2SPDtNT5ZN/nO/ZeRPfnBlzxUDooQ5Gz+pJY1RtC2gUW23VZencPJvG4mih/D4
         AKuB/ROx7l6RnBeKNavE0L/chrRkIWnJMdjp9eTqG05nRB+wgHzswGNyHo6xnyTJkesD
         PoQA==
X-Gm-Message-State: AOJu0YwxUUjHmN/6hm99gDaml5hY1WNqnYCuz/NF+GkT0GhsNrp+S61w
	3CM2VhXasBTVug0Zqh1zPyvOBFFNuaFOeEt5Za/9
X-Google-Smtp-Source: AGHT+IHb03F7T2KTb6TSXiR1tmUr6UGViGF0nZ4nr88w91aDnu2AAQ+8uxUpsoeNCFN6pRoOfEgnDys2xBb/WNxE3dc=
X-Received: by 2002:a17:902:d491:b0:1bc:29c3:5895 with SMTP id
 c17-20020a170902d49100b001bc29c35895mr19363plg.0.1699898651665; Mon, 13 Nov
 2023 10:04:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231106120423.23364-1-yunfei.dong@mediatek.com>
 <20231106120423.23364-5-yunfei.dong@mediatek.com> <ZU/D3iDxIW6Q8bOq@duo.ucw.cz>
In-Reply-To: <ZU/D3iDxIW6Q8bOq@duo.ucw.cz>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Mon, 13 Nov 2023 10:04:00 -0800
Message-ID: <CA+ddPcNtZ5XRNZOOm4+C+SBpo0jLWpMZ1xOPrR-Dj_CQpT9s5Q@mail.gmail.com>
Subject: Re: [PATCH v2,04/21] v4l: add documentation for secure memory flag
To: Pavel Machek <pavel@ucw.cz>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, "T . J . Mercier" <tjmercier@google.com>, 
	John Stultz <jstultz@google.com>, Yong Wu <yong.wu@mediatek.com>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, 
	Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mediatek,

What happened to the RFC cover letter that explained more overall for
what this is for?  That should be included in the 0th patch for each
of the series.

Pavel,
This is for secure video playback where the memory is 'secure'
(TrustZone in this case) and is only accessible in the TEE and
specific HW blocks. Userspace has FDs that reference the memory, but
kernel/userspace can't actually map/access that memory.  And yes, this
is for supporting DRM (Digital Rights Management) playback.

Cheers,
Jeff


On Sat, Nov 11, 2023 at 11:06=E2=80=AFAM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > From: Jeffrey Kardatzke <jkardatzke@google.com>
> >
> > Adds documentation for V4L2_MEMORY_FLAG_SECURE.
>
> > --- a/Documentation/userspace-api/media/v4l/buffer.rst
> > +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> > @@ -696,7 +696,7 @@ enum v4l2_memory
> >
> >  .. _memory-flags:
> >
> > -Memory Consistency Flags
> > +Memory Flags
> >  ------------------------
> >
> >  .. raw:: latex
> > @@ -728,6 +728,12 @@ Memory Consistency Flags
> >       only if the buffer is used for :ref:`memory mapping <mmap>` I/O a=
nd the
> >       queue reports the :ref:`V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS
> >       <V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS>` capability.
> > +    * .. _`V4L2-MEMORY-FLAG-SECURE`:
> > +
> > +      - ``V4L2_MEMORY_FLAG_SECURE``
> > +      - 0x00000002
> > +      - DMA bufs passed into the queue will be validated to ensure the=
y were
> > +     allocated from a secure dma-heap.
>
> Could we get some more information somewhere? Why would userspace want
> to work with "secure" DMA heaps? How exactly are they different from
> others? What attacks are these secure against? What is goal of all
> this? DRM?
>
> BR,
>                                                                 Pavel
> --
> People of Russia, stop Putin before his war on Ukraine escalates.

