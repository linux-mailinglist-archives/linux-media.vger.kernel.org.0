Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BADFB4CDFC1
	for <lists+linux-media@lfdr.de>; Fri,  4 Mar 2022 22:26:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbiCDV0z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Mar 2022 16:26:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiCDV0y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Mar 2022 16:26:54 -0500
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 145DD2CCB5;
        Fri,  4 Mar 2022 13:26:06 -0800 (PST)
Received: by mail-oo1-f45.google.com with SMTP id y15-20020a4a650f000000b0031c19e9fe9dso10834082ooc.12;
        Fri, 04 Mar 2022 13:26:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=NXsaz1x0msPuGrgf5+qJ63yq6VCBVizmhMcnc51/qZc=;
        b=eWFlCbEVw4g0Hpn8hMCGgtLSmid/5K7tqjs3YH8Fll+UR6ms1SODFDdsFW8cCtj2Bu
         d3d/1qJBvZAIlqg8DGFZMrcRADIw6TfWMsD38a9zGb07d0fX174x941ThAiBQsk3PFug
         ulrVkhTxTqD3UEXx+1wJ34WT4HcS0PUneDXPQ+UGswSp9JdSaEzlK84SVoyyVYh6t+Su
         jOaVTpJ+8usJSNorr+K6RcaFqDbImYb6y3uSeuqDOUXMIAG2FghbVKnOPD4KsWwBPqGs
         3XWoifcFszx7994w8ueapW0SnGtaxeVibsOJ7XaoSTbFLDgh4p3Z2ZVghYJEYB1UflHo
         z8DA==
X-Gm-Message-State: AOAM533J69/9AI9D3VyfN/0WXSzcM54sfzmJrG1eThEe+uNRCtd/9rMi
        CYvNgyTCUNwWB/Y7OlogdQ==
X-Google-Smtp-Source: ABdhPJw3Fv44vnqmgBmBOzXjXg2EkNZKfQ+vNHmjE0CQRYn3hTdBMqyOw/IxU+jGM9VNhGHV4QTaTw==
X-Received: by 2002:a05:6870:a406:b0:d9:b303:7dc2 with SMTP id m6-20020a056870a40600b000d9b3037dc2mr204508oal.23.1646429165387;
        Fri, 04 Mar 2022 13:26:05 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id l84-20020aca3e57000000b002d97bda3872sm3013519oia.55.2022.03.04.13.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 13:26:04 -0800 (PST)
Received: (nullmailer pid 433181 invoked by uid 1000);
        Fri, 04 Mar 2022 21:26:03 -0000
From:   Rob Herring <robh@kernel.org>
To:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Cc:     mchehab@kernel.org, tomi.valkeinen@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, stanimir.varbanov@linaro.org,
        hverkuil-cisco@xs4all.nl, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, robh+dt@kernel.org
In-Reply-To: <20220304202813.2560202-2-xavier.roumegue@oss.nxp.com>
References: <20220304202813.2560202-1-xavier.roumegue@oss.nxp.com> <20220304202813.2560202-2-xavier.roumegue@oss.nxp.com>
Subject: Re: [PATCH 1/3] media: dt-bindings: media: Add i.MX8MP DW100 binding
Date:   Fri, 04 Mar 2022 15:26:03 -0600
Message-Id: <1646429163.430532.433180.nullmailer@robh.at.kernel.org>
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

On Fri, 04 Mar 2022 21:28:11 +0100, Xavier Roumegue wrote:
> Add DT binding documentation for the Vivante DW100 dewarper engine found
> on NXP i.MX8MP SoC
> 
> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> ---
>  .../devicetree/bindings/media/nxp,dw100.yaml  | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,dw100.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/nxp,dw100.yaml: properties:clocks: 'oneOf' conditional failed, one must be fixed:
	[{'description': 'The AXI clock'}, {'description': 'The AHB clock'}] is too long
	[{'description': 'The AXI clock'}, {'description': 'The AHB clock'}] is too short
	False schema does not allow 2
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/nxp,dw100.yaml: properties:clock-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'axi'}, {'const': 'ahb'}] is too long
	[{'const': 'axi'}, {'const': 'ahb'}] is too short
	False schema does not allow 2
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/nxp,dw100.yaml: ignoring, error in schema: properties: clocks
Documentation/devicetree/bindings/media/nxp,dw100.example.dts:25:18: fatal error: dt-bindings/power/imx8mp-power.h: No such file or directory
   25 |         #include <dt-bindings/power/imx8mp-power.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:378: Documentation/devicetree/bindings/media/nxp,dw100.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1398: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1601439

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

