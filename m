Return-Path: <linux-media+bounces-12546-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDB28FBB3E
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 20:07:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D70DB272EA
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 18:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE1F14A0BD;
	Tue,  4 Jun 2024 18:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="jdwW1syV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WHc4DSx6"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D09179BC;
	Tue,  4 Jun 2024 18:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717524454; cv=none; b=atXZ1NVBZGVZZ7doE2EwBOTX3YNf8pFX0Q4t1MvPWflxtDwQuGBap9HmQj96ekIS8Bzk+Tik+LxldsGBySsh12CFvgoWozKj/LyxpRTw8LfR4qOAs3yb/p6NYQSUQ82IolJaz0BjPk0yaXnfCg45ra8pP+Zl9nVKf8ZMx8RU73c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717524454; c=relaxed/simple;
	bh=HGGHD3mHvmQMZTFcebtOLkE5WGxJJhbDHj/XcODxKB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pTM4N57DvigubE1qL/2JR6rbTKRwCiDdb9WOalDxmuvL8OY5blsf6v16z80AJliOKYq+dfvX6THuD44RPt/E43usAAuF9gF+LnHtk2kdrGPHafXbnwTfqR0kyQejgR7dD3EVpikSBBrx1tqFLgqOOuFMJqDRn2gOxipiN4S+YJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=jdwW1syV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WHc4DSx6; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 81C1E1140060;
	Tue,  4 Jun 2024 14:07:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 04 Jun 2024 14:07:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1717524449;
	 x=1717610849; bh=b0/ZogdI17qL7g16M72y0vMpQ1quxF2QL0mG1G9bqrc=; b=
	jdwW1syVBsjggkJNoJe6WgX0QUjEB4eiT8AEBcsP7wA/4mNBF3ZjmeGoiG9fLdpk
	XJeXoleUMzZqv6z23U9I4v43l5CLyZKp5lX+MQo9SUSLdJV5isflbmHU00CmH40F
	AA2mK/F4B2Yj74tgU+VoZPXmiNRBtvLKWE1WAPXZFbZS+4Cock5KBDg7SQPquqRt
	+wzzTVMeNP1lG3HvspDu1hZ9jPas0ZAlujJiyfP3MQ4HOnSIyq57LmhIjIF7Bwzq
	B+Dki09kWU2XatXT/BwVXTn0zxoBiTDSO4sTbhLbnUwJbJWpLgVPg6xYQpULsw97
	xK+xsl0HskaK+SIDFRaiyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1717524449; x=
	1717610849; bh=b0/ZogdI17qL7g16M72y0vMpQ1quxF2QL0mG1G9bqrc=; b=W
	Hc4DSx61VUKyxSknTeBI3xR09+aC83tVZ+1fAoQxVlxQK3KhTjz4XdXIpC4VkXa4
	Y9EDRo2j/60LPimiKRFkfQgHIhLf1czCMU/qXVxa3Aas87PqzzsGU2VdCtuoxoKo
	ML4CKEMmwqNhrWeVNyFDXPtf8EV1/rucdeIZUqoZml795ajCfj4jTMvh11PqgTzV
	Fwtl3iO1aK0Bz/ed0U5usyyn4PJZMh+V9vfMfOyTUPJfKzRq3bCwUaEefO8pghtQ
	AgY92w0pjk7Ebc+cVy2tOfHrMt7TckfmIFg6LSJZOpBecIEctfQotwtDl5Pl3CWy
	w1yNn7hX5fXOU2Y13g2ww==
X-ME-Sender: <xms:31dfZh48Dzx4snTxymOST4dxOoCrPZc6sk3Xz0-pQp2wC3uyn4oA0w>
    <xme:31dfZu6oHfpZLz9oSWill4Yz8DeefssNw_UA_q8pl3BvZXovEN1MOwoOHoVDKnFPM
    0bNBlyjY5aKLtG_n4U>
X-ME-Received: <xmr:31dfZocZLzuh1IqdnXKastNG8g3SBr1_jt3jxpZ48GD-ZW0H7aPKEQzlHPs_ghMxXXuV5co0pd622lnqQtNCaQp0v5gTp7M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdelgedgudduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhi
    khhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvg
    hnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepfefhleel
    hfffjefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvleeinecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohgu
    vghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:31dfZqKUVGOpwgoTSqPUEaMecqpm3buEteZmnpIAV98pWBtje0XcPQ>
    <xmx:31dfZlKZKAaKX_ONxkZlpbkPJcOl5ozUB_jX2NhhA8o9GcooPe1TgA>
    <xmx:31dfZjyQhw2pLSB1zp81q45Nuz0ucNFcV5zXgJE2sRLXGC87W6NDZA>
    <xmx:31dfZhLjOwB7Q9IZqUVPOWEbHAyjEMQsVacbNVqM3hELSudHbQIcsQ>
    <xmx:4VdfZiECTI7aX5r6T89_sZ0OrvQJAYBq6tJQh04yORnHqA4ES1B0E_mo>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Jun 2024 14:07:26 -0400 (EDT)
