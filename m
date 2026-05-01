Return-Path: <linux-media+bounces-60161-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNiYOGn29GklGQIAu9opvQ
	(envelope-from <linux-media+bounces-60161-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 20:52:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9064AEF40
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 20:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C62B3015476
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 18:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368DA410D1F;
	Fri,  1 May 2026 18:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pr1G0MLF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514F33CBE7C
	for <linux-media@vger.kernel.org>; Fri,  1 May 2026 18:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777661531; cv=pass; b=LjonRhEYM9tR3vZgsyeMGnKJFKEti1CgRhfjdLAC0bB4XTXysqIJs75lHSS3c2uZXfy9Miow1T4ZY/9hX27HP9nN/jdAx7TR2imbaXd1ZARTHQIhUc7O0b/3uAbsLmFQx6rPrzjgUTK0JzyvXY6lQEQB5vC1S8ptYNCsDzBnPDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777661531; c=relaxed/simple;
	bh=3VIb4Pf0NAkkWRr1YIHvaBV90/pW2+lmTFPT/UOcM+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WvXBCmYlDnjDh8Ow9C1q7bmrZGS5G6w7WYQqCZm7s29eIB4MYeE0I8xO42mzxssTHnEISm7orZffiZdJV4QKztMrjm0yb+PcIFpnd0bVa7eQQ5dxbWYRF47I/LlHL+Bd8Ag4N+IBGst7xnhyDUFlwdnSBJi+jvD9BGOLxvGSaaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pr1G0MLF; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ba36357195bso280792266b.0
        for <linux-media@vger.kernel.org>; Fri, 01 May 2026 11:52:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777661529; cv=none;
        d=google.com; s=arc-20240605;
        b=UDLQNd/2Bblj20c1DMHPxR5sqA9icb32PA1SZ3PS7K528W8FVzzLNTDn7dxNkHdKC8
         Sc65OzmakOaS7q9oTfPEqK24BHilr00UOjNpORpyxLbvW5aTK1hh4ayVb75dln0q/Eya
         xgUILrgv/8zth3MKIIQkyYDqJTEGztizgsuKrc9f98eHWrgbg/D14mcRrw8tQ8BroYaZ
         hdAgb3s1/8EBSlqb0VbvTdLxu62TofTZZXQF52+NrttLxjKaQyeHXg6mloPqzNtMDk4C
         G6Iwg8cFhU7AiTdYq0Kdzx9Nmg4kaqY4z2OwhA/r0tXCLu1SwQmeus8bNGDY+dLOPRdF
         IBXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SUoP+m/IYi7RcPZ6iuZOVHJ/w4zAYIZg82II4m9RBjs=;
        fh=Iuflp3kqMay9Wd/werC0AhFSK2FylOZFcIJ8qqEVDV0=;
        b=cPdRTm1rx7961JauF5pHVkDfDhNmeyBI3jIYT25tLXk4SfvBPFhgQ5J8buw65Ftndd
         zkfkl6qwsMwM023noJhEqscOwiJP9XCUooI6Ddv9DQtYX+dfHkcgYcfVr75RYSFK+cMW
         9DGtF85X6/oCBiB2KoO+8P7UxK3zZjBCNpsMHP05rnQgL/ylhfiLUCI3sl1eSTJwDEiO
         /EKT0TtG5nvXy++eI/1HzOeocyEj1lWuD8LNhr6FRoilfbe3nMGhZJrZnDgvoocsRQkm
         ECsTwSHspvpY6Nd+WAnZfDkTmHnZX/6KwgbPkIb18v6r3Mm9TfM68HsB+2Xc4motSMoX
         Q4Jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777661529; x=1778266329; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUoP+m/IYi7RcPZ6iuZOVHJ/w4zAYIZg82II4m9RBjs=;
        b=pr1G0MLFmr4b/gAKTzD0AyupsnJO7xBufFXhHCqPLmC+Nn3IN4TKox1Dz+ZYz4hv36
         fVoApd5qTh3+opYUo03Bw5JEXvoMrFDBuhWfHO9VXhA9yp+8FQbB7C7GdKuzBZe6O4Ps
         2dhUr8G0gxnpKhf8FVkb4FVECsiMJLFZF5WDLyLB+552yqbtoLf8lIcC6KWud0y/iG0S
         wyx/zUt4AxZNuEpE4tjfbvhIc3JRIMNKxSxQHFumvf1DfKv+rkg5Wd4CcOTmHMQnt7SI
         T8rY/RvIl03drPznCrlznT7a+zfHpmZyXD/+6XwPVvoYTDXTKvBFQ7ZSdT1RalB58yAW
         fGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777661529; x=1778266329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SUoP+m/IYi7RcPZ6iuZOVHJ/w4zAYIZg82II4m9RBjs=;
        b=ZYvrmoNBlgEE06+OiOXy5pK84mw0rQgdSlsMWPkIs5QeKm39af+TkgvBSEJREkOg8s
         /gxtmKXVqVI72LJTbyNVBvet9NCeQ46znVH9o2MXJZj8w+cy+4hLgg48fqyiqIuPkByo
         s9PefSZbapgMYs/8fGtT2WpaXb2BkgPGiw+o9saH4VbGZ3yQzsya2GMePTN0KcdnZHvJ
         Spy0dnHAJjKECCbqENrD9adU+ZLfuAiGzt4UNMUY0EegW7PWjG4lKNJ9iSywpyI3n+sT
         a6QtPJHguTe8BKiEQPDrIR10dOLCd0xKP79w0BUC202onwvlzWj+DScc2djDnbIAc8hs
         WKpg==
X-Forwarded-Encrypted: i=1; AFNElJ9fV1PiQuk0nFkfoJGXf59NCN24dmLJ+e0soivPWIWqysgX2x063fUPeug+I49G0WmJ2cxjOCgCHENeCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEesHps82h4Luj2z+FQB2DSTT4UnLdw8D42F1oYFlBm2rMWVdU
	PppOeZ5SMJBOJXGw5cvg8b3dCHuWpJiSMbl1+98ZNK67UHknkXU88Sr3Jixa8TsFAx1m8A0ZQPZ
	gQiKF42X0kyJBYL8EDmP6VOUxioleuxw=
X-Gm-Gg: AeBDietm1xHlC1aiIq2RZf/1S+TVbDdUZRLkihZC2AcvD2nbS0gMMsS8OkiYsl4wVX3
	2IGoXpBZZHYBSi/41MLQ+tIqxFJkzMsQi64oO9LmY9JE49rXGjQrglU7qZuNJasPwceCvXhS4K1
	U6g2tJxwkI7YfiH/XoBLYlI5/CgSg2TzD0Wwv0sl9LxjHKJXmmkWh6V+YglYWbiwh/iONpg2u79
	xsj5c/PT0TP3nBrWcqnSCqegZ3XzKUfiWYaitiMcT5UTyPUpkBHLrShfVr8bm6oyeiCyNypphZC
	7dN0zxosQl2BaQ7NeusXlOuIYpdLAcMnU+3d/OFKspWmbX3yUOg5YjUpFDNuExXp79OxsuKfhMk
	f8XTrFBFC58zh/CXdEg==
X-Received: by 2002:a17:907:c0a:b0:bab:f5c7:23ca with SMTP id
 a640c23a62f3a-bbffd9c998amr12816266b.38.1777661528535; Fri, 01 May 2026
 11:52:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260501170802.554963-1-ansh.bagga.linux@gmail.com>
In-Reply-To: <20260501170802.554963-1-ansh.bagga.linux@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 1 May 2026 21:51:32 +0300
X-Gm-Features: AVHnY4IeP4wRWGdM6MdAS6gK_dVXnOJLSf1QB_ljovXpfgedZLB4-6OLCIE0ihI
Message-ID: <CAHp75VeJHWMMQKPEiBsNt1afYms155mFDuBt_2PjUAEWNvAByw@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: fix block comment formatting
To: Ansh Bagga <ansh.bagga.linux@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4B9064AEF40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60161-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Fri, May 1, 2026 at 8:08=E2=80=AFPM Ansh Bagga <ansh.bagga.linux@gmail.c=
om> wrote:
>
> Fix checkpatch warnings regarding block comment alignment.
> Block comments should use a trailing '*/' on a separate line to
> adhere to the kernel coding style guidelines.



...

> +       /*
> +        * We must free all buffers because they no longer match
> +        * the grid size.
> +        */

The style of this one is correct, the rest are wrong.
Better if you spend your time on doing real patches.


--=20
With Best Regards,
Andy Shevchenko

