Return-Path: <linux-media+bounces-5033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CFF8517FE
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 16:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4D0B1C208D1
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 15:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C3C3C48C;
	Mon, 12 Feb 2024 15:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RPLC6Yj8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E963A8F5
	for <linux-media@vger.kernel.org>; Mon, 12 Feb 2024 15:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707751945; cv=none; b=mu7H56pfBcQQeKkSPI+cCZaRo8lEe0knkjCQpicevicf/PX8K6/tyW5WLX5g5IEB2w0L1T8h6lUAECyhE47/WO3azch0ngNlez4fRIZnV6/l2GJKra2FUyfQywU3P8oJVlt3HluOa7JIP9oaIpn2cvO6WoG//lBKtW0e6sO+LOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707751945; c=relaxed/simple;
	bh=OtqffKMWLO6eZzDj3om024VCBCTqorJnWzACGOOg0r4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aG/lBsou2+eBY0iul+G76YR7eAAedQVxcWPpzx8YjrLLNbXjtB6ui/5nEl0jVkEKVj/RyZcLaiEfflEsHtpymTGKdgL+tBb1zaKwq5Aoxqa2VBdYxYjT7zJ35sojJ6GHMKIRPZqNVK9mFEGGLzkr31I9QzmtXh3gghswXYibf0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RPLC6Yj8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 679FD2D8;
	Mon, 12 Feb 2024 16:32:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707751938;
	bh=OtqffKMWLO6eZzDj3om024VCBCTqorJnWzACGOOg0r4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RPLC6Yj8VFqkajoQzckGsJ4Mq98veLqo5557rE9IJXDwf+watmm0GYzM10GKi2kPv
	 dpC+hkX+oZhLx6254Xv4HaxaCO76Y/1DwRybuDSjdNSqaOu4PscHvCBJfCcN/mmHRm
	 vUTsHWesTqR7o3epl7107YwQ+d2z1cU6HS8YtKug=
Date: Mon, 12 Feb 2024 16:32:17 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Andy Chen <andy.chen88@outlook.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Ming Qian <ming.qian@nxp.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: platform: nxp: fix return value check in
 mipi_csis_s_stream()
Message-ID: <vvp7mgnzjxeenmwqjcwe5uped733efk3hao6lvt7x3lyk57qlm@ep2afq3zcsbm>
References: <KL1PR06MB617883F6696C3A07B5B5CEB5E0452@KL1PR06MB6178.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <KL1PR06MB617883F6696C3A07B5B5CEB5E0452@KL1PR06MB6178.apcprd06.prod.outlook.com>

Hi Andy,

  thanks for the patch

On Wed, Feb 07, 2024 at 11:36:57PM +0800, Andy Chen wrote:
> Hi,
>
> find_csis_format() may return NULL, and we should determine its return value
> to prevent a fatal error when later functions use it.
>
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index db8ff5f5c4d3..ac867620e2ba 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -956,6 +956,8 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
>
>  	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
>  	csis_fmt = find_csis_format(format->code);
> +	if (!csis_fmt)
> +		return -EPIPE;
>

This shouldn't be required afaict

'format' comes from the subdev state on the CSIS_PAD_SINK:

 	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);

If you check the mipi_csis_set_fmt() implementation, the driver first
fix-ups any non-valid format supplied by the user:

	csis_fmt = find_csis_format(sdformat->format.code);
	if (!csis_fmt)
		csis_fmt = &mipi_csis_formats[0];

And then stores it in the subdev state (on the same CSIS_PAD_SINK pad)

	fmt = v4l2_subdev_state_get_format(sd_state, sdformat->pad);

	fmt->code = csis_fmt->code;

from where it gets retrieved at s_stream() time.

This guarantees that at s_stream time, the format is valid if I'm not
mistaken.

As Hans has already asked: did you see this failing or was this patch
"just in case" ?

Thanks
  j

>  	ret = mipi_csis_calculate_params(csis, csis_fmt);
>  	if (ret < 0)
>
> This is my first patch, any suggestions are welcome, thanks!
>
> Regards,
>
> Andy Chen
>

