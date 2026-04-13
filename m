Return-Path: <linux-media+bounces-58631-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPsHIP+d3GkxUAkAu9opvQ
	(envelope-from <linux-media+bounces-58631-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 09:40:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7E83E85D7
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 09:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC2853039CAE
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 07:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 402BB393DE9;
	Mon, 13 Apr 2026 07:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jmLu8UcF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E213939C6
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 07:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065774; cv=pass; b=rQDG895+jMwYn6Ct/CPw+oW25AfaLGOdVgEpH1Jznk7ZxrIHihZaV71cdZgF1WVNrNxq/F5AaoIFoJ3peOUXoex0dyKYx0Tsh8BNVsfioJ2wKAyn3uV8wNOUZEA9kBPxgdBQN+c0r6R4xmX5fiiLBVCBG6+3TIPbDJDU1+06lCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065774; c=relaxed/simple;
	bh=oboIgUyu5VB6k3JA37msJUTW0oAI3/hO5x6qMzsS4nQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JU3yj3Frxl+RyU3ZkzhXEwR4oBlHIAgrF/Yk4Gh045fGIvvKZ2ApjgvT4tFuz5/McnZgqHM1KGBaUYCzvMJ7YYkdoCjg1nOnR6kA1ux6jBqFOccJmVBP+OBg+XGry2ls9bq3Tlh/YZiqP4GA2+1ocrQJaVfchGkb73yfKYRc1fg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jmLu8UcF; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b9d6c8871c7so569856466b.1
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 00:36:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776065771; cv=none;
        d=google.com; s=arc-20240605;
        b=fqWjlEm/k6MFuSX4twwaB168sH8jDBwuHOB19UQw726npDtunD1oMzZaLUt0KBliIr
         VgRZcQacqVdxPC2KYcMQypx2FW+zUVQFflG+izoOkWx/xrjRumuXHuccKvSd+Fvg3i4m
         PXEbjg/s1OASlh3g/yTnZuASFszBicK8gxbL0NDc0t3hE+Y132nurfCAaDNoCj5Vv5Mn
         4oS6+H+Vhwv80He1apiok7ltZpXvnCjS5QMk+30E6bYr6OmJX4lDN1XTPRNWpnZ9FxiO
         4TUFJvIkMk51qi2W5xQxXlBYET5uhS4r9fGm5IjoCdLEQDgOWhkURexMN9TI4H5syz72
         IaSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Thj1AaSn1ao+dErDYKFE38DjZNWkRUD67LFbETSi4WM=;
        fh=ev/6JCo/Ataa4crn5468EYJcI7ucK95XC3P+ZhY3HxQ=;
        b=XuUQa3xtSXZPjDMa7VMa0QWgn6Z63oUUEIXWxWd0gVRW0k3I8hKP6dYNzLAnO3kbhX
         3lK82yRBFGCdhkdGokyIoqO7aJyq6YyROWyadfXi8aDP5aTJUxN/CKyKWqz+eJcYeZhb
         pTmT8EpLFnkx/oeDEBMyPrxLq/yu7fffKecp9C7qzFDtpd6+8JTSBJCtrIQ2IYD6H87R
         Mf/ew4OqOoTMirOLw9oiP9Vg1hOO8g4VVyN9Ir/0JIaLrGxp2JQbyb7T4ay69EB6h8/b
         uBxfn2Yg4bebA1bvNuuzniah2rHlCGM8uWIq7f8VmuxPwX2OOG2/PPZd8KOCFQIvesx2
         UAgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065771; x=1776670571; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Thj1AaSn1ao+dErDYKFE38DjZNWkRUD67LFbETSi4WM=;
        b=jmLu8UcFOChtPkZ/2uD4EybGL9UPLjIvoUAc+yagE96ZYzgwUHZ4xgBsPX5WHNrNtt
         Pv0x42i0Z0nkkhazYM//xxEOj7E5iKZG5u60bzOaJVK6+6H7dcwuUgjSd22tJCPrvOge
         rJlg7ImOfh3bCDb1QPPbBDgOzmUhfIuyPMTGagza8ubxteFThO1ztQDbSXnxnsICF5wK
         3a/uHgPPgy0dfzO5/yjFjSlNepBm0mO+anG/HSExa/fIB8VnOKHY6SDkndsk1ug26TJN
         sKzKRi5ArDdnjFO2ZS0Xvr8a3cJ+iKyvwFgsG6U+mN/T8FVpl/zJOSf2dvzOgGcrjLIq
         EmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065771; x=1776670571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Thj1AaSn1ao+dErDYKFE38DjZNWkRUD67LFbETSi4WM=;
        b=KdTKSEpN+kgd5T8hGA9HhUavjrImAF+n3ToXvxvz09S5zC+u0zfKZwu2Rls8K4NRV5
         gWlBS9K7sA71jIC1TmsCAg0cHCr4BNxjzDuCCiWEKnNrOWB91O/0e+lsxeyvJ/NRZRHd
         CWqluq0zdVWYhLhcz0+d7KNVdvSF5lvCM3evlhTOlm7li8/G1uR124DbjcrywWsVGhgc
         z2xldDmZOtQxHmn/EJu9RDgESIyc9uRW6tvamDTvAzIE31ynJOPSRLxJhRgnRFl0QGsG
         OjCkzoy0KTGFUinz/sMnAqK/UZRJ4fhWbdUEmtlZTv39wU6QklckXqTqGzGTo3ChuI9W
         HICA==
X-Forwarded-Encrypted: i=1; AJvYcCXbE9SdXFRm9w74T0e1wPTN1BI0hR5qgm/zR4eeiDYZ6bDt4WAq6hVRQ8dC9E2FEFLJIDwXK3dEg4EQOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRfZa+KHM5fZ3oxZsYXeOIiIZXduuM32TCnKSJOEV+Gf0AN/ht
	L9IhBGrzkN+/vrcb3JS8FOlbYNXezYzcMJfzLbHggiDbP1T+FFLZX8IZxU2awLk99YSO+1LODhN
	C2A0+/lFRTaGUj4WzrWSiF9DkRmUEqb0=
X-Gm-Gg: AeBDiett0as4ADytCk335e2eUB09mn6pFbPtb3Rm774eFwb2AcY8kZF54rht7wiaWRA
	DxhzPYzAdYcsbwFv6NW6X523o1ylH9Sv+8HPqm24l2x1RAZHtP8UMGtlEuRZOu5l/qAYBaMNXx8
	BxUeoHmFR+x95PED5ooLxMVaW4bAQz7vFYjuUkw6bHNZ2U16+/8QKcgCtHrm86A8+MUdibO70EI
	45rr4o6YWTXztfxq+WUU/glKbauZrkQLtqHn8K0SoyB77Wqmym/5cSXSMHxh3iQSQmY+/VW87EI
	Z12e4Ahuq16+5c22XSwz/WSPUI/0VqIZcZl6DIx3utqgebvB22KODTGuxz5cHMQ/AQ1ZW0Vxa8q
	mD9GvvJU=
X-Received: by 2002:a17:907:1c16:b0:b9c:d04:e05f with SMTP id
 a640c23a62f3a-b9d72658a55mr684606866b.32.1776065771266; Mon, 13 Apr 2026
 00:36:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ziqbdajRR4fZ-_Ww25Td-vQI4lPfklpXD_pM87A2d1wMTKsMCgxh4hKyrZCFZSo8PXakp6_PYauSQWb3NUlsUnC-LCt6YeT_iIsD_M3GK3E=@innora.ai>
 <20260412000500.62475-1-feng@innora.ai>
In-Reply-To: <20260412000500.62475-1-feng@innora.ai>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Apr 2026 10:35:33 +0300
X-Gm-Features: AQROBzAaFP7LBKqhuZaG2X09TM_U48r-N2j073LiL1fdfjXb7rCDLLaNmkS4tRI
Message-ID: <CAHp75VeL8S-ymj6Q8wfFY7GZ7LWdP365b9fVUmzaxrze1oueeg@mail.gmail.com>
Subject: Re: [PATCH v3] staging: media: atomisp: use array3_size() for
 overflow-safe allocation
To: Feng Ning <feng@innora.ai>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-58631-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: CB7E83E85D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 12, 2026 at 3:05=E2=80=AFAM Feng Ning <feng@innora.ai> wrote:
>
> Replace open-coded width * height * sizeof() multiplications with
> array3_size() to prevent integer overflow in buffer allocations.
>
> The atomisp driver computes DVS, morphing table, shading table and
> statistics buffer sizes using unchecked arithmetic.  When dimensions
> are attacker-controlled or simply large, the product can silently wrap,
> causing kvmalloc() to allocate an undersized buffer.
>
> array3_size() saturates to SIZE_MAX on overflow, so kvmalloc() returns
> NULL instead of succeeding with too few bytes.

...

> +#include <linux/overflow.h>

+ slab.h

...

>                 /* Generate Y buffers  */
> -               dvs_config->xcoords_y =3D kvmalloc(width_y * height_y * s=
izeof(uint32_t),
> +               dvs_config->xcoords_y =3D kvmalloc(array3_size(width_y, h=
eight_y, sizeof(uint32_t)),
>                                                  GFP_KERNEL);

Please, go further, id est

               dvs_config->xcoords_y =3D kvmalloc_objs(sizeof(uint32_t),
array_size(width_y, height_y));

and so on...


--=20
With Best Regards,
Andy Shevchenko

