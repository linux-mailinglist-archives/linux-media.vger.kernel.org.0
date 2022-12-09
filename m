Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96092648A1A
	for <lists+linux-media@lfdr.de>; Fri,  9 Dec 2022 22:35:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbiLIVfY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Dec 2022 16:35:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiLIVfX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Dec 2022 16:35:23 -0500
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C6651BEAF
        for <linux-media@vger.kernel.org>; Fri,  9 Dec 2022 13:35:23 -0800 (PST)
Received: by mail-ot1-f44.google.com with SMTP id p10-20020a9d76ca000000b0066d6c6bce58so3577964otl.7
        for <linux-media@vger.kernel.org>; Fri, 09 Dec 2022 13:35:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2swWqDP4ljBUt0n4gKpK4/1KaFCgZzGUDtJH4nk3Sg=;
        b=7Rf9NstWapZht/hSDB32dAVq+auxl7rDGiW5NfwnMphAPlvFgI2r40kKd2UeAZrIbZ
         ygmI1w3lyNN61DsU8C/8FLA0Yg8ISZGjw2KrA+IdXnl26cb28sl8es8Od4O8J8qg9C9H
         ANGMeqS8lHpNm++w4MO+x2h43pB0j0Din8EpoH5r0uYI5jjYJkvCbLgvCru5K65OCnwu
         097IARq96TjPt33BLSgBft+v5rAgT1GqdvdknMErJAl5JIYrF1PnpSrKHY7o1eFrg94s
         onHkpz8qi62kcpAp+yf0xgWEeTO5T5nQLO4b5nDrqIXEXjguo1kO5lIR5x0uEZNQrGR6
         j3Hg==
X-Gm-Message-State: ANoB5pmIjT8n5MquGahC27hPAPLYJkFm1aCATe1BLOLc8hNlVHbbMbWv
        cinlVR55qdgU5X2WJF1c9Q==
X-Google-Smtp-Source: AA0mqf6Z5qo5MuYNEO/9ChId6afDk0cFzaAmiAljqbM1ao82bjrxiHFax6VTTNgNq2fEaPxz3WSQGw==
X-Received: by 2002:a9d:16e:0:b0:66e:a0ea:674c with SMTP id 101-20020a9d016e000000b0066ea0ea674cmr3551333otu.1.1670621722577;
        Fri, 09 Dec 2022 13:35:22 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f21-20020a9d7b55000000b0066de9dc966fsm1005430oto.65.2022.12.09.13.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 13:35:22 -0800 (PST)
Received: (nullmailer pid 3886436 invoked by uid 1000);
        Fri, 09 Dec 2022 21:35:21 -0000
Date:   Fri, 9 Dec 2022 15:35:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lee Jackson <lee.jackson@arducam.com>
Cc:     krzysztof.kozlowski+dt@linaro.org, linux-media@vger.kernel.org,
        s.hauer@pengutronix.de, shawnguo@kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: media: i2c: Add IMX519 CMOS sensor
 binding
Message-ID: <167062172117.3886397.15786483410455573972.robh@kernel.org>
References: <20221209084831.000048ab@arducam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221209084831.000048ab@arducam.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On Fri, 09 Dec 2022 08:48:31 +0800, Lee Jackson wrote:
> 
> Add YAML device tree binding for IMX519 CMOS image sensor, and
> the relevant MAINTAINERS entries.
> 
> Signed-off-by: Lee Jackson <lee.jackson@arducam.com>
> ---
>  .../bindings/media/i2c/sony,imx519.yaml       | 107 ++++++++++++++++++
>  MAINTAINERS                                   |   8 ++
>  2 files changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
