Return-Path: <linux-media+bounces-12863-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 266E39023C6
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 16:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D1C72827D4
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 14:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5FE8286B;
	Mon, 10 Jun 2024 14:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HiPT93Mh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA3615A8;
	Mon, 10 Jun 2024 14:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718028865; cv=none; b=EeBZss7USV6pLoDm2BHn90C2wu4reYUy2IqcV3qWLoQXTuZSnqOJmd4WxGdpa66oDo7rNfSNXJ1inWkTWClrpP4DcQvvGu5c8BJDB+l6Gvrl20f4UkMEt8zkdHR6WMVvynF2Oq3EytIfNoMIjYpSwuou6fwsUAJni8jiP3vQEzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718028865; c=relaxed/simple;
	bh=d3Bvt5JggHgvaXTEhKTRMms6MuMXuY88JEXDStZVioY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQY5cS860LhKquaCJrsxP9yc/NQZEPydxI2UuEaIqpEoRvvs0gG8UUmbZnrCSNBPDFwe1TvDdgtvprWmqv2fOet9pkXuVyaFnOP6ljciyOPj2wTMiZdQLBiw2GRJOYBM9ksrfaSpjkuWnHBFtkVCdHRHjR7HTqWgbNtg7RZnPn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HiPT93Mh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 985EE397;
	Mon, 10 Jun 2024 16:14:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718028849;
	bh=d3Bvt5JggHgvaXTEhKTRMms6MuMXuY88JEXDStZVioY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HiPT93MhApogbr6LgMgy7z+lKsLV7Dyoxlb9qPGQ8UZ+WzuNRjLhdH51Nk/swndL4
	 EhfVa1AdKf0GGroXmk0deNMmx1OYwHmtVTTPhDNqXEMRHfYsfgTXS75LHHE4/JL7CZ
	 CXyxxilu0owseo8/EfqK52r9P9QZg84sKrEqdwns=
Date: Mon, 10 Jun 2024 17:14:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] media: uvcvideo: Probe the PLF characteristics
Message-ID: <20240610141402.GB13744@pendragon.ideasonboard.com>
References: <20240318-billion-v1-0-2f7bc0ee2030@chromium.org>
 <20240318-billion-v1-3-2f7bc0ee2030@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240318-billion-v1-3-2f7bc0ee2030@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Mon, Mar 18, 2024 at 11:55:25PM +0000, Ricardo Ribalda wrote:
> The UVC 1.5 standard defines 4 values for the PLF control: Off, 50Hz,
> 60Hz and Auto. But it does not clearly define if all the values must be
> implemented or not.
> 
> Instead of just using the UVC version to determine what the PLF control
> can do, probe it.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 54 +++++++++++++++++++++++++++++++++++++---
>  1 file changed, 50 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 67522143c6c85..9a0b81aca30d1 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -501,12 +501,58 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  static int uvc_ctrl_add_plf_mapping(struct uvc_video_chain *chain,
>  	struct uvc_control *ctrl, const struct uvc_control_mapping *mapping)
>  {
> +	const struct uvc_control_mapping *out_mapping =
> +					&uvc_ctrl_power_line_mapping_uvc11;
> +	u8 init_val;
> +	u8 *buf;

	u8 *buf __free(kfree) = NULL;

will simplify the exit paths.

> +	int ret;
> +
> +	buf = kmalloc(sizeof(*buf), GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	/* Save the default PLF value, so we can restore it. */
> +	ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR, ctrl->entity->id,
> +			     chain->dev->intfnum, ctrl->info.selector,
> +			     buf, sizeof(*buf));

That's the current value, not the default. Is that intended ?

> +	/* If we cannot read the control skip it. */
> +	if (ret) {
> +		kfree(buf);
> +		return ret;
> +	}
> +	init_val = *buf;
> +
> +	/* If PLF value cannot be set to off, it is limited. */
> +	*buf = V4L2_CID_POWER_LINE_FREQUENCY_DISABLED;
> +	ret = uvc_query_ctrl(chain->dev, UVC_SET_CUR, ctrl->entity->id,
> +			     chain->dev->intfnum, ctrl->info.selector,
> +			     buf, sizeof(*buf));
> +	if (ret) {
> +		out_mapping = &uvc_ctrl_power_line_mapping_limited;
> +		goto end;

If setting the value failed you don't need to restore it, do you ?

> +	}
> +
> +	/* UVC 1.1 does not define auto, we can exit. */
>  	if (chain->dev->uvc_version < 0x150)
> -		return __uvc_ctrl_add_mapping(chain, ctrl,
> -					      &uvc_ctrl_power_line_mapping_uvc11);
> +		goto end;
> +
> +	/* Check if the device supports auto. */
> +	*buf = V4L2_CID_POWER_LINE_FREQUENCY_AUTO;
> +	ret = uvc_query_ctrl(chain->dev, UVC_SET_CUR, ctrl->entity->id,
> +			     chain->dev->intfnum, ctrl->info.selector,
> +			     buf, sizeof(*buf));

Now for the real annoying question. I've encountered quite a few devices
that would crash when the driver tried to get/set lots of controls at
probe time. This is why the control cache is populated the first time a
control is queried, and not when the device is probed. I'm always
worried when adding more control accesses at probe time that some
devices will behave improperly.

Given the number of UVC users I tend to be on the conservative side, but
obviously, if we were to strictly avoid new access patterns to the
device, the driver wouldn't be able to evolve. I do like patches 4/5 and
5/5, so I'm tempted to take the risk and revert this series later if
needed. That would likely make some other users unhappy if they rely on
the heuristic.

Another issue is how to get vendors to implement the power line
frequency control correctly. With the series applied, vendors won't
notice they're doing something wrong. Of course, they probably don't
check the behaviour of their devices with Linux in the first place, so
I'm not sure what we could do.

> +	if (!ret)
> +		out_mapping = &uvc_ctrl_power_line_mapping_uvc15;
> +
> +end:
> +	/* Restore initial value and add mapping. */
> +	*buf = init_val;
> +	uvc_query_ctrl(chain->dev, UVC_SET_CUR, ctrl->entity->id,
> +		       chain->dev->intfnum, ctrl->info.selector,
> +		       buf, sizeof(*buf));
>  
> -	return __uvc_ctrl_add_mapping(chain, ctrl,
> -				      &uvc_ctrl_power_line_mapping_uvc15);
> +	kfree(buf);
> +	return __uvc_ctrl_add_mapping(chain, ctrl, out_mapping);
>  }
>  
>  static const struct uvc_control_mapping uvc_ctrl_mappings[] = {

-- 
Regards,

Laurent Pinchart

