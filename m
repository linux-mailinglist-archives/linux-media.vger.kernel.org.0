Return-Path: <linux-media+bounces-11253-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEDE8C196D
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 00:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60EF71C21E20
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 22:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0689129E62;
	Thu,  9 May 2024 22:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Vgoe7BKl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NkR5C0yv"
X-Original-To: linux-media@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A3D10A0D;
	Thu,  9 May 2024 22:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715294090; cv=none; b=ZS+P0DoQR9FuJmKodH9T5RVx4g487tBss4O4i8NENI4kc0xnxgvqL9jQWNGctn5uay+BOD2/jDxRiehqbv+rEMN0KHxUg0bMNqvigwQ8QUv9ZUoKOxe897ovx72LkQJCafTcIvEmXX74lZsdCa6WnpCP6+sw3DH31ukoEUxWBSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715294090; c=relaxed/simple;
	bh=iyl9nh5CFoMqqKdNe+ZfBoZKStfnNeRWG757SThkVYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NpL68A2p4+s+DDl7VUDs3NY44zvh+ElZystlKarf6XQzd5RSnwKeeHBMblEgR+QEmJ6HKzx5AxbyzPxxnhKE2QkhnF59TV/vQQIiWfvNeqvcA/VudMbJfcNjMHNGpKanufSkQfNELShBAlYne1pElm23tijwZlnJdrO1gagnnsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Vgoe7BKl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NkR5C0yv; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfout.nyi.internal (Postfix) with ESMTP id 8FAAA138026C;
	Thu,  9 May 2024 18:34:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Thu, 09 May 2024 18:34:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1715294083;
	 x=1715380483; bh=UNZyFXGlqTSlz98mulXdZk7GVOa0dozUyl83OH4lrEo=; b=
	Vgoe7BKl0FH75WZpyrj3jnV97jFjVdY+qiFxvrEilkRuZ2NObvbdc4Mo5o5BXJxB
	9TZhP9KONuXV4kU7IGqoI64cQaA2vY0LWu+BCNsb+GO/euJh4waQAMuoIrHghU0r
	wtx7r5Y+SrSm0HJDW5WIIRm4N+Jju6YBrWkx+QoB4qMZUl/i7DJwdB9xOGUPcxZX
	jy9cL/cPRBKN5tlJUMufVfhGc+//H4dKSF1YEv8D8X3DSnzGi+K7Bi2rkZBxiPnM
	4VgqCG5YJsXWgyrce6cQeCxOsh5yCpMRGv+9G85Evv8uLQw6jKElp5aplIuEisYr
	oaqWKezvPcQPhp9mOCJQOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715294083; x=
	1715380483; bh=UNZyFXGlqTSlz98mulXdZk7GVOa0dozUyl83OH4lrEo=; b=N
	kR5C0yvDMoG8OoymxeBIZF2a/vm8QZv3cwmba4yV1r+BR7MigkZttaAEAbRmMXjw
	5qAjD0Tot5+Ckq/W316o4bivLrCjvl631yu4t5kLfuQKGmT0QJqKgN8heirgPV3N
	ueIOV7xygAACNRfUCD5iBcSEPELxyrH4QnjKzyxXvKSybbV+pvBzJYvru9QP8Vks
	KGroAA163To1hrvV0CRliQcGguk027YIP5/bviWamdmlFRToqUPr7w0zxfJ3a9XQ
	SNa8/4SDKdTvBHdb4VS5DxBfztlCfIC3Sl2U6FJBW5KhIIdC2zwLzLOLT+i68aWl
	B/z+kutCwiVhJS+Izq5nA==
X-ME-Sender: <xms:g089ZiLbNLfyuprKBPHLmQauQJOl7MuVdWXdFyBl5-2h5MU9aI9HYQ>
    <xme:g089ZqL1r0X-UkbrF-91FKPo3NhNCAYoE4ASQtWZGP1oJPLYSHR1n4i2FAByYk78B
    SVhl-y-Jx-2iobaLUQ>
