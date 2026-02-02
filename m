Return-Path: <linux-media+bounces-51961-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPbMHlRPgGkF6QIAu9opvQ
	(envelope-from <linux-media+bounces-51961-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 08:16:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA89C91F4
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 08:16:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04EDB3033504
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 07:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0184430EF69;
	Mon,  2 Feb 2026 07:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uTP8CjO3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A9C30C61B;
	Mon,  2 Feb 2026 07:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770016222; cv=none; b=nxPEm60M/r93qz6IjxoFDfs+7f8d0rFDNb1UM8/XZIDhCuqhrHxJdh6XZEQzjB/PMUZ36zSsD6SuSDetodmNiDBACa20wQZLjnAAiLma7B+dvE+Q51G79j8n4iQLUxQWKJKqekvfmO5YFeIuqq1KXSMRmq3c/Prvf0/AHtqHSLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770016222; c=relaxed/simple;
	bh=YZ/tewcWhRsJNqjs4UcG4vhy52VFy5OBEayFPeVwgqY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=HRMXf6oGbOI2l9unX3wmSLCUHdjANB7xuuAJm+LcVsmFIJzoIAuuHLOdr05XTLM6wMQxRWsNqRMKLcRGFPpV+BrHO5ouU1LH2fHPhNskLowSoPbDjpNCGB7IYo1MgztBxAgbo3qLzSIOoBiL3ZfLxcOGpWCC0AgtXvINZ7oF6oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uTP8CjO3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:86fa:bf02:d5f1:808c:8622])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 814F8591;
	Mon,  2 Feb 2026 08:09:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770016178;
	bh=YZ/tewcWhRsJNqjs4UcG4vhy52VFy5OBEayFPeVwgqY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=uTP8CjO3nbEmZpnco1Qid4dhHFRYhBaIIjY2cufDhjC/BSgN+MUnhcfrXEcYHyKzy
	 OaDISBxe7TKAw9lR2ksbov5VETbdfHqS7837JM7d6E19/hiN4oTP1b0NIrBlEGqnoI
	 Zf5JFWmEgdK0w1lSWJocT2HJELTCfi5TomzjQ24A=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260130204628.312246-1-gascoar@gmail.com>
References: <20260130204628.312246-1-gascoar@gmail.com>
Subject: Re: [PATCH 0/2] media: bcm2835-unicam: remove mentions to dropped driver
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: gascoar@gmail.com
To: Gaston Gonzalez <gascoar@gmail.com>, bcm-kernel-feedback-list@broadcom.com, florian.fainelli@broadcom.com, kernel-list@raspberrypi.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, mchehab@kernel.org, rjui@broadcom.com, sbranden@broadcom.com
Date: Mon, 02 Feb 2026 12:40:12 +0530
Message-ID: <177001621293.9154.11573744143973861807@freya>
User-Agent: alot/0.12.dev62+gb9d6144a6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51961-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,broadcom.com,raspberrypi.com,lists.infradead.org,vger.kernel.org,kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DAA89C91F4
X-Rspamd-Action: no action

Hi Gaston,

Quoting Gaston Gonzalez (2026-01-31 02:15:39)
> The driver bcm2835-camera was dropped in commit <90204a38a760>, but it is=
 still
> mentioned as a current driver in a comment and in Kconfig help text in
> bcm2835-unicam driver.

My bad, I missed the non-code mentions of bcm2835-camera while dropping it.

For the series:

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

>=20
> Remove these two references to the dropped driver.
>=20
> Gaston Gonzalez (2):
>   media: bcm2835-unicam: remove obsolete comment
>   media: bcm2835-unicam: remove reference to dropped driver in Kconfig
>=20
>  drivers/media/platform/broadcom/Kconfig          | 5 -----
>  drivers/media/platform/broadcom/bcm2835-unicam.c | 4 ----
>  2 files changed, 9 deletions(-)
>=20
> --=20
> 2.52.0
>=20
>=20

Thanks,
    Jai

