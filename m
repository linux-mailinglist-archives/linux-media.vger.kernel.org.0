Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0722421C54C
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2020 18:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728532AbgGKQfw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Jul 2020 12:35:52 -0400
Received: from mail-dm6nam12olkn2061.outbound.protection.outlook.com ([40.92.22.61]:59744
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728412AbgGKQfv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Jul 2020 12:35:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ctnmkzuqWa2ifaVPDrHArRa8SWSOV7DBLaIJaFKCVG0qENpcw1l6emYYe1XGAnk//1SpXVcl+8BHzozXgVn6vFNnqXsWWcqZr0oRXTymJLrd5aQzCM4NfNDvTzAzy3fk10XLjnAuMzSxAe1pHVKGwfc5JiKHEB+Jnim/fLqSMp16S6yVUnTWij7N23CfElCa/L/spY6fXjUa4sS02dOTNk2Ebn08MQxEqeo5ffcSXP9DxMVDdZDkDq7ulcWcjuY7EP502V4EtpyVyMVyApEsqHy0wONHRhqdBS2cgWY63KkiyCIPmDBQmP80H/g1oUjRyVTjNHpw9PBxPAGO4SpSvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlE0wE0BjPDZXKakuHpbLrKoYSBgfFFm473HxGWgx3k=;
 b=DqrykRH9kawKlZH/Dbn7d01cP3xTwSHKDBKZ7LmKxjLaUGZaRdQLMRTVFJNkhJn4HoH6+TLmJT0tg60T4BhoueUwok90Rl2fdQhWd8Ku5K2T4ZymosqbYxtnPxtioxy23FO1baOkC64XWj5sygojnlLWOrlz1hLlpjuRQsYl/gqrYz5fsct4mkjA8uDwcUGnwbSa+e/45+g1Uk5YD7QtnsTfTqfmGX3JM4m4r988Rj4pE7B5XBs/i9FKtUyOogTzotzwimVDz2nuLfpCwZf5CIQ0WwyLPDSf7Z8azFcItm2hfVIqjDAyFozVM9fzKdLR2wvcAXrJM+jz0KWphvsCZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM6NAM12FT050.eop-nam12.prod.protection.outlook.com
 (2a01:111:e400:fc64::4f) by
 DM6NAM12HT250.eop-nam12.prod.protection.outlook.com (2a01:111:e400:fc64::119)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.9; Sat, 11 Jul
 2020 16:35:49 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:fc64::43) by DM6NAM12FT050.mail.protection.outlook.com
 (2a01:111:e400:fc64::215) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.9 via Frontend
 Transport; Sat, 11 Jul 2020 16:35:49 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:A882560E394E2329D217C52270E425F10E9F1F18CC620652F271CC63B53C2441;UpperCasedChecksum:686A9947B53828CAECA671679C8B7D00CACEED1BFB8ECE50DCB82CF2476DF592;SizeAsReceived:9366;Count:49
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383%9]) with mapi id 15.20.3174.024; Sat, 11 Jul 2020
 16:35:49 +0000
Subject: Re: [PATCH 04/11] media: exynos4-is: Correct missing entity function
 initialization
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     kyungmin.park@samsung.com, mchehab@kernel.org, kgene@kernel.org,
        krzk@kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200426022650.10355-1-xc-racer2@live.ca>
 <BN6PR04MB0660E680A4F69E3037D87E70A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
 <CGME20200707180927eucas1p14bedf7f773c5e86c3e3234928ee347a4@eucas1p1.samsung.com>
 <20200707180917.GD2621465@chromium.org>
 <afe50670-2452-2fe6-d0cc-0e1f83497873@samsung.com>
