Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F33B521C5B3
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2020 20:21:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728769AbgGKSVg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Jul 2020 14:21:36 -0400
Received: from mail-dm6nam11olkn2108.outbound.protection.outlook.com ([40.92.19.108]:19393
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728510AbgGKSVg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Jul 2020 14:21:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4LHSAfm3avZ8Nj2WQij35GiUzmEgl1UJApLY7iXJ/cHDBLJlk9k48Sp2052/8URrWKUCB7W59JhF9GvYS7cbXLM4YU+qC2MN2waCej2DNzKyzEyf3DMBpnH7cLgKSDkfHAuUYBZe5TxXDjbimno3mpunYy4oKsy4mSC63sfnCwXQHDb7wIWxUhulgApZZ+V5Mp2tECAuUCZghVEbnInCaHxPEtohaCI/QFEal+SjjMULw5PaQcIcjjwWLGLERa+BRoBWnwERWsoBytdLpI8eq2/7UBdzJLBgUl/WnLI4dXNNra2gkF22VAkCk9V6CcQq7kkP0n+tr6dG1fnvWaRVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGriJv95yATnbS4sVrxygR5NyrbkkIytciwkZsldnyQ=;
 b=WI7aJDK0T0N/zQAkBuEm1G4b7ItTuKSDFIKuh+EYOr5BKEwFGjQhx2xZbQjrxx3HJfqaMmtdibnAFUHMc9ffZL2iA2p/kvts4OMgo6eIX0EyUr7l+mqYweaINXn1MItqIHLJeppD6YxMqJhMT5zJVJqecK+KkYmDcyMLg3JXh0G1zpGnUslblG9176NLuL5hs4/sfOGdbHVOZ8uK6Q8AKSVC3/Zbm2o/NVZd3qR89XyrenMdLkWHkaqjhYsLQWJhEAfuy+z/LVT071Kr/x50mjzpbb7Aobxrn4Tk5ubWQ2LSKgMenq9uttULDw3Beif9Xf0dGYwjFp/mVInLDYuW+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:fc4d::48) by
 DM6NAM11HT091.eop-nam11.prod.protection.outlook.com (2a01:111:e400:fc4d::82)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Sat, 11 Jul
 2020 18:21:33 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:fc4d::43) by DM6NAM11FT041.mail.protection.outlook.com
 (2a01:111:e400:fc4d::98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Sat, 11 Jul 2020 18:21:33 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:5DD35D0466BA08A2D83EE7D50044417D79F1AC63B6B263F490182A05D10C926D;UpperCasedChecksum:AADE9ECD23B29ED177A5FF77E0E4428CB4AB2DBC8A49E0EA70C8F3A234350509;SizeAsReceived:9198;Count:49
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383%9]) with mapi id 15.20.3174.024; Sat, 11 Jul 2020
 18:21:33 +0000
Subject: Re: [PATCH 05/11] media: exynos4-is: Improve support for sensors with
 multiple pads
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     kyungmin.park@samsung.com, s.nawrocki@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200426022650.10355-1-xc-racer2@live.ca>
 <BN6PR04MB06604D29C9F66EB53FB17581A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
 <20200707181310.GE2621465@chromium.org>
From:   Jonathan Bakker <xc-racer2@live.ca>
Message-ID: <BN6PR04MB0660ECFE03B17B96FB3BAC34A3620@BN6PR04MB0660.namprd04.prod.outlook.com>
Date:   Sat, 11 Jul 2020 11:21:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200707181310.GE2621465@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR2101CA0008.namprd21.prod.outlook.com
 (2603:10b6:302:1::21) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <bbaa5e62-2ae6-9e57-b9e9-693c0e0da5a7@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2001:569:fb68:9c00:8067:f823:1e15:7520] (2001:569:fb68:9c00:8067:f823:1e15:7520) by MW2PR2101CA0008.namprd21.prod.outlook.com (2603:10b6:302:1::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.4 via Frontend Transport; Sat, 11 Jul 2020 18:21:31 +0000
X-Microsoft-Original-Message-ID: <bbaa5e62-2ae6-9e57-b9e9-693c0e0da5a7@live.ca>
X-TMN:  [q/mKHsnjZdljbYxyaYAKYkVav2cdtsDW8y4dWM0Ra+18p+DChneRoElNyr+2jD18]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: df9210bd-e2b8-49bc-3140-08d825c73d85
X-MS-TrafficTypeDiagnostic: DM6NAM11HT091:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SEN/cA2rVw4/uaSqCGyfAGsv3GWIj0FD69h4PzP+NuozgK5dDuAXCjjz+AwCWAbB/6bwW+0PfBcZ3K4An0THNT0eRgm/T2uzmAaePxt9O+aBqUZSMWoI+2JAoTuPMO/meFyI1wDJ1jfR3CsKvY5BGPnJIkvH46KXeJFJEMobBLgN8vzPKcDUlmC9C1JxIfnLAmGDdb9wXZWtYQkdq2h5aw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0660.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: Zgeg5C4ndLZhm90nEU5CatEExnlI7KEpHOr2AvWkKgdNoxhE+ws+dn5j1bEo4lv92dkQ3BzdXNXEGwTTi4aqv7B9kvEgZxpY+OYSDNNhryJZnYMw9u77YEKmH43iULwbTE8N4E4aJWWDkd+yLXc+FGUFxsu3JlYjwI248G0HaMqlIKyO0L+T/hWC86yjo8XQ+2dJgqI5T19MEzz74QWutg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df9210bd-e2b8-49bc-3140-08d825c73d85
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2020 18:21:33.7492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM11HT091
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On 2020-07-07 11:13 a.m., Tomasz Figa wrote:
> Hi Jonathan,
> 
> On Sat, Apr 25, 2020 at 07:26:44PM -0700, Jonathan Bakker wrote:
>> Commit 1c9f5bd7cb8a ("[media] s5p-fimc: Add support for sensors with
>> multiple pads") caught the case where a sensor with multiple pads was
>> connected via CSIS, but missed the case where the sensor was directly
>> connected to the FIMC.
>>
>> This still assumes that the last pad of a sensor is the source.
>>
>> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
>> ---
>>  drivers/media/platform/exynos4-is/media-dev.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
> 
> Thank you for the patch. Please see my comments inline.
> 
>> diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
>> index 5c32abc7251b..b38445219c72 100644
>> --- a/drivers/media/platform/exynos4-is/media-dev.c
>> +++ b/drivers/media/platform/exynos4-is/media-dev.c
>> @@ -991,7 +991,8 @@ static int fimc_md_create_links(struct fimc_md *fmd)
>>  
>>  		case FIMC_BUS_TYPE_ITU_601...FIMC_BUS_TYPE_ITU_656:
>>  			source = &sensor->entity;
>> -			pad = 0;
>> +			/* Assume the last pad is the source */
>> +			pad = sensor->entity.num_pads - 1;
> 
> Is 0 really any worse than num_pads - 1? This sounds like quite an ugly
> hack.
> 
> Could you iterate over the pads of the sensor entity and explicitly find
> a source pad instead?

Yes, iterating would work better.  This comes from when I was trying to integrate
video-mux, before I realized I could connect multiple sensors.  I will drop this patch
from v2 as it's not necessary.

> 
> Best regards,
> Tomasz
> 

Thanks,
Jonathan
