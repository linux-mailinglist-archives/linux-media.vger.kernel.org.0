Return-Path: <linux-media+bounces-64758-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FcT4LN4jLWq5cQQAu9opvQ
	(envelope-from <linux-media+bounces-64758-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 11:33:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DAD67E3BC
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 11:33:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Nbo8lfKS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64758-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64758-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A9BA2300A4A1
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 09:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4472E374E6C;
	Sat, 13 Jun 2026 09:33:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C8232ED4E
	for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 09:33:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781343190; cv=none; b=J3oGkb+hiaj28lAIh0SP8l180n7H+I3PNHUn0NMXYNrI4Xg1iAhrdIeOk7cQvfGc5IRRR7oiRpfKVXzybRf76kLHDJ9Cmf20Vd8GMO0R6SWTDU8AcPEvsPdddwMhBkcib9Gga8xa/r01SdrB0vHPFuVP9/2KKp91L2OZvGK1Kdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781343190; c=relaxed/simple;
	bh=8T+pkFF+lS+JDBAjF8JI0LZg2b8EwfaONvyE7Gy7O/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f3/bg4DUUvr8AoaKBT8O7tkGpvJ47Imy3QzeD2vQlglDHzQZU4Ox3MbdoyXnu0rh855nrWPxdjN4tqr7dKo1CzMjToc6BG7IJfoyUEQAoNPP8TAxgFj1DJW8Nc4CWx5kQ7VR1ffQHae4dS6DdswjV8gBYfxe/s1UWFJzWbyyUK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nbo8lfKS; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso16599925e9.3
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 02:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781343188; x=1781947988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8T+pkFF+lS+JDBAjF8JI0LZg2b8EwfaONvyE7Gy7O/8=;
        b=Nbo8lfKSMTAapEaDESqGhLkme6Ct30PWRFRXdESr9i4iE1XWSBA2ggMSseI1iFLRLz
         MKV2s3HSuvHWyLo0Gurc53imm3bFgs5f7inUajXQcdREjGZ4XDyDii7pVZLxGZ8FBuzu
         u3Hu/nNEDAv7RmGO5TdyzqzCp6wf59LHZHIY7308TWSLxKeCPGqn7F8bjQP9xHbOmLNf
         WJnBmxCRLypFbtsZkDbuWN8wth1WFctKWuWgJTwVRMUb26g5wTJ1ZI5hDJF/avi/t8gB
         aFFVIaKvkL9niZwEZ/YM8BPNTdjlBwQy06b02JjqN+0nwni95qRLPx85rVgT1d/vEHw2
         LPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781343188; x=1781947988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8T+pkFF+lS+JDBAjF8JI0LZg2b8EwfaONvyE7Gy7O/8=;
        b=NUiQCcxbT9Ml+X+iA9LPlq8icQ7XbXTq21Bl5coflqJ9kA4MA7PCwXAkpuX9qI02pw
         uySRYyqlEobIP6gnARrUopyEVv1GaxIYwLDTiHslYohYJcg0KaCKoa71gxjJnI9ZOojx
         /qiLP1Ml1k3NJxS3PZ6zbBsetgVLoQ+knmOAPSzSVCTlFQPSviL9C+wU0NeTNgcJmxER
         mrgU8wzec+BF04/aAUU+fhbgm6EwlJKNy5ZJZEJw5F+qqXsZ5y4/MjIqztS0n0DNICTJ
         cHYK1bymRdFCL8GkPAHlaExWz6FM4YWBIH9h3XP8kwN28wbTlcSz7nCV1Tm4OS5HOUgc
         Ek8A==
X-Forwarded-Encrypted: i=1; AFNElJ/wB6II3wEFySJWgdogTpuXyN0yCcoc5jCfDvJ2Vs2HeJIxybzKdSMw2Gd0AqJy6kLOc0NEMriS221Now==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPaTNVo9420NE7nHM3RxqimvEE+1VWrut6FvGLBKxgsr1T06vu
	b60e/0bQbWS379PTFm/bthk/a4Optr8lF2wUjF7v6CXGrBBq9smcTR74TF8PsoWo
X-Gm-Gg: Acq92OE+p4XpGpj8MmiNiLn8pC8uWZ21lNF8RN3a1jI7GqMv8KOij8oGmAY266jFGok
	Jlg+wKdIcRkU5oElEdhRZhshNlWf3DRrRyl41627GGuWbssc3qsfUoH6/MnMneuXqlCzKh1eUZp
	YsKx0JAMSv/9rqbUasy2utFozBeQkYW8u/x8/WtnEBlagTvxdFYtuyXj9E/CRswHCsbjug0Rfjs
	TUwnM9CstB/R7P7tPCNOaC3o//h7N68CtUoANtt1zXHOCDEqMRD6KojGpkhp9F0sLJT3B31y8qm
	MScmmf7IQbaUtv6fmhS2vKyPy2rS4BiX0xBpqHKESg/dLvcrO01odrabGu8NrjGgcLFbAefSsls
	1g65rjxkaOTfBwVyCqqwHty10tAm+ft0sImhZ7rHbMZZjL/ts4gCDoP+1zRAUDgQ8qgAuiZvxaF
	oo15KHTwZiSm1SjrQ347swUnFpr8iLFK0QZqYY2CYQCb1P7fWb1Sy3fU8=
X-Received: by 2002:a05:600c:1f8c:b0:488:d6eb:e63c with SMTP id 5b1f17b1804b1-492200768abmr37382835e9.15.1781343187661;
        Sat, 13 Jun 2026 02:33:07 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26392esm13886883f8f.3.2026.06.13.02.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 02:33:07 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 4/7] drivers: staging: media: sunxi: cedrus: add H616 variant
