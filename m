Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0381B478A81
	for <lists+linux-media@lfdr.de>; Fri, 17 Dec 2021 12:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233573AbhLQL5N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Dec 2021 06:57:13 -0500
Received: from ewsoutbound.kpnmail.nl ([195.121.94.167]:19022 "EHLO
        ewsoutbound.kpnmail.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbhLQL5M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Dec 2021 06:57:12 -0500
X-KPN-MessageId: 6664c33a-5f30-11ec-9a2e-005056abbe64
Received: from smtp.kpnmail.nl (unknown [10.31.155.39])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id 6664c33a-5f30-11ec-9a2e-005056abbe64;
        Fri, 17 Dec 2021 12:56:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:from:to:subject:mime-version:date:message-id;
        bh=y8kP6noYuqAinIuHNL2DS/j8IYHnXw8s7WXOFrCoVE4=;
        b=CjPKrN1lXl6TOBMQExU2/PxPawNkdaLnX3VXhzD97J0NTUTcMkCk4pRpPra/+xh8Lk+FkvKSkMFNq
         NH6ieHNb54agO7BhgG9Gkus3OW7zToDEHe8XSN0vPpi7Q7ilY0pNNz2kqqrfRLy6aYLlk+UAms7xZw
         t/8bw0uCBLDOTIFd876gLRA0TAAF/XXNfzSjMLxpFIUGFaeSdi5+2yEuiFkUoArie1tseENYIwBU7H
         LpbqcgucHD1eiSDN3z7yrB4huX0GSvhbWg7X1BaKbxCWJozBSfL9PM+f2t1k541dZwso/e0PrTpqYH
         ecLEDZ8GWDGKKpdn4wajMkcPHpUICKQ==
X-KPN-VerifiedSender: No
X-CMASSUN: 33|xqqnQTH2kJ2JBc4uyQS2kMu0nLeywlHzR2zTaLBVy6PLxJvLszDkfHk0k9T99Ue
 dvRLGmexUhGDvKTF87jGXpg==
X-Originating-IP: 80.101.105.217
Received: from [192.168.1.10] (marune.xs4all.nl [80.101.105.217])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 76e46f3c-5f30-11ec-81f5-005056ab7447;
        Fri, 17 Dec 2021 12:57:10 +0100 (CET)
Message-ID: <9be7b6cc-db3a-5177-7b32-84a4bb77839f@xs4all.nl>
Date:   Fri, 17 Dec 2021 12:57:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 6/6] media: Documentation: add documentation about subdev
 state
Content-Language: en-US
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211217111836.225013-1-tomi.valkeinen@ideasonboard.com>
 <20211217111836.225013-7-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20211217111836.225013-7-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/12/2021 12:18, Tomi Valkeinen wrote:
> Add documentation about centrally managed subdev state.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../driver-api/media/v4l2-subdev.rst          | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> index 08ea2673b19e..f0ba04c80563 100644
> --- a/Documentation/driver-api/media/v4l2-subdev.rst
> +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> @@ -518,6 +518,64 @@ The :c:func:`v4l2_i2c_new_subdev` function will call
>  :c:type:`i2c_board_info` structure using the ``client_type`` and the
>  ``addr`` to fill it.
>  
> +Centrally managed subdev active state
> +-------------------------------------
> +
> +Traditionally V4L2 subdev drivers maintained internal state for the active
> +configuration for the subdev. This is often implemented e.g. as an array of
> +struct v4l2_mbus_framefmt, one entry for each pad, and similarly for cropping
> +and composition using struct v4l2_rect.
> +
> +In addition to the active configuration, each subdev filehandle has an array of
> +struct v4l2_subdev_pad_config, managed by V4L2 core, which contains the try
> +configuration.
> +
> +To simplify the subdev drivers the V4L2 subdev API now optionally supports a
> +centrally managed active configuration represented by
> +:c:type:`v4l2_subdev_state`. One instance of state, which contains the active
> +device configuration, is associated with the sub-device itself as part of
> +the :c:type:`v4l2_subdev` structure, while the core associates to each open
> +file handle a try state, which contains the configuration valid in the
> +file-handle context only.
> +
> +Sub-device drivers can opt-in and use state to manage their active configuration
> +by initializing the subdevice state with a call to v4l2_subdev_init_finalize()
> +before registering the sub-device. They must also call v4l2_subdev_cleanup()
> +to release all the acquired resources before unregistering the sub-device.
> +The core automatically initializes a state for each open file handle where to
> +store the try configurations and releases them at file handle closing time.
> +
> +V4L2 sub-device operations that operate on both the :ref:`ACTIVE and TRY formats

"operations that operate on": yuck.

How about: "operations that use"

> +<v4l2-subdev-format-whence>` receive the correct state to operate on an
> +operation parameter. The sub-device driver can access and modify the

"operate on an operation parameter"?

I think you mean: "operate on as a 'state' parameter"

> +configuration stored in the provided state after having locked it by calling
> +:c:func:`v4l2_subdev_lock_state()`. The driver must then call
> +:c:func:`v4l2_subdev_unlock_state()` to unlock the state when done.
> +
> +Operations that do not receive a state parameter implicitly operate on the
> +subdevice active state, which drivers can exclusively access by
> +calling :c:func:`v4l2_subdev_lock_active_state()`. The sub-device active state
> +should equally be released by calling

should -> must

> +:c:func:`v4l2_subdev_unlock_state()`.
> +
> +In no occasions driver should try to manually access the state stored

In no occasions driver should try" -> "Drivers must never try"

> +in the :c:type:`v4l2_subdev` or in the file handle without going
> +through the designated helpers.
> +
> +The V4L2 core will pass either the try- or active-state to various subdev ops.
> +Unfortunately not all the callers comply with this yet, and may pass NULL as
> +the active-state. This is only a problem for subdev drivers which use the
> +centrally managed active-state and are used in media pipelines with older
> +subdev drivers. In these cases the called subdev ops must also handle the NULL
> +case. This can be easily managed by the use of
> +v4l2_subdev_validate_and_lock_state() helper.
> +
> +v4l2_subdev_validate_and_lock_state() should only be used when porting an
> +existing driver to the new state management when it cannot be guaranteed that
> +the current callers will pass the state properly. The function prints a notice
> +when the passed state is NULL to encourage the porting of the callers to the
> +new state management.
> +
>  V4L2 sub-device functions and data structures
>  ---------------------------------------------
>  
> 

Regards,

	Hans
