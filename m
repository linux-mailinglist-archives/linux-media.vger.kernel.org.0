Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D81276C722
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 09:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233358AbjHBHjO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 03:39:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231901AbjHBHiW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 03:38:22 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2122.outbound.protection.outlook.com [40.107.22.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A29A4421C
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 00:37:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qnsb+Nd1nGJzJCUY1IRKEKuOijw5ZgFJGRiJbOQxjHHhqxw1hrhSIwl4C2DkMRcGAHHLuJD1s5zEK12zlEwhUw90c3h0sq/sBdXU4WdrEhb3v4Enkh06428YCoI/LPjuRRyUJztG2rcYNfNeoGWc/F55kylUhbu0z6P7vzNBoqVWEQ8Bu7Wj/lNG1s44gxQbIiGzi+c0hmfbPNQX4Z1EN6iw5DPMQNOK8LpABfMLUgK2PdO+cYkZSrb2FCZKJ+CR8AXwDGr0AZfRZO+1fxLo1mFS9GlTW0NC1f3SKVf1hh7wODEB9cDgX3f8EGlmdI4qUgdTIEDbIR/5PaQxz+AuRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5MlsQOo+7SHHst7NVXvEwdTtE3pXuD9Iu8D1ixQZKQ=;
 b=UsgpjeLJdQULEvy4ZXP5KUdAk/1Tp2pVNoo7e6KJLMtjEpjKKo513mvhjLsGfg4q7AOlqoDHff2t+ppRMBvpoRcj+mo+b8XtkbckgrBNjXzUXrjjJ/3pIXjaM8EWi3EMws7C9dKaNTxjpCknLRTf8bRfbMLyCoDkEvE0Y28oNOQhGGWk5BAqVwYAf9jDWHZ/Nc2uMGDS+HIwijswAgaUuoOBjNygA5ku6mkdTyjlwo11bUVBvUwSbwUyCRnGiHE2iuugZddg1vLLxHaJa0X2yyg3HqbDBmNTBFgE4ByFVsUFt8N7u/AW3mJjSMSXejHw7IlU5QO3Qi15lX5/kLkrIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5MlsQOo+7SHHst7NVXvEwdTtE3pXuD9Iu8D1ixQZKQ=;
 b=l4Im38NFd3YF4O7mHbPZoetR51uZKE0hL7JBbu/nh3GG7TXy0z+BHeMQac0JzRfrtP5rHD7ELwgOyMyijl97swDaD1+13YGuuH42g2rwWllfHMqD/IyvPFTjMA6kFpKLuMnn1oHSqLrptFTH0PlSEEwvZqtncXvnRNbScxu0qKE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by VI1PR10MB3536.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:134::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 07:37:23 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::95ae:6cb:e93:cce0]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::95ae:6cb:e93:cce0%6]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 07:37:23 +0000
Message-ID: <8529dd84-3670-052e-8222-0b5d2c860f4b@kontron.de>
Date:   Wed, 2 Aug 2023 09:37:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: NULL pointer dereference in imx-mipi-csis driver when starting
 stream
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        linux-media <linux-media@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org
References: <7658a15a-80c5-219f-2477-2a94ba6c6ba1@kontron.de>
 <d2fc1a0d-d058-757e-f935-1b91cfd19749@kontron.de>
 <Y+zKibHcez8or6nS@pendragon.ideasonboard.com>
 <d797611e-8e07-402f-ec75-7a1eadbc2122@kontron.de>
 <dfdd11f6-8692-1bec-2a7c-1d890039cfe7@kontron.de>
 <edddba07-c5c3-bab4-ca0c-49e1a5dc1135@kontron.de>
 <Y+0iMyLnHmqdDJOk@pendragon.ideasonboard.com>
