Return-Path: <linux-media+bounces-44991-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5BFBEFC24
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 09:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0368A3B66BB
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 07:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E07D2E54BB;
	Mon, 20 Oct 2025 07:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vsGP9GB6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2326619C542;
	Mon, 20 Oct 2025 07:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760947041; cv=none; b=JcPrns8fVCkYSsexWemo30jrt+9NJ7J1kJ/V2uoVLbEbMmlWTQ5JDqsqOv2x4OPxn0F5qNDhRDweIc8Aa+vkvGuGsaPIxB13yIhrXZSQRNsz21i6tiXAJDvG+dsdBEYx9hT1wC9vTGIMwVCxhY21PjY4p6vNxZYoY3oa1u/8HqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760947041; c=relaxed/simple;
	bh=qDdnNRHiTz2QbCYprUKY0QL/UbZGKH3LlwnDczLrVGk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=rxHYtsOOaXyQ7s2v7D9ff3crw809YXT5NgE5OL7F7LsaDnPGSYEtRQQKpodLIWoehFmLw9CwwN6wgV8notEXI87eWDi8/WDfRwl77tAUgFbPAJHfeuLm9VH2VHxi2pNn7pJjbUDITw4Zh7vkNnsAfMbVUUTjBGOF3ho6GgOaOEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vsGP9GB6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F30AD2D5;
	Mon, 20 Oct 2025 09:55:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760946928;
	bh=qDdnNRHiTz2QbCYprUKY0QL/UbZGKH3LlwnDczLrVGk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=vsGP9GB6HruHq9PlrGCXncb/F7ndJ/CN2Lqz71NVYPzViZsn3C8CiAtwmKVMQ4r89
	 1EVNA/O5LwIEzpW5sPAifbtF2CT+akTXgV8xMVXwgzp7Fk3DFGSnHJadhbZ/w5V8FW
	 16TOK7Ib5iQxBzG4Ge7ImWIQdVDX4fBXYlxQSimg=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251020-ptr_err-leftover-v1-1-150b0f8b46b9@chromium.org>
References: <20251020-ptr_err-leftover-v1-1-150b0f8b46b9@chromium.org>
Subject: Re: [PATCH] media: renesas: fdp1: Use %pe format specifier
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 20 Oct 2025 08:57:07 +0100
Message-ID: <176094702701.935713.13430509417971695210@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Ricardo Ribalda (2025-10-20 08:53:41)
> The %pe format specifier is designed to print error pointers. It prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR()
>=20
> This patch fixes this cocci report:
> ./platform/renesas/rcar_fdp1.c:2303:4-11: WARNING: Consider using %pe to =
print PTR_ERR()
>=20
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, same as the others:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
> It seems that we missed this file from the original patchset.
> https://lore.kernel.org/linux-media/20251013-ptr_err-v1-0-2c5efbd82952@ch=
romium.org/
> ---
>  drivers/media/platform/renesas/rcar_fdp1.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/renesas/rcar_fdp1.c b/drivers/media/p=
latform/renesas/rcar_fdp1.c
> index 3515601030eccefe3d979303893c93c85ab0a9b2..672869815f636de25ce08261b=
f327f156b617a37 100644
> --- a/drivers/media/platform/renesas/rcar_fdp1.c
> +++ b/drivers/media/platform/renesas/rcar_fdp1.c
> @@ -2299,8 +2299,7 @@ static int fdp1_probe(struct platform_device *pdev)
>                 fdp1->fcp =3D rcar_fcp_get(fcp_node);
>                 of_node_put(fcp_node);
>                 if (IS_ERR(fdp1->fcp)) {
> -                       dev_dbg(&pdev->dev, "FCP not found (%ld)\n",
> -                               PTR_ERR(fdp1->fcp));
> +                       dev_dbg(&pdev->dev, "FCP not found (%pe)\n", fdp1=
->fcp);
>                         return PTR_ERR(fdp1->fcp);
>                 }
>         }
>=20
> ---
> base-commit: 8652359fc004cbadbf0e95692c1472caac6260c2
> change-id: 20251020-ptr_err-leftover-1997b3a6e06e
>=20
> Best regards,
> --=20
> Ricardo Ribalda <ribalda@chromium.org>
>

