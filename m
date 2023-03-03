Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 786456A9837
	for <lists+linux-media@lfdr.de>; Fri,  3 Mar 2023 14:18:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbjCCNSH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Mar 2023 08:18:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbjCCNSG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Mar 2023 08:18:06 -0500
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B548B75C
        for <linux-media@vger.kernel.org>; Fri,  3 Mar 2023 05:18:04 -0800 (PST)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
        by mx.sberdevices.ru (Postfix) with ESMTP id 412EA5FD18;
        Fri,  3 Mar 2023 16:18:02 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
        s=mail; t=1677849482;
        bh=PohEVBJpaCq/s8VczFxlHVqki7Sv8xD8pAL7OoD88sM=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=D+6XsxQ9Z6nsis6X2br/imhZAMU1v3op2ZvV7GReVh4zxrcoMlA5gi+mcUUdte6gH
         3PbD3ob/UnA027YBo78CLg+x0Q1HxX8glsLO6wktTxTdi9TnloOHdva/3ZGhR6T34w
         6Xhc+djVvgNFQHN0fwl+y2eLVtBErry9mhYksDX2t4VCfnbBdMCVT8Mq6R6b56uCOK
         a1B41IQc34hgTO+yucYY47Ss3vorksiQNrJxC/TPXXVut7u6Z8IbNG2/QCAL73KsPZ
         1/93XssUs5UYJeAjHyvysL+cuFetM9wjMwlQU0TUbDwPfBwAnSRbGcHVQ6kv1LLNrI
         GNlOSE7ZT54Yw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
        by mx.sberdevices.ru (Postfix) with ESMTP;
        Fri,  3 Mar 2023 16:18:01 +0300 (MSK)
Date:   Fri, 3 Mar 2023 16:18:00 +0300
From:   Dmitry Rokosov <ddrokosov@sberdevices.ru>
To:     zelong dong <zelong.dong@amlogic.com>
CC:     Neil Armstrong <neil.armstrong@linaro.org>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        <linux-media@vger.kernel.org>, <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH 3/3] arm64: dts: meson: add IR controller for Meson-S4 SoC
Message-ID: <20230303131800.aegeaz7syyuwosw3@CAB-WSD-L081021>
References: <20230302063402.42708-1-zelong.dong@amlogic.com>
 <20230302063402.42708-4-zelong.dong@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230302063402.42708-4-zelong.dong@amlogic.com>
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

On Thu, Mar 02, 2023 at 02:34:02PM +0800, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Add the IR controller device of Meson-S4 SoC family, and enable
> hardware IR decoder.
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> ---
>  .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts   |  6 ++++++
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi        | 16 ++++++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> index 8ffbcb2b1ac5..4d3a81b3b762 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> @@ -28,3 +28,9 @@ memory@0 {
>  &uart_B {
>  	status = "okay";
>  };
> +
> +&ir {
> +	status = "disabled";
> +	pinctrl-0 = <&remote_pins>;
> +	pinctrl-names = "default";
> +};

I think dts and dtsi changes should be splitted to two different
patchsets.

Why do we need dts changes if ir node is disabled by default and you
don't enable it here?

[...]

-- 
Thank you,
Dmitry
