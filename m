Return-Path: <linux-media+bounces-39796-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A0DB2471A
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 12:22:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2C897ABB57
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 10:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8602F28FC;
	Wed, 13 Aug 2025 10:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Bwk3bnwq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B5C2EBDDD;
	Wed, 13 Aug 2025 10:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755080550; cv=none; b=NW53PQG1xd9wxPBcjb6zRMfvCbwpGm752QI4O9xrc2vl5QnarCIenChnD3JqOfAIrX+8QIMhDEWbU0h5nN5nRDrAaPmOHyFkA8GA60PjiDK4bBGvq2Y9WO7YEvFkC17UtI3yUGdib4VkYU5dgwgyDN+QzA2FtXtGNBuUSzdf2UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755080550; c=relaxed/simple;
	bh=HMd/eJdc/6/naqmsSKMwyH7Yvm8qFVC0DcIHQVf+2co=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=qaGoKek3ODbSXYi1OdU+LbRmpHsjcAM5naK5bnu310Sx/EirAOeS5vB+Y7xlnJDmfzLXss+mvmj6urA0JT/3wZhE05RwaRvFJrfD/oSYOVOb4NJXDZiDZ2lTkJtVyLE4coU5/8o1bp+EA1SJl2n4JnKp4LTIC3I3tGVJZNufl8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Bwk3bnwq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B9CA2EC;
	Wed, 13 Aug 2025 12:21:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755080494;
	bh=HMd/eJdc/6/naqmsSKMwyH7Yvm8qFVC0DcIHQVf+2co=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Bwk3bnwqsOoD97sRrwYVA/skb6tFvl49PgiPyma4EbyhYqscGlFh7XCD0rRDzSD3d
	 6YI6eq27bvuYDckv4+HeIwvFfbaVF9VceMtqdnxG88wA8bE+uh5h5EXWnxTGKDSOqj
	 zF3SRpWmH3D2n9Ze3wlqiI2gEY55qSBpn7k4ZvMM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250813-imx335_binning-v1-4-a42b687d8541@ideasonboard.com>
References: <20250813-imx335_binning-v1-0-a42b687d8541@ideasonboard.com> <20250813-imx335_binning-v1-4-a42b687d8541@ideasonboard.com>
Subject: Re: [PATCH 4/6] media: imx335: Update HBLANK range on mode change
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Wed, 13 Aug 2025 11:22:24 +0100
Message-ID: <175508054445.560048.732077947659016819@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Jai Luthra (2025-08-13 08:20:35)
> While switching modes, updating to a different value of HBLANK isn't
> sufficient, as this is a read-only control with a single allowed value,
> and thus hblank_min =3D=3D hblank_max =3D=3D hblank of the default mode.
>=20
> So to correctly update the user-facing value of the HBLANK parameter,
> which is necessary for correct framerate calculation, update the whole
> range when switching modes.
>=20

Seems reasonable to me.


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/imx335.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> index dbf2db4bf9cbfd792ff5865264c6f465eb79a43b..c61a6952f828fd8b945746ae2=
f53f5517e98c410 100644
> --- a/drivers/media/i2c/imx335.c
> +++ b/drivers/media/i2c/imx335.c
> @@ -485,7 +485,8 @@ static int imx335_update_controls(struct imx335 *imx3=
35,
>         if (ret)
>                 return ret;
> =20
> -       ret =3D __v4l2_ctrl_s_ctrl(imx335->hblank_ctrl, mode->hblank);
> +       ret =3D __v4l2_ctrl_modify_range(imx335->hblank_ctrl, mode->hblan=
k,
> +                                      mode->hblank, 1, mode->hblank);
>         if (ret)
>                 return ret;
> =20
>=20
> --=20
> 2.50.1
>

