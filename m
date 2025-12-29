Return-Path: <linux-media+bounces-49649-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 841A8CE74AB
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 17:04:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2603C301A1FB
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 16:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D791F32E74B;
	Mon, 29 Dec 2025 16:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AvU8x32w"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D01C32E6B4
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 16:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767024285; cv=none; b=sKLMOXX0ktJ+DTa9kY39I8U7NCc0wdxzJrPeQdzKYzPSHGjjMyNR+vlERbS1n3GjhWM/EXwnTvrAWuJzBca0teVEfqQUAfOU2lNnKK64Yj0hjTkdQ6NwNGUX/xJZK+aUjsUSnWlaI+X0Eo/DscJKSBiYoxj1nQNzI3CxznyNcms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767024285; c=relaxed/simple;
	bh=eoQ6TjP0U6zFg/WIh3bDnspBDved8nX/cYF0YcABtZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Szcn2incy3ITYqCsry6iYc8tHTukSo8Jqy0AYZ2P1gOj7MEWf2gexkPjVrlswsZVwq8a8pXB+EaTINZBBG2sq7zIEvBqesXLYLqONGOsBvg/8Z7xYOVq7n685ZoGF9A/vRQY9rZYHSwlAKuE/Ee/jwsWJExAMqbTwws1TKc7lk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AvU8x32w; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-34c1d84781bso10508741a91.2
        for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 08:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767024283; x=1767629083; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eoQ6TjP0U6zFg/WIh3bDnspBDved8nX/cYF0YcABtZc=;
        b=AvU8x32wzMXs/cDkGIQ6pWiObqmIVeD1Ou0eHjmRb+OVs/TxfTkVxW3OP4wpRpdFlj
         iQPRkTM3DjlrMatZepNZjY9GtbyHGE4xGrLyyb0op3impl2k+GruTK49dhms5BePinSY
         cBk4KiEMt1rxyr6mcw9pejqakEp/p5vC9kXK7pAv1sJNTIGQag8oc+h1mQIxzEFv2ZwK
         MNBImxWA8jPIXObzeow9KsNrjT66CziWfixS3LklImNF2hroNXB5muJVijS/Hb/V4T9y
         YLWmgqxvyCyuwSbG+b0NS02WGO7Ezl/PnKscktVULtkB6X+BVOQVPbO55ds1OuI8cKId
         NrRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767024283; x=1767629083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eoQ6TjP0U6zFg/WIh3bDnspBDved8nX/cYF0YcABtZc=;
        b=NLND8x0y0p2/TsJorpXbQ4KpRJfAjJ3ffTDny/6YIo2s0W1515A9s0hYw1SW0YQK4I
         d1URjz/rWME/ZApIoJz8PGEuOJRbN/k+KVPP4ShVDLNpjuqxrs01VgVFOuASEQSNjntI
         ymfm7Z1LtuYfwG3xYKCvlgY0L6fAfHOPJPrwkdE+Nv4ipv0GwEqw2+Z3Vu5FIOpXie7A
         qp/KxuaQlijldHLJrcPR7DkKV2fcAYaKolVHwd+DC3aRU0+HGbnQU2AcN7vylIMiNuCD
         zKQY+hT5LHNkWasn9ZYslyvOhWV/LzbDcKUVq51pwAEGE/9C/g6IjjzSk42BYqDjUaMY
         ENWw==
X-Forwarded-Encrypted: i=1; AJvYcCWD7/AdHUgT7CN/ipy+i1a2hgDIxJ5Ar/B0QlMPVx0IYmZYOEpPuOIoDclSi8+LJmUhtl+bHsW1LPtPVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXGyHxM6SzjXL6Xg41PJ8pOWxq0GTdzIyoaKzTUiAV8JV4NKtg
	b+z6hxt2MtN5307wav1d7GoHRW0lKNIYaNi6tyq/MqnX9o36spW8/3ptIyL3M3uUl8fp2uq9RRB
	pChwTrbF1Jt6IB+EmmIr36iWkBo+pYTE=
X-Gm-Gg: AY/fxX7TLyfpwjhABDa5aUudfJkEpTJ+qJHo5TrXknL3RYA7Kh+wmLyiToNQSB/7jNn
	lj++7LoKbC4pM37d8/bnEbnjIHA6N831RB3cphNJ76wsGoJ2Ux6hCGTsmT0N6oJtiT5Vo28QD7E
	XJ9L23XZae7tzZXUrnwq7Lxj5c/X0kp/zSdXHaoEKbr5ySo/hP7Ty/CjZzMU4jASpG26qikPgKZ
	JVvf6SHeK4e4VTQwge63tzw4Rapp44G/8lPIloSklCrGQTc4zI4g2OVbrqylpf0ivhpsKo/ThTQ
	iBrzHvEvkiN0ob/nBpPpGBS9VuV/Qg==
X-Google-Smtp-Source: AGHT+IG+GgX/x8tY+W4R6BDIQuWdLL1jiny0l219vGTzeEkbjR1NoxlxIjcj9q6SdajUF4TPJ6WjeLLERmL/5RqrDM8=
X-Received: by 2002:a17:90b:2585:b0:341:8ac6:2244 with SMTP id
 98e67ed59e1d1-34e9212a9fbmr26453852a91.9.1767024283198; Mon, 29 Dec 2025
 08:04:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120084926.18620-1-opensource206@gmail.com>
 <832f4621-53af-465a-a5e9-f7d65a082481@linuxfoundation.org>
 <CAKPKb8-qyqMmp6c9OnO+AapRRJyE8ygtQUyuUqK8+C0LvMTYTg@mail.gmail.com>
 <CAKPKb8-8ctSewOwBk7fFUMVnb-F_gXnyXS8gd9xJ-fpnW1_ZYA@mail.gmail.com>
 <b5240bd1-eee7-47fd-be70-88435519b12a@linuxfoundation.org> <CAKPKb8-VW3C8c-BmwLEWdLXZ8LVuH_MDMdVzzFs6O8QWmpDeuA@mail.gmail.com>
In-Reply-To: <CAKPKb8-VW3C8c-BmwLEWdLXZ8LVuH_MDMdVzzFs6O8QWmpDeuA@mail.gmail.com>
From: opensource india <opensource206@gmail.com>
Date: Mon, 29 Dec 2025 21:34:32 +0530
X-Gm-Features: AQt7F2oerpc_9amvflTtqUl8AmDSBFbTxJ63YPslAzW0GEkApQmyVZgpAbUmBtc
Message-ID: <CAKPKb8_PGYUStAovWjWG8XxabjB5WuT7kQ3qxT3NuYSKihgDDA@mail.gmail.com>
Subject: Re: [PATCH 0/5] media: vimc: add RGB/YUV input entity and improve
 pipeline support
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: kieran.bingham@ideasonboard.com, mchehab@kernel.org, 
	Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shuah,

On Tue, Dec 16, 2025 at 8:27=E2=80=AFAM opensource india
<opensource206@gmail.com> wrote:
>
> On Tue, Dec 16, 2025 at 12:40=E2=80=AFAM Shuah Khan <skhan@linuxfoundatio=
n.org> wrote:
>
> > >>
> > >> Hi Kieran and Hans,
> > >> can you please review?
> > >
> > > Hi team, can someone please review?
> >
> > I will send these up in my pull request to Mauro - it might be
> > later in December of early January.
> >
> > thanks,
> > -- Shuah
> >
>
> Thank you so much Shuah

able to pick my changes?

