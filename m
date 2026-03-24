Return-Path: <linux-media+bounces-56858-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGSZHWFswmmncwQAu9opvQ
	(envelope-from <linux-media+bounces-56858-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 11:50:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1C3306BA4
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 11:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4E8A13052B3A
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 10:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BBE63DF00F;
	Tue, 24 Mar 2026 10:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="tC5l6HP3"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D09368263;
	Tue, 24 Mar 2026 10:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349286; cv=none; b=p4UpwGWa3CS4CeBz+RZZOy3jDRNIwxQq0vGwQ+Wfa7Sof1/f8A1e32P5vcULZtCAP58wrjJf9coDUzFsUxGwRQX+Y19SHdNgfSPC5dbdRvNLpkbgc1oHBJEbwcyV5jq4fY6r9mSu3pdXuS/efUFojKgQXJB0C80zyfYvq+q9xbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349286; c=relaxed/simple;
	bh=bvugwOsYzdCiC4AmqAAtjpl8aP0zT5C+UvbRlVXlYg0=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=fK+78SI2/UCVHc5fBh35PhMIoNIkR2z/CfpYDGqbqbcUigrPXOzodg5QLmT/UqGAYKNF2zmOdX807nbTnzAaFiKjihKT291vFOc2lveG+k2JeqIcjOVk/hOqKZoFbhcb3COgfn4y9Me7ahDVcC3/MJJg0fQ0yNRqmfghRHON7iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=tC5l6HP3; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1774349261; x=1774954061; i=markus.elfring@web.de;
	bh=/OIsT4nzDn1PdEC96pBB8BnDB5Wy+ADVHf0A2Opv9JU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=tC5l6HP30eXDutW6ODaJgU8BUE/SeSXXw9LiGH99x39qEDfC6PJWRaJjqH/EEQvF
	 9p1IzKIaOLfYSN9NqXF/CGM1SA+Z1RC9m9UXQm+m82eZEhrdEMQfOg15cdK8zsxu0
	 LOyeK+v9VZLU6ZQDgF42TO5HxcwLXgRKIzKUMSOUZy2Gujg4NGU1Fpml9hWqu+/Uh
	 gs3kENQYgk3viwceAQ2NiNEid9yY15XBvMeQleUQgnqZtORx71qcmzxRA11Of00S4
	 kufnNpkMsmMB1pWgAQp0Ilui4QEYNNKU9LyH/yS0czDKcQSENEi7cd5Mp8KwBArC4
	 3J031CJgmnwBwTpslQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MfKtb-1vcFzK212h-00ptfY; Tue, 24
 Mar 2026 11:47:41 +0100
Message-ID: <ef04338e-6139-40b2-84a5-a627bb344a86@web.de>
Date: Tue, 24 Mar 2026 11:47:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wenyuan Li <2063309626@qq.com>, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, gszhai@bjtu.edu.cn,
 23120469@bjtu.edu.cn, 25125332@bjtu.edu.cn, 25125283@bjtu.edu.cn
References: <tencent_4F74E32262ADBA5C903DA759F45788147D0A@qq.com>
Subject: Re: [PATCH] media: tuner: add error handling for I2C transfers in
 set_type()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <tencent_4F74E32262ADBA5C903DA759F45788147D0A@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3iz4IyduJzS1T1rurInQjEOfn6oYZDwgvwLV2QueV1CJRImuT4e
 o1qU4kuVrzUQBz/feXkYGwOKCSvgr64Byu5F+Tsm4BjocsbGMLC98gIGylg3RJxe1bTvaUo
 tthPHcLz4zfw4Sam+aqmfD73xI9LYjPo7BHihRF+OTgKolCSkYpMsIzAiAQa7xnxEorBe9V
 KjYwlxK5tnf8fiEdLVkMA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2NsQ4SV8S08=;3gDbAy9ZJmljU+wDwBs0txd221g
 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
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56858-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[qq.com,vger.kernel.org,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[web.de:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[web.de];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3B1C3306BA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> In set_type(), multiple I2C transfers are performed to initialize
> certain tuners (FMD1216ME, FMD1216MEX, TD1316). However, the return
> values of i2c_master_send() are not checked.
=E2=80=A6
                              calls were?


How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?

Regards,
Markus

