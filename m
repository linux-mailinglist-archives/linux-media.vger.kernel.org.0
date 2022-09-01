Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 001395A9B5D
	for <lists+linux-media@lfdr.de>; Thu,  1 Sep 2022 17:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232790AbiIAPQh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Sep 2022 11:16:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbiIAPQg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Sep 2022 11:16:36 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE8455A838
        for <linux-media@vger.kernel.org>; Thu,  1 Sep 2022 08:16:35 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id b16so23028307edd.4
        for <linux-media@vger.kernel.org>; Thu, 01 Sep 2022 08:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=XaMYROyIbD4O6J7fSXWG/OuXYtrufXvUW1y96Bpknvc=;
        b=GjRKJj4osfzZ27ihe7J+kVcKw0dKzHhMyr/z/rHUzszRD8ickcAeY/MJeHQpdarXlF
         Jhvc7VgjTxjB8nWpixxwn08GO1mMfT7rim2hf/JKq679eEMfYaKexiz0isB8IzkVZ2vC
         QbYo6rQQeSpde4GrDlz34dESn7buMIJZLHGSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=XaMYROyIbD4O6J7fSXWG/OuXYtrufXvUW1y96Bpknvc=;
        b=p2sKUXTFVfjDff0XChUgR476EF3sTodX7yB8385HF1m4VmRU0Cy8lJnSrtSUWsdz3m
         cBRqJM0MyIKdcNsnlES25woC1pnUiWyvKHQN1cEaiMzu68R8TN0uH1qPboxXo9Y/+BXQ
         joYVm5ijxsV4aAqGlU0Qn0s2xIk0+Ybdq6MahoAi8A1zrz600OVMsdhCIzONdbEpz8we
         bEej+74R1NHhjn7BjJbFn3DBAiONNUiij04MxnoMIrHQfz9+KxdxIJhl1ysLJqCTYDPO
         j9AL32gNb3wL8/L9TzE70AeJGjC0iF3V420PWuNzWJ0Nh682gS1290LEnWHkGCFuFmSc
         diTQ==
X-Gm-Message-State: ACgBeo31KKvRF2Imc1YtlM60N9Eoh3x6d6PNgrXYG7/gt4nSD/0s7bLG
        zhh9FCWd6eBn5iiFyqhJKRO1jv5E4uWAZQ==
X-Google-Smtp-Source: AA6agR61Hv6nnmOCkTn3OzBmhqGpDnyNWKuJcJQOotEKgWBYO+vAVo8lI6+7dTFc02GP3rkv8CFP8w==
X-Received: by 2002:a05:6402:42c5:b0:448:913e:f16 with SMTP id i5-20020a05640242c500b00448913e0f16mr14895094edc.22.1662045394130;
        Thu, 01 Sep 2022 08:16:34 -0700 (PDT)
Received: from p310.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id b5-20020a17090630c500b0073dde7c1767sm8641552ejb.175.2022.09.01.08.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 08:16:33 -0700 (PDT)
Date:   Thu, 1 Sep 2022 18:20:59 +0300
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Subject: Re: imx8m-mini csi-2 limitations
Message-ID: <YxDN2+1chUENUeq6@p310.k.g>
References: <YvpPusE1rOzmgPYN@carbon.k.g>
 <Yv4GEUTj4rMiagAX@p310.k.g>
 <20220818105131.gurtn74av2ilr7bi@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220818105131.gurtn74av2ilr7bi@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22-08-18 12:51:31, Jacopo Mondi wrote:
>

<snip>

> If I recall correctly there are at least three configurations at play:
> 
> - The CSIS pixel mode selection
> 
>   MIPI_CSI_ISP_CONFIG[13:12]

Funny enough adding MIPI_CSIS_ISPCFG_PIXEL_MODE_QUAD and 
MIPI_CSIS_ISPCFG_ALIGN_32BIT to the config(0) register actually produced an 
image.  Highly distorted image, but did not break the image acquisition.

MIPI_CSIS_ISPCFG_ALIGN_32BIT seems to be the wrong flag here, but it without it 
the streaming got blocked.

>   The driver currently forces dual pixel sampling mode for YUV422
>   and report a TODO:
> 
>   * TODO: Verify which other formats require DUAL (or QUAD) modes.
> 
>   Here you're trying to transfer RAW12 data, which is indicated in the
>   register documentation as one of the formats suitable for DUAL/QUAD
>   mode transfer
> 
>   - I'm actually not sure how and if RAW12 gets expanded to 16 bit
>     samples by filling the 16-bit word with 0s or it either gets
>     packed in 6 bytes with no paddings. Figure "13-33. Pixel
>     alignment" seems to suggest that, but I'm not sure I really got
>     that diagram
> 
> - The CSI-bridge
> 
>   - CSI_CR3[3] SENSOR_16BITS

Actually the driver is always setting this one for raw10/12 formats.

>   - CSI_CR18[20] MIPI_DOUBLE_CMP

Enabling this bit for raw10/12 formats kills the transmission.  According to the 
documentation this flag transfers full pixel per clock cycle as opposed to just 
half a pixel.

>   The comment in imx7_csi_configure() explains how different versions of YUYV 
>   (2X8 and 1X16) are handled, and why SENSOR_16BITS and MIPI_DOUBLE_CMP have 
>   to be enabled when the csi-bridge has to be instructed to sample 16 bits 
>   samples from the RX queue.

Seems like i have to find a way to make the mipi-csi stream full pixel (iow 
16bit), if any such thing exists.  And hope this configuration is supported 
between both parts, mipi & bridge.

> I guess the key would be here to find out what combination of SINGLE/DUAL/QUAD 
> sampling is opportune for RAW12 (I would try with DUAL first and then QUAD) 
> and then configure the csi-bridge bus sampling mode accordingly (likely in the 
> same was as it is done for YUYV_1X16)

In fact i was mimicking MEDIA_BUS_FMT_YUYV8_1X16 case, but as mentioned, this 
didn't work.  Seems like raw10/12 formats are not so well (if at all) handled by 
the bridge.

> When it comes to bandwidth limitation, can you try to reduce the sensor output 
> size to make sure you chase one issue at the time ?

I used insanely big vblank and hblank values.  Obtaining single frame took about 
90 seconds.  This indeed reduced "FIFO Overflow Error" and "Frame Size Error" to 
four digit number (the lowest rate i've seen so far), but there was no visible 
improvement in the captured test pattern image.

I doubt i can make the sensor stream slower and i also think it doesn't make 
sense to go down this path - there are still errors.

Any advice on how to debug the CSI bridge?  NXP support is as useless as ever.


cheers,
Petko
