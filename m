Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C405921C55C
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2020 18:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728597AbgGKQsS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Jul 2020 12:48:18 -0400
Received: from mail-mw2nam12olkn2049.outbound.protection.outlook.com ([40.92.23.49]:3369
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728412AbgGKQsS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Jul 2020 12:48:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U18P8hdfkY5JlPHWZ7u30u2Y89kccBWNEbZuEJVSC7pHQJSeKtvkYhGzkvUtGBhLlPqklbuRMFJBkq2Lj0tKvLgEGtjLGhuoO1kFTOaeZrHVYVIl8NSyW4qajVuKytcXM4lZeDw+EpT7sEZ/45vLgkfK0STha5bBR2BuefB5A3q+CS+kA4tlT42lX3SL2Hdc5ovtX3MIAxKBMpTc4W6pQKUNuoCT4QN9rJx1JYYC4i3cjlTqoxUcZxU7MPrFx9IAXHgA4NIw8W1Jtd9aCCHJBUFIWkYYFw0OTpfCs2PFlPc+WY0AcTs0taT/GUXTJE9oNUxrNclP+XL5YZzPJZOTog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DeUWV63Jfv6nG0mwuYNitlEUaB7nBreYCs3GTmvHA8=;
 b=IDC7XaZi8l8rAQdSLlGKom+Xc5NYN3vXrePua+VADs/oZaVM5iK05L/CchRPBMuxO6B77otbcMriFDPyYXijAODTHOdV1BEnGw0aMV4/dmY6U84RmJwKhx2E5ztKKZ5OizFqBaAngUaIxqSpQqZTrt85/VqAFwDf8IDtV++oAH3kpzbcIfN75toPX/8JhBftMLT7VyzP6GKnqOkBA/kzjZhVC1t558/DRNH/0f0OKFll6/9wgci8pprVZB9xWsFDKsoAgX5IIqGm5E/eCdGJYvaBZ5yJF+nI5xXELa7Nckp8x+nsMnUsVoOZZU1T5nM2VZvxm2YZhK2yf1PoCTVkpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM6NAM12FT016.eop-nam12.prod.protection.outlook.com
 (2a01:111:e400:fc64::46) by
 DM6NAM12HT022.eop-nam12.prod.protection.outlook.com (2a01:111:e400:fc64::331)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.9; Sat, 11 Jul
 2020 16:48:15 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:fc64::41) by DM6NAM12FT016.mail.protection.outlook.com
 (2a01:111:e400:fc64::217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.9 via Frontend
 Transport; Sat, 11 Jul 2020 16:48:15 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:0CD21838A97837DE682CC1B7AB2937FDB8D61F0BD9F862E37F613D98A7B5E4A4;UpperCasedChecksum:8F38B11592944A5C33E9AF4F471AE2C7E55D506273C7C47205AB251EAEBC5B2A;SizeAsReceived:9207;Count:49
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383%9]) with mapi id 15.20.3174.024; Sat, 11 Jul 2020
 16:48:15 +0000
Subject: Re: [PATCH 07/11] media: exynos4-is: Add support for multiple sensors
 on one port
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     kyungmin.park@samsung.com, s.nawrocki@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200426022650.10355-1-xc-racer2@live.ca>
 <BN6PR04MB0660CE60DA8585C5E1DA9EB9A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
 <20200707183655.GG2621465@chromium.org>
