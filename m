Return-Path: <linux-media+bounces-64037-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EJosFcroJGpWBgIAu9opvQ
	(envelope-from <linux-media+bounces-64037-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 05:43:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D28B764EC16
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 05:43:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=miBfHbCy;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64037-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64037-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9014A3016D3B
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 03:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E4236C0CE;
	Sun,  7 Jun 2026 03:42:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08394273D9F;
	Sun,  7 Jun 2026 03:42:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780803772; cv=none; b=IhHVQfzwBljf4eGy+pUJajucI8ZAboPV0YuM2gtvswh3eNLzIu7180cf9gjXu0m1reM3LhnjTLWEE/4Zxf8Yp8KHrL+UP5c77e/7B4cywybni2UtT1EAPLfntUmgywRn8EVKUCfBQNjbNjg42ZVbw37eVgwnWmwxOYACMqS/qao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780803772; c=relaxed/simple;
	bh=WzsLg7Z9qC8yOvkZpd9qvN1UgwK29122xoI8S1PEp54=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ZtmsqotCHHctZ6y5QojBvP9MrKig3Wr/5Ljv09/4j+p3aJu32/zIf09f25BTVvcY/Y3fRyBlTTqobJAJ7rKlSwQHv1t8pTL++E8fzEa0mt1fZDyqM7MTM/Chx6Qzd7R7MlfTD9MfetqDCjjQXAn1FGUj7w7GzQpDZaONiP97vOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=miBfHbCy; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:476d:c684:fe78:389f:7375])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C8156A6;
	Sun,  7 Jun 2026 05:42:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780803743;
	bh=WzsLg7Z9qC8yOvkZpd9qvN1UgwK29122xoI8S1PEp54=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=miBfHbCyZGRu8C4CWPM5CXmZr7rkKp8Nt6tsUAgU0jbvtrP5EMVYH8uy1bdPQ5jMO
	 NhLjW5jnH6W2q9CTj4T9drJDD87jSfI8IdkKGZQJc8nNftZIXezO4SLIH3LHGrKtw1
	 8/TY+OjIJYdmcWH3VTwnfQYgs79PFhamHUEZmmdQ=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260522-bcmpipm-v2-1-a3da66cbc9f0@kernel.org>
References: <20260522-bcmpipm-v2-1-a3da66cbc9f0@kernel.org>
Subject: Re: [PATCH v2] media: bcm2835-unicam: Fix log status runtime access
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Eugen Hristev <ehristev@kernel.org>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Eugen Hristev <ehristev@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Hans Verkuil <hverkuil@kernel.org>, Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Ray Jui <rjui@broadcom.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Scott Branden <sbranden@broadcom.com>
Date: Sun, 07 Jun 2026 09:12:44 +0530
Message-ID: <178080376439.9570.13838570363760506422@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:naush@raspberrypi.com,m:linux-media@vger.kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:ehristev@kernel.org,m:bcm-kernel-feedback-list@broadcom.com,m:dave.stevenson@raspberrypi.com,m:florian.fainelli@broadcom.com,m:hverkuil@kernel.org,m:jeanmichel.hautbois@yoseli.org,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:kernel-list@raspberrypi.com,m:rjui@broadcom.com,m:sakari.ailus@linux.intel.com,m:sbranden@broadcom.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64037-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D28B764EC16

Quoting Eugen Hristev (2026-05-22 20:58:50)
> When requesting log status, the block might be powered off, but registers
> are being read.
> Avoid reading the registers if the device is not resumed, thus also avoid
> powering up the device just for log status.
>=20
> Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 ca=
mera interface")
> Signed-off-by: Eugen Hristev <ehristev@kernel.org>

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

> ---
> Changes in v2:
> - changed to use pm_runtime_get_if_active()
> - add corresponding put()
> - Link to v1: https://patch.msgid.link/20260521-bcmpipm-v1-1-3eba88d88045=
@kernel.org
>=20
> To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Florian Fainelli <florian.fainelli@broadcom.com>
> To: Ray Jui <rjui@broadcom.com>
> To: Scott Branden <sbranden@broadcom.com>
> To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadc=
om.com>
> To: Sakari Ailus <sakari.ailus@linux.intel.com>
> To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> To: Hans Verkuil <hverkuil@kernel.org>
> To: Naushir Patuck <naush@raspberrypi.com>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: linux-media@vger.kernel.org
> Cc: linux-rpi-kernel@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org

[snip]

Thanks,
    Jai