Content-Language: en-US, de-DE
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <Y+0iMyLnHmqdDJOk@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:15::9) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|VI1PR10MB3536:EE_
X-MS-Office365-Filtering-Correlation-Id: 87eeaafd-82b3-4ae3-22ba-08db932b4f62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OTJQagw2JzzaNjWjrFFL8Jjv4AU9j5csgIRATgNH6aAvbH6PvMat7GZ77HXUj+AGNoDeEw/JDsk9HeFrRaK72AX1cfMY0cQNntlTjAOEdeOQvz6khtr2wA8NguZvXLDa8kWlKe6DG8o1hOrH6UOknpEKwbHxAZHlaF+VOKGEdxV0nEfEN7dbGqm6ZBrIU8ouJxJFTdIt669PfdBY4RYw7H9rwyiczDM/WEhYvSIamCIMrEPnwc0XWyGapP5lRYsjC0nc0/8zpUWoMpCS9XyvHttpiapsCRSpw9/bKPVu+rm4sCEMRKkzkTEzO1uZ8lXMvDeRGGJVrI4nECmmFFrI8tGElXyOjrmZYcHN5IVh/UiXoWwDrrZowgdQfG0Yxyr8pTOB7UQ/N7udbIU2L6+awTZLnC5sKJFMMiilYvS4jLEiu3Vgr1vilSulQJue2FF35yXG0m1cW/9vSnFe6MlKLlhF+CUAVjUsDtZ6wnLstvk+m6ZrdwzSdR8c9nCZisQHNmjbrGoog2LoZlBLOga4HelJ6hs307MUvmWaoTqIGhKut6OT0gbv5CUjlaOh3DsiTltzsmjb4Hinz7d12xIw8pm/EGTvuTtgNQbNYKZaZHWnlyL3AY+VKOfY2Z5TcwssgDDaASZONLMsAxWEO8OC8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199021)(66946007)(86362001)(31696002)(6916009)(66476007)(66556008)(6486002)(6512007)(2906002)(31686004)(4326008)(54906003)(44832011)(36756003)(478600001)(83380400001)(41300700001)(38100700002)(2616005)(5660300002)(8676002)(8936002)(26005)(53546011)(6506007)(316002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZW16TEFvWDRaejR1UVRIWXV5TkNHVmZYdDFGLzNteVBoR2VBeUtya1B3N3R0?=
 =?utf-8?B?a29HTkExVHI4cEVJbjNrWEJUVG1ncnUyNnZvVGFvdVZkbDVuenJkU2NLbGQ3?=
 =?utf-8?B?L3BPd1ZodjlKWjlsd0YxdVpQcVVzSDZjbzBpaVkvN1NmMlNMenZ5azVCa3ll?=
 =?utf-8?B?YjJCTXRSYWRudDRodWNMWU02VG01TUxqRUptSVVFNHB1b3BxaGZwb3ExT1lJ?=
 =?utf-8?B?bEFxdWwzYnF5SEFxM2p5MFFSMXpGTGhwOGNqS25uZk5lNzhwK0RpSDlIREJ5?=
 =?utf-8?B?dVZLaWZwK0hMYWhqdzdjYStLTjBPMlg4Y3VIUTJ6S2ZvSWpCc0kyWVVhTzdt?=
 =?utf-8?B?YmltMmtPaGVOL2VVclFiVitDOE1LaXNlSUMzQldTcjU5WjJzNkRTblpucURl?=
 =?utf-8?B?bmNsem42Ym8xSVRGMHZwZlpyY3drM21HVlZVSnhTdUozdkFyaXpDamhZWEJw?=
 =?utf-8?B?Mk9Nd1lqTll5MDdoRFpsbVU4WHByODRkeXk5NEQvQ09KNFRNaXJIU01DSi9M?=
 =?utf-8?B?WUZOOG0wRHFSdE5PNmsvRmI1anRTMVNwUFptSExYeGpkcG9iTlRqUHNFajBj?=
 =?utf-8?B?dTBidlVrR3RySjh1YTNiODJjZnRIQmRnbXc4d2d3bndKRVp0MklhbXpMbW41?=
 =?utf-8?B?bTZneUZEcjdNRVR1SEFScFpvaGM2SGoyYUpiYVc4MVlTdzdHeFBNMFlDTjFD?=
 =?utf-8?B?d1lUS0dFcGxwcTBSaTM3UFI2YlJFZXBzcG5XUzBrd1YwcnlUZmJxVkFWQVNQ?=
 =?utf-8?B?aFdGeFYxVGZXRHdvVjZ4Y3lwV0dSYzhNakFoZ25laXc4SHl6L3NqUXNmZVpR?=
 =?utf-8?B?b0dKTkR2WDRzRWwxSE1nVnJjVkExS0NzNko1djVmaGJ6NzlNWG1tTVlnRzBO?=
 =?utf-8?B?SHRCMlpSVC9wTGxaVC9qSVl2VDdjSExURC95aXZHQXNQa2xYM1J1K2oybFpp?=
 =?utf-8?B?Y3FoNFNESlE1cXF1d2MwRFZRdmlNWWNUbnZNMVlnMlFBSm5aZjNOYkhQMGxT?=
 =?utf-8?B?WG81UlpXejluU0lmSlVub25qZFd2cFgxazVjSUhoV0xqYUFHODJDaWJ3bFJt?=
 =?utf-8?B?UHdKdTVnS1EzMUt2ZGoyN0g5SGtPZ1Fvdk9oakJRVXcweFZXNDNvR05ZcFRG?=
 =?utf-8?B?Q2pNNUNLL00xRFJTTkxBbzYvdHZzTWJsaGphNHNHNFdoMHFHNS9VamZ0UHo0?=
 =?utf-8?B?UUhCVzBKaitpR2xCMFNtTktvZWZTQmtOQXNWTFRVV0xtZWF0d1g2VWx3UjZ1?=
 =?utf-8?B?SUhuZnhnSEc1YUNYTVd5RDZ0ck9LRWtNUVh2WUNpWWY5Y2psUUNzMUJMVktV?=
 =?utf-8?B?ZDZ1NDB1Ykh0RGczcnVueW5iVTdFNWVWU2ptS1hXUUQwMXh5QitZRjNQYlhr?=
 =?utf-8?B?REthcHZSYVFXdElNWUt4cUhHMWFFSFZ6V3BOTjlhNzg5UnBRdnhmT3dVcC9I?=
 =?utf-8?B?cmNKUVk2dkhySHprYmdZazlhcllpcHZ3SFBERTFoU3hJZnpBbzY0aXVRRE5N?=
 =?utf-8?B?NEdsdjdBckQxUzJiZE1saXQvQ0U5VHpWUk9KUCtqWWRLNklObFFRUzJBYVRL?=
 =?utf-8?B?NDI3LzQ1SzMxWCtRcERPZm5PTEZPSUhtMmFiLzdIUFh3aXd4REZQWWdLa0lT?=
 =?utf-8?B?WC82cW1EcTdHbk1jUGVPaHYyZExIWTYyOUVIS0NwZ01aNExNSklITUcrL1B4?=
 =?utf-8?B?bnpQcUpuSmw4dCtyWEpGZ3QwQmhmZlEydEY5TEZvL1RKOTd6b2E0T09SbUhX?=
 =?utf-8?B?YWlMS1VxWXNCbnhGNHdKdXZyakMwWE1tOCtncFNrRHlENjEwdk04RVZjNUpF?=
 =?utf-8?B?VUp4aHkzS1A4OHlLTDF1V0ZMbzY2ZnVhUkJsUkVIbG8reGZENWs5cUxtdWxN?=
 =?utf-8?B?M01iYnUzNmpqNFZEU2tJMFI4RnZjRjFIdGtOZ2tNNEVzdkNucTZBNUhFU003?=
 =?utf-8?B?RW1BdVNKTHNldFhCcC92RTBzUlJVWDhMUnZrN1VFbEdaQzVic2dsbGJOUFpU?=
 =?utf-8?B?Rk1BU1RPUE4zRjNUbUpVOEVFdk9qOFZPSTFuaitsc2RmbFpLUDk2YnB6RCtU?=
 =?utf-8?B?bHRHY1drOW1LZnQyQjRTL2RxRTVNOUk1VVJEUDh4czZiWGNuOThzVTJLRVpE?=
 =?utf-8?B?Q1BTVUpVOWdTbUdWNDQwdHJ6amJZUCt0SzBKMDcrODlpd1BLVUUwTUI2TXcw?=
 =?utf-8?B?N0E9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 87eeaafd-82b3-4ae3-22ba-08db932b4f62
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 07:37:22.9539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B9CySA6pSzQ9qKOu3UJ+ehui19bag0YvpaBnLwvKKr/1cHEL5mBzXimmif25HfXoMsTHGL01pIjfh1iZCnKUEbiMXLLD7iLGCOT2D9/ealw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3536
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 15.02.23 19:19, Laurent Pinchart wrote:
> On Wed, Feb 15, 2023 at 04:30:49PM +0100, Frieder Schrempf wrote:
>> On 15.02.23 15:40, Frieder Schrempf wrote:
>>> On 15.02.23 15:20, Frieder Schrempf wrote:
>>>> Hi Laurent,
>>>>
>>>> On 15.02.23 13:05, Laurent Pinchart wrote:
>>>>> On Wed, Feb 15, 2023 at 12:53:56PM +0100, Frieder Schrempf wrote:
>>>>>> On 14.02.23 17:47, Frieder Schrempf wrote:
>>>>>>> Hi everyone,
>>>>>>>
>>>>>>> after solving the previous devicetree and driver issues with the media
>>>>>>> pipeline on i.MX8MM using a RPi v2.1 camera module (imx219) as sensor, I
>>>>>>> now try to get an image from the sensor and run into the next problem.
>>>>>>>
>>>>>>> Below you can find the commands I use and the output I'm getting. Maybe
>>>>>>> someone can see straight away what's wrong or at least can make a guess
>>>>>>> before I start diving into the code. ;)
>>>>>>>
>>>>>>> By the way: This happens on v6.1.11 and 6.2-rc8.
>>>>>>
>>>>>> So it looks like there are several problems (again):
>>>>>>
>>>>>> First I missed to enable the link between the imx219 and the imx-mipi-csis:
>>>>>>
>>>>>> media-ctl -l "'imx219 1-0010':0 -> 'csis-32e30000.mipi-csi':0[1]"
>>>>>>
>>>>>> And the imx-mipi-csis driver is missing a check for the missing source
>>>>>> link which caused the exception. I currently have this applied and will
>>>>>> send this as formal patch later:
>>>>>>
>>>>>> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
>>>>>> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
>>>>>> @@ -596,6 +596,11 @@ static int mipi_csis_calculate_params(struct
>>>>>> mipi_csis_device *csis,
>>>>>>         s64 link_freq;
>>>>>>         u32 lane_rate;
>>>>>>
>>>>>> +       if (!csis->src_sd) {
>>>>>> +               dev_err(csis->dev, "Missing source link\n");
>>>>>> +               return -EINVAL;
>>>>>> +       }
>>>>>> +
>>>>>>         /* Calculate the line rate from the pixel rate. */
>>>>>>         link_freq = v4l2_get_link_freq(csis->src_sd->ctrl_handler,
>>>>>>                                        csis_fmt->width,
>>>>>
>>>>> The pipeline is not correctly configured, and that should have been
>>>>> caught earlier as both pads are created with the
>>>>> MEDIA_PAD_FL_MUST_CONNECT flag. The __media_pipeline_start() function
>>>>> should have return an error. Could you try to check why that didn't
>>>>> happen ?
>>>>
>>>> Thanks for the pointer. I looked at __media_pipeline_start() and to me
>>>> it looks like there's something wrong. During validation of the links,
>>>> there is no code to handle the case where all links are skipped before
>>>> link_validate() is called on them. The loop is left with has_link = true
>>>> and has_enabled_link = true and validation of the pipeline succeeds even
>>>> though there is a missing link.
>>>>
>>>> Does this look like a valid fix to you:
>>>>
>>>> --- a/drivers/media/mc/mc-entity.c
>>>> +++ b/drivers/media/mc/mc-entity.c
>>>> @@ -744,6 +744,7 @@ __must_check int __media_pipeline_start(struct
>>>> media_pad *pad,
>>>>                 struct media_pad *pad = ppad->pad;
>>>>                 struct media_entity *entity = pad->entity;
>>>>                 bool has_enabled_link = false;
>>>> +               bool has_valid_link = false;
>>>>                 bool has_link = false;
>>>>                 struct media_link *link;
>>>>
>>>> @@ -806,6 +807,15 @@ __must_check int __media_pipeline_start(struct
>>>> media_pad *pad,
>>>>                                 link->source->index,
>>>>                                 link->sink->entity->name,
>>>>                                 link->sink->index);
>>>> +
>>>> +                       has_valid_link = true;
>>>> +                       break;
>>>> +               }
>>>> +
>>>> +               if (!has_valid_link) {
>>>> +                       dev_dbg(mdev->dev, "No valid link found");
>>>> +                       ret = -ENOLINK;
>>>> +                       goto error;
>>>>                 }
>>>>
>>>>
>>>
>>> On second thought, I see that this is probably not a correct fix. But I
>>> still think the current code has a flaw. Or maybe I'm missing something
>>> important again. ;)
>>
>> Looks like the pipeline validation is only run for the pads of the links
>> that are enabled. As the following output shows, the pad
>> 'csis-32e30000.mipi-csi':0 is not part of the pipeline and the link
>> 'csis-32e30000.mipi-csi':0 -> 'imx219 1-0010':0 is therefore not part of
>> the validation in __media_pipeline_start().
>>
>> [   36.069274] imx7-csi 32e20000.csi: media pipeline populated, found pads:
>> [   36.080901] imx7-csi 32e20000.csi: - 'csi capture':0
>> [   36.085926] imx7-csi 32e20000.csi: - 'csi':1
>> [   36.090222] imx7-csi 32e20000.csi: - 'csi':0
>> [   36.094524] imx7-csi 32e20000.csi: - 'csis-32e30000.mipi-csi':1
>>
>> So the first time the disabled link is detected is in the driver in
>> mipi_csis_calculate_params() which leads to the crash.
> 
> Of course ! That's what I was missing. Indeed, we have an issue there.
> I'll try to cook up a patch.

Sorry for digging out this old thread. I just wanted to ask if you
managed to come up with a fix for the issue above?

Maybe it's already there and I just missed it?

If I remember correctly it's only about handling a misconfigured
pipeline so it won't be triggered if things are done properly.

But as I've managed to trigger it, someone in the future might too and
it would be nice to make the framework more robust against this.

Thanks
Frieder
