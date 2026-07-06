Return-Path: <linux-media+bounces-66791-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PhqTJk7iS2ojcAEAu9opvQ
	(envelope-from <linux-media+bounces-66791-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 19:13:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE41713BA4
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 19:13:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b="VPp/K7mp";
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66791-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66791-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6CC7F3007BAF
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 17:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5FF937C11E;
	Mon,  6 Jul 2026 17:13:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8052F5313
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 17:13:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783358021; cv=none; b=a1Z7DVTUfHSXco4ujibP5prSzTT9ILh6z9csKsUOrulXaQhjzew24NieCa/QI6Q3XsrJd0X7heLde6vDsLuUG89x/rugGXfvW/Xyneb4pCD20yR/gfIgMPb4kg3OwdMhgz2aiM6ERnFHrynAfAxxtjkrTV5BMIMMAQYGzecUd4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783358021; c=relaxed/simple;
	bh=MCc729RJhXwcN6DQHcIMn7v24UelBx5SMI5SMzKcwRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZ60URad8OAG1nxOJ9j4TaV8+Q0MZ6YH4LTlAcH9zEWcE5ID17AAGKVlMgHvzka/XinIwRMjtcH+bmMle0PKql39AZgTpHCgJwc5U+rjJrSWFZ/rAkycvkY8WJ+nwyeLWoNESPQ9YOwYGpvowUoJWrePdfTItLZn5MKb8Xov3xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=VPp/K7mp; arc=none smtp.client-ip=209.85.221.43
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47dc6e04367so405526f8f.1
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 10:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783358018; x=1783962818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MCc729RJhXwcN6DQHcIMn7v24UelBx5SMI5SMzKcwRQ=;
        b=VPp/K7mpu7oCEV5wS9BkjoY+PcSrSVOlvvMuCd+yKet0r0lgrAauN9X7zyFriLlCUC
         fdVZlV11MYTjaRhXu2wmxOGs4TKiQv1AKPtsAxQehxLdzcriW26UJJ6A3PL/4HwO1RZU
         EN0miJgog40UbZtw7F0WnXmztiWIfi0WMbMVuDEBE5nMOHpnEQVtgdVrsYwBzvw6KtTX
         997P3nl1MsANQeVRnfNbN8adC6GZpW6xN4PujZ3FMXSvbJ8+FBxs4t1QhNBhFvPZIRwj
         bvKJUBnA5HhKOTV8UqfiMUwS+sHDc54cQCoOqj12wR94VToLrAJQ9pINNd0zqbF6c2O4
         FyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358018; x=1783962818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MCc729RJhXwcN6DQHcIMn7v24UelBx5SMI5SMzKcwRQ=;
        b=WYAZy2Ou6IxvS68hcS0Y7s274pXITPKpEuMUJ24mDQ2lyhHwWpYuhxfIsg2U9HrAVL
         mM8MTgribOfY15uyFS6mTtCw6rz/KwAsZ/kmX9Z8b90VYyjYN6WCcsU/txxiBhYjdrc+
         FY4wSw2Dm8bsJIKSb71XFpXChVXyu+a+Vo7Wwwxx2USAxaOPHj8v2/hjiwawTMsHTk5X
         kjYp6tgDE4/slqWSGxffRot0DgFrQgrlS8UxGZOVW0h1e0Mt2kh1dYvsLC1nJVjhwfUB
         ea/jN7AXrwGJPmn2jXIhQpekUoea4g6zhM3T65wisKWoGDpLFqPJ/i3lRgHJeESeJNTU
         9r9A==
X-Gm-Message-State: AOJu0YwzZQxvhzzRzxWZ81aVpED4MRy5j2L/K+eLmjhqpPlZZDTfLYZs
	0f6OV/CTLE7doP/+CJlA8xmEIzy8guBxzcjbj+Mgxls1khzQYitk0qxD7pOhZCwp0yY=
X-Gm-Gg: AfdE7cnnU7RPJlLBaQTJEQu0tiuSRll5HZzfU6lkMkYA5aPA5N8YPsFmEwD+h90qLDn
	gj4E67jgTbMOauJO0mB5wUIviowbo4IbpC0WZsIymlXUdVrfSC8e5fJ9afbpX8q7peKjoECx4OR
	Tab33erHVQhRaBG4chbWSpjmP7ccE8WOIFkVAw+kcHH418UA8NEq9VtsRKBG89yaqRnB1TCFKLG
	D9zpqenyaO0MHVmJE9sXG243Ueroc1oklYQESGb97rAQGnz7RksTw1oanmup258xV+fyaLYi/GJ
	6pQkRytg1Dsak87jR/HTcsV2ygUClQFyZ2UXRnUCeVnowRTnQ++Yg9W71uH1rjNunHuIwNiCenH
	DFgqMQKhxxH1nx7nOXr1HvbCbeMubkGpobBb2PmXET6DM3vNAqnIUrpdxCT+NQbZO9v0AcWHVx0
	cL4AJk1B+9sIySZkVj1sl0h0au5Zr2Md3hpz++hNlYGklZSOA101OAtOufh1+oVw+HY9WLXCvrY
	Sl62HugSYRZbA==
X-Received: by 2002:a5d:4951:0:b0:46e:6210:ad4a with SMTP id ffacd0b85a97d-47de66678camr1240284f8f.5.1783358018039;
        Mon, 06 Jul 2026 10:13:38 -0700 (PDT)
Received: from localhost (p200300f65f47db0404eb41111570ffdc.dip0.t-ipconnect.de. [2003:f6:5f47:db04:4eb:4111:1570:ffdc])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0960816sm25028351f8f.29.2026.07.06.10.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:13:37 -0700 (PDT)
Date: Mon, 6 Jul 2026 19:13:36 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bryan.odonoghue@linaro.org, 
	vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com, mchehab@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
Message-ID: <akviE-ANATfFPdYZ@monoceros>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2f7b3wyhcc726iyd"
Content-Disposition: inline
In-Reply-To: <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66791-lists,linux-media=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,monoceros:mid,baylibre.com:from_mime,baylibre.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3CE41713BA4


--2f7b3wyhcc726iyd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
MIME-Version: 1.0

Hello,

On Mon, Jul 06, 2026 at 10:11:13AM +0300, Atanas Filipov wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users of this header. Only use the
<linux/device-id/*.h> that you actually need.

Best regards
Uwe

--2f7b3wyhcc726iyd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpL4j0ACgkQj4D7WH0S
/k59LwgAuTiKtFSft7ryJWgTp3oj8ijK3Ahhq+yQEbS4uMyOKNsstXY+Elk8JMCx
FxyXJEnGG2j+ygfRTonPe5nJ+MVypDKFkgwAw+Hh7enMUP6zOm57qLiVXH7B7EvG
PwFhKh58/IZjfVKTSQlqFg3+x2eC5YO9oYB+TdIxb8ZhWw1TPJAtJICLzcDQpZZC
NKDKzgQvTq6/x4i9Gio1RGSOHDlqMgKVkcDOWXhVNzZa1aETjAX4GsfiPciZEv4Q
MLhDaFZAj+kLgm6AjvvD4CM2/C2gBYXFXB7vHJBgVMBl6Mb/iJi/zltvGj069aHM
5+sMK+vEVq0oT22WbjohX9omeLDU4Q==
=WLCe
-----END PGP SIGNATURE-----

--2f7b3wyhcc726iyd--

