Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4AE60C561
	for <lists+linux-media@lfdr.de>; Tue, 25 Oct 2022 09:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231274AbiJYHgX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Oct 2022 03:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231808AbiJYHgH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Oct 2022 03:36:07 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 334381CFE7
        for <linux-media@vger.kernel.org>; Tue, 25 Oct 2022 00:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666683362; x=1698219362;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TvKLXiGrpVfXoL7NtswXs0kG1IYYBtBAq1r5eKanmxU=;
  b=eORwXo9Asd0YUt/QxvcPyxEjOgfyj0/GrOMkkgxINb6QKr3m+AHqxwa0
   mXbJGpxQYhXhccbGlrpueal//NiYvD0UugRyBCVfqb9aw7kTtQmcRUFeH
   74/HBpQXrGQ2WjiKWLeAeYqv35hFvcftt2RD5NW3UxWlI5X1lGoX0eiHZ
   bMZJuvCI/F9bgwN9UBfM1zMDblafnq/tdPGv39qWuhxrYB/AnoTp4FDCH
   ReZQN7+m3h/39PAuDnnfPFYAeQsBZokpZYtTyONOVWtC1WkcTe3PSQXwY
   4jyyBhYnBKXsKOLG9PM5lf4habBFFd7p659sm2xwURan6HcmeQU5PXsVJ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="306341668"
X-IronPort-AV: E=Sophos;i="5.95,211,1661842800"; 
   d="scan'208";a="306341668"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2022 00:36:00 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="664818913"
X-IronPort-AV: E=Sophos;i="5.95,211,1661842800"; 
   d="scan'208";a="664818913"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2022 00:35:57 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 511062021B;
        Tue, 25 Oct 2022 10:35:51 +0300 (EEST)
Date:   Tue, 25 Oct 2022 07:35:51 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc:     linux-media@vger.kernel.org, alain.volmat@foss.st.com,
        hugues.fruchet@foss.st.com, sylvain.petinot@foss.st.com,
        dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, nicolas@ndufresne.ca,
        hverkuil@xs4all.nl
Subject: Re: [PATCH v7 4/5] media: Documentation: Add ST VGXY61 driver
 documentation
Message-ID: <Y1eR1+crUROuGurt@paasikivi.fi.intel.com>
References: <20221011120555.28889-1-benjamin.mugnier@foss.st.com>
 <20221011123030.31802-2-benjamin.mugnier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011123030.31802-2-benjamin.mugnier@foss.st.com>
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Tue, Oct 11, 2022 at 02:30:29PM +0200, Benjamin Mugnier wrote:
> Document V4L2_CID_HDR_MODE possible values for this sensor.
> 
> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> ---
>  .../userspace-api/media/drivers/st-vgxy61.rst | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/drivers/st-vgxy61.rst
> 
> diff --git a/Documentation/userspace-api/media/drivers/st-vgxy61.rst b/Documentation/userspace-api/media/drivers/st-vgxy61.rst
> new file mode 100644
> index 000000000000..213b884dcfa6
> --- /dev/null
> +++ b/Documentation/userspace-api/media/drivers/st-vgxy61.rst
> @@ -0,0 +1,23 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +ST VGXY61 camera sensor driver
> +==============================
> +
> +The ST VGXY61 driver implements the following controls:
> +
> +``V4L2_CID_HDR_SENSOR_MODE``
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
> +    * - "No HDR"
> +      - This mode is used for standard dynamic range (SDR) exposures.

I wonder if it would be helpful for the user space to have macros to define
these values.

The lines should be wrapped at 80, too. I'll do that while applying...

-- 
Sakari Ailus
