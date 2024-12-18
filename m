Return-Path: <linux-media+bounces-23746-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B00B9F70C8
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 00:27:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 699307A177E
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 23:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEAE51FDE2E;
	Wed, 18 Dec 2024 23:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MBbs+NGJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E9B1FD782;
	Wed, 18 Dec 2024 23:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734564437; cv=none; b=lv0Qvgto6ci/CnhDyqqIJjvRopCbV1W3SXxWpL6Kwk9iTK+vDKVKEHY178bY+ZXxxWP4GpI/pOK979ZjhaHP09HV9CnBHCcd9Z/XNCIkONm9eWscMs1S7rGOko+7DQu/KkJq9p9CF7DAFOAjg+TpQYHKcA+ZnxDRkWucKWZXlWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734564437; c=relaxed/simple;
	bh=Ln8Ipf/RLxvZkZxye0avu9JQ9CrALysB6jfN8SgOExo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XuEYyH+VShHo4ycT5XfKMoFPei/q6k4DhxTABI2n7vBAuoDbXpyQtzvIkiLBFsOCyzQT31hdxIFDpZGF7ZYlEHnzLYFS3qnF9JLKVtaSTcXEXSeubeQg5TbFawpCsIgNtZRGZq0cFWLT1YbFv5N3VYJmzUGmE3CMRmvjZa9hPUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MBbs+NGJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 315A7163;
	Thu, 19 Dec 2024 00:26:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734564396;
	bh=Ln8Ipf/RLxvZkZxye0avu9JQ9CrALysB6jfN8SgOExo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MBbs+NGJtC8LcYlxU8t3Qcm5+2SrzRZtaEZP7uD6Cpzk8pBVJew1rTFNHjXJeBXL5
	 bKN1A93/e/Wt570R9gaATDg3LAO8pCKbcNCyQ4cDScsPWulbTN98cmtYL/NGAP+Nrj
	 6NZHYxMNUxkSRNgxkDOwYGa9N3d2ebrEsCEQsUIU=
Date: Thu, 19 Dec 2024 01:27:11 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] media: uvcvideo: Announce the user our
 deprecation intentions
Message-ID: <20241218232711.GD5518@pendragon.ideasonboard.com>
References: <20241218-uvc-deprecate-v2-0-ab814139e983@chromium.org>
 <20241218-uvc-deprecate-v2-4-ab814139e983@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241218-uvc-deprecate-v2-4-ab814139e983@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Wed, Dec 18, 2024 at 09:39:11PM +0000, Ricardo Ribalda wrote:
> If the user sets the nodrop parameter, print a deprecation warning once.
> Hopefully they will come to the mailing list if it is an ABI change.
> 
> Now that we have a callback, take this chance to parse the parameter as
> a boolean. We still say to userspace that it is a uint to avoid ABI
> changes.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_driver.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 10812a841587..d8e8675dd2cd 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2424,8 +2424,25 @@ module_param_call(clock, uvc_clock_param_set, uvc_clock_param_get,
>  MODULE_PARM_DESC(clock, "Video buffers timestamp clock");
>  module_param_named(hwtimestamps, uvc_hw_timestamps_param, uint, 0644);
>  MODULE_PARM_DESC(hwtimestamps, "Use hardware timestamps");
> -module_param_named(nodrop, uvc_no_drop_param, uint, 0644);
> +
> +static int param_set_nodrop(const char *val, const struct kernel_param *kp)
> +{
> +	pr_warn_once("uvcvideo: "
> +		     DEPRECATED
> +		     "nodrop parameter will be eventually removed.\n");
> +	return param_set_bool(val, kp);
> +}
> +
> +static const struct kernel_param_ops param_ops_nodrop = {
> +	.set = param_set_nodrop,
> +	.get = param_get_uint,
> +};
> +
> +param_check_uint(nodrop, &uvc_no_drop_param);
> +module_param_cb(nodrop, &param_ops_nodrop, &uvc_no_drop_param, 0644);
> +__MODULE_PARM_TYPE(nodrop, "uint");
>  MODULE_PARM_DESC(nodrop, "Don't drop incomplete frames");
> +
>  module_param_named(quirks, uvc_quirks_param, uint, 0644);
>  MODULE_PARM_DESC(quirks, "Forced device quirks");
>  module_param_named(trace, uvc_dbg_param, uint, 0644);

-- 
Regards,

Laurent Pinchart

