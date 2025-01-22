Return-Path: <linux-media+bounces-25116-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D599EA18EC5
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 10:50:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A82DD1885849
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 09:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E63241F8679;
	Wed, 22 Jan 2025 09:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="IGJiNKKy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172461F76B5
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 09:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737539396; cv=none; b=dhxs3EhjAKZ+ighCbogFunS3pFhH3P950ZOWxD3AXb7diUwu6AntMg66x1mcuYJSpY/KEeSUCgI3+zcG3XUWS6qomISSX7/26yeHiCWqVVGwSfUiAbrze5cJUysK/nNv7sx2L9roqkJ2LY17UjmTO6m8R87mlSo5aBQO/LJWJt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737539396; c=relaxed/simple;
	bh=yIrMPQk1jpPdU/Y7nRboE6hJ8k1ZNfl+Ugh3AxvoCqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mh2DTyuzKG4ycX75PF9nculh4Ns6GR+KSTWebo6JeY1eHkIa99D2Dgjl8TXNsNpf9ikvYosvOsz2h0NUvSSzCHA+POPnvCMfrHltFarUcb4R/2sM+lY/hXzvVf+IO+qk1tdj2T8AaWqkewBcoG8v+zQpRAOeAeIk4bu69ZqhtbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=IGJiNKKy; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Received: from localhost (unknown [10.10.165.14])
	by mail.ispras.ru (Postfix) with ESMTPSA id 7E0C14078537;
	Wed, 22 Jan 2025 09:49:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 7E0C14078537
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1737539383;
	bh=C5V0l3jQ4NhZBF5hmWDNsgD6wzWUeZcvRwpbsSszw+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IGJiNKKyDjsD+hUTF6wKXZ3JCv31k8P0VVhUTzjGObgpgvs1rwag0Pg7BZ46zHtXy
	 Yvz2PpEhMDXUxzM7DLIXpoIvyEGpaxBwDBxTeK5N48RTBUhTA4wv2FWXO2QitvF4T2
	 db/gFgFUSTzalSg2OxokX6xLOcYTw6thKd5n2DNI=
Date: Wed, 22 Jan 2025 12:49:43 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: "Alexey V. Vissarionov" <gremlin@altlinux.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	lvc-project@linuxtesting.org, linux-media@vger.kernel.org, 
	Manu Abraham <abraham.manu@gmail.com>, Luca Olivetti <luca@ventoso.org>
Subject: Re: [PATCH] AF9005: fix typo in the bitmask size
Message-ID: <fxwptdsbee7a3xmygcerapwmdl72ue5uacwixrzlsyzy6dturs@v3xncp73k6xg>
References: <20250122092733.GD12162@altlinux.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250122092733.GD12162@altlinux.org>

Hi,

The same patch was sent twice [1,2]. Why? If something has changed, it's
good to denote the next version as v2 and briefly explain the v1->v2
changes in the zone after `---`.

[1]: https://lore.kernel.org/linux-media/20250122092733.GD12162@altlinux.org/
[2]: https://lore.kernel.org/linux-media/20250122000103.GB12162@altlinux.org/

On Wed, 22. Jan 12:27, Alexey V. Vissarionov wrote:
> Found by ALT Linux Team (altlinux.org) and Linux Verification Center
> (linuxtesting.org)

Even for the one-line fixes there should be some brief explanation on
*why* there is a problem and why it should be fixed, i.e. why there is
a typo in the code.

I guess the problem looks obvious here but still there may be some
useful information (if any) provided to the changelog.

> 
> Fixes: af4e067e1dcf ("V4L/DVB (5625): Add support for the AF9005 demodulator from Afatech")
> 

The blank line between Fixes and Signed-off-by is unwanted.

> Signed-off-by: Alexey V. Vissarionov <gremlin@altlinux.org>

git format-patch usually generates a `---` line here after the end of
the commit message.

Please take a look at [3].

[3]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#the-canonical-patch-format

> 
> diff --git a/drivers/media/usb/dvb-usb/af9005-fe.c b/drivers/media/usb/dvb-usb/af9005-fe.c
> index 404e56b32145f1e6..4621c1d24d578ede 100644
> --- a/drivers/media/usb/dvb-usb/af9005-fe.c
> +++ b/drivers/media/usb/dvb-usb/af9005-fe.c
> @@ -453,7 +453,7 @@ static int af9005_fe_read_status(struct dvb_frontend *fe,
> 	ret = af9005_read_register_bits(state->d,
> 					xd_r_mp2if_sync_byte_locked,
> 					mp2if_sync_byte_locked_pos,
> -					mp2if_sync_byte_locked_pos, &temp);
> +					mp2if_sync_byte_locked_len, &temp);
> 	if (ret)
> 		return ret;
> 	if (temp)
> 
> -- 
> Alexey V. Vissarionov
> gremlin ПРИ altlinux ТЧК org; +vii-cmiii-ccxxix-lxxix-xlii
> GPG: 0D92F19E1C0DC36E27F61A29CD17E2B43D879005 @ hkp://keys.gnupg.net

