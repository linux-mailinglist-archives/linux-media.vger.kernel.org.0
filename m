Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 698F6746ECA
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 12:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbjGDKfs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 06:35:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbjGDKfr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 06:35:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3BB1184
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 03:35:45 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE7572093;
        Tue,  4 Jul 2023 12:34:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688466900;
        bh=h74rSecisf1JgzdAHqgL/dcp1c3ms7C7hrR2/PoXWGo=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=jHZnhY9yYOrGnRRswP8V1Bc7eTRR03qjrpmeG0k81YCZQTFmf/0VPj7w7jh3/V237
         DL9lWsCmnwah7Fwr6xtt0PRwuVJ9KvGnFI+ge8JiqwLaRITelmp0E9xCDn2bEyftCN
         CD1lfZ86Q3LiC5nnf/XLy/occ7HGoOTldPdgaHoo=
Message-ID: <5f77990f-0256-0502-7b11-8ccdd0eeb1cd@ideasonboard.com>
Date:   Tue, 4 Jul 2023 11:35:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 12/15] media: ipu-bridge: Add GalaxyCore GC0310 to
 ipu_supported_sensors[]
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
References: <20230630110643.209761-1-hdegoede@redhat.com>
 <20230630110643.209761-13-hdegoede@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20230630110643.209761-13-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On 30/06/2023 13:06, Hans de Goede wrote:
> The GalaxyCore GC0310 is used together with the atomisp no various


s/no/on

> devices, add it to ipu_supported_sensors[].
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> ---
>   drivers/media/pci/intel/ipu-bridge.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index eb7c56e8ef9f..07a34f20af8e 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -36,6 +36,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
>   	IPU_SENSOR_CONFIG("INT3537", 1, 437000000),
>   	/* Omnivision ov13b10 */
>   	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
> +	/* GalaxyCore GC0310 */
> +	IPU_SENSOR_CONFIG("INT0310", 0),
>   };
>   
>   static const struct ipu_property_names prop_names = {
