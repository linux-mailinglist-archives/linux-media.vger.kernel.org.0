Return-Path: <linux-media+bounces-17215-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EDA9659F5
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 10:18:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51ACD28A9BE
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 08:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D42E16A92F;
	Fri, 30 Aug 2024 08:18:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35988167DA4;
	Fri, 30 Aug 2024 08:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725005905; cv=none; b=SLkhPakLd3F/inCN4m8SO/6NAaKByZpr/r292XFHtr8daAzyQllorVGPzG5Bo4/HLk3UDAJxaCZidfyFpFW2asWQUqCaBqH+Mozeigmxk6ZbOysHc8nf6PHZvxLAeyOWWHNTA6pIoQWCDnXR9RyDBAvUwBtKOc+HQHZtfxu2+Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725005905; c=relaxed/simple;
	bh=35jDCi1Kj9oN2o02lDIyXMFMWMiUeUYXNfhFHuTbbIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KlT4rxVt7S4FXAtokAYNmm7Em1Gzvru8w/Lx+jvQUDR6rgBMgmm9662WuZBhjmBhR4DRw2r5cpToQmQ6CkX/0iRzy1Krh5kZLxoyaDHpakTfJ/v+FHPagyoBjdEll0O1Yvn95iKB+wHaJieBPOuyNLPq8DibRSHv/sNIKgTFCcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6b8f13f28fbso13765337b3.1;
        Fri, 30 Aug 2024 01:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725005902; x=1725610702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NOPsquWW8Uy5MOnXlVH8v3N0MKkHs39P2/JigTaTeY0=;
        b=O7NL4pYQEO4AVNTrGQPrfKkfre2hh4+MKcrvNxVPkeC3ogGZhdVu/RKIKgPKar4mTt
         Xi+frVKV8n7d7O+ijP0f+rZ7RBQ7X841vDGjYGwd7ZM2U7fO0tqvw/PYwaHNdoAyI578
         JZCaI/52RnwI3opGQRUTnqm8yKkm7Q6Ultcw2QFZWPf+06mc07pI338vfOfRxQh6oKXq
         r4rDtSdn4xmMvjDbm/XfvD/I55cbqyV4xf/TDMLAjh3oCPe2G4TTQgzdIxX6Qo1EgTKM
         QxEz0Ag53I1jWiRDoMqXuBwrji3S8G1Eb/amIgSTL8qj7pv2kuowx1WSPAMovEu+YBMh
         OdDA==
X-Forwarded-Encrypted: i=1; AJvYcCV8RpUAOIG5HjYJXrYDEoVX0R7U9Em3laYEN4NosuR1gXVSWfo/+YdEhwWPd2rGCDJG9zH/RTbKQai0xZI=@vger.kernel.org, AJvYcCWIEJyJ8KO9y2P1o4BEPRLC+LMDn6QTDxJz/2MF+QTG1p048uFRaFO69mUk5aO6wjx8ELkLa/Pb07qp@vger.kernel.org, AJvYcCWeGVxvAMmK+2OcigXhD0NR3STZEjigT9ND/hvnM1KHg0NxEbK09e3HE9Wf/Lw0Tgoxo/yzEFhWV3hCdoDPgfnWjdI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFKSVx7n2t7gwIIeJPbN6RLTNcNSlejLhLv2YQwVJUDG67SUjY
	TJ/0S5WuEyfpgLwr+gxtbxK/lgT2Hr27vvFpgeFZ4RL9BeN6t1qEnnjl0KhS
X-Google-Smtp-Source: AGHT+IHsdKr+kkshSeqcDh/CV++c4SPsrXkT3SzEH8giiUkGSs4i5isHSShIPOYQMFDvxAuxeZufUg==
X-Received: by 2002:a05:690c:3412:b0:6b5:916d:597 with SMTP id 00721157ae682-6d40e287027mr10637587b3.22.1725005902505;
        Fri, 30 Aug 2024 01:18:22 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d57de61esm5507227b3.88.2024.08.30.01.18.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 01:18:21 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6d3c10af2efso6681727b3.0;
        Fri, 30 Aug 2024 01:18:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2EVopmcHwtn3k6dRRwfc1bIpVdLgGGWh1ECzDaZK2hC7/JhnMGZd/1HOHZ7xf4YqoWIaVWNCowlnm@vger.kernel.org, AJvYcCU7Yi74qMLLVNbKtCTjEpHEGYVL/z7xQS9W8oiMc0YOO/WrAn/MfmwbdggsNHxobE6Rjv24JwhoVPIQam0=@vger.kernel.org, AJvYcCWoI5t3KfWgMZKkoJqaGIVVbKLGcRrvqf8fQZj8KgxoIUNHjQ/FiVsUrJ5r8C6nF9YzH8BOFjsfaXHXbF4uI/vtBYo=@vger.kernel.org
X-Received: by 2002:a05:690c:418f:b0:6ae:e4b8:6a46 with SMTP id
 00721157ae682-6d4101031c7mr10599987b3.44.1725005901391; Fri, 30 Aug 2024
 01:18:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829165051.2498867-1-niklas.soderlund+renesas@ragnatech.se> <20240829165051.2498867-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240829165051.2498867-4-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Aug 2024 10:18:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVenR81cvQ5BbtKjULCXC3NN+pBCHbE4SVeZUBChvAYgg@mail.gmail.com>
Message-ID: <CAMuHMdVenR81cvQ5BbtKjULCXC3NN+pBCHbE4SVeZUBChvAYgg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] media: staging: max96712: Move link frequency
 setting to device struct
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sakari Ailus <sakari.ailus@iki.fi>, 
	Julien Massot <julien.massot@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 6:52=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Prepare for supporting MAX96724 by moving the soon device specific link
> frequency setting into information structure. This struct will be
> extended to carry more differences between the two devices supported.
>
> While at it remove trailing comma in device table, no entries will be
> appended after the sentinel.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v2
> - New in v3.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