X-ME-Received: <xmr:g089Zit6U6feiwlWJWvZ5q_6g_cUKZeOB_j-SDM3OTQXjGlwP636YktCHPf191dQgptuf3W8r0WiB8q4oLzJUuCmztAotQk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeffedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:g089ZnYS1WxFSXcXrdEX1-2J41U5DIK1dlv_fawrj-Fx18XyLpjtxg>
    <xmx:g089ZpakWlrDARAUD1crYlFXoMHVUozVJmtbmkhvRmNqwOWra2-tIw>
    <xmx:g089ZjB0pTeZKjHlKpf87TdfxaU-Y9uLYRmq7HT_lrvT7UNhIsdd9Q>
    <xmx:g089ZvYps4biSP-CjLidYAQQ7EtNu_bm-74_x_1fSGAUv2TJVpXXQQ>
    <xmx:g089ZnNDUdbm8Jtzhn2SPop6pMTKKCtdXy8Q0wSLAR3zJbRMTyV3TCuu>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 May 2024 18:34:42 -0400 (EDT)
Date: Fri, 10 May 2024 00:34:40 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 01/11] media: rcar-vin: Fix YUYV8_1X16 handling for
 CSI-2
Message-ID: <20240509223440.GO1385281@ragnatech.se>
References: <20240509161403.111789-1-jacopo.mondi@ideasonboard.com>
 <20240509161403.111789-2-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240509161403.111789-2-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thanks for your work.

On 2024-05-09 18:13:51 +0200, Jacopo Mondi wrote:
> The YUYV8_1X16 and UYVY8_1X16 formats are treated as 'ITU-R
> BT.601/BT.1358 16-bit YCbCr-422 input' (YUV16 - 0x5) in the R-Car VIN
> driver and are thus disallowed when capturing frames from the R-Car
> CSI-2 interface according to the hardware manual.
> 
> As the 1X16 format variants are meant to be used with serial busses they
> have to be treated as 'YCbCr-422 8-bit data input' (0x1) when capturing
> from CSI-2, which is a valid setting for CSI-2.
> 
> Commit 78b3f9d75a62 ("media: rcar-vin: Add check that input interface
> and format are valid") disallowed capturing YUV16 when using the CSI-2
> interface. Fix this by using YUV8_BT601 for YCbCr422 when CSI-2 is in
> use.
> 
> Fixes: 78b3f9d75a62 ("media: rcar-vin: Add check that input interface and format are valid")
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  .../media/platform/renesas/rcar-vin/rcar-dma.c   | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> index e2c40abc6d3d..21d5b2815e86 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> @@ -742,12 +742,22 @@ static int rvin_setup(struct rvin_dev *vin)
>  	 */
>  	switch (vin->mbus_code) {
>  	case MEDIA_BUS_FMT_YUYV8_1X16:
> -		/* BT.601/BT.1358 16bit YCbCr422 */
> -		vnmc |= VNMC_INF_YUV16;
> +		if (vin->is_csi)
> +			/* YCbCr422 8-bit */
> +			vnmc |= VNMC_INF_YUV8_BT601;
> +		else
> +			/* BT.601/BT.1358 16bit YCbCr422 */
> +			vnmc |= VNMC_INF_YUV16;
>  		input_is_yuv = true;
>  		break;
>  	case MEDIA_BUS_FMT_UYVY8_1X16:
> -		vnmc |= VNMC_INF_YUV16 | VNMC_YCAL;
> +		if (vin->is_csi)
> +			/* YCbCr422 8-bit */
> +			vnmc |= VNMC_INF_YUV8_BT601;
> +		else
> +			/* BT.601/BT.1358 16bit YCbCr422 */
> +			vnmc |= VNMC_INF_YUV16;
> +		vnmc |= VNMC_YCAL;
>  		input_is_yuv = true;
>  		break;
>  	case MEDIA_BUS_FMT_UYVY8_2X8:
> -- 
> 2.44.0
> 

-- 
Kind Regards,
Niklas Söderlund

