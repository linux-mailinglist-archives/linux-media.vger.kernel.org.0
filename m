Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E545772835
	for <lists+linux-media@lfdr.de>; Mon,  7 Aug 2023 16:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbjHGOwX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Aug 2023 10:52:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjHGOwW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Aug 2023 10:52:22 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38C1510CB
        for <linux-media@vger.kernel.org>; Mon,  7 Aug 2023 07:52:21 -0700 (PDT)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 377Cp6jq002596
        for <linux-media@vger.kernel.org>; Mon, 7 Aug 2023 16:52:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        message-id:date:mime-version:subject:to:references:from
        :in-reply-to:content-type:content-transfer-encoding; s=
        selector1; bh=Min4vm5rDExXNEBKH/jyqERouawgdUmc4lYm0C7tfz0=; b=HE
        JT+wyZ+pPoY3P9UUuKnboCQYYY2PKikXg+jyVJb5iD85gAmH4opYkqmIqaZxpVfX
        Ztk2bJH/NByvnB+Dz9PPM4B+GYYVPtYoxy0tau4Yvcjx6zFFNP3UOgg7jMaoGhq2
        5p0cUm/LUAsMPoD96vyYB0LJAt7SwtJRx0HYT9ECm4OqK2V7/fAWpUsI4ynTnGFY
        GdgQ9m691sNy6a4PIDnQNkP5+D1huvw9AShvL0SpBH+cYEVj6AcbzOFHI+YQfS4h
        lWNx+10gR6iRbXBDOvPUbKa6uFvUSU/x7ZKwdcyK7OA5+8s4Hw2fnVAuxLOxca9N
        o6XbCb6w9D7O+JXFgC9Q==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sb0ytrntp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-media@vger.kernel.org>; Mon, 07 Aug 2023 16:52:19 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1BF9B10005E
        for <linux-media@vger.kernel.org>; Mon,  7 Aug 2023 16:52:18 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E3CB824C0DD
        for <linux-media@vger.kernel.org>; Mon,  7 Aug 2023 16:52:18 +0200 (CEST)
Received: from [10.129.166.114] (10.129.166.114) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 7 Aug
 2023 16:52:18 +0200
Message-ID: <a70549ec-1b04-bc70-988f-88269786820d@foss.st.com>
Date:   Mon, 7 Aug 2023 16:52:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [git:media_stage/master] media: dt-bindings: drop unneeded status
 from examples
To:     <linux-media@vger.kernel.org>
References: <E1qT0kj-00CTkV-9B@www.linuxtv.org>
Content-Language: en-US
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <E1qT0kj-00CTkV-9B@www.linuxtv.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.129.166.114]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_16,2023-08-03_01,2023-05-22_02
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 8/7/23 15:58, Hans Verkuil wrote:
> This is an automatic generated email to let you know that the following patch were queued:
> 
> Subject: media: dt-bindings: drop unneeded status from examples
> Author:  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Date:    Tue Jul 25 12:16:25 2023 +0200
> 
> Example DTS should not have 'status' property.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Careful you have both my Reviewed-by and Acked-by tag.

This is my fault as I initially sent the Reviewed-by, but it should be
an Acked-By tag instead as pointed by Krzysztof, as it applies only to a
part of the patch and not its entirety.
Sorry for the mess.

> 
>  Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml | 1 -
>  Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml       | 1 -
>  2 files changed, 2 deletions(-)
> 
> ---
> 
> diff --git a/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml b/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
> index 369c48fd9bf9..a6b73498bc21 100644
> --- a/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
> +++ b/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
> @@ -53,6 +53,5 @@ examples:
>          interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
>          clocks = <&tegra_car TEGRA124_CLK_CEC>;
>          clock-names = "cec";
> -        status = "disabled";
>          hdmi-phandle = <&hdmi>;
>      };
> diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
> index 19a39d753aad..b68141264c0e 100644
> --- a/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
> @@ -143,7 +143,6 @@ examples:
>          mipid02: csi2rx@14 {
>              compatible = "st,st-mipid02";
>              reg = <0x14>;
> -            status = "okay";
>              clocks = <&clk_ext_camera_12>;
>              clock-names = "xclk";
>              VDDE-supply = <&vdd>;

-- 
Regards,

Benjamin
