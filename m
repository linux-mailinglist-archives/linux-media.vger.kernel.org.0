Return-Path: <linux-media+bounces-54699-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMWXNU16qmkqSQEAu9opvQ
	(envelope-from <linux-media+bounces-54699-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 07:55:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8B121C331
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 07:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54A37303D333
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 06:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C658371D19;
	Fri,  6 Mar 2026 06:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Y7mEZBDU"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1879137186B;
	Fri,  6 Mar 2026 06:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772780099; cv=none; b=a44IqNFxFTtS7LAYbWaHdgKJKi7se6p6IOPQHO3f9iMq86Lir05BDR8c8pY9YL2vcuROTk5LwfG5TSWmW3il4eoty2p53a7FBFHRM4mUHp7H9rXCj5yGdte56C65Z5B8TNQXOtnu/OnbuByfUz6iQnWtkveTJa4Tl+PlJgHwKn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772780099; c=relaxed/simple;
	bh=KR83WD/k59omDMwb6DIM0BqBB59aodWgbgFpzNekviY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UjuWWZjZs9GUtSR0/JAkdrFmlcmepkxv8gSXoK1J7XbocdTGNdBnVfA1byVmE1Zr5fe/CPn95ZtidVYTcvgF10bHeK56mLJbenlRZEPHcIlCjk+j9Bpkd/X9JdxlLEyqFpxfHF6mzzZ7E7qS89rHQpjqa3toGNOGpii0bceq7lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Y7mEZBDU; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1772780077; x=1773384877; i=markus.elfring@web.de;
	bh=KR83WD/k59omDMwb6DIM0BqBB59aodWgbgFpzNekviY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Y7mEZBDUpZtxVTZ/Op/rjPV7gmZLm2SCP4jYpsdM74gJyLbQYtEXq0EsBu2TG82D
	 WuHeYQE8/zvQGQi9ym81gtxQ4A1YeH1rgEybJZ3fRkfG2Dl/F3qncOY120lRe7NRT
	 LzeCaWjS9llb8ufg3vweDxmGcrWHhT5W6PQks6pYuLc+ic2FT2+z1iQ9NkSMBaGfl
	 RF+Saj32tUtKhrcmypZ92Wn8T+3pmO4W0LZ79MtR4Eddhn5I8Kb6afH8SodoocJfd
	 F1XzvPJVb2M2aq7YJWQxaCnu5/iUW5yoC+JBmmGFKTPndq9UI/pof5Ja6qkpSbnA4
	 RGkdb1NPMnnbNFuGMQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MzTPW-1vlFz31rbE-00rA6A; Fri, 06
 Mar 2026 07:54:37 +0100
Message-ID: <87aed2d1-d269-4283-ab64-a7f289b32df7@web.de>
Date: Fri, 6 Mar 2026 07:54:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: media: chips-media: wave5: Fix possible ERR_PTR deference
To: Alper Ak <alperyasinak1@gmail.com>, linux-media@vger.kernel.org
Cc: Jackson Lee <jackson.lee@chipsnmedia.com>,
 Nas Chung <nas.chung@chipsnmedia.com>, LKML <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20260207103224.609938-1-alperyasinak1@gmail.com>
 <c4938298-41b9-43c5-bdd5-96f37536ffa6@web.de>
 <CAGpma=4=J2-fmekpANH0EHNCs_TwPKp-t3Hd5h9S2BBDjF_r_w@mail.gmail.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CAGpma=4=J2-fmekpANH0EHNCs_TwPKp-t3Hd5h9S2BBDjF_r_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:hKxM79osyC3jkV+2wrA8H/vGSL1Cc68EJKb+Qk8tZwjs9lQQ/1l
 gCnpigcHANcRmhFk8W8UUdne3MCnT0qone5IE4N646ApMGH2ixz+Ee9wojh2pP63s3x3ZkV
 a7qYuJHwHk5jr9tE+M8KPPfxPMGttl94rAEodKqo2gEUhgPFhURs3BmcT+7uzGouVzp1Jjk
 NMaLsGFqVjlN1ZcMIwTyA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gp8EGQ9xl7o=;I5VaL4XqukFK8QR2PWaiNXRR50f
 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
 6cnOGAS0Z/ahzOxntOHJIJwCBaGDoAuJNcuA3W
X-Rspamd-Queue-Id: 3D8B121C331
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54699-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[web.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[web.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

> Hello everyone, look like this patch hasn't been applied. Did I miss
> something I needed to do to get it applied? If there is anything I
> need to do, please let me know.

* Would you like to avoid a typo in the summary phrase?

* Will any patch review concerns get more attention?


Regards,
Markus

