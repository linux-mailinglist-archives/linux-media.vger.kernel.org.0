Return-Path: <linux-media+bounces-57567-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMSDEMk8ymmd6wUAu9opvQ
	(envelope-from <linux-media+bounces-57567-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:05:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E85B3357BE7
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DBF930D3E54
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 08:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B549D3AEF42;
	Mon, 30 Mar 2026 08:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fR6Iu333"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCDC3AE701
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 08:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774860757; cv=pass; b=PLDEQ8kYYZE8QcwY1EQQTsy3YdMDE9Ht0u2Fc8qe3SJV69h/z7EFhYREcz2isRJFkkJFTQZ/nrCfj/pk26tBbdWwfF2L3a8JLWEzB2wzC+GVbPCuq3tBaT//WNtIQJtLHSvOT9dXuzKRsFYU99Q0qsNrvhNTV6dlJBx//gxM+dg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774860757; c=relaxed/simple;
	bh=+kh6nzTZwqdUygYtxzQNHK1HwDmUUjTXU3fNuSYwayY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WEawzKNh4WQQGQsvnQ49Vf4V0NLTtpt5PC9M24Ee8ooWkPM8MzBuLkUPy1qsvosoMHi5yvGFe8VdthZnTccmMEMNZSUOmE2mDG+fZ4etKoJ1UxGqNbBoCBG7LzwAyMfkEyKdo/nTOToIBQd1m3jxTpxOh6Nc5A9aqUlyponS8ig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fR6Iu333; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b976536806cso534186766b.0
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 01:52:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774860754; cv=none;
        d=google.com; s=arc-20240605;
        b=fCEyO6oxpgVCeF6ZLuNkZlNaP5614eLkpiiaspDVTNFzG7fjG0CyrmpWoC0hOyCgDh
         lgZAtNnSEF6qk6LXO772F45R52IHfBaNBUBuyH0LT218CvFKGXikpKyIJRFfFIRi4EWZ
         /F7CwkWPII2TZa+F4zNlxEDGg4zB0kA8FKM86qE6A2godHda9DkuXaNQ3XqaTPexGOZB
         FCcfYYZbAUYi1A8BuhXEBJXg55ZmsN64FC8Hsc+Wt/zqJUiS+qOvaE/FJShzUgRbmN7H
         JdG7IwqwwujRQ+Vd/ZzKO8/MT8Tr5eamKy/rPpsy9UjR5Eo9P/wtJIh2GxkDk8BHB18M
         Kmog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vUKiDlxt0ogDSzxaL2p1luSvkqrqMFZqS96GQhnh3cI=;
        fh=2wYi4hMR0PGrNrXD+XSFXlsIO9jl5OzSWLrECeVHBog=;
        b=fK1PxbTNahv034SGbVdtuPxRZLE4aqAd2sO7AyStHLbPEy8yOCQJdEND/qq3BY6UzH
         VeabgmFV2ZFqtMak8qoymX7PgBXm2MuYaxVEJlvOf8VCPnO6JKOHPU66GnVfgFGmwIE/
         vJBZoXufR8rDfemvgfN8KHd4fmCKGvjwpKvUM/R0sBNjlRcJf5wHfkhFde/YFiiYnbNq
         EArQoJQ7XfHGYUmCVz4Ew3vaA3jzE3VYkPTvle4SZ6TrpGv90y17O7m/jyl6kQKdtDQ7
         PB2RFX/Z7MF+QE8g+bHF8dLShH+r2MlxtkXv8sdgTsrotr7frS1h0dioy0pwiyyYRvnV
         Q+XA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774860754; x=1775465554; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUKiDlxt0ogDSzxaL2p1luSvkqrqMFZqS96GQhnh3cI=;
        b=fR6Iu333xoPR/8eycjBgW8+apMnC5ZfErtZ212uLt0YWITm52MCFJ8ilIOUtIyrJcg
         /nfRKHsqojeMOzEspvHBEWbQ7tyarrQDzeYFZ3cdohdc3Gk0JLpuV6KCT1zS35mHBEHE
         NnLfWQVOKjSvm4xCz0HE9Qv7metEsZgazRXcfnyXnZY319S4DnprGSCsHp9ofhUabIqd
         go+kwZCM/z41V5sETQLMggkhNlRNT31VMR3W48utDBHhwYsuR5moIFSwsquk95ygSVj1
         yBUJ5t/+xh6qU/Mz9Ml2o0UljkztTKmP47L5S8iOMcSFE/lYYQoavGRdOL3FXPV14c35
         vc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774860754; x=1775465554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vUKiDlxt0ogDSzxaL2p1luSvkqrqMFZqS96GQhnh3cI=;
        b=Sr25Qt/1rMGQ6s5GaKJ7herrRDSGAl3U0B4mjqXqMSFfURdeQeY+sQKwF6SrkiJQUB
         XXIpkGS8kv1roQ8L6S0Z2MTa+Xori3qf7zgl12uRj/GCACAEX6WX+LdsFCLk4CMJvcdD
         ZG361yO1/AgxCbWDTu5JE0FsbnfJS+qBU1h75nywACCzAhLGUoeWe6rHneyzUgpP90M1
         tV9bLveWiJ4IR5Ixu6RsrMm1enldres50Ah270IuaEes/xyqjBjwkelgrsz1j++1DeBn
         WFAOUuEyWKKNIgdeXbuq0Tx9hK5sC3z71Eviqjm7GeCglL4E9fpfFdIsN6ZpjpbtsdKe
         fIMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhUigr3UKwbbOhrS+rE7o+oRhidGgSSdfxiZUxCJXukPv4LwQn6J6R5NkNEME2A4Bmhbp19bqJ+rksYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKscv2HJYfRescXmJzxm2XXUb8cZxN8P9u0bV/oOLZaoCsyW89
	OCd+g9onahLtQFvFMv1uDtfFYkJ5TwQuRwK7nQxyGRbyOHFoSoI+YCB31IKB0zEHEUQMO/civuA
	xffbapN95DQLRt+IfqanoLEJtFYe1Ybk=
X-Gm-Gg: ATEYQzz5VwQ2BgepXIMhGe1pyPnlNtMDO+410uYJGtqWFJqZXdd+ccG7FpeIpiOHHXP
	kV/5+Qal43mqE2r1SGgw2wQ8107I2skgI0UD+PF/xS9MJ9b0jpJxKCB3V51yR6LL7vxv3EEwjW9
	a+d0/rSfXRkdGjRGnRZOrDFMt662nambr8G4XTHyx21lMGX0cdgjOkOag+sk8etWSUwGfDBViHr
	1yB8XCEJLyfgnmJYM73CQrJ9V0MsgkdQZVLxFXb9ttat2rtBMTjKy1BMF5s7XgxuB762txRWlgz
	S+CF+ZoN1TfrBDSzPWk9VkVIy11JxCdv/9E1TxiEV7XEN0OXjgsGjDh+eUOObBVh07WDbLCA5BL
	lSkT6dY6ZClkZubkgdg==
X-Received: by 2002:a17:907:c206:b0:b98:6926:13da with SMTP id
 a640c23a62f3a-b9b508d6634mr668409666b.45.1774860754008; Mon, 30 Mar 2026
 01:52:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330073549.5782-1-robyserbanpascu06@gmail.com> <20260330073549.5782-3-robyserbanpascu06@gmail.com>
In-Reply-To: <20260330073549.5782-3-robyserbanpascu06@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 30 Mar 2026 11:51:57 +0300
X-Gm-Features: AQROBzA-iT2Ca20v73jGEEWB4uICVP5S-OZQGgAQUK2eFploqBNKPjJKd8yYbK0
Message-ID: <CAHp75VccfdW1BCHRpjKz3Vj=8UGJm8So8nOFFKNQK=L8nniVhw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] staging: media: atomisp:
To: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, daniel.baluta@nxp.com, 
	simona.toaca@nxp.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, d-gole@ti.com, 
	m-chadhry@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57567-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E85B3357BE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 10:36=E2=80=AFAM Serban-Pascu Robert
<robyserbanpascu06@gmail.com> wrote:
>
> Correct a spelling error in a comment:
> 'uninteruptible' -> 'uninterruptible'.

...

>  /*
> - * The longest allowed (uninteruptible) bus transfer, does not
> + * The longest allowed (uninterruptible) bus transfer, does not
>   * take stalling into account

While at it, you can also add a missing period at the end.

>   */
>  #define HIVE_ISP_MAX_BURST_LENGTH      1024


--=20
With Best Regards,
Andy Shevchenko

