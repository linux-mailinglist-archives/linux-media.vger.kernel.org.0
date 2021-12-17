Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 056D6478DDF
	for <lists+linux-media@lfdr.de>; Fri, 17 Dec 2021 15:35:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234476AbhLQOfG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Dec 2021 09:35:06 -0500
Received: from ewsoutbound.kpnmail.nl ([195.121.94.170]:19335 "EHLO
        ewsoutbound.kpnmail.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbhLQOfF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Dec 2021 09:35:05 -0500
X-KPN-MessageId: 631ffec7-5f46-11ec-8a6e-005056ab378f
Received: from smtp.kpnmail.nl (unknown [10.31.155.38])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id 631ffec7-5f46-11ec-8a6e-005056ab378f;
        Fri, 17 Dec 2021 15:34:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:from:to:subject:mime-version:date:message-id;
        bh=ixgqKVt/uxT80R1nKt0+mVHZMTzJ7vsX5Bb6IlLcP8s=;
        b=b7+syIJVKGnOgflj46SgrnasVH8CCdxhh6c/9CN6wISE4W34cIiFrO9s3b4hBCNysnxGr/z4le1k6
         QaTtM8jUSPPipFpIW5ipChsunw6T2bTiP9TfeSboPX4lJAC354/xqWin2VyCP00nbXB4Zl4ieyfeAO
         43CuS4XrxGPSwe/5Bp6R8yLfWr+l9vNnAfg6xfLNxf2emZCN/x3exAd0q8Bi9Xk0LD4wUj7fuYjZw5
         lfN/T/baRLszWHyfZs9pOFVNxABYm1vQySellGkk1QIzDk+ep7J6D0eaCyDKNucJt71X/opsyGkW3l
         Nmua1oQHmopd+/vfpC3H08S/Pz4MbGg==
X-KPN-VerifiedSender: No
X-CMASSUN: 33|RP5rhhJK7YImVnbHFRk+2NoyKtveOqahQy+bUu9k789FEX2aT6a5l+QBweEyLyb
 Lh+WA9zbDcA+TfwHc/t1B1Q==
X-Originating-IP: 80.101.105.217
Received: from [192.168.1.10] (marune.xs4all.nl [80.101.105.217])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 858378a0-5f46-11ec-94d2-005056abf0db;
        Fri, 17 Dec 2021 15:35:03 +0100 (CET)
Message-ID: <c1b379c4-242a-2a92-a89d-6b067c8facf7@xs4all.nl>
Date:   Fri, 17 Dec 2021 15:35:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 6/6] media: Documentation: add documentation about
 subdev state
Content-Language: en-US
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211217135022.364954-1-tomi.valkeinen@ideasonboard.com>
 <20211217135022.364954-7-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20211217135022.364954-7-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/12/2021 14:50, Tomi Valkeinen wrote:
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

e.g. as -> as e.g.

> +struct v4l2_mbus_framefmt, one entry for each pad, and similarly for cropping
> +and composition rectangles.
> +
> +In addition to the active configuration, each subdev file-handle has an array of
> +struct v4l2_subdev_pad_config, managed by V4L2 core, which contains the try

by V4L2 -> by the V4L2

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
> 

With those tiny changes:

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans
