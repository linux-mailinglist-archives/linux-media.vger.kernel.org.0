Return-Path: <linux-media+bounces-56515-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wP99Omg2vWkN7wIAu9opvQ
	(envelope-from <linux-media+bounces-56515-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 12:58:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A05A2D9DD8
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 12:58:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F4C03062217
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 11:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BBFD3AA509;
	Fri, 20 Mar 2026 11:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BkzMu99K"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225F338F658
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 11:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774007905; cv=pass; b=ipuAj1Z17Q3+GP4Zj3eOQ6pbhsEE2mHBLqZmEE4jfxHhav1B0bsWuQiA+TZ7UIz+Zfu8hSwgx5jU9kxFOhi6KcZht9XXst+BUikxuxx4ALvn6JjlLYIUd4xJucaAFPnwaLwTxENrrl+v82Ed9IHbTcby77GKKQDbK6HfDHXlBwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774007905; c=relaxed/simple;
	bh=ztq0XN4yhJhZ+H+SUKom44LN5xT6zJrtq7WhpYvj3oM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nx3bYeEzNIcrXqZ8GFyDDUWlGEouS2gctaBFH33sSZRM2Gm2aYVM0KfRp6KUMGImKBe2vQGO3Xj8CbZBU60QQGkGZACL3/GfHPQw/aoVMEYZvYXWxYqMhdDv7QL3oWN4lgTUP3r3RFvvRGzkFPB9MJPf0ryUID1MIDgSmInGbPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BkzMu99K; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9831ed36d4so80572266b.3
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 04:58:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774007901; cv=none;
        d=google.com; s=arc-20240605;
        b=ZCj62mLsoUJtqrU4gpcLa3efyalnNTrEW21dRP1k7RaPvcpPrzLZTmUTgx9i1GGihx
         XQDFaP+/HYdY3KJ+8uailxoiJwlIk9e9zQ5ye4SXh98qMbOsR/8po/O4f8EsrnYLn8Nj
         N6k2cFJMqKR/N0d7xb+Tl7hAGIH0P3+AhMepOU0vi8M9c82B72O7p86GCB93S6WgSPbP
         yRRSkmKUb3BOzYi78hTxDbIw08JoJwEXK69x1lq3m7Zuu1pb2AA6Vln1XS//6NQN0ke1
         4sV9aHJZ90CQw0VCWd8Wkp+vM3+qlJoOGxIdXsTx9Z/ZKFoJjLt7HLP6uCH2bwadjIzA
         KTRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N5eNfxooG1gP7hO3DBkITDlnLkQZIW9n5lE1qr674V4=;
        fh=/6QHFAOO+KchMSnvk2LiW6c/+dYNg0FFiVTrEahRhOg=;
        b=atxsBit3DxdJYSt7thyt9FNAIiwUuktoUIlRhYwyhqbkea5xgNq1bR2W7KPUgoUzHi
         sp0ToUOZI4XXwI4hQvICekBnpK+Sn2vfkWIREHExJ8YdWDsuDuacSyEEUD8xUrmXmnC1
         +bxfiW9vOGT9lGM4oqnb/UXhc8/K4488Y+8iPbZrbyMSEf7/pQutHsvFpFePc44AUJEX
         HVtn9SXgtW6p+avqikcNUCiPyIvz0xct7pPcYFCSipSsaw2kYvzW4Ha8yv3bTI2RiEuO
         I1ZdbbWlqbNJWyOchgaHLo9KRnkCftaRRpKepJb/uyKq93j6xlqvaYwxNNx/91w5aVid
         0HXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774007901; x=1774612701; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5eNfxooG1gP7hO3DBkITDlnLkQZIW9n5lE1qr674V4=;
        b=BkzMu99KzdnGQJAXCGjuv4jHiuFBBxizQjqlNc2E8gAFx+W0OmFKk3GCKjcscZWGMf
         AEAwfSp4j3yP80RMURiWvn8wcwC271mMntU+a382nqZnhKSQ2xjfkw5fx0Ap7H+LEwsS
         /EDMrZv8XRVtTYy4vr+wgB0fL2HohUGv13HIe8HRPUb+mJG2LbW2zTTZijPG9CUEddj+
         xmXmvCKFWK8LX55viFgmpfh1QZoA9XiZdTLu7HlEHa3pGT5U+jG7sEsGgDvtj17A5Dm9
         8UJZaZYI01VdkQ5zZs9l5syPpIwT/mXn+ndEfIvFIIUb+CzDoPZNkpwcD4Odv18pVPfX
         RzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774007901; x=1774612701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N5eNfxooG1gP7hO3DBkITDlnLkQZIW9n5lE1qr674V4=;
        b=ZJIJpEOxZKYL0qE/68EUEEynO698ANdRzbsTPc4umecadLgJbjfqf0n9k1ZVZEZVwp
         31pEBEpNbnX52PlipVdrO+7lWZ/Nw1TxT6QRMpKnXZltWPBRQqFJeX+ag94xGyLogPhv
         KFbdTZ30GB+wjvOePOBPhoU99WQSzKrx0kM8KyBuTPnCnikMpCmSIOJW8GIVlXWI7p1x
         UC2LVARF3/OiyO1p5W2a2srRpRm2umFiZYZEhhMwZtMURA33rn8gZ5Agyl55jt0ZOxfr
         wL4zyWKrYyhqgFRitCbXZb2uZmJ+IiFFdRbd4vOydipSKWwRVTePnVVk0qyZGKtBMvXv
         UCSg==
X-Forwarded-Encrypted: i=1; AJvYcCX7jN8Nqs7T/SaKxEg6D3je2oCdAbmRQLM3yjPJVztHc3sCRbpFefBLiD0HX+fq71DOJMwIiL224xh+Iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ5U5ohb3712mipLFe4iZysXGa4bC8qkkq+AWoyiekJLsgObBs
	b5mB4RP2tWqm1R6ntiyOsBZoajszzMsPwOU/gKg0HY+KM+33Pninhialw3ZfsGaBMEraEHac+sb
	FXtfjYTAJ8K5feuYQ4G+xWr1TIlzTEoB+qX3q
X-Gm-Gg: ATEYQzwDGVmz0cj9qc5gOR6XpC5n6zJmLOMFQp6cCH5ozOVg96aNeHxxKChUf2dXz1A
	ngowMu2gdVoyCu/308qAqnpiYt+ETbbZvOUcYb58b/f2zT6a0B887RRj4pyN9aMusidpUXxuxrr
	oKsNHh3JQF3/P3eKbGSFIieygDhJ8FfAnoEHE5/zoA2yyq+xwXav7AZMifhcPTQqO6H2U7r6H31
	RNtMxp3XwoG/R/cuqnAoR7x1Htz2KGjn/q37B1p3rqQvsAFK6uJ+jnGag/9Fgkq3G9Se9Tj7ggd
	njrbsg7xW+IYQsYzeIKRNKD9Bjw8MYW3SihL+rWzRZOe7Q12xn5lc4rkD916gYq+F3R88sw+PBH
	j7906qBs=
X-Received: by 2002:a17:906:f28c:b0:b8f:e98b:4952 with SMTP id
 a640c23a62f3a-b982f33ebe2mr151584766b.41.1774007901031; Fri, 20 Mar 2026
 04:58:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ab0UvRdDpvZBiNsC@spark.kcore.it>
In-Reply-To: <ab0UvRdDpvZBiNsC@spark.kcore.it>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 20 Mar 2026 13:57:44 +0200
X-Gm-Features: AaiRm52eDeLeXxl9ybPEeVXHCO5iKWVekdEX97JVBSSAnhft2AarkDF1CXLc8b0
Message-ID: <CAHp75VeiNd2Ptj9aoZcmSO-c+-RQG-R7kxpzyk3edKU2Ur05Gg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: int3472: Add GPIO type 0x02 (strobe) mapping
To: Marco Nenciarini <mnencia@kcore.it>
Cc: platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org, 
	hao.yao@intel.com, hdegoede@redhat.com, sakari.ailus@linux.intel.com, 
	andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-56515-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.933];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,launchpad.net:url]
