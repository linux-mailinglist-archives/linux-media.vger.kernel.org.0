Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 601E96A7D1D
	for <lists+linux-media@lfdr.de>; Thu,  2 Mar 2023 09:57:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbjCBI5I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Mar 2023 03:57:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbjCBI5G (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Mar 2023 03:57:06 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4927F2DE77;
        Thu,  2 Mar 2023 00:57:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0A417B8113E;
        Thu,  2 Mar 2023 08:57:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FDA6C433EF;
        Thu,  2 Mar 2023 08:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677747420;
        bh=pcKN3FLFDhgunSp72xFOL6crsVesd7YhlglC4BR/PPE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=DoM1yUDwsaCDWoWBjXfAWsmp/hu0tXmmL1eKdEEdD/mvM8fJZsYNcgrTVzxFZvZMH
         Hfe/4RM0wA+Eso3dNnyCb4ACQpTe3WiyhXKeYBdZMNkRRblmeWwqmLXz/hm78q7EaM
         lYeDi9OKpuYfXAmvhz94WiCgXUeMTfBACSp+Cm+b/ePISEum+THIAoj2M8wOYgZTzL
         4SOZ6GC78zClXKzlTcIkku/AMy+jpkFHERDe2+sf7pwtSpFtfNFO31Rqe6GsL/QuNn
         VQmpSllaFy7yFK1fAW4inEoTI+tzBrXMcNCZzbyfza/RPiNLojqQtf7H5YP6Kgp0X2
         P9yXMutNkSWRA==
Message-ID: <62ac6aba-76e5-a13c-1428-f14de69de6fb@kernel.org>
Date:   Thu, 2 Mar 2023 09:56:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/3] arm64: dts: meson: add IR controller for Meson-S4 SoC
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
 <20230302063402.42708-4-zelong.dong@amlogic.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230302063402.42708-4-zelong.dong@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/03/2023 07:34, zelong dong wrote:
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
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index ad50cba42d19..309352a83eda 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -106,6 +106,14 @@ gpio: bank@4000 {
>  					#gpio-cells = <2>;
>  					gpio-ranges = <&periphs_pinctrl 0 0 82>;
>  				};
> +
> +				remote_pins: remote_pin {

No underscores in node names,

Best regards,
Krzysztof

