Return-Path: <linux-media+bounces-37738-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF7BB052A6
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 09:20:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40463178628
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 07:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673F026E179;
	Tue, 15 Jul 2025 07:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="qZOEzaiW"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967D017C77;
	Tue, 15 Jul 2025 07:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752563842; cv=none; b=ioRmyys3my3AhkhmK2/JfEmIJBu/px/ajXGeOdpCPlcOJAyqP1c+qWL85qlUz8QcQPRjMz2169YL8/Jp4cBoMs8FnRPFtJ95Mmvg+MywKKN+Q58ltO+EfxfD78WYTC0LbkkI9T1CC+WZmPPxto4FYVIIH8PDdpDxlpLc4SYvDKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752563842; c=relaxed/simple;
	bh=f3tKDEJQbfvcpAsYLw5PvWMKHixA9FoCDMEIKGH5mZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g77e4jGW7KCoD/RpXcCNhKJRkJFyAonPmKwPcJvsbFbacW1XkXSPWxnazIe9UJcz5RbN+ibyKKbI4bhDDodTkmKIygX0b5np8wUS0ZdTXlK13xGmkHXQjE2hPiK9qVnnvCaY38IbAALSBtr2IbKvJOVSN1fyOzSa3vACV2gdcmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=qZOEzaiW; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=uR07AKA03taQYzX+ZjGzS07Lzyba1XHHLaGn40KNnHo=; b=qZOEzaiWmPfGWbRrPXsJ9vJzT4
	wljB0WDCO0YXn6h+/tmgdcbGXlRe1hMX9zA27p8Gym3SkdnxJKn2QupLQFxCktjGoqZvMcdKU42f+
	BsFB+pDz0IGQRuyxRvqeh6jlXf3x1RqylAGiJLUZnTpJPuYNu9HX/Iscl+O5OMKgr9mujgIBBUWW+
	a4x8f9oPy8vriFLcdu8Nx0YRY55GgS4khKiaE3E8nc7QcsnseALYo5VYeUs0itRPcAEv4Cy0UQxeJ
	/zVtCyUvAkqaMe1BrmAfVRNMpbBZWYlUC0U5ZbxpwoVUz+KXdRQSD3dB9Oj7g1mgeMdPJcyIUS72t
	lSogO6qA==;
Received: from i53875a5c.versanet.de ([83.135.90.92] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ubZuN-0006t0-D6; Tue, 15 Jul 2025 09:16:59 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Detlev Casanova <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Lukas Bulwahn <lbulwahn@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject:
 Re: [PATCH] MAINTAINERS: merge sections for ROCKCHIP VIDEO DECODER DRIVER
Date: Tue, 15 Jul 2025 09:16:55 +0200
Message-ID: <3261271.ElGaqSPkdT@diego>
In-Reply-To: <20250715063134.100733-1-lukas.bulwahn@redhat.com>
References: <20250715063134.100733-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 15. Juli 2025, 08:31:34 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Lukas Bulwahn:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>=20
> Commit d968e50b5c26 ("media: rkvdec: Unstage the driver") moves the driver
> from staging/media/ to media/platform/rockchip/ and adds a new section
> ROCKCHIP RKVDEC VIDEO DECODER DRIVER in MAINTAINERS. It seems that it was
> overlooked that the section ROCKCHIP VIDEO DECODER DRIVER in MAINTAINERS
> already existed, referring to the same files before the driver was moved
> as the new section refers to after the driver was moved.
>=20
> So, merge the information from the two sections for ROCKCHIP (RKVDEC) VID=
EO
> DECODER DRIVER into one. This essentially results in adding the maintainer
> of the previously existing section in the new section and then removing
> that previously existing section.
>=20
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  MAINTAINERS | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5efcdb5537f5..d044e4f71ae5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21673,6 +21673,7 @@ F:	drivers/media/platform/rockchip/rga/
> =20
>  ROCKCHIP RKVDEC VIDEO DECODER DRIVER
>  M:	Detlev Casanova <detlev.casanova@collabora.com>
> +M:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>  L:	linux-media@vger.kernel.org
>  L:	linux-rockchip@lists.infradead.org
>  S:	Maintained
> @@ -21693,14 +21694,6 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
>  F:	sound/soc/rockchip/rockchip_sai.*
> =20
> -ROCKCHIP VIDEO DECODER DRIVER
> -M:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> -L:	linux-media@vger.kernel.org
> -L:	linux-rockchip@lists.infradead.org
> -S:	Maintained
> -F:	Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> -F:	drivers/staging/media/rkvdec/
> -
>  ROCKER DRIVER
>  M:	Jiri Pirko <jiri@resnulli.us>
>  L:	netdev@vger.kernel.org
>=20





