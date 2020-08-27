Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9875E2544ED
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 14:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729017AbgH0MY3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 08:24:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728977AbgH0MXs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 08:23:48 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 937E7C061235;
        Thu, 27 Aug 2020 05:23:47 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 0CE80634C87;
        Thu, 27 Aug 2020 15:23:37 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kBGwL-0000XK-Cs; Thu, 27 Aug 2020 15:23:37 +0300
Date:   Thu, 27 Aug 2020 15:23:37 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v10 4/4] media: open.rst: document mc-centric and
 video-node-centric
Message-ID: <20200827122337.GD851@valkosipuli.retiisi.org.uk>
References: <cover.1598512802.git.mchehab+huawei@kernel.org>
 <ce0a0412fb21ba3256c42aa7aeceb7b33bd358ab.1598512802.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce0a0412fb21ba3256c42aa7aeceb7b33bd358ab.1598512802.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Thu, Aug 27, 2020 at 09:21:48AM +0200, Mauro Carvalho Chehab wrote:
> When we added support for omap3, back in 2010, we added a new
> type of V4L2 devices that aren't fully controlled via the V4L2
> device node.
> 
> Yet, we have never clearly documented in the V4L2 specification
> the differences between the two types.
> 
> Let's document them based on the the current implementation.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../userspace-api/media/v4l/open.rst          | 58 +++++++++++++++++--
>  1 file changed, 52 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/open.rst b/Documentation/userspace-api/media/v4l/open.rst
> index b9367e02b884..e9cfbe954918 100644
> --- a/Documentation/userspace-api/media/v4l/open.rst
> +++ b/Documentation/userspace-api/media/v4l/open.rst
> @@ -13,6 +13,52 @@
>  Opening and Closing Devices
>  ***************************
>  
> +.. _v4l2_hardware_control:
> +
> +Controlling a hardware peripheral via V4L2
> +==========================================
> +
> +A V4L2 hardware peripheral is usually complex: support for it is
> +implemented via a bridge driver and often by several additional drivers.

How about this, instead:

Hardware that is supported using the V4L2 uAPI often consists of multiple
devices or peripherals, each of which have their own driver.

> +The bridge driver exposes one or more V4L2 device nodes
> +(see :ref:`v4l2_device_naming`).
> +
> +There are other drivers providing support for other components of
> +the hardware, which may also expose device nodes, called V4L2 sub-devices.
> +
> +When such V4L2 sub-devices are exposed, they allow controlling those
> +other hardware components - usually connected via a serial bus (like
> +I�C, SMBus or SPI). Depending on the bridge driver, those sub-devices
> +can be controlled indirectly via the bridge driver or explicitly via
> +the :ref:`Media Controller <media_controller>` and via the
> +:ref:`V4L2 sub-devices <subdev>`.
> +
> +The devices that require the use of the
> +:ref:`Media Controller <media_controller>` are called **MC-centric**
> +devices. The devices that are fully controlled via V4L2 device nodes
> +are called **video-node-centric**.
> +
> +Userspace can check if a V4L2 hardware peripheral is MC-centric by
> +calling :ref:`VIDIOC_QUERYCAP` and checking the
> +:ref:`device_caps field <device-capabilities>`.
> +
> +If the device returns ``V4L2_CAP_IO_MC`` flag at ``device_caps``,
> +then it is MC-centric, otherwise, it is video-node-centric.
> +
> +It is required for MC-centric hardware to identify the V4L2

s/hardware/drivers/

> +sub-devices and to configure the pipelines via the
> +:ref:`media controller API <media_controller>` before using the peripheral.
> +Also, the sub-devices' configuration shall be controlled via the
> +:ref:`sub-device API <subdev>`.
> +
> +.. note::
> +
> +   A video-node-centric may still provide media-controller and
> +   sub-device interfaces as well.
> +
> +  However, in that case the media-controller and the sub-device
> +  interfaces are read-only and just provide information about the
> +  device. The actual configuration is done via the video nodes.
>  
>  .. _v4l2_device_naming:
>  
> @@ -109,7 +155,7 @@ Related Devices
>  Devices can support several functions. For example video capturing, VBI
>  capturing and radio support.
>  
> -The V4L2 API creates different nodes for each of these functions.
> +The V4L2 API creates different V4L2 device nodes for each of these functions.
>  
>  The V4L2 API was designed with the idea that one device node could
>  support all functions. However, in practice this never worked: this
> @@ -119,17 +165,17 @@ switching a device node between different functions only works when
>  using the streaming I/O API, not with the
>  :ref:`read() <func-read>`/\ :ref:`write() <func-write>` API.
>  
> -Today each device node supports just one function.
> +Today each V4L2 device node supports just one function.
>  
>  Besides video input or output the hardware may also support audio
>  sampling or playback. If so, these functions are implemented as ALSA PCM
>  devices with optional ALSA audio mixer devices.
>  
>  One problem with all these devices is that the V4L2 API makes no
> -provisions to find these related devices. Some really complex devices
> -use the Media Controller (see :ref:`media_controller`) which can be
> -used for this purpose. But most drivers do not use it, and while some
> -code exists that uses sysfs to discover related devices (see
> +provisions to find these related V4L2 device nodes. Some really complex
> +hardware use the Media Controller (see :ref:`media_controller`) which can
> +be used for this purpose. But several drivers do not use it, and while some
> +code exists that uses sysfs to discover related V4L2 device nodes (see
>  libmedia_dev in the
>  `v4l-utils <http://git.linuxtv.org/cgit.cgi/v4l-utils.git/>`__ git
>  repository), there is no library yet that can provide a single API
> 

-- 
Sakari Ailus
