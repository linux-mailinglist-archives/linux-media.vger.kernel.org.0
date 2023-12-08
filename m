Return-Path: <linux-media+bounces-1991-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4B280A808
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 17:01:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E94F1C208DB
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 16:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785C434CEC;
	Fri,  8 Dec 2023 16:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QF6fMyyd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2044E1738
	for <linux-media@vger.kernel.org>; Fri,  8 Dec 2023 08:00:51 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E71DBEBA;
	Fri,  8 Dec 2023 17:00:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702051207;
	bh=gOoKG8+/P5DAQ84Ncv/QEJSAONpFgg1xuZJlBqSBbtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QF6fMyydsnG1RV4L/dz3TIJOsM4ZZp3bVO0qYLtI9WjYwWf3kb++oH6TTNqYETBz8
	 nEJRyZdoCEpZYW92k2URguPfqPEzXtMmhSuiEUastwvDLf/r+Ki9n5wT/khVfiO9hS
	 2Yvezbx1k0h3bHV3Lsi8qdoeTVMdsnyqRjGrxOmE=
Date: Fri, 8 Dec 2023 18:00:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Yunke Cao <yunkec@google.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH v14 11/11] media: uvcvideo: document UVC v1.5 ROI
Message-ID: <20231208160055.GL25616@pendragon.ideasonboard.com>
References: <20231201071907.3080126-1-yunkec@google.com>
 <20231201071907.3080126-12-yunkec@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231201071907.3080126-12-yunkec@google.com>

Hi Yunke,

Thank you for the patch.

On Fri, Dec 01, 2023 at 04:19:02PM +0900, Yunke Cao wrote:
> Added documentation of V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
> V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.

It would be useful to point here to the userspace code that uses those
controls. A link to the appropriate Chrome OS git tree would be useful,
to showcase a real user.

> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
> Changelog since v11:
> - No change.
> Changelog since v10:
> - Added Reviewed-by from Sergey.
> Changelog since v9:
> - No change.
> Changelog since v8:
> - No change.
> Changelog since v7:
> - Fix documentation for automatic exposure based on comment in v7.
> 
>  .../userspace-api/media/drivers/uvcvideo.rst  | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/Documentation/userspace-api/media/drivers/uvcvideo.rst
> index aab4304e6bb5..3dc062221f8b 100644
> --- a/Documentation/userspace-api/media/drivers/uvcvideo.rst
> +++ b/Documentation/userspace-api/media/drivers/uvcvideo.rst
> @@ -181,6 +181,7 @@ Argument: struct uvc_xu_control_mapping
>  	UVC_CTRL_DATA_TYPE_BOOLEAN	Boolean
>  	UVC_CTRL_DATA_TYPE_ENUM		Enumeration
>  	UVC_CTRL_DATA_TYPE_BITMASK	Bitmask
> +	UVC_CTRL_DATA_TYPE_RECT		Rectangular area
>  
>  
>  UVCIOC_CTRL_QUERY - Query a UVC XU control
> @@ -255,3 +256,64 @@ Argument: struct uvc_xu_control_query
>  	__u8	query		Request code to send to the device
>  	__u16	size		Control data size (in bytes)
>  	__u8	*data		Control value
> +
> +
> +Driver-specific V4L2 controls
> +-----------------------------
> +
> +The uvcvideo driver implements the following UVC-specific controls:
> +
> +``V4L2_CID_UVC_REGION_OF_INTEREST_RECT (struct)``
> +	This control determines the region of interest (ROI). ROI is a
> +	rectangular area represented by a struct :c:type:`v4l2_rect`. The
> +	rectangle is in global sensor coordinates and pixel units. It is
> +	independent of the field of view, not impacted by any cropping or
> +	scaling.
> +
> +	Use ``V4L2_CTRL_WHICH_MIN_VAL`` and ``V4L2_CTRL_WHICH_MAX_VAL`` to query
> +	the range of rectangle sizes. The left/top coordinates of a minimum or
> +	maximum rectangle are always 0. For example, a device can have a minimum
> +	ROI rectangle of 1x1@0x0 and a maximum of 640x480@0x0.

Is that actually true ? The UVC 1.5 specification states

    GET_MAX shall return the current Window as specified by
    CT_DIGITAL_WINDOW_CONTROL.

And the window can have non-zero left and right coordinates.

> +
> +	Setting a ROI allows the camera to optimize the capture for the region.
> +	The value of ``V4L2_CID_REGION_OF_INTEREST_AUTO`` control determines
> +	the detailed behavior.
> +
> +
> +``V4L2_CID_UVC_REGION_OF_INTEREST_AUTO (bitmask)``
> +	This determines which, if any, on board features should track to the

s/on board/on-board/

> +	Region of Interest specified by the current value of
> +	``V4L2_CID_UVD__REGION_OF_INTEREST_RECT``.
> +
> +	Max value is a mask indicating all supported Auto Controls.
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_EXPOSURE``
> +      - Setting this to true causes automatic exposure to track the region of

Maybe "Setting this bit causes..." as those values are bit flags, not
booleans. Same below.

> +	interest instead of the whole image.
> +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_IRIS``
> +      - Setting this to true causes automatic iris to track the region of
> +	interest instead of the whole image.
> +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_WHITE_BALANCE``
> +      - Setting this to true causes automatic white balance to track the region
> +	of interest instead of the whole image.
> +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_FOCUS``
> +      - Setting this to true causes automatic focus adjustment to track the
> +	region of interest instead of the whole image.
> +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_FACE_DETECT``
> +      - Setting this to true causes automatic face detection to track the
> +	region of interest instead of the whole image.
> +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK``
> +      - Setting this to true enables automatic face detection and tracking. The
> +	current value of ``V4L2_CID_REGION_OF_INTEREST_RECT`` may be updated by
> +	the driver.
> +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION``
> +      - Setting this to true enables automatic image stabilization. The
> +	current value of ``V4L2_CID_REGION_OF_INTEREST_RECT`` may be updated by
> +	the driver.
> +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY``
> +      - Setting this to true enables automatically capture the specified region

I wonder what this means, the UVC 1.5 specification doesn't document
this bit clearly :-(

> +	with higher quality if possible.

-- 
Regards,

Laurent Pinchart

