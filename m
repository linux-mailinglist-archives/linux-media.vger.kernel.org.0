Return-Path: <linux-media+bounces-60197-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPufJwNv92kYhwIAu9opvQ
	(envelope-from <linux-media+bounces-60197-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 03 May 2026 17:51:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B236E4B654D
	for <lists+linux-media@lfdr.de>; Sun, 03 May 2026 17:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 493143002F4D
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2026 15:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C423AD524;
	Sun,  3 May 2026 15:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Q9oPpzEV"
X-Original-To: linux-media@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0859397E64;
	Sun,  3 May 2026 15:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777823484; cv=none; b=GE145ZP83rWwEGfgDD1d45SQcT1h/RfhUl+NIvHDUrvqM+B1RbBkYvZlC2JyFmnmUG45tIrTpTT0xgk6mCPmcZhxtb2oTNVFUFA1KRuoEfQEwILlpfY4pqAEwWFJRk+AhPFskV4r0boI7q3n+YYb1UX/bIcX+jip2nP7i7SaEN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777823484; c=relaxed/simple;
	bh=Bid/fim6QF7BXHxw5C6NNB6CjrRdX7EsliigzYoywHU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cYwu62SOV2P1iLGBpBH7aPHG2q7tFZFr+nTkDN0XAjiqH8rBY1L29zWcAvVOZqUm3dk8wGg+X/qUIz+PDLZEnRubd/TVsQCgdO/VZ8bHbCusYoeRD0NxyPMqQSraV4OXofiisDGDWjdY37RTJc3vzyAdYAoAVJi+m8s9rfb14xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Q9oPpzEV; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 759B141084
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777823483; bh=fyRPsaLeyAmCgD7qP12n2O4WOzwaY15FpNC0oBQOyY4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Q9oPpzEV0FONZtRS5W4Fi9uvnUEQqPxOWkdpHtCbMXHJnDNo8ZYco68Gv+cdnRJQ0
	 HiYIRvbkdMQRdD4ggSgJrRNTgjJgFHRNO+M7U6FJy7tfxMkPdPeAS6W4PiTAj9oJb5
	 t7H6o2TmnslANristxpVyAsBCWVaXW0XkjUb2cDVKRFYJJFuFWHSMy6rJF02Y+1aQT
	 8peZdxLpkMbPuYLpPiF7PkfNRfkFroy/V8EA7zVNcA2ufyQtJ+85OQw3CLcbccPGI8
	 fG4mvPHY4NDJZqMstnuiRw1B4h08V4n/d1ZOqHJUHL7PpDiyOUchZ0EMzYzJohxyOS
	 YK8PRgeWb3v/w==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 759B141084;
	Sun,  3 May 2026 15:51:22 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, Kees Cook
 <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org, workflows@vger.kernel.org,
 linux-sound@vger.kernel.org, rcu@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 0/3] Documentation: adopt new coding style of
 type-aware kmalloc-family
In-Reply-To: <df48beafcb0cc9caff40db78285113f0b1bd9b87.camel@mailbox.org>
References: <20260429070759.309110-3-manuelebner@mailbox.org>
 <87o6iwczjm.fsf@trenco.lwn.net>
 <df48beafcb0cc9caff40db78285113f0b1bd9b87.camel@mailbox.org>
Date: Sun, 03 May 2026 09:51:19 -0600
Message-ID: <87h5oobifc.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B236E4B654D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-60197-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mailbox.org:email,trenco.lwn.net:mid]

Manuel Ebner <manuelebner@mailbox.org> writes:

> On Sun, 2026-05-03 at 08:56 -0600, Jonathan Corbet wrote:
>> Manuel Ebner <manuelebner@mailbox.org> writes:
>>=20
>> > Update the documentation to reflect new type-aware kmalloc-family as
>> > suggested in commit 2932ba8d9c99 ("slab: Introduce kmalloc_obj()
>> > and family")
>>=20
>> OK, I have applied this series.=C2=A0 While doing so, I restored the "gf=
p"
>> parameter in the changelog portion where it had been mistakenly removed.
>
> That's good, thanks.
> I had two more changes lined up for v5 of this series:
>
> -	ptr =3D kmalloc(sizeof(struct foo, gfp);
> +	ptr =3D kmalloc(sizeof(struct foo), gfp);
>
> and=20
>
> -The argument gfp is optional, the default value is GFP_KERNEL.
> +The argument `gfp` is optional, the default value is `GFP_KERNEL`.
>
> I don't know how to go forward with this.
> please advice

Make a new patch on top of docs-next with the additional changes you
want to do.

Thanks,

jon

