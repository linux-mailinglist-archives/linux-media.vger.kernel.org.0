Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD11E4CA0AE
	for <lists+linux-media@lfdr.de>; Wed,  2 Mar 2022 10:26:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235652AbiCBJ1Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Mar 2022 04:27:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232395AbiCBJ1Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Mar 2022 04:27:24 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A355B6E56A
        for <linux-media@vger.kernel.org>; Wed,  2 Mar 2022 01:26:41 -0800 (PST)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23F1B9FF;
        Wed,  2 Mar 2022 10:26:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646213199;
        bh=6Zwguosj8xYbihM5zVCZG9Kh7fEbQeXrh3H5VM6bhlc=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=S70swRMlgmUJoeprQ1gzGy9yYbBLjON1zTnUp7ApSzphfTaTGQeLbTlv2K6UfCr5V
         ARNQ0NKiGYtFoJNTX11xYw2Si4XwT1yn7VqosiPrCpehF/oiJ3tbVh6nIW+vzjw6Pd
         TP9c0wG0xDUWkW1NHT91NtIFgpcpCHWLsRIjDlfg=
Message-ID: <dd1f4604-a5cd-7ec2-4698-3974f3c61be8@ideasonboard.com>
Date:   Wed, 2 Mar 2022 11:26:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 6/6] media: Documentation: add documentation about
 subdev state
Content-Language: en-US
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20220301105548.305191-1-tomi.valkeinen@ideasonboard.com>
 <20220301105548.305191-7-tomi.valkeinen@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220301105548.305191-7-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/03/2022 12:55, Tomi Valkeinen wrote:
> Add documentation about centrally managed subdev state.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   .../driver-api/media/v4l2-subdev.rst          | 75 +++++++++++++++++++
>   1 file changed, 75 insertions(+)
> 
> diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> index 08ea2673b19e..115211cef4d1 100644
> --- a/Documentation/driver-api/media/v4l2-subdev.rst
> +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> @@ -518,6 +518,81 @@ The :c:func:`v4l2_i2c_new_subdev` function will call
>   :c:type:`i2c_board_info` structure using the ``client_type`` and the
>   ``addr`` to fill it.
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
> +.. code-block:: python
> +
> +	sd->ctrl_handler->lock = &priv->mutex;
> +	sd->state_lock = &priv->mutex;
> +

That is obviously supposed to be a c code-block, not python...

  Tomi
