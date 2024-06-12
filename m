Return-Path: <linux-media+bounces-13110-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C92905CD8
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 22:31:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C24271F242DC
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 20:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C457384D3D;
	Wed, 12 Jun 2024 20:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dcjnrchj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E6E7F7E3;
	Wed, 12 Jun 2024 20:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718224307; cv=none; b=vAJN53YeKcPy+xB87YRkIP9GSjNblO3DD6B1Lu40lzRIb9s3s4Xxv2yrKtkrCFU7xq8TXintkkJUrcfv3J0EiHVIhyCjELMn54Lc2JUIe6aquZa4RNF/AhimkbYlddDHcw3EQkfGVb6O4/hCLxaGewUXaq6rJvDQ/lnG7aQmB8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718224307; c=relaxed/simple;
	bh=1TlNttQafOdr2aigwuyiH+bjl/sHPOXIwnCqNr7gAts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=svXcA6YvVJGr0y7ap/uNLfBPUUfA3u0WrDdJolRKOuVF6cipCcJGiJJ7wgksZJQZhi2OzHOsgFtHiJ1twuBx1znt2jIHh0LbuV2QDkDtzIbDXOcDujI3i7V0NcXiW9ltGPSw7D7knzRQT1BF29ECJqMILJEJwJ9nPjNOCZ4wrXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dcjnrchj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E95512E4;
	Wed, 12 Jun 2024 22:31:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718224290;
	bh=1TlNttQafOdr2aigwuyiH+bjl/sHPOXIwnCqNr7gAts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dcjnrchjLlZpLD8NFkndl9LRohQkz6uvKc7Q7meFRO+Zs1eUq7fkYNaX8GMavhPjU
	 A+LGDgU1BwMQsFqoOQrl0OCV8Lxrv+rdbVlAohHf2znCsNq5Uub102dS0dfN1ukpw4
	 iXhxbwClRHVNhFuk5IstWMur8tqKXn0JbnS8/t/s=
Date: Wed, 12 Jun 2024 23:31:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Gergo Koteles <soyer@irl.hu>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: v4l2: map UVC_CT_ROLL_ABSOLUTE_CONTROL
Message-ID: <20240612203124.GU28989@pendragon.ideasonboard.com>
References: <cover.1718216718.git.soyer@irl.hu>
 <163b1aee53fa78fe1a8d0b8bb7b0f7be1f1975c9.1718216718.git.soyer@irl.hu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <163b1aee53fa78fe1a8d0b8bb7b0f7be1f1975c9.1718216718.git.soyer@irl.hu>

On Wed, Jun 12, 2024 at 08:31:14PM +0200, Gergo Koteles wrote:
> Some new UVC cameras can report whether they are mounted in 'portrait
> mode'.
> 
> Current roll degrees (-90, 0, 90, 180) are reported with
> UVC_CT_ROLL_ABSOLUTE_CONTROL.

UVC_CT_ROLL_ABSOLUTE_CONTROL is about controlling the motion of the
camera along the roll axis, while this patch series sounds like you want
to support reporting the mounting orientation of the device, not cause
the device to rotate. Is that right ?

If that's the case, the right V4L2 control to use would be
V4L2_CID_CAMERA_SENSOR_ROTATION. Mapping it to
UVC_CT_ROLL_ABSOLUTE_CONTROL is problematic though, as
UVC_CT_ROLL_ABSOLUTE_CONTROL is not meant for this in the UVC spec. We
would likely need a quirk to control how it gets used.

> Map UVC_CT_ROLL_ABSOLUTE_CONTROL to V4L2_CID_ROLL_ABSOLUTE to
> make it available to userspace.
> 
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 4b685f883e4d..bc3272b6ceb1 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -748,6 +748,15 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
>  		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
>  	},
> +	{
> +		.id		= V4L2_CID_ROLL_ABSOLUTE,
> +		.entity		= UVC_GUID_UVC_CAMERA,
> +		.selector	= UVC_CT_ROLL_ABSOLUTE_CONTROL,
> +		.size		= 16,
> +		.offset		= 0,
> +		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
> +		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
> +	},
>  };
>  
>  const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited = {

-- 
Regards,

Laurent Pinchart

