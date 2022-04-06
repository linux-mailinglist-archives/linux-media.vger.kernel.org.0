Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7E954F65BD
	for <lists+linux-media@lfdr.de>; Wed,  6 Apr 2022 18:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237952AbiDFQn1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Apr 2022 12:43:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237956AbiDFQm0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Apr 2022 12:42:26 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB70ECDB4
        for <linux-media@vger.kernel.org>; Wed,  6 Apr 2022 07:01:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A026FB80EEB
        for <linux-media@vger.kernel.org>; Wed,  6 Apr 2022 14:01:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B0BC385A3;
        Wed,  6 Apr 2022 14:01:31 +0000 (UTC)
Message-ID: <275d0222-b690-0d99-4ef5-72ecb070a2cd@xs4all.nl>
Date:   Wed, 6 Apr 2022 16:01:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v6 8/8] media: Documentation: add documentation about
 subdev state
Content-Language: en-US
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20220324080030.216716-1-tomi.valkeinen@ideasonboard.com>
 <20220324080030.216716-9-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220324080030.216716-9-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-9.5 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 24/03/2022 09:00, Tomi Valkeinen wrote:
> Add documentation about centrally managed subdev state.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../driver-api/media/v4l2-subdev.rst          | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> index 08ea2673b19e..7fa950b1bff0 100644
> --- a/Documentation/driver-api/media/v4l2-subdev.rst
> +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> @@ -518,6 +518,81 @@ The :c:func:`v4l2_i2c_new_subdev` function will call
>  :c:type:`i2c_board_info` structure using the ``client_type`` and the
>  ``addr`` to fill it.
>  
> +Centrally managed subdev active state
> +-------------------------------------
> +
> +Traditionally V4L2 subdev drivers maintained internal state for the active
> +device configuration. This is often implemented as e.g. an array of struct
> +v4l2_mbus_framefmt, one entry for each pad, and similarly for crop and compose
> +rectangles.
> +
> +In addition to the active configuration, each subdev file handle has an array of
> +struct v4l2_subdev_pad_config, managed by the V4L2 core, which contains the try
> +configuration.
> +
> +To simplify the subdev drivers the V4L2 subdev API now optionally supports a
> +centrally managed active configuration represented by
> +:c:type:`v4l2_subdev_state`. One instance of state, which contains the active
> +device configuration, is stored in the sub-device itself as part of
> +the :c:type:`v4l2_subdev` structure, while the core associates a try state to
> +each open file handle, to store the try configuration related to that file
> +handle.
> +
> +Sub-device drivers can opt-in and use state to manage their active configuration
> +by initializing the subdevice state with a call to v4l2_subdev_init_finalize()
> +before registering the sub-device. They must also call v4l2_subdev_cleanup()
> +to release all the allocated resources before unregistering the sub-device.
> +The core automatically allocates and initializes a state for each open file
> +handle to store the try configurations and frees it when closing the file
> +handle.
> +
> +V4L2 sub-device operations that use both the :ref:`ACTIVE and TRY formats
> +<v4l2-subdev-format-whence>` receive the correct state to operate on through
> +the 'state' parameter. The state must be locked and unlocked by the
> +caller by calling :c:func:`v4l2_subdev_lock_state()` and
> +:c:func:`v4l2_subdev_unlock_state()`. The caller can do so by calling the subdev
> +operation through the :c:func:`v4l2_subdev_call_state_active()` macro.
> +
> +Operations that do not receive a state parameter implicitly operate on the
> +subdevice active state, which drivers can exclusively access by
> +calling :c:func:`v4l2_subdev_lock_and_get_active_state()`. The sub-device active
> +state must equally be released by calling :c:func:`v4l2_subdev_unlock_state()`.
> +
> +Drivers must never manually access the state stored in the :c:type:`v4l2_subdev`
> +or in the file handle without going through the designated helpers.
> +
> +While the V4L2 core passes the correct try or active state to the
> +subdevice operations, some existing device drivers pass a NULL state
> +when calling operations with :c:func:`v4l2_subdev_call()`. This legacy
> +construct causes issues with subdevice drivers that let the V4L2 core
> +manage the active state, as they expect to receive the appropriate state
> +as a parameter. To help the conversion of subdevice drivers to a managed
> +active state without having to convert all callers at the same time, the
> +:c:func:`v4l2_subdev_lock_and_return_state()` helper function can be

This is an old name, right? It's no longer called v4l2_subdev_lock_and_return_state.
Note that the commit log of patch 4 also refers to this old name.

Actually, isn't this now replaced by the subdev op wrappers? (I might be wrong,
I don't have much time to review this patch).

> +used by subdevice drivers to retrieve the active state if a NULL state
> +is passed to the subdevice operation.
> +
> +:c:func:`v4l2_subdev_lock_and_return_state()` should only be used when porting
> +an existing driver to the new state management when it cannot be guaranteed
> +that the current callers will pass the state properly. The function prints a
> +notice when the passed state is NULL to encourage the porting of the callers
> +to the new state management.
> +
> +The whole subdev state is in reality split into three parts: the
> +v4l2_subdev_state, subdev controls and subdev driver's internal state. In the
> +future these parts should be combined into a single state. For the time being
> +we need a way to handle the locking for these parts. This can be accomplished
> +by sharing a lock. The v4l2_ctrl_handler already supports this via its 'lock'
> +pointer and the same model is used with states. The driver can do the following
> +before calling v4l2_subdev_init_finalize():
> +
> +.. code-block:: c
> +
> +	sd->ctrl_handler->lock = &priv->mutex;
> +	sd->state_lock = &priv->mutex;
> +
> +This shares the driver's private mutex between the controls and the states.
> +
>  V4L2 sub-device functions and data structures
>  ---------------------------------------------
>  

Regards,

	Hans
