Return-Path: <linux-media+bounces-54051-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GybHNVGpWkg7AUAu9opvQ
	(envelope-from <linux-media+bounces-54051-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 09:14:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2DA1D480E
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 09:14:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A238C3032F76
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 08:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB18317159;
	Mon,  2 Mar 2026 08:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V5YAcOi7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148A432FA2E
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 08:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772439201; cv=pass; b=UJUE8ujf4aXHPK9z5+YSLxNTmJ59YIinO5X5rfp3pI0JzQC14HsRgzYB19sfpflyUy4/XyN5fjaea1dbnwvy2VjLTBVS1y962moog8laeVqxlLGO1fLy+cO8/FIgYNfrZMKCqZSOaVAjiYzVmkePVw3X8FrZERjG02pKvSfGstY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772439201; c=relaxed/simple;
	bh=l2mSkg7KkSm2uUTG1wCFPeaZJ3kB8IInsxSM3RxSchw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g1K/WPzUgFFVklAPHTPb954g89gs6ePtF0jXooS8UcqZwx0OdOEIrOv434/yIQzZJr4KqotBUbDPX9gjuZVqAsdJ2s990EPtoPbO+3lp68YH/HEvlY87F3jgdm7rFWxGxM954WajHSKv/pZQKvZKCKKLyKktahQOgJH4jhNpqwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V5YAcOi7; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439b97a8a8cso433175f8f.1
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 00:13:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772439197; cv=none;
        d=google.com; s=arc-20240605;
        b=f4mDBboaeuy46wKe2ZPRbTRedEAYXREwmtZrTIfgTYE8bJV1OhvXzdgoKSgjVjcqwf
         DJEo95bxJQF6FOzzEAFXozkyvhp0F7K3/D8wtxKypLJNLTD6KKjh8d6ybWTmq1NQOWM3
         U8hTMZkoizsTVpvcNy1dc9d/8h+GYktb49uanfD720Mu4Q5OwpoAoZNQkQQbc5dq0+7X
         mU0mnpPxRSA3CLuBTQWG93fzm9XlYpAuOdHhyd4Q9kM92EY0WQOGlYuE52fesGJCgf0V
         k3bm6EvZv/gFSbcQNgqh63iUOlQldefy5Ber9w4gR+MMqTnm+SIHJAKeo316I8FHj+6n
         v5FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l2mSkg7KkSm2uUTG1wCFPeaZJ3kB8IInsxSM3RxSchw=;
        fh=Js29rxbweCGoAVoO1l7WNZ4EJHCny+MFv9BfmFYo1Hw=;
        b=gI0ZUoFpZ+i8IBUaU4MELO/xgfRu/0jRSKNAOWVImfZqgolAAkeddj04TWbghg0ejF
         J96om/JqrsT22FRhckU9ULsw9ZkucO+riBDdhIfHnSWtqWPMbaee48EQQO8wS0e+giqF
         cVOTPF3BYTtwLoKZkZe/kjD1J/WBZWnBzgpYu7k0pYpJ9fvKKQW/7yegW1/Gl01fPvfq
         IizQ0Vpkx6cHo3amyqFmnaoEpPYSsBhmLvQMiio9oeX4DTEBOeWiAOhCqprDWlChfzVY
         gkimDqdTFv+Acvmm/QbOwlCI/3GR1htKeUgeLeAAg9K/NiQXv5x7paybdmR5MIvdRV5M
         DrfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772439197; x=1773043997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2mSkg7KkSm2uUTG1wCFPeaZJ3kB8IInsxSM3RxSchw=;
        b=V5YAcOi7mztYUB8lv5ds0C1mG8Ld2+h8jExjDbvyurWopV3lqbGYlPf/K8NHgBUFiD
         XXqBBOPzEluwkIGbw8aXj1OVi6mMEowu5C8J2gM5wfARCje6voJbZ4hNuNBxyFvgb+bs
         KAygrpThVKLZeUAnU2CgxYQUPpz7MdftmnLpG6/e6PCtkPi419NBSwjaTZ4Df3l5YwMu
         vg2W2bpA8rnbKOoVLLawEVxuFv9oD7eETx58KhYGJgAU5Zvsp5sUgaaRTVMZ/DgLtS3B
         Ne+Z/XI+9s/2azipJhVXpysp13TqAyARpMfRBLcD7/yluia1UxmqpcB1LPOyJth3R0Gj
         zIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772439197; x=1773043997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l2mSkg7KkSm2uUTG1wCFPeaZJ3kB8IInsxSM3RxSchw=;
        b=TOVDdsdnkbkljn5CePA0nY1OrOmPAiuJ/R0KvxhbgJ2PO1bsWDSAUCVlxGhtY+tGcy
         6XjHbiMrh61B/uDtsjVBNwP4CLGGk+409RDe7H9azM0FlNKVGrWrhseUYkIRALL93jHo
         JrK7PszhNf0fsgE3XUquRht84Xm54gR81wTCFEIVG9YJ1/p6LY3QpTSlrmodPvOqEehc
         ywhGReqq3tl2Mmzeuo+rW//Fm1BE37nbzFp2bXH2Q359Wm8bvN6Oz19u/sJ2Fk2y0vYk
         feprC4tJv79BrNsNWCrp7oCUXJxDZa5Ts0bCKzr/nJzsfOzk7wC3giXkj9yOtRpmS93x
         NVWA==
X-Forwarded-Encrypted: i=1; AJvYcCXVq34qAmABk18QgA2sOrMksmfnDKzY40TbMLjaDMFrHYHnsFwhH/xfiRZ2Cw3oiHyioaTle+g1f+cRFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnOjQmxHoFsbI6Tz71fr7fRnR9R95sN8OPiXHnLcbYLA4oLC3s
	8cHzUuEmbHdHnK9Dvl6j5Zh8QjgDF0r24+SN6+SrINdbYldcx8zBEeOwNRT5A1IPjK9svUeLeHD
	Na+O87iuyW6ZXG1o94P1wHTVOcTRPWpM=
X-Gm-Gg: ATEYQzyCJShARIegOe4v2xC7AVd1cLyXhSyvFScdXSRCSrMDw0hdioU6Kko0B1gpW1G
	3PYpRYBpsEsAZYyTXI7kdI+YU+hlmLqwHD0nhjwPnrhIq9HW9G2Oeq0V3/MgMqp1qQ0Db/MewQe
	9wYx6v7WUaNcXChhpYx9VexobFFu/dU0UkHr77k02l6FZ9VwxyuqBGvHjVCx4KFdAUFP4kIp1PE
	ZX6fojVhGhJJMppYEQyT2TZ/Z6IoreZKo6ryCYPEv9qOKmhhernLmuN9TSXFPFYfwYwIRhriQQL
	20GxOIkc
X-Received: by 2002:a05:6000:4011:b0:439:b922:8479 with SMTP id
 ffacd0b85a97d-439b92285dfmr2649252f8f.36.1772439197286; Mon, 02 Mar 2026
 00:13:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260130124932.351328-1-clamor95@gmail.com> <20260130124932.351328-6-clamor95@gmail.com>
 <DGP1SU17I99K.3QKZWHDPBB74H@bootlin.com> <CAPVz0n2uiF_UHK5_7-dW+AjazxTsonQQsnf96QvRu5HgmsyGSg@mail.gmail.com>
In-Reply-To: <CAPVz0n2uiF_UHK5_7-dW+AjazxTsonQQsnf96QvRu5HgmsyGSg@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 2 Mar 2026 10:13:06 +0200
X-Gm-Features: AaiRm513PJ2Vl3yAaZ9EK2Cx-_p8na7NMdLvn762xKViUHPZp6XfmHs_ZYNwew4
Message-ID: <CAPVz0n2rv3aey+7dVdtGeQfdgVpyMczp=RTKeg8V5SxNPr5-Xg@mail.gmail.com>
Subject: Re: [PATCH v6 05/15] gpu: host1x: convert MIPI to use operation
 function pointers
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54051-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[gmail.com,nvidia.com,ffwll.ch,kernel.org,linuxfoundation.org,vger.kernel.org,lists.freedesktop.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,bootlin.com:email,nvidia.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1F2DA1D480E
X-Rspamd-Action: no action

=D1=87=D1=82, 26 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:09 Svya=
toslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D1=87=D1=82, 26 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 18:52 Lu=
ca Ceresoli <luca.ceresoli@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > Hello Svyatoslav,
> >
> > On Fri Jan 30, 2026 at 1:49 PM CET, Svyatoslav Ryhel wrote:
> > > Convert existing MIPI code to use operation function pointers, a nece=
ssary
> > > step for supporting Tegra20/Tegra30 SoCs. All common MIPI configurati=
on
> > > that is SoC-independent remains in mipi.c, while all SoC-specific cod=
e is
> > > moved to tegra114-mipi.c (The naming matches the first SoC generation=
 with
> > > a dedicated calibration block). Shared structures and function calls =
are
> > > placed into tegra-mipi-cal.h.
> > >
> > > Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, paral=
lel camera
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > Acked-by: Mikko Perttunen <mperttunen@nvidia.com>
> >
> > I wanted to test this series on top of v7.0-rc1, but applying this patc=
h
> > fails (with b4 shazam). Can you rebase and send a new iteration?
> >
>
> kzalloc(sizeof(*mipidev), GFP_KERNEL) > kzalloc_obj(*mipidev)
>

Hello Luca!

Thank you for still being interested in this endeavor. Sorry for such
a brief answer, I was very short on time. I have rebased changes on
top of v7.0 but ATM I still have a bit of time constrains and I have
to test them on my device. I will send rebased v7 ASAP.

Best regards,
Svyatoslav R.

> > Best regards,
> > Luca
> >
> > --
> > Luca Ceresoli, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com