Date: Sat, 13 Jun 2026 11:33:05 +0200
Message-ID: <L1ZJMTqKQbak6NcKbwFkDg@gmail.com>
In-Reply-To:
 <CAGb2v64wDvLMFn9DYs-kH1S2PpHJat-imxR5eJSQAUYjOp=Xdg@mail.gmail.com>
References:
 <20260505134812.408316-1-wens@kernel.org> <JyKk48uGRMGhs1Z-wzq5pA@gmail.com>
 <CAGb2v64wDvLMFn9DYs-kH1S2PpHJat-imxR5eJSQAUYjOp=Xdg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64758-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jernejskrabec@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:wens@kernel.org,m:mripard@kernel.org,m:paulk@sys-base.io,m:mchehab@kernel.org,m:jernej@kernel.org,m:samuel@sholland.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jernejskrabec@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38DAD67E3BC

Dne sobota, 30. maj 2026 ob 18:43:05 Srednjeevropski poletni =C4=8Das je Ch=
en-Yu Tsai napisal(a):
> On Tue, May 5, 2026 at 7:18=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrabe=
c@gmail.com> wrote:
> >
> > Dne torek, 5. maj 2026 ob 15:48:08 Srednjeevropski poletni =C4=8Das je =
Chen-Yu Tsai napisal(a):
> > > The Allwinner H616 SoC has a video engine hardware block like the one
> > > found on previous generations such as the H6. In addition to the
> > > currently supported features of the H6, it is also supposed to include
> >
> > Remove "supposed".
>=20
> I can't actually verify that, so "supposed" is accurate from my point of
> view.

Isn't info from manual good enough?

In the interest of unblocking this, I would be fine with "supposed" too,
but manual and all my experiments show VP9 is supported.

Best regards,
Jernej

>=20
> ChenYu
>=20
> > > a VP9 decoder. However software support for this is currently missing
> > > and still needs to be reverse engineered from the vendor BSP.
> > >
> > > Add the compatible for the H616 variant, using the H6 variant data.
> > >
> > > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> >
> > With that:
> > Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> >
> > Best regards,
> > Jernej
> >
> >
>=20





