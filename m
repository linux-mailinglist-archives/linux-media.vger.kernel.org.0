Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7686E2EA4
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 12:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407358AbfJXKSy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 06:18:54 -0400
Received: from mga12.intel.com ([192.55.52.136]:62818 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407344AbfJXKSy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 06:18:54 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Oct 2019 03:18:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,224,1569308400"; 
   d="scan'208";a="373170458"
Received: from jjackiew-mobl1.ger.corp.intel.com (HELO mara.localdomain) ([10.249.148.206])
  by orsmga005.jf.intel.com with ESMTP; 24 Oct 2019 03:18:50 -0700
Received: from sailus by mara.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1iNaDo-00012x-KU; Thu, 24 Oct 2019 13:20:00 +0300
Date:   Thu, 24 Oct 2019 13:19:59 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Cc:     hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: media: *_DEFAULT targets for subdevs
Message-ID: <20191024101959.GA3966@mara.localdomain>
References: <20191024084014.22424-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191024084014.22424-1-ribalda@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Thu, Oct 24, 2019 at 10:40:14AM +0200, Ricardo Ribalda Delgado wrote:
> Some sensors have optical blanking areas, this is, pixels that are
> painted and do not account for light, only noise.
> 
> These special pixels are very useful for calibrating the sensor, but
> should not be displayed on a DEFAULT target.
> 
> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> ---
>  .../media/uapi/v4l/v4l2-selection-targets.rst | 24 ++++---------------
>  1 file changed, 5 insertions(+), 19 deletions(-)
> 
> diff --git a/Documentation/media/uapi/v4l/v4l2-selection-targets.rst b/Documentation/media/uapi/v4l/v4l2-selection-targets.rst
> index f74f239b0510..4b356f66525e 100644
> --- a/Documentation/media/uapi/v4l/v4l2-selection-targets.rst
> +++ b/Documentation/media/uapi/v4l/v4l2-selection-targets.rst
> @@ -19,7 +19,7 @@ of the two interfaces they are used.
>  
>  .. _v4l2-selection-targets-table:
>  
> -.. tabularcolumns:: |p{6.0cm}|p{1.4cm}|p{7.4cm}|p{1.2cm}|p{1.4cm}|
> +.. tabularcolumns:: |p{6.0cm}|p{1.4cm}|p{10.0cm}|
>  
>  .. flat-table:: Selection target definitions
>      :header-rows:  1
> @@ -28,49 +28,35 @@ of the two interfaces they are used.
>      * - Target name
>        - id
>        - Definition
> -      - Valid for V4L2
> -      - Valid for V4L2 subdev
>      * - ``V4L2_SEL_TGT_CROP``
>        - 0x0000
>        - Crop rectangle. Defines the cropped area.
> -      - Yes
> -      - Yes
>      * - ``V4L2_SEL_TGT_CROP_DEFAULT``
>        - 0x0001
>        - Suggested cropping rectangle that covers the "whole picture".
> -      - Yes
> -      - No
> +        This includes only active pixels and excludes other non-active
> +        pixels such as Optical Blanking.

s/Optical Blanking/black pixels/

>      * - ``V4L2_SEL_TGT_CROP_BOUNDS``
>        - 0x0002
>        - Bounds of the crop rectangle. All valid crop rectangles fit inside
>  	the crop bounds rectangle.
> -      - Yes
> -      - Yes
>      * - ``V4L2_SEL_TGT_NATIVE_SIZE``
>        - 0x0003
>        - The native size of the device, e.g. a sensor's pixel array.
>  	``left`` and ``top`` fields are zero for this target.
> -      - Yes
> -      - Yes
>      * - ``V4L2_SEL_TGT_COMPOSE``
>        - 0x0100
>        - Compose rectangle. Used to configure scaling and composition.
> -      - Yes
> -      - Yes
>      * - ``V4L2_SEL_TGT_COMPOSE_DEFAULT``
>        - 0x0101
>        - Suggested composition rectangle that covers the "whole picture".
> -      - Yes
> -      - No
> +        This includes only active pixels and excludes other non-active
> +        pixels such as Optical Blanking.

This isn't relevant for the compose default.

>      * - ``V4L2_SEL_TGT_COMPOSE_BOUNDS``
>        - 0x0102
>        - Bounds of the compose rectangle. All valid compose rectangles fit
>  	inside the compose bounds rectangle.
> -      - Yes
> -      - Yes
>      * - ``V4L2_SEL_TGT_COMPOSE_PADDED``
>        - 0x0103
>        - The active area and all padding pixels that are inserted or
>  	modified by hardware.
> -      - Yes
> -      - No

The padding refers to the dimensions of the memory buffer. I don't think the
intent is to support that on sub-devices, is it?

Please just change the CROP_DEFAULT, not the rest.

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
