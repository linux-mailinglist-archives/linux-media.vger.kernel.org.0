Return-Path: <linux-media+bounces-51115-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AP2bL4BZcGlvXQAAu9opvQ
	(envelope-from <linux-media+bounces-51115-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 05:43:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 371E05121D
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 05:43:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1E831867C45
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 12:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD7734028B;
	Tue, 20 Jan 2026 12:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LgIGSvU8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91933D7D71
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 12:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768911231; cv=pass; b=M6vnHiXBmSo9TjEvT3uEiZrzKrZ0QGB1ImKfQBWe/iwUi0hQHY5toYNhYOUNr+Gm1lfixteBp4Lfi7v+7/ovD7fCEQdlSB20PiRyTX7Sf57d6RLKaMyP6qkkCOjALnMLAAy6KaJWZnBXZTqhBs0vcXK60VEUT0ki+rnn8Dow30c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768911231; c=relaxed/simple;
	bh=beDlJQKb1YVfbNXGYsZ36u/MhHtIwvqdzNqeKG6RDqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RZMLeL36V2QIZfHNJ86UaEOuiUeaTQs37qcGz4Q4UgczXPKrqAEAOYG8ytTJQZ9wkveZod3E4desourn042MV3o70o7QVBR0wzjp7jCL5LS7o90P5pTzBVoKfFrMzRfasWWr/MhY2gFn6aDcCEI0XkmK0W7qvGsl/CCKP8u7mWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LgIGSvU8; arc=pass smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4042f55de3aso4031168fac.1
        for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 04:13:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768911228; cv=none;
        d=google.com; s=arc-20240605;
        b=H4toMvrbqnSidCNn0IAIzCLcibU9kNI6GvXK7SdTokjn35LdHG2fCysNjGkdUgxTdA
         ap08bpZSO5EZH+4hYh++wEBWJY75fEBWc/9T+OnfrKIFgcXR+7n9Isl6X2YaxdljBJ4p
         Mot963MeTfxhgKpgn06FSXZ3regTjnsaJbAw84u83fdXX80kcj+v1xGhvF7E2hx6W8aY
         KBbL7v9eb0Uk1ryZ0Djw0YhCOUa08k6O2gRmUiC6mWQp/apqStVbB7c+udcXbG18GyZy
         LIsrbRSz1fQcDqVczKvTohDDs+k2PN2GPAw3fDJySDwZHG0eRZi4Tnr3zTobbA7yxzZH
         dFUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZaHS89UTJglYV82JPW0gI9vr2H6xZhU9IjhBzukkP1s=;
        fh=geCONx3jYnZ4OaNeMc/Sejl8zOHYByqDgeiqtNW1+mA=;
        b=R6SRGK1aNdqMilQYttc96ih1+gmUtiHGebZehkPWzc6ZacrWE6V/wwoZkUyLHw7bFw
         D63RQiKtfV1INhoVA+g//vFAZHRAXXefmEyxOIaF+ttMeDbiyeJxXtCOogW6R4gVkwOS
         PTZi0BJKTC/xbYtfUhWjG1YKg6Gz+2DyomZ6QGB6Qe/Jpz+q7eV5Q5L49Bu6T5Y5RD85
         s8V4lYnFHHdTDoEteMetteHqGlsAy76IRVeAiNLpzLstKyyimpT2zNwOmI7LFN+A5oZz
         ms5UCRrSuxIZNqu+siJU0GlFa8n7tBVz46nBQpMyT35Vfwj9EFj8kKZ+q368vxkuqdy/
         6mHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768911228; x=1769516028; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZaHS89UTJglYV82JPW0gI9vr2H6xZhU9IjhBzukkP1s=;
        b=LgIGSvU8cGdH9bYLA2/5/qoM7Wf98NE0tOJ/OvFoztcVNprFmpfuMjznV5MsvT3YJh
         Cfl+N0zSVciCHZUBonzzXzHerJrvB11IVz+HOOLVt0pXLMDUXIfJWAqgiZn4Wy0OgCgO
         wOgMOZX4WrB1h9BdleSLIXjGNeUKyFeyQbI2bR+uK3n6NA9bmou4LQvSW0W/hAeDVQU+
         dU6R0HYO18CDKoRVQ1EKTmfqVaGrVhUM5x6sIBFe4xQ9a3y4fuQilzxRJt4PN8Ur3eCM
         G+Z6fDApst4luBSX8fbVucfEeADiVKBMKMhNmDGa0yjey3T7c6f3rmTsYJ0jfWyyM6BY
         aVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768911228; x=1769516028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZaHS89UTJglYV82JPW0gI9vr2H6xZhU9IjhBzukkP1s=;
        b=OeCgXMjipKfsJGL8zb5f09VDS/jALJJUPvn3eeRuw2tBzpmBMKw5s3rcyPC2PMLGPK
         EWF3XQ3BgFWHRSG76rndRW8dJS4BmJP0nN2DRVQhrzXeIGUO2+8+MVQ9CKZ5jnSnZp/8
         0MLaUaCOGo8v2eY37Bme4yft0ZE3ERxmlGa512UpC/IBaAn3vYaBbYKVE5TOAdYxAD5t
         efig8nxU1mBr/Q2C2UNwK7xeR5YjDROf+A/zqD8mHsjd5XdELUI9/kShoG6KJdWbJqUD
         P2U6FPLEO+HVusCXWVvAne5OuxXdOGZ5/1ftHvrw7AWc5cqNKqRqI5UUToyzBO0Y3KXa
         cXCg==
X-Forwarded-Encrypted: i=1; AJvYcCXDN3ftaoaneCJoqySUU7D4tuxU0KzpEoPlpoRPxZtIgFj9559BodAlEUogBxpNqt2nTJIblPl6z7ZmZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxW+Br1Ta64DmFcDbsBdl1bN4en2SBP3b8eRJ1AtrkKQX/s87r6
	zNEWm9V1oXC9to9BfY+lq86DpMQZ+F0f4OayinlEsmdEshP8P6S9+bh4RLbwfpC7VzbYtbBemoM
	dhCrlidmMaaQY1MWgHj4bsUt6t3JYTCU=
X-Gm-Gg: AZuq6aLEwtE/B5mupT7eoejR/1C1b4ZG4Nn34Bof8MeCah9fo1XrsjAGrKkYqg/SYfC
	FFwuqh7C70+sD9bFOTrweDEHy1+Tne1hm2YcDgMPkSm4wmF5+a2+nPZHya9xX+2unJv0SWG/dPZ
	CLccZKZwwhMP3lGV77bwvGqBrUVXddrVNNket7+M0waxEgiiJMd0DTrv9CfP8ipl+mtyeDU3EcL
	DTjq4+FnhMMezeMOLMkE/SWc7ZqgdUP4fxxpz4W7BtDAR2mr9hrjPV6KzVNWTHI3JYsZ7cQKNdk
	YcD8jvIIAwen1ZpJBHlmerqMsEDmCGC+znfc+bapvgZ3fRhkv2NuiGHLnCa4sw==
X-Received: by 2002:a05:6870:709b:b0:3ec:4d4a:e6fd with SMTP id
 586e51a60fabf-4044b3da7f9mr7136951fac.0.1768911228575; Tue, 20 Jan 2026
 04:13:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120104129.105079-1-hanguidong02@gmail.com>
In-Reply-To: <20260120104129.105079-1-hanguidong02@gmail.com>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Tue, 20 Jan 2026 20:13:37 +0800
X-Gm-Features: AZwV_QgOsymFEVZni41KtMXKauDtQdvBtP2VYNSTYOczwLqIWpG15UwSTeOZLd8
Message-ID: <CALbr=LaRymJY54fGc-90rCZ9YEbx_oaU4uk9YSe9vSYs1ERCXw@mail.gmail.com>
Subject: Re: [PATCH] media: dvb_demux: fix potential TOCTOU race conditions
To: mchehab@kernel.org
Cc: hverkuil+cisco@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-51115-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hanguidong02@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 371E05121D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 6:41=E2=80=AFPM Gui-Dong Han <hanguidong02@gmail.co=
m> wrote:
>
> The dvb_demux functions handle frontend connectivity without holding
> dvbdemux->mutex during checks, leading to TOCTOU race conditions. In
> dvbdmx_write(), a concurrent dvbdmx_disconnect_frontend() can set
> demux->frontend to NULL after the check, causing a potential NULL pointer
> dereference. In dvbdmx_connect_frontend(), a concurrent connection could
> set the frontend between the check and the lock. This allows the second
> caller to overwrite the existing frontend, leading to resource leaks.
> The dvb_demux module should use its own mutex to ensure thread safety
> for these internal state checks.
>
> Fix this by extending the lock scope. Move the frontend state checks
> inside the dvbdemux->mutex critical section to ensure the state remains
> stable during the operation.
>
> This possible bug was found by our experimental static analysis tool,
> which analyzes lock usage to detect TOCTOU issues.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
> ---
>  drivers/media/dvb-core/dvb_demux.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/dvb-core/dvb_demux.c b/drivers/media/dvb-core/=
dvb_demux.c
> index 290fc7961647..e9e833285f0f 100644
> --- a/drivers/media/dvb-core/dvb_demux.c
> +++ b/drivers/media/dvb-core/dvb_demux.c
> @@ -1147,15 +1147,18 @@ static int dvbdmx_write(struct dmx_demux *demux, =
const char __user *buf, size_t
>         struct dvb_demux *dvbdemux =3D (struct dvb_demux *)demux;
>         void *p;
>
> -       if ((!demux->frontend) || (demux->frontend->source !=3D DMX_MEMOR=
Y_FE))
> +       if (mutex_lock_interruptible(&dvbdemux->mutex))
> +               return -ERESTARTSYS;
> +
> +       if ((!demux->frontend) || (demux->frontend->source !=3D DMX_MEMOR=
Y_FE)) {

I have fixed the redundant parentheses issue reported by the Media CI
robot. I missed this earlier because I ran checkpatch without the
--strict option locally.

v2 has been sent.

Thanks.

