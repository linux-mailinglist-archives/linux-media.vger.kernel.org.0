Return-Path: <linux-media+bounces-18557-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FD39863B2
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 17:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C56E81C26B30
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 15:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77E641D5ABE;
	Wed, 25 Sep 2024 15:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8fL3p5d"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8B579E5;
	Wed, 25 Sep 2024 15:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727278530; cv=none; b=goFJA/c2Y3U0xFyRAdIZ53t2vyJU/Y7ooVpDy8QU4ywUq7PHrytgegkrYYkpaR0w1/+E9xSPoTJeH4IYs/oPzOX60W/KxPMsCtH4aaev8HApbjW98XCD33k4+iYGBpu0n5QtPqlRQzkseLqIIMdDr7GYKUEa1yyPTzoNtUSzjkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727278530; c=relaxed/simple;
	bh=zQtvEQZux0ML2QJMt6fDRCxvIWYfMtXL2Qqa2On/ugs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eTpup1kTL2WFSkzESLoXpOtz8jFCpnn/NR4Yp4x3kCRoV144l23rZCkw8O1LN0C6JnSV7pXWbYrtvRE6L1SsUZJ9do/Fvz1rnU8G2wm5EVQ1zk2Yg30rAGU0YMmTPzzMGrWO+UGucIPJwuGD2PNqN/XqbRtLaE6LoWa68wFecHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8fL3p5d; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e201f146cc8so6434679276.3;
        Wed, 25 Sep 2024 08:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727278528; x=1727883328; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQtvEQZux0ML2QJMt6fDRCxvIWYfMtXL2Qqa2On/ugs=;
        b=k8fL3p5dH5HnnZgwZ5dHJWHh0S0hlGG+y3Zhf+joxw9jrq/udqb60Vdzy0yS7BNKDA
         u61qJed/Z8p7CriEw++GJTOm+/jP8ql7fG7SnQkKMPprfGqt9lJOtwcHpf94WdBxKF3S
         Ky1Mrr1VaDbrSIpdrQmChjWXoTccVMoZeqNPs9AEa4yPncRMK1Bi1rvlC90PWWMdJmwI
         7ArMuO5PDxNQEB6oOIfwu1b5IDjA+W6JWi7prfZdDpwodahMyfau/w2kb3SeENG5SUQ1
         3L47MxxrhLVbU9SgB5jU7FkI+zTsUg8/zUhIxbDF7TqFk0wBcmhGMEMnO/l5hcziiTp4
         gH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727278528; x=1727883328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zQtvEQZux0ML2QJMt6fDRCxvIWYfMtXL2Qqa2On/ugs=;
        b=qRhNuFw6Jnl1RswYovQd3LSpERfu1lHx/JCWqM158pT/tGoHKsTmHz2yzSs5yRpBht
         7S2p/djapiwYIwaBjH6tVNEExSri+gq0e2Q4OO1aoqOle3gIMwUe0MkLmreKsaa/kdAw
         FLSJHQgqIpbb+vc8TzmVOkY4eaXvdQ+FmijqrGnjs0AVa/eMc3oo2BoaGEkPjy4IzXKM
         dyFUggHh9RpCq1ieGezOwf/XEB72oJ4xPVywwBMFPI0tA1jGxgVnouDmlGKM9peboCO4
         Sd56sRimHyZaDe3ioOWjicdMY+YtCMA7l0QX4JwGP88ntxwkqwtODbTZMBt6MP2t2Bfq
         s6Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWfacPMYOaX7ObS7ARpBt8IvtYhv+EEdMRL0sd4C8s8GwmfNoThseDRnZBDpblEbF7S2vgIS4SHpwme7j8=@vger.kernel.org, AJvYcCWjegKrkNCawm/ksjsBXBHgbwbX7rVV4MvpifQ1cSwLzGYSy8GSK6RVEjNB4+SZziPbAVOn0CcH27dkhWkVGmQtfWg=@vger.kernel.org, AJvYcCXmDiV1iV/Wo9Y2HmAh2Nx82wNwCgULflspkAf323mhJtP571bytSnhOvN3xZt+r6aBshZUM/tvFdoW2Lw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeWwChJA8kfbUBsU/xV4Z2waQHWdhBSZsG/AGFiYGLndDn8Njf
	4gBznxHjr3u9goi+yzXuWwaaK37186cdKcTMbvC81dlgwP9QngjQOVXNATB8dUcBcQjgrhjgGZ9
	C3vOOeo9aGLeu824yBjxhMhpgyz4=
X-Google-Smtp-Source: AGHT+IE+2X3AfhW58Tzy6ESrwc3qTUV/BFSmfpIDzkHnR4x6F1OU0TYi/H6DgUWIt/+vb4KQ4MkXlsROndqj5JYxYoE=
X-Received: by 2002:a05:6902:2310:b0:e17:bd74:f2a7 with SMTP id
 3f1490d57ef6-e24d9bdabc1mr2120620276.44.1727278528192; Wed, 25 Sep 2024
 08:35:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910170610.226189-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240924224619.GO7165@pendragon.ideasonboard.com>
In-Reply-To: <20240924224619.GO7165@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 25 Sep 2024 16:35:02 +0100
Message-ID: <CA+V-a8t-goaBwU2WAZLz1C1f3z-ATm_kS8NAD=zU23nDCTnNEg@mail.gmail.com>
Subject: Re: [PATCH v2 06/11] media: i2c: ov5645: Drop `power_lock` mutex
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thank you for the review.

On Tue, Sep 24, 2024 at 11:46=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Sep 10, 2024 at 06:06:05PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Drop mutex while applying controls and just rely on
> > pm_runtime_get_if_in_use() call.
>
> Here too the commit message should explain why the mutex can be dropped.
> Given that it is only used in .s_ctrl(), and the control framework
> serializes calls to the function, the mutex is not needed.
>
Agreed, I'll update the commit message as above and send a v3.

Cheers,
Prabhakar