From:   Jonathan Bakker <xc-racer2@live.ca>
Message-ID: <BN6PR04MB066080F9D8FBD2B2D26CA33AA3620@BN6PR04MB0660.namprd04.prod.outlook.com>
Date:   Sat, 11 Jul 2020 09:48:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200707183655.GG2621465@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR1701CA0021.namprd17.prod.outlook.com
 (2603:10b6:301:14::31) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <ff3721f4-a7b6-e2ed-0d3b-0504e24c3726@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2001:569:fb68:9c00:8067:f823:1e15:7520] (2001:569:fb68:9c00:8067:f823:1e15:7520) by MWHPR1701CA0021.namprd17.prod.outlook.com (2603:10b6:301:14::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend Transport; Sat, 11 Jul 2020 16:48:13 +0000
X-Microsoft-Original-Message-ID: <ff3721f4-a7b6-e2ed-0d3b-0504e24c3726@live.ca>
X-TMN:  [W0LoOdUomI2nKCl/XlVIW1p24jVXIsYxSoh581/bKqwFZIw37uagyPgpz2S1gn/0]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 4bc66762-6c1c-4ac9-679f-08d825ba34bf
X-MS-TrafficTypeDiagnostic: DM6NAM12HT022:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I67ufvW/hiotOu1f6Vmfs53IbD6yul60nHst1yzsXCGN1XmfUNFBoWoq0BOhUNkNE02O5weyx45BQ/LufTNZv2NcBTrgOeXIAQE+naEq2T0Nl/a2yPthbVaOJHybeQ6Lp7jQj7Ths/mwIN1oZX7DMEL5cxvs9BWvfZGiwVSmL0TXTw0JBZ+dezRipilNCBWcBZqmP5iou6Wqp39MvDosTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0660.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: uy/O7EPfHt4Ogngs21Krd1wdHZJra6fbhUuSsSbz6yPwrdVVlMRJINxk/4XpK1lUmi+OLvHAbXq7Tvr2gkAAzJQ5pLHEmCDX6RJVugX+Dx6Vs6WiXtSSSLX5HcJPf+MRaLan7VE3K9G5IrLnHpg6hOZipWsnIrVLLupEi1KZ1TTMZdZBRPKMfGrWJhvj32DrGcha+paVPnUV2gqER6bHtw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bc66762-6c1c-4ac9-679f-08d825ba34bf
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2020 16:48:15.5057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM12FT016.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM12HT022
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On 2020-07-07 11:36 a.m., Tomasz Figa wrote:
> On Sat, Apr 25, 2020 at 07:26:46PM -0700, Jonathan Bakker wrote:
>> On some devices, there may be multiple camera sensors attached
>> to the same port.  Make sure we probe all of them, not just the
>> first one.
>>
>> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
>> ---
>>  drivers/media/platform/exynos4-is/media-dev.c | 32 ++++++++++++-------
>>  1 file changed, 21 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
>> index b38445219c72..a87ebd7913be 100644
>> --- a/drivers/media/platform/exynos4-is/media-dev.c
>> +++ b/drivers/media/platform/exynos4-is/media-dev.c
>> @@ -397,25 +397,28 @@ static void fimc_md_pipelines_free(struct fimc_md *fmd)
>>  /* Parse port node and register as a sub-device any sensor specified there. */
>>  static int fimc_md_parse_port_node(struct fimc_md *fmd,
>>  				   struct device_node *port,
>> -				   unsigned int index)
>> +				   unsigned int *index)
>>  {
>> -	struct fimc_source_info *pd = &fmd->sensor[index].pdata;
>> +	struct fimc_source_info *pd;
>>  	struct device_node *rem, *ep, *np;
>> -	struct v4l2_fwnode_endpoint endpoint = { .bus_type = 0 };
>> +	struct v4l2_fwnode_endpoint endpoint;
>>  	int ret;
>>  
>> -	/* Assume here a port node can have only one endpoint node. */
>>  	ep = of_get_next_child(port, NULL);
>>  	if (!ep)
>>  		return 0;
>>  
>> +parse_sensor:
>> +	pd = &fmd->sensor[*index].pdata;
>> +	endpoint.bus_type = 0;
>> +
>>  	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &endpoint);
>>  	if (ret) {
>>  		of_node_put(ep);
>>  		return ret;
>>  	}
>>  
>> -	if (WARN_ON(endpoint.base.port == 0) || index >= FIMC_MAX_SENSORS) {
>> +	if (WARN_ON(endpoint.base.port == 0) || *index >= FIMC_MAX_SENSORS) {
>>  		of_node_put(ep);
>>  		return -EINVAL;
>>  	}
>> @@ -462,16 +465,16 @@ static int fimc_md_parse_port_node(struct fimc_md *fmd,
>>  		pd->fimc_bus_type = pd->sensor_bus_type;
>>  	of_node_put(np);
>>  
>> -	if (WARN_ON(index >= ARRAY_SIZE(fmd->sensor))) {
>> +	if (WARN_ON(*index >= ARRAY_SIZE(fmd->sensor))) {
>>  		of_node_put(rem);
>>  		return -EINVAL;
>>  	}
>>  
>> -	fmd->sensor[index].asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
>> -	fmd->sensor[index].asd.match.fwnode = of_fwnode_handle(rem);
>> +	fmd->sensor[*index].asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
>> +	fmd->sensor[*index].asd.match.fwnode = of_fwnode_handle(rem);
>>  
>>  	ret = v4l2_async_notifier_add_subdev(&fmd->subdev_notifier,
>> -					     &fmd->sensor[index].asd);
>> +					     &fmd->sensor[*index].asd);
>>  	if (ret) {
>>  		of_node_put(rem);
>>  		return ret;
>> @@ -479,6 +482,13 @@ static int fimc_md_parse_port_node(struct fimc_md *fmd,
>>  
>>  	fmd->num_sensors++;
>>  
>> +	/* Check for additional sensors on same port */
>> +	ep = of_get_next_child(port, ep);
>> +	if (ep) {
>> +		(*index)++;
> 
> Do we need this index argument at all? I can see that we already have
> fmd->num_sensors and we increment it every time we discover a sensor.
> Perhaps we could just use it instead?
> 
>> +		goto parse_sensor;
> 
> As we know, goto in principle isn't the best coding pattern. There is a
> number of exceptions where it is welcome, e.g. error handling, but
> reimplementing a loop using goto is not very nice.
> 
> Instead, could you separate the code that probes one sensor into
> fimc_md_parse_one_endpoint() and in this one simply iterate over all child
> nodes of the port using for_each_child_of_node()?
> 

That definitely looks doable, thanks for the suggestion.  I'll work on implementing
and testing this.  It should then also be possible to remove the index hack as well.

> Best regards,
> Tomasz
> 

Thanks,
Jonathan
