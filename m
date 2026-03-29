Return-Path: <linux-media+bounces-57511-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cO3oBKgUyWl9uQUAu9opvQ
	(envelope-from <linux-media+bounces-57511-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 14:01:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BC2351E09
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 14:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29C02301A726
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 12:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC0523603C9;
	Sun, 29 Mar 2026 12:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="UCoaqIqW"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127F43603C8;
	Sun, 29 Mar 2026 12:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774785680; cv=none; b=lXqslDGl5k5TQR511lNDJX3V1+0kT+wbd4lxKhvhslGkSBu6D9kTbnC0AFQoGBQCfZGQeflRxqevj9Y0dRKMSbj3exdAySYeU8RyLz6izFtxbVoS9afy1r8hQxt0XJcWzBqsCyO3CZ8QMFUgMBSZCSneUwCb6Zho5knw354GSFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774785680; c=relaxed/simple;
	bh=LUkVCH0L/7jKEKBwPJoL5TgGUxnr3z+abPLYkBGx1IE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=seL/+dgwo3X3Gk93AlmMVeT0C2sSfcCU8M+N80Hx9kvqfAug3N2d1mb+GuX553lMiCFwlCmguwutWPj1/E0k0PbGW91tEhdCDUvkaONdg1lR3J5M6MrswfOIP+EUhaEXGc1j99uqqHhn+k73Qclz81xr6KV44ec4FM/3ZCe2VD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=UCoaqIqW; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1774785647; x=1775390447; i=markus.elfring@web.de;
	bh=LUkVCH0L/7jKEKBwPJoL5TgGUxnr3z+abPLYkBGx1IE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=UCoaqIqW2kWUJwECOKd0IXOGSIhNSRiz8Uu4SlIKZX3f/xgePzwHtviAPEJpmTxp
	 EwH2fmEdwTkswXxyJ+zEZptl0tWyJ89P9t1jZ+ashnliksEhLwZ50tlTT26RGv0u5
	 nEc2oc1cBxCK/G7x+7Zlph92vJ2d2hEyRRZ1k/E3gSUxI+6o1YYYRRhzglo+AsxgE
	 Ixf9SxRgK3OHKNoJ69uVfjxmQ/OVCsH3OoXwXF8VM0tV7LhRlI+KK50ncriIsM0ON
	 kdNRpkcDbOuAm4a0SYAnHy+4kAQwjANzR+e+wakxAuPs2NctLiVzwgRzGL1XPh1pZ
	 8WBWMUdgVMkFM6ADQg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MumNN-1vGVTw32qx-00wXVo; Sun, 29
 Mar 2026 14:00:47 +0200
Message-ID: <6ec68751-85de-47e7-9bdd-b0ca06099a92@web.de>
Date: Sun, 29 Mar 2026 14:00:45 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] media: tuner: check return value of I2C transfers in
 set_type()
To: Wenyuan Li <2063309626@qq.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Andy Walls <awalls@md.metrocast.net>,
 linux-media@vger.kernel.org
Cc: gszhai@bjtu.edu.cn, 25125332@bjtu.edu.cn, 25125283@bjtu.edu.cn,
 23120469@bjtu.edu.cn, stable@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <tencent_46889E152DE22B7E8A0CBB3311C556F92E09@qq.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <tencent_46889E152DE22B7E8A0CBB3311C556F92E09@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KVX+dPh3rjPn9EBONcRU8lqA9im9xNWwhLbQ1G3/sP4taTgeOUc
 AbhjkRkW4SLIdQvIGdyQ4rjmUWMM/s9RTnYMvABO9vXTDi/rHhj3R/D2AZCM/HXBIIdM55m
 fP9WIC/zzVARN9mwZLW62W0js4RC+X6xKP/tmL48KHB0pVFBBzca1zPozC1e3Xjq+cGG2IK
 kfekA2kCVt63JhsOxTFiA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:u8astQAIWnM=;j1GavJ80/lwLbmQMHT5Byo0vXZS
 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
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57511-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[qq.com,kernel.org,md.metrocast.net,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[web.de:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[web.de];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 70BC2351E09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=E2=80=A6
> ---
> v5:
> - Reword commit message to better explain rationale
=E2=80=A6

How does does the prefix =E2=80=9C[PATCH v4]=E2=80=9D fit to such informat=
ion?

Regards,
Markus

