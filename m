Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45B724C8E84
	for <lists+linux-media@lfdr.de>; Tue,  1 Mar 2022 16:04:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235519AbiCAPEy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Mar 2022 10:04:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234347AbiCAPEx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Mar 2022 10:04:53 -0500
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D98553BBD8;
        Tue,  1 Mar 2022 07:04:12 -0800 (PST)
Received: by mail-oo1-f41.google.com with SMTP id i10-20020a4aab0a000000b002fccf890d5fso22728099oon.5;
        Tue, 01 Mar 2022 07:04:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NhjIkBmRmWHn6hZKiPp3QI3ZApNmYTsHEcY+J44OE9c=;
        b=G/ta3tJTZrsD2qMSsvHWDd0wOYTV5+sZaR13qMaSLGACEa6R+vviCAo79Osbqv5Eqk
         gQyYt6be6cV67+wC4SE+H8+DfMsesN9yklMMgt+Gm12qCv6wwxEoc/dShox9afl+w11C
         a3sZBdGE/1+dcVRwf33CoTOib4U0cDdi+1BZ1WeCkCzViaoXOXV8Dfupypl8XkYNLM2J
         xQcmiXPM2Lidbz/XrS2Icd27AqizgdI27mjqAxS8oSfudCDwXC+9nMqVn6Nvadma1D6G
         uaKrcv92uS6IUCbxU9vkmvflxRaW1XLCxFZUuA5DKKp+hRqLk/JivGsoR6X629AvoAec
         GD+g==
X-Gm-Message-State: AOAM533xqkXcxplMBi+SrjAXW50nqd9c1EeL+bgVktJbgXKCqqcj81cg
        IjQ2hwzTXAwAybxRKuqfSA==
X-Google-Smtp-Source: ABdhPJy7A8v8F+HtSBR12VZgXH/m9qLTLyWwHJy61CEzee5qeK2oioioloxMfwkgdMGKtQKMqrvOUQ==
X-Received: by 2002:a05:6870:b88:b0:d7:7e6:7d52 with SMTP id lg8-20020a0568700b8800b000d707e67d52mr4104975oab.95.1646147051835;
        Tue, 01 Mar 2022 07:04:11 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 100-20020a9d0eed000000b005af73c6f792sm6700792otj.6.2022.03.01.07.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 07:04:11 -0800 (PST)
Received: (nullmailer pid 1233554 invoked by uid 1000);
        Tue, 01 Mar 2022 15:04:10 -0000
Date:   Tue, 1 Mar 2022 09:04:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: Add macros for video interface
 bus types
Message-ID: <Yh416qrZr32PzMtJ@robh.at.kernel.org>
References: <20220227203352.17314-1-laurent.pinchart@ideasonboard.com>
 <20220227203352.17314-2-laurent.pinchart@ideasonboard.com>
 <YhvoC0aXpJUTslnC@paasikivi.fi.intel.com>
 <YhvqLL0LYWt2ryaE@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YhvqLL0LYWt2ryaE@pendragon.ideasonboard.com>
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

On Sun, Feb 27, 2022 at 11:16:28PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Sun, Feb 27, 2022 at 11:07:23PM +0200, Sakari Ailus wrote:
> > On Sun, Feb 27, 2022 at 10:33:51PM +0200, Laurent Pinchart wrote:
> > > Add a new dt-bindings/media/video-interfaces.h header that defines
> > > macros corresponding to the bus types from media/video-interfaces.yaml.
> > > This allows avoiding hardcoded constants in device tree sources.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  include/dt-bindings/media/video-interfaces.h | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > >  create mode 100644 include/dt-bindings/media/video-interfaces.h
> > > 
> > > diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
> > > new file mode 100644
> > > index 000000000000..e38058e1cca7
> > > --- /dev/null
> > > +++ b/include/dt-bindings/media/video-interfaces.h
> > > @@ -0,0 +1,16 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +/*
> > > + * Copyright (C) 2022 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > + */
> > > +
> > > +#ifndef __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__
> > > +#define __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__
> > > +
> > > +#define MEDIA_BUS_TYPE_CSI2_CPHY		1
> > > +#define MEDIA_BUS_TYPE_CSI1			2
> > > +#define MEDIA_BUS_TYPE_CCP2			3
> > > +#define MEDIA_BUS_TYPE_CSI2_DPHY		4
> > > +#define MEDIA_BUS_TYPE_PARALLEL			5
> > 
> > I've been long thinkin of renaming "PARALLEL" as "BT.601" which it really
> > is. I don't mind postponing that, but I think you could as well start here.
> > Up to you.
> 
> I think it's a good idea, but we then need to decide what to do with
> other types of parallel buses. Let's start this discussion now, and
> implement it in a patch on top of this series.

5 and what it means is an ABI. If it is ambiguous and needs to be more 
specific, then you need new numbers for all of those specific types.

If it is just a rename, I prefer it is done from the start.

> > Should this be somehow visible in video-interfaces.yaml?
> 
> I wish we could use macros in .yaml files instead of numerical values,
> but I don't think that's possible. I can do this:
> 
>    bus-type:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      enum:
> -      - 1 # MIPI CSI-2 C-PHY
> -      - 2 # MIPI CSI1
> -      - 3 # CCP2
> -      - 4 # MIPI CSI-2 D-PHY
> -      - 5 # Parallel
> -      - 6 # BT.656
> +      - 1 # MIPI CSI-2 C-PHY (MEDIA_BUS_TYPE_CSI2_CPHY)
> +      - 2 # MIPI CSI1 (MEDIA_BUS_TYPE_CSI1)
> +      - 3 # CCP2 (MEDIA_BUS_TYPE_CCP2)
> +      - 4 # MIPI CSI-2 D-PHY (MEDIA_BUS_TYPE_CSI2_DPHY)
> +      - 5 # Parallel (MEDIA_BUS_TYPE_PARALLEL)
> +      - 6 # BT.656 (MEDIA_BUS_TYPE_BT656)

Seems a bit redundant to have both comment text and define. The only 
part missing from the defines is 'MIPI'.

>      description:
> -      Data bus type.
> +      Data bus type. Use the macros listed above (defined in
> +      dt-bindings/video-interfaces.h) instead of numerical values.
> 
> Any better proposal ?
> 
> > > +#define MEDIA_BUS_TYPE_BT656			6
> > > +
> > > +#endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 