Date: Tue, 4 Jun 2024 20:07:24 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: rcar-vin: Add support for RAW10
Message-ID: <20240604180724.GG710180@ragnatech.se>
References: <20240417120230.4086364-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240417120230.4086364-1-niklas.soderlund+renesas@ragnatech.se>

Hi Hans,

Gentle ping on this patch.

On 2024-04-17 14:02:30 +0200, Niklas Söderlund wrote:
> Some R-Car SoCs are capable of capturing RAW10. Add support for it
> using the V4L2_PIX_FMT_Y10 pixel format, which I think is the correct
> format to express RAW10 unpacked to users.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since RFC
> - Fix spelling in rcar-vin.h
> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-core.c |  1 +
>  drivers/media/platform/renesas/rcar-vin/rcar-dma.c  | 12 ++++++++++++
>  drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c |  8 ++++++++
>  drivers/media/platform/renesas/rcar-vin/rcar-vin.h  |  4 +++-
>  4 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index 809c3a38cc4a..e9675cb8faa2 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -1279,6 +1279,7 @@ static const struct rvin_info rcar_info_r8a779a0 = {
>  	.use_mc = true,
>  	.use_isp = true,
>  	.nv12 = true,
> +	.raw10 = true,
>  	.max_width = 4096,
>  	.max_height = 4096,
>  };
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> index e2c40abc6d3d..dd290054dfe7 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> @@ -123,7 +123,9 @@
>  /* Video n Data Mode Register bits */
>  #define VNDMR_A8BIT(n)		(((n) & 0xff) << 24)
>  #define VNDMR_A8BIT_MASK	(0xff << 24)
> +#define VNDMR_RMODE_RAW10	(2 << 19)
>  #define VNDMR_YMODE_Y8		(1 << 12)
> +#define VNDMR_YC_THR		(1 << 11)
>  #define VNDMR_EXRGB		(1 << 8)
>  #define VNDMR_BPSM		(1 << 4)
>  #define VNDMR_ABIT		(1 << 2)
> @@ -780,6 +782,9 @@ static int rvin_setup(struct rvin_dev *vin)
>  	case MEDIA_BUS_FMT_Y8_1X8:
>  		vnmc |= VNMC_INF_RAW8;
>  		break;
> +	case MEDIA_BUS_FMT_Y10_1X10:
> +		vnmc |= VNMC_INF_RGB666;
> +		break;
>  	default:
>  		break;
>  	}
> @@ -888,6 +893,9 @@ static int rvin_setup(struct rvin_dev *vin)
>  			dmr = 0;
>  		}
>  		break;
> +	case V4L2_PIX_FMT_Y10:
> +		dmr = VNDMR_RMODE_RAW10 | VNDMR_YC_THR;
> +		break;
>  	default:
>  		vin_err(vin, "Invalid pixelformat (0x%x)\n",
>  			vin->format.pixelformat);
> @@ -1270,6 +1278,10 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
>  		if (vin->format.pixelformat != V4L2_PIX_FMT_GREY)
>  			return -EPIPE;
>  		break;
> +	case MEDIA_BUS_FMT_Y10_1X10:
> +		if (vin->format.pixelformat != V4L2_PIX_FMT_Y10)
> +			return -EPIPE;
> +		break;
>  	default:
>  		return -EPIPE;
>  	}
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> index bb4b07bed28d..e7298688541d 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> @@ -86,6 +86,10 @@ static const struct rvin_video_format rvin_formats[] = {
>  		.fourcc			= V4L2_PIX_FMT_GREY,
>  		.bpp			= 1,
>  	},
> +	{
> +		.fourcc			= V4L2_PIX_FMT_Y10,
> +		.bpp			= 4,
> +	},
>  };
>  
>  const struct rvin_video_format *rvin_format_from_pixel(struct rvin_dev *vin,
> @@ -106,6 +110,10 @@ const struct rvin_video_format *rvin_format_from_pixel(struct rvin_dev *vin,
>  		if (!vin->info->nv12 || !(BIT(vin->id) & 0x3333))
>  			return NULL;
>  		break;
> +	case V4L2_PIX_FMT_Y10:
> +		if (!vin->info->raw10)
> +			return NULL;
> +		break;
>  	default:
>  		break;
>  	}
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> index 997a66318a29..f87d4bc9e53e 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> @@ -151,7 +151,8 @@ struct rvin_group_route {
>   * @model:		VIN model
>   * @use_mc:		use media controller instead of controlling subdevice
>   * @use_isp:		the VIN is connected to the ISP and not to the CSI-2
> - * @nv12:		support outputing NV12 pixel format
> + * @nv12:		support outputting NV12 pixel format
> + * @raw10:		support outputting RAW10 pixel format
>   * @max_width:		max input width the VIN supports
>   * @max_height:		max input height the VIN supports
>   * @routes:		list of possible routes from the CSI-2 recivers to
> @@ -163,6 +164,7 @@ struct rvin_info {
>  	bool use_mc;
>  	bool use_isp;
>  	bool nv12;
> +	bool raw10;
>  
>  	unsigned int max_width;
>  	unsigned int max_height;
> -- 
> 2.44.0
> 

-- 
Kind Regards,
Niklas Söderlund

