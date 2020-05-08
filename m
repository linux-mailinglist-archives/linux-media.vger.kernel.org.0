Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40CC31CB03D
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 15:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728108AbgEHNYl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 09:24:41 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:33139 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727790AbgEHNYj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 May 2020 09:24:39 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id X2zRj0wG08hmdX2zUjIM0d; Fri, 08 May 2020 15:24:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1588944277; bh=y0qduKgAN2HKbhNMZ2UTxnwtXkJ/XezEb1mBxsMg1Mk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Uaq/5rLj3AvYvarBGncYOwW46hRo2tO7lSt4f0q5ilLgmyk+Z66llQYkZ0pUh8T7V
         P0hRW7yGAepDl5wMUDR3wb/m//tn6mUjbiZfB9msCAVU2CmXAiwoY26K+/ZaH8izlE
         tojQbwq82pxsN+q3q2tvW7TuQjixLDI5EcRI8zBoPfXBbfRNfMDOrNOMIZWoL4gN5t
         2g0jfe2ipZ0ywLBCpNRAHMNbO5/BlmNbze9LZynLxRDge3qL3jwW9yFGpCfkvmOIsD
         Z2E6lepokyWmFmfmB6z8rGtuR/f+mAmN+71d82hPD0Q06rUpdBdZ1lffEH80FWdDBC
         osNECBryVTYuQ==
Subject: Re: [PATCH v9 1/5] media: open.rst: better document device node
 naming
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>
References: <cover.1588943181.git.mchehab+huawei@kernel.org>
 <dac0e7a2b8511e9fc3499dbf92abebe3eb6eb6da.1588943181.git.mchehab+huawei@kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <ed58ee26-251c-6ea9-e55b-7d1fd34e0f57@xs4all.nl>
Date:   Fri, 8 May 2020 15:24:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <dac0e7a2b8511e9fc3499dbf92abebe3eb6eb6da.1588943181.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfP9AufX+qfhAq6n3AZvob/46+QszY1vTgeLuUWfd3IiIhNa2vh9gyeXrUmqeITVXqdJ4qbWclixna/plgAYD4VvvpU5iRiC5LbzoOskY03IQVsqZlJPA
 tohJbOZSD5KgaDDQ3ya8maG9Fi6Rb8U77SCNI5c+DCQl4v6W4yLn/QpqaSO+lv30EdeRB8iyYk8XL0qbzJicPvE17SMDWGdxYiqHt30mqQuoNBIqoBOHhIQS
 KV9pxC5ixgF3e3ngIfbmfEsflXUao7vY8zEjmbW3LGhyuM3XFPaLPrgrMsI2s/BwqATnDMCQ1CA/aky3STxRo981SI4V/rMLNOoJHgKye2seIrHERsDF2WwG
 o+fjXEDS
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/05/2020 15:10, Mauro Carvalho Chehab wrote:
> Right now, only kAPI documentation describes the device naming.
> However, such description is needed at the uAPI too. Add it,
> and describe how to get an unique identify for a given device.

identifier

> 
> Acked-by: Hans Verkuil <hans.verkuil@cisco.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../userspace-api/media/v4l/open.rst          | 43 +++++++++++++++++--
>  1 file changed, 40 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/open.rst b/Documentation/userspace-api/media/v4l/open.rst
> index 38046ef20141..86816b247a17 100644
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
> +======================== ======================================================
> +Default device node name Usage
> +======================== ======================================================
> +``/dev/videoX``		 Video input/output devices

Also metadata input/output devices.

I would prefer capture/output given the traditional names that V4L2 uses.

> +``/dev/vbiX``		 Vertical blank data (i.e. closed captions, teletext)
> +``/dev/radioX``		 Radio tuners and modulators
> +``/dev/swradioX``	 Software Defined Radio tuners and modulators
> +``/dev/v4l-touchX``	 Touch sensors
> +``/dev/v4l-sudevX``	 Video sub-devices (used by sensors and other I2C

sudevX -> subdevX

You made this typo in more places, it's best to search and replace.

> +			 devices)\ [#]_

That suggests that subdevs are i2c devices, they can be any processing block on
any bus.

> +======================== ======================================================
> +
> +Where ``X`` is a non-negative number.
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
> +.. [#] **V4L2 sub-device nodes** (e. g. ``/dev/v4l-sudevX``) use a different
> +       set of system calls, as covered at :ref:`subdev`.
> +
>  Many drivers support "video_nr", "radio_nr" or "vbi_nr" module
>  options to select specific video/radio/vbi node numbers. This allows the
>  user to request that the device node is named e.g. /dev/video5 instead

It looks like there is a missing period at the end of the sentence.

> 

Regards,

	Hans
