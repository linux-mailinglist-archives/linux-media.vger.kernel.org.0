Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FDD352CD98
	for <lists+linux-media@lfdr.de>; Thu, 19 May 2022 09:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232506AbiESHxB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 May 2022 03:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231534AbiESHw6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 May 2022 03:52:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5775333E10
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 00:52:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E60F7616FC
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 07:52:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16211C34100;
        Thu, 19 May 2022 07:52:53 +0000 (UTC)
Message-ID: <ecc35462-5b21-080d-0256-5133e061df95@xs4all.nl>
Date:   Thu, 19 May 2022 09:52:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 2/6] media: v4l2_ctrl: Add region of interest auto
 control
Content-Language: en-US
To:     Yunke Cao <yunkec@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
References: <20220518062412.2375586-1-yunkec@google.com>
 <20220518062412.2375586-3-yunkec@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220518062412.2375586-3-yunkec@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/18/22 08:24, Yunke Cao wrote:
> Follows the UVC v1.5 class specification.
> 
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
> Changelog since v2:
> - Better documentation.
> - Rename V4L2_CID_REGION_OF_INTEREST_AUTO_EXPOSURE to
>   V4L2_REGION_OF_INTEREST_AUTO_EXPOSURE, etc. The bit masks shouldn't
>   have "CID" in it.
> 
>  .../media/v4l/ext-ctrls-camera.rst            | 39 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  3 ++
>  include/uapi/linux/v4l2-controls.h            |  9 +++++
>  3 files changed, 51 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> index c988a72b97b2..c26c28cfcf6a 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> @@ -671,3 +671,42 @@ enum v4l2_scene_mode -
>     Setting a region of interest allows the camera to optimize the capture for
>     the region. The value of ``V4L2_CID_REGION_OF_INTEREST_AUTO`` control
>     determines the detailed behavior.
> +
> +``V4L2_CID_REGION_OF_INTEREST_AUTO (bitmask)``
> +    This determines which, if any, on board features should track to the
> +    Region of Interest specified by the current value of
> +    ``V4L2_CID_REGION_OF_INTEREST_RECT``.
> +
> +    Max value is a mask indicating all supported Auto
> +    Controls.
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - ``V4L2_REGION_OF_INTEREST_AUTO_EXPOSURE``
> +      - Setting this to true enables automatic exposure time for the specified
> +  	region.
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
> +      - Setting this to true enables automatic detection and tracking. The

"AUTO_DETECT": detect what? Faces?

> +	current value of ``V4L2_CID_REGION_OF_INTEREST_RECT`` may be updated by
> +	the firmware.

I'd say 'driver' instead of 'firmware'.

> +    * - ``V4L2_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION``
> +      - Setting this to true enables automatic image stabilization. The
> +	current value of ``V4L2_CID_REGION_OF_INTEREST_RECT`` may be updated by
> +	the firmware.

Ditto.

> +    * - ``V4L2_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY``
> +      - Setting this to true enables automatically capture the specified region
> +	with higher quality if possible.
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 95f39a2d2ad2..220afc4d5244 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1043,6 +1043,8 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_CAMERA_ORIENTATION:	return "Camera Orientation";
>  	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
>  	case V4L2_CID_REGION_OF_INTEREST_RECT:  return "Region Of Interest Rectangle";
> +	case V4L2_CID_REGION_OF_INTEREST_AUTO:  return "Region Of Interest Auto Controls";
> +
>  
>  	/* FM Radio Modulator controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> @@ -1415,6 +1417,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_JPEG_ACTIVE_MARKER:
>  	case V4L2_CID_3A_LOCK:
>  	case V4L2_CID_AUTO_FOCUS_STATUS:
> +	case V4L2_CID_REGION_OF_INTEREST_AUTO:
>  	case V4L2_CID_DV_TX_HOTPLUG:
>  	case V4L2_CID_DV_TX_RXSENSE:
>  	case V4L2_CID_DV_TX_EDID_PRESENT:
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 499fcddb6254..13db0638533c 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1009,6 +1009,15 @@ enum v4l2_auto_focus_range {
>  #define V4L2_CID_CAMERA_SENSOR_ROTATION		(V4L2_CID_CAMERA_CLASS_BASE+35)
>  
>  #define V4L2_CID_REGION_OF_INTEREST_RECT	(V4L2_CID_CAMERA_CLASS_BASE+36)
> +#define V4L2_CID_REGION_OF_INTEREST_AUTO	(V4L2_CID_CAMERA_CLASS_BASE+37)
> +#define V4L2_REGION_OF_INTEREST_AUTO_EXPOSURE			(1 << 0)
> +#define V4L2_REGION_OF_INTEREST_AUTO_IRIS			(1 << 1)
> +#define V4L2_REGION_OF_INTEREST_AUTO_WHITE_BALANCE		(1 << 2)
> +#define V4L2_REGION_OF_INTEREST_AUTO_FOCUS			(1 << 3)
> +#define V4L2_REGION_OF_INTEREST_AUTO_FACE_DETECT		(1 << 4)
> +#define V4L2_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK		(1 << 5)
> +#define V4L2_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION	(1 << 6)
> +#define V4L2_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY		(1 << 7)
>  
>  /* FM Modulator class control IDs */
>  

Regards,

	Hans
