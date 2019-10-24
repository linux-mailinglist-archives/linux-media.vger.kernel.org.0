Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A85E9E3442
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 15:32:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393611AbfJXNc1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 09:32:27 -0400
Received: from mga18.intel.com ([134.134.136.126]:45669 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388422AbfJXNc0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 09:32:26 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Oct 2019 06:32:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,224,1569308400"; 
   d="scan'208";a="197115947"
Received: from jjackiew-mobl1.ger.corp.intel.com (HELO mara.localdomain) ([10.249.148.206])
  by fmsmga008.fm.intel.com with ESMTP; 24 Oct 2019 06:32:24 -0700
Received: from sailus by mara.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1iNdF8-00014F-2N; Thu, 24 Oct 2019 16:33:35 +0300
Date:   Thu, 24 Oct 2019 16:33:33 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Cc:     hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: media: *_DEFAULT targets for subdevs
Message-ID: <20191024133333.GE3966@mara.localdomain>
References: <20191024123526.4778-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191024123526.4778-1-ribalda@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Thu, Oct 24, 2019 at 02:35:25PM +0200, Ricardo Ribalda Delgado wrote:
> Some sensors have optical blanking areas, this is, pixels that are
> painted and do not account for light, only noise.
> 
> These special pixels are very useful for calibrating the sensor, but
> should not be displayed on a DEFAULT target.
> 
> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> ---
> 
> v2: Changes by Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Only change CROP_DEFAULT
> 
>  Documentation/media/uapi/v4l/v4l2-selection-targets.rst | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/media/uapi/v4l/v4l2-selection-targets.rst b/Documentation/media/uapi/v4l/v4l2-selection-targets.rst
> index f74f239b0510..41c6674ec283 100644
> --- a/Documentation/media/uapi/v4l/v4l2-selection-targets.rst
> +++ b/Documentation/media/uapi/v4l/v4l2-selection-targets.rst
> @@ -38,8 +38,10 @@ of the two interfaces they are used.
>      * - ``V4L2_SEL_TGT_CROP_DEFAULT``
>        - 0x0001
>        - Suggested cropping rectangle that covers the "whole picture".
> +        This includes only active pixels and excludes other non-active
> +        pixels such as black pixels.
> +      - Yes
>        - Yes
> -      - No
>      * - ``V4L2_SEL_TGT_CROP_BOUNDS``
>        - 0x0002
>        - Bounds of the crop rectangle. All valid crop rectangles fit inside
> @@ -61,7 +63,7 @@ of the two interfaces they are used.
>        - 0x0101
>        - Suggested composition rectangle that covers the "whole picture".
>        - Yes
> -      - No
> +      - Yes

This is COMPOSE_DEFAULT that wasn't meant to be changed. So with this chunk
dropped,

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

>      * - ``V4L2_SEL_TGT_COMPOSE_BOUNDS``
>        - 0x0102
>        - Bounds of the compose rectangle. All valid compose rectangles fit

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
