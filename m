Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 718EA638D15
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 16:09:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbiKYPJe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 10:09:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiKYPJd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 10:09:33 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3E851AD8C
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 07:09:32 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id m19so5534932edj.8
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 07:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ozh3pwg86FVwgjieqWWpm1hzWQIk7mfvK3o0wWrBzu4=;
        b=jCg5C9UU92OwRrZbUzXLpweCXUn90+JxHOUG0YPUi7eYPcNXQUVqWpUuAAmkDZOwKY
         BkookJ0P/6KnyWPgtqzzcdOKqGpAcz0fCyinhZOiF1iWCrL9KJUC1cGP2kCWjyr2rIVe
         R0IS7cf5PIX4qgxQSJW1Bb5axWNbmqdxjOz56WZobvoughqVFQAXHVvVawtM/iD0nxVg
         QuzR8CX1zP0lcPMLtASAZAIWVpzm9kgl63/QeWQfgdjwSH/vEQ77tMxfpB7E5yvlGlqP
         6m3FmmvRM4f/maVLML5lPBhPkT4HWRguJgCh917x+8nylGyw+PVcvlaBlqamoTUaUZSC
         ALgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ozh3pwg86FVwgjieqWWpm1hzWQIk7mfvK3o0wWrBzu4=;
        b=2t59Wxumx2nQb+SsfsZomFz4RYPCEMTHoViDkeo7KOnPf7IEuE9d7W5QvvkF/MrKuH
         uh6/3n9Obw53h7mhEBvp3mgjXMz2tgwx4s8OlUm8RP6S3GRZfimrJI4tQuNYXKAO9PiW
         VQuyMEO5AuaKFY5fzYOB7eWjO5ruGdNsInMAmZLWNV7i99qrMxJ9YbThznCT+pGRKWMi
         k4XuOoFpR/w3EAxuXBR/FS9A8W9O18to/0CVy3nSVv5gEYOyvO9BLbnl+0HAzKhtjJm4
         5kMOP53g1XMXChuUrRRR8V9SxVeP1sW/cP9i51J/GCw3V0sJtIbjzYL/51ceBHpgjKHw
         9Xdw==
X-Gm-Message-State: ANoB5plQ2AUVVPxoAnZFbkv4qrwMyV7IKXvl6DIkMDz+LdZ6J6H7AQqw
        HC5VRf722Cf9fyvMqRNOQVqGCQ==
X-Google-Smtp-Source: AA0mqf5mgk8Kt1q+JGS5dt/N9C+KQrjEOfVAiuaNKlxvG4q8gENyrcpPKSZUrty4+UVGHedqXGrfIw==
X-Received: by 2002:a05:6402:2421:b0:461:524f:a8f4 with SMTP id t33-20020a056402242100b00461524fa8f4mr34645374eda.260.1669388971310;
        Fri, 25 Nov 2022 07:09:31 -0800 (PST)
Received: from melexis.com ([2a02:2378:1085:b41d:bec4:93fd:8998:6d7a])
        by smtp.gmail.com with ESMTPSA id 26-20020a170906329a00b0078d4ee47c82sm1642718ejw.129.2022.11.25.07.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 07:09:30 -0800 (PST)
Date:   Fri, 25 Nov 2022 17:09:27 +0200
From:   Volodymyr Kharuk <vkh@melexis.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: Re: [PATCH v3 6/8] media: uapi: Add mlx7502x header file
Message-ID: <Y4DapxID8+uKoZSI@melexis.com>
References: <cover.1669381013.git.vkh@melexis.com>
 <cc798c882c35ef135179fba869d3f98507edde50.1669381013.git.vkh@melexis.com>
 <06d4c93d-3f94-cc95-f123-751e7bb2ab3b@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06d4c93d-3f94-cc95-f123-751e7bb2ab3b@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 25, 2022 at 03:39:16PM +0100, Hans Verkuil wrote:
