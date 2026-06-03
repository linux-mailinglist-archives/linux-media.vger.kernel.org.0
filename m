Return-Path: <linux-media+bounces-63493-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OiVcMkjOH2qLqAAAu9opvQ
	(envelope-from <linux-media+bounces-63493-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 08:48:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A44634CF4
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 08:48:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=H4b3Nn73;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63493-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63493-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43C7A3113509
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 06:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB873803D2;
	Wed,  3 Jun 2026 06:41:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0E43659EB;
	Wed,  3 Jun 2026 06:41:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780468918; cv=none; b=kL8mlPkDQutyZqUTzwd4QNOSf38xssDdfqItHxQpAbwIP48DBQhsASGq3pewlsLXDRntmFWOIeqsh0UvOkuTWeS7Qpl71MYT6GzYzAJiT6zHuQ5sajL+X38UyGv+qntsE5zkMdl1N+MjYdtPD2kTTdWpZGT+H7vKccBX/rTpfHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780468918; c=relaxed/simple;
	bh=q3QoO4/fdcnDdKNPMUrRwhJUlgJyK+9LTYw9k+mqm7A=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Jf9wmRGqRJi/2g2s4C8/KYlEN1esbBR4lbnxAQgyskEV+43LwDx0ZNJt8bIMrMKzxgrpKW1aKKGGAnJcnjY3BiNmgjbD2MT3IfK+rXGVVc+5q0N24nrrPsfRFCNT2Rre8QMI9NOlNQ6JFxZ3+s4jR+5QHLX5EusICHxhst6T8qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=H4b3Nn73; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:476d:c684:fe78:389f:7375])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 936BA929;
	Wed,  3 Jun 2026 08:41:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780468891;
	bh=q3QoO4/fdcnDdKNPMUrRwhJUlgJyK+9LTYw9k+mqm7A=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=H4b3Nn73S5ABwcHogJ20oGDXD/c7CBvkmU5CptPoMsvUnpT9mVXp+3MFrvks0hfLT
	 BNgATXhTYlguJ8CH9hsTMVgpUlWQJWdQsaAhqG+6Ctxbwpo4ulGS0g5ybJkO8w75Fw
	 uRuM7y72YI99rQBVlsv+E9l5g3YZC8A4EEohAB3o=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260514193148.2357371-1-ingyujang25@korea.ac.kr>
References: <20260514193148.2357371-1-ingyujang25@korea.ac.kr>
Subject: Re: [PATCH] media: rp1-cfe: Use IS_ERR() check for media_entity_remote_source_pad_unique()
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Florian Fainelli <florian.fainelli@broadcom.com>, Ingyu Jang <ingyujang25@korea.ac.kr>, Mauro Carvalho Chehab <mchehab@kernel.org>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 03 Jun 2026 12:11:48 +0530
Message-ID: <178046890878.1525445.10660936368234203663@freya>
User-Agent: alot/0.13.dev20+g31692a239
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bcm-kernel-feedback-list@broadcom.com,m:linux-media@vger.kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:florian.fainelli@broadcom.com,m:ingyujang25@korea.ac.kr,m:mchehab@kernel.org,m:kernel-list@raspberrypi.com,m:tomi.valkeinen@ideasonboard.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63493-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:from_mime,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,korea.ac.kr:email,freya:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 28A44634CF4

Hi Ingyu,

Quoting Ingyu Jang (2026-05-15 01:01:48)
> media_entity_remote_source_pad_unique() returns either a valid struct
> media_pad pointer or an error pointer (ERR_PTR(-ENOTUNIQ) or
> ERR_PTR(-ENOLINK)); it never returns NULL. The current NULL check
> therefore never triggers, and the "pad not connected" error path is
> unreachable.
>=20
> Replace the NULL check with an IS_ERR() check so the validation
> actually detects malformed media graphs.
>=20
> Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>

Needs fixes and Cc to stable,

Fixes: 6edb685abb2a ("media: raspberrypi: Add support for RP1-CFE")
Cc: stable@vger.kernel.org=20

With that,

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

Thanks,
    Jai

> ---
>  drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/m=
edia/platform/raspberrypi/rp1-cfe/cfe.c
> index 8375ed3e97b9f..91e9fa0341e06 100644
> --- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> +++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> @@ -1779,7 +1779,7 @@ static int cfe_video_link_validate(struct media_lin=
k *link)
>                 link->source->entity->name, link->source->index,
>                 link->sink->entity->name, link->sink->index);
> =20
> -       if (!media_entity_remote_source_pad_unique(link->sink->entity)) {
> +       if (IS_ERR(media_entity_remote_source_pad_unique(link->sink->enti=
ty))) {
>                 cfe_err(cfe, "video node %s pad not connected\n", vd->nam=
e);
>                 return -ENOTCONN;
>         }
> --=20
> 2.34.1
>=20
>

