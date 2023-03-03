Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D15016A9B3C
	for <lists+linux-media@lfdr.de>; Fri,  3 Mar 2023 16:53:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbjCCPx0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Mar 2023 10:53:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231234AbjCCPxY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Mar 2023 10:53:24 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE981BB88
        for <linux-media@vger.kernel.org>; Fri,  3 Mar 2023 07:53:23 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27F25735;
        Fri,  3 Mar 2023 16:53:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677858802;
        bh=rJAXGZMLwX9b0zzyYz8e8SAvsnSwv7gqFjyE1Q+nnBw=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=uuREpFBSSYZ0rejqb7tENEHvU9JjI4MnSugi/KKbxv0QWDysYl52Wa3CUlPRh61Ze
         dQwraQQhytkiaw/48+rBjnFPSz3Zgr6UadP4zwZUjoLb3mTHuDATB3Cio3uvaKDE0e
         h/Tx+s9xkgDP1i41KqHb8bAHq4TStQRVN6rnaon0=
Message-ID: <8054e6e6-84df-06a4-67fe-b4c538708eb9@ideasonboard.com>
Date:   Fri, 3 Mar 2023 15:53:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To:     bingbu.cao@intel.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        djrscally@gmail.com
Cc:     bingbu.cao@linux.intel.com
References: <20230303143643.2095888-1-bingbu.cao@intel.com>
Content-Language: en-US
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH] media: ipu3-cio2: support more camera sensors in
 cio2-bridge
In-Reply-To: <20230303143643.2095888-1-bingbu.cao@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu, thanks for the patch

On 03/03/2023 14:36, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
>
> Add more camera sensors into the supported camera sensors list
> to make cio2-bridge to support more camera sensors.
>
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>   drivers/media/pci/intel/ipu3/cio2-bridge.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>
> diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
> index dfefe0d8aa95..9e6046fa0bd0 100644
> --- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
> +++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
> @@ -29,6 +29,25 @@ static const struct cio2_sensor_config cio2_supported_sensors[] = {
>   	CIO2_SENSOR_CONFIG("INT347E", 1, 319200000),
>   	/* Omnivision OV2680 */
>   	CIO2_SENSOR_CONFIG("OVTI2680", 0),
> +	/* Omnivision ov02c10 */
> +	CIO2_SENSOR_CONFIG("OVTI02C1", 0, 0),


I don't see a driver that supports this HID. I think unless there's an actual driver that supports 
the sensor, adding an entry here is a bad idea. The problem with it is that the ipu3-cio2 driver 
will add async subdevs for each sensor that it finds listed here, and if a matching driver doesn't 
probe for that subdev then the .bound() callback for the notifier registered by ipu3-cio2 will never 
run, which means media links and v4l2 devnodes never get created, which means _none_ of the cameras 
in the laptop will work even if the other ones do have working drivers.


It's quite annoying because there's a good long list of sensors this _can_ support but until we fix 
the notifier's weirdness I think this list needs to be limited to entries that are supported by 
in-tree drivers.

> +	/* Omnivision ov01a10 */
> +	CIO2_SENSOR_CONFIG("OVTI01A0", 0, 0),
> +	/* Omnivision ov01a1s */
> +	CIO2_SENSOR_CONFIG("OVTI01AS", 0, 0),
> +	/* Omnivision ov8856 */
> +	CIO2_SENSOR_CONFIG("OVTI8856", 0, 0),


Similarly, although there is a driver that matches to OVTI8856 that driver checks what 
link-frequencies are reported by firmware and then fails out if it finds no entries or if none of 
the entries match the ones it knows how to configure [1]. That will again cause any sensors with 
fully functional drivers to also fail, because the ipu3-cio2's notifier will never see its 
.complete() callback run and so the links and devnodes don't get set up. So I think that you need to 
detail the link-frequencies here to make sure that the driver can find them.


[1] https://elixir.bootlin.com/linux/latest/source/drivers/media/i2c/ov8856.c#L2420

> +	/* Omnivision ov2740 */
> +	CIO2_SENSOR_CONFIG("INT3474", 0, 0),
> +	/* Hynix hi556 */
> +	CIO2_SENSOR_CONFIG("INT3537", 0, 0),
> +	/* Himax hm2170 */
> +	CIO2_SENSOR_CONFIG("HIMX2170", 0, 0),
> +	/* Himax hm11b1 */
> +	CIO2_SENSOR_CONFIG("HIMX11B1", 0, 0),
> +	/* Omnivision ov13b10 */
> +	CIO2_SENSOR_CONFIG("OVTIDB10", 0, 0),
> +	CIO2_SENSOR_CONFIG("OVTI13B1", 0, 0),
>   };
>   
>   static const struct cio2_property_names prop_names = {
