Return-Path: <linux-media+bounces-60585-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHk/Cuoy+2nfXgMAu9opvQ
	(envelope-from <linux-media+bounces-60585-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 14:24:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB6E4DA263
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 14:24:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68BDE3030E87
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 12:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B9F449ED7;
	Wed,  6 May 2026 12:19:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACCF4418D7
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 12:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778069983; cv=none; b=qGQK/4ozDE8Wvte2a4EH8N3DW6t9XCxS1ShMG6Muwi1K//mrRiNUT4kHafg8IVw9C/JW0OO6JFH33YjEqDOWGwCkp08HHgqmtMWMmwkvE55ecDGRwqbAsFyHyEBWB6PQHw0vMQowVmUQn29ERjXdjNFoJZDOkGMmYdDAJmE+dxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778069983; c=relaxed/simple;
	bh=OGgIA55BZAFXmu80rcWgjfY/+756SJIACznmErfcp5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GP4O5kfmWms41tsViQh1RG3lk+GvlWSYG3/1AVOI87JNtOT6r/WjkF/1cqfP2rvDSQmneTQLNXljO91lc6qDIkXHkwnSKCbqUHkj13Rrcf1Cua+GO8N1wlE8w4nHQhFl3mUhWJ33Z2jO0utinBMtihQg4FQimHlUoldGDnrWu18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-948029fb1f2so1926959241.0
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 05:19:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778069981; x=1778674781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zWnsycWbumXvHAbUFrY0DhwMzBvdavZ86zhUbzNKa2s=;
        b=spLl/6K0aIFZSXLKj7s5EOe5hKPQonfcNsEW4hHpv2R/KVzjXxG++Ze3e/21HgIA/W
         PvozHcRskCre7CN4TofaSzIrhH9eXPefSba9sJdCK55EErx2NvPHif5tYAN61/tH8gJa
         XBEkaEyQEKgH9S4jwE/8ljK+Kh0X03/bkx0txLUFo26IojRuW0jRTVd1I1yiwhGOSVip
         17CkLSfYr74odf8o0DRTWsoi8gO8syZ1lAH2Cw6h/uSxJVItsoa+8k4AYaf49EWtiJx5
         yXWXjAonNk5Un3Hcite9HmMjycJ6SrT/vweI8LOk3CsoyNoBOAqDm4yvWS7Ige0ATsBz
         tIYQ==
X-Forwarded-Encrypted: i=1; AFNElJ9OP5zfV00A4qmoXrl3y2UHFK9sRXGjkKsUKHWv+NmaWwTmjAncj9BXybJBOeI1Md5NA7mOInweQebL6w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9hFkN/2e/eQ6zrqP9qcKkQzsIlj8jLla4ooYbbr24LIZEViZa
	BR6INvQ1GvkPI2UtpbwktjkZItxCiru6sNwBnuCMtVvEzEAFB/7KR68/LOONFiuwL0s=
X-Gm-Gg: AeBDiesBeAcp5EQwpbtkzJEmh87P8FWeXXvUqA7PH4siB5POjx1mYpFDfC38WnwBasi
	tsZX1fQR2sMSeCjucGx6DxIBOFZAGZnIslPWydBFkxd1iEbPjPQHkdAf4Cc1rVcI3e0hUmDWvVv
	+8uXN4vNX0slBXJN19w0kgQMjge11rm1CGC2KvW/qO7qeukWHOfvMZobRG6HpPdewPo+liCscMq
	ILRW0Uq9H66gsGunrZUzM8h8bdq/LkSzxBgbJq+I7AiSADZo5QmbVQ0IL6faiIq2WmCw7KMbXW4
	WAS9YkbTDs0hTNob95ctu9so9FngoFBNMGHj2XZtkBQZpuptvgOtnwu4/in+QXYcB0HVu2cqUyc
	GI+4m5mvbtnYlUSKJCgySnddP78gIpQru7BA4SFg/AXnBfU7BpYMgqJYEWRfsumaEUatt8NcUt3
	FzVcz/Gestndb1oPWHgWAsqkYVetiQ2sCFVLbPnXLoW5eDzlDFGtOACzdPKMnOCQPxL2D+/jI=
X-Received: by 2002:a05:6102:4429:b0:602:8ad9:1f6f with SMTP id ada2fe7eead31-630f901b15amr1029149137.5.1778069980786;
        Wed, 06 May 2026 05:19:40 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce08972bdsm8496029241.1.2026.05.06.05.19.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 05:19:40 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-95cd9a5f24cso1673662241.2
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 05:19:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9mu6QNi2WL76MCNqJ0vPywbL7n9V9mJXSPQK1HjJ/dsEQwxI8ceYZqkUGDSsrREE/+mP+zX3RGLIY1UA==@vger.kernel.org
X-Received: by 2002:a67:e102:0:b0:630:2428:7abd with SMTP id
 ada2fe7eead31-630f90815d4mr936479137.11.1778069980279; Wed, 06 May 2026
 05:19:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504010556.2796398-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20260504010556.2796398-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 May 2026 14:19:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGo0G1ZjuXa=PA_2fa8JpU+z6gbp-Dh4FWPK69V4SvJQ@mail.gmail.com>
X-Gm-Features: AVHnY4IG9JEePlz9NMSwqaWGbq3mPYkZd51IDr_wNWH5wl5ZacHtWP2K2qU7iv4
Message-ID: <CAMuHMdUGo0G1ZjuXa=PA_2fa8JpU+z6gbp-Dh4FWPK69V4SvJQ@mail.gmail.com>
Subject: Re: [v8 00/14] media: Add support for R-Car ISP using Dreamchip RPPX1 ISP
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jai Luthra <jai.luthra+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 9EB6E4DA263
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-60585-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email]

Hi Niklas,

On Mon, 4 May 2026 at 03:08, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> This series adds support for two different devices that together enable
> ISP support on Renesas R-Car Gen4 ISP processing. The first driver added
> is for Dreamchip RPPX1 ISP, this device purely deals with image
> processing algorithms, statistics and image conversion; but have no DMA
> engines. The second driver is for the R-Car ISP CORE, this device
> deals with DMA to/from the RPPX1 ISP and provides a V4L2 user-space
> interface for the ISP.

Thanks for your series!

> This series depends on the ISP extensible statistics definitions
> out-of-tree patches.

So that is:
  1. "[PATCH v1 00/11] media: Add iMX95 neoisp driver"
     https://lore.kernel.org/20260413160331.2611829-1-antoine.bouyer@nxp.co=
m/
     for v4l2_isp_block_header,
  2. Jacopo's reply https://lore.kernel.org/aeHd0G_JDaROMWDd@zed/
     for v4l2_isp_buffer_size.

However, that still leaves me with undefined struct v4l2_isp_block_type_inf=
o,
and lore couldn't help in locating the patch series that adds it :-(

Where can I find it? Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

