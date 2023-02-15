Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A9FE697F84
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 16:30:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjBOPa5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 10:30:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjBOPa4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 10:30:56 -0500
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2136.outbound.protection.outlook.com [40.107.22.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B48F3211C0
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 07:30:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jx5Y4cymMdDDMcdZc+NO01Hdkk30i76BGCvby9mUOc1Y140iDTu5xy2dv2iFHV0pZx4gMqbVXHnBODvftvcmoH5lFE5RQlxzBKD3nvxbgGJ/bjDf9bdKC+Iv/PWkrdDAExvaNFrxe9UI5XAM4s8/D+N/r+UkkU6ggisUEtLTSiicFtcD0GAOYxPxEhLlzp58OLSkVFf1WJPv43+UOK3K5YJjFUgUgaA6ydTharekOa+3XtndAENTKA6wYoVO1WCMKDNHYpEFz/yNuUA/xvNzew0BUPDFzZqNMCGfWqhaip7LAbM7laXnnppm2/6OwMaOdT6eiW1r0Smp31p4FVdsKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6Nd0PW7EuZBKOraatvoKz2dyXBzf9KlHh37cXyQ/mU=;
 b=G+kVV92g7nwcZPuG8kuuuSB8cGvS3LZj/VntsxDGSxKx1Wa3acaxge6Pnmt5ytBwnKJxlPmeeexivigikwxHDbo5ygooPdJ/3zgwlosTqWOddbWaBUMIL6UPiB72WQDSpnw1R0NqjGvzXld5gbdc6nl55BiaCd6KqlUh9uBgvYOqjJ/8nZLRP0/Cf2+/g/PkSFya/0AqGk0eUtXyx06OsAftAdtVSAAxkLDqCu42RnCU2Wcj5Wq4G2yp6Z3fkibi0NrZ+ZRc1xOQYuSsQ8CjXVDLAh/9kCmM5OMwJ29j4aNT4rB56ehZACOYLb5MV5WIc8U5blTN6ZEJ5IBF1Owp8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6Nd0PW7EuZBKOraatvoKz2dyXBzf9KlHh37cXyQ/mU=;
 b=iWAEF5FuyTTpAG3fI86lRPUtpaxvWeqSzq6KA4G8Rfwlqqd6Xn1uh/4z1zlLDGmXOYQZ5d+WgZQLeslFIKZvvC7jP/DMrScJ0w1AIwV/S0XK2zsG+lWWy4SvqsYmqtNS25KfxF0+xE0Br9mbBTMIMIb1M9bYNEUpj96eGSoOiNU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AS4PR10MB5671.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4f2::14)
 by DB9PR10MB7386.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:462::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 15:30:51 +0000
Received: from AS4PR10MB5671.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3931:3416:1ae8:e00f]) by AS4PR10MB5671.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3931:3416:1ae8:e00f%5]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 15:30:51 +0000
Message-ID: <edddba07-c5c3-bab4-ca0c-49e1a5dc1135@kontron.de>
Date:   Wed, 15 Feb 2023 16:30:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: NULL pointer dereference in imx-mipi-csis driver when starting
 stream
Content-Language: en-US
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        linux-media <linux-media@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org
References: <7658a15a-80c5-219f-2477-2a94ba6c6ba1@kontron.de>
 <d2fc1a0d-d058-757e-f935-1b91cfd19749@kontron.de>
 <Y+zKibHcez8or6nS@pendragon.ideasonboard.com>
 <d797611e-8e07-402f-ec75-7a1eadbc2122@kontron.de>
 <dfdd11f6-8692-1bec-2a7c-1d890039cfe7@kontron.de>
