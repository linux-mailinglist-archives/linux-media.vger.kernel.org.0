Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A15226A9840
	for <lists+linux-media@lfdr.de>; Fri,  3 Mar 2023 14:20:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbjCCNUv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Mar 2023 08:20:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbjCCNUt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Mar 2023 08:20:49 -0500
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72CAB16AC3;
        Fri,  3 Mar 2023 05:20:47 -0800 (PST)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
        by mx.sberdevices.ru (Postfix) with ESMTP id BB9935FD18;
        Fri,  3 Mar 2023 16:20:45 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
        s=mail; t=1677849645;
        bh=+rBieqkMux5sP6oyEOSgIkFeZI6CxgVMi6don9FXROA=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=RLdb+L4hcEn6/accvwZhkFpN17vkeywVfM7JdBMpmjjMw8FKEpLECL5mFPXNuCfYb
         2JxlRttjxGCV4uANIjZoIxvH4gjwBiWdG9/HyILtZdT/sN2SROChtI23W8/UU5Zky7
         seu08PEXcjWp/iS3mBBE1vvj3vAjPyRU4i6DINyXIMIOHTvfEiRzZMmhCXRsT6EkbJ
         6Is+b/LtvOW6vaOT1RHmjXrDOSg4AZBjnrfmsBFFSisMwpXy47urky3PE3mgJWqu3r
         YWadTLOWwp8tt3PhUa1MJCmgx0xq1TwXSvTVUsPIgV7IYk/VLdmsRFMmano7/h/qRC
         CqbfzTcKZGDDg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
        by mx.sberdevices.ru (Postfix) with ESMTP;
        Fri,  3 Mar 2023 16:20:45 +0300 (MSK)
Date:   Fri, 3 Mar 2023 16:20:45 +0300
From:   Dmitry Rokosov <ddrokosov@sberdevices.ru>
To:     zelong dong <zelong.dong@amlogic.com>
CC:     Neil Armstrong <neil.armstrong@linaro.org>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        <linux-media@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <kernel@sberdevices.ru>
Subject: Re: [PATCH 2/3] dt-bindings: media: Add compatible for Meson-S4 IR
 Controller
Message-ID: <20230303132045.nsmaqi3ph6xkls7k@CAB-WSD-L081021>
References: <20230302063402.42708-1-zelong.dong@amlogic.com>
 <20230302063402.42708-3-zelong.dong@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230302063402.42708-3-zelong.dong@amlogic.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/03 09:42:00 #20911747
X-KSMG-AntiVirus-Status: Clean, skipped
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 02, 2023 at 02:34:01PM +0800, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Add new compatible for Amlogic's Meson-S4 IR Controller
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

One space character is missing, if you want to align 'rc' and 'enable'
words.

[...]

-- 
Thank you,
Dmitry
