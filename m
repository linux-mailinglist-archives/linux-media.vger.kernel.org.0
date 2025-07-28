Return-Path: <linux-media+bounces-38592-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 770BDB142AF
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 22:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B49034E0735
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 20:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A72275B1E;
	Mon, 28 Jul 2025 20:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jb58N5GL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BD221D585;
	Mon, 28 Jul 2025 20:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753733370; cv=none; b=nr34FGJ2fiSdw0ddA2KOXf1tg/sx13hT4eKRQeGDxAhpu+0MVkGX2NIzGPMRUg1uLecXs+Mk5eXBdw5igaDhaW18UNY5eUr1HMbicQAPsm3gKOXj/vkEnonIvDg0qFehrlcQwKRQ8D9HlSbZ8z6sz4ShfTjs6BG8TDR3RF1HdO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753733370; c=relaxed/simple;
	bh=APtd3kTQXAJk0QuE3cLH0BeSZCoz60EisivX+3a4tZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QC3s8oJKNlVgZrDZ7xsKQAhMlofxGWpUK812g2oRN5tF3X1jT1NKFg7+0ShZQ+Uwy2TT7yLRJ6niqDlFIlrMqGj02x/3HNGbvkPFs7H05J9zAx0CeDgyek/GO3iEivfNpDcz1htINQLqtERFFnOrBS2D779Xwy/3qbYgGza0yPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jb58N5GL; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae361e8ec32so874266466b.3;
        Mon, 28 Jul 2025 13:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753733367; x=1754338167; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h19YZ7i6VuY1JYv02ffvxhmwPqdofuDuT9g60bNKiH4=;
        b=Jb58N5GLJVKGudo79nKBZrWHKjvFN3ZVSMQMtAJc3i59YL86NSkxGXV0nbiN6mEBbT
         /sQ0wwRaCenCBbsszmZ7bU+hidkoA6CwPrM4v/na3oWk0EOmMz3GNOrATzrBYp/rHml3
         IayiEBDJxnD7bnlrtAmArSNJEiLsuukSESKZDM4McNDt0HqDQ3ZlMN7Hut+pBzPdMmvW
         WDnvTVIMBgjeo79A+ZqjyhxtaAx2SDMKiRsOuEpsDFyzcL+T3Uud8Cg2EwqWoIgwXCo7
         1qcCWo1JpnMnywZWYWocYN48Uu1RL3IrGw0RkjiTDZazZFM+TKS29dlLyF8igxUapKHe
         aOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753733367; x=1754338167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h19YZ7i6VuY1JYv02ffvxhmwPqdofuDuT9g60bNKiH4=;
        b=AlgWmxbaTdXlSmKWc9nqI9HIYPyGttEjvEGRx9uthneUCZwd2UNlKuc4tLfnqVTPtT
         +GP49OLASo0GEWTgEfvNMRQZyN/WEKiBOOqO2Z0bvBbrbYEezD0P4Q6/FcSGNDvp4Wzn
         RKfJH1vYlpFLVBWfyb8wRZTA6gqmdOF3EOtTyasKTWrsx5WAfCW10dNLbOfjT9+rhddH
         bbEpeUjwb4euQRMpp0ZMQh4KBAQsZkYeJ+Scw7RhkJY4K2a4u2VcjAkPh8CBLfAhK49+
         19d6/cvasD73QcbWUnS2ZTU3ZASlACnjQlcikVY28Beaw6McaW/6tnc4BusPZm75Qgh0
         s33Q==
X-Forwarded-Encrypted: i=1; AJvYcCUcjP2qKocynw/wODdPhpSXPqByv1+TISIq+V8IsEEYvpmKKbdlYeqa9C6Fv/CPDKfzNsHXwdHn7keipn4=@vger.kernel.org, AJvYcCV/U1Dk00xnSIkO+F5kyouwRDgRVl6naZaD1t/D/oOboxXTjb8TirBefX1lQLrvhvT9d9UY7FLyiHJ6CT8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoP+o1ktsPyUQkamTlCle/rIpveBzngC7WFpEnrQuwZrVckoPQ
	2RYABUm/b7URZ3slH1HfBwNZLsDmu9AVSuiIZ8bd2GhYomBj/miZSd65CPruTCa00xFsX7SwWai
	7U0DhSDNY3whjWGrOz26W+rJ+bqtii/Q=
X-Gm-Gg: ASbGncu3BACxILrsuUIi5G0DxgxLuhb2PGXFnb6dyuD3D22cCYnNaVBjMNdG/ikm4rz
	hbYf0aCIOiwhHtlMpBwBJZaPy7IZbijT2yN/EkB4rNWSWfiKzhiRK8r7GXjo6UT/EXNEGktGbzv
	lBGT6ePsl8vjrAnsTy1gQKGxOYwIrYHlTd7hxL3jEw5bT033p2soKeO3L4j0R4GZo+7/ePIQYMu
	KjltB21Hw==
X-Google-Smtp-Source: AGHT+IFbO9sqJWgcseGeOHZ2itDqSDcsjIrdkqBzGDxuivhOWHSiTVp2htNNxFs1OxKvHTTD0faE/xZJWFxIav4hOn0=
X-Received: by 2002:a17:906:7315:b0:aec:4f33:e7db with SMTP id
 a640c23a62f3a-af61a0ef054mr1461259666b.56.1753733366938; Mon, 28 Jul 2025
 13:09:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728072822.10730-1-rathod.darshan.0896@gmail.com>
In-Reply-To: <20250728072822.10730-1-rathod.darshan.0896@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 28 Jul 2025 22:08:50 +0200
X-Gm-Features: Ac12FXyR5_fJCzTizE1t7DPU3upxgKlztb0zyNf7_BTJ9k5ADWfY6vVrLSSd-N4
Message-ID: <CAHp75Vfq6P2osMc5A5TZ5Usgyc7mFGNme6TmCQugTE1=8c1zAg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Fix indentation and styling in
 output kernel code
To: "Darshan R." <rathod.darshan.0896@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	jogidishank503@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 28, 2025 at 9:27=E2=80=AFAM Darshan R.
<rathod.darshan.0896@gmail.com> wrote:
>
> Updated the formatting of function definitions and if statements to match
> kernel coding standards. This helps with readability and consistency acro=
ss
> the codebase.
>
> These are non-functional changes aimed at preparing the driver for eventu=
al
> mainline readiness by addressing common checkpatch warnings.

...

>  void
>  ia_css_output_encode(

And what is about the above?

> -    struct sh_css_isp_output_params *to,
> -    const struct ia_css_output_config *from,
> -    unsigned int size)
> +       struct sh_css_isp_output_params *to,
> +       const struct ia_css_output_config *from,
> +       unsigned int size)

...

>  int ia_css_output1_config(struct sh_css_isp_output_isp_config       *to,

Seems too much space between _config and *to.

> -                         const struct ia_css_output1_configuration *from=
,
> +                         const struct ia_css_output1_configuration *from=
,
>                           unsigned int size)

...

>  int ia_css_output0_configure(const struct ia_css_binary    *binary,

Ditto.

> -                           const struct ia_css_frame_info *info)
> +                            const struct ia_css_frame_info *info)

...

The rest of the code is also subject to the above comments.

...

Btw, somebody else already submitted the similar changes.


--=20
With Best Regards,
Andy Shevchenko

