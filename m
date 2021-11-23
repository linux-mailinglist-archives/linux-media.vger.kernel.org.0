Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CD18459C5A
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 07:28:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbhKWGb3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 01:31:29 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:55304 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbhKWGb1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 01:31:27 -0500
Received: from [IPV6:2a01:e0a:169:7140:3c3b:9149:b:8aa9] (unknown [IPv6:2a01:e0a:169:7140:3c3b:9149:b:8aa9])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7395CA1B;
        Tue, 23 Nov 2021 07:28:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637648898;
        bh=XPRQZ8qoZjq/7d5ShespT88ZFptWKW0P/j8V4tjMm28=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=v8FbD3/USfhs2LRhHcNYeD5VNdi5Yk/U9+f+x9LkQ0ZZn6AdHsmJeMO1N4Pp2v6Bt
         6Ozy82W91l8pNyAKY0n6bVBcyyLfWdxbHqU/G7LaS5ymdhn3RFU8qeBzjLn6y7FwNw
         2ogdQHNiRCVbHdkehw4lzOzBQZIGTJmw+kO9KnDc=
Message-ID: <01395115-48ba-8478-f6b6-637a77a8ede8@ideasonboard.com>
Date:   Tue, 23 Nov 2021 07:28:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v6 3/3] media: ipu3-cio2: Add link freq for INT33BE entry
Content-Language: en-US
To:     Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, kieran.bingham@ideasonboard.com,
        hdegoede@redhat.com
References: <20211122235613.41682-1-djrscally@gmail.com>
 <20211122235613.41682-4-djrscally@gmail.com>
From:   Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
In-Reply-To: <20211122235613.41682-4-djrscally@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On 23/11/2021 00:56, Daniel Scally wrote:
> Add a link frequency to the cio2-bridge table of supported sensors.
> This means that the driver can parse supported link frequencies from
> firmware in the usual way and validate that it can accommodate them.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
Tested-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Reviewed-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>

> ---
> Changes since v5:
> 
> 	- None
> 
>   drivers/media/pci/intel/ipu3/cio2-bridge.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
> index 0b586b4e537e..b4b8930d795c 100644
> --- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
> +++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
> @@ -21,7 +21,7 @@
>    */
>   static const struct cio2_sensor_config cio2_supported_sensors[] = {
>   	/* Omnivision OV5693 */
> -	CIO2_SENSOR_CONFIG("INT33BE", 0),
> +	CIO2_SENSOR_CONFIG("INT33BE", 1, 419200000),
>   	/* Omnivision OV2680 */
>   	CIO2_SENSOR_CONFIG("OVTI2680", 0),
>   };
> 
