Return-Path: <linux-media+bounces-41592-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D24B40403
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 15:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D242A188E1BA
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 13:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85AF3112B3;
	Tue,  2 Sep 2025 13:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="c7Zve6wW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7B92D9ECA
	for <linux-media@vger.kernel.org>; Tue,  2 Sep 2025 13:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819842; cv=none; b=tFEOHEtfJJxdzzZenfhd7a7YNirYV1TYyBrqeu2g5x9aIwcnlclBOWx8OK08jE/TbFwmgFLGTnraHn/w3PSH9qfLENv/Sc7ZOfisZUElG52J5eAcbx9epCW+yP7QwLNamLJaQVa5h10RNwKv5v6AJfhXaBlBebuvXptK90kgfz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819842; c=relaxed/simple;
	bh=OLHhmag7Mnt9lXi3QwGIWfYDMQGjZIebNRX4qQsseBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zr5pUPD6DEh133X40BU7NKEtZ/lwoYTgzRZ9LFS/LtJd96vE6+DjnxBmxXouNQy7VwVuljwM00L0Jc5j4P7/97dFDPl6y3fvzb4470IofY9IMimADmO6JaU3SrRtDsmCJhuYx64QXx83LkW2gQFb3AuZea35kDUjPaqy23EBsZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=c7Zve6wW; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b4cb3367d87so2975705a12.3
        for <linux-media@vger.kernel.org>; Tue, 02 Sep 2025 06:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1756819840; x=1757424640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQdIhkcAqAjJzHCxGEbBUO4b5K6zRA4syYceYBD5k54=;
        b=c7Zve6wWIq2gRFBy4QenV9g3qDkFIOqpEXK1Z7ycZTPRVMq1MvVdRg2NDRVDL1WZIM
         fJe/QVQ69npFJprvuSFdiF45iczl9w7nr3JlO+81T0S6iym086LLGTKiHRZoDR4X2ADt
         0h/XeB8vUhOM0L64xEgBrKsrkOL+Pu/6pd65A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819840; x=1757424640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MQdIhkcAqAjJzHCxGEbBUO4b5K6zRA4syYceYBD5k54=;
        b=sedM5thgO+CKBd3xY/YdrXau8pc5M+wfQiBqCXnRWOK2EHinboM154OF+t+HJ7+aEO
         zKdiJ46uIBgU7Rl29T32EpXZFLGjG2VrdRPu6VxuTQwJIVwpZ65xNJjvICgvM7W2AZj8
         Dr6epdfuIG6SbE+Bmu/9tV/SiYfE/+DvaRcyW37muo0ntuiVBRjiHOfrQuQAxmWy1Bdg
         Z/mG+qaaGsX6NQtkhB0/9FRFrLTSL8Qf4kio6Gyl3RHJ44bcQbCJ9XDGO/VKPjQFgflk
         lxhTxaModSwNOVLFPL3k43yRqa6/VKB8wJFRXFnHYPkEt2lYryh9l6yP+yiE2q/bXA8K
         Y/Fw==
X-Gm-Message-State: AOJu0YxxL0p+ruP5X4Iw5xfsPolmHKK0vAt6UaY/o0qJXf2hOzWALCN2
	FOZW4PBKFKuX/nwmAry3uSjw8FbbDb1ua531CWoTZY4zVeJGI5Cv0rW5XBRs/bTQQ91rfuEem69
	tPhSJizjqp8a6YXRJbD/WjAf899o/5FMlmd3aOj3tfQ==
X-Gm-Gg: ASbGnct+f7aKs3Js8qOnv/Lb3RCvcsKbh5EH0c6169rpreEkJs7W4ggIh74Subn4m9C
	9YomZxyP6qSNahIcbatuRK3V94eIOc6tlZIEC0kVgzG5ynOYfmhSWiXhdVjG2Dq4oSOjXCSp6qW
	YYpshNEjDJlEXQLE0Min0rJMRhoTKzgibTrIL7pIJCDELSKRmAIc7FhfJ7SIJpvOnioxFnZ4d4h
	we1NK3bg9Tp2svBXIeuJzfuUqeaan8=
