Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7E2478AC7
	for <lists+linux-media@lfdr.de>; Fri, 17 Dec 2021 13:04:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235624AbhLQMEj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Dec 2021 07:04:39 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:40385 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235463AbhLQMEi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Dec 2021 07:04:38 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id B446C240008;
        Fri, 17 Dec 2021 12:04:34 +0000 (UTC)
Date:   Fri, 17 Dec 2021 13:05:27 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH 6/6] media: Documentation: add documentation about subdev
 state
Message-ID: <20211217120527.cljnvbfcnztsnnw5@uno.localdomain>
References: <20211217111836.225013-1-tomi.valkeinen@ideasonboard.com>
 <20211217111836.225013-7-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211217111836.225013-7-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Fri, Dec 17, 2021 at 01:18:36PM +0200, Tomi Valkeinen wrote:
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

s/configuration for the subdev/device configuration/

to avoid repeating subdev

> +struct v4l2_mbus_framefmt, one entry for each pad, and similarly for cropping
> +and composition using struct v4l2_rect.

cropping and composition rectangles

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

Three different spelling of file\.*handle :)

You're rightfully confused :)

~/project/linux$ git grep "file handle" Documentation/ | wc -l
92
~/project/linux$ git grep "filehandle" Documentation/ | wc -l
61
~/project/linux$ git grep "file-handle" Documentation/ | wc -l
1

> +
> +Sub-device drivers can opt-in and use state to manage their active configuration
> +by initializing the subdevice state with a call to v4l2_subdev_init_finalize()
> +before registering the sub-device. They must also call v4l2_subdev_cleanup()
> +to release all the acquired resources before unregistering the sub-device.
> +The core automatically initializes a state for each open file handle where to
> +store the try configurations and releases them at file handle closing time.
> +
> +V4L2 sub-device operations that operate on both the :ref:`ACTIVE and TRY formats
> +<v4l2-subdev-format-whence>` receive the correct state to operate on an

s/an/as an/

> +operation parameter. The sub-device driver can access and modify the
> +configuration stored in the provided state after having locked it by calling
> +:c:func:`v4l2_subdev_lock_state()`. The driver must then call
> +:c:func:`v4l2_subdev_unlock_state()` to unlock the state when done.
> +
> +Operations that do not receive a state parameter implicitly operate on the
> +subdevice active state, which drivers can exclusively access by
> +calling :c:func:`v4l2_subdev_lock_active_state()`. The sub-device active state
> +should equally be released by calling
> +:c:func:`v4l2_subdev_unlock_state()`.
> +
> +In no occasions driver should try to manually access the state stored
> +in the :c:type:`v4l2_subdev` or in the file handle without going
> +through the designated helpers.
> +
> +The V4L2 core will pass either the try- or active-state to various subdev ops.

What about making clear the issue is about callers of the kAPI ?

While the V4L2 core will pass the correct try- or active-state to the
subdevice operations, device drivers might call operations on other
subdevices by using :c:func:`v4l2_subdev_call()` kAPI.

> +Unfortunately not all the callers comply with this yet, and may pass NULL as

Unfortunately not all callers properly support subdevice state
handling yet, and may pass NULL as the state parameter.

> +the active-state. This is only a problem for subdev drivers which use the
> +centrally managed active-state and are used in media pipelines with older
> +subdev drivers. In these cases the called subdev ops must also handle the NULL
> +case. This can be easily managed by the use of
> +v4l2_subdev_validate_and_lock_state() helper.

Do you get the right linking without using :c:func:`..` ?

> +
> +v4l2_subdev_validate_and_lock_state() should only be used when porting an
> +existing driver to the new state management when it cannot be guaranteed that
> +the current callers will pass the state properly. The function prints a notice
> +when the passed state is NULL to encourage the porting of the callers to the
> +new state management.

Awesome!

Thanks for having brought this up to v11!
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j

> +
>  V4L2 sub-device functions and data structures
>  ---------------------------------------------
>
> --
> 2.25.1
>
