Return-Path: <linux-media+bounces-45007-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D75BEFFD3
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 10:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E990818929EC
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 08:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315692EBDDC;
	Mon, 20 Oct 2025 08:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="UKdTea8o"
X-Original-To: linux-media@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C586133993
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 08:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760949438; cv=none; b=YEbtQaYszmc0kh3baxx+IHk82ZWKOvvD5mXNxX/45pIOogEl9QLQNuchxRxH5CwLqP5vAwPHGqq58hxUX+Zf3y3phc8ML2VsOVP/g7eYJaydRBwPpXHsnk0bEvyBm2CvegqjaW+e03ODcp7PP+8Qq8MNQ6ipViUM0iQp3WNrDng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760949438; c=relaxed/simple;
	bh=g30ZHUVvCoJ2BBG0v1MS35XWaPo1A8iayCVj2D0Oifw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A4HT44vjp+hMXJFn+e2pcrrGTEN9pmNfbdGwQPwn1Xw87Euw9UawM8a/pMKlZShURAVplDb2Yo/DosqomoR7iqTjm2ne2HwtwMISMeUG8vrToeYIOEVWtkAF3L/eP6ctx8WxIZLtvUFoJW5dB70J2bVIw6F5nVsO1WufkcgJg7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=UKdTea8o; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 15D09240028
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 10:37:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1760949428; bh=7EE7waqOQGjlD2pi0CQNbcBuVehJ3PUWNptbdj1GJpc=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=UKdTea8oQ4/Ysy51HKc3hw0IzuszAKTugOn4Fo3zvy0a++3ezxh9my2PRVQMRcWkG
	 ISq+exhYf6XbOQz8xKBPo1V3aTvniNNFO2qOXWXArbysPVxteMqisHwKXY/sl31HW+
	 31p/TDIoUWSArDKQqEmCARVifnvDn249FBpaWRC70iNvuY2AmhcAnhaK6IrZumueTE
	 rShEYrSOqaFakKM2Xp04LdtDOXFZVLIHxc8zL9e+m5bzEahW+z/vChA1K6raXHEzX7
	 4Mj2aiZcibwKSsyv5jL37RPcCKcwS09vKNsUhNRE2mKEZc9HUm6l2cGmDwnZ/g+ndU
	 FsLdhvFSo8dXQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4cqph328M3z9rwn;
	Mon, 20 Oct 2025 10:37:07 +0200 (CEST)
Message-ID: <71d12423e776c1ff09845b3298dd9811f34ab994.camel@posteo.de>
Subject: Re: [PATCH 3/3] media: imx8mq-mipi-csi2: drop unused module alias
From: Martin Kepplinger <martink@posteo.de>
To: Johan Hovold <johan@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Purism Kernel Team <kernel@puri.sm>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, linux-media@vger.kernel.org
Date: Mon, 20 Oct 2025 08:37:07 +0000
In-Reply-To: <20251017060051.8204-3-johan@kernel.org>
References: <20251017060051.8204-1-johan@kernel.org>
	 <20251017060051.8204-3-johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Am Freitag, dem 17.10.2025 um 08:00 +0200 schrieb Johan Hovold:
> The driver has never supported anything but OF probing so drop the
> unused platform module alias.
>=20
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
> =C2=A0drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 1 -
> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index 3a4645f59a44..5a5934ce1f84 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -1114,4 +1114,3 @@ module_platform_driver(imx8mq_mipi_csi_driver);
> =C2=A0MODULE_DESCRIPTION("i.MX8MQ MIPI CSI-2 receiver driver");
> =C2=A0MODULE_AUTHOR("Martin Kepplinger <martin.kepplinger@puri.sm>");
> =C2=A0MODULE_LICENSE("GPL v2");
> -MODULE_ALIAS("platform:imx8mq-mipi-csi2");

Acked-by: Martin Kepplinger-Novakovic <martink@posteo.de>

thank you,
                             martin

