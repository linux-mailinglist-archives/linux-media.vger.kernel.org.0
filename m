Return-Path: <linux-media+bounces-27290-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C702A4AE97
	for <lists+linux-media@lfdr.de>; Sun,  2 Mar 2025 01:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D719189432D
	for <lists+linux-media@lfdr.de>; Sun,  2 Mar 2025 00:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92463C148;
	Sun,  2 Mar 2025 00:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="T84Uc4ul"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B490A932
	for <linux-media@vger.kernel.org>; Sun,  2 Mar 2025 00:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740874680; cv=none; b=kEgZCapaq/gZAa8eP1t1oiOJxJylRoSPSGaWVklXSCqHa5a3N5gFs0zomTyS3Q0NfkJ5J0RoBJHm+0PJDkGVe08fZOB3QWn4IgWKFNMYWZByQEWssYOW+b6sDGtTyoewb+CE8IjVH+e4ugvpJw88FQghMiRGAoR1ipvQuO7cq8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740874680; c=relaxed/simple;
	bh=LRmamMAQTrESHWqENWmtC9sd425NoHXUhAX27x4Ri9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OrQMJqq5g/lWtwaZMUdqkQAjiHFzd484/vNW1854ON4VKmscUsp9aYgbchb0GMul+7tHCGTjoJubKdgeCpcoOcV8gxAH8y57koUp/xfDZxRwm5vvrP10dVHmFUAec8tJaYPvLJ4+5rmwaxzaR9b9okInzMZnDo+smEzoJUduvO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=T84Uc4ul; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECB61670;
	Sun,  2 Mar 2025 01:16:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740874586;
	bh=LRmamMAQTrESHWqENWmtC9sd425NoHXUhAX27x4Ri9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T84Uc4ulZN5wNS0wg3bQ6HfGfnJ+ZRE+5NwByiB9xz2Ms1M5UghP2fx64CTuCBA3H
	 5zOlukkkkZ7Chsfp/BIcgdjPi4DAaE1jeB1S++ks290md+lEWLRNuCJedJ+64q/zfJ
	 x7X0mnI5eyuqGejpKMtyu0+Ey01wTF3PsBYYeF2c=
Date: Sun, 2 Mar 2025 02:17:37 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linuxtv-commits@linuxtv.org, Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [GIT,PULL,FOR,v6.15] uvcvideo improvements
Message-ID: <20250302001737.GB18557@pendragon.ideasonboard.com>
References: <20250301222207.GA15528@pendragon.ideasonboard.com>
 <67c3a1e6.050a0220.15f6f9.275d@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <67c3a1e6.050a0220.15f6f9.275d@mx.google.com>

Ricardo, should I drop those patches and wait for a new version, or is
everybody happy ignoring those warnings ? Some of the warnings look
reasonable to me, were they ignored, or was the last version of the
series run through CI ?

On Sat, Mar 01, 2025 at 04:10:14PM -0800, Patchwork Integration wrote:
> Dear Laurent Pinchart:
> 
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
> 
> # Test checkpatch:./0001-media-v4l2_ctrl-Add-V4L2_CTRL_TYPE_RECT.patch checkpatch
> WARNING: Avoid logging continuation uses where feasible
> #83: FILE: drivers/media/v4l2-core/v4l2-ctrls-core.c:374:
> +pr_cont("%ux%u@%dx%d",
> 
> total: 0 errors, 1 warnings, 0 checks, 98 lines checked
> 
> # Test checkpatch:./0002-media-v4l2-ctrls-add-support-for-V4L2_CTRL_WHICH_MIN.patch checkpatch
> CHECK: Alignment should match open parenthesis
> #286: FILE: drivers/media/v4l2-core/v4l2-ctrls-core.c:186:
> +static void std_min_compound(const struct v4l2_ctrl *ctrl, u32 idx,
> +    union v4l2_ctrl_ptr ptr)
> 
> CHECK: Alignment should match open parenthesis
> #297: FILE: drivers/media/v4l2-core/v4l2-ctrls-core.c:197:
> +static void std_max_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>      union v4l2_ctrl_ptr ptr)
> 
> total: 0 errors, 0 warnings, 2 checks, 598 lines checked
> 
> # Test checkpatch:./0008-media-uvcvideo-Support-any-size-for-mapping-get-set.patch checkpatch
> CHECK: Alignment should match open parenthesis
> #282: FILE: drivers/media/usb/uvc/uvc_ctrl.c:1406:
> +v4l2_ctrl->default_value = uvc_mapping_get_s32(mapping,
> +UVC_GET_DEF, uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
> 
> CHECK: Alignment should match open parenthesis
> #293: FILE: drivers/media/usb/uvc/uvc_ctrl.c:1440:
> +v4l2_ctrl->minimum = uvc_mapping_get_s32(mapping, UVC_GET_MIN,
> +uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
> 
> CHECK: Alignment should match open parenthesis
> #299: FILE: drivers/media/usb/uvc/uvc_ctrl.c:1444:
> +v4l2_ctrl->maximum = uvc_mapping_get_s32(mapping, UVC_GET_MAX,
> +uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
> 
> CHECK: Alignment should match open parenthesis
> #305: FILE: drivers/media/usb/uvc/uvc_ctrl.c:1448:
> +v4l2_ctrl->step = uvc_mapping_get_s32(mapping, UVC_GET_RES,
> +uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
> 
> total: 0 errors, 0 warnings, 4 checks, 332 lines checked
> 
> # Test checkpatch:./0017-media-uvcvideo-document-UVC-v1.5-ROI.patch checkpatch
> WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> #10: 
> https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/release-R121-15699.B/camera/hal/usb/
> 
> total: 0 errors, 1 warnings, 0 checks, 73 lines checked
> 
> 
> 
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
> 
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/72096058/artifacts/report.htm .
> 
> 
> 
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
> 
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> 
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.

-- 
Regards,

Laurent Pinchart