> On 25/11/2022 14:34, Volodymyr Kharuk wrote:
> > Define user controls for mlx7502x driver, add its documentation and
> > update MAINTAINERS
> > 
> > Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
> > ---
> >  .../userspace-api/media/drivers/index.rst     |  1 +
> >  .../userspace-api/media/drivers/mlx7502x.rst  | 28 +++++++++++++++++++
> >  MAINTAINERS                                   |  2 ++
> >  include/uapi/linux/mlx7502x.h                 | 20 +++++++++++++
> >  4 files changed, 51 insertions(+)
> >  create mode 100644 Documentation/userspace-api/media/drivers/mlx7502x.rst
> >  create mode 100644 include/uapi/linux/mlx7502x.h
> > 
> > diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
> > index 32f82aed47d9..f49e1b64c256 100644
> > --- a/Documentation/userspace-api/media/drivers/index.rst
> > +++ b/Documentation/userspace-api/media/drivers/index.rst
> > @@ -37,5 +37,6 @@ For more details see the file COPYING in the source distribution of Linux.
> >  	imx-uapi
> >  	max2175
> >  	meye-uapi
> > +	mlx7502x
> >  	omap3isp-uapi
> >  	uvcvideo
> > diff --git a/Documentation/userspace-api/media/drivers/mlx7502x.rst b/Documentation/userspace-api/media/drivers/mlx7502x.rst
> > new file mode 100644
> > index 000000000000..6f4874ec010d
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/drivers/mlx7502x.rst
> > @@ -0,0 +1,28 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +Melexis mlx7502x ToF camera sensor driver
> > +=========================================
> > +
> > +The mlx7502x driver implements the following driver-specific controls:
> > +
> > +``V4L2_CID_MLX7502X_OUTPUT_MODE (menu)``
> > +----------------------------------------
> > +	The sensor has two taps, which gather reflected light: A and B.
> > +	The control sets the way data should be put in a buffer. The most
> > +	common output mode is A-B which provides the best sunlight robustness.
> > +
> > +.. flat-table::
> > +	:header-rows:  0
> > +	:stub-columns: 0
> > +	:widths:       1 4
> > +
> > +	* - ``(0)``
> > +	  - A minus B
> > +	* - ``(1)``
> > +	  - A plus B
> > +	* - ``(2)``
> > +	  - only A
> > +	* - ``(3)``
> > +	  - only B
> > +	* - ``(4)``
> > +	  - A and B (this config will change PAD format)
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index a2bc2ce53056..0a6dda8da6bc 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -13116,7 +13116,9 @@ M:	Volodymyr Kharuk <vkh@melexis.com>
> >  L:	linux-media@vger.kernel.org
> >  S:	Supported
> >  W:	http://www.melexis.com
> > +F:	Documentation/userspace-api/media/drivers/mlx7502x.rst
> >  F:	Documentation/userspace-api/media/v4l/ext-ctrls-tof.rst
> > +F:	include/uapi/linux/mlx7502x.h
> >  
> >  MELFAS MIP4 TOUCHSCREEN DRIVER
> >  M:	Sangwon Jee <jeesw@melfas.com>
> > diff --git a/include/uapi/linux/mlx7502x.h b/include/uapi/linux/mlx7502x.h
> > new file mode 100644
> > index 000000000000..68014f550ed2
> > --- /dev/null
> > +++ b/include/uapi/linux/mlx7502x.h
> > @@ -0,0 +1,20 @@
> > +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> > +/*
> > + * Melexis 7502x ToF cameras driver.
> > + *
> > + * Copyright (C) 2021 Melexis N.V.
> > + *
> > + */
> > +
> > +#ifndef __UAPI_MLX7502X_H_
> > +#define __UAPI_MLX7502X_H_
> > +
> > +#include <linux/v4l2-controls.h>
> > +
> > +/*
> > + * this is related to the taps in ToF cameras,
> > + * usually A minus B is the best option
> > + */
> > +#define V4L2_CID_MLX7502X_OUTPUT_MODE	(V4L2_CID_USER_MLX7502X_BASE + 0)
> 
> You need to add an enum with the mode settings. E.g.:
> 
> enum v4l2_mlx7502x_output_mode {
>         V4L2_MLX7502X_OUTPUT_MODE_A_MINUS_B     = 0,
> 	...
> };
> 
> And you can use those enum defines in the documentation.
Ok, thanks. That is is interesting. Will fix in next version.
> 
> Regards,
> 
> 	Hans
> 
> > +
> > +#endif /* __UAPI_MLX7502X_H_ */
> 

-- 
--
BR,
Volodymyr Kharuk
