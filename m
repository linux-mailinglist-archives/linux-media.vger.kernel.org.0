Return-Path: <linux-media+bounces-18290-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DB797918A
	for <lists+linux-media@lfdr.de>; Sat, 14 Sep 2024 16:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 147401F22ABA
	for <lists+linux-media@lfdr.de>; Sat, 14 Sep 2024 14:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A20E1CFEC2;
	Sat, 14 Sep 2024 14:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Yzcode8m"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF649210E9
	for <linux-media@vger.kernel.org>; Sat, 14 Sep 2024 14:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726324840; cv=none; b=FdOIDCB4tnIRNWRTm/+b9H7h8KdgjLVCWgxzFCOhTciPSS/Bom9/0kMRQyhLu3FieoaMImY+x0j+bxeeUnmVuehxjb5IEqaukCjyECpsxvmiVAUQ5Amkzv9KyFJaU0Fe55M65Txiu06fQH2/9X7PLy5caNWMlpY9tueQd+dIXx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726324840; c=relaxed/simple;
	bh=jr58v1xQlm4Rsx174IQf84t2AOgpYkekMmggvxBaeP8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Ua8hVi7y4QRUw6MWjt6QO+TDwzUQ7V28FOu5+u7anbvqc2xFnAJtQuc9KGJy+dqnsxSravJrsOffRtJy/n4uHfC5dsPQAPY6XEsVzgwDRls159CwEQncljQS2+qcj1zMl2CGh4pvCRkN/OvrRYNjfbKiPXsUqXD0dFf5/3H+Dfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Yzcode8m; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BB7B7E2;
	Sat, 14 Sep 2024 16:39:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726324757;
	bh=jr58v1xQlm4Rsx174IQf84t2AOgpYkekMmggvxBaeP8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Yzcode8m/yqdXfnrtzQlWzo3xyAJvNAg/qhYArNZlMgbiJSWF+OY0hIIQqHQhRvYO
	 WpZ5FkkJi/Pssndiv+CuGfPRKwaD9Y/BFNBym3BBy+GjON/LwrKCiyzbymn0B+q7Jf
	 DDKVaPA02/5D84zSm7DSvoGqVP3Q8xohmgEg7Uoc=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240914142928.17215-1-umang.jain@ideasonboard.com>
References: <20240914142928.17215-1-umang.jain@ideasonboard.com>
Subject: Re: [PATCH] media: dw100: Rectify debug log
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Xavier Roumegue <xavier.roumegue@oss.nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Umang Jain <umang.jain@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org
Date: Sat, 14 Sep 2024 15:40:33 +0100
Message-ID: <172632483367.3771860.18357256911961312611@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Umang Jain (2024-09-14 15:29:28)
> Rectify dev_dbg() log of dw100_hw_set_destination() from
> "Set HW source registers" to "Set HW destination registers".
>=20

Yes, that looks pretty clear to be a copy/paste error when the function
was duplicated, and would make reading the logs confusing.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/dw100/dw100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/pla=
tform/nxp/dw100/dw100.c
> index 0024d6175ad9..394f1f6129e3 100644
> --- a/drivers/media/platform/nxp/dw100/dw100.c
> +++ b/drivers/media/platform/nxp/dw100/dw100.c
> @@ -1311,7 +1311,7 @@ static void dw100_hw_set_destination(struct dw100_d=
evice *dw_dev,
>         }
> =20
>         dev_dbg(&dw_dev->pdev->dev,
> -               "Set HW source registers for %ux%u - stride %u, pixfmt: %=
p4cc, dma:%pad\n",
> +               "Set HW destination registers for %ux%u - stride %u, pixf=
mt: %p4cc, dma:%pad\n",
>                 width, height, stride, &fourcc, &addr_y);
> =20
>         /* Pixel Format */
> --=20
> 2.45.2
>

