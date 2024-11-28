Return-Path: <linux-media+bounces-22273-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAC59DBD7B
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 23:22:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C93F164D2C
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 22:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498B21C461A;
	Thu, 28 Nov 2024 22:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="o5KE2Ze3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA011509B4;
	Thu, 28 Nov 2024 22:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732832567; cv=none; b=vDwkf7m6QzCOOFSWY6rRKFpzdgX8cex9uXtT4NPkanIwQbV+axQLwTLJP7mVdVzE71iMv+66KggSkYxVf3y7X3oB+sz6jeKQV3gfeSn03dSP1QxemExL7GOihx3avLd7LBRlp9puRlR7bu9UWt4grgRNub6lq12bbLmueU6ndzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732832567; c=relaxed/simple;
	bh=B7L5kuH1gim4IcszKhjuFyNt5YADyOH1Mr0+Wz1ottA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WV2NjJkT0AHyHxWC7ClTESxolIK3uFS9Ab+6TwBtwhTQ60me+Mh6Dk1fUTzB+wxScxybeToazeG7+ippAvfUh0LqsC6/QjkdZmppE90F5Gd0IWV99Wc9/LCM2wX/HPw5EGxUycp/2Unhb4XSJkS73lPAYYaCWNme6/vC1WiGH0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=o5KE2Ze3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02EAF526;
	Thu, 28 Nov 2024 23:22:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732832539;
	bh=B7L5kuH1gim4IcszKhjuFyNt5YADyOH1Mr0+Wz1ottA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o5KE2Ze3vj+gkgWZZ9TlYbEIT8KmXpwdUGmC3DWiirzfodNtz1bdh8epVYX5vSJYR
	 0H3MUnBAxxH2PmgtPtzIopEISP0/5X0rD4B19ceNWgorgvwk4+eZGuGeWLVTHSY7kH
	 gGub91LpIjAONySlhhI3t8iTtp6z2r5GAxECRi7k=
Date: Fri, 29 Nov 2024 00:22:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 2/4] media: uvcvideo: Do not set an async control
 owned by other fh
Message-ID: <20241128222232.GF25731@pendragon.ideasonboard.com>
References: <20241127-uvc-fix-async-v2-0-510aab9570dd@chromium.org>
 <20241127-uvc-fix-async-v2-2-510aab9570dd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241127-uvc-fix-async-v2-2-510aab9570dd@chromium.org>

Hi Ricardo,

(CC'ing Hans Verkuil)

Thank you for the patch.

On Wed, Nov 27, 2024 at 12:14:50PM +0000, Ricardo Ribalda wrote:
> If a file handle is waiting for a response from an async control, avoid
> that other file handle operate with it.
> 
> Without this patch, the first file handle will never get the event
> associated with that operation, which can lead to endless loops in
> applications. Eg:
> If an application A wants to change the zoom and to know when the
> operation has completed:
> it will open the video node, subscribe to the zoom event, change the
> control and wait for zoom to finish.
> If before the zoom operation finishes, another application B changes
> the zoom, the first app A will loop forever.

Hans, the V4L2 specification isn't very clear on this. I see pros and
cons for both behaviours, with a preference for the current behaviour,
as with this patch the control will remain busy until the file handle is
closed if the device doesn't send the control event for any reason. What
do you think ?

> Cc: stable@vger.kernel.org
> Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index b6af4ff92cbd..3f8ae35cb3bc 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1955,6 +1955,10 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>  	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
>  		return -EACCES;
>  
> +	/* Other file handle is waiting a response from this async control. */
> +	if (ctrl->handle && ctrl->handle != handle)
> +		return -EBUSY;
> +
>  	/* Clamp out of range values. */
>  	switch (mapping->v4l2_type) {
>  	case V4L2_CTRL_TYPE_INTEGER:

-- 
Regards,

Laurent Pinchart