In-Reply-To: <dfdd11f6-8692-1bec-2a7c-1d890039cfe7@kontron.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0117.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::22) To AS4PR10MB5671.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:4f2::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB5671:EE_|DB9PR10MB7386:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a74b816-bfd1-488a-9e57-08db0f699ec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xaZLaZnpzsa9xNWgtS6RpgAjUsQp5H2mJ0jdZuLHGtejXuKbyESRzXznGSkVnymQOeI3B/CQfrv6eP1psoDPpVippmAU1rd1mQvIPh3TYDSa0BjdogUrGpj1XKnmQywvms1yvJ2kNldXjVbvTj4t0BLx/OigyuZhoqzN2Gx88Ci7xzrHQQlKKvvSUethySU3ym08Rxq+upLmmLZrzywK2JcY4cqOwE/ONOEzrr+eql3CuBUhUtBIeWJok59qfPvPFvjdO1f72OCG+MafMhcp2AohKrs2Y/ulP8+lsMydPvg9P4exYAbej9MUTt/+HT4u5YI7oHwd2Kumv0fgFtsiEh1+YbtGlr4DM26mFM4U/zbOiIPJZd3JjlF8XodXx/eMA7XQix3qL/Zdwd7kl6VknHcubYqQ07A3wrRZflvV8Cg1L/qHZ2KVbLEij/9E3+CkolOB2iJStVz6/31dBYznKlUfN5RcZxgqN2lqAdVmBLnbGQhsO0XKkTmX4CCDfgKlnKhwUPrMJG0OsGU5t3OQHv7AlAJEOlX7/c6Hmov5kF0JDTMW96MbNIKIgNUu7BTXKSvNPzgAtAn/xvfBoxjIZRp/UF/GJLTswuRPOJOiRuGr1RvVRpcHb/Or9hot8pbgYbMe9ch/8KN34ZYJ5KcQZOj3268yzoOqmwr8iD6Fa+9OXFODf4Hquu0vRNUAgvKHfz3JmovwaH3wlkAmuRc2TQYZ/PueZZNGOVYexUGjZAs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB5671.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(346002)(366004)(136003)(39860400002)(451199018)(36756003)(316002)(66946007)(6512007)(478600001)(53546011)(54906003)(6486002)(5660300002)(2906002)(44832011)(66556008)(6916009)(41300700001)(66476007)(8676002)(4326008)(8936002)(186003)(86362001)(38100700002)(6506007)(31696002)(83380400001)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzQwdGJEYnlYNmlmRWU3VTVuTjBSUmFLQUtZbFQwVy9HcFM3QU9kb2U2blpt?=
 =?utf-8?B?bFdLaEwwN1VMMkpHY1k5UFduQk1MeTQ4TjBnT1RWMGpzQzl0OVVCcC9OVGtq?=
 =?utf-8?B?dHZPWVo0RmJwb3RISUtObkdJUWd1WER0R1pxcDhRcFZqSjVMZ09zUE9lQlpt?=
 =?utf-8?B?L1lydTJVS1RDSTNqU0hBYzkvTDJhMng2SHVxWVkzQkdyQ01KOTVuZlQ2R3Qy?=
 =?utf-8?B?ZWR3ajVxODZoK3NjYUd0Ukd0SEVzOXFUaXovTzcxeExFY1oxb2k5QzBoZVZD?=
 =?utf-8?B?K3oxMXZiWUk3SjRlSTBZSTZpOUltc0swMGpnS2JPWWxqdW5oaHcyRGpwN1hw?=
 =?utf-8?B?WGx3THBsL05KaUEwTkxQVVI5dDdaNFhoV2lRekJwc0JNV0lSWWkwaDZ0Z1lZ?=
 =?utf-8?B?Uk81eDRINVpZcWxaM1VObzVLT2ttREwrQWRZUEh0OWZ0WDlhbGxJTjgzYURE?=
 =?utf-8?B?by9RSStXdnNVc21CaXJJaFFhQTlMZSs1Vm95czVmWTBxYTd5V2hrbVJLRE5u?=
 =?utf-8?B?MWZVSTNhQmdqL2FVRitQZUpJSEE3bk9mblNTdjhBb0VOT3FNck9KZWZITjRM?=
 =?utf-8?B?UFFscjY5K0dZMDRVQnBCOUgxY2dlb3dXbFlKSzZUalBzRG9aSEV1VjlmU1c0?=
 =?utf-8?B?SXhPSUt4RndUeHZ4ZFJwU0p1TGpuSDFPQ3RGeXYwWWxuV3ZJR3JGOGdoM3Jv?=
 =?utf-8?B?aWJyYWVUUlVyTTFOZHZOQ0UzWVZsSEVEdExoYWJwVkZhb2NSczZaUm14dE12?=
 =?utf-8?B?U1FXYXRmZlo2NG5GdC9jdGNiY3pBUnVGSXNFODkwQndyV2hZRDlvQjFZd2lU?=
 =?utf-8?B?amxldWxMSHNScmN1TGpnVmxMQmFTNjdJb0pNelliWnRRTGdwSTRvWnBZcFJw?=
 =?utf-8?B?Z1c4bUpKTDl1MHhoTExydlduYUI0eklxMHRNK1p5MmVzSEZZbEkwZFlaQkl4?=
 =?utf-8?B?SHJKczhzVmxtYmdjOERrKzdpTkwrZmJydWVjNlhkenRyWWxRUk9NT2J0MWJy?=
 =?utf-8?B?RnVGNDlYMktnK2R3cU44UEhpeml2UDFCN0JLVXFjZ1I3YmlkVUFqZmdqUlU2?=
 =?utf-8?B?clVleHNwaUlYQkc0U3M1VjlGYmZrQmtJWEhUaFJoeVpqVHRRbnVqNnNuek1w?=
 =?utf-8?B?aC9KSkY3Z00zcndQYWMxZVpaYnlBL1JMWWNDRVJ4bFZEd1BaRUNFVkNVQk93?=
 =?utf-8?B?NzBrdC92Z3p1Smw3dlRmYTY0S2pqWk5zVkRxZmdjdHRDSGJtZ3RFUkFndXAr?=
 =?utf-8?B?eHRLanI0T2QvQnlvQ1I0RkNaOUZ3Tkk2TE1iQ2RibWpGZjh3UFFkVUZJaHFG?=
 =?utf-8?B?eTg2WFZzOTBJZE1WeFEwL3hTS3Bsa3pNYVUrNnVsRjFkU3BPejlReEJYZlQ1?=
 =?utf-8?B?QXl0ajBkd05YWjRDd2dnaWJFSWVxNUNjNzZCYlBHM3pwQlRVRWM3VjdiQ3Zw?=
 =?utf-8?B?b2c4ZXFrK3JneWtCTHJPMWtQRW5JRks3VkpQR01COGljMVFTVm1xbk9wMFBE?=
 =?utf-8?B?eXZpQ2NTdExJa3pBelVyNVd2VEkrcXQreDZGQlY2TGRsaDIycFdubWs3M2Jl?=
 =?utf-8?B?clVmTlliZWdxcktkbXZydVRPQ2hNZnFzL09aMkYrU2ZIVzFyR1RacWROdGZw?=
 =?utf-8?B?SnNNSlVCZ2dnc0VPMFYyL1crTFZ3SG05ZVBCRkNKWTVHYjVIeUUzOExJdWlm?=
 =?utf-8?B?OC96bXVxMUN3NGdIaFVGSDk0MmpESFV6Q0VOOE9ZSnNoYWVjc1IrTUloNXZU?=
 =?utf-8?B?cjJXRkw2elVMWW4zemc2V0w2RmJkaWxpWE1WNDFtTWluVHY2MkU5WmtxOTgz?=
 =?utf-8?B?UWFieFpuRGJnbHhIVGVSSi9aL203UTJHeGF2cHJuTE16d1BvdytxbnBCUngz?=
 =?utf-8?B?RjRua2ZWRElCREZJTGxwTHUxV1Zvcys2ODhBZVVvdm1hNWtDV1NNVmhHUktN?=
 =?utf-8?B?OEorNFgrQTBPNmxrUFpiVU9nV21IUURkc3dJaVNiWUJSelNHL1l0WVAyRjJk?=
 =?utf-8?B?Y0JVS3B2ejZ4MzdqQ0FmSUI2VVQ5VktsWEc2Y1hFckt1KzRKd2NQZE9COVNm?=
 =?utf-8?B?dkt5SHk1MVc0alRoTXlqVWZEVG5uZzdUWlJ5cEM3NjRzODJjWDQ0U0k2S3RO?=
 =?utf-8?B?MkIwNGFPOUtvS0s5b0xoNHBLQ1RXaDZNdU1NbkNDdGFDQ1l4WmwreVVwWHQ2?=
 =?utf-8?Q?xVxUrM2pXlsa9uwmyk4Q1EZaQFwgEN9XSbFbBOi5Ubun?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a74b816-bfd1-488a-9e57-08db0f699ec3
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB5671.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 15:30:51.4066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JN7Rc5poxvWfuL2nNuPV3XuYReYndHgZNDbaUo+8pVS/diESbmBzOCT/s58XpWaqy8M34/nzVigofzyZUurUyAU4VdwXvCj1+Bc0tz91frM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7386
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15.02.23 15:40, Frieder Schrempf wrote:
> On 15.02.23 15:20, Frieder Schrempf wrote:
>> Hi Laurent,
>>
>> On 15.02.23 13:05, Laurent Pinchart wrote:
>>> On Wed, Feb 15, 2023 at 12:53:56PM +0100, Frieder Schrempf wrote:
>>>> On 14.02.23 17:47, Frieder Schrempf wrote:
>>>>> Hi everyone,
>>>>>
>>>>> after solving the previous devicetree and driver issues with the media
>>>>> pipeline on i.MX8MM using a RPi v2.1 camera module (imx219) as sensor, I
>>>>> now try to get an image from the sensor and run into the next problem.
>>>>>
>>>>> Below you can find the commands I use and the output I'm getting. Maybe
>>>>> someone can see straight away what's wrong or at least can make a guess
>>>>> before I start diving into the code. ;)
>>>>>
>>>>> By the way: This happens on v6.1.11 and 6.2-rc8.
>>>>
>>>> So it looks like there are several problems (again):
>>>>
>>>> First I missed to enable the link between the imx219 and the imx-mipi-csis:
>>>>
>>>> media-ctl -l "'imx219 1-0010':0 -> 'csis-32e30000.mipi-csi':0[1]"
>>>>
>>>> And the imx-mipi-csis driver is missing a check for the missing source
>>>> link which caused the exception. I currently have this applied and will
>>>> send this as formal patch later:
>>>>
>>>> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
>>>> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
>>>> @@ -596,6 +596,11 @@ static int mipi_csis_calculate_params(struct
>>>> mipi_csis_device *csis,
>>>>         s64 link_freq;
>>>>         u32 lane_rate;
>>>>
>>>> +       if (!csis->src_sd) {
>>>> +               dev_err(csis->dev, "Missing source link\n");
>>>> +               return -EINVAL;
>>>> +       }
>>>> +
>>>>         /* Calculate the line rate from the pixel rate. */
>>>>         link_freq = v4l2_get_link_freq(csis->src_sd->ctrl_handler,
>>>>                                        csis_fmt->width,
>>>
>>> The pipeline is not correctly configured, and that should have been
>>> caught earlier as both pads are created with the
>>> MEDIA_PAD_FL_MUST_CONNECT flag. The __media_pipeline_start() function
>>> should have return an error. Could you try to check why that didn't
>>> happen ?
>>
>> Thanks for the pointer. I looked at __media_pipeline_start() and to me
>> it looks like there's something wrong. During validation of the links,
>> there is no code to handle the case where all links are skipped before
>> link_validate() is called on them. The loop is left with has_link = true
>> and has_enabled_link = true and validation of the pipeline succeeds even
>> though there is a missing link.
>>
>> Does this look like a valid fix to you:
>>
>> --- a/drivers/media/mc/mc-entity.c
>> +++ b/drivers/media/mc/mc-entity.c
>> @@ -744,6 +744,7 @@ __must_check int __media_pipeline_start(struct
>> media_pad *pad,
>>                 struct media_pad *pad = ppad->pad;
>>                 struct media_entity *entity = pad->entity;
>>                 bool has_enabled_link = false;
>> +               bool has_valid_link = false;
>>                 bool has_link = false;
>>                 struct media_link *link;
>>
>> @@ -806,6 +807,15 @@ __must_check int __media_pipeline_start(struct
>> media_pad *pad,
>>                                 link->source->index,
>>                                 link->sink->entity->name,
>>                                 link->sink->index);
>> +
>> +                       has_valid_link = true;
>> +                       break;
>> +               }
>> +
>> +               if (!has_valid_link) {
>> +                       dev_dbg(mdev->dev, "No valid link found");
>> +                       ret = -ENOLINK;
>> +                       goto error;
>>                 }
>>
>>
> 
> On second thought, I see that this is probably not a correct fix. But I
> still think the current code has a flaw. Or maybe I'm missing something
> important again. ;)

Looks like the pipeline validation is only run for the pads of the links
that are enabled. As the following output shows, the pad
'csis-32e30000.mipi-csi':0 is not part of the pipeline and the link
'csis-32e30000.mipi-csi':0 -> 'imx219 1-0010':0 is therefore not part of
the validation in __media_pipeline_start().

[   36.069274] imx7-csi 32e20000.csi: media pipeline populated, found pads:
[   36.080901] imx7-csi 32e20000.csi: - 'csi capture':0
[   36.085926] imx7-csi 32e20000.csi: - 'csi':1
[   36.090222] imx7-csi 32e20000.csi: - 'csi':0
[   36.094524] imx7-csi 32e20000.csi: - 'csis-32e30000.mipi-csi':1

So the first time the disabled link is detected is in the driver in
mipi_csis_calculate_params() which leads to the crash.

> 
>>>
>>>> Now with this resolved, I get:
>>>>
>>>> v4l2-ctl -d /dev/video0
>>>> --set-fmt-video=width=640,height=480,pixelformat=RG10 --stream-mmap
>>>> [  574.758110] imx7-csi 32e20000.csi: pipeline start failed with -32
>>>>                 VIDIOC_STREAMON returned -1 (Broken pipe)
>>>>
>>>> So still not there, but a bit closer ;)
>>>> Probably I'm doing something wrong when setting up the format, etc.
>>>
>>> Quite likely :-) Have you configured formats on all subdevs through the
>>> pipeline with media-ctl ?
>>>
>>
>> I'm doing the following:
>>
>> media-ctl -l "'imx219 1-0010':0 -> 'csis-32e30000.mipi-csi':0[1]"
>> media-ctl -d /dev/media0 -V '"imx219 1-0010":0[fmt:SBGGR10_1X10/640x480
>> field:none]'
>> media-ctl -d /dev/media0 -V
>> '"csis-32e30000.mipi-csi":0[fmt:SBGGR10_1X10/640x480 field:none]'
>> media-ctl -d /dev/media0 -V '"csi":0[fmt:SBGGR10_1X10/640x480 field:none]'
>>
>> Is there more I need to do? Sorry, I still lack a lot of understanding
>> and experience on how to use the media framework.
>>
>> But I guess in some way it's also good, as I can provide some testing
>> for the error handling, that you would probably miss otherwise as you
>> know how to setup things properly. ;)

So, I found out that I used SBGGR10_1X10 but the sensor only supports
SRGGB10_1X10. Now the pipeline seems to work.
