Return-Path: <linux-media+bounces-14865-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0096A92D431
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 16:29:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63F9B2883C8
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 14:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED94193479;
	Wed, 10 Jul 2024 14:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L4f1GDgM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689E3193461;
	Wed, 10 Jul 2024 14:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720621753; cv=none; b=duqh5rdh5XXZrN2Gvjh2oIMtr2Gq1DNT5ZBsMwPlFQ5Smo+KFTID0sCz0oD07658cMh7Usowsiq1rCbXVN/wRPdvtnTRjgJAg0x+Xb3VGM+1W7uZjf2VhGqeHfd/TFQbYf2a8Hzcvs75cMsWw3lM54PE69uIjYsGElLzl0OS+qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720621753; c=relaxed/simple;
	bh=c8gJnKjoA3sk0MHNnCyDf7HxbJLOHfbLKYv1jyslxAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZykZ5I8MouCZjqolb3yCDae/hryk+4KErKWrFoZLbeZmfRsRrjyFrUw3CqdO8/XP/aCu+rAkUcriEVxtr7oY+eSdcU4WreJgN7WkIZAJ3vDkK4Gr8YzZ/en3y8rk92Ld9YIPPXK3QGoqkj3PisY6xRFnHQhQUtBX4DkibqfVv0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L4f1GDgM; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-58f9874aeb4so7312571a12.0;
        Wed, 10 Jul 2024 07:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720621750; x=1721226550; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8gJnKjoA3sk0MHNnCyDf7HxbJLOHfbLKYv1jyslxAs=;
        b=L4f1GDgMWix+sFh58pxaWxMjzL9VJ/llpD5bJYEFo8znBjcinBQw0QqZ9leGBwGcBU
         OEivl9JYzOFkIFipqHjXJhtNQSAKL4CMMnJpSHrl9L9W83zaRSGofiNb2Fqk1EQuZbPg
         wNgphh921QejEGSdN8hvdPW5OxQGRFUYuozjjJuLOM7K1O6RQSyR2TDBBuxR2kkC/ee7
         faIXRfON6fGy3lHFDfxTknwPkVYDMB6gBgAc81YdVBTPOdFWgNXpRuzoyUgLsPKsBwlf
         27r/gMyP/rsS2ip0SgpUYbRun4SIgBG6mvbc6vPFMHJvOIGIHyQz99RysFB3MOhWzzkH
         tl2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720621750; x=1721226550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c8gJnKjoA3sk0MHNnCyDf7HxbJLOHfbLKYv1jyslxAs=;
        b=gZaMdPSWE+nnK06rleY3kjvZqI61fKjtwtjxnycoLuUJxdUeDq1k1MZVQV1/NHJYZf
         l9c5LZHy2df44tzf91NeeBQFtt33e/NB0ZuKB7CJ2BuTlF37Kv4Vl7POjQJmC3/8+lCM
         xYvL1PjBka3cM4Q4D/KjEYGfOS39addq28L+oP4z7XgWW78OPbrpuRWS0jMjvd/cP/MG
         +KTmMrRxtx+oa2776YLxjVSB1M6/0oKmr0MMGqWuzxmXVPL3NRDGBedSC8dMf+BbNIpp
         C+o0s8+e7YTAommdUrqzvjaYo/QqhVSTP102IA9PEB2PPTqfcg5BWT4cwupOKyg4c/j4
         0eLQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8Z6Rci78hCRit2Ml5fe4HhfmROqkVpmL2TNGhfyKw7kgF+ydqubszIi4/n2pb4OhklYkwFXZP2tp7ZT8jw4uVNiThpBVl06VsQrT73QEB0DvfYWaQ9DHA5/hE0fSDmyrK82TIG1QlwBVjpqJw0VLyQOmtMrv1Qe1tnKwZOX8DImFKOHO3
X-Gm-Message-State: AOJu0YyufHtfpHk0K9Cfd5O07SYiu1miOCQwpSntfja0VFyjhnO4Fo2H
	jE9iJ+DdY8zr7w5VRSW+NulXWLA1+HF3wVNf7kqhcIV9hdykz1PLQ+tUu6voB0uLPEidelY6HFi
	58O3lDw8WQsX/iJ8Rz0VXRMZYdJY=
X-Google-Smtp-Source: AGHT+IFA5+m5xZv4TYCT5QPxWx1vJf/iXq68BQ4T7QErwC03UwTWky2h2CUAYZOmGS5DJLngCY+qzVcAGRFLZMxsAl8=
X-Received: by 2002:a17:907:868e:b0:a72:4d91:6223 with SMTP id
 a640c23a62f3a-a780b8849cbmr438447066b.62.1720621749595; Wed, 10 Jul 2024
 07:29:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124011459.12204-1-jason-jh.lin@mediatek.com>
 <20240124011459.12204-2-jason-jh.lin@mediatek.com> <f91d3ac1-0a7d-4ca2-bf0f-c5e471c2f6bb@collabora.com>
 <2a2a939c9cb56de0383ec3e42db9bcf8e8518775.camel@mediatek.com>
In-Reply-To: <2a2a939c9cb56de0383ec3e42db9bcf8e8518775.camel@mediatek.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 10 Jul 2024 09:28:58 -0500
Message-ID: <CABb+yY2_oJ_AC2w5AgHMBvqFDeyaUq9BLczqY8JhLFPDnfzY_Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: mailbox: Add mediatek,gce-props.yaml
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"robh+dt@kernel.org" <robh+dt@kernel.org>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	=?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, 
	=?UTF-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>, 
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	=?UTF-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>, 
	=?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>, 
	=?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"fshao@chromium.org" <fshao@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 26, 2024 at 10:04=E2=80=AFAM Jason-JH Lin (=E6=9E=97=E7=9D=BF=
=E7=A5=A5)
<Jason-JH.Lin@mediatek.com> wrote:
>
> Hi Angelo, Jassi,
>
> Could you help me apply this series?
> Thanks!
>
Please get it reviewed by DT maintainers .... Rob or Krzysztof.

-Jassi