From:   Jonathan Bakker <xc-racer2@live.ca>
Message-ID: <BN6PR04MB0660E85ABB4AFE75FF2CD58BA3620@BN6PR04MB0660.namprd04.prod.outlook.com>
Date:   Sat, 11 Jul 2020 09:35:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <afe50670-2452-2fe6-d0cc-0e1f83497873@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CO2PR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:102:1::20) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <5ce0a6cc-9840-afae-83a4-bfec08bd9482@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2001:569:fb68:9c00:8067:f823:1e15:7520] (2001:569:fb68:9c00:8067:f823:1e15:7520) by CO2PR04CA0010.namprd04.prod.outlook.com (2603:10b6:102:1::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22 via Frontend Transport; Sat, 11 Jul 2020 16:35:47 +0000
X-Microsoft-Original-Message-ID: <5ce0a6cc-9840-afae-83a4-bfec08bd9482@live.ca>
X-TMN:  [y1FMo+BkqPNhMRyzGFWM+Gu0iaaOAAhie7e9cPdCcHLFACteY9N7SmSGZVJFWDRw]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 2b182859-05c1-48f6-6986-08d825b877cf
X-MS-TrafficTypeDiagnostic: DM6NAM12HT250:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dusHB05cEeN27aaeUtACqHHEma0/Y0pzQRAEWUctfNxR19e/abShWj6IECaVKht37hGDrV36KhzPkG57nXA3DiLy5aWLoTdDgtda1QbIId42iyoMxfJbmTAy5vfkEIalmbhQb//ceeM9Gs3WYY0KV5Nr1iS4QbdAwz0xJnClxtqQhcrOGA+jQyugzYv0DX24pkA2J2RB/plGbtWKUAbzXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0660.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: i+BMy8OQS+kCwUvx4r3zMDB9gvecn8vZgV0d8gwStqHQ8vurlOZd4RPFO1A6NTOtodj1OX8sze3Dpv0l+bPnB5+qi5+rIPrHiaX/CWk4SrkqD/TbrWlKSXqpdWdMb/hx4Re7y0o1g5fmPoelCcfLmopyIN/jlwdgOMh5uH0gN0ZyCaUNYqINuDAHbwkgb7GhasJErcC0/yYsJ+o/TcMeSA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b182859-05c1-48f6-6986-08d825b877cf
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2020 16:35:49.0435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM12FT050.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM12HT250
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sylwester and Tomasz,

On 2020-07-08 8:34 a.m., Sylwester Nawrocki wrote:
> Hi,
> 
> On 07.07.2020 20:09, Tomasz Figa wrote:
>> On Sat, Apr 25, 2020 at 07:26:43PM -0700, Jonathan Bakker wrote:
>>> Commit bae4500399c4 ("[media] exynos4-is: Add missing entity function
>>> initialization") tried to suppress the warnings such as
>>>
>>> s5p-fimc-md camera: Entity type for entity FIMC.0 was not initialized!
>>>
>>> However, this didn't work in all cases.  Correct this by calling the set
>>> function earlier.
>>>
>>> Fixes: bae4500399c4 ("exynos4-is: Add missing entity function initialization")
>>> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
>>> ---
>>>  drivers/media/platform/exynos4-is/fimc-capture.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
>> Thank you for the patch. Please see my comments inline.
> 
>>> diff --git a/drivers/media/platform/exynos4-is/fimc-capture.c b/drivers/media/platform/exynos4-is/fimc-capture.c
>>> index 705f182330ca..86c233e2f2c9 100644
>>> --- a/drivers/media/platform/exynos4-is/fimc-capture.c
>>> +++ b/drivers/media/platform/exynos4-is/fimc-capture.c
>>> @@ -1799,7 +1799,6 @@ static int fimc_register_capture_device(struct fimc_dev *fimc,
>>>  	vid_cap->wb_fmt.code = fmt->mbus_code;
>>>  
>>>  	vid_cap->vd_pad.flags = MEDIA_PAD_FL_SINK;
>>> -	vfd->entity.function = MEDIA_ENT_F_PROC_VIDEO_SCALER;
> 
> I think we should leave above line as is, or perhaps change the function
> to MEDIA_ENT_F_PROC_VIDEO_COMPOSER and...
> 
>> Isn't vfd->entity above a different entity than sd->entity below? If so,
>> this line must stay.
>>
>>>  	ret = media_entity_pads_init(&vfd->entity, 1, &vid_cap->vd_pad);
>>>  	if (ret)
>>>  		goto err_free_ctx;
>>> @@ -1898,6 +1897,7 @@ int fimc_initialize_capture_subdev(struct fimc_dev *fimc)
>>>  		return ret;
>>>  
>>>  	sd->entity.ops = &fimc_sd_media_ops;
>>> +	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_SCALER;
> 
> ...also add an assignment like this.
> 
> vfd->entity and sd->entity are different entities, vfd->entity corresponds to
> the capture video node and sd->entity is the capture subdevice media entity. 
> 

Whoops, I totally misinterpreted the fact that they are  different entities.  For v2
I'll remove the removal from vfd and just add MEDIA_ENT_F_PROC_VIDEO_SCALER to the sd
entity.

>> My understanding is that this is the capture subdev and not the scaler.
>> Looking at the other drivers, MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER
>> could be the right function to use here.
> 
> Scaling can also be configured on that subdev, actually both functions would
> be valid.
> 

Thanks,
Jonathan
