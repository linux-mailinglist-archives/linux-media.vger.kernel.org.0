Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3F53746F6B
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 13:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231379AbjGDLIN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 07:08:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230334AbjGDLIM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 07:08:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C48FBE75
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 04:08:10 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8D339B9;
        Tue,  4 Jul 2023 13:07:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688468845;
        bh=jWmevv3vBImOHUTViKyZVOySKacNDjwy44HOtuW/6cU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=qDfLoYWppHWRFUprDaG2Hq4WjPx8sRVLceddgQSduNRJruUnn2oWgMreX8/LyppVu
         sgjePSC1BoxGYq8weSPbyVbqKfmoZooN3MdPLeiSfL1StRZMHqb5qpiIe2A/AaIrzf
         CsIR1HmR/yum2N7KibVtEuxsMHCwJOFVHuyejYOo=
Message-ID: <1f1002d6-98f7-a14c-1b67-7c168df30a16@ideasonboard.com>
Date:   Tue, 4 Jul 2023 12:08:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 03/15] media: ipu-bridge: Move initialization of
 node_names.vcm to ipu_bridge_init_swnode_names()
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
References: <20230630110643.209761-1-hdegoede@redhat.com>
 <20230630110643.209761-4-hdegoede@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20230630110643.209761-4-hdegoede@redhat.com>
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


On 30/06/2023 13:06, Hans de Goede wrote:
> Move initialization of node_names.vcm to ipu_bridge_init_swnode_names()
> where it belongs.
>
> And make the initialization of nodes[SWNODE_VCM] unconditional,
> ipu_bridge_init_swnode_group() takes care of not registering it
> when there is no VCM.
>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
>   drivers/media/pci/intel/ipu-bridge.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index ef6c6cb7b51b..1c88fd925a8b 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -201,6 +201,12 @@ static void ipu_bridge_init_swnode_names(struct ipu_sensor *sensor)
>   	snprintf(sensor->node_names.endpoint,
>   		 sizeof(sensor->node_names.endpoint),
>   		 SWNODE_GRAPH_ENDPOINT_NAME_FMT, 0); /* And endpoint 0 */
> +	if (sensor->ssdb.vcmtype) {
> +		/* append ssdb.link to distinguish nodes with same model VCM */
> +		snprintf(sensor->node_names.vcm, sizeof(sensor->node_names.vcm),
> +			 "%s-%u", ipu_vcm_types[sensor->ssdb.vcmtype - 1],
> +			 sensor->ssdb.link);
> +	}
>   }
>   
>   static void ipu_bridge_init_swnode_group(struct ipu_sensor *sensor)
> @@ -237,13 +243,7 @@ static void ipu_bridge_create_connection_swnodes(struct ipu_bridge *bridge,
>   						sensor->node_names.endpoint,
>   						&nodes[SWNODE_IPU_PORT],
>   						sensor->ipu_properties);
> -	if (sensor->ssdb.vcmtype) {
> -		/* append ssdb.link to distinguish VCM nodes with same HID */
> -		snprintf(sensor->node_names.vcm, sizeof(sensor->node_names.vcm),
> -			 "%s-%u", ipu_vcm_types[sensor->ssdb.vcmtype - 1],
> -			 sensor->ssdb.link);
> -		nodes[SWNODE_VCM] = NODE_VCM(sensor->node_names.vcm);
> -	}
> +	nodes[SWNODE_VCM] = NODE_VCM(sensor->node_names.vcm);
>   
>   	ipu_bridge_init_swnode_group(sensor);
>   }
