Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4C898E526
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 09:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730079AbfHOHBe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 03:01:34 -0400
Received: from mga02.intel.com ([134.134.136.20]:22803 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726384AbfHOHBe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 03:01:34 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Aug 2019 00:01:33 -0700
X-IronPort-AV: E=Sophos;i="5.64,388,1559545200"; 
   d="scan'208";a="260742981"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Aug 2019 00:01:31 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 2F5A52069D; Thu, 15 Aug 2019 10:00:25 +0300 (EEST)
Date:   Thu, 15 Aug 2019 10:00:25 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 2/5] media: v4l2-ctrl: Document V4L2_CID_LOCATION
Message-ID: <20190815070025.GK6133@paasikivi.fi.intel.com>
References: <20190814202815.32491-1-jacopo@jmondi.org>
 <20190814202815.32491-3-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190814202815.32491-3-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Wed, Aug 14, 2019 at 10:28:12PM +0200, Jacopo Mondi wrote:
> Add documentation for the V4L2_CID_LOCATION camera control. The newly
> added read-only control reports the camera device mounting position.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../media/uapi/v4l/ext-ctrls-camera.rst       | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> index 51c1d5c9eb00..fc0a02eee6d4 100644
> --- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> +++ b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> @@ -510,6 +510,29 @@ enum v4l2_scene_mode -
>      value down. A value of zero stops the motion if one is in progress
>      and has no effect otherwise.
> 
> +``V4L2_CID_LOCATION (integer)``
> +    This read-only control describes the camera location by reporting its
> +    mounting position on the device where the camera is installed. This
> +    control is particularly meaningful for devices which have a well defined
> +    orientation, such as phones, laptops and portable devices as the camera
> +    location is expressed as a position relative to the device intended
> +    usage position. In example, a camera installed on the user-facing side

s/In/For/

> +    of a phone device is said to be installed in the ``V4L2_LOCATION_FRONT``
> +    position.
> +
> +
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - ``V4L2_LOCATION_FRONT``
> +      - The camera device is located on the front side of the device.
> +    * - ``V4L2_LOCATION_BACK``
> +      - The camera device is located on the back side of the device.
> +
> +
> +
>  .. [#f1]
>     This control may be changed to a menu control in the future, if more
>     options are required.

There's an effective limit of 64 for menus. ACPI has less than ten
different locations for a device, I think 64 will be enough here.

So I'd be actually in favour of switching to a menu.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
