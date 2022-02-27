Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9A3D4C5EF9
	for <lists+linux-media@lfdr.de>; Sun, 27 Feb 2022 22:07:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231230AbiB0VII (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Feb 2022 16:08:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbiB0VIG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Feb 2022 16:08:06 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 354F0E0AD;
        Sun, 27 Feb 2022 13:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645996048; x=1677532048;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QGEyYRXfmhEm1Jg+uu+nYK/LNtHww3Unu43NxFRicgI=;
  b=lHN2VhO34ydr9xDSTXVqO0aa1A39mUcEF1bHTSISr2I1a8MdXtyhI2Ns
   YtwnkdewcqkeGF3TbRvm8xIx91IK06RRoSiLcCR7oLeYM1jcNFWnGyxkA
   VP9YgDLlrS0AEbvq6OTSuJULNty+7ZYNEMIuZncCDHvNHeuE9uSORUhCW
   zBrH+8ImKi/g+7T96nI7LWlXNMPwdAUSAwYUw4xyudDPJ8UPQu+o0fo8z
   +LZ83N1Xvw2ELCDwJa2r+Vy7vJOOXA51Jsv8mtSHyfKMiAR4lDxl7miSe
   Z4ZImkQcsUrgtzjjDrz128e1BhBUJuOb7on1CjPEKSsa0/8w7Oo0O9KD4
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="236268210"
X-IronPort-AV: E=Sophos;i="5.90,141,1643702400"; 
   d="scan'208";a="236268210"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2022 13:07:27 -0800
X-IronPort-AV: E=Sophos;i="5.90,141,1643702400"; 
   d="scan'208";a="534204768"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2022 13:07:25 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 285CD201C2;
        Sun, 27 Feb 2022 23:07:23 +0200 (EET)
Date:   Sun, 27 Feb 2022 23:07:23 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: Add macros for video interface
 bus types
Message-ID: <YhvoC0aXpJUTslnC@paasikivi.fi.intel.com>
References: <20220227203352.17314-1-laurent.pinchart@ideasonboard.com>
 <20220227203352.17314-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220227203352.17314-2-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for the set.

On Sun, Feb 27, 2022 at 10:33:51PM +0200, Laurent Pinchart wrote:
> Add a new dt-bindings/media/video-interfaces.h header that defines
> macros corresponding to the bus types from media/video-interfaces.yaml.
> This allows avoiding hardcoded constants in device tree sources.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  include/dt-bindings/media/video-interfaces.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 include/dt-bindings/media/video-interfaces.h
> 
> diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
> new file mode 100644
> index 000000000000..e38058e1cca7
> --- /dev/null
> +++ b/include/dt-bindings/media/video-interfaces.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2022 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> + */
> +
> +#ifndef __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__
> +#define __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__
> +
> +#define MEDIA_BUS_TYPE_CSI2_CPHY		1
> +#define MEDIA_BUS_TYPE_CSI1			2
> +#define MEDIA_BUS_TYPE_CCP2			3
> +#define MEDIA_BUS_TYPE_CSI2_DPHY		4
> +#define MEDIA_BUS_TYPE_PARALLEL			5

I've been long thinkin of renaming "PARALLEL" as "BT.601" which it really
is. I don't mind postponing that, but I think you could as well start here.
Up to you.

Should this be somehow visible in video-interfaces.yaml?

> +#define MEDIA_BUS_TYPE_BT656			6
> +
> +#endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */

-- 
Kind regards,

Sakari Ailus
