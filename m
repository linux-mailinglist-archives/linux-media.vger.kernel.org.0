Return-Path: <linux-media+bounces-5940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D82E86756F
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 13:44:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF39B1C22D6F
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 12:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AED27FBB0;
	Mon, 26 Feb 2024 12:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H8syFrFb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730037F475
	for <linux-media@vger.kernel.org>; Mon, 26 Feb 2024 12:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708951449; cv=none; b=jUehXPJsWZA+lT0y7/YVe4RO1K63E4QaoJlnLIfSV6hSthy8QBCddEvm3pxUbpyXJ3+Qu3sSI8BeEWZ9awJ/Zdw4HbaFLYMBNwq2WCuqNfEL9Vu/pPdiX3fhwc4NWCWRiiUSWIBa4lCpCADR5bURrArgPdCwjgKG7AOkdoYtbm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708951449; c=relaxed/simple;
	bh=VGOF//hEPOKVInRy9u/t4EELWuVUy3vArJLdV3NkLOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oXVh1crsj/RzmcMXZM6Lf8Yd7vK3z82dc7EynsZmeHiOtPUUjseGflxMF0YkzZFnEQ9PK+gTywAi0mpobHPOd63AUuQNqhz8cL2AATuCxq4u0Wfi+xdVziLK5jCEUTh8d4/4VtFzvRc+lh3IHm2eDYk9OhAYZaroHojds09xj9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H8syFrFb; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7c72294e3d1so147961339f.1
        for <linux-media@vger.kernel.org>; Mon, 26 Feb 2024 04:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708951446; x=1709556246; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+35+P4r2JIren/LNJaaaherP1wCOAvB2HpC0DyEeMg=;
        b=H8syFrFb9/7hwuQYGNNJLkZYo4lqzE58RFdyMuyd7KQR8uHVLXOY7wGlPvPl7y+2Bf
         oUDO+WKQkkBYTfZmQ/k2c8z6XKJ5Zg1EOVkSo9emX33xVX+toBsMwJiz5CZnY94oF0VN
         xbz34HTA9pdobQN2BSCR+i4TqLahgXt2SnbNcerhyZ574fKjjJLFFe+9nshMGsHyZCXp
         2A5ZTZw9VYH9jkG4fwzXE/Fvh9z8pj23fEvEw2zQx8wESTc3kBcsUO1HTbczX2+OfN0o
         VZJZOkfyrsdKKZl8oSo7S8VTMoMxAT05VJYODHDNFN10t7W+3fOe2I1E2D7fodfGTQ+/
         EUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708951446; x=1709556246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q+35+P4r2JIren/LNJaaaherP1wCOAvB2HpC0DyEeMg=;
        b=xI6X+n6DKwyJRpfuHkf2vhKW5gIXs+OQsw1cn48KLlj8dxKW6qxuonie7mVaJ5Nrvk
         g+q41vyyiQFVd0z0z7CjUj0a6VQPOtzWp2sQ3ItuTyi+FqhUt8YR2Fnk7ECqERX0luVQ
         O0QKSZeN9e8oJLVrHNQGZ/WDwuvu9K4YGK8RFL5t6IvyJw5EdFHm/svI9H41Tq+caFtW
         HQswA3lsSzrmD63maOlrDqQKLC74h6iQ75DUDXdHm3fOwQ1pojROZN74EM3m5pbHMmE4
         gV9G2Ur2uHozDXdsFAswLbBWdXvNjwVP4A69abnwVjGK+2vfXRq8LiBuhjBjN8Eaw1aI
         NDwg==
X-Forwarded-Encrypted: i=1; AJvYcCV4ysCQge7vlDXtkyoQdJAc8yUwzZTdch9imRQ8MuRuCWHH8D3w9Tc2aJZHRkAHK4clXzDSi8ntSVrIlYq9TWj6g2ksclJmqNytBvo=
X-Gm-Message-State: AOJu0YxhUIEFhIJP2H7tb6DQ6aC9h0cbt8IyxOgQKOcb7PJw8SC0GgI9
	sr1p2wWDXn/q+HsR2dXU5oWgpxJRjlNwC31DCDjnvE9//kqanw8QKYKK5W0mEAiY4CdqZ6AWuNM
	ZeOwhuk8g4NZsaFp8z34STRT+Xp5esWpvrdSW
