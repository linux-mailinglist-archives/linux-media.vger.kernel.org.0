Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF7255DA7B
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242436AbiF0WO1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 18:14:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242401AbiF0WOX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 18:14:23 -0400
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 701D1F8;
        Mon, 27 Jun 2022 15:14:22 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id u20so11099365iob.8;
        Mon, 27 Jun 2022 15:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=G12kGKFA/CC0l12PAeYd8LEhOH1k7I1L6ZkakBc+ZaE=;
        b=PwQ8iiYM5gU/WAe+4/Bg71eodFDSElTIPGYRUrldF8KC73LxBvklyNNNKddk4ztuZl
         66CWo+XgxkuyJdmp9tHluKRQ/WMKeaqfsFWZFYmiQqebWEJDIjmXWGmhNiFx50g++aC4
         9RYylOANJB8FawW+jD/tudHKVY3BbhtLATWLAk59clAcrsBe+OyQyD9Sal98fivkfyKD
         fZZMu0A/0ctnnVHG/aPd5XYlYyFAuLRvwOqSIrDHXT6tz43aQL66hKIkZqA7YXL7ClHQ
         NShKX1yCTyXuhgNjN13WBGDC9u9feGgkaM4KELraTLhF8IwtzKkMc77ybEZHgKO1ZGN7
         Azog==
X-Gm-Message-State: AJIora82v3uDjKDZ6KlNQEsfCtZNPadIfbodi5V2DFaxXue0+jN6tANy
        QoCihN+Pf88BskoeAC5VNw==
X-Google-Smtp-Source: AGRyM1s7sLRMoI6Hg6U6o9gmGtVMRF0iqeZHfuCAeN+Ad0FhLWRj2d7vrR77fK5XmD7LJXLIDhC24w==
X-Received: by 2002:a05:6638:25c8:b0:332:1f0e:3e50 with SMTP id u8-20020a05663825c800b003321f0e3e50mr9222054jat.5.1656368061682;
        Mon, 27 Jun 2022 15:14:21 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id e39-20020a022127000000b0032e49fcc241sm5274423jaa.176.2022.06.27.15.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 15:14:21 -0700 (PDT)
Received: (nullmailer pid 3060344 invoked by uid 1000);
        Mon, 27 Jun 2022 22:14:19 -0000
Date:   Mon, 27 Jun 2022 16:14:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 1/6] dt-bindings: media: Add macros for video
 interface bus types
Message-ID: <20220627221419.GA3060280-robh@kernel.org>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <20220615221410.27459-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615221410.27459-2-laurent.pinchart@ideasonboard.com>
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

On Thu, 16 Jun 2022 01:14:05 +0300, Laurent Pinchart wrote:
> Add a new dt-bindings/media/video-interfaces.h header that defines
> macros corresponding to the bus types from media/video-interfaces.yaml.
> This allows avoiding hardcoded constants in device tree sources.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v2:
> 
> - Go back to PARALLEL
> 
> Changes since v1:
> 
> - Dual-license under GPL-2.0-only or MIT
> - Rename PARALLEL TO BT601
> ---
>  include/dt-bindings/media/video-interfaces.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 include/dt-bindings/media/video-interfaces.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
