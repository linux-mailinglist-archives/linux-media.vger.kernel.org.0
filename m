Return-Path: <linux-media+bounces-63544-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oI+yH0rrH2qUsQAAu9opvQ
	(envelope-from <linux-media+bounces-63544-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 10:52:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A8E635E04
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 10:52:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Z7biAZcS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63544-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63544-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73BE830177A6
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 08:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4AFC423164;
	Wed,  3 Jun 2026 08:52:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C95407565;
	Wed,  3 Jun 2026 08:52:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780476726; cv=none; b=C6biKdceOhf9qoR/P1JHLso4N0NoEl93PFSN01EbyE6UAjB3gqhElquTGehu8AsiPWUTdmQ4muihXxjWom5pqPyCCYgf00FXFfpsdg6ghlZoNbZdFdrhPs/RViX8ZoNLFWiV/s/bZwFJO2Gbqbfrha399VgKxbS8wLDvOGgXwY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780476726; c=relaxed/simple;
	bh=lLpMEY8rPC+V6uZFgKvuivl8KgRm8XYK+sYs8iK9YTY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iDXIDdebPC1xFZeE5tTKuJysIAXztMh0s9k8pWDIVLQMphBMBE/ZYbVY5LDYH9NGOWvoYorwWiuGNdsVrrwoGXLYKsUXyias5WSHagFa9BIn79EoU7WI11X2ytJ/42vkHQPYgmMTp8rg2KL5oiWjlR9F72GRiMZpwqcNobXPQwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z7biAZcS; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CFAC1F00893;
	Wed,  3 Jun 2026 08:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780476724;
	bh=bew7G2OKTrppOw4VMKrdHkE0XCyHyDdVA93evYg7rsA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z7biAZcSt+Xc2Rn+lbz1uqJf0Yd8gzCMoW80genMzF8jzSjilbrplIPAEKsig7w1v
	 GHu8dw0EgMRa8NUhQTq/WtUfXSM4VHPB0eq4thcKBde0cyljSZvsQo0KY9dOnsJ7I0
	 Sk37RF5LVonmVXg+/02vsN4Cf4w1SRQrM360srYCAoKnXZc749gf36TI2/mH9SUA++
	 NTN/vfV3gNygw2NyZ+VnEwnS9tIxKfaXhWRrwu2G72XpP3hIPtMdQmcmk+8Bm3qc/4
	 mUHCBQghFbT+Ujj/oRfOkSwPleIidGmD8Cr+/Q9l295ruUynTODhGN7GbClQPWMeGD
	 2rr8IT9X6MdoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 07/14] media: mediatek: vcodec: support 36bit iova
 address
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20260603084045.17488-8-kyrie.wu@mediatek.com>
References: <20260603084045.17488-8-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 08:52:04 +0000
Message-Id: <20260603085204.6CFAC1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,mediatek.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,smtp.kernel.org:mid,lists.linux.dev:replyto];
	TAGGED_FROM(0.00)[bounces-63544-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:kyrie.wu@mediatek.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:robh@kernel.org,m:linux-media@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9A8E635E04

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch references an undeclared identifier `MTK_VDEC_MT8196`, ca=
using a build failure and breaking `git bisect`.
--

commit 1d69905fbcb6b87b34af91dd5fb8d705e10184c1
Author: Yunfei Dong <yunfei.dong@mediatek.com>

media: mediatek: vcodec: support 36bit iova address

Need to set dma mask to support 36bit iova address for decoder
hardware can use 36bit address to decode for mt8196.

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.c
> index ce17b649022f7..68759db6f8d1c 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> @@ -390,6 +390,13 @@ static int mtk_vcodec_probe(struct platform_device *=
pdev)
>  		return -ENODEV;
>  	}
>  	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
> +	if (dev->chip_name =3D=3D MTK_VDEC_MT8196) {
                              ^^^^^^^^^^^^^^^

[Severity: Low]
Does this code compile on its own? It appears that MTK_VDEC_MT8196 is not
defined in this commit, which would cause a build failure and break git bis=
ect
at this point in the series.

> +		ret =3D dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(36));
> +		if (ret) {
> +			dev_err(&pdev->dev, "Failed to enable 36-bit DMA: %d\n", ret);
> +			return ret;
> +		}
> +	}
> =20
>  	dev->fw_handler =3D mtk_vcodec_fw_select(dev, fw_type, DECODER);
>  	if (IS_ERR(dev->fw_handler))

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603084045.1748=
8-1-kyrie.wu@mediatek.com?part=3D7

