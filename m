Return-Path: <linux-media+bounces-14061-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF139914F30
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 15:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFC281C221EE
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 13:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB221411C9;
	Mon, 24 Jun 2024 13:52:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9457614037C
	for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 13:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719237166; cv=none; b=uEnUx+7a00gmYkNQJkBUFAYLy0dJnS9wTNBT7RFdRg2IJA8NxbzxcNeGGGCaWsZf481rU7XCnLwMW7FfTEClD9QBsNyelKlsWzng8MaP0/8Ceu9u8fqqhqipVqpgy12iUqJPD00GkYZuyRL0jOyb9HfIobqUnzmQPOYgXAMnmYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719237166; c=relaxed/simple;
	bh=RVejtM4Y0s7gpy35BlAucEMVzFaJCqLLgs/gw/eiiio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HVqM58VRcw//d2AthEPLoIHWJy3PANyN/xHhWMRNxXwYltnxLD+MMIs+4Lk/vdmMXH8qvYY5duz8qk9byjSEMeGafMd1D+qcTR7iikTgsR0RSSVvC6yEUTOtntTciuSybVROSFx8lYQQxQWH1y4OH6p1oRQ1u4CE9hoA2Ff5kjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D5FC32782;
	Mon, 24 Jun 2024 13:52:43 +0000 (UTC)
Message-ID: <baeb2085-1db2-4eb0-a399-a5a35672801c@xs4all.nl>
Date: Mon, 24 Jun 2024 15:52:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/8] media: uapi: Add Raspberry Pi PiSP Back End uAPI
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: David Plowman <david.plowman@raspberrypi.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@iki.fi>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240531080707.34568-1-jacopo.mondi@ideasonboard.com>
 <20240531080707.34568-4-jacopo.mondi@ideasonboard.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240531080707.34568-4-jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jacopo,

On 31/05/2024 10:07, Jacopo Mondi wrote:
> Add the Raspberry Pi PiSP Back End uAPI header.
> 
> The header defines the data type used to configure the PiSP Back End
> ISP.
> 
> The detailed description of the types and of the ISP configuration
> procedure is available at
> https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  MAINTAINERS                                   |   7 +
>  .../linux/media/raspberrypi/pisp_be_config.h  | 927 ++++++++++++++++++
>  .../linux/media/raspberrypi/pisp_common.h     | 199 ++++
>  3 files changed, 1133 insertions(+)
>  create mode 100644 include/uapi/linux/media/raspberrypi/pisp_be_config.h
>  create mode 100644 include/uapi/linux/media/raspberrypi/pisp_common.h
> 

<snip>

> diff --git a/include/uapi/linux/media/raspberrypi/pisp_be_config.h b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
> new file mode 100644
> index 000000000000..3eb4be03c5f4
> --- /dev/null
> +++ b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
> @@ -0,0 +1,927 @@

<snip>

> +/**
> + * struct pisp_be_tiles_config - Raspberry Pi PiSP Back End configuration
> + * @tiles:	Tile descriptors
> + * @num_tiles:	Number of tiles
> + * @config:	PiSP Back End configuration
> + */
> +struct pisp_be_tiles_config {
> +	struct pisp_tile tiles[PISP_BACK_END_NUM_TILES];
> +	int num_tiles;

Everything else is nicely __u8/16/32, and then there is suddenly an 'int'
where I would expect to see a __u32.

I think a v10 is needed anyway (see next review), so it would be nice to
pick up this change for v10.

Regards,

	Hans

> +	struct pisp_be_config config;
> +} __attribute__((packed));
> +
> +#endif /* _UAPI_PISP_BE_CONFIG_H_ */


