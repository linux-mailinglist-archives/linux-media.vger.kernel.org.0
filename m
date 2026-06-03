Return-Path: <linux-media+bounces-63543-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aPsBAhPsH2rFsQAAu9opvQ
	(envelope-from <linux-media+bounces-63543-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 10:55:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67275635E64
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 10:55:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BEKYEpk5;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63543-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63543-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9330630B8578
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 08:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4FD9423A63;
	Wed,  3 Jun 2026 08:51:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D6F31352B;
	Wed,  3 Jun 2026 08:51:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780476699; cv=none; b=SnPRyLanTWtPuSXdJRiAShU+3IyRlxsv39IHa3AXqH1+GrEVvu1avx8KL7LwhddcUqp7SjXENkRG+I/TwDKXnPvwQixL/hG/BZ8qvZoUmfGBTvbIA5svEry7MEQBXxlcB/mrzTiVTw+RtW1SHhBTlEtgme4D356yn3Wdn663QM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780476699; c=relaxed/simple;
	bh=sLCb58xHcmUPPHSuiF6yEHJYQdG2XeWO0/DadmKfVGc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gfCumiw4kc4lI5jcHKABOQFv+92b6b7ZSo963+56gudC+b8Gw09zhQgDLPx7EDitVriE07uAzurBkEByujVO5YUvYeG2j7HELtsw0vIx34LzvPIAZIXieiNHmEjP39hDqsefX7Mywo+6xVNeedbau0B5lzFzWakfGEhIKYB81cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BEKYEpk5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFAAE1F00893;
	Wed,  3 Jun 2026 08:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780476698;
	bh=ky+0PlcbE3OJcEuQIILClQcfknl4nIFL032gCd7KIqs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BEKYEpk5l7DZe9W2+zJ+QI8V6kShMNt2EV0GHN1pe9/FdTwvC6THTNJ98+J50etYf
	 HaF5yRnzTZdZaL7BytOxp4/JsaUrUKShp6L6Y3BRMrF+8+qtuqG2it52GtQuK3Jlgl
	 jCV/qtdLu6dXCsHSSn3/r/UA8NL6e8dPIX5RkOGb5WmleqDANCYirx7eH6TTLGxKrc
	 qzLZs8fXrFNT6HiTmVU/k14jGpJkKg3ZBTlR4AAPQUtD/Fq0QDpCpcRa9lZqrWaxFI
	 6zLCKdFZEDPpyinfyVZzu9r6w7t5cs5yu+zP3OKxKWP0A45sBwYqhIhwTwqgdC3slt
	 BYQVZZxCo++xw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 06/14] media: mediatek: vcodec: define MT8196 vcodec
 levels.
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260603084045.17488-7-kyrie.wu@mediatek.com>
References: <20260603084045.17488-7-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 08:51:37 +0000
Message-Id: <20260603085137.CFAAE1F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:email,sashiko.dev:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,smtp.kernel.org:mid,lists.linux.dev:replyto];
	TAGGED_FROM(0.00)[bounces-63543-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:kyrie.wu@mediatek.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 67275635E64

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch introduces the undeclared identifier `MTK_VDEC_MT8196` be=
fore it is defined, causing a compilation error and breaking `git bisect`.
--

commit 918de5bcb94623dd2782fada54c8dcb18dc11b48
Author: Yunfei Dong <yunfei.dong@mediatek.com>

media: mediatek: vcodec: define MT8196 vcodec levels.

The patch updates various vcodec control configuration functions to add
support for the MT8196 chip by setting the maximum profiles and levels for
H264, HEVC, and VP9.

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_d=
ec_stateless.c
> index ab1894fba0d90..472ece5713a56 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> @@ -577,6 +577,7 @@ static void mtk_vcodec_dec_fill_h264_level(struct v4l=
2_ctrl_config *cfg,
>  		cfg->max =3D V4L2_MPEG_VIDEO_H264_LEVEL_5_2;
>  		break;
>  	case MTK_VDEC_MT8195:
> +	case MTK_VDEC_MT8196:

[Severity: Low]
Does this introduce a build break for git bisect?

The MTK_VDEC_MT8196 identifier appears to be undeclared at this point in the
commit history. While it is fixed later in the series by the commit "media:
mediatek: vcodec: add decoder compatible to support mt8196", using the
identifier before it is defined will cause compilation errors and break git
bisect.

>  		cfg->max =3D V4L2_MPEG_VIDEO_H264_LEVEL_6_0;
>  		break;
>  	case MTK_VDEC_MT8183:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603084045.1748=
8-1-kyrie.wu@mediatek.com?part=3D6

