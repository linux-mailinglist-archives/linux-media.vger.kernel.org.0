Return-Path: <linux-media+bounces-43754-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 27951BB9500
	for <lists+linux-media@lfdr.de>; Sun, 05 Oct 2025 11:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 681E14E3483
	for <lists+linux-media@lfdr.de>; Sun,  5 Oct 2025 09:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8165023816A;
	Sun,  5 Oct 2025 09:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="mSIhgCtG"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B395A1DDA09
	for <linux-media@vger.kernel.org>; Sun,  5 Oct 2025 09:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759655372; cv=none; b=nJeudfNF7bTfsOCspAdu9y3jjVJLUVaAsno+JY9P6CufLl0DoD9oRAyB/PQEJBGoTIm8jylabEoL0+MsDDdEPFblZcJPsasFZIxFyKcKncGsAgpPj1aoPm4CLrDxX4BVOIwoFuHWa1WLuEl7LJcoJQ0Mbw10WWO0fcx4KSkhyEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759655372; c=relaxed/simple;
	bh=9jkA9Fk6NfBSCCuUW8lEHgHucHUSiGOIZzberV8hcFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UUndcXTIId1iJx8xLaFnl7bPQrMREr3xiG5S9NE0RR87Maomu1koBzjY5bXtFJA77vfg7NcF4mW32dV4+ODfH0gp8WIEGjO5XjyDPc3yMUfKI53Dw6cmhPtQAXDSDZSSSHAt5BFpgu/NiO4YCa0icEGoNIzh91We2/n3vJ3AC8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=mSIhgCtG; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1759655362; bh=9jkA9Fk6NfBSCCuUW8lEHgHucHUSiGOIZzberV8hcFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mSIhgCtGRtJ1fqnAJilwVBN6Jt8o41SuK1UZDVkAMj0RNK2il6js//Hl+ykACAE+F
	 VT9Ziy0XqevWgBC0aBjnWs4NQNT8gZA9Uo9uE0emN2v7AKeOHGcJwze3TArXWOnMgt
	 xLOHLn75eQREyH0EO11TorK2oIawyClztlkWCntyhFUUMspKX23Ya9rZNM6Fkw5Sx1
	 hBsiBHoTttpEQlEMGBuzC3rNeRTO/nIS43ICacMh63QBltZVRVqj4BrXIMScTsHxF4
	 3rg2yYVELv0/RO/oFbwJfgrp0oa5Lx9QmdgVR26eosXRxZWjctBWOs5Rx87SzkDZeE
	 WpZP1mUXWFVtw==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id E783E1002BF; Sun,  5 Oct 2025 10:09:22 +0100 (BST)
Date: Sun, 5 Oct 2025 10:09:22 +0100
From: Sean Young <sean@mess.org>
To: John Stroy <kernel.org_202510040544.1952@jdstroy.cf>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH v4l-utils] utils/keytable/rc_keymaps: add zune_hddock.toml
Message-ID: <aOI1wlmX_VibZm1B@gofer.mess.org>
References: <d90b5072-3a10-44ea-93e3-0077fbcbd509@jdstroy.cf>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d90b5072-3a10-44ea-93e3-0077fbcbd509@jdstroy.cf>

On Fri, Oct 03, 2025 at 07:50:17PM -1000, John Stroy wrote:
> Add Zune HD Dock remote control (Model 1401) data.
> 
> Signed-off-by: jdstroy <jdstroy@users.noreply.github.com>

Thank you for your patch. The way we add keymaps is that we add it to the
kernel tree and then the toml file for v4l-utils is generated from that. See
this commit for example:

https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/e31604d5922ef76a58bd3f9ae719486887eb266e

Thanks,
Sean

> ---
>  utils/keytable/rc_keymaps/zune_hddock.toml | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 utils/keytable/rc_keymaps/zune_hddock.toml
> 
> diff --git a/utils/keytable/rc_keymaps/zune_hddock.toml
> b/utils/keytable/rc_keymaps/zune_hddock.toml
> new file mode 100644
> index 00000000..a38fc75e
> --- /dev/null
> +++ b/utils/keytable/rc_keymaps/zune_hddock.toml
> @@ -0,0 +1,17 @@
> +[[protocols]]
> +name = "zune_hd_dock"
> +protocol = "rc6"
> +variant = "rc6_mce"
> +[protocols.scancodes]
> +0x800f640d = "KEY_SELECT"
> +0x800f6410 = "KEY_VOLUMEUP"
> +0x800f6411 = "KEY_VOLUMEDOWN"
> +0x800f641e = "KEY_UP"
> +0x800f641f = "KEY_DOWN"
> +0x800f6420 = "KEY_LEFT"
> +0x800f6421 = "KEY_RIGHT"
> +0x800f6422 = "KEY_ENTER"
> +0x800f6423 = "KEY_BACK"
> +0x800f6427 = "KEY_PREVIOUSSONG"
> +0x800f6426 = "KEY_NEXTSONG"
> +0x800f646e = "KEY_PLAYPAUSE"
> --
> 2.43.0
> 