X-Rspamd-Queue-Id: 9A05A2D9DD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 11:35=E2=80=AFAM Marco Nenciarini <mnencia@kcore.it=
> wrote:

You sent three emails without versioning (no new versions) and no
changelog. Please, slow down with that, it's quite confusing. The
recommended period between two sequential versions is 24h+. Also see
more comments below.

> Some ACPI tables on Intel Meteor Lake and Arrow Lake platforms define
> GPIO resources with type 0x02 for INT3472 camera sensor power control.
> This type is not currently handled, causing a "GPIO type 0x02 unknown;
> the sensor may not work" warning and preventing proper sensor power
> sequencing.
>
> Map GPIO type 0x02 (strobe) to the privacy LED handler, matching the
> approach used for similar illumination-related GPIOs. This is consistent
> with the original proposal by Hao Yao [1].
>
> Tested on a Dell Pro Max 16 Premium (Arrow Lake-H) with OmniVision
> OV08F4 sensor connected via Intel IPU6 and Synaptics SVP7500 USBIO
> bridge. With this patch applied, the int3472-discrete driver no longer
> warns about unknown GPIO type 0x02, and the sensor probes successfully.

> [1] https://lore.kernel.org/all/20231007021309.9332-1-hao.yao@intel.com/

This should be a Link tag in a form

Link: ...$URL... [1]

> Link: https://bugs.debian.org/1130114
> Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2138991

These are basically should be Closes: tags

...

> Cc: Hao Yao <hao.yao@intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Andy Shevchenko <andy@kernel.org>

These Cc's are better to be after the '---' line below. The Git
tooling will recognize them and use them in email as intended.

> Signed-off-by: Marco Nenciarini <mnencia@kcore.it>

...

> +       case INT3472_GPIO_TYPE_STROBE:
>         case INT3472_GPIO_TYPE_PRIVACY_LED:

Hmm... But strobe is usually used for LED flash... We probably need
Sakari and/or other Intel camera guys to elaborate on this.

>                 *con_id =3D "privacy-led";
>                 *gpio_flags =3D GPIO_ACTIVE_HIGH;

...

> +               case INT3472_GPIO_TYPE_STROBE:
>                 case INT3472_GPIO_TYPE_PRIVACY_LED:
>                         ret =3D skl_int3472_register_pled(int3472, gpio);

Ditto.

--=20
With Best Regards,
Andy Shevchenko

