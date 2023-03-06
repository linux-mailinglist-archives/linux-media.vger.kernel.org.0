Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89B626AB9EF
	for <lists+linux-media@lfdr.de>; Mon,  6 Mar 2023 10:34:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbjCFJeb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Mar 2023 04:34:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbjCFJea (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Mar 2023 04:34:30 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D09B5C676
        for <linux-media@vger.kernel.org>; Mon,  6 Mar 2023 01:34:27 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23A5E308;
        Mon,  6 Mar 2023 10:34:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1678095265;
        bh=DfI09nm7k0sGrMQ8DwQmdBWStUFBWHXYRHI2HmIPYH8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=WIG65f/YwXcF+em4n6n8q2Lkc4tF893OphTLdaEQe1i/+cKg7RDyGG2mNhCAhGdfB
         xtLt5JcH+Gy0B6xZcMLF0N/ki3wVcoDW8tKBGJHakf7Ym5IXjJbY+8uNqRx3xeaDQb
         iLCAJxMARy/ixhe/2OeX9mGSFYgj5LUvEuMNVv2Y=
Message-ID: <f5ce2815-a875-25a4-269d-69b30ce534b7@ideasonboard.com>
Date:   Mon, 6 Mar 2023 09:34:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] media: ipu3-cio2: support more camera sensors in
 cio2-bridge
To:     bingbu.cao@intel.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        djrscally@gmail.com
Cc:     bingbu.cao@linux.intel.com
References: <20230303181504.1813469-1-bingbu.cao@intel.com>
Content-Language: en-US
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20230303181504.1813469-1-bingbu.cao@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Good morning Bingbu

On 03/03/2023 18:15, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
>
> Add more camera sensors into the supported camera sensors list
> to make cio2-bridge to support more camera sensors.
>
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>

Thanks; this looks ok to me now:


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> ---
> Changes from v1:
>   - remove some sensors without available drivers
>   - add .link_frequencies for each sensor
>
> ---
>   drivers/media/pci/intel/ipu3/cio2-bridge.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
> index dfefe0d8aa95..d59bec8a94e2 100644
> --- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
> +++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
> @@ -29,6 +29,14 @@ static const struct cio2_sensor_config cio2_supported_sensors[] = {
>   	CIO2_SENSOR_CONFIG("INT347E", 1, 319200000),
>   	/* Omnivision OV2680 */
>   	CIO2_SENSOR_CONFIG("OVTI2680", 0),
> +	/* Omnivision ov8856 */
> +	CIO2_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
> +	/* Omnivision ov2740 */
> +	CIO2_SENSOR_CONFIG("INT3474", 1, 360000000),
> +	/* Hynix hi556 */
> +	CIO2_SENSOR_CONFIG("INT3537", 1, 437000000),
> +	/* Omnivision ov13b10 */
> +	CIO2_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
>   };
>   
>   static const struct cio2_property_names prop_names = {
