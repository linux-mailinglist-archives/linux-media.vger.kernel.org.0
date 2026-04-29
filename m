Return-Path: <linux-media+bounces-59959-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBOpOpni8WlZlAEAu9opvQ
	(envelope-from <linux-media+bounces-59959-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 12:51:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9305249329A
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 12:51:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 04BF13051DAD
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 10:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6123EF651;
	Wed, 29 Apr 2026 10:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bqtEgdOR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097453D6498;
	Wed, 29 Apr 2026 10:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777459802; cv=none; b=qhQoijne6Qa55isXmi4xXmUsXJJJj4enH9V0opQC4Orw4Xv8kxKgDjul0kK73v+cWqQrHAWvgh13Wl9M4YKPo/kv+62LFPreUXI8tDgLqq7akhxa1E4Sn8XU19cRCVh0IpBv6l2s4gqNZ9CiOP/cNbNZnPXBNIGBisXktyTsdTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777459802; c=relaxed/simple;
	bh=Oh/Ob5Y/L8o14cR6ZoVlhC9Kq0oV/DMTyaQSm/rDuWU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=YMdsuXlYr9ma+4YulyDaBJXahpVecXPclvoGRzn5K9DuuNBVmTaRoHzVON+jo8HqZqnYrhmmZRiVxvM3scNhnHFzJzUtmsh3Yd9fYm49SxXMwWc04ZVQnR5LvrTG4tcrTZ1AoCjdM3igBwd653g3+P+3Ade2cRNoUBzMmIpGxaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bqtEgdOR; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 72F93C5EF22;
	Wed, 29 Apr 2026 10:50:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 577EC601DF;
	Wed, 29 Apr 2026 10:49:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1178910729835;
	Wed, 29 Apr 2026 12:49:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777459797; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WXbajj9BBIsUoAggvYIZsmgmbeeRvJ4lzJfq8wHWrnM=;
	b=bqtEgdORUNeErEiYzN2IAtMlvp2mklDRGorR7bsrVZWoGfMhzWvPDoa3ciPplfC9n7DJdJ
	zbaOQtR3qe7R0gd5VVcBiV/5clg7uC/XNCWCdY0ve9NqYjPc4tavSHsJh+KjkkSmurlPQh
	dz8Rz3ZYiX38Qm+0fAyh1XuxOn+Jq0Hct8Nse1AqIrrK68f9uZX1sq9HZxS/u9AgRReVZP
	e3Lk7rELors7g6uTYydPl0noWzJD3enkS/SA/CVgNdunCA04/JVL/CO6qWhd9PJ/C/U6I3
	AoZeQ76EGV2j+Q6AIBr9cqUHoUglsAASMt2Ulo+Qkug4MEjp8OzYhkvGooB8oA==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 12:49:55 +0200
Message-Id: <DI5KWT8REASP.1XFX10F0TLQGP@bootlin.com>
Subject: Re: [PATCH] staging: tegra-video: replace bit shifts with BIT()
 macro
Cc: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>,
 <skomatineni@nvidia.com>, <mchehab@kernel.org>,
 <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
 <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Mhanna112-code" <marchanna111@gmail.com>,
 <linux-staging@lists.linux.dev>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260428163312.7374-1-marchanna111@gmail.com>
In-Reply-To: <20260428163312.7374-1-marchanna111@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 9305249329A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59959-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.linux.dev];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-media@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:url,bootlin.com:dkim,bootlin.com:mid]

On Tue Apr 28, 2026 at 6:33 PM CEST, Mhanna112-code wrote:
> Replace manual bit shifts with the BIT() macro to follow kernel
> coding style and improve readability.
>
> Fixes the following checkpatch warning:
>
> CHECK: Prefer using the BIT macro
>
> Signed-off-by: Marc Hanna <marchanna111@gmail.com>
> ---
>  drivers/staging/media/tegra-video/tegra20.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/stagin=
g/media/tegra-video/tegra20.c
> index eb1fc5b7e2cd..f3edca909684 100644
> --- a/drivers/staging/media/tegra-video/tegra20.c
> +++ b/drivers/staging/media/tegra-video/tegra20.c
> @@ -177,15 +177,15 @@ enum tegra_vi_out {
>  #define       CSI_SKIP_PACKET_THRESHOLD(n)		(((n) & 0xff) << 16)
>  #define TEGRA_CSI_PIXEL_STREAM_CONTROL0(n)		(0x0018 + (n) * 0x2c)
>  #define       CSI_PP_PAD_FRAME_PAD0S			(0 << 28)
> -#define       CSI_PP_PAD_FRAME_PAD1S			(1 << 28)
> +#define       CSI_PP_PAD_FRAME_PAD1S			BIT(28)
>  #define       CSI_PP_PAD_FRAME_NOPAD			(2 << 28)
>  #define       CSI_PP_HEADER_EC_ENABLE			BIT(27)
>  #define       CSI_PP_PAD_SHORT_LINE_PAD0S		(0 << 24)
> -#define       CSI_PP_PAD_SHORT_LINE_PAD1S		(1 << 24)
> +#define       CSI_PP_PAD_SHORT_LINE_PAD1S		BIT(24)
>  #define       CSI_PP_PAD_SHORT_LINE_NOPAD		(2 << 24)
>  #define       CSI_PP_EMBEDDED_DATA_EMBEDDED		BIT(20)
>  #define       CSI_PP_OUTPUT_FORMAT_ARBITRARY		(0 << 16)
> -#define       CSI_PP_OUTPUT_FORMAT_PIXEL		(1 << 16)
> +#define       CSI_PP_OUTPUT_FORMAT_PIXEL		BIT(16)
>  #define       CSI_PP_OUTPUT_FORMAT_PIXEL_REP		(2 << 16)
>  #define       CSI_PP_OUTPUT_FORMAT_STORE		(3 << 16)
>  #define       CSI_PP_VIRTUAL_CHANNEL_ID(n)		(((n) - 1) << 14)

I think this change would make code worse, not better. These look like
enum-like values for 2-bit register fields, and as such should be described
the same way for readability.

If we want to change them they should perhaps use a GENMASK or similar, but
it probably makes sense to just leave them as is. They are mostly unused
anyway.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

