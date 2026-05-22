Return-Path: <linux-media+bounces-62575-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FB+FhcuEGrIUgYAu9opvQ
	(envelope-from <linux-media+bounces-62575-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 12:21:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F265B1F46
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 12:21:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF7AB307E2B7
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 10:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E283C9883;
	Fri, 22 May 2026 10:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="H30lvI/6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874553C6608
	for <linux-media@vger.kernel.org>; Fri, 22 May 2026 10:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444863; cv=pass; b=kOrJzssbSpWG9jXKc47TChhaFZf0mp2vxSNSb8IorieQ57oTaRI95UfwQ9G8giqGt93qmoAW5BCM597gLoctVA7w16CiYwvixtPFqoDTBicPUB79kFDAEnyxO76gbquqsd1ET85o9zxnJo7Y1ZNnYvK/98ggg0ExsTHi8FCrjdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444863; c=relaxed/simple;
	bh=Eeld0pkDW8KpjswI31r2WmgMhd7TFs/6tvhRhL688XA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oaGCO/3nUaIqotoyHTRmqAnHOboq4d6neWbWdgHSxrS48pUrRao4Ahb9es5XjeiM9kx5Jbgv+ZefdQPkODtvyqgqTDcgo5oft+duTwIzJicP0BZzikhw2+TU5enEH9PL1j2Bx1hdaao2ZxU2bdei8neTRO56TsrALJWc3ncUmN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=H30lvI/6; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7cff695e6b1so40560107b3.0
        for <linux-media@vger.kernel.org>; Fri, 22 May 2026 03:14:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779444860; cv=none;
        d=google.com; s=arc-20240605;
        b=FAb6ndFxMA/Y5lAHtOqKj7oQacZPKgEWahPcj/7O7xNvcPjmDsNKnZs1qoOlgAlvL8
         Wz35AIySm+9des9LrZ3GBps/Iix+LDULEjYSJrCehRj25q3SxCfN+JbS98e2YgxbrIaS
         qcQF6ZcmqhYtYt6hymMAhtxDfEt3S/vGYwoJpirSHCeZwsmFYuKSn3cGkhsWKHXIRbin
         KZTuXYTEWEnUd0Z/FS5s3BksVnjORceWPXCbkblz53Ekqax9Z4SzTvloOU5ke9J4F2Xj
         kyaXier+Z+6Uyo/kGi/YFZu78an2aWl+1xlQ15ASHobD2unT/bi+IS5s49Ux5LNDxq/P
         iXng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ISAg9Ds4B98LuZFnY3KHAcg5cDgsZo8MNu8157jR7xY=;
        fh=+BaWfqKtTHoEkkHyNQYC/HR4SyDNmlCicqWoC4Ru91o=;
        b=ZlWANaLIMwE+2TE4A+DUHSeJ0RTU73XuASzUkCrnShq9WtzYqAqc496Hpz9JJct4EV
         aWmo0DdICboAwPiCb28hzxwNoZ2DOmM5Mhv/FmU4y34ISLDys8Sr7+5Gh4AbOZN8dX1Y
         QASvfNNYh5s67PN6BzofCbSUUmndL889sf6z8seJSUbFznhYPqCGSWq/LnvXRTZWw5vM
         +Lq1K1QrxddpC/+l7wv0vzriyEU/WnA6gLSuqnHDciGwi5bmazczGufyEwMvzXIagnN6
         QyfbCNK9TZBLu9p18SdwbHo6ozKoLo3/eU5kjXgnS6jIcUHFZBiQe+uSXVldgOHPe9uj
         bzKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1779444860; x=1780049660; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ISAg9Ds4B98LuZFnY3KHAcg5cDgsZo8MNu8157jR7xY=;
        b=H30lvI/6BJHRxLbV6x45VX6aqYcgBl/D0YhxDjBrz0W9oSdggHyhvfmFBpFF9lD87D
         i0daG3301BWQtcMRauMZsmEyeaBdna/r1PCVxZLZEvLjwpKzm/0n0gogqOKYqcFGxHhx
         Wvcj4ctKDxLxPfmcCspgClNH/m7SgUqbsdJB54wcReLb+l0TQbVNL2vPwsA/KVWCd6cT
         Qlr2trD8+Ked3njYI44bnm4JswyNC4gWeFmoV3pEEColz2nrhzY4WEaMo46YwLTymO2l
         X8dh2eI3fFaztc4zOKw7D9vE93uva0ZLOt/4pUFSahrN4wfifDbHVXjPhhRCepfra+oI
         mm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444860; x=1780049660;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISAg9Ds4B98LuZFnY3KHAcg5cDgsZo8MNu8157jR7xY=;
        b=But8Y/gMQgxQGiRLvqEaxcWWW4AS3P2TiaZT8S9CIglnMwZbNhKNuBOmjFXUQZUuIB
         nexzvUxbN4188hB05QqEXtegZgLEvCoRd+nkBl0bFobz6acjFek1M+QohGtlmCgrMhhI
         45WAZaeo9b40S5qT6HArOyVc46kSDe3mSqZJcGu92SwLmWMXHFep1mWYnCQ3JQr6TONV
         s5jVaONqyD69je7Zm76v2TnCSqAQDRyDQdIbns/o0N+sWaRuZpGWe0WbyHbB4KErLqjK
         Dp7WtduzRPHCkXvy9LQoP81au6HMhSZI8GIx+mv5kitAt8QvLzsWEhIIQ4DhJ1KEJKUu
         22Ng==
X-Forwarded-Encrypted: i=1; AFNElJ/GsqFMBxkn8Hv8zi6yTOe9rEiEysAce0iRnn3dzxIVQfTFevvtdvTshM66NbQBhQKazHQwEv/ArDJAgA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3IrG7d/pN2kb1eOdw6a/kACzAcLEmFmmF2+Nnqb7m2POyB6x4
	6SLz8aUDE9yFcm7fshCO6MYB2ZTFpjcny4j4MBy/bU4nb8wGpzrzo+kNMEepg/rHrbjT9DPaE+Y
	BYv4awF5AFqkq0GgpLamdH6CRyF+9LxPR8nuVmXAdOA==
X-Gm-Gg: Acq92OEtBYLEVpAqqbWHTbp4dPxHsvizJrwJ9XryCxuyOPhTPYLOCrOYQxC0U1JhBN8
	AEhkrqKwqfBO9r7lAQiyNvvtRprECT50aOZjjLgF37aQxhAra3+6gpjKkrMPORlZPz2jShWYclT
	0ej8/7vDDYHSYQzdPCRdR1lDFKcZJwnndH6CxctVRJ3hrd4lVRgHB+NeNylrejvSSAp5ESb+kuo
	3C58lA35ZIqN6N834yFvwkwgj4xYvYPm/l+DxGuw+mMOAeHIHxljQ71cj0PlKa5Qv7oJ8KTKVKV
	q0t1yRR/R939x4NtxgmatXfJ7MNyGPCT3thybQkhaO1sya3s69KjeouLIRK/DHWjweWPcyj60/b
	a0v5WKAxR/xWa6Iy7+lzn468I
X-Received: by 2002:a05:690c:4483:b0:7bd:5cc4:1962 with SMTP id
 00721157ae682-7d33b03c490mr30276877b3.48.1779444860430; Fri, 22 May 2026
 03:14:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514193148.2357371-1-ingyujang25@korea.ac.kr>
In-Reply-To: <20260514193148.2357371-1-ingyujang25@korea.ac.kr>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 22 May 2026 11:14:04 +0100
X-Gm-Features: AVHnY4IeLXy9JqzoNas2NyKvVLWqLa2ctNUPTJGytHN4uTeTbLrA8_-wW-eJnfM
Message-ID: <CAPY8ntBGJo9yGku5LVLyR=o9iF16jshfFa-uCFj7Qk8oTeMnLw@mail.gmail.com>
Subject: Re: [PATCH] media: rp1-cfe: Use IS_ERR() check for media_entity_remote_source_pad_unique()
To: Ingyu Jang <ingyujang25@korea.ac.kr>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[raspberrypi.com:server fail,mail.gmail.com:server fail,tor.lore.kernel.org:server fail,korea.ac.kr:server fail];
	TAGGED_FROM(0.00)[bounces-62575-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,raspberrypi.com:email,raspberrypi.com:dkim,korea.ac.kr:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C5F265B1F46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 14 May 2026 at 20:32, Ingyu Jang <ingyujang25@korea.ac.kr> wrote:
>
> * Spam *
> media_entity_remote_source_pad_unique() returns either a valid struct
> media_pad pointer or an error pointer (ERR_PTR(-ENOTUNIQ) or
> ERR_PTR(-ENOLINK)); it never returns NULL. The current NULL check
> therefore never triggers, and the "pad not connected" error path is
> unreachable.
>
> Replace the NULL check with an IS_ERR() check so the validation
> actually detects malformed media graphs.
>
> Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> index 8375ed3e97b9f..91e9fa0341e06 100644
> --- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> +++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> @@ -1779,7 +1779,7 @@ static int cfe_video_link_validate(struct media_link *link)
>                 link->source->entity->name, link->source->index,
>                 link->sink->entity->name, link->sink->index);
>
> -       if (!media_entity_remote_source_pad_unique(link->sink->entity)) {
> +       if (IS_ERR(media_entity_remote_source_pad_unique(link->sink->entity))) {
>                 cfe_err(cfe, "video node %s pad not connected\n", vd->name);
>                 return -ENOTCONN;
>         }
> --
> 2.34.1
>
>

