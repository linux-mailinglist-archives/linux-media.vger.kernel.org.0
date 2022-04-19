Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7B65506549
	for <lists+linux-media@lfdr.de>; Tue, 19 Apr 2022 09:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239160AbiDSHGT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Apr 2022 03:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237092AbiDSHGS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Apr 2022 03:06:18 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F8B82AE07
        for <linux-media@vger.kernel.org>; Tue, 19 Apr 2022 00:03:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B414DB8119F
        for <linux-media@vger.kernel.org>; Tue, 19 Apr 2022 07:03:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE32C385A7;
        Tue, 19 Apr 2022 07:03:30 +0000 (UTC)
Message-ID: <f236221b-a1b7-8c13-c361-d7592603599c@xs4all.nl>
Date:   Tue, 19 Apr 2022 09:03:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/5] media: v4l: ctrls: Add a control for temperature
Content-Language: en-US
To:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        linux-media@vger.kernel.org
Cc:     alain.volmat@foss.st.com, hugues.fruchet@foss.st.com,
        sylvain.petinot@foss.st.com, dave.stevenson@raspberrypi.com,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
References: <20220415111845.27130-1-benjamin.mugnier@foss.st.com>
 <20220415111845.27130-3-benjamin.mugnier@foss.st.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220415111845.27130-3-benjamin.mugnier@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-9.9 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/04/2022 13:18, Benjamin Mugnier wrote:
> Add V4L2_CID_TEMPERATURE control to get temperature from sensor in
> celsius as a volatile and read-only control, and its documentation.

celsius -> degrees Celsius

(see https://en.wikipedia.org/wiki/Celsius)

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

Ditto

> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 54ca4e6b820b..45ad3edd59e0 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1042,6 +1042,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_UNIT_CELL_SIZE:		return "Unit Cell Size";
>  	case V4L2_CID_CAMERA_ORIENTATION:	return "Camera Orientation";
>  	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
> +	case V4L2_CID_TEMPERATURE:		return "Temperature in °C";

I am not sure how well this ° symbol will work. The V4L2 spec says that this is an
ASCII string, so that doesn't allow for this symbol.

I would just call it "Temperature".

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

Add a break!

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

Does it make sense to add this to CAMERA_CLASS? Can't this be a generic temperature
control? (i.e. in USER_BASE) Any device can have a temperature sensor.

I also think that making this an array control would make sense as well in case there
are multiple temperature sensors.

Brainstorming some more: does this even belong here? Isn't this more a hwmon thing?
E.g. compare this to drivers/nvme/host/hwmon.c.

A hwmon implementation seems to be a more natural mechanism.

Regards,

	Hans

> +
>  /* FM Modulator class control IDs */
>  
>  #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)

