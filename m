Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41546746F52
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 13:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231309AbjGDLDa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 07:03:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231297AbjGDLD3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 07:03:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7869CDA
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 04:03:28 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E6880D4A;
        Tue,  4 Jul 2023 13:02:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688468563;
        bh=Kum76n6zp2PBhBVQTpta9uDADj+kQFjt9wPDSU1pXrQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=KvHXqf8LYw+V80m6Zbs+UTup1OINeCFCiWyx1Ge3lmSyDJhOVJwbjJS4IQdROltX1
         fuVp4ZNFv6dsxLXO0BNsZn+GS2kJS8Oi+yY2QLMYSHhtq/UyLgUsa8tAoj7bZwoE18
         rSVyVTdk8AiSw73f7FcEO14h/3vqv6L61vSyU9M4=
Message-ID: <fbb02efb-09d3-1466-ad92-73ee4eb9db2e@ideasonboard.com>
Date:   Tue, 4 Jul 2023 12:03:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 02/15] media: ipu-bridge: Do not use on stack memory
 for software_node.name field
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
References: <20230630110643.209761-1-hdegoede@redhat.com>
 <20230630110643.209761-3-hdegoede@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20230630110643.209761-3-hdegoede@redhat.com>
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
> Commit 567f97bd381f ("media: ipu3-cio2: support multiple sensors and VCMs
> with same HID") introduced an on stack vcm_name and then uses this for
> the name field of the software_node struct used for the vcm.
>
> But the software_node struct is much longer lived then the current
> stack-frame, so this is no good.
>
> Instead extend the ipu_node_names struct with an extra field to store
> the vcm software_node name and use that.
>
> Note this also changes the length of the allocated buffer from
> ACPI_ID_LEN + 4 to 16. the name is filled with "<ipu_vcm_types[x]>-%u"
> where ipu_vcm_types[x] is not an ACPI_ID. The maximum length of
> the strings in the ipu_vcm_types[] array is 11 + 5 bytes for "-255\0"
> means 16 bytes are needed in the worst case scenario.
>
> Fixes: 567f97bd381f ("media: ipu3-cio2: support multiple sensors and VCMs with same HID")
> Cc: Bingbu Cao <bingbu.cao@intel.com>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   drivers/media/pci/intel/ipu-bridge.c | 7 +++----
>   drivers/media/pci/intel/ipu-bridge.h | 1 +
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index f0927f80184d..ef6c6cb7b51b 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -220,7 +220,6 @@ static void ipu_bridge_create_connection_swnodes(struct ipu_bridge *bridge,
>   						 struct ipu_sensor *sensor)
>   {
>   	struct software_node *nodes = sensor->swnodes;
> -	char vcm_name[ACPI_ID_LEN + 4];
>   
>   	ipu_bridge_init_swnode_names(sensor);
>   
> @@ -240,10 +239,10 @@ static void ipu_bridge_create_connection_swnodes(struct ipu_bridge *bridge,
>   						sensor->ipu_properties);
>   	if (sensor->ssdb.vcmtype) {
>   		/* append ssdb.link to distinguish VCM nodes with same HID */
> -		snprintf(vcm_name, sizeof(vcm_name), "%s-%u",
> -			 ipu_vcm_types[sensor->ssdb.vcmtype - 1],
> +		snprintf(sensor->node_names.vcm, sizeof(sensor->node_names.vcm),
> +			 "%s-%u", ipu_vcm_types[sensor->ssdb.vcmtype - 1],
>   			 sensor->ssdb.link);
> -		nodes[SWNODE_VCM] = NODE_VCM(vcm_name);
> +		nodes[SWNODE_VCM] = NODE_VCM(sensor->node_names.vcm);
>   	}
>   
>   	ipu_bridge_init_swnode_group(sensor);
> diff --git a/drivers/media/pci/intel/ipu-bridge.h b/drivers/media/pci/intel/ipu-bridge.h
> index 8cb733c03e2f..6cce712a0f34 100644
> --- a/drivers/media/pci/intel/ipu-bridge.h
> +++ b/drivers/media/pci/intel/ipu-bridge.h
> @@ -103,6 +103,7 @@ struct ipu_node_names {
>   	char port[7];
>   	char endpoint[11];
>   	char remote_port[7];
> +	char vcm[16];
>   };
>   
>   struct ipu_sensor_config {
