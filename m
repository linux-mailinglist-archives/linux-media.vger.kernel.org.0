Return-Path: <linux-media+bounces-62468-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEoFNO79DmrrDwYAu9opvQ
	(envelope-from <linux-media+bounces-62468-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 14:43:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8CA5A4FF0
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 14:43:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4B92309E18A
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 12:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B874385D9A;
	Thu, 21 May 2026 12:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BLStrpUJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BE63A5452
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 12:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779367053; cv=none; b=llr9qYy73oFWKQ2yb9FzxHSt2o3KFnmwzDfIZrZShOnDIOJecxsn1eTzNko0iO+KcbVIamCp4TgWLjy+DVzX/5PunqnufWs+Y8TqcHXyi9ikhoqAOdQ1Ed62gUB+vZg20rSAJdaLDEIsJPkKoVhwEhjWnZPksZ+SUdOTcrsTO3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779367053; c=relaxed/simple;
	bh=4ADfTGnQPzPw9uYjiUKJ76GqQkL3OcJYZUPppA4KL3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qrO1o0OxxJNGcyXyLiWB7hV7ONhMzu7MHsox9op8X14VU/hUS2tbzwgj8uVjoLkCOZSzcU5pKUXV9vJy+YnhDQSAS0DgjVVd8nYFqznpwj9LlsPbd69II+9tdGol38cLdJuu636RuSe11pHXx3Fxesl4KCiS0c/C5dZmHgiRB+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BLStrpUJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D541F00A3E
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 12:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779367052;
	bh=3dAfBojcBjvH63IBG4+flCX7uLeePJ4fQH3Id5o7fqk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BLStrpUJOCPPy+S+7IsHHY/fX4qihPLXyxLUAkq9s2HNeS01OPMg2jq00MJfSCBN2
	 t/88X82VDAVVcACnsmI1IVXmaXZ48eit03W9O8L+TXG4lTtEsB9piGLeg71LCano9G
	 de2jnr+3iGutQZFwzsmFueUwKbIPel0gy2Hj9G1n9EDFb5bJwjf5/D3FXNyweFG27V
	 NhgFyxhobH8p8IioS+jggDQMnMjdvgZ09TzryHr27mM1kjXA9QpGtWoN/QTBzm190i
	 HV3sx5J+stGnnqqD9UXNTaqgweAypEGwpcmFpoklCV73/J7WogE2lVhQeZlaab5gQY
	 JI/BY0xw3804A==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39397d63804so8361531fa.2
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 05:37:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8qZqvHtELGE4cMsafSthZo7BniKARCM2ucPRXM6dSEDnG72pdmRbgHaxBX7dS2iCRztEUn54zRUbmDOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWXAA3FERId9oijFiSlQNe2hOR+jHb9vXqeUFSQYcn7+UXiV4a
	bxwJdt4UNagCCgUUMFEuGKRPG02Ig90Jwrr7Dv3TChEwHBVbMOhKRl2BLCgNKejJJlW8mxJH5Uf
	6NZ/ro50qlQgv8pojOC2AWgWuKwMFv0b8sPLmH0IxPQ==
X-Received: by 2002:a2e:a593:0:b0:38f:7fd0:1c53 with SMTP id
 38308e7fff4ca-395ca5b8945mr10788641fa.19.1779367050810; Thu, 21 May 2026
 05:37:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506082211.5624-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260506082211.5624-1-bartosz.golaszewski@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 21 May 2026 14:37:03 +0200
X-Gmail-Original-Message-ID: <CAMRc=MeD3rDyGqqYC36FChx=SgDikPAXTr1i7-zMWnOnaK+xyg@mail.gmail.com>
X-Gm-Features: AVHnY4KQ1clegbtDXHMrtWqdtgsi6pzWD3BqsRvURygDHG23skbooBcyWhG563M
Message-ID: <CAMRc=MeD3rDyGqqYC36FChx=SgDikPAXTr1i7-zMWnOnaK+xyg@mail.gmail.com>
Subject: Re: [PATCH v3] staging: media: max96712: drop unneeded dependency on OF_GPIO
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62468-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,msgid.link:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 4F8CA5A4FF0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 6, 2026 at 10:22=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> OF_GPIO is selected automatically on all OF systems. Any symbols it
> controls also provide stubs and are private to GPIOLIB anyway so there's
> really no reason to select it explicitly.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Changes in v3:
> - Send the staging patch separately so that it can be picked up for v7.2
> - Link to v2: https://patch.msgid.link/20260316-gpio-of-kconfig-v2-0-de2f=
4b00a0e4@oss.qualcomm.com
>
> Changes in v2:
> - Make gpio-watchdog depend on OF && GPIOLIB
> - Drop picked up patches
> - Link to v1: https://patch.msgid.link/20260304-gpio-of-kconfig-v1-0-d597=
916e79e7@oss.qualcomm.com
>
>  drivers/staging/media/max96712/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/staging/media/max96712/Kconfig b/drivers/staging/med=
ia/max96712/Kconfig
> index 117fadf81bd0..93a2d583e90d 100644
> --- a/drivers/staging/media/max96712/Kconfig
> +++ b/drivers/staging/media/max96712/Kconfig
> @@ -2,7 +2,6 @@
>  config VIDEO_MAX96712
>         tristate "Maxim MAX96712 Quad GMSL2 Deserializer support"
>         depends on I2C
> -       depends on OF_GPIO
>         depends on VIDEO_DEV
>         select V4L2_FWNODE
>         select VIDEO_V4L2_SUBDEV_API
> --
> 2.47.3
>

Gentle ping.

Bart

