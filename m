Return-Path: <linux-media+bounces-51120-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DsSM5JXcWkNEwAAu9opvQ
	(envelope-from <linux-media+bounces-51120-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 23:47:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5427F5F02D
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 23:47:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9D62688ACD0
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 12:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B5E7428460;
	Tue, 20 Jan 2026 12:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="vLo/9AV/"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B663E421A0D;
	Tue, 20 Jan 2026 12:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768912725; cv=none; b=NgCXh2jomV0NGzT6eHEXFpzLvSexR0+fosBwznOqa8Ege0xV5DxukA8SD3z8tcutqGTAFwt2lPbfP2MoMDjzc6adHQGW3SOopViCvnGtf0BhpaPXvTyZkqKsVZ5uTZZ0VGaqD8mVshmXVvS1trAK5VyYXljYqXZn0+/uT15JQ0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768912725; c=relaxed/simple;
	bh=fFvRh5AMXPSGcJh6xJrHxwpwVlnGHpk0TlMYQmI2hGU=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Ao5S0A7l5BTAZgA7PPBwKNNtzOVF7yBHoIbji7nn2+FClgqzQpzHR8ArnZICUeXNAN3x1xO/sdSitAeSG4j/LPqE/eRUR+xzLW0y/E38YODKLDK0/cIvVtfe+0Rm7VZMB0uCUheX3CKd3opLTGWemDeSwLh0j5LMCA1wmq6FguY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=vLo/9AV/; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1768912714; x=1769517514; i=markus.elfring@web.de;
	bh=fFvRh5AMXPSGcJh6xJrHxwpwVlnGHpk0TlMYQmI2hGU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=vLo/9AV/5nYrWg0KIHkoeGfteXtIcEUDZdBm1E/j179GCYrlqH8ot3Kq62Uozw9H
	 66J4yMHoixdRUX41SBsgPZrm+oKtOScYR60VBoAeNCNRrqeU2nWb0ZbcxjzyemceN
	 /oI/yjhJ7AOSzVOiR8Fp8Yr0jVmE1js6RmbEIaordjfot6Ib/EBVc16L592E3HZQA
	 Cdam0AXoYn59FQlW50iaptIjotE1tvAdwv0q11etwfe+sWDqsixaFd0/g9zIPro+z
	 0lAecYEN0I0SdvfofphKKATvzQvjGqRLSvzR9zkLaL4py0uLKDqTLaYyaXwK1RvgM
	 1xDdRukRusBC0HeoWA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.179]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N4NDQ-1vpM2038Bq-00xlna; Tue, 20
 Jan 2026 13:38:34 +0100
Message-ID: <88dbfb85-571a-4f65-8879-16972dd87bbd@web.de>
Date: Tue, 20 Jan 2026 13:38:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gui-Dong Han <hanguidong02@gmail.com>, linux-media@vger.kernel.org
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Jia-Ju Bai <baijiaju1990@gmail.com>, Hans Verkuil
 <hverkuil+cisco@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20260120121105.8959-1-hanguidong02@gmail.com>
Subject: Re: [PATCH v2] media: dvb_demux: fix potential TOCTOU race conditions
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260120121105.8959-1-hanguidong02@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Z70AER369cqfOE6gOP+yDyRgsvSRLPEvgj2srIxvZOdULTw5PFJ
 LO6Q7zY2GDUhTA/8uDCQ7R/ep4lQRie2VzmPG7hJIEjJSVkhVUVpuVJk0rGctrCfH2yE3LL
 stdGXSCVFkw4A/hTkpkLsSgNC0u+Efxc5ePC/B9gQRGo0WVeeJNPNpz1m4mgyVSGGOXsBG2
 geA2a04yh8O8ouCq54aDg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WQRRH3U+ZOg=;pRBI6lsaMS0+MRTkNekFahb3gE6
 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
 2nUV5EWilMvPLPIi17xEvLRExd6sR
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.96 / 15.00];
	DATE_IN_PAST(1.00)[34];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[web.de,quarantine];
	TAGGED_FROM(0.00)[bounces-51120-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[web.de];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[web.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,bootlin.com:url]
X-Rspamd-Queue-Id: 5427F5F02D
X-Rspamd-Action: no action

=E2=80=A6
> Fix this by extending the lock scope.
=E2=80=A6

How do you think about to increase the application of scope-based resource=
 management?
https://elixir.bootlin.com/linux/v6.19-rc5/source/include/linux/mutex.h#L2=
53


> This possible bug was found by our experimental static analysis tool,
> which analyzes lock usage to detect TOCTOU issues.

* Do you refer to any other source code analysis approach than LR-Miner?

* Will any additional background information become more helpful here?


Regards,
Markus

