Return-Path: <linux-media+bounces-57881-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAEnEbAhzWlZaQYAu9opvQ
	(envelope-from <linux-media+bounces-57881-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 15:46:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFAF37B7E5
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 15:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4A8EA3092EFA
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 13:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0A8243E9F8;
	Wed,  1 Apr 2026 13:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WF+433oR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B2E43E4A4
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 13:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775050764; cv=pass; b=NVW87CU01hFkyCdOYjEeh42P1YIsehZ5IyEnZlQvPfTSH3vBFJwz08CZEajrmKdyVtUamZUhHvc7bp7nbubZesuVovejmpYlCtz1xB5suYmyskg+2986vQaqVVnU3Dgg32drLgdOGlRPMVVlQxHg8duGgbgbdKDN3oel6tr14AM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775050764; c=relaxed/simple;
	bh=uWpJc3DoCiKhq96Au0u/5kNy7bsjrlzy9/z7ywJOwcc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rCqcOag50hB+itP47OLoDT5euBezi6TYuwLq+2H7Q2jMxcGBZd4KUT3OfsOqbWelbvsOb7AShRREhce7k/w+4SYLRzDbTVSiWz6lwnfl2WxD3emLsM0GVSr+ZrXGayeRx7HVFfRodAomyygUqNw49EHH0NLt5gK6u5mRGRXHkKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WF+433oR; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9c1da7ac63so122525966b.0
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 06:39:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775050758; cv=none;
        d=google.com; s=arc-20240605;
        b=CSIeQe1HjiR3c8Gd7CWo42QZp0CKWkx8ltonLF6ztQqq2e23o5832mSIzJjpeKl0ES
         1+rpwmYw95ALxG9DmP63L70c8BYntC+wdp9ULWU+3lslA24PzDM7t0ltpfRsDXvOUXE5
         20wtcepU3s+/zF/YcYNDtZ38pi/ebg+ETV6LvpjQ3fS82a6sHMeidreab1QQOhPsss9T
         hFAgZYW7M9snl2hOeR2tqKZi9+bjDsl8tmeJaZzzlzkzP0D63sEbYteaUE9mYeUdOPKJ
         oBfXf2DdszEPfy/EZH3dRBu3LDtk1axT6nCxXk9F8JJs0w/8p6WR2g/lYX/cjm3rbpF/
         Y8fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uWpJc3DoCiKhq96Au0u/5kNy7bsjrlzy9/z7ywJOwcc=;
        fh=KT8ttm35rIqm/kas5oNmqTWjoXmz3ylu3s2yjJuQ3jQ=;
        b=dQzaYun5eHWI3JlQEXIRjOUwcb1aiLextK5cvH/nyvhYkMd1GIOHblpNl80LN8g4ht
         wCUb9Gm/N9FNH9NH1yUkp+HDy5IDeJWXyuobcvuMVqHDn+J+ceWk2sdlPidXSFMee1jg
         AC7TFxLb0suHsLIRlwmI1dYwGISp10Mf+T7k3Lfdal7oFeCxh9zf7V3ejwnGvBZf0pSX
         7JRt4VOGir3awdfrR5e8RnFPG8bJOFq8ohFqiAcpsBO/5Qfrg6vAZ8/Ozeg4IYFOKjcE
         QZ6veBx94qrUz3uuZsSX6jg9C+21PA6igxluGTMK4F3IgEEjG5HbCjn9GcYbVljGQiRx
         A+9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775050758; x=1775655558; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWpJc3DoCiKhq96Au0u/5kNy7bsjrlzy9/z7ywJOwcc=;
        b=WF+433oR89lcFZiA/8CIArBez8MvPyvbkpwmKBorCdibLBH7VtDGSsKZfP2oEk1Xsg
         CtoNio62rnE6IifFKksjKWDM/0Ye7qcjqJcxXiuKvuiqdwr0RrOPH9spUdU2HOZlPj/N
         fzda2cMro/T86INdoNyfhQ8Gnjw+uw1MlOIK0XNh28evV6W/vLN0SbBwCZE0XJl+RVKf
         Np5sXhDjdYGf8dGzQbCfxmfn5HHZAAIirZgAS7sFvnRo8tcNjIXgVPl+lz/Z0WsHIKMe
         2CRSGJhZbwRS4WxO/az1cYX3U8F4jzADP5wXNSKnf3NBeRwVAt4FoycHYBG5PmVH/VoH
         JvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775050758; x=1775655558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uWpJc3DoCiKhq96Au0u/5kNy7bsjrlzy9/z7ywJOwcc=;
        b=gk9BMLcOaU3RN4on7oMr7ERYv6sr1rF/eyAPpjtbkHG+u9lCCW8yV0qbt4cp9jFnU3
         t2m7cQlnCJ5G2SFlOM3PTNEpeZ6xWjyx1fZZ9fPVNxhVSeefN+xWgGqhepemEDEQMOic
         djqBRiXVC2lpcF5LjE5k4HPsLR7dsriIGek5jV1in8LeaYx1st58cmFfjjU6jrdUA3eu
         TjDj7jcIKz2FO2YcT+ig2zNe9ZcCA5hUQb0ote56p3AXh346IC3HNPi/AGbpR8Aas06M
         hTFFYtaS3PbbA5dOp0Z6pXowF3Fy9B9PFj95p0wRvD/Uw0neHRvxs0o+Y+Q91udTUYFS
         YqOA==
X-Forwarded-Encrypted: i=1; AJvYcCV1FIadq/mHPlhn5afNlUgQWEgao3lZeGFmz67hFfLm3JZAXrjLOiCeIZQVrxKay3GK18wWs0xE0DMSZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAexvP4inRnrK1YzG1OLRPCtvw1fbZKPuFYEKB9qqQgqPFWjVW
	MiaMCnezB02W5WsmOqdC6x5LY8WbqYs/dmkdXWmNNdHsbCsb6YweFI8EeWLbV/DWB0hC/Xsa/aW
	Xc2D/PCyqzG7/kMCsZwCCqXRwAfJpIAk=
X-Gm-Gg: ATEYQzwyFMidNBiuEQ1d2V68A2FmKM90OsBHu2rAmD1rdCCKML8TG5BFMTbKFWkAQEV
	zliNMV6sItrVgNY5J2a3o0m3b0PtaWlph2xq5fpzh2OiR1fSdWVffAwct4TtYnz7to6zxVRUsDs
	N5wqO7o2ISOAkwrbZyUvMmU3ho9j8QEzRH6NWtMaeMxNoWp2O7AVgBJ3lFm53Bj5RKj6NJjJFQd
	efReAx0DrsNer+wd+d2aF31yQnxS9pMwNeHjoH/L9pxHYdF60ea9a45lHNrG4DC5EVLq/abPr9K
	zrC1b+wrwBv09t4/DXjscf+4s7SsNRAO35vJkwGItaakP5WtthyFs2ou3LL7CpSRpn9hlwPSI8/
	UmmDKMpg=
X-Received: by 2002:a17:906:37d0:b0:b9c:12b0:2e38 with SMTP id
 a640c23a62f3a-b9c137b22aamr212189666b.1.1775050758164; Wed, 01 Apr 2026
 06:39:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331211649.421777-1-azpijr@gmail.com> <20260331211649.421777-2-azpijr@gmail.com>
In-Reply-To: <20260331211649.421777-2-azpijr@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 1 Apr 2026 16:38:39 +0300
X-Gm-Features: AQROBzDBsUH3ZdDFFl9nMBiY6AFN7MSIN0qgjmUa12sMUfeuiW5akm0BnTypkZs
Message-ID: <CAHp75VfBqpLFYbeZWRrHpFe=niek8-PLF1+oiN5XSvACQG0m6w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] staging: media: atomisp: gate ref and tnr frame
 config behind ISP enable flags
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: linux-staging@lists.linux.dev, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Alan Cox <alan@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-57881-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: DDFAF37B7E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 1, 2026 at 12:17=E2=80=AFAM Jose A. Perez de Azpillaga
<azpijr@gmail.com> wrote:
>
> The FIXME comment noted that delay_frames can be NULL for certain
> pipeline configurations, without knowing why. The reason is that when a
> binary does not enable ref_frame, delay frame allocation is
> intentionally skipped to save memory, leaving the pointers NULL by
> design.
>
> The ISP feature flags in binary->info->sp.enable accurately reflect
> which features are active for a given binary. Using enable.ref_frame and
> enable.tnr as the predicate for their respective configuration steps
> ensures the configuration path stays in sync with what was actually
> built into the pipeline.

This sounds legit and being thought through, thanks! Also the code looks be=
tter.
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

