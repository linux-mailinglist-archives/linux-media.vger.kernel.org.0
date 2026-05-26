Return-Path: <linux-media+bounces-62757-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CP0gKkVcFWp7UgcAu9opvQ
	(envelope-from <linux-media+bounces-62757-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 10:39:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 086875D28B9
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 10:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FC943020AAF
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 08:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 485DA3CC7DB;
	Tue, 26 May 2026 08:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kr0UtFXX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC10C3939B4
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 08:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779784764; cv=none; b=GaW2Sz/RJXXkwfPfixm7TAC0pF5BuaRGzroQThrqpkk+5Jm4U7MsU7/dKFKmLLQ9220qOjxaB7iRdpPe76GKQYW07IMIRohaE9/hWpWz3rUvNSLU23RK9ua8S7Ev/UkU1nuobZRyhkekSPrrV3oP+qEK/8bd8Kk2wpN8WbwcEJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779784764; c=relaxed/simple;
	bh=exUQGs186Aq+Vzbz4if6JSgxOypH0DW9dazCN5aVGK4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hk378n4Pa+R3BBw2fsyK6H0nO8srqYOzu+R1jy/7Ar54vj0DVrlZ7/Gh8k4J2+UkP2rtm8y1JQGCFW4PgzradrSmQmjpR9PqC5nEJil/dHxY/d+h4tZ9+I1EkDRb6MY6gOEdJtmO38bqjkoAyN72v1jUhihQyZJANgR5s4FEPGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kr0UtFXX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C0BC1F00A3A
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 08:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779784763;
	bh=exUQGs186Aq+Vzbz4if6JSgxOypH0DW9dazCN5aVGK4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=kr0UtFXXJPEtIyeAWU2iQjM7xblfpXmolip0IC6jg2bGMHE7ihBWJtNH49ZFf8fIL
	 FXxBICA4Y5gGdyl0jTfBt+p1GleLU8NlOI3fiMO5cUGFXUwkERW9qcEVQHk6iH1hwA
	 XXCPlk+qsflOAcxTXcv/KOgB9yyRUfrF0H+gjoVRmixzOJLjIgRGsPmYper3XfxNUO
	 FaB+jDZfaLtB8HFV3WENG7Cxdugp2Rxp7Z4GAzDk/CJA0wxMSjMfQ6I/wlSPCm0OW8
	 syyo9oSEEknju8cflqizHRFUXAphhNnE0p1YBQWsIJ/qFUFqHAsvrsuaeBuBC4Q8mX
	 fUhXhHBaQxTxg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39378db197aso106342401fa.3
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 01:39:23 -0700 (PDT)
X-Gm-Message-State: AOJu0YwQd+EQwMdMg3gUig5O/clctPmnLPa3yPW4nF6DxclbK8ptuguY
	1GOS8PuItU6R7kKM4mYnEt9lW9HibwM9q5jX+8KvR/FuiyDQ8jn/v/eS7/UvDzcfmNL09mtbR4M
	ruPXSJBhwV3ar3Uco8I029EVqG4RnPY0cKGQncC/NyA==
X-Received: by 2002:a2e:b8cd:0:b0:393:a5ed:7dca with SMTP id
 38308e7fff4ca-395d8c08274mr63525631fa.10.1779784762028; Tue, 26 May 2026
 01:39:22 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 May 2026 04:39:20 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 May 2026 04:39:20 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260525-s3c-camif-descriptors-v2-1-d703e47c4f96@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525-s3c-camif-descriptors-v2-1-d703e47c4f96@kernel.org>
Date: Tue, 26 May 2026 04:39:20 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdnmwvZkgW9yiMJDMKRXAmirQS_XQa8TnJsQOEGo8OQig@mail.gmail.com>
X-Gm-Features: AVHnY4Jsw9CI6wuy_ristr08_BrJrSKHzuLkXDIWO8DXMOBNmupoP0enp6DIEeQ
Message-ID: <CAMRc=MdnmwvZkgW9yiMJDMKRXAmirQS_XQa8TnJsQOEGo8OQig@mail.gmail.com>
Subject: Re: [PATCH v2] media: camif-core: Drop GPIO handling
To: Linus Walleij <linusw@kernel.org>
Cc: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-62757-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 086875D28B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 25 May 2026 09:55:42 +0200, Linus Walleij <linusw@kernel.org> said:
> The driver and platform data refers to the legacy GPIO API,
> doesn't really use it, and also calls some GPIO-related functions
> passed as platform data.
>
> This platform data is not used anywhere in the kernel.
>
> I'm not outright deleting the driver, just deleting the bogus
> GPIO handling. If outoftree developers want to fix up the
> driver the GPIOs should be defined in some kind of firmware
> node and be obtained using the gpiod_get*() APIs directly
> in the driver, but I don't even know what these GPIOs are
> since they are hidden in platform data that is not in the
> mainline kernel, so what can I do.
>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

