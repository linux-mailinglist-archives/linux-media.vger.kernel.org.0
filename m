Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF544EBB92
	for <lists+linux-media@lfdr.de>; Wed, 30 Mar 2022 09:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240849AbiC3HRj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Mar 2022 03:17:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231192AbiC3HRh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Mar 2022 03:17:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D42618B7A7;
        Wed, 30 Mar 2022 00:15:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EBB1A6171F;
        Wed, 30 Mar 2022 07:15:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1D63C340EC;
        Wed, 30 Mar 2022 07:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648624552;
        bh=SxJh/AU3dTlFq/zM5QD7GIB+GWItILWaKTz5mqVE33E=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=kNb6eJZy/3lzNQnBPMn0WD8RnHj5MHG+qqMcAaoolEDIuD9GxaK3ywuvQwnz2tCzj
         UOFRRW6x6V1F3xwchKo0jLS5Ohyz7Ver/Lq+mHtz2LK8vJwmiobykuHQt+g+kZz9kN
         XQRlYQL9CR/1RuSIzkrq0+POBWzXwaQ7OJ9A0Vk9jNDhMrt6C3Fg6Or9Ev3djDaojn
         VLwrGkefz7VFyeg1d3JBwEoMUtiyMdRKCjfN7V20zS8XZzg+tGUp5k+OPm3UgsO2Fl
         2sMhYCLJ5b1S6wHlcGruxuArohBWZse5m7HJp+6VluoJ4odLC47ZZrXsgNmdFovLP7
         Bge1FAoL7XPjg==
Message-ID: <fff59e1d-2f1c-ed96-4bf8-5744b75d1998@kernel.org>
Date:   Wed, 30 Mar 2022 09:15:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] dt-bindings: Convert Dongwoon dw9807-vcm bindings
 to json-schema
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, robh@kernel.org
References: <20220329212654.587451-1-sakari.ailus@linux.intel.com>
 <20220329212654.587451-3-sakari.ailus@linux.intel.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220329212654.587451-3-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/03/2022 23:26, Sakari Ailus wrote:
> Convert the old text based dw9807-vcm chip DT bindings to json-schema.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../media/i2c/dongwoon,dw9807-vcm.txt         |  9 ----
>  .../media/i2c/dongwoon,dw9807-vcm.yaml        | 43 +++++++++++++++++++
>  2 files changed, 43 insertions(+), 9 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.txt b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.txt
> deleted file mode 100644
> index c4701f1eaaf63..0000000000000
> --- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.txt
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -Dongwoon Anatech DW9807 voice coil lens driver
> -
> -DW9807 is a 10-bit DAC with current sink capability. It is intended for
> -controlling voice coil lenses.
> -
> -Mandatory properties:
> -
> -- compatible: "dongwoon,dw9807-vcm"
> -- reg: I2C slave address
> diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.yaml
> new file mode 100644
> index 0000000000000..0cf153ed547fe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2018, 2021 Intel Corporation
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9807-vcm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Dongwoon Anatech DW9807 voice coil lens driver
> +
> +maintainers:
> +  - Sakari Ailus <sakari.ailus@linux.intel.com>
> +
> +description: |
> +  DW9807 is a 10-bit DAC with current sink capability. It is intended for
> +  controlling voice coil lenses.
> +
> +properties:
> +
> +  compatible:
> +    const: "dongwoon,dw9807-vcm"

Nothing changed here about new lines and quotes.

Best regards,
Krzysztof
