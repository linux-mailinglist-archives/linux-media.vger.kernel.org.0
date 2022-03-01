Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AA3C4C8E3A
	for <lists+linux-media@lfdr.de>; Tue,  1 Mar 2022 15:50:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231776AbiCAOup (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Mar 2022 09:50:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235396AbiCAOuo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Mar 2022 09:50:44 -0500
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D342A8A31C;
        Tue,  1 Mar 2022 06:50:02 -0800 (PST)
Received: by mail-ot1-f50.google.com with SMTP id p12-20020a05683019cc00b005af1442c9e9so12342849otp.13;
        Tue, 01 Mar 2022 06:50:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OaFHmyerJJh/M6Tk72Wi1b5MVxLH/+5WU1w7biEgdqA=;
        b=UJHvngHok/lJDCaI2l0mqYH0xbCLCYBYVxTUUIos25lKVgxuJrmB/1hGYWezAKUkNi
         UZxIxfK/KagC51Ob0hPq+ZRZ/VTW1NCPwMUnSe5QAV2QQzKdh8vvOoxiGmOnigNjYW7z
         Si4nP8kb4vKU5ORCKntZ53q4ZrEOomzhMEWk1h+kSUWNIxscctG6fTdUGsY7K7tjqmlT
         jkuxORM5oDxyAUKCjVYmOSeBbtkx7TUrL2Ptu/OZqOLa3EFR0AOjc2oXlvJqyLBx6iIX
         pARoX1831LpDomO8zaT27D4b8x+z7wOCiNQ20oBkTokyg+xNBYocW8G6cpFKIh2JdiPv
         fF8Q==
X-Gm-Message-State: AOAM530vNg+4Bp4XI0VjK9SjVL37yMVU8xOAyTQpHIdswyYbK68zev80
        xyBA6PjHiHh+iJ3aSKXCy1lcoxEn6A==
X-Google-Smtp-Source: ABdhPJyZ5HnGot2bIP8abc4rccU0W391TLpaku0w/75bwaZRFMwHNLAtLoatkaNCo84aX+BgIOF3uQ==
X-Received: by 2002:a05:6830:906:b0:5b0:34a4:3599 with SMTP id v6-20020a056830090600b005b034a43599mr1589727ott.358.1646146202089;
        Tue, 01 Mar 2022 06:50:02 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id x10-20020a4a2a4a000000b0031bf0818df1sm6223216oox.4.2022.03.01.06.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 06:50:01 -0800 (PST)
Received: (nullmailer pid 1210708 invoked by uid 1000);
        Tue, 01 Mar 2022 14:50:00 -0000
Date:   Tue, 1 Mar 2022 08:50:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: Add macros for video interface
 bus types
Message-ID: <Yh4ymGzdh5SKJ7cQ@robh.at.kernel.org>
References: <20220227203352.17314-1-laurent.pinchart@ideasonboard.com>
 <20220227203352.17314-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220227203352.17314-2-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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

Dual-license please.

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
> +#define MEDIA_BUS_TYPE_BT656			6
> +
> +#endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 
