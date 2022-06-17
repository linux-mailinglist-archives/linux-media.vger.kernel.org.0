Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 970A254EFAA
	for <lists+linux-media@lfdr.de>; Fri, 17 Jun 2022 05:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379787AbiFQCrq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 22:47:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiFQCrp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 22:47:45 -0400
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80366E00C;
        Thu, 16 Jun 2022 19:47:44 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id h8so3303500iof.11;
        Thu, 16 Jun 2022 19:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=2blxnC132ZX/h2u4JqM4kjiWHxCI0rH/Rb4jK6Fevbk=;
        b=t/3uQhUWW654U5cTQ9UK6jTwUK16RJl5L+wNhfPGY9O1zM+EvySAdqT3ZWKdILIZVN
         td0D2zNizRlCmYKDDSasTYnY4N+vGIaJc5skQ6Dbf4awDJnme0VZIHEei1/PJOLrsRnK
         QhBWASmAXn7pHKVmyVp47twgWmgEP3/LihyWucQu+64IdB4oTveVag1cBrwjtB7KWOWi
         8xInGuDBSdf/eIQvO9gCIilPsniDU147r088IleTex1MywckA0dqZgJU7ZYKRHmBNfVm
         U4LiHYh3n9OFpcYxRRkW9ZsF6De4XB5AVnKR4hZOzfSzSP/O3gUcT9hXCFFMBkn0Kxn7
         BC7A==
X-Gm-Message-State: AJIora89XYbbgpE29LB6mFtBuejW/jQIv/0teSfQWG9Rk3GAzDZldauU
        6PMByCJtvp8ukal9NyKv8A==
X-Google-Smtp-Source: AGRyM1v4ssCXLMnbQdb3SrhQkiIylXSkObBUWiheZ1wEyu+Nn5bI/bdxHTGvYimMwRq34QDn+ox9uw==
X-Received: by 2002:a5d:9152:0:b0:65f:6b68:95ea with SMTP id y18-20020a5d9152000000b0065f6b6895eamr4084075ioq.161.1655434063505;
        Thu, 16 Jun 2022 19:47:43 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id g9-20020a02cd09000000b0033192b7fd35sm1654529jaq.128.2022.06.16.19.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 19:47:43 -0700 (PDT)
Received: (nullmailer pid 429922 invoked by uid 1000);
        Fri, 17 Jun 2022 02:47:41 -0000
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220616183656.19089-7-laurent.pinchart@ideasonboard.com>
References: <20220616183656.19089-1-laurent.pinchart@ideasonboard.com> <20220616183656.19089-7-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 6/7] dt-bindings: media: Add i.MX8 ISI DT bindings
Date:   Thu, 16 Jun 2022 20:47:41 -0600
Message-Id: <1655434061.690203.429921.nullmailer@robh.at.kernel.org>
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

On Thu, 16 Jun 2022 21:36:55 +0300, Laurent Pinchart wrote:
> The Image Sensing Interface (ISI) combines image processing pipelines
> with DMA engines to process and capture frames originating from a
> variety of sources. The inputs to the ISI go through Pixel Link
> interfaces, and their number and nature is SoC-dependent. They cover
> both capture interfaces (MIPI CSI-2 RX, HDMI RX) and memory inputs.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../bindings/media/nxp,imx8-isi.yaml          | 146 ++++++++++++++++++
>  1 file changed, 146 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/nxp,imx8-isi.example.dtb: isi@32e00000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

