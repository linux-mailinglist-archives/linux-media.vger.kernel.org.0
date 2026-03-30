Return-Path: <linux-media+bounces-57566-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yH1VD1Y7ymnD6gUAu9opvQ
	(envelope-from <linux-media+bounces-57566-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 10:59:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C246E3579EF
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 10:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3105D30704A7
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 08:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7CAA3B0AC5;
	Mon, 30 Mar 2026 08:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="by3k+Oh8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCADD3B19A5
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 08:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774860702; cv=pass; b=FfSxtYoC+ZXIT1NfePDwSJqZK76nJ6kZWitH+CLmpigf8XtttYzYmM5g3WwmkNhoO77iWtXb76zbXyc/wyoBN83D9zlfkI/jwtmmW+AVXIJSwAEi9B8nEZbglTmA2Ru4F9BBsC7eGUtgnIPHzrOh7XytRO8znsg78VZx5cTMiOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774860702; c=relaxed/simple;
	bh=gNhDkeZ73nB1ETLE4Qx9gKY8ay61huEBziaX2ObnaJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UGLPei4F8MiYrP+mBMiGLzoLsINB3yvwT+nIcbY/Di7nmE48L2UW8BAc8pXZzRZ75FXcpndgruaCUHCEjqHU1K8+rn7SRXO44MopcfL7qps64XSThiovfHvmrkp0mJvRJqSfv1mOQm5Zg5+Qxh9AnvcuGu07ERauk4r5gyNzFC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=by3k+Oh8; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b9358dd7f79so761395066b.1
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 01:51:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774860698; cv=none;
        d=google.com; s=arc-20240605;
        b=kKJzK5IgrJ+vzhZ7CL83tCZQtLL9TLqFRjaZzD2WO3Dg8FeeMp5tCG2b4LQdizRSAy
         0NqcyrMlr+9sXXTDjtqfG7U0qMoPqh27HtJaUl007m68mtcXFRTIibx8uglNGkoHBnc2
         m54vXwXaCkJGymil4iHGSuw2Uh4DzUiQTrlFfaVOpI4bCQHN23YfIocUvF2jDv2EgRmH
         1dcRxZ8KiJc1O13Ev23eyBK/2/ImGrjYhXT8dKIXImgqGliBMdtQyjBB8vlbaTFO9src
         FP40yQphvcapGzT2kZ85Dwut51Euj1bvRANq2XXtHpVT7UZIzzaZhgRdE0YeKt/EM1ur
         sJCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gNhDkeZ73nB1ETLE4Qx9gKY8ay61huEBziaX2ObnaJA=;
        fh=s3tUmARc8G8lU8Q2Xb7/7Z0smQ6Nte/gVvzHB2l9EGA=;
        b=Ebm2fZdrd676DL/Dhg3fLAHBSEMaDtnbCw4fYcRAxuL0VtIFaO/gXXXP+qtOIee23N
         p52eMnUMH0svga3jgXEJeG6K8D+dRkiPW1s/JmdQ4p4HyDqlyLAthpPThClsOqNz1iZN
         Fa/PYe6nOnUakuZxyzrT4be6FaNX0Id3vl4YUAgNg6d2Vn6s5bpytuP1iC7Kq2WmeMD+
         WBIISCUUZCStPT2gM8T9Lk49zd66wpa6+aMFPNpoDwFULDW7fCi5gD+OVFY+PWDrOwWH
         mRtd4uf8UZK+4mdN/GUobC5fkpxzEIRH9Qp79ED49atqc2L9TkeKul+IlYDYQkvS2qPT
         pTWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774860698; x=1775465498; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNhDkeZ73nB1ETLE4Qx9gKY8ay61huEBziaX2ObnaJA=;
        b=by3k+Oh8DhoaqbCnl465OgywnLMHna+zQmCLNJj4fmPPtewzOi536w8HCkFlAby5U2
         yoxpNJSOTJU5ZYhlK85jykmJCDgoLqhyQqg9fISRRXMq6mMc8QkH3d5xV1epHu0lAzXB
         22n+dW968lzPZiMiS4lDP6xykwfUuGforYmlcNfhNcBObPmL+olE0bl1o/O+/3awNp0Y
         RqOd8W7OYfi7AkvsO3OXG+B4d6Y1fU+67ihsjCrNyEOI410mASI3cxJhS8cCh00YoB+l
         98rwbbrhETz27OHLmcSJkgxQWyU1497D81NVYSGe03Te0iGT2Afqh8wmlK2iPIRdSEQR
         4NlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774860698; x=1775465498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gNhDkeZ73nB1ETLE4Qx9gKY8ay61huEBziaX2ObnaJA=;
        b=ignj9FBvHvM5Wud38DTxGqIJbdwmNtQM3a3QT+hUXZRXuCnfWjtmqV++hiq4UlnA+4
         AiAyLQ60mHn2cK5LRGRRUcSyyWEg+wcnRvXhFRLlZbm/ECAiPHfLo6YI0PZKjEWnv6AX
         JAPF2JFMfJBndKdoJN9Cg+T90z775BFiNwPTi5JbqSsjZ03pS/w1hwBiVaBWVO7JzCWH
         +Ba7uX3hipzRk4MT4f3Oq9hew6OOGlzQSGjLQNXR4ERFRWygHeWx3k7+M1Pv03kfiDtM
         JYt8+VRTNDQzNElJWezH4SkYcCvBH5rQPkRuUA/XzrmKQQ6dgn1WkQr6J8XsCI7KIFqq
         CrFA==
X-Forwarded-Encrypted: i=1; AJvYcCWbZRar7wdrG2DMuZte1OKsNpM+9HA1FB7pf1u+mDFSJ5WRz/3PwsABztOs0fe0tPbQ/QaBzZ2qI1prcA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk8YtZYoIi304RGk8fDgRQ6x6HMRVWNtz21RLYt/a+M0T+DVft
	eeaCnW0N46E8sJweSmMgMmWohcMS2K6JFhggJNp3qF3gXuKwRS9kKDcqllOHU3asfoVytZ/9QfL
	GQzBDeCGZ0xIHndiv1+xEgK0CaLntXmI=
X-Gm-Gg: ATEYQzwtHt0vYZ6mQvHSgJtUIExx41AoSylhJcITRAKCB5s+53rMLLgoQpd6r3FTYhc
	DRGP8OT7h+pDUCOxMDbMhaLCfXi9lMcJCF6JvJwuBFc2osKAJAL1cF3KLhQHJuJ5Sl5bc5xopU1
	CEQmWHbLAe7nZxjaZbSQC4uXWt3X6j6SsTqAC0dPOuQ1Ltyni+/N3FtEpTxoEnmH3cjtFCNAzWy
	8nwV8XeFWazchlggHj9nM4laVIe8kbzlc0jTTH2C979ZMKyyqwO3JU4PANhZ+rCcHi3ABF87hE3
	g8cFet0KwNgLE4DIyQ4jipjm2+x2tgW1uhS6PW91uNQpVFIsfvyx/lR6K8gmtuPS+Yi0wGNvmyn
	ujLDJLBo=
X-Received: by 2002:a17:907:7b06:b0:b98:3e1d:b133 with SMTP id
 a640c23a62f3a-b9b50942ef2mr752303266b.44.1774860697550; Mon, 30 Mar 2026
 01:51:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330073549.5782-1-robyserbanpascu06@gmail.com> <20260330073549.5782-2-robyserbanpascu06@gmail.com>
In-Reply-To: <20260330073549.5782-2-robyserbanpascu06@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 30 Mar 2026 11:51:01 +0300
X-Gm-Features: AQROBzAoJGM75bwef6q33_iMYnEy6BAnkHip-IRTC0jMuAJlxDrZ_xLiZhSa-fQ
Message-ID: <CAHp75VeQTNNgzhb1_52F=j_oWgURb6WdMMtOT5U0X+iXogbk1A@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] staging: media: atomisp: fix SPDX license
 identifier style
To: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, daniel.baluta@nxp.com, 
	simona.toaca@nxp.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, d-gole@ti.com, 
	m-chadhry@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57566-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C246E3579EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 10:36=E2=80=AFAM Serban-Pascu Robert
<robyserbanpascu06@gmail.com> wrote:
>
> Use the C-style block comment for the SPDX license identifier in the
> header file as per Linux kernel coding standards.

I am not sure about this. I believe this should be considered with an
additional thought. The thing is, AFAIU, that the header is a
combination of a few from original driver code where they have
different licensing. If Sakari thinks this is okay, the change is
good.

...

> --- a/drivers/staging/media/atomisp/pci/system_global.h
> +++ b/drivers/staging/media/atomisp/pci/system_global.h
> @@ -1,5 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -// SPDX-License-Identifier: GPL-2.0-or-later
> +/* SPDX-License-Identifier: GPL-2.0-or-later */


--=20
With Best Regards,
Andy Shevchenko