X-Google-Smtp-Source: AGHT+IHcQ49ya8fWuFRYRtaEwX1j4GO+9eoCIEgu+RmTzs9mIQP4CSt0k7FW7/FiUFuNkGHC/QwN3dkzwfDTaAEIpSg=
X-Received: by 2002:a6b:c8d8:0:b0:7c7:9646:827b with SMTP id
 y207-20020a6bc8d8000000b007c79646827bmr7806606iof.18.1708951446529; Mon, 26
 Feb 2024 04:44:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221160215.484151-1-panikiel@google.com> <20240221160215.484151-9-panikiel@google.com>
 <13aeb2ff-72f4-49d9-b65e-ddc31569a936@linaro.org> <CAM5zL5q0oKoTMR0jSwYVAChCOJ9iKYPRFiU1vH4qDqhHALKz4w@mail.gmail.com>
 <e1fd8cbd-060b-4d15-8256-6d8dbba545da@linaro.org>
In-Reply-To: <e1fd8cbd-060b-4d15-8256-6d8dbba545da@linaro.org>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Date: Mon, 26 Feb 2024 13:43:55 +0100
Message-ID: <CAM5zL5qxBM1xQ__t86gxUKMy8O3BzoCe_vTFxxsqFq7mw4-8EQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] media: dt-bindings: Add Intel Displayport RX IP
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
	daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
	krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
	mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org, 
	tzimmermann@suse.de, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, chromeos-krk-upstreaming@google.com, 
	ribalda@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 1:06=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 26/02/2024 11:59, Pawe=C5=82 Anikiel wrote:
> >>> +properties:
> >>> +  compatible:
> >>> +    const: intel,dprx-20.0.1
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  interrupts:
> >>> +    maxItems: 1
> >>> +
> >>> +  intel,max-link-rate:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description: Max link rate configuration parameter
> >>
> >> Please do not duplicate property name in description. It's useless.
> >> Instead explain what is this responsible for.
> >>
> >> Why max-link-rate would differ for the same dprx-20.0.1? And why
> >> standard properties cannot be used?
> >>
> >> Same for all questions below.
> >
> > These four properties are the IP configuration parameters mentioned in
> > the device description. When generating the IP core you can set these
> > parameters, which could make them differ for the same dprx-20.0.1.
> > They are documented in the user guide, for which I also put a link in
> > the description. Is that enough? Or should I also document these
> > parameters here?
>
> user-guide is something for users, like user-space programmers or
> end-users. I would never open it to look for any information related to
> hardware.
>
> Anyway, external resources are a no-go. We have it clearly in submitting
> patches:
>
> https://elixir.bootlin.com/linux/v6.8-rc6/source/Documentation/process/su=
bmitting-patches.rst#L130

Okay, I will describe these properties in the bindings as well.

>
> >
> >>
> >>> +
> >>> +  intel,max-lane-count:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description: Max lane count configuration parameter
> >>> +
> >>> +  intel,multi-stream-support:
> >>> +    type: boolean
> >>> +    description: Multi-Stream Transport support configuration parame=
ter
> >>> +
> >>> +  intel,max-stream-count:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description: Max stream count configuration parameter
> >>> +
> >>> +  port:
> >>> +    $ref: /schemas/graph.yaml#/properties/port
> >>> +    description: SST main link
> >>
> >> I don't understand why you have both port and ports. Shouldn't this be
> >> under ports?
> >
> > I put both so that you can use the shorter port property when the
> > device only has one port (i.e. no MST support). It would work fine
> > without it. If you think that's unnecessary, I can remove it (and use
> > the ports property even if there is only one).
>
> No, it is fine, but then you need allOf: which will restrict to only one
> of them: either port or ports.

There already is an allOf below that says that ports is required for
MST support and port is required otherwise. Isn't this enough?

