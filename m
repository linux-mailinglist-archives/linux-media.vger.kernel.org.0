Return-Path: <linux-media+bounces-57112-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL0UEqqRxGnH0gQAu9opvQ
	(envelope-from <linux-media+bounces-57112-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 02:53:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DE56232E12E
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 02:53:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9F63C3036B0C
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 01:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7672738F62A;
	Thu, 26 Mar 2026 01:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3P2ixL1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5A73644CE
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 01:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489999; cv=pass; b=OXQdvwhwuLtwwvT8bSeUXLkxp/XDC9beV5c8FfZG7B3k3MnYZneSDOqMNxWJ+rrWnsEelq9a58653zR3oesKSoIYw0VdIdp1iCqA6Ws6X4yyTDprt5fy9RTWdXGXd+g9A1+n4aovxY/9JSFdV+GAS9Sv0UX9AIrdiB8J/ZT/3ao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489999; c=relaxed/simple;
	bh=OkQDhqxdu/VghGhiJbxfiIKUvNi36C2xoIdqMy2/5jc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hje3ox0EnNA5bIoLSuwAxZaX9femXM+M444YtvlB8ibhHdiJh58YzArzkbtOUClKsvhxqckbpGAHGkGm5T29NbWeq8vBZWwRvW2v9QT1N6jm7CysSf+BN42Xhd8StfA/lmeMb+WpFk5d/fuzpvZxDR0rc9C1/PIMJqtMtiMFO10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3P2ixL1; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b97a06d7629so65080866b.0
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 18:53:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774489997; cv=none;
        d=google.com; s=arc-20240605;
        b=K7lkbvl9ZTbwtjt4jXbohxxTUThxXjgbyWFShzljvuRjOWdocd31+h0zES0sEKe7Zh
         SVrlVEtwlVNjPMwJflHNvwaa5lup+JyXiOD73qbPV0ESL6IQk3+RqFvhwWlC7v6gUGXW
         O1TnCTMWTUAkuv8lTizvnwB6UCG0gfeOkIQdyF6YwS0cUg4W2+n5JeqTfRGjqBCs8iBZ
         qIyQUgfzGnhHWTbErt4akR4wENatyTO2o3nB/dB/2yBj4/gMAlTdUIPbJgIsLliqB19v
         CRe7q55YgfuWHpo8KoSL/qmiAJJ7iutcEJ57C3Px+JHXnRem28PjUUXmCO9hsBecFOva
         0x0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OkQDhqxdu/VghGhiJbxfiIKUvNi36C2xoIdqMy2/5jc=;
        fh=hP0Wu8wc/rLY0TR+1C81mrXVXwMBDLtAnF2kb16D9wM=;
        b=XUucEP9BOYttOz/vaO0cboWP+UVmIYRN+n8s5fplpszU6Gz1FxsHyPVgIwvh0B0pOk
         1SKWFDjTlPLy8ESiB0eNWvJSreH4dg7TN1uoIGfi5ubfVq/zOHKAzbbHETNHsNc5DZ1n
         SHEbbMMUh5Bzy1eCtS0HJ8+0WlTCo97tIMJYxwgfjX8SgK6XqLNMJY9A3LZiqGE9LGbz
         Qe58QPapb5kGJEK67gOM4UtONzTMkg8Nf+VI9t1ohqShMfcIN3JHcpeIHsGGeMzQTvJ7
         bphj/AbPfdNbHTvtIfhYAz+4Ufc7dr05ubRQwq6I66Pll53noENldyaC6X5Sy1SZe35+
         D3OQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774489997; x=1775094797; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OkQDhqxdu/VghGhiJbxfiIKUvNi36C2xoIdqMy2/5jc=;
        b=F3P2ixL1Lp+xUdlHD4A9fAInBG8yjo4AsXKmiOTT51SGB2Sg1mxf/ztCSRnfph2Eg2
         4bq2Ou0u69GpCqciNLfsB/U9Gh0QvBZ6FzXTLLoUlgPGmYvzyeimqjfnlVKXqGH939vU
         a31nQ7ElNLQig8N++3/c+GcL0BFEiZgnFC6+EMFTl/439nRAa/CU4vjNYenXS8ad4cvN
         s8noNTTcefYsuveDQfAyg6ya+Gom6RAw4WF4OnAg/EKmv6G1IFrAVSGaXolIHQeNF7d2
         td6nyeMq6PcR/U4sSHIcvWZdKmM48swJTnFx65ooBptO24KZ7bjdGRYkcESKMRtAYVyA
         H6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774489997; x=1775094797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OkQDhqxdu/VghGhiJbxfiIKUvNi36C2xoIdqMy2/5jc=;
        b=rVg1a5ZiBmJyzLLOWAaHNv6Y5pis+QW6MHiU8L1GPLT1WlyhUvQLEnRdxOo/pALX9J
         TTW9t5dYh+uoxmoG7sCYF0V8AI2PJ/xKO8VfLzssxPm6MuT+2/o3SzsnBeWSmeL41/Vo
         30c5Ex86j3cA/bA6wBOt2iSxgT+cZgD0jBsoJuEIRuIgDOYPEX5393UqtpcPHWj8wZhE
         cqehu7rcwiQrmjFXJyAxbNpGcQw7OnfAv93ixQl9O+w7NXpr70gN9rPdHHKppUXeTR4+
         N8ybSmqtJMIEkuQEXSlCVEJIt6M2ZAu2U/HjCCxP5tZ+/sFyqtaes6nithwgnAM4tpWe
         6YEg==
X-Forwarded-Encrypted: i=1; AJvYcCVbbUJuhyvEo5YrYM1FPEogMhOC5JRxEa75i+GxA7w6g4xDk7anKQmh0XV28mbp/vmG7oSU7/IlpOxpIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCYf7AZZq+aeiq3pRoucPFHOC59wR+w7HJ71nlaXJ/UxKoKVUl
	be/Eh05Oyzf32gFDWji/w+eVuBdfOcPuefDR+hXN4u2CTtWolFmdSZxPGIItEZG09e9tuUHjbOB
	Or2GG3+SkUrjKJE7pZZviBzwr5Dw6BVg=
X-Gm-Gg: ATEYQzxxaCijytSRXi5VaylSg6/I8jfMrSrkVs4F8N0MOszUlZXnVJMCmJvCS24VhEd
	QQ9P+eCqff5FrC7ybPv5RY5vslfUPycks3HD1SX8ZJM3mXDNmw36Fc4tpSosaXEcsk8KnAjr53x
	PqNZ5SEzy+bAQkwr0mRlC6y1rfYE3PbLNRDRxFt3m8jbd8j1zBGbZfysTf93ouFEUGszzXY90VH
	5W9T2CCkLkC69MhvLyUT0iPAdjA+L71uaLCIaRID1ViVDejgtuQQA6047a0qSuN5YlCuUpcmVm/
	/je17o/Rg+phlu4Xti/AkVDBXaodGEmdZxM5bv8oCIk6ZxnaLVIfioVJzLXpLlgKXEFF217N4aT
	8YYu8/Q==
X-Received: by 2002:a17:907:3e0f:b0:b9b:155a:6f92 with SMTP id
 a640c23a62f3a-b9b155a77ccmr272420566b.7.1774489996810; Wed, 25 Mar 2026
 18:53:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306044536.149204-1-rosenp@gmail.com> <20260319220901.GD950375@killaraus.ideasonboard.com>
 <CAKxU2N856yYXURRf3td-_RCpe9hyX=zAy3qtD3ki23RjgO+a4Q@mail.gmail.com> <202603201114.9A02FDA977@keescook>
In-Reply-To: <202603201114.9A02FDA977@keescook>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 25 Mar 2026 18:53:05 -0700
X-Gm-Features: AQROBzBSJyDOFvefMdXxKt78jroAsA-q-37591igukparmS24ZzPgm6s7TLFqAI
Message-ID: <CAKxU2N-eVyzunEC1PivSmRF9xctOF2NZHDJyoVUMYHHXCN6qoA@mail.gmail.com>
Subject: Re: [PATCH] media: nxp: imx8-isi: remove kzalloc_objs
To: Kees Cook <kees@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-hardening@vger.kernel.org, gustavoars@kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57112-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,vger.kernel.org,kernel.org,nxp.com,pengutronix.de,gmail.com,lists.linux.dev,lists.infradead.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DE56232E12E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 11:15=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Thu, Mar 19, 2026 at 05:11:22PM -0700, Rosen Penev wrote:
> > Technically kzalloc_flex is simpler but I assume a devm version of
> > that will be handled in another treewide commit.
>
> Yup, that's coming. I wanted to get the "first pass" of the base kmalloc
> family converted first. There are a few classes of "kmalloc wrappers"
> like devm_* that I'm hoping to convert to type-based allocations. devm
> is next. :)
As an aside, I recently noticed a pattern of kzalloc + kmemdup_array.
As kzalloc_flex is basically, kzalloc + kcalloc, Would a kmemdup_flex
make sense?
>
> --
> Kees Cook