X-Google-Smtp-Source: AGHT+IH8mj0p0QU7AMqmPJZUgnPgs/UHsTvibAkA/fEpHT9Z8HZcFHyof4QL8ZKNLcAv+k7nCpqP4TbT9oC8Ophl/9M=
X-Received: by 2002:a17:90b:4a92:b0:328:a89:71b9 with SMTP id
 98e67ed59e1d1-328156e17d0mr14751281a91.34.1756819839694; Tue, 02 Sep 2025
 06:30:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOf5uwmTTFcizew2QRAr=TZ12hTfXg6NFEsDYKASB7wPeB4odw@mail.gmail.com>
 <7b37c5679994281ae1806f2ee84d1aede77ca836.camel@collabora.com>
 <CAOf5uw=uPkC60gE7Ea_ZnEZdYJRYRJKz=OVUN0RvO_NVe2tw5A@mail.gmail.com> <96dc1231c7d18f8106e4b5e56a336add377ee235.camel@collabora.com>
In-Reply-To: <96dc1231c7d18f8106e4b5e56a336add377ee235.camel@collabora.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Tue, 2 Sep 2025 15:30:28 +0200
X-Gm-Features: Ac12FXzn_GfV_XxRUKa6bD18P6jpKDuo6ojPuDI6AR2WKq4RGK4Qy0QMFBY4GWk
Message-ID: <CAOf5uwnofTZ1ARzqAD0Tevz_gX1w=Uv5b7Q8=-ZnwQpioZvXuw@mail.gmail.com>
Subject: Re: Hantro G1 jpeg decoder stm32mp2 (plain text)
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: linux-media <linux-media@vger.kernel.org>, 
	Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nicolas

On Tue, Sep 2, 2025 at 3:13=E2=80=AFPM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Hi,
>
> Le mardi 02 septembre 2025 =C3=A0 15:01 +0200, Michael Nazzareno Trimarch=
i a =C3=A9crit :
> > > If you only have one format support, you don't need to force anything=
 in
> > > GStreamer. Some extra information about Hantro post-processor. When u=
sed, you
> > > need to provide 2 sets of buffers. The decoder will still produce NV1=
6, and a
> > > secondary set of buffers is (in parallel, pipeline mode) written back=
 into the
> > > format you have configured on the PP register set.
> >
> > Those sets of buffers are provided by gstreamer or how does this
> > handle in practice for
> > other decoders?
> >
> > >
> > > The post-processor can also be used in standalone mode, but this feat=
ure is
> > > often fused out. In that mode, in can input interleaved YUV, as often=
 produced
> > > as raw format by USB cameras (and most cameras using serial links).
> >
> > Much better. Now I need to understand better about the two set of buffe=
rs
>
> the V4L2 API does not have the notion of primary vs secondary buffers (un=
like as
> an example Vulkan Video, which is 20 years younger :-D). So we endup hidi=
ng the
> primary buffers inside the kernel driver [0]. Just notice the this alloca=
tion
> allocates reference buffers for the decoder, and the decoder actually all=
ocate
> the final buffers. This is quite convoluted imho. Note that some importan=
t fixes
> have happen on this part of the postproc code (which arguably still need =
a lot
> of cleanup, a proper split between G1 and G2 (and merging back VC8000 int=
o G2
> since this is largely compatible).
>
> https://gitlab.freedesktop.org/linux-media/media-committers/-/blob/next/d=
rivers/media/platform/verisilicon/hantro_postproc.c?ref_type=3Dheads#L224
> https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/db30=
0ab0e9d38b1e1b0b561333b66a5beacb9994
>

Ok, I read the code, but I have some doubt:

- the NV16 and NV12 are both available as the primary buffer for the
decoder but you don't know until you plug the camera and start
streaming, so I suppose that in this
case the size of the primary buffer should be computed based on the
biggest format.
- I think that hantro_set_reference_frames_format assumption is to
keep the one supported from decoder and match the first one match the
bit_depth,
  so it can set as reference the NV12 and not the NV16

Is this correct?

The postproc_enable happens if we have prepare_run it means that the
buffers are allocated already but the buffer will be known only when
someone
enqueues them to the decoder. In such a scenario is there any driver
already solving it?

Michael

>
> regards,
> Nicolas

