Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC6824D24C4
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 00:19:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbiCHXU0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 18:20:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbiCHXUZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 18:20:25 -0500
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CD899F6E8;
        Tue,  8 Mar 2022 15:19:21 -0800 (PST)
Received: by mail-oi1-f177.google.com with SMTP id b188so880542oia.13;
        Tue, 08 Mar 2022 15:19:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iit0u9zWiQbQ3YiVBUcj7kSNoNspLfGLfmOn3xXbkEQ=;
        b=g7OQzrcNYl2ebRqOijzEXnIOuZXD4VS42yMfMa0Tv/6lBeSogml07Poo+U7YOZvjPW
         9Zp3Mfzi3F16rQLWa3Eq5IysanmpaV7XiyAf8lvz+6VQqSuy+UVyt0RH1ynFkObLiLmQ
         tkdKMmQWkSR0BnybAKUaQvsx1FjQbKbIKQ/OcyAFg+wkHVsmkPiOjjWJY64CYj+NosDV
         JrvegZO85Rndve5Stjb1OfcIkGHVP4jhk0uCYb+HGnHn75fgShHu8MPxQBt1UY3Dob/G
         VWqDjy8uytTZlOPAPLwV1TRQA0frtLyt4oYlt6NuLUwiJQ+3/y5MPrqmx7dA53q6vJ2y
         ucSQ==
X-Gm-Message-State: AOAM533SIzxV74eJ95PKM0uIk0EHJiUtOWwViDkboncZSodY+mRGG8TF
        oHvaCZ3I1teJcVe5NrSC4g==
X-Google-Smtp-Source: ABdhPJxyh2TC/u+YmC4dbuRB94Ndhj6I+qJNb4nn1oht99Z0poj4FiI9BQlsQnzRtlNfAVkLp/uQdA==
X-Received: by 2002:a05:6808:14d2:b0:2d9:dad1:a148 with SMTP id f18-20020a05680814d200b002d9dad1a148mr4272138oiw.257.1646781504401;
        Tue, 08 Mar 2022 15:18:24 -0800 (PST)
Received: from rob (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x25-20020a056830409900b005af164235b4sm88950ott.2.2022.03.08.15.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 15:18:23 -0800 (PST)
Received: (nullmailer pid 1546596 invoked by uid 1000);
        Tue, 08 Mar 2022 23:18:22 -0000
Date:   Tue, 8 Mar 2022 16:18:22 -0700
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: media: Add macros for video
 interface bus types
Message-ID: <20220308231822.GA1538975@robh.at.kernel.org>
References: <20220306173905.22990-1-laurent.pinchart@ideasonboard.com>
 <20220306173905.22990-2-laurent.pinchart@ideasonboard.com>
 <YiT3wZ746ES6x3gl@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YiT3wZ746ES6x3gl@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Mar 06, 2022 at 08:04:49PM +0200, Laurent Pinchart wrote:
> On Sun, Mar 06, 2022 at 07:39:03PM +0200, Laurent Pinchart wrote:
> > Add a new dt-bindings/media/video-interfaces.h header that defines
> > macros corresponding to the bus types from media/video-interfaces.yaml.
> > This allows avoiding hardcoded constants in device tree sources.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v1:
> > 
> > - Dual-license under GPL-2.0-only or MIT
> > - Rename PARALLEL TO BT601
> 
> Contrary to popular belief, further investigation revealed that BT.601
> doesn't define VSYNC and HSYNC (or HREF, as it is also commonly called)
> signals. MEDIA_BUS_TYPE_BT601 is thus likely not a good name. I haven't
> been able to find a standard for parallel camera interfaces that would
> be a good match here. On the display side there's MIPI DPI, but on the
> camera side it seems things have evolved quite organically. I may have
> missed something though.

So keep 'PARALLEL' and anything less ambiguous will be a new type.

Rob
