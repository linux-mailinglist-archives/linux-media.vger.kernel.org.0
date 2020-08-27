Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DDA82542CE
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 11:55:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727986AbgH0JzK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 05:55:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbgH0JzK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 05:55:10 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FE70C061264;
        Thu, 27 Aug 2020 02:55:08 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id DFFEA634C87;
        Thu, 27 Aug 2020 12:54:56 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kBEcT-0000Wi-9P; Thu, 27 Aug 2020 12:54:57 +0300
Date:   Thu, 27 Aug 2020 12:54:57 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v10 1/4] media: open.rst: better document device node
 naming
Message-ID: <20200827095457.GB851@valkosipuli.retiisi.org.uk>
References: <cover.1598512802.git.mchehab+huawei@kernel.org>
 <b2eec3a6928660ca6a0f18580725026771669787.1598512802.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2eec3a6928660ca6a0f18580725026771669787.1598512802.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Thanks for working on this!

On Thu, Aug 27, 2020 at 09:21:45AM +0200, Mauro Carvalho Chehab wrote:
> Right now, only kAPI documentation describes the device naming.
> However, such description is needed at the uAPI too. Add it,
> and describe how to get an unique identifier for a given device.
> 
> Acked-by: Hans Verkuil <hans.verkuil@cisco.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../userspace-api/media/v4l/open.rst          | 43 +++++++++++++++++--
>  1 file changed, 40 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/open.rst b/Documentation/userspace-api/media/v4l/open.rst
> index 38046ef20141..332763053292 100644
> --- a/Documentation/userspace-api/media/v4l/open.rst
> +++ b/Documentation/userspace-api/media/v4l/open.rst
> @@ -14,12 +14,14 @@ Opening and Closing Devices
>  ***************************
>  
>  
> -Device Naming
> -=============
> +.. _v4l2_device_naming:
> +
> +V4L2 Device Node Naming
> +=======================
>  
>  V4L2 drivers are implemented as kernel modules, loaded manually by the
>  system administrator or automatically when a device is first discovered.
> -The driver modules plug into the "videodev" kernel module. It provides
> +The driver modules plug into the ``videodev`` kernel module. It provides
>  helper functions and a common application interface specified in this
>  document.
>  
> @@ -30,6 +32,41 @@ option CONFIG_VIDEO_FIXED_MINOR_RANGES. In that case minor numbers
>  are allocated in ranges depending on the device node type (video, radio,
>  etc.).
>  
> +The device nodes supported by the Video4Linux subsystem are:
> +
> +======================== ====================================================
> +Default device node name Usage
> +======================== ====================================================
> +``/dev/videoX``		 Video and metadata for capture/output devices
> +``/dev/vbiX``		 Vertical blank data (i.e. closed captions, teletext)
> +``/dev/radioX``		 Radio tuners and modulators
> +``/dev/swradioX``	 Software Defined Radio tuners and modulators
> +``/dev/v4l-touchX``	 Touch sensors
> +``/dev/v4l-subdevX``	 Video sub-devices (used by sensors and other
> +			 components of the hardware peripheral)\ [#]_
> +======================== ====================================================
> +
> +Where ``X`` is a non-negative number.

s/number/integer/

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> +
> +.. note::
> +
> +   1. The actual device node name is system-dependent, as udev rules may apply.
> +   2. There is no guarantee that ``X`` will remain the same for the same
> +      device, as the number depends on the device driver's probe order.
> +      If you need an unique name, udev default rules produce
> +      ``/dev/v4l/by-id/`` and ``/dev/v4l/by-path/`` directories containing
> +      links that can be used uniquely to identify a V4L2 device node::
> +
> +	$ tree /dev/v4l
> +	/dev/v4l
> +	├── by-id
> +	│   └── usb-OmniVision._USB_Camera-B4.04.27.1-video-index0 -> ../../video0
> +	└── by-path
> +	    └── pci-0000:00:14.0-usb-0:2:1.0-video-index0 -> ../../video0
> +
> +.. [#] **V4L2 sub-device nodes** (e. g. ``/dev/v4l-subdevX``) use a different
> +       set of system calls, as covered at :ref:`subdev`.
> +
>  Many drivers support "video_nr", "radio_nr" or "vbi_nr" module
>  options to select specific video/radio/vbi node numbers. This allows the
>  user to request that the device node is named e.g. /dev/video5 instead
> 

-- 
Sakari Ailus
