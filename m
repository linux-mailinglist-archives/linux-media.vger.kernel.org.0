Return-Path: <linux-media+bounces-61083-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gH2GHHGzAWr2igEAu9opvQ
	(envelope-from <linux-media+bounces-61083-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 12:46:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E715A50C22E
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 12:46:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F20C83023D81
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 10:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5F03DBD55;
	Mon, 11 May 2026 10:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="P2DUbgZS"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C38C3DB639;
	Mon, 11 May 2026 10:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496181; cv=none; b=gG74eQA0tOjWZMXbIsnJaJ+CkMA/n9mmVN39g5avsHZNif0CExlYcEFiRhdp8H8UV5ctKBzlYPsNA3jHA2k0NSugdO6XN8tZQnuxAwldagzUGjKGF6/5COq/Vjx2HFfbtEm6N1RZ91F+DYywUw5cltEDAqUkVPzAh6YURU6NsZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496181; c=relaxed/simple;
	bh=c2NhV/V5ArhiHcJnGLt7+hTyK2WILCNVFOJKPpZlTdY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=hgx0nizAKC/tATbon2dL0Zp31mA/PYrq1ee2P2RL/q61+3/gg4jERi/kaIuzHk3bz6V64SYF9gl3PXbRnEQIRISCPgMDF7kA4KXDd7l8GnqSgD3x1Qe5C3DsTeZO90mu91WpLowQXMdHxkpbl9OdrIcoNksjYzDKFwe1WkArmQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=P2DUbgZS; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1778496153; x=1779100953; i=markus.elfring@web.de;
	bh=c2NhV/V5ArhiHcJnGLt7+hTyK2WILCNVFOJKPpZlTdY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=P2DUbgZS5bPkZgCx+PULe3+WKkbfAPr0cD2DjJdb6drKBTLh4zYFE412rjpajdC2
	 jVO7suyUKeViuT9JqHwhRHtnPGzdNBNhVw8e+RPY5jZCmdptkVYBzsYCbhjbMOHZJ
	 zCdzZvKxEPn2NU27QXqdc+v7U9wZr7R8tkUBmAd7ABplOK/BesygUmpZhPjGV/RlM
	 G147RYctBF/CUXHoHMHh4eoCq3169nh64tgBwoRQAUNNPCFdUrk2aN0tGro7FDiDG
	 WAEbEcmEAL1UB+4L+QwSUTLNEnDEN/8r6HEFsEx7RhD1TgTrNjElXj/XPA9tWtMwa
	 0H4Ku1fkRfcHXZbJJQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MGxQX-1wZoEN3pIZ-0055H7; Mon, 11
 May 2026 12:42:32 +0200
Message-ID: <6b9e3d33-5e8d-4751-9ae7-5c748bcf3b58@web.de>
Date: Mon, 11 May 2026 12:42:29 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Pengyu Luo <mitltlatltl@gmail.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, kernel@pengutronix.de,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Hans Verkuil <hverkuil@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Martin Kepplinger-Novakovic <martink@posteo.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260511090924.269106-3-mitltlatltl@gmail.com>
Subject: Re: [PATCH v3 2/5] media: hi846: fix link frequency handling
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260511090924.269106-3-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:80HzGa3+fQLV3FJ3QcF3YVpzStBmG5jQ8bKZvpdDC1gsW94iccI
 yny6QI8Uem8ouexuTw33OLN8a7KMCHuGTHJMA32uCg4Qw5or1FiUO7qwKUgNA5IrZ5HtuB+
 bBb0hEyrIcnG7kcfIkgJWEOIUPzZSpLV5FnKcReMIXa/3gRw8AQkjzxP0RlAfx6bWF1RwJX
 OGw14kJ9u/EiPOIPBn+eg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xic/af5enp0=;d/WFWGLCsRYeFnDSw/mqulyXI4z
 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
X-Rspamd-Queue-Id: E715A50C22E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61083-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,pengutronix.de,kernel.org,nxp.com,posteo.de,linux.intel.com,puri.sm];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[web.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[web.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

=E2=80=A6
> configuration. To implement this, this commit did
=E2=80=A6

See also once more:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv7.1-rc3#n94

Regards,
Markus

