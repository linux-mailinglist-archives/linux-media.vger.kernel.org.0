Return-Path: <linux-media+bounces-36741-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6170CAF83E7
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 00:49:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1D6D189E27E
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 22:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50DA42D3A66;
	Thu,  3 Jul 2025 22:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LLO8hyJV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E09128688E;
	Thu,  3 Jul 2025 22:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582973; cv=none; b=Tz/A66Pp48ZHSnkH9Gv1cL18j7KFoKYaJP0gmFCFuUNpwjtFetBtVlprhZHuCr851u2A92/KiFyYLcygaSwZ2ZP8SwBG3W+K3p7o+XAqZbRIOb9MWrqN7b49s8KbEIGXvMeu8fD5Qn8hHEnqIanH0kGpt1rwrRmdDCmEW40W0H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582973; c=relaxed/simple;
	bh=bQFfDRLy7pX1FjdOSUioZJm3E0ebbtU1NR9wM88Aoek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E6X6D4JhzYy85YkLanl62CuVULW3PP9H1fi3TFeAtJlmHLsB/CWIL+QabMgZvj/ozspIUL1lESB3x+cOsQtqYrMDd2kTHL65+MbTCPWqXujDtqTH5emSrb2PnwEhF0cNG71t0xXi+E/HG6QfE08YXWtomULkaZDTcWLPI+tQ7IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LLO8hyJV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7D2C5667;
	Fri,  4 Jul 2025 00:49:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751582946;
	bh=bQFfDRLy7pX1FjdOSUioZJm3E0ebbtU1NR9wM88Aoek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LLO8hyJVj8ubeLu0T/roOrwIqx6XzcV2xa8XG1xz/BWxIeZExz4cR4ULl4x61EbWX
	 zFXqhof0VmYES1nLbnYJ1i6m4KUqVPyCK6HWgcd9W2w4v3By/y4ZO0M3LXyWDHKNxU
	 cRX5k8OBAt1iDqxzZbIamFv4+XjLajROdTjnm6TI=
Date: Fri, 4 Jul 2025 01:49:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 09/11] media: adv7180: Do not write format to device in
 set_fmt
Message-ID: <20250703224903.GH3798@pendragon.ideasonboard.com>
References: <20250703205223.2810806-1-niklas.soderlund+renesas@ragnatech.se>
 <20250703205223.2810806-10-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250703205223.2810806-10-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Thu, Jul 03, 2025 at 10:52:21PM +0200, Niklas Söderlund wrote:
> The .set_fmt callback should not write the new format directly do the
> device, it should only store it and have it applied by .s_stream.
> 
> The .s_stream callback already calls adv7180_set_field_mode() so it's
> safe to remove programming of the device and just store the format and
> have .s_stream apply it.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/adv7180.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> index dcdc89b717a4..8ebb72b2bb61 100644
> --- a/drivers/media/i2c/adv7180.c
> +++ b/drivers/media/i2c/adv7180.c
> @@ -793,12 +793,7 @@ static int adv7180_set_pad_format(struct v4l2_subdev *sd,
>  	ret = adv7180_mbus_fmt(sd,  &format->format);
>  
>  	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> -		if (state->field != format->format.field) {
> -			state->field = format->format.field;
> -			adv7180_set_power(state, false);
> -			adv7180_set_field_mode(state);
> -			adv7180_set_power(state, true);
> -		}
> +		state->field = format->format.field;
>  	} else {
>  		framefmt = v4l2_subdev_state_get_format(sd_state, 0);
>  		*framefmt = format->format;

-- 
Regards,

Laurent Pinchart

