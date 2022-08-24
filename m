Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A863A5A0296
	for <lists+linux-media@lfdr.de>; Wed, 24 Aug 2022 22:17:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240199AbiHXURr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Aug 2022 16:17:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232844AbiHXURq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Aug 2022 16:17:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 545323E74A
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 13:17:45 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C2622B3;
        Wed, 24 Aug 2022 22:17:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661372263;
        bh=Q5cjpfv649i53pzKSkEQnmUC7ZriuJdluZGSSTOqeXQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Crip73ruKfoyYAbnEKw3eIFegXLxkKKp9MGlc5JW9zhvaVzwA1Zf9FijXvscpfyfB
         VAkE2pdMjEerGLF9JIv9rDxZWmQUhagET8qiVrNz/82Ej//T2enGjS+U7MXWAV52Xz
         iXWW8FAShjN+hPfGTq4u6zBhr0KX24Ytc622iMIE=
Date:   Wed, 24 Aug 2022 23:17:38 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yunke Cao <yunkec@google.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v7 7/7] media: uvcvideo: document UVC v1.5 ROI
Message-ID: <YwaHYqb2oaHIrK0E@pendragon.ideasonboard.com>
References: <20220628075705.2278044-1-yunkec@google.com>
 <20220628075705.2278044-8-yunkec@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220628075705.2278044-8-yunkec@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yunke,

Thank you for the patch.

On Tue, Jun 28, 2022 at 04:57:05PM +0900, Yunke Cao wrote:
> Added documentation of V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
> V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.
> 
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
>  .../userspace-api/media/drivers/uvcvideo.rst  | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/Documentation/userspace-api/media/drivers/uvcvideo.rst
> index a290f9fadae9..ee4c182aa274 100644
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
> @@ -255,3 +256,63 @@ Argument: struct uvc_xu_control_query
>  	__u8	query		Request code to send to the device
>  	__u16	size		Control data size (in bytes)
>  	__u8	*data		Control value
> +

You can add a second blank line here, as above the "Extension Unit (XU)
support" title.

> +Private V4L2 controls

"Driver-specific V4L2 controls" would be better, those controls are not
private.

> +---------------------
> +
> +A few UVC specific V4L2 control IDs are listed below.

s/UVC specific/UVC-specific/

But I'd write

The uvcvideo driver implements the following UVC-specific controls:

> +
> +``V4L2_CID_UVC_REGION_OF_INTEREST_RECT (struct)``
> +	This control determines the region of interest (ROI). ROI is an

s/is an/is a/

> +	rectangular area represented by a struct :c:type:`v4l2_rect`. The
> +	rectangle is in global sensor coordinates and pixel units. It is
> +	independent of the field of view, not impacted by any cropping or
> +	scaling.
> +
> +	Use ``V4L2_CTRL_WHICH_MIN_VAL`` and ``V4L2_CTRL_WHICH_MAX_VAL`` to query
> +	the range of rectangle sizes. For example, a device can have a minimum
> +	ROI rectangle of 1x1@0x0 and a maximum of 640x480@0x0.

Minimum and maximum values for rectangles are ill-defined. Are the top
and left coordinates always 0 ? If so that should be documented.

> +
> +	Setting a ROI allows the camera to optimize the capture for the region.
> +	The value of ``V4L2_CID_REGION_OF_INTEREST_AUTO`` control determines
> +	the detailed behavior.
> +
> +
> +``V4L2_CID_UVC_REGION_OF_INTEREST_AUTO (bitmask)``
> +	This determines which, if any, on board features should track to the
> +	Region of Interest specified by the current value of
> +	``V4L2_CID_UVD__REGION_OF_INTEREST_RECT``.
> +
> +	Max value is a mask indicating all supported Auto
> +	Controls.

No need to wrap this line.

> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - ``V4L2_REGION_OF_INTEREST_AUTO_EXPOSURE``

s/V4L2/V4L2_UVC/

Same below.

> +      - Setting this to true enables automatic exposure time for the specified

s/exposure time/exposure/ (as it can also include gain)

> +	region.

It's not that it enables automatic exposure for the specified region, is
that it causes the automatic exposure to track the region of interest
instead of the whole image. Same below.

> +    * - ``V4L2_REGION_OF_INTEREST_AUTO_IRIS``
> +      - Setting this to true enables automatic iris aperture for the specified
> +	region.
> +    * - ``V4L2_REGION_OF_INTEREST_AUTO_WHITE_BALANCE``
> +      - Setting this to true enables automatic white balance adjustment for the
> +	specified region.
> +    * - ``V4L2_REGION_OF_INTEREST_AUTO_FOCUS``
> +      - Setting this to true enables automatic focus adjustment for the
> +	specified region.
> +    * - ``V4L2_REGION_OF_INTEREST_AUTO_FACE_DETECT``
> +      - Setting this to true enables automatic face detection for the
> +	specified region.
> +    * - ``V4L2_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK``
> +      - Setting this to true enables automatic face detection and tracking. The
> +	current value of ``V4L2_CID_REGION_OF_INTEREST_RECT`` may be updated by
> +	the driver.
> +    * - ``V4L2_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION``
> +      - Setting this to true enables automatic image stabilization. The
> +	current value of ``V4L2_CID_REGION_OF_INTEREST_RECT`` may be updated by
> +	the driver.

How so ?

> +    * - ``V4L2_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY``
> +      - Setting this to true enables automatically capture the specified region
> +	with higher quality if possible.

Could you please clarify this one ? I'm not sure to understand what it
means.

-- 
Regards,

Laurent Pinchart
