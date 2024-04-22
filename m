Return-Path: <linux-media+bounces-9862-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AE88ACB78
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 12:57:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C7481C21CB0
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 10:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51171448E1;
	Mon, 22 Apr 2024 10:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Mrb7ylY+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A847482C1
	for <linux-media@vger.kernel.org>; Mon, 22 Apr 2024 10:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713783448; cv=none; b=JMeKCga1iDMG5TmIZyE3ul7cwmt+7KFRmoUV4kM89oLiEAKTJcVbsF4XPR0yUh2Q2JCtD35hgssrObrCloeRwg/VrFWyO0Hs1LKu0CjbCm3626n/EGT/kUzhXMQYjkv9UFB/4m5H/pM5ZswVnqAFUqRjqZiSDNNJD7aEIWfhX50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713783448; c=relaxed/simple;
	bh=lT9qFeR/uJKBjmwdqRCKAzMA8cYSZIwiAGTwdT+TyLw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=OJAYOLiXRfNbaK2V5JH1ZqQaFIOtkph1D46WgP1vhK4xrOOHRzqSlizAaUjh4WcCfiWovPk8IPLh67Lcq7T6IGqbazqpinP+k1X1rEZyWskGSlFxHzKZpZUTY8e9Hru/W9j3n3pHY2fJ5C1A8ilYYB7fJ04qdMVXmFJgEvxdg9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Mrb7ylY+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A440C142E;
	Mon, 22 Apr 2024 12:56:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713783394;
	bh=lT9qFeR/uJKBjmwdqRCKAzMA8cYSZIwiAGTwdT+TyLw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Mrb7ylY+gyQPsS7WcQK+k5KpznRTeNdLtDTessi5hQFN/DiI7NWpDqj4mE9rnTscR
	 16d6ymVQ4cV1rlfYlwcu3GtnUsTn9ZV25KKRCa7i5tVxTC5MwttJOcVrdczsGRsYct
	 mXrsHzgZvVHUbpjiAUmh2y9Ft6SnM5PXGEVZB1CQ=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240422104247.269816-1-umang.jain@ideasonboard.com>
References: <20240422104247.269816-1-umang.jain@ideasonboard.com>
Subject: Re: [PATCH] media: imx335: Describe CCI struct member
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, Umang Jain <umang.jain@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org
Date: Mon, 22 Apr 2024 11:57:22 +0100
Message-ID: <171378344232.2333277.5082627997395111738@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Umang Jain (2024-04-22 11:42:47)
> Add description for 'struct regmap *cci' member of struct imx335.
>=20
> This will fix the following compile-time warning:
> warning: Function parameter or struct member 'cci' not described in 'imx3=
35'


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>=20
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  drivers/media/i2c/imx335.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> index c43e57455704..990d74214cc2 100644
> --- a/drivers/media/i2c/imx335.c
> +++ b/drivers/media/i2c/imx335.c
> @@ -176,6 +176,7 @@ struct imx335_mode {
>   * @pad: Media pad. Only one pad supported
>   * @reset_gpio: Sensor reset gpio
>   * @supplies: Regulator supplies to handle power control
> + * @cci: CCI register map
>   * @inclk: Sensor input clock
>   * @ctrl_handler: V4L2 control handler
>   * @link_freq_ctrl: Pointer to link frequency control
>=20
> base-commit: 901c9229172392a119f34aa94b95247a2574173e
> --=20
> 2.43.0
>

