Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFA451B3268
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 23:57:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726079AbgDUV4S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 17:56:18 -0400
Received: from mga11.intel.com ([192.55.52.93]:58338 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725850AbgDUV4R (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 17:56:17 -0400
IronPort-SDR: K7uxvnaMQGvSgoVv85pCfS9wWsDbUxSS6cZtyvYTXLrtAgujxKm2qkS6a/eVZuMZ02iHmdVKQB
 1ajxzDJJREcw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2020 14:56:16 -0700
IronPort-SDR: asPLudFKSlXnorjCTZInW86jjPKWHQcTyHhrS9b4cz4j63JH7aDqJ0IPolToNWcVeBITiIcRcl
 4WZxlJyeILSg==
X-IronPort-AV: E=Sophos;i="5.72,411,1580803200"; 
   d="scan'208";a="291733440"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2020 14:56:13 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 601F1204D0; Wed, 22 Apr 2020 00:55:41 +0300 (EEST)
Date:   Wed, 22 Apr 2020 00:55:41 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        andrey.konovalov@linaro.org, laurent.pinchart@ideasonboard.com,
        Hans Verkuil <hans.verkuil@cisco.com>
Subject: Re: [PATCH v4 5/5] v4l: document VIDIOC_SUBDEV_QUERYCAP
Message-ID: <20200421215541.GE5381@paasikivi.fi.intel.com>
References: <20200418103216.140572-1-jacopo@jmondi.org>
 <20200418103216.140572-6-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200418103216.140572-6-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Sat, Apr 18, 2020 at 12:32:16PM +0200, Jacopo Mondi wrote:
> From: Hans Verkuil <hans.verkuil@cisco.com>
> 
> Add documentation for the new VIDIOC_SUBDEV_QUERYCAP ioctl.
> 
> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../userspace-api/media/v4l/user-func.rst     |   1 +
>  .../media/v4l/vidioc-subdev-querycap.rst      | 114 ++++++++++++++++++
>  2 files changed, 115 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/vidioc-subdev-querycap.rst
> 
> diff --git a/Documentation/userspace-api/media/v4l/user-func.rst b/Documentation/userspace-api/media/v4l/user-func.rst
> index f235f88efe89..559cce421d41 100644
> --- a/Documentation/userspace-api/media/v4l/user-func.rst
> +++ b/Documentation/userspace-api/media/v4l/user-func.rst
> @@ -78,6 +78,7 @@ Function Reference
>      vidioc-subdev-g-fmt
>      vidioc-subdev-g-frame-interval
>      vidioc-subdev-g-selection
> +    vidioc-subdev-querycap.rst

.rst looks like extra.

>      vidioc-subscribe-event
>      func-mmap
>      func-munmap
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-querycap.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-querycap.rst
> new file mode 100644
> index 000000000000..d9b2e19e1339
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-querycap.rst
> @@ -0,0 +1,114 @@
> +.. Permission is granted to copy, distribute and/or modify this
> +.. document under the terms of the GNU Free Documentation License,
> +.. Version 1.1 or any later version published by the Free Software
> +.. Foundation, with no Invariant Sections, no Front-Cover Texts
> +.. and no Back-Cover Texts. A copy of the license is included at
> +.. Documentation/userspace-api/media/fdl-appendix.rst.
> +..
> +
> +.. _VIDIOC_SUBDEV_QUERYCAP:
> +
> +****************************
> +ioctl VIDIOC_SUBDEV_QUERYCAP
> +****************************
> +
> +Name
> +====
> +
> +VIDIOC_SUBDEV_QUERYCAP - Query sub-device capabilities
> +
> +
> +Synopsis
> +========
> +
> +.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_QUERYCAP, struct v4l2_subdev_capability *argp )
> +    :name: VIDIOC_SUBDEV_QUERYCAP
> +
> +
> +Arguments
> +=========
> +
> +``fd``
> +    File descriptor returned by :ref:`open() <func-open>`.
> +
> +``argp``
> +    Pointer to struct :c:type:`v4l2_subdev_capability`.
> +
> +
> +Description
> +===========
> +
> +All V4L2 sub-devices support the
> +``VIDIOC_SUBDEV_QUERYCAP`` ioctl. It is used to identify

You could rewrap the paragraph.

> +kernel devices compatible with this specification and to obtain
> +information about driver and hardware capabilities. The ioctl takes a
> +pointer to a struct :c:type:`v4l2_subdev_capability` which is filled by the
> +driver. When the driver is not compatible with this specification the ioctl
> +returns ``ENOTTY`` error code.
> +
> +.. tabularcolumns:: |p{1.5cm}|p{2.5cm}|p{13cm}|
> +
> +.. c:type:: v4l2_subdev_capability
> +
> +.. flat-table:: struct v4l2_subdev_capability
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       3 4 20
> +
> +    * - __u32
> +      - ``version``
> +      - Version number of the driver.
> +
> +        The version reported is provided by the V4L2 subsystem following the
> +        kernel numbering scheme. However, it may not always return the same
> +        version as the kernel if, for example, a stable or
> +        distribution-modified kernel uses the V4L2 stack from a newer kernel.
> +
> +	The version number is formatted using the ``KERNEL_VERSION()``
> +	macro:
> +    * - :cspan:`2`
> +
> +	``#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))``
> +
> +	``__u32 version = KERNEL_VERSION(0, 8, 1);``
> +
> +	``printf ("Version: %u.%u.%u\\n",``
> +
> +	``(version >> 16) & 0xFF, (version >> 8) & 0xFF, version & 0xFF);``
> +    * - __u32
> +      - ``subdev_caps``
> +      - Sub-device capabilities of the opened device, see
> +	:ref:`subdevice-capabilities`.
> +
> +.. tabularcolumns:: |p{6cm}|p{2.2cm}|p{8.8cm}|
> +
> +.. _subdevice-capabilities:
> +
> +.. cssclass:: longtable
> +
> +.. flat-table:: Sub-Device Capabilities Flags
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       3 1 4
> +
> +    * - V4L2_SUBDEV_CAP_RO_SUBDEV
> +      - 0x00000001
> +      - The sub-device device node is registered in read-only mode.
> +        Access to the sub-device ioctls that modify the device state is
> +        restricted. Refer to each individual subdevice ioctl documentation
> +        for a description of which restrictions apply to a read-only sub-device.

Tabs would be nice. Same below (and above, too).

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> +
> +    * - V4L2_SUBDEV_CAP_RW_SUBDEV
> +      - 0x00000002
> +      - The sub-device device node is registered in read/write mode, all the
> +        subdevice ioctls are accessible from userspace.
> +
> +Return Value
> +============
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +ENOTTY
> +    The device node is not a V4L2 sub-device.

-- 
Kind regards,

Sakari Ailus
