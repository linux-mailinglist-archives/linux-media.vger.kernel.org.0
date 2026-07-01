Return-Path: <linux-media+bounces-66167-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +B5rHNjQRGpM1QoAu9opvQ
	(envelope-from <linux-media+bounces-66167-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 10:33:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CCA6EB22A
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 10:33:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=eXRNBGrr;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66167-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66167-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A743B30FF1E5
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 08:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E756F3E1D04;
	Wed,  1 Jul 2026 08:29:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1673C3B3BE6
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 08:29:35 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782894577; cv=pass; b=MasOrO3pmdG2CVJsKM9IUAjL4Su3kmmToYMH/r3dF5OvvY1boLqLnkbBguGFPqO1ZspNA/DuO5SixImTaa01o3dCqUdWiRsqtIYbg+esvdIo/UPfzAq+jJU2ahfVDnV13AuKS1Q6HZCUiDgzUWyzvzsEtW6i4Mzc3tGPMCxGwA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782894577; c=relaxed/simple;
	bh=v0ge2enVTO4PtD1q3C7O0/Qa3X2JGLKSit/PciO0YDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oQKfojo/DCbayQTScUANPKfLFD4RWO707VXQ9JmH93boHaesQJi3DJ3npyVfs1246dt53ovZEZ85w5jqvNQ0zMqU5R6CphbQx49Xc4b33vFD9chHcXGTxFCzk6Nqbtq50xPSX90lqyNF3Mdl+qZUE2Fe5CZEz0vA3kwu2N6zTak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXRNBGrr; arc=pass smtp.client-ip=209.85.208.49
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6986287534eso630603a12.3
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2026 01:29:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782894574; cv=none;
        d=google.com; s=arc-20260327;
        b=lX77cBOrveT74ky0xxem7UvvR7cNW3bK3j4QM36Ue+Lhl35RbPL4BiDwFXfnPom+Bb
         i6jcFLr1S7RQpUgwDsZrcG5j8dCAExHoikIbgXsDj+uhBq32dOgMkz2JgjnaF9VVNACx
         E4j7xrJ9oOqxSVTLsO4M2udztVehJff51N6digTTmHrW4Zk2s8edzPlurM9VvPPCnNZy
         kyXdSEtaYPDFTY2yfsbXuE8yRe7gyzajT9PbZzBvfH7bAhHbQDzwxumpK0x7VXLRvnCz
         LCav+Hp+fNRvkfnj0qORO79tnBm7WEgy4fLpCKtvyV6hoxiwtQo/O8QxwhTUziOkKFjA
         rQOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w1kzFzm7a5OLVUZPmI6GKCL2QcgSL9U+vEabt3WDIHI=;
        fh=pnSQFQ6745/8LhHT2TGpNoBxVJu7ArzjlylIrHkQEQk=;
        b=NHq+iIHUwG5i2obHLJJFZJJjuhpIGmmQMd4oOffg833Us4RcyTqJcKvPHppTChIagS
         m6hMRdM0ZoskZCJVLWuL5paBrKefN/TUjaTyCl7NnA9+0caa6kPPBdYMp/8SABQ4Zrfw
         XnLdXAPh2Zv1/vikuHrreVgAq0bdHlOVM3UHXO0xMK6Fa0X1uz9tFYvBeOEc+jDPDblG
         +10YJU3jKouxSHPxutfK9dfJMugWR/xDLoArLOlPaA8gAIWLkz1hZWyMteU7/c69yY3L
         QYCfXpIjPyWVW4UkHw3N6fDThljudhyhI7Q+fQDvh67b6W4mpUMIILywev84NcZMD2vY
         xGUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782894574; x=1783499374; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1kzFzm7a5OLVUZPmI6GKCL2QcgSL9U+vEabt3WDIHI=;
        b=eXRNBGrrxhhC1/0mIU3mxnEs3jxAKAmLEq6+IMKlry+G6gzSbnQcaOOHeZpcUN0efq
         Itw1/QXyWIAqCtNFn1/tH6YzPcN407LnH3Rc6owWmwfN1QP9OCMRB5AGQLUSpMHgA7ez
         AVcONfbj3W/+pywbMywMRXnBxO5FUGJsEu2r9Mw0Gd9eWGkGnh2Cl1CEtVVtuG0wNiiJ
         ZdZSp64gforJ3Y2W9rauujN9YtRKnBa/zaASEC277OTcofmZJbtWPaSRVSO6n7kIgqzz
         8CWbdT3r7Rn4vm3YCva2pJ2YYnEEVooykbcaN+iE5oJf3tsavyjX6fjXyXYiryTDWJMS
         HPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782894574; x=1783499374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w1kzFzm7a5OLVUZPmI6GKCL2QcgSL9U+vEabt3WDIHI=;
        b=pq/FnKmJzy+L2F87WwZecL/0twJlV6SuZIRmQAnWRuf+dZm3ASDVXD2OK9PWefAUhd
         eiFHkRx7ntLul2uzFhY6HnHk11bLcbt4EaIEhFG9Fp1Hp2O9gskvV8sWHf+ZnWr2XBTn
         MfquAjNJtActimuPj4vuq1lLrFvWbJ4ceiG8WmZk0gB8yEvmbqfBL+P9MoXLfO/tRNQr
         DJ0Ro9Nc8CsGazHOEnkWqUWY2gi4Cqbmf+yUeBiM6I6TIJTElbtGZc9KxcnmriHjTNwr
         jHw8GH/NWdS0XeUUdQ0qjH9+BEiDRCuAKDuAudE17/Voz4wenwCOT9Fuy/97sqOMG9Yo
         sx3A==
X-Forwarded-Encrypted: i=1; AHgh+RpUPIui+pVK19D3n8vIF0unnulosmI+QxjHzk81htKsrW50uW8XDnTAYa6YVTwXeZBDilYZE60owwfp7g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8yryci5P8XvthLi/SmTtn/pHlwUk4+xrku8JlNHRfEVw2rwe7
	DJ+iXmY0PwS5WLbh2IUIfWR508LQ/cpzQT20zgXvhohcQxtEBm0m5/evss+Wba3AmYlkboDmA88
	ysXYOMe0JZN98dfmqTL5F6N7eCuQ4Cbk=
X-Gm-Gg: AfdE7cnFJh7tMmRinuDsZw3m6pa3IvxdSdMLJDnXr+o4+JbLaZ3xvkPYJk1APZiQa0e
	J+4qcw2rj35pswm8uiJ5y9xiXzoDLbRySzm1jdCqprQ5VEZritMljxOGoH8pvgG7/KHpWrBudrQ
	sk/0yvwGHom8+9fxhsaG0JPjmE5OyKafcQNgvNWXTEuW805rFwolI4BJAkfH6b2+qWVFGYatFYv
	8aRdQm/hbwuv+d1M5w7nyn8+2B5LxGGyFEM/F5NUMitRQncRm/j/sz6QFPWrqbITXs7nbA9q49z
	XkScqRckkJs2on7WEjRHjOmeXY6Yc2PSmV4xqdt3tNKE+cwkUh6pYGPtdoRkRr/sTCflgSvNH0V
	/nHrC3KyktNvHhXI/UvOLOs25M65Cd80AJOEqjZcZXrtM9xeJciDw6OZTMLC929eRlkFI
X-Received: by 2002:a17:907:7204:b0:bc6:14b3:e835 with SMTP id
 a640c23a62f3a-c12aa141da9mr26026866b.32.1782894574176; Wed, 01 Jul 2026
 01:29:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630132631.25762-1-bohdandmarcus@gmail.com>
In-Reply-To: <20260630132631.25762-1-bohdandmarcus@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 1 Jul 2026 11:28:57 +0300
X-Gm-Features: AVVi8Cc7m53d9rpnwgtidA5UKQRV-TSkeKr2m8nhvUdgISSguI1EXtXJ-jq9qoo
Message-ID: <CAHp75Ve0c70aVSWh=6s4in=LBz5SqjS0PvMXdKSdCV_AS4sjoQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: atomisp: fix block comment formatting style
To: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:bohdandmarcus@gmail.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:andy@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-66167-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,checkpatch.pl:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8CCA6EB22A

On Tue, Jun 30, 2026 at 4:26=E2=80=AFPM Bohdan D. Marcus
<bohdandmarcus@gmail.com> wrote:
>
> Fix a block comment formatting warning reported by checkpatch.pl in atomi=
sp_cmd.c to conform to the Linux kernel coding style.

Wrap the commit message at ~72 characters per line.

...

> -                       /* If the grid info in the argument differs from =
the current
> -                       grid info, we tell the caller to reset the grid s=
ize and
> -                       try again. */
> +                                               /*
> +                                                * If the grid info in th=
e argument differs
> +                                                * from the current grid =
info, we tell the
> +                                                * caller to reset the gr=
id size and try
> +                                                * again.
> +                                                */

Indentation is broken AFAICS.

>                         return -EAGAIN;
>                 }

Also, is this the only single issue of a kind in the whole (almost
100kLoC) driver?!

--=20
With Best Regards,
Andy Shevchenko

