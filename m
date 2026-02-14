Return-Path: <linux-media+bounces-52816-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBxdKcWOkGlKbQEAu9opvQ
	(envelope-from <linux-media+bounces-52816-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 16:03:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFED13C439
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 16:03:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 185383023504
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 15:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240DE280018;
	Sat, 14 Feb 2026 15:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="butDhugc"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEBF1DA62E;
	Sat, 14 Feb 2026 15:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771081403; cv=none; b=SmR9oFAplHuxA744HM7fySPHrzIzLGb4dVuBWdkkLmXSqmGeGhRZbGD08IUkOOgeXppRevScx7epgKHYo/wBEJFXCkdgoVqeNBcRGgVpVOL8Z0eCI0UoEiYZd47bMCwyB4jETugAtjQv12gLj2ZKIso0u9GOYWEduzUIz86RJLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771081403; c=relaxed/simple;
	bh=Ps0frMKM5AoidcQjadds17duuL7Dpw4fPr3qI/iHdEw=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=FbyXbdL88qZlqjqTHC9RfQrMLSqKz3lI2FQgA6jblcVGwNB6Z9Z1GTlLuAqipaYGqoJi6lp01bC0liQQ6VDRlju9ho8PVpIJPiQZIBXQXsWyLHI/RcFOFjcUOAT906Vg4ctgBbqOG4cGZTINazx5gqJ0lkNfukuMEEKiQ8RgI0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=butDhugc; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1771081399; x=1771686199; i=markus.elfring@web.de;
	bh=2k+EdPvBks3rFmmCoVWMn9XNEGw2NRCfozB9EDsZz80=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=butDhugcRQgREe/xEEsUlcQ3d1vmkwZA/7zfZnvoGe8omrasPf3SYl5wt0GQO+SQ
	 9CLG33rn0zT9WGDoWBuGtMoKhfZANCZBJef+bSIsksxNsheTUKaF7E8SX7z/pONzR
	 4iTsqWHwJeRgI80WcRR3aZEkONo9CRdoMw2eVoomo21bI519I9aa4rNxbHCdSeecq
	 nzeCRpLZ5mKiuR7XwUc8LCVYEftB1/iuSaAOthckmLIPhl+fqUvPrmohS85RU81xP
	 5d5l0n7QqTM7oN67GTjtr7FAU66X6Sp6WpvBO4GyeuCnJfrrHb8f2Sf4yI9OhoRGX
	 CK0146FlpAuguiWcmw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.241]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MPrPV-1w5Nwa2zIJ-00Phcu; Sat, 14
 Feb 2026 16:03:19 +0100
Message-ID: <043fc46a-39be-49cd-9dd0-eb735e92dc2c@web.de>
Date: Sat, 14 Feb 2026 16:03:17 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alper Ak <alperyasinak1@gmail.com>, linux-media@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Biju Das
 <biju.das.jz@bp.renesas.com>,
 Daniel Scally <dan.scally+renesas@ideasonboard.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
References: <CAGpma=7O5Uy1U-ePSixiyoWJremYk=x_L=oR19_VptgNAjen=A@mail.gmail.com>
Subject: Re: [PATCH] media: rzg2l-cru: Fix possible ERR_PTR deference
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CAGpma=7O5Uy1U-ePSixiyoWJremYk=x_L=oR19_VptgNAjen=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:1KEMakSh1tC4UdQO4tC1gLQtJ50q33O3OxnjDf4N8ZCEAgHW6JV
 w760373B7tTxbIRAgtjGxfmUBNfh8P0+m0pngl/j6+YYh1Vs9ZS6+BqUA1h6yxsRE7UTS7q
 8lUw//f9z53Z+b3ms1JephvSBGpgTE6mKF6e16D3CozLOLVn6RUUk7/pqpq4rtgv8UUhalL
 u17obF3t+2b/D+gr4oFhw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9lgSxNfE5HE=;d5Wag6ITDjrcrVkH3vJzdNc5oSb
 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
 x4qEbODHSC92K5R3Op1tqJAxOjeSQIgfZSN3IC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52816-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[web.de:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	FREEMAIL_FROM(0.00)[web.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2AFED13C439
X-Rspamd-Action: no action

> No, I haven't seen this happen in practice. This was reported by
> static analysis tool.

* Did this tool get a special name?

* Was any background information published for it?



>                       Since the function explicitly documents these
> error cases, it seemed appropriate to add defensive error checking to
> avoid potential ERR_PTR dereference.

How do you think about to improve change descriptions accordingly?

Regards,
Markus

