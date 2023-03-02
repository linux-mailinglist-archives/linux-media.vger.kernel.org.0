Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48FF76A7D18
	for <lists+linux-media@lfdr.de>; Thu,  2 Mar 2023 09:56:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbjCBI4d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Mar 2023 03:56:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjCBI4c (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Mar 2023 03:56:32 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C738425965;
        Thu,  2 Mar 2023 00:56:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6BC40B811A1;
        Thu,  2 Mar 2023 08:56:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968EBC433A4;
        Thu,  2 Mar 2023 08:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677747389;
        bh=eoE3BSuOF9U6nSiuduUdzvmOmH7E3fGV+JurSGV6L/0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=kJD8dgfjSajccXXQZIDokCyc1flrDrITjcsUh+oZpt49AT7dAVbl0e/vdbpMppApn
         p3FyTpnMJmj790EIAqmvo3YiWJCURBumv4z3+EoSQywUvdJEGeQT7n6jtWEevwwtC2
         tK4CZDspxgufCuEx6+F7CAFsLnE1c1N7FgN8u1cpNCIJ4aOOzti8BxVIl/thqmCjOT
         bOmsy0Y4TFQ1ThgDDvKEILJ6LKDQzJRfbifsMSAuyor3IT6r/aX257yOmVPI49sZ+X
         ICpT4G5kmOD+Fp17UszGDV3OoNfGpC9v3pUt0QQWLd8tolyTg9f6atWjwof2yhvRcA
         TxfLrEJsp3V4w==
Message-ID: <ad325c16-b0ae-0bb8-407c-f37cc3f070e7@kernel.org>
Date:   Thu, 2 Mar 2023 09:56:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/3] dt-bindings: media: Add compatible for Meson-S4 IR
 Controller
Content-Language: en-US
To:     zelong dong <zelong.dong@amlogic.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org
References: <20230302063402.42708-1-zelong.dong@amlogic.com>
 <20230302063402.42708-3-zelong.dong@amlogic.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230302063402.42708-3-zelong.dong@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/03/2023 07:34, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Add new compatible for Amlogic's Meson-S4 IR Controller

You do more than written here... Also, add full stop to the commit msg.
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> ---
>  Documentation/devicetree/bindings/media/meson-ir.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/meson-ir.txt b/Documentation/devicetree/bindings/media/meson-ir.txt
> index efd9d29a8f10..2a6662edd04d 100644
> --- a/Documentation/devicetree/bindings/media/meson-ir.txt
> +++ b/Documentation/devicetree/bindings/media/meson-ir.txt
> @@ -5,11 +5,14 @@ Required properties:
>  		  - "amlogic,meson6-ir"
>  		  - "amlogic,meson8b-ir"
>  		  - "amlogic,meson-gxbb-ir"
> +		  - "amlogic,meson-s4-ir"
>   - reg		: physical base address and length of the device registers
>   - interrupts	: a single specifier for the interrupt from the device
>  
>  Optional properties:
>   - linux,rc-map-name:	see rc.txt file in the same directory.
> + - amlogic,ir-support-hw-decode: enable hardware IR Decoder, and register
> +				 rc driver as type RC_DRIVER_SCANCODE


Please convert the file to DT schema (YAML) first, before adding new
properties. New compatible would be fine, but not new properties.

Best regards,
Krzysztof

