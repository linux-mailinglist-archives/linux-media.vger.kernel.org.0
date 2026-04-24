Return-Path: <linux-media+bounces-59539-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNcwOAiX62m7OgAAu9opvQ
	(envelope-from <linux-media+bounces-59539-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 18:15:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBBA461389
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 18:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9AF003021B39
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 16:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD693E1211;
	Fri, 24 Apr 2026 16:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNgGTQkl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FB23DF00B
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 16:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777047262; cv=pass; b=j/Y2lFUyEYePgXCa0MLslh7pQQPA4uq6DRRzbUnxK+PMT7XHlMQ3t3NYKyhUH90KR5nwL5aA9DNx8rFILUs57EPoPnaI6ei4AM4z49bZyvrlU5YilmUvf1+r8fDU1G8SmUZ37s9f+wM9EKJm6zp/250R9Ao4EqoPz5ktZXO+y/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777047262; c=relaxed/simple;
	bh=y9VWWAVf+sPSulQkC75TryBTQ6nOxKyoDww0ynpLHJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EmYACQE9GikmrIMO2zoCgJYTSbU7l0kzC1CDiHKnEuw+hPUQnfrnd/QgGtxeyCUVroszbMbcavyj7JbhMx5rNqswKrLyIga5/o6DzBGw5h2ltkw6o7OOLnYfKfvJ1TNM5U5p6oQqfvc/Tpho9bovcni2Bo0MxSzqQEJzrF0s+UA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BNgGTQkl; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d0deb7ad5so6633145f8f.2
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 09:14:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777047259; cv=none;
        d=google.com; s=arc-20240605;
        b=ADq/TkJSF3Owdc2Qhntf/lxzJT7keAq5yDEEL8KuroIff+7fjgg+XK2BOGLNI4hbaD
         9OKzSDMeQJjyQQpHspHemz8pEwBCIt93IDdsfsil+RkcYtcsw4Uyxyq03YbRvoETTSsu
         ooNCDZG035hfwOynVHDHfKnuMqPRLpmv5UjUfaBaSLLTGNUZFMEaooBUrE2hJPqblqv0
         Jj3MNuwr+deLcwkp1COi8LwHZhHbua3+JC6AaO0thdIjY+5Fc/nYaV2SEpUUIZXHdCOt
         8+41750ckTNMD12r6ub7jZyXxLktC7+rw/g9gDJRRV9WIbG7sZDekwuh28fqJu5aBnxi
         Elrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TfB9/Ilh4zIbPmNYOZ8Zqqkr1ypd91RjaVULTxad/6w=;
        fh=aiJsueCStCptNQM4Iw3kQ5fRrFVzjNtBGS+3bze0FPA=;
        b=hIARjFinP+ak1IC5KgrVj8CTsqOccnD6mygTB5B0HuIJQdt06FoRk0k11B2gieJ1jA
         LHrYRo3Mbhj1TSRAVPRLRPf03sezem7EvpZZjqxsal6mPDe8tEub6Xz8h8o4f76p6HAh
         qwCyvA7jxkCaDm1qWBuw8ua9d5SVf39/p+6oO2Vq5kQ2Acp3femOJtEWdo8EkTIkxsZc
         sbfYuxXHCFd1f46YG2DbcASMDcNLg2pFF8hTUQBYOeN+VX66MyT5kS3KAoR8ViG4Jq6B
         8k7M6bnpg4M7Y9HWf2v2QSNFmMoHii42lZvBBIAPo7RJYmVbYj/txUNzVl9WgAGhP7Bi
         AJ3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777047259; x=1777652059; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfB9/Ilh4zIbPmNYOZ8Zqqkr1ypd91RjaVULTxad/6w=;
        b=BNgGTQklDRRb5IjhqKx4IiT8UftLlmBRs9dBcFjroiuIXepwlmddxWEcUr0+SQbPAV
         7CVX8LfQszYcnW6pNTCuUXlnn0JuQxg34irYNXE7pilyBEOVznZOa+//APnBzjXvhhpF
         dOYHPAmK/qcSjYrWNtTDGSPOh3qRimQmNWmPhDmyOySqG4W+YbG92o8FUwFZPIlZZLBc
         Go9ySir1ILK5pDkCgCKRLcHs1n/zElMZ5k7Mo0rIwhpXrsQPP/2piN0Qs1EjBWRWOtd9
         JH+tx1zWwuiN9DQEszaQ0usbE7MqX38iWqsmw+MwgaZ9nuKHEXthh43OXCCFrPtgoVut
         3R+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777047259; x=1777652059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TfB9/Ilh4zIbPmNYOZ8Zqqkr1ypd91RjaVULTxad/6w=;
        b=kTmTkv2RHBUanqqwzL7uw797wEvbJq1g+sSUf5cJSOsbfz6VXOxryA8+VVeBX5sdCJ
         BmjxEnDIGzqtxvStqiIyQeAdrGgYGv1HBW6o38s7pq44q3teZITEYOG4PWA5M4zm9dEF
         9Lb8hpbOvLVBhYevEwG/a3qyiny/ELF0+BcOKrdvka+AE4zXQDwSRtKQFNsOgKkYyTES
         0GT+vCn9Dx0SmTK6ayMTYb+rHhyEyPnDAzJaRmiR5xG+EP4rcxMhQNYWDBjHnbELuXn4
         70nxD9HDX+SHSSNg85eMMMoYilC2YZI7rinjZQ0Fkr1WbOElRCVJjQIKdTBEUDaA4GVR
         FapA==
X-Forwarded-Encrypted: i=1; AFNElJ+5JnT4l7gQjwJBk8lw1vJUM/l7RRQhWuGBC7cRZ/iIb6k09qJt33xT3k9ggtH5jwMIRn1kwOzVuEOThg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4Se3ebmhQKrQhmQT96sFBAc8mjhLQm4Dp7/ST5XgG1/Dfn7oz
	bEJGOjV83CX1wdpNm6XpUlvKqmn6Il0QQdkH9/b5f7Kd2GNLvRRwf6nQhsh8w/usfK5y5GvDmHz
	Nnh8dxGFEEDHatgwWfecmTXEZLmu5iV8=
X-Gm-Gg: AeBDievndQfmZx8AcCWSCjIV3gA5RtZNHp+cmWpPmqciVl5AMQoig4pBQqL9Q3b+Tf/
	DnvXdBLvrRMzOpVCcI68ksmxvV+tJvJUhTpMQEBTKHtGPr6lPuLnaoN7Pm56j7cINJNyrrw5zXB
	K/givx5tbvf3ugHxSncBvfRixQj9Z2n5Ls0zdzMyACRBTz2oEyvTLG9zSE56cjO1mgMjGcaKHsg
	tyPhhUizG1bI6fgKcrnXlkhdJjuRyuIaz4hcgP7eKjtJ2D+Pwt1Y1sp2xf0zJsw/IlEssUl8UQ9
	cKfd7tTitFXcxp6HDWs=
X-Received: by 2002:a5d:5d0a:0:b0:43f:e9ee:5610 with SMTP id
 ffacd0b85a97d-43fe9ee562dmr45512953f8f.43.1777047258447; Fri, 24 Apr 2026
 09:14:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424072230.90354-1-clamor95@gmail.com>
In-Reply-To: <20260424072230.90354-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 24 Apr 2026 19:14:06 +0300
X-Gm-Features: AQROBzDQ8OdXSRPg-Esx4t8hyrkv8O_kTNFel6FIImhLjgyCRL8pJaptl9yJGS8
Message-ID: <CAPVz0n3osf5=013w7=EhJKNeYmrRNg_JT2s9a9_tKWL_teQm-A@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] media: lm3560: convert to use OF bindings
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 3CBBA461389
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59539-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

