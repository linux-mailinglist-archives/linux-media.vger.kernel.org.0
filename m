Return-Path: <linux-media+bounces-65617-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TEIMAxrYPGrXtAgAu9opvQ
	(envelope-from <linux-media+bounces-65617-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 09:26:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F06426C358A
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 09:26:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=kvR2dK2k;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65617-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65617-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 645CE3018CD7
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 07:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 904E63C4B63;
	Thu, 25 Jun 2026 07:25:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7BF3C0A17
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 07:25:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782372359; cv=none; b=KvCgwtoInytiF33h8wLOAYKvftBh4uE27SfScXoqdryM+/BVx1SCElaHMJ2QU8QTgLlQbJc/nPmfKxWuhzbGYMly0+7Uxy9aW9uFE/xnuCDxk+yHhU+UqeweB/Esxs0oRbv9/PwQOO1n7RgHDwE2k92cMk135Lo1Myj9Tu3WDTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782372359; c=relaxed/simple;
	bh=VQD35UO6Szx2rw0N2+oli/oEjPgYfVwfdvJ9X7POARs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LE2cRXdYrUOOUva7YhsTkb6Fg+6vxkBwBOa602iiEf0WN6b9YQBGzbHCFuTraqmApkNOiV5rwomX72p5X5szWbWcLDesej7iVxGBJ1/Y15VQ2/NreWhg7FhZ9CmF7IWwLjkb4gOkEP2o8fWSMbgpLZLUTghlyzfTWIfTG0Gqr9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=kvR2dK2k; arc=none smtp.client-ip=80.241.56.172
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gm9MH20n3z9tQr;
	Thu, 25 Jun 2026 09:25:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782372347; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VQD35UO6Szx2rw0N2+oli/oEjPgYfVwfdvJ9X7POARs=;
	b=kvR2dK2kR1dyf5Tq8+qbQ76pCXcAPQg/vW3aGUr814ncITGW7RZEVrI1TXRAF+7hPogHHu
	FKFE/D8vmBW/yql8Aij69QlVwh41e7VpM3GilLj+yxK/5U7VAFIrzikZQ9gL+hTUfwxgpr
	yFmJfEeoA0y+3qlO8Mc9hMkK0kfgCU/BdINVJ0HQl7iOq0Yj65appxMXfl/Cirm2UTGMdh
	PFXnW2n0gPs0qt1f1K9iwUXu3VrQhkRYATOEC+BQkegbyO5F1kIYmfkh4JERMWgLI2wfNA
	iboDfIzVyIR5KxCW5OpC/7/lL/xBojMW1fZr8bFpyOW9KJFFocJ5q7shM0MMBA==
Message-ID: <c9d8f3a762601f352bd176d4ae5c7977edaeab11.camel@mailbox.org>
Subject: Re: dma_fence cleanup/rework
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	phasta@kernel.org, simona@ffwll.ch, sumit.semwal@linaro.org, 
	tvrtko.ursulin@igalia.com, dakr@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Date: Thu, 25 Jun 2026 09:25:43 +0200
In-Reply-To: <20260624122917.2483-1-christian.koenig@amd.com>
References: <20260624122917.2483-1-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: 6h4y7a4cen9tnptfx3f9ke37werybozk
X-MBO-RS-ID: 14a23481600515e0d57
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65617-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ckoenig.leichtzumerken@gmail.com,m:phasta@kernel.org,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:tvrtko.ursulin@igalia.com,m:dakr@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,ffwll.ch,linaro.org,igalia.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F06426C358A

On Wed, 2026-06-24 at 13:13 +0200, Christian K=C3=B6nig wrote:
> Then the last piece is dropping calling enable_signaling callback with th=
e
> dma_fence lock held. This makes it possible for backends to acquire locks
> which are semantically ordered outside of the dma_fence lock.
>=20
> This is necessary to allows using the dma_fence inline lock in more cases=
,
> previously backends used some common external lock for their dma_fences t=
o
> for example make it possible remove fences from linked lists.

Hi Christian,

thx for all this work! I will review around a bit during the next days.

For completeness, let me ask here:
Is there any relation, or any work in the pipe, which you would
consider a good solution for the race conditions described in these two
threads [1][2]?


Regards
P.


[1] https://lore.kernel.org/dri-devel/20260618-linux-drm_crtc_fix2-v1-1-c03=
e77b36f34@linaro.org/
[2] https://lore.kernel.org/dri-devel/fa0dc9757bf8343516c4b156a2b70ec91b64e=
f8f.camel@mailbox.org/

