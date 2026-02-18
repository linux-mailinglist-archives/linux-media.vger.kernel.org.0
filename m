Return-Path: <linux-media+bounces-53028-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KyCKrFvlWmgRAIAu9opvQ
	(envelope-from <linux-media+bounces-53028-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 08:52:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 070F5153C8D
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 08:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A21E302AD11
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 07:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0E6311948;
	Wed, 18 Feb 2026 07:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="poCnTeb0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB2730F53A
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 07:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771401099; cv=none; b=oVahAoNhOLWYCYusGr1jFM7LdahiR9aXUGWphiHJOAkENGCpoSngX/2EF4e58/YaooBoNCSEPgGYqP+sdOVUTQDUz4cICCtGLO5MpTxkT/eYbvNpfjpKe92ZM4dUJCU4katNN3Ab/hDNZ+ZYbHcayKLxR0E5mrtRHVlDS9NsCeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771401099; c=relaxed/simple;
	bh=4iOIMJwTfTlhk2X+SSFRPxdpOOMqvgJljSOYKrmpsX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fYOjfTwK31XUFULdHT8JmQ3CkoGCtERpxNnw2ctJpmm4+f2YJOQtOHN1ITYwZexlhEUV11Ka3vNbzaTIC6koTX/oFF9pxw1QGY6TVEOn0xAzR45bCgrhOBgVNdXveHG+A/BHliL1wIskE1EM5lqYcfrKVw/KT8sRrnYZf4W0/rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=poCnTeb0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C72C0C2BCB0
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 07:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771401098;
	bh=4iOIMJwTfTlhk2X+SSFRPxdpOOMqvgJljSOYKrmpsX0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=poCnTeb0EiRLHjnZHKa3OTdzzF0Lor2Dktc8/g+0fzCK21yY785y2j78TDy0ydbAG
	 4atxiINHsZ/XtLw1bOnH9CMZ92SytlY9EwvvUIWnkbiGRDqynwvYGq7BDvluwnqZEY
	 W5PzOaVduDO6ZCZLchIfQdTTvAdh8zPxEcyhUkeOeTH7H6LRpXhEXQL+a3fmp2Y/eF
	 pu8uxTfsWrKLFEdaDn/WUEhtIELUzVd57DoXrbhkULNbQlk2+cysxvc4aQul5XxLDM
	 aVhAqENG+/zXyQoBomqTBZwhLMICyAmGGmsJjaZZph1pPuJdp2piYY+QA1epHg8WZL
	 /up+Yi62llWxA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38709888abeso39941731fa.1
        for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 23:51:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWkO5dbehIOKJ0t9ypL3m6I6/qwJuBrHW+MljgU5mCnwHaTBXSx6B4Zdofy43Jv6PheAq8gXDcBrunVqw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/VXxtwiwLjNald/jnbHdZ+aoFm+SdHfUbxksJUkGqBFk7y3/1
	t1ZrSawcbLMbyCUW40YBuNBK4VDivhZU8hF/m6oPMAuECo3XPXTsDEmYs7aqbuH+ZBmI5Abc9eb
	I6cv+w0BoeGyKSH8XIPyLBRaJwltt9kE=
X-Received: by 2002:a2e:b896:0:b0:382:f78d:a0c with SMTP id
 38308e7fff4ca-38846df21a4mr3400331fa.21.1771401097098; Tue, 17 Feb 2026
 23:51:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216-rkcif-fixes-v1-0-b16db20b6d68@collabora.com>
In-Reply-To: <20260216-rkcif-fixes-v1-0-b16db20b6d68@collabora.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 18 Feb 2026 15:51:24 +0800
X-Gmail-Original-Message-ID: <CAGb2v65F9OHNdLA2e3HXNiHEUQyW3-zjQGRZE_w5jU6+w5TbMw@mail.gmail.com>
X-Gm-Features: AaiRm51oWyNatKqHz1nRPBR6_xQMPfJe9Uf0NpOZA7cz-bzmXYkXqyvq3n9ru28
Message-ID: <CAGb2v65F9OHNdLA2e3HXNiHEUQyW3-zjQGRZE_w5jU6+w5TbMw@mail.gmail.com>
Subject: Re: [PATCH 0/2] media: rockchip: rkcif: various fixes
To: michael.riesch@collabora.com
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Paul Elder <paul.elder@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Collabora Kernel Team <kernel@collabora.com>, stable@kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53028-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	HAS_REPLYTO(0.00)[wens@kernel.org]
X-Rspamd-Queue-Id: 070F5153C8D
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 9:50=E2=80=AFPM Michael Riesch via B4 Relay
<devnull+michael.riesch.collabora.com@kernel.org> wrote:
>
> Habidere,
>
> This series contains
>
>  1) a re-spin of Dan's patch that fixes some more stupid off-by-one issue=
s.
>     This patch has been around on the list for some time, but apparently
>     has not been applied yet.
>  2) a fix that makes the DMA abstraction respect the minimum number of
>     buffers requirement
>
> Best regards,
> Michael
>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

This series, along with the minor fixup for patch 2, makes video capture
on my Rock 3A w/ IMX219 from a Raspberry Pi v2 camera module run.
Previously it would fail to queue buffers.


Tested-by: Chen-Yu Tsai <wens@kernel.org>

> ---
> Dan Carpenter (1):
>       media: rockchip: rkcif: fix off by one bugs
>
> Michael Riesch (1):
>       media: rockchip: rkcif: comply with minimum number of buffers requi=
rement
>
>  .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 10 +++---
>  .../media/platform/rockchip/rkcif/rkcif-stream.c   | 41 +++++++++++-----=
------
>  2 files changed, 26 insertions(+), 25 deletions(-)
> ---
> base-commit: c824345288d11e269ce41b36c105715bc2286050
> change-id: 20260216-rkcif-fixes-bdd9d3c7e4b0
>
> Best regards,
> --
> Michael Riesch <michael.riesch@collabora.com>
>
>
>

