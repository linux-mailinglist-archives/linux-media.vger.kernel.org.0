Return-Path: <linux-media+bounces-58627-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SM9rMbWZ3GkxUAkAu9opvQ
	(envelope-from <linux-media+bounces-58627-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 09:22:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 341E13E82A4
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 09:22:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFDFA302F275
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 07:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B76392C46;
	Mon, 13 Apr 2026 07:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oedfBN4u"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3323932CE
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 07:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776064898; cv=pass; b=uIQJ+9MkF5gzBPTW5Aq090/WTh2HWEK7O2+ISZFt8gLBMdjCQkF8JJZx8RUcRWKQWvb7yZNMgnKoMoewVW2JZ97c6VgcgrnfBnta2tWsKTWNTSoUlvaaxlXyTZRdUQPcxaGg8Bjg/ofmWQZzDWmpajnjiZAIHNzQjmzVbDg0W4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776064898; c=relaxed/simple;
	bh=BNT/yCTRSGXv333icB68ybeYVQGghggSusimWfvxYeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pz1jDWdJg0ZmGUo1D3AOuyjvAbSIqz8JON8v7bydnrSo2Mhbe9tMxV7ik7Edvv5bieE6vulsQrMtssdQMIgLc9Pbf5uIENfeADw2Oc9m/838Yzw9fLBcz78H9v83u+mzKXuWR4hooszHyxu8s0VhAzzMOJ/SHWyWQudT55xZLjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oedfBN4u; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b9c755b2cdeso631785766b.2
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 00:21:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776064895; cv=none;
        d=google.com; s=arc-20240605;
        b=S6Nsq4RmBUcLbz55WT18JJfBfdKElJTVhBVZ0J+PmU0JsDEewv1BZ8d1ZhtRPKKhbQ
         BeRJuodfivco1CNCOmg+l6l1HlpDiqMHlSVOR/zHN5HwN6y40gQeOsRPVe7ECLd+kAPI
         FVdoROjPVnHuQM5ezBovlJfhmJhzjapROtQUqoOjQwNyO9vl2VXs1MpzMY8UJyxqsMkY
         dHNc3SRFC//Chq8y9JT4AQUA7wbOXZbWlZhRComCYFrkXpHOlQjFRmZ/y3dEcOiTYE2C
         PfjbQ7+G1BYrkb++ILrJwx3Fp1J77ygamaXgtEZAm0LEu9WvpVqNzVface7Cf+zLByvO
         suxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nA2Xl+mnzaaZV8sYdVczI2AyzUchiW35XMXQbowZEH0=;
        fh=SlVJx+Z8VPpI68ZddZ8fIir8eVpHp9MzY98/CUP+YvM=;
        b=k//KLbxpDD9p841tamKFcjgKq041XXQX/XuuIbMdrkU3BDcJBNestcZ6uED6KUssaW
         zmuMr5LZa20eS6SvK8aBy3BHb+oFrD4PQ8yWBb7qexC0fYpBDq1PeZv0PoviBXQyAAV5
         QPn8hoYfoCgCt46fRhg8t+OGXZ9HJbU4vhMZG3J4kYLtUQZPCb3QhZJsDOyTH2zl6P14
         ag9iPiSi5plo9XVUyGGBT0MQgu6AI0cDcZsUU/Qw9ROO8Cc0OVL9wHcPWGHHPtZyRVrf
         0k5apkWPM59NQ5wuvkjkDnK+dQE35fOp4KtxW6A+glY8FHL0zL3LYcp9k9TcOdmiPdxv
         5XLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776064895; x=1776669695; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nA2Xl+mnzaaZV8sYdVczI2AyzUchiW35XMXQbowZEH0=;
        b=oedfBN4unY1bWkvTjT3V2bcBqt6YjpN3PlTdHTQHyMpw7DNxbHnLLs0TUcgqcXbRQp
         bEAhITtxmEWoClNCbI8weWS9w+5AsB6PbUnWscsUfunt1LAiJDTAEcPUiEW41Gz85zpb
         CFi1+lLxnHqp5IJuoVfyqSsjguhvB9xarnvRmR7pJMwVy8KXpkq53aHvaonOMSfQ89l3
         gWKZiiE9kq6nefgbexYDvX/+E23VxFbyXaRHwTphA9NjfFqbokmFI5azCxci28QvZKTb
         zHx06dYiZFi8o2vrB10yQU6BnKfmqDq7r9KmjLLkf20TNg8fe7WjR75cTbtQ1kxbKjEG
         jxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776064895; x=1776669695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nA2Xl+mnzaaZV8sYdVczI2AyzUchiW35XMXQbowZEH0=;
        b=mfnGTlEukS3cN07R4UTj6paR09aKTMNAm2+0eHON29npkmlOF5BYgiKWJpPLmyHfKO
         hViT04qPbq9DpkqYaH0f6Rku9CUNRq7MsJmNNtfr0ij1YOA4jT0GQQ+STVeaZ12EL+2d
         VgFW8jv03P/7GwLj/Tycjgnn2NYtuOin0GTqejyLoFg/oE2+5kFF5OQeSXEhItIKAYNE
         2d41xRY8pKhrSN52mFJ+vtwG0xEGSM649Ix6Us06x3ZUgdBSThyoB5xXDqRApFoqHxYY
         rseiVcSQjeQz0pZuJelWkNF4htZQotpcupHW+bsHwPi7xffBoY+/LzbjTlAwYPup5ajJ
         AoPA==
X-Forwarded-Encrypted: i=1; AFNElJ9ZAGWgOkpRPcKwYQW9PFYU/o41v8hjkpRuR73GzRxJJY8Ae5bPzguHGaigpP4u73qW0GsXRLpCdPsSAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4aOycrYnz6plxPqLO8ztrHfflB6TO63GXZNUzlM1aw06AJ4Jv
	YdsjzPrbEHTeNQDOvbLrwu8t6bRz88/7+sSo/y6Sfy42qR91y0QyhVrTXxqA2F0Fbf9xze2tBvd
	0Z28K49RvengzkTi1wWGeDYSsugjQvcQ=
X-Gm-Gg: AeBDievRjRpdmj77DGpNXMhG2DP1B2VlAIuWuNdJivNxo9lBd66TmJR6/R3fhuDuxGi
	X5Zcvs2I+PA1spg63S53uK8qBkHkSQ+/8as1snLXBJQS4Ld7RpdoGsX5iV5JjdzFerB49tHsJIv
	kf/ALQ8c9MOt7Syk9R5O9PV7sHAylPod904ef7D389mzvVKatWbwBSKX/WokeLGjuSe5ED310WG
	0yZwIPnLWYmYYYeUFUt1KtvgGfgXLFbz6kb+XC1lbnAs0OxiQ1jQuVlDjcyGyZ7UrwQGOzSbypR
	vHCWRMJAJRH+wHWT0Z97Hn7fKsboY2unSh8gTWSk756U18d3ch9Sf686hRRsKMcTlRsKvd+Iyva
	IuhnX3rg=
X-Received: by 2002:a17:906:2099:b0:b97:a39d:ae3d with SMTP id
 a640c23a62f3a-b9d7267c173mr460427866b.44.1776064895372; Mon, 13 Apr 2026
 00:21:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260412140542.41911-1-shyamsunderreddypadira@gmail.com>
In-Reply-To: <20260412140542.41911-1-shyamsunderreddypadira@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Apr 2026 10:20:59 +0300
X-Gm-Features: AQROBzBm_g27xyMunMobvpvlpkr6_woqrWvgrjAFRf30kqIxozdE3KlPajaLtUU
Message-ID: <CAHp75VdTqr5XRJY5wgLQzxiBMBss4JCe1i8C_k4Yh2sat=irSA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: remove outdated TODO comment
To: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58627-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 341E13E82A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 12, 2026 at 5:06=E2=80=AFPM Shyam Sunder Reddy Padira
<shyamsunderreddypadira@gmail.com> wrote:
>
> Remove a TODO comment suggesting a filename change for
> sw_event_global.h. The header is already consistently
> used across the driver, making the comment obsolete.
>
> No functional changes.

Unneeded churn.

...

>  #include <type_support.h>
> -#include "sw_event_global.h"    /*event macros.TODO : Change File Name..=
???*/
> +#include "sw_event_global.h"    /*event macros.*/

And still the comment has style issues...

--=20
With Best Regards,
Andy Shevchenko

