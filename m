Return-Path: <linux-media+bounces-63496-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yJeUCAXPH2qoqAAAu9opvQ
	(envelope-from <linux-media+bounces-63496-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 08:51:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C6E634D60
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 08:51:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b="d0/RtgBZ";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63496-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-63496-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C00E3028DFC
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 06:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5EB3955DE;
	Wed,  3 Jun 2026 06:51:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565DF3064B5;
	Wed,  3 Jun 2026 06:51:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469488; cv=none; b=q1RuFU4HOUBrDE63o+0HveoxjCzndwHZLWSKZyxCeTqrUtoPFrD+Ta/8Nf0xi0NrrtejjDSMJnMxRdyNAVCH1qW8L/rrK+0FHb25upF/KSbdEKDVwGyUr1qM/JcvoWDA0f/ryHo9QjRpuw9jc+13LaG0tmZ+D9anRek1UZKBDUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469488; c=relaxed/simple;
	bh=37wavJyg6SyRdh6uzGTnJBIV1BDGJHxKUDF92QE7Q6Y=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=McpeXMeBVUko2sarwNeinZwsymBTwvQSkqsntRP5jvBBomshZg9rIQP7U5D8IW1xasALUiQCAykPb3/1USFI5wKVsdz7HnfvElVl10gMm2uajFfUp2b22d/eUknrIdLMC02zqeZiynVpYtwPJW6o6+SJztdywQ6Lh1dq1GFO/kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=d0/RtgBZ; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:476d:c684:fe78:389f:7375])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 755CA12D6;
	Wed,  3 Jun 2026 08:51:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780469460;
	bh=37wavJyg6SyRdh6uzGTnJBIV1BDGJHxKUDF92QE7Q6Y=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=d0/RtgBZUkCQ7kmP+mo1Ttv+Pq6rT82bsC0HVjAR/JlJDtZWxmcE4UW3taxOPW+ye
	 zOxQBpmcYLR7rNQKegn+4vKuKUNjC3XLkmjeBfFLIoS8d83QkkAKqFuTobzCuTuIX6
	 sJkiSqS5vN1NRoqEnunNO95OX3C2MuRM/DAH+1rY=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260522065548.2438545-1-nichen@iscas.ac.cn>
References: <20260522065548.2438545-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] media: rockchip: rkcif: Fix error handling for media_entity_remote_source_pad_unique()
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: mchehab@kernel.org, heiko@sntech.de, hverkuil+cisco@kernel.org, gerald.loacker@wolfvision.net, bryan.odonoghue@linaro.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Chen Ni <nichen@iscas.ac.cn>
To: Chen Ni <nichen@iscas.ac.cn>, mehdi.djait@linux.intel.com, michael.riesch@collabora.com
Date: Wed, 03 Jun 2026 12:21:18 +0530
Message-ID: <178046947892.1525445.1023288239828130272@freya>
User-Agent: alot/0.13.dev20+g31692a239
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:heiko@sntech.de,m:hverkuil+cisco@kernel.org,m:gerald.loacker@wolfvision.net,m:bryan.odonoghue@linaro.org,m:linux-media@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:nichen@iscas.ac.cn,m:mehdi.djait@linux.intel.com,m:michael.riesch@collabora.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-63496-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:from_mime,ideasonboard.com:email,freya:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,iscas.ac.cn:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6C6E634D60

Quoting Chen Ni (2026-05-22 12:25:48)
> The media_entity_remote_source_pad_unique() function returns an error
> pointer on failure, not NULL. Fix the check to use IS_ERR() and return
> PTR_ERR() to correctly handle allocation failures.
>=20
> Fixes: 501802e2ad51 ("media: rockchip: rkcif: add abstraction for dma blo=
cks")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

Thanks,
    Jai

> ---
>  drivers/media/platform/rockchip/rkcif/rkcif-stream.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drive=
rs/media/platform/rockchip/rkcif/rkcif-stream.c
> index 3130d420ad55..542aa877919d 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> @@ -466,7 +466,7 @@ static int rkcif_stream_link_validate(struct media_li=
nk *link)
>         struct rkcif_stream *stream =3D to_rkcif_stream(vdev);
>         int ret =3D -EINVAL;
> =20
> -       if (!media_entity_remote_source_pad_unique(link->sink->entity))
> +       if (IS_ERR(media_entity_remote_source_pad_unique(link->sink->enti=
ty)))
>                 return -ENOTCONN;
> =20
>         sd =3D media_entity_to_v4l2_subdev(link->source->entity);
> --=20
> 2.25.1
>=20
>

