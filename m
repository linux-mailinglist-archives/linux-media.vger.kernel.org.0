Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6866267D43C
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 19:31:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232018AbjAZSbg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 13:31:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231944AbjAZSbb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 13:31:31 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 350A872B6;
        Thu, 26 Jan 2023 10:31:28 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id u5so1358490pfm.10;
        Thu, 26 Jan 2023 10:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/ICu+UjMJo1SoU9Cr/JvBEmEQMIUpKU+TgMOlbYRLhA=;
        b=UoN+o2EtkjoIuEaqM27B9ox/olbrMrzmDJ949THfGlVehiZbCbx1bITIsgi5jsw6kB
         7vOSG1vrbvCPVe5mr/w7FhMGZkT0us+DyHefhuqc/zdApSrN0E2u55yKFOLWeBKPcQKX
         vFdP1ASRFltxsoa0E62z5aO8ZW83QEHEfOpANMs9V1pEqHoVP6tTNnsA5zLP0hfbae6e
         r2UCOht9DDZu0aDqZEtxj/gi+CiMp02wPFXLAkvuqmb0DC2MBwRuQTiGPCyT4kkwd8cz
         IPdwa9k+J6zQ3DTnerxkifX/ZW4HFeGvq0ZYTuGwWypDfSWyZ2nC4ygpkobwseqiLSFF
         8I8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ICu+UjMJo1SoU9Cr/JvBEmEQMIUpKU+TgMOlbYRLhA=;
        b=VFVIsK0YGL11RzG8tfqjP+TNeJNHZcRQxTWCLbNuR/ZIK9xBv5E6PbJB1K+6iuLMFi
         J/ZSuzvmc+ure5a4xBGDB97CND7ml2rLmT4kTUY20XMeMr7zKXulkzY5S7e6B0wTi8yf
         dWDsaqhblhN11Ec8hmnSX9AMuzuKE1p+DemHgNOMx/EwYghoctvr2dqP68LgpMaT/jlR
         W3ZG1iujq7OHExcHEA7l1rLDr6uWQri6SlR5cnHn4F6WH9yZgD4EU2eFUE21faNJDtpR
         H8NpX4GkIjObYVvk61CwObT2G1EGYu17vtBamzW+5gn/eOjddRbB7KUVhM61uyODU+37
         ZMlA==
X-Gm-Message-State: AFqh2koffAgcWqC3NQBtKXFUhBk2fIARvgc/YdnRhN7Q+dVqb/OiREGQ
        TnquRppESRNCdmH86q4U3dtZlb2ku8g+yengo7U=
X-Google-Smtp-Source: AMrXdXvH9JKmlVVqWcNrYNsLqxDYu+Cbju+++TzOptcgBnZ4ktulWI0WBHAcsw5rT7XjXyeUbyNUomWqngf8ORih6hU=
X-Received: by 2002:a62:3302:0:b0:58d:a7e6:89e3 with SMTP id
 z2-20020a623302000000b0058da7e689e3mr4256277pfz.67.1674757887464; Thu, 26 Jan
 2023 10:31:27 -0800 (PST)
MIME-Version: 1.0
References: <20230126170603.11896-1-laurent.pinchart@ideasonboard.com> <20230126170603.11896-3-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230126170603.11896-3-laurent.pinchart@ideasonboard.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 26 Jan 2023 12:31:16 -0600
Message-ID: <CAHCN7xJNGCd=Sghu3oe9_yjSg0ybXRFHaVLaZmC2guXCy7ty1A@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: media: imx8-isi: Use 'port' instead
 of 'ports' for i.MX8MN
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 26, 2023 at 11:06 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../bindings/media/nxp,imx8-isi.yaml          | 39 +++++++++++--------
>  1 file changed, 22 insertions(+), 17 deletions(-)
>

Is there a reason not to squash the two bindings into just one patch?


> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> index 6038b9b5ab36..121594569395 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> @@ -52,11 +52,21 @@ properties:
>    power-domains:
>      maxItems: 1
>
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: |
> +      The port represents the Pixel Link input to the ISI. It shall have a
> +      single endpoint. This property is only used for ISI instances with a
> +      single port (as in the i.MX8MN). For instances that includes multiple
> +      ports, the 'ports' property shall be used instead.
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>      description: |
>        Ports represent the Pixel Link inputs to the ISI. Their number and
> -      assignment are model-dependent. Each port shall have a single endpoint.
> +      assignment are model-dependent. For ISI instances that have a single
> +      port, the 'port' property should be used instead. Each port shall have a
> +      single endpoint.
>
>  required:
>    - compatible
> @@ -65,7 +75,6 @@ required:
>    - clocks
>    - clock-names
>    - fsl,blk-ctrl
> -  - ports
>
>  allOf:
>    - if:
> @@ -77,12 +86,11 @@ allOf:
>        properties:
>          interrupts:
>            maxItems: 1
> -        ports:
> -          properties:
> -            port@0:
> -              description: MIPI CSI-2 RX
> -          required:
> -            - port@0
> +        port:
> +          description: MIPI CSI-2 RX
> +        ports: false
> +      required:
> +        - port
>
>    - if:
>        properties:
> @@ -93,6 +101,7 @@ allOf:
>        properties:
>          interrupts:
>            maxItems: 2
> +        port: false
>          ports:
>            properties:
>              port@0:
> @@ -102,6 +111,8 @@ allOf:
>            required:
>              - port@0
>              - port@1
> +      required:
> +        - ports
>
>  additionalProperties: false
>
> @@ -122,15 +133,9 @@ examples:
>          fsl,blk-ctrl = <&disp_blk_ctrl>;
>          power-domains = <&disp_blk_ctrl IMX8MN_DISPBLK_PD_ISI>;
>
> -        ports {
> -            #address-cells = <1>;
> -            #size-cells = <0>;
> -
> -            port@0 {
> -                reg = <0>;
> -                isi_in: endpoint {
> -                    remote-endpoint = <&mipi_csi_out>;
> -                };
> +        port {
> +            isi_in: endpoint {
> +                remote-endpoint = <&mipi_csi_out>;
>              };
>          };
>      };
> --
> Regards,
>
> Laurent Pinchart
>
