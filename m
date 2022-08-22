Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4D5C59BDAB
	for <lists+linux-media@lfdr.de>; Mon, 22 Aug 2022 12:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbiHVKhO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Aug 2022 06:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbiHVKhN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Aug 2022 06:37:13 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1EC82FFC0
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 03:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661164632; x=1692700632;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VklWvAJNey9fPkBgQ2t7MaL2kx6ANNZWnY9jskBSDms=;
  b=gFfMiZCJN+Q/MWGNgKACMgtfwvjqPVC06Sl7gRmFutlKiy+ovE5/ERxU
   sAkwD3tS7mVTooL7xs4hO5n2blh22FFAj5hQqetchhT/mg8dMsNiL4njK
   RarZ8v1g1ct4Jn4XBAVIBXm/kMXpZzTbZzMJRtYM0GxDkJx2BB5LhHRoc
   MfKDCYEKlirfWfroKqUC0LO5QhWBIVmIvZjGykTV9qLeqZpONN6naFlAx
   4ZxKlCEM4S9+fVyz6c3BtXq0KAEAQks4nuULbfi+d/SZKeosLeRQKy5wg
   J4AByto4q5auxUBjYJgLHgl5uskAGiec1/trxsR3pHweIHsFlbKgFdIJ/
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10446"; a="273134114"
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; 
   d="scan'208";a="273134114"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2022 03:37:11 -0700
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; 
   d="scan'208";a="784807172"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2022 03:37:09 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 053BA2052A;
        Mon, 22 Aug 2022 13:37:07 +0300 (EEST)
Date:   Mon, 22 Aug 2022 10:37:06 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc:     linux-media@vger.kernel.org, alain.volmat@foss.st.com,
        hugues.fruchet@foss.st.com, sylvain.petinot@foss.st.com,
        dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v3 3/5] media: uapi: Add ST VGXY61 header file
Message-ID: <YwNcUpsw1psudCOC@paasikivi.fi.intel.com>
References: <20220512074037.3829926-1-benjamin.mugnier@foss.st.com>
 <20220512074037.3829926-4-benjamin.mugnier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512074037.3829926-4-benjamin.mugnier@foss.st.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Thu, May 12, 2022 at 09:40:35AM +0200, Benjamin Mugnier wrote:
> Define an HDR control in it, and adds its documentation in st-vgxy61.rst
> file.
> 
> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> ---
>  .../userspace-api/media/drivers/st-vgxy61.rst | 23 +++++++++++++++++++
>  include/uapi/linux/st-vgxy61.h                | 15 ++++++++++++
>  2 files changed, 38 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/drivers/st-vgxy61.rst
>  create mode 100644 include/uapi/linux/st-vgxy61.h
> 
> diff --git a/Documentation/userspace-api/media/drivers/st-vgxy61.rst b/Documentation/userspace-api/media/drivers/st-vgxy61.rst
> new file mode 100644
> index 000000000000..7a11adbb558f
> --- /dev/null
> +++ b/Documentation/userspace-api/media/drivers/st-vgxy61.rst
> @@ -0,0 +1,23 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +ST VGXY61 camera sensor driver
> +==============================
> +
> +The ST VGXY61 driver implements the following driver-specific controls:
> +
> +``V4L2_CID_STVGXY61_HDR``
> +-------------------------------
> +    Change the sensor HDR mode. A HDR picture is obtained by merging two captures of the same scene
> +    using two different exposure periods.
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 4
> +
> +    * - HDR linearize
> +      - The merger outputs a long exposure capture as long as it is not saturated.
> +    * - HDR substraction
> +      - This involves subtracting the short exposure frame from the long exposure frame.
> +    * - "no HDR"
> +      - This mode is used for standard dynamic range (SDR) exposures.

I wonder how many different kinds of HDR implementations there are that
could be meaningfully controlled using a single control. We have controls
such as scene mode that are much more generic than this.

Could this be standardised, even if the menu items wouldn't be? Say, call
it e.g. V4L2_CID_HDR_MODE? Raw sensors have different configuration with
more parameters though.

I wonder what others think.

> diff --git a/include/uapi/linux/st-vgxy61.h b/include/uapi/linux/st-vgxy61.h
> new file mode 100644
> index 000000000000..fbabe2cb64ac
> --- /dev/null
> +++ b/include/uapi/linux/st-vgxy61.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2022 STMicroelectronics SA
> + *
> + */
> +
> +#ifndef __UAPI_STVGXY61_H_
> +#define __UAPI_STVGXY61_H_
> +
> +#include <linux/v4l2-controls.h>
> +
> +/* Control HDR mode */
> +#define V4L2_CID_STVGXY61_HDR	(V4L2_CID_USER_STVGXY61_BASE + 0)
> +
> +#endif /* __UAPI_STVGXY61_H_ */

-- 
Kind regards,

Sakari Ailus
