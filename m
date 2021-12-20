Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A07E047B270
	for <lists+linux-media@lfdr.de>; Mon, 20 Dec 2021 18:57:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233520AbhLTR5j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Dec 2021 12:57:39 -0500
Received: from mga17.intel.com ([192.55.52.151]:10217 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233340AbhLTR5i (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Dec 2021 12:57:38 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="220912562"
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; 
   d="scan'208";a="220912562"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 09:56:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; 
   d="scan'208";a="606798724"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 09:56:33 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id CE21321DB2;
        Mon, 20 Dec 2021 19:56:31 +0200 (EET)
Date:   Mon, 20 Dec 2021 19:56:31 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v2 6/6] media: Documentation: add documentation about
 subdev state
Message-ID: <YcDDzzX3XNlE/K05@paasikivi.fi.intel.com>
References: <20211217135022.364954-1-tomi.valkeinen@ideasonboard.com>
 <20211217135022.364954-7-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217135022.364954-7-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

Thanks for the update.

On Fri, Dec 17, 2021 at 03:50:22PM +0200, Tomi Valkeinen wrote:
> Add documentation about centrally managed subdev state.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../driver-api/media/v4l2-subdev.rst          | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 
> diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> index 08ea2673b19e..18b00bd3d6d4 100644
> --- a/Documentation/driver-api/media/v4l2-subdev.rst
> +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> @@ -518,6 +518,63 @@ The :c:func:`v4l2_i2c_new_subdev` function will call
>  :c:type:`i2c_board_info` structure using the ``client_type`` and the
>  ``addr`` to fill it.
>  
> +Centrally managed subdev active state
> +-------------------------------------
> +
> +Traditionally V4L2 subdev drivers maintained internal state for the active
> +device configuration. This is often implemented e.g. as an array of
> +struct v4l2_mbus_framefmt, one entry for each pad, and similarly for cropping
> +and composition rectangles.
> +
> +In addition to the active configuration, each subdev file-handle has an array of
> +struct v4l2_subdev_pad_config, managed by V4L2 core, which contains the try
> +configuration.
> +
> +To simplify the subdev drivers the V4L2 subdev API now optionally supports a
> +centrally managed active configuration represented by
> +:c:type:`v4l2_subdev_state`. One instance of state, which contains the active
> +device configuration, is associated with the sub-device itself as part of
> +the :c:type:`v4l2_subdev` structure, while the core associates to each open
> +file-handle a try state, which contains the configuration valid in the
> +file-handle context only.
> +
> +Sub-device drivers can opt-in and use state to manage their active configuration
> +by initializing the subdevice state with a call to v4l2_subdev_init_finalize()
> +before registering the sub-device. They must also call v4l2_subdev_cleanup()
> +to release all the acquired resources before unregistering the sub-device.
> +The core automatically initializes a state for each open file-handle where to
> +store the try configurations and releases them at file-handle closing time.
> +
> +V4L2 sub-device operations that use both the :ref:`ACTIVE and TRY formats
> +<v4l2-subdev-format-whence>` receive the correct state to operate on as a
> +'state' parameter. The sub-device driver can access and modify the
> +configuration stored in the provided state after having locked it by calling
> +:c:func:`v4l2_subdev_lock_state()`. The driver must then call
> +:c:func:`v4l2_subdev_unlock_state()` to unlock the state when done.
> +
> +Operations that do not receive a state parameter implicitly operate on the
> +subdevice active state, which drivers can exclusively access by
> +calling :c:func:`v4l2_subdev_lock_active_state()`. The sub-device active state
> +must equally be released by calling :c:func:`v4l2_subdev_unlock_state()`.
> +
> +Drivers must never manually access the state stored in the :c:type:`v4l2_subdev`
> +or in the file-handle without going through the designated helpers.

Have you thought how this will interact with controls?

Generally active state information exists for a device in struct
v4l2_subdev_state as well as the device's control handler as control
values. Controls have dependencies to other state information (active and
try).

Until now, drivers have been responsible for serialising access to this
state on their own, mostly using a single mutex. Controls require a mutex
as well, but it's the same mutex independently of whether a driver is
dealing with active or try subdev state.

In other words, if the above is assumed, when you're dealing with try state
that has dependencies to controls, you have to hold both that try state's
mutex as well as the control handler's mutex.

> +
> +While the V4L2 core will pass the correct try- or active-state to the
> +subdevice operations, device drivers might call operations on other
> +subdevices by using :c:func:`v4l2_subdev_call()` kAPI and pass NULL as the
> +state. This is only a problem for subdev drivers which use the
> +centrally managed active-state and are used in media pipelines with older
> +subdev drivers. In these cases the called subdev ops must also handle the NULL
> +case. This can be easily managed by the use of
> +:c:func:`v4l2_subdev_lock_and_return_state()` helper.
> +
> +:c:func:`v4l2_subdev_lock_and_return_state()` should only be used when porting
> +an existing driver to the new state management when it cannot be guaranteed
> +that the current callers will pass the state properly. The function prints a
> +notice when the passed state is NULL to encourage the porting of the callers
> +to the new state management.
> +
>  V4L2 sub-device functions and data structures
>  ---------------------------------------------
>  

-- 
Terveisin,

Sakari Ailus
