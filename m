Return-Path: <linux-media+bounces-62969-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHiLDDBqGGrcjggAu9opvQ
	(envelope-from <linux-media+bounces-62969-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 18:15:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9A65F4D7B
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 18:15:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B8C33235B05
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 16:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C2F407599;
	Thu, 28 May 2026 16:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TIohuOx9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03D940314F
	for <linux-media@vger.kernel.org>; Thu, 28 May 2026 16:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779984087; cv=none; b=sQWiZnme2PWHaOTqelmHM5+AjdkcSpzVhs1y3n6JhS58pTCIypNb0eTdKkq/e70yVY4XooD7TJ4GVLjWjDT7ks4DBzZVb45pAyC2wi36uUxtpBfVJEXst1u9yA1Tjt8Z9B9fE7s6PQNGbRPSA5BlM5VfoxjM6xNYQzJZ0Zan5A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779984087; c=relaxed/simple;
	bh=yKRDYZxonGPWacXB4kTejbeoRGtV1jkZ5NqD+ctxmlI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:To:
	 Date:Message-ID; b=U4r30SRoa3ZYO3Th/4c8ncBCrVtYPTDfdhR3tLAX1KEfRQpcY9doUPKPddLiiXwG9F5S9DvYXY/2tWtwZsKxiXhjPgTtbDwsSSCpMER+t+inbZbUYT+DIx+xqslzAkfZch+QyYS4swYEUPIh9+5LtPyydgTTKC6gr4KIhKZOuZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TIohuOx9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:382:6f:8c15:9eec:bfe9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE0698FA;
	Thu, 28 May 2026 18:01:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779984064;
	bh=yKRDYZxonGPWacXB4kTejbeoRGtV1jkZ5NqD+ctxmlI=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=TIohuOx9x6pRWHC0h9mbSdwpFY9c2wTg3TL69vDUGGGReW8N3tP4/6By2NK3x/QCy
	 M/SpViaDLA7SvFIautXQhxfFKRFK05IEncZW1i96qRmL30cCRXEGk82iaPnD94UpaK
	 OcRe8V6xFkPYsZmcUZHxG+RlzZqGRGmh4z2AoSLc=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CANiDSCunFkyGqz5n15ezW0LHCHqU92g6xeVK43zRcqohS-QsdQ@mail.gmail.com>
References: <CANiDSCunFkyGqz5n15ezW0LHCHqU92g6xeVK43zRcqohS-QsdQ@mail.gmail.com>
Subject: Re: Adding Linux-media to Sashiko
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Linux Media Mailing List <linux-media@vger.kernel.org>, Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 28 May 2026 21:31:18 +0530
Message-ID: <177998407808.933414.10133969094530331086@freya>
User-Agent: alot/0.13.dev20+g31692a239
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-62969-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: AA9A65F4D7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ricardo,

Quoting Ricardo Ribalda (2026-05-28 20:41:56)
> Hi
>=20
> As we discussed in the media summit, I just created the Pull request
> to add linux-media to Sashiko.
>=20
> https://github.com/sashiko-dev/sashiko/pull/224

Thank you. Does the cc option mean the list will get emails from Sashiko as
well?

I thought the consensus during the summit was to keep the replies only to
the author (and maintainers can check sashiko manually) but maybe I'm
misremembering it.

>=20
> Please let me know if something does not work as expected
>=20
> Regards!!!
>=20
> --=20
> Ricardo Ribalda
>=20

Thanks,
Jai

