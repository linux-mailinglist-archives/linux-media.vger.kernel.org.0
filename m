Return-Path: <linux-media+bounces-57572-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCmKOlU9ymnG6wUAu9opvQ
	(envelope-from <linux-media+bounces-57572-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:07:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A842357D37
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A9143068A3C
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 09:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B72053B27C9;
	Mon, 30 Mar 2026 09:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Unl1JwXt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8933B0AC5
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 09:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774861204; cv=pass; b=fF5z3NnuArAwt3mSIsDtE+7XS0teZXAbgMNVd0hGmlTF3a3Iai/x3QFKUQtS1si6Yo6rerMris22vrqdEhxRJisYa0Q8h9X+hk0NouxKXsMbOdXa3WykYb6InenTi5DTQZOkSbklVu2mpDgnfmz+iF3kfE4iBQiWEV2t1m8xhDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774861204; c=relaxed/simple;
	bh=Gmf4cKRYBxiM/zbzU6bBxAY/t0/pYX6lhM+af7/ibpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dCCFbtXhis/0YESxb/STTSCuSZR+uZ3Vtdq1FyKpSGoWJxrMGASUhs0kpqfJq4zgJwtgZ9nzjXMbrfm7q1A6cF8Of9AKYkTyDSkZP4CYnPRFhbLpwoqSfcMx35hltn/5HZpPJD72sY6vnyyZCsKh1LtBkaF4vU7w0cdocN4xKoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Unl1JwXt; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b9358dd7f79so762994766b.1
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 02:00:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774861201; cv=none;
        d=google.com; s=arc-20240605;
        b=j5mjw1+tfRcpHRbp1WpqAnEZ3xWrtcDYEoCpQC3nHfrlfMgGe2lmjGeC7Rprn0CH+E
         71hLDTdUELGUluMYkabWI8tkNHTaJGgqJywuut3v/FiwugyS9jwQDDjwM8l04nr0sXaC
         R6rJb8xKOmp/GxHDlfZ/BQUR4Jmt28skUDnSrOPkPt7Llrz+8HYqdiyV3TETdieREyn3
         aok+EklQdzSPY8W7TD6xMQ4LILtPZuSeK0D4rFKPEvHY63tcFHnEzNW98CAp3r170cc5
         mp2cIv9aB5X1jfuhscuS2K1xJRl1tVCsihu5vMHRhemCFJGYIrO9JFQR8CTNU1CsQJ+o
         wVhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aGiglqVIFw2t7J/GqduapkYUREbx60yFQhhgRL82ZAg=;
        fh=kBcvV2hCHwdhblanFpFN6Nxph6cTYZOEVNW0762iX0g=;
        b=RxP3qJdw4vxcFpmv/XQC1mJeBbOF+EdS+i0Mk5T3O+Dscv9uH2Za5QC2dX9nYdlwN2
         XbQJNx2DYdsky+gZDPruQOHN/7xuCRWtONr6Ve5ocmDQ9hQm1O1Ot4CRaGHsP9Y0w+Vi
         qre8bID/k429zD49txnPR4b6NRd0n+G0uW78z+dkGK6GklS8WeTaY0Kf6w+ziUoUoBqD
         mPdiqfm3Xm4buRcKS902jnp0hk02X8Lu/8YajZnjeOHqZesxseqe6goXWJsuQ+QP4FMh
         O8AbQJAWSeh4BisIGvm/kneoGAKzPrMFKw3OP93wbXn0k8S2RTqQpzBMAEuJwhKjvhlg
         k8+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774861201; x=1775466001; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGiglqVIFw2t7J/GqduapkYUREbx60yFQhhgRL82ZAg=;
        b=Unl1JwXteFmdabPvhnC4hQXFO0/MK+NC7xx3tSKAycepG0Rs7VQqQz4tPEjQ7zl585
         e8IEjWyNkxwRhRbRrxpwG3MOrAHI5T2lDzVci0AWpfyq2Dg5f6LsXfgZbSX6wGosSLSs
         3+jdQ+0PHHxwvqFDl7cW6PPbWK+lyR7gJev1vtLj+y4XdMpYXib3sU3tTWgEQqa/RIP6
         l8+TRgttUG2M5zSSbx9v/qy2BjiSMTU3/fvKknMt2H+V7dKRDJ0d5v/4EJ14SpLFJOxg
         fI4CkcH9ots6QU+DzhPIEGHnEkuFpBAH1N+wLEE1NKh8iJ8VwxoEImkw8f8/N7xrmyQ2
         x/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774861201; x=1775466001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aGiglqVIFw2t7J/GqduapkYUREbx60yFQhhgRL82ZAg=;
        b=EgyzyDVfiQ63X88AqEJXXXyz5MQ+fh+S3JaRtacF6uF9vWYUndXn83D/VmcFOjgunf
         /s5ULTpFjBsr3y3sUq8GCSydxp2RJ6zBkt8dV3339dVrhy3AqG7Nx8kIcz31UGN5xbW7
         LDcOZlbQbGHpG7u/rTW1s/6VKt88JGdFVasStubR0/bueVpFJc2mGYFCZkGkWsYw1JBN
         phShrUgRTNqpFBB40LPXh/j1OT0GmL/8ddtdpjhUJLjw3NCH3EEYIt38AxlPCDsfqF53
         Ji3czANpA9dLD4WqEnpziOD4PYDb7x52NG9cAZbfZGpBnDyWj9UqlAlTo0ctjjEnnisM
         OzBA==
X-Forwarded-Encrypted: i=1; AJvYcCVCFm22HS3iInL4kU9iJh7fsRtu7jf6yUWL0Nk9x8K4v8fNKK/lRh7JqA9l97HZOSVGoFBgJKUrtTL3/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6BNJbwLFDxWJ3Ru/6AwGGYmZjpCUgYdimla7GzpIY5Zrp/PdI
	cc5JQFLhuHvkOoOCqjq5k5K7s8Zj2vhvxASI4x3Dk7jjef6tChJjp/4GjHxsoeDO67EZu4KaWRS
	vQDKa4OjG8tDtKI7OycVNHjRHpAmdOUQ=
X-Gm-Gg: ATEYQzy7gbenWpADcda2JLf+PRll/k1G9VIoqNAq42ncvCzcULxhjGODYn/w5O7TJbF
	T4/A0rlxV4Z/O9rVoUmwCXxuWIAIkFIubnAoM8+zN91B+/DWCHjP3QUGtBN2wMVTWh9XvL1UF9O
	0v+xcoJHGFPajxFBf28HqZYqmUu6KZn7Hqn3cpHWRc3ElhkuinwWQb02QkchTQpv9KWurw6PNvZ
	gQMeH3ChSKuvpqVmIi2vb/3lOe5W/dutnILCNruB51DldfGx/tokJrn3s6Af6VcPbrnNCPJcV0s
	3PfI1mtEfErVXf24+XqSXS9OMljY3EDLvmuXKb+y7Pir58tTM5pPr3R46blWo5pueoWSbvE0ill
	USfokCts=
X-Received: by 2002:a17:907:9711:b0:b9b:63af:d9cf with SMTP id
 a640c23a62f3a-b9b63afda64mr607791166b.48.1774861201120; Mon, 30 Mar 2026
 02:00:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260328192721.255493-1-azpijr@gmail.com> <20260328192721.255493-2-azpijr@gmail.com>
In-Reply-To: <20260328192721.255493-2-azpijr@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 30 Mar 2026 11:59:24 +0300
X-Gm-Features: AQROBzAcoxHOw7fb0aPNNPEuLuc8vp52MzCuSgku8_PK1LjqHwTGnIxNOYa7iJk
Message-ID: <CAHp75VezSSid9b5qNzvMjUS7QTJaKtBhhVVnuS+-sjVe_a=CxQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] media: atomisp: fix potential NULL pointer
 dereference in configure_isp_from_args()
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alan Cox <alan@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57572-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9A842357D37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 9:27=E2=80=AFPM Jose A. Perez de Azpillaga
<azpijr@gmail.com> wrote:
>
> The function configure_isp_from_args() incorrectly dereferences
> args->delay_frames[0] to configure cropping without checking if the
> pointer is valid. However, as noted in a FIXME comment later in the
> same function, delay_frames can be NULL in certain pipeline
> configurations.
>
> Add defensive checks for both delay_frames and tnr_frames before passing
> them to their respective configuration functions. This ensures that
> optional frames are only processed if they were actually allocated,
> preventing a kernel NULL pointer dereference.

Have you experienced bugs IRL?

...

>         /*
> -        * FIXME: args->delay_frames can be NULL here
> -        *
> -        * Somehow, the driver at the Intel Atom Yocto tree doesn't seem =
to
> -        * suffer from the same issue.
> -        *
> -        * Anyway, the function below should now handle a NULL delay_fram=
es
> -        * without crashing, but the pipeline should likely be built with=
out
> -        * adding it at the first place (or there are a hidden bug somewh=
ere)
> +        * Safely handle pipelines built without delay_frames
>          */

This comment suggests something different. What the proposed change is
doing is just skipping the invalid data without actual understanding
of the root cause.

--=20
With Best Regards,
Andy Shevchenko

