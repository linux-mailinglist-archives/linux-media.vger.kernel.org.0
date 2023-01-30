Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAFDE6819B8
	for <lists+linux-media@lfdr.de>; Mon, 30 Jan 2023 19:56:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237998AbjA3S4L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Jan 2023 13:56:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237373AbjA3S4K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Jan 2023 13:56:10 -0500
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B71C96582;
        Mon, 30 Jan 2023 10:56:07 -0800 (PST)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-163adf0cfc4so5071002fac.7;
        Mon, 30 Jan 2023 10:56:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hgv1VvNjNj6Q94199hCIZt/V8husj0gdXHJFv/iPUXM=;
        b=DQELn4glIf0ijmfIWAL72IbmvG/sqr7kMVRE5RxFqpfC+7agEJ0o8aZhpS6Ed2zuee
         lTCkVi1JifrtZ310SBXKEKOB4mVzXjG4Z5PU7EtLP8eV4y0K2eI9RhlktsCKJIInG/z+
         s55ck0TTx6appEwHiLsk4swQzh0wt4S+uw+OrRvOWRxoz+HlgX/51WQpc0was3gMSM6Z
         v5NKUC8mnyYZLzMv7IFAZC0L1ODiIrFgBXmNwCfc+1bXPQIps9K1KYuBvo1esuuZ6dhQ
         OeJ0qpXPjWgDcP86zCOBRqCFV3j5kiblYqhQgqQ0IOnnrNBVUh1NT6HUd7u11MoqsWoA
         NYHQ==
X-Gm-Message-State: AO0yUKUNqtMZFqMcO4S5qip3H/qE2II5Jb64zdbHJ3Idk5o+9EGpiwE9
        VHBtOhNMDnQ+ihM6HvA/Ag==
X-Google-Smtp-Source: AK7set8LqZbuCHSHi+I39eWIFkPDbgnZ3eNU4cNDV2le2/RQIOl4W1BD3WyF2rPc8fzvsQ96AK1Blg==
X-Received: by 2002:a05:6870:d254:b0:163:5acd:c1a9 with SMTP id h20-20020a056870d25400b001635acdc1a9mr10173235oac.53.1675104966975;
        Mon, 30 Jan 2023 10:56:06 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id my11-20020a056870698b00b00143ae7d4ccesm5556179oab.45.2023.01.30.10.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:56:06 -0800 (PST)
Received: (nullmailer pid 3114163 invoked by uid 1000);
        Mon, 30 Jan 2023 18:56:06 -0000
Date:   Mon, 30 Jan 2023 12:56:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-imx@nxp.com, linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Adam Ford <aford173@gmail.com>, devicetree@vger.kernel.org,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        kernel@pengutronix.de, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: media: Add i.MX8 ISI DT bindings
Message-ID: <167510496563.3114111.11512713399626094025.robh@kernel.org>
References: <20230126170603.11896-1-laurent.pinchart@ideasonboard.com>
 <20230126170603.11896-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126170603.11896-2-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On Thu, 26 Jan 2023 19:06:01 +0200, Laurent Pinchart wrote:
> The Image Sensing Interface (ISI) combines image processing pipelines
> with DMA engines to process and capture frames originating from a
> variety of sources. The inputs to the ISI go through Pixel Link
> interfaces, and their number and nature is SoC-dependent. They cover
> both capture interfaces (MIPI CSI-2 RX, HDMI RX) and memory inputs.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v3:
> 
> - Drop patternProperties for ports node
> - Add i.MX8MN example
> 
> Changes since v2:
> 
> - Describe the interrupts property
> - Set global minItems and maxItems for interrupts
> - Set maxItems for power-domains
> 
> Changes since v1:
> 
> - Fix compatible string checks in conditional schema
> - Fix interrupts property handling
> 
> dt-bindings: media: imx8-isi: Add i.MX8MN example
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../bindings/media/nxp,imx8-isi.yaml          | 173 ++++++++++++++++++
>  1 file changed, 173 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
