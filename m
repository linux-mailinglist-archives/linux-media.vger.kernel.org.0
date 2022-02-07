Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAA514ACD53
	for <lists+linux-media@lfdr.de>; Tue,  8 Feb 2022 02:08:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233664AbiBHBFE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Feb 2022 20:05:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245394AbiBGW6w (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Feb 2022 17:58:52 -0500
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B359C061355;
        Mon,  7 Feb 2022 14:58:51 -0800 (PST)
Received: by mail-oi1-f179.google.com with SMTP id t199so18669587oie.10;
        Mon, 07 Feb 2022 14:58:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7iQ/HCHGMfUq18N0ggH9zm9kPkgWbGz6GFBfexz5eEg=;
        b=FCCtZY2iMLhWXi9RGKTgiahuejNQpdVn1gSNr/gs3MskZ9Iwf0JG5E8R696LGYdGJy
         vEj6vOty/CuqNRLKS1/3C3A249OYVAZsCZ8VZFk39qdnUTDy8bkCnnopG/hDU/5/pSal
         dM0L16aGqI//S/N3SLPCsQ0jHC0o/ZjukfPt+pJ65QjRNtwvAm23kJwZ25KtK4YBrnAU
         vs4T5A33XSTD/HbAN1sS6h81uBiIxYiY7byQEVofhQO18yJbTjEjXql8adcjGHXk+FJR
         AQxeVaM4xbrwJWWKmi37t3DjYZKQIumOP8GcZ+Kw0JOcd6En8Yuy+D4/xVrQj54OYYBA
         UCOQ==
X-Gm-Message-State: AOAM530r2zMbYe9BFKJ6jYst9jFLZvPB5gD6AmpqlRWKJPgPLssUbVTW
        /xmml8pB/6qpRhK2+FHV3LgxvdEXMg==
X-Google-Smtp-Source: ABdhPJz+QDzCqgeIDhpCBZ4gIBz3u04DsrKXfk8UFSm0Xh2STxBE4nr0brJuDwUn2jZUImjkI50ZXw==
X-Received: by 2002:aca:3b41:: with SMTP id i62mr539202oia.151.1644274730968;
        Mon, 07 Feb 2022 14:58:50 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id j2sm2172404ooj.2.2022.02.07.14.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 14:58:50 -0800 (PST)
Received: (nullmailer pid 1085731 invoked by uid 1000);
        Mon, 07 Feb 2022 22:58:49 -0000
Date:   Mon, 7 Feb 2022 16:58:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     Chris Morgan <macroalpha82@gmail.com>
Cc:     robh+dt@kernel.org, mchehab@kernel.org, mripard@kernel.org,
        Chris Morgan <macromorgan@hotmail.com>, airlied@linux.ie,
        emma@anholt.net, thierry.reding@gmail.com, daniel@ffwll.ch,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        sam@ravnborg.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 4/6 v2] dt-bindings: display: simple: add Geekworm MZP280
 Panel
Message-ID: <YgGkKSZJ6NkW1KUJ@robh.at.kernel.org>
References: <20220124165526.1104-1-macroalpha82@gmail.com>
 <20220124165526.1104-5-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220124165526.1104-5-macroalpha82@gmail.com>
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

On Mon, 24 Jan 2022 10:55:24 -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> The Geekworm MZP280 panel is a 480x640 (portrait) panel with a
> capacitive touch interface and a 40 pin header meant to interface
> directly with the Raspberry Pi. The screen is 2.8 inches diagonally,
> and there appear to be at least 4 distinct versions all with the same
> panel timings.
> 
> Timings were derived from drivers posted on the github located here:
> https://github.com/tianyoujian/MZDPI/tree/master/vga
> 
> Additional details about this panel family can be found here:
> https://wiki.geekworm.com/2.8_inch_Touch_Screen_for_Pi_zero
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
