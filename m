Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B342631484
	for <lists+linux-media@lfdr.de>; Sun, 20 Nov 2022 14:55:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbiKTNz2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Nov 2022 08:55:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbiKTNz1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Nov 2022 08:55:27 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2510812D1E
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 05:55:26 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 58F638525E;
        Sun, 20 Nov 2022 14:55:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1668952523;
        bh=ZLjp9wvGxc8AN9k11WwbIgi85POBTMW+NkdcLhCLTCQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Xt8q72xHsFVzXkaVWfJpJaCWbScdBiR0BkDTUxGRHPO5NZ00cEucUMvmZ61tcK96V
         FP0bjhbUOBRPP4ETPJ6g8AHyjn6CGhaqIBUcJNP/QDXzZiQrg1yWhFU54bxlhWft//
         QcpmY5Uq/g2S1dDCO5CZsFQmdJLNpAcoIh6ZUgF9RPjJa8/3z6E9HGPAac9pQ235a5
         C5YamFJgw6Ww30uYz0xvEAFGN2S2/HZn1sgykCYY37wuEFNxVOVS2PrVD67oAAfiGR
         llqbKbG18KX45IxfisKlJlkHoiP/HFerir0J5QArKz3Tx0vsMTEhNIUl80q1/x4+ke
         o9MIzarBYOn7A==
Message-ID: <8d9a6e49-fde7-74a3-a2c7-adc370dfade6@denx.de>
Date:   Sun, 20 Nov 2022 14:55:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2] media: mt9p031: Increase post-reset delay
Content-Language: en-US
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
References: <20220823222216.411656-1-marex@denx.de>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20220823222216.411656-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/24/22 00:22, Marek Vasut wrote:
> The MT9P006 sensor driver sporadically fails to probe because the sensor
> responds with a NACK condition to I2C address on the bus during an attempt
> to read the sensor MT9P031_CHIP_VERSION register in mt9p031_registered().
> 
> Neither the MT9P006 nor MT9P031 datasheets are clear on reset signal timing.
> Older MT9M034 [1] datasheet provides those timing figures in Appendix-A and
> indicates it is necessary to wait 850000 EXTCLK cycles before starting any
> I2C communication.
> 
> Add such a delay, which does make the sporadic I2C NACK go away, so it is
> likely similar constraint applies to this sensor.
> 
> [1] https://www.onsemi.com/pdf/datasheet/mt9m034-d.pdf
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Stefan Riedmueller <s.riedmueller@phytec.de>
> ---
> V2: - In case clk_get_rate() returns 0, use slowest supported clock
>        to avoid division by zero

Any news on this patch ?
