Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44CE14E9FCF
	for <lists+linux-media@lfdr.de>; Mon, 28 Mar 2022 21:33:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245708AbiC1Tei (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Mar 2022 15:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245706AbiC1Tei (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Mar 2022 15:34:38 -0400
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AC1B5EDF3;
        Mon, 28 Mar 2022 12:32:55 -0700 (PDT)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-d39f741ba0so16330550fac.13;
        Mon, 28 Mar 2022 12:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=qi1/iRVX2o56RajS038DTkQnMYFIqNJyGlTn7qT/vnE=;
        b=VqG3MTe9aQHgHFiyVe/XIUJED9iSdoCrQskTG0jvsZ6WwP2IgwVdX/jB4H/h7cV7p9
         qYBSoPl3azcOXCPw0WbCZMcR8ZBPVZQrkU7lj1qD3JW9WfCj9bU3DYM7vhlDsyiEd1dx
         HjQqYoFWhd+B1w0Aj8+luzU/9hwiIfn1HcgDdoGwTPutKDpKTpRMpCmT0HYMr+g3D0GH
         eaeEImrNQ/DVZLV7DhVfZyNBpcmnOieStumLX/sKqf7Bdv2e0aKCMWjlmbUSs+XIb6ns
         1iKNOdGM+nGrCsAtfCIvVnrERrdcZ801HpXnOnEbBSKzWXdH+gOt8X2qpV0DFtAIBtsQ
         wybg==
X-Gm-Message-State: AOAM530KcA4w3KANnx/fGPdWr4OlLbnHFyD4uqW/5q22Qg/8qiYEEIWa
        b9A75Vxbl/QaxWwfKKGxDw==
X-Google-Smtp-Source: ABdhPJxelsJuZKvNDqXqbdtpVcqj2hhC/IWmVUvfUfaQE3pkQENG6wZl2YUURhi6HbMnu+rhbitS0w==
X-Received: by 2002:a05:6870:d207:b0:de:1872:fe43 with SMTP id g7-20020a056870d20700b000de1872fe43mr384712oac.242.1648495974312;
        Mon, 28 Mar 2022 12:32:54 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q6-20020acaf206000000b002ef960f65b3sm7630145oih.25.2022.03.28.12.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 12:32:52 -0700 (PDT)
Received: (nullmailer pid 2851319 invoked by uid 1000);
        Mon, 28 Mar 2022 19:32:50 -0000
From:   Rob Herring <robh@kernel.org>
To:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Cc:     laurent.pinchart@ideasonboard.com, robh+dt@kernel.org,
        hverkuil-cisco@xs4all.nl, alexander.stein@ew.tq-group.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        tomi.valkeinen@ideasonboard.com, mchehab@kernel.org,
        nicolas@ndufresne.ca, stanimir.varbanov@linaro.org
In-Reply-To: <20220328141309.177611-8-xavier.roumegue@oss.nxp.com>
References: <20220328141309.177611-1-xavier.roumegue@oss.nxp.com> <20220328141309.177611-8-xavier.roumegue@oss.nxp.com>
Subject: Re: [PATCH v4 7/9] media: dt-bindings: media: Add i.MX8MP DW100 binding
Date:   Mon, 28 Mar 2022 14:32:50 -0500
Message-Id: <1648495970.732437.2851318.nullmailer@robh.at.kernel.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 28 Mar 2022 16:13:07 +0200, Xavier Roumegue wrote:
> Add DT binding documentation for the Vivante DW100 dewarper engine found
> on NXP i.MX8MP SoC
> 
> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../devicetree/bindings/media/nxp,dw100.yaml  | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,dw100.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/nxp,dw100.example.dts:25:18: fatal error: dt-bindings/power/imx8mp-power.h: No such file or directory
   25 |         #include <dt-bindings/power/imx8mp-power.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:378: Documentation/devicetree/bindings/media/nxp,dw100.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1398: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1610196

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

