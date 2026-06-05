Return-Path: <linux-media+bounces-63880-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id e/+nMeqLImrzZwEAu9opvQ
	(envelope-from <linux-media+bounces-63880-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 10:42:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 520CA6467B1
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 10:42:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=PXb+GPt8;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63880-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63880-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 291F33013A51
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 08:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8C73CD8D3;
	Fri,  5 Jun 2026 08:29:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7341E3C062D
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 08:29:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780648170; cv=none; b=PkTTgHK1UwJcOJwKO6nGW3ctfMQLTi5VCMnjExRlKfVlPz/CJimtVLcfawL8rw9sw5z4XX0WGGzvVfntzqB4/XqJaLq7dJF4WPUEreFXW56NZL8qQxW/XLGPEfI3Ay5RZ9PmbEV6LoRomrVhWQpUXxVnXsRsG6jb9CECLhEwN90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780648170; c=relaxed/simple;
	bh=MV+PjOx58Vq7EmMRcMcCm3SFzpnWKrn66vShyqWj3rs=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=cnCsyyodtkQ0NSE39JVhpee6vPTAbrhdCooM73V5DHVBfUYYn76PwIKasRfaGsscM2MaMV65RWNATcdgjU1icsBoc+FvoEgBE8s7Lmhs8wTOeCQ/9suStfl+D6F/DPwcYRZR1d4i9QkfHpXMsWILwyavpye6JDKyWqW18MPhn9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PXb+GPt8; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 53FDDC58471;
	Fri,  5 Jun 2026 08:29:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B48A35FED1;
	Fri,  5 Jun 2026 08:29:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A6254106A16CE;
	Fri,  5 Jun 2026 10:29:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780648164; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MV+PjOx58Vq7EmMRcMcCm3SFzpnWKrn66vShyqWj3rs=;
	b=PXb+GPt8T2483LQBm5RhlGucJ2Rnf/U6vVgxKqL2jVRRGsR20ad9A8LOfIwZBmxmA1RKIp
	/f/hDj8BaZk2rhUkU0ImBnA0ucsZ1suq2FLYvgWL7CjEW1wRsu2bMDuJKBa1KL2qr3VgGF
	jk1cKlir0cO/43KgLFO704EWXx0WvvJ12y+mxrSXWlKkgqxi0j39CTBxR/Yy0gq2dOYYSE
	seEwWdm+7nRpjnPqQlWiv4+sIWzJSbFTWxQfpETHZo2+tuuGgEkTMtJ8/78uIOG9lXTmWw
	QGEXfcdlpsROCM1eecFAXKM5T2w7/4/C0907xoQpuce1zEak+GSMe2Ib4BGk5Q==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Jun 2026 10:29:21 +0200
Message-Id: <DJ0Z3CCLRGGD.1OA7X9AZX5P03@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 1/1] staging: media: tegra-video: vi: Improve media
 graph building logic
Cc: <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
To: "Svyatoslav Ryhel" <clamor95@gmail.com>, "Thierry Reding"
 <thierry.reding@kernel.org>, "Jonathan Hunter" <jonathanh@nvidia.com>,
 "Sowjanya Komatineni" <skomatineni@nvidia.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Hans Verkuil" <hverkuil+cisco@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0
References: <20260523064750.35553-1-clamor95@gmail.com>
 <20260523064750.35553-2-clamor95@gmail.com>
In-Reply-To: <20260523064750.35553-2-clamor95@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63880-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[luca.ceresoli@bootlin.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:clamor95@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:skomatineni@nvidia.com,m:luca.ceresoli@bootlin.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:gregkh@linuxfoundation.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,nvidia.com,bootlin.com,linuxfoundation.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:mid,bootlin.com:email,bootlin.com:from_mime,bootlin.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 520CA6467B1

On Sat May 23, 2026 at 8:47 AM CEST, Svyatoslav Ryhel wrote:
> The existing tegra_vi_graph_build function relies heavily on a one-to-one
> match between Device Tree nodes and media pad links. While this works for
> simpler configurations, it causes issues when Device Tree nodes do not
> match media pad link logic (e.g., mt9m114). Switch to the
> media_entity_get_fwnode_pad helper to verify and retrieve the correct pad
> linked to an endpoint, rather than assuming the endpoint ID matches the
> pad ID.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

I still haven't looked at the code, but:

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel ca=
mera

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