=D0=BF=D1=82, 24 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 10:2=
2 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Add missing HWEN input pin and IN supply. Fix v4l2 subdev registration.
> Remove platform data and switch to OF device tree bindings.
>
> ---
> Changes in v3:
> - added note regarding lm3559 in the schema commit
> - lm3560 power on/off functions converted to be part of PM,
>   dropped redundant wrappers
>
> Changes in v2:
> - vendor properties swapped with generic LED properties
> - added mutex lock usage optimization
> - power supply and enable gpio commits squashed into PM
>   configuration since they are both required in making
>   proper on/off sequence.
> ---
>
> Svyatoslav Ryhel (5):
>   dt-bindings: leds: Document TI LM3560 Synchronous Boost Flash Driver
>   media: i2c: lm3560: Fix v4l2 subdev registration
>   media: i2c: lm3560: Optimize mutex lock usage
>   media: i2c: lm3560: Convert to use OF bindings
>   media: i2c: lm3560: Add support for PM features
>
>  .../devicetree/bindings/leds/ti,lm3560.yaml   | 131 +++++++++
>  drivers/media/i2c/lm3560.c                    | 250 ++++++++++++++----
>  include/media/i2c/lm3560.h                    |  15 --
>  3 files changed, 328 insertions(+), 68 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.yaml
>
> --
> 2.51.0
>

Hello Sakari! May you please not yet pick this patchset if you had
such intention. It has a few slight flaws I would like to address in
v4 next week. Thank you.

