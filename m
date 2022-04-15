Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B844502C08
	for <lists+linux-media@lfdr.de>; Fri, 15 Apr 2022 16:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354589AbiDOOkG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Apr 2022 10:40:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349869AbiDOOkD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Apr 2022 10:40:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D99148303
        for <linux-media@vger.kernel.org>; Fri, 15 Apr 2022 07:37:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-5-129-nat.elisa-mobile.fi [85.76.5.129])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D3EC325B;
        Fri, 15 Apr 2022 16:37:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650033453;
        bh=CJ0DFKRwn3AXqvApfsYWD/PArs4I3zRapd0um8/Tlto=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iIlSqfFj416VJ6UG20a4PujQyrORo557MoMYRGL7q8C65jQ0bluuO+nMuGZC2UlIc
         5TfpzKKWY6DQe1hEFm/7W/NBwq7NhlJL8jveu2kgbCR1xSP8XokF17bhLRpq7so2OS
         387TmVgQrSA8XfmpceFaMDSg+GDxYll6S+v4VqoE=
Date:   Fri, 15 Apr 2022 17:37:20 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc:     linux-media@vger.kernel.org, alain.volmat@foss.st.com,
        hugues.fruchet@foss.st.com, sylvain.petinot@foss.st.com,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 2/5] media: v4l: ctrls: Add a control for temperature
Message-ID: <YlmDIHNQub7eqskK@pendragon.ideasonboard.com>
References: <20220415111845.27130-1-benjamin.mugnier@foss.st.com>
 <20220415111845.27130-3-benjamin.mugnier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220415111845.27130-3-benjamin.mugnier@foss.st.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

Thank you for the patch.

On Fri, Apr 15, 2022 at 01:18:42PM +0200, Benjamin Mugnier wrote:
> Add V4L2_CID_TEMPERATURE control to get temperature from sensor in
> celsius as a volatile and read-only control, and its documentation.
> Useful to monitor thermals from v4l controls for sensors that support
> this.
> 
> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> ---
>  Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst | 3 +++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c                  | 4 ++++
>  include/uapi/linux/v4l2-controls.h                         | 2 ++
>  3 files changed, 9 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> index 4c5061aa9cd4..26fa21f5c45a 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> @@ -661,3 +661,6 @@ enum v4l2_scene_mode -
>  .. [#f1]
>     This control may be changed to a menu control in the future, if more
>     options are required.
> +
> +``V4L2_CID_TEMPERATURE (integer)``
> +    The temperature of the sensor in celsius. This is a read-only control.

I've seen sensors where the temperature sensor has a 1/10th degree
precision. Should we standardize on that ? Anything more precise is
likely overkill.

There are also sensors with multiple temperature sensors. If there are
too many of them I suppose the temperature would be reported in embedded
data, but perhaps not always. How can we prepare for this ?

There are also a few details that I think should be documented. Is the
temperature always read on-demand when reading the control, or updated
periodically ? I would assume most drivers would implement the former,
which means no control notification events will be generated. This
should be documented. Furthermore, do drivers need to support reading
the temperature when the sensor isn't streaming ? If not, when should a
control read ioctl return, the last value, or an error ?

> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 54ca4e6b820b..45ad3edd59e0 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1042,6 +1042,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_UNIT_CELL_SIZE:		return "Unit Cell Size";
>  	case V4L2_CID_CAMERA_ORIENTATION:	return "Camera Orientation";
>  	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
> +	case V4L2_CID_TEMPERATURE:		return "Temperature in °C";
>  
>  	/* FM Radio Modulator controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> @@ -1597,6 +1598,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_RF_TUNER_PLL_LOCK:
>  		*flags |= V4L2_CTRL_FLAG_VOLATILE;
>  		break;
> +	case V4L2_CID_TEMPERATURE:
> +		*flags |= V4L2_CTRL_FLAG_READ_ONLY |
> +			  V4L2_CTRL_FLAG_VOLATILE;
>  	}
>  }
>  EXPORT_SYMBOL(v4l2_ctrl_fill);
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index bb40129446d4..705b4043c2de 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1008,6 +1008,8 @@ enum v4l2_auto_focus_range {
>  
>  #define V4L2_CID_CAMERA_SENSOR_ROTATION		(V4L2_CID_CAMERA_CLASS_BASE+35)
>  
> +#define V4L2_CID_TEMPERATURE			(V4L2_CID_CAMERA_CLASS_BASE+36)
> +
>  /* FM Modulator class control IDs */
>  
>  #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)

-- 
Regards,

Laurent Pinchart
