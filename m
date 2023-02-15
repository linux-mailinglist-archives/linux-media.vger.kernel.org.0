Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 441E4697E8F
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 15:40:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbjBOOkZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 09:40:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbjBOOkS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 09:40:18 -0500
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2100.outbound.protection.outlook.com [40.107.6.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2450392AC
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 06:40:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8l7fB2Du7aLCYpagyIvvYXJvNFEWQRn93ZRzkiPQgVHEa470jbrI1w9Eq7rC5Zhy+i+JOiZJO5HKP6l4m9v02w0Xl7XpBAeKxZcYQrjGtCa7snJlsBl4D9MKa6ZG35C/ne48Z1vvvsxOueV0YrLkab4YGoPQpAJclEGk39gJ8jufpZbFMmsD7RQXLtngi1WJcmNjK7FfY4YbDy/dncuEChc1xkpaMFUi0Ye/aD+lRKznanJ8/yMnkq435RqiDLk5YWHCG0I8mvDL2XkDJEF+okMPWHqfWbR3eEefioiACC7EZa5N3I45kqHuVClKevVuNT6N1sMIu0LWfVIPgQM4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0w2ChbQ+7W4HUIMcO9JAKMfOFN035FqywWn+3xrqgs=;
 b=IaQ7nVfvjvc+5xgXVZMg4j+vsKJ9fHsHLc6ia0M+1Ixl05jSCnr66pqhw2j/BET0fIIpAuT65C+kZ16wyIJN2NcE8VlnZKEybhJMst2aYh2tYDbuejSMPyNlV14d59OBdx3k77YLEhthAHOh5d1PwJ8blY6AI4DkK2k9+zlwvErYb86Rgd9c+9SOO+yCPg9+o82BFN6HhriyJRDEnaPN0gjGyIWGk3ayrxQwwrb7nfpRa1YIxq9jg6QSjFV+zfX4c6/PgYBb/3fBdpWYEshrqJjNI1I9WQOPgbcCO5VaxPGJzB5+wDhJTOeZik4Qw3V5jgB6UzOjsEX4RzaMyuUUqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0w2ChbQ+7W4HUIMcO9JAKMfOFN035FqywWn+3xrqgs=;
 b=MJeyusBTObCNrjWIFLW2vJzArY48A2MS7Gdb+S7f0TwFDe6G+7EkIWgxuwdQssgTAJPjZt2IzHo0NpPUcCgilnqkXWli0aQLpJtjw/OmNTE07CvO04TVGW9nW1tT2XJTXo2sKsuk0601NX4oUsHhII/Cyr21TxSX6+hrz9VUMgw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AS4PR10MB5671.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4f2::14)
 by VE1PR10MB3919.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:16f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 14:40:10 +0000
Received: from AS4PR10MB5671.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3931:3416:1ae8:e00f]) by AS4PR10MB5671.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3931:3416:1ae8:e00f%5]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 14:40:10 +0000
Message-ID: <dfdd11f6-8692-1bec-2a7c-1d890039cfe7@kontron.de>
Date:   Wed, 15 Feb 2023 15:40:08 +0100
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
In-Reply-To: <d797611e-8e07-402f-ec75-7a1eadbc2122@kontron.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7c::11) To AS4PR10MB5671.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:4f2::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB5671:EE_|VE1PR10MB3919:EE_
X-MS-Office365-Filtering-Correlation-Id: a3922f44-ace9-4be6-33d3-08db0f628a58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L5dQZqlAkGko91N6srd3f8Zi+KgOb2KMv5J05+1AytaqoE0upnnrE+48WCid7orxEET+fDY+VNBmc0ZhinaSiabDzGoe62vT6FY/w0g+HQOnCDKn7o+cqeZll2IeEcjLFeBZ7kiEGxP+fnbsG/vWyPQjPSUV/05S9hypIPLiOxgru74NxgH4cSL6hig9grEBdg8tKnGiq9+oDbj42WA9sJLH98MwEe3L6JiogG9AtYnMeFYFzqBCXp13KKihLpC1/WlLFrRLargsXTQFBGfH599k2X6TuodsSUshvQY17/N25KAF7znQUGhWUObIqdWEMEaV4GMttnLjJvSCyA/nw1OBcKiFth/kls00KbKD2krmMcyuiDEU+xEiLjHhCOPMsUJpMznjQfZpbe1xP6+IIJ6sgiRcxmph+SXBUQ//gpHyOPGR4nCRi9ZF1ZG4zxbfLThDT3mB2mX+4kqxSAL7QF4CIIjTt6eYdACtOXvR9BsdtLaom+LTQcikBtoyXPou6+z70UBWmZsNRsiwRUYfGPfwL0vzhzUHjQOL8QXmyEa7gbgNSPoyN4quEqYM0PwT/zzcl1F3rOLiN3J+lEYmUHOQmzw23E0WKjzvaGMkaPU+YLBYzx+DLObtkxhNeYnW33KxoNWbxEsHZUaaDFaGiRUTzwmhvfQXH51Wb9U4FByd6J52D/kofcCOrF9ErJOksIsjM3O+sggqbVU7tLUWVfoz8+2uCLjmA3XqSME+a/c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB5671.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(396003)(136003)(39860400002)(346002)(451199018)(8936002)(86362001)(31696002)(31686004)(41300700001)(38100700002)(44832011)(5660300002)(6916009)(8676002)(4326008)(2906002)(66556008)(66476007)(66946007)(316002)(2616005)(6486002)(83380400001)(478600001)(54906003)(36756003)(6506007)(53546011)(6512007)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUJ6d0V3OUZmRkE5eEtkdzFoM2FCdlJpcDY3ZjZ0ZUlOOUl2K2dCdUpHM2NN?=
 =?utf-8?B?M2d2M0xZOTd5QkJYYURDbUFEMFh5Rndqd2hBN2NlT1VaL2QrY3ZnRHp6T2hz?=
 =?utf-8?B?R25ucG5hR3BQa3RIdVVKdVZ0bEFONzFJcmFxUEZSNndyME8wZ3Y3SmdPVFZm?=
 =?utf-8?B?LzFqUFpBNDRrNjhReVJiamJJZXA5K25RRE9VUDZOYmRUdjhPVGlHam1CRHZl?=
 =?utf-8?B?ZnFMdXlhZllxQ00ya1M2dTN2K3BzTzVvZ3RqOUIwMlM1cVF1emRRY0poL3p4?=
 =?utf-8?B?cHFiMnNmS0MvL3VRbW9GNGxFbUNZUVU1bHRaQjl0Ymx5UW1HaTcxZlp5dHlz?=
 =?utf-8?B?RmZMaXAwZDNZZ2d2c203RXdzVHdGblVIRldiMWlFQ1NxcDE1VU1tZWs2VTNl?=
 =?utf-8?B?aC9aV3BxZzdDUVdjU0hwWWJ5bGNUcUFrMGV3ZmZiVS9pczViUDVUWm85cW95?=
 =?utf-8?B?RDFYMWpEOGdvSUxXUkg3enpQUjVlb3pjdlNlVm5PZTNadHV2S2Zwc2JQL0xz?=
 =?utf-8?B?UWJidk9UTkdmay9XQXFhSDRNci91MmIxQ0NaMXk4VnR3c29TeFR4TmtKMis5?=
 =?utf-8?B?djIyeDBLcldyNXNadGtVTzE1SFhOK1NDeTE5cjE0dkt5YWZDNU05Smc3djB1?=
 =?utf-8?B?OWdPOWpKZnM1ek16UUd1OG1WNkVxT2ZoT3ZPZTIrc093TTVEMGQ3aEQxdEp3?=
 =?utf-8?B?dGd5S3gxQjBBZitoNms2cnBkOWNtQW4yb1pTSE5maGRjL0QrQXRyRTlLMDg3?=
 =?utf-8?B?aEdId2lYUHhrSGZMSTUyTERzNmdVMmZvRXhXTytrL2hUa0l6WGpFODI0T0V4?=
 =?utf-8?B?c3p4cmxnakFJRkV2M1VaTHZDZlhoeEVkcGZGcHFzb2NlN2h6S2VPek5ZSnVM?=
 =?utf-8?B?dkxnUmlvRmR0ZHBVd0FuUW5PWGN5WUhSYXQyVFdRR0VsZDNyelhmSjJwV1pR?=
 =?utf-8?B?L29PaUU3SHdSOXl5N3EzME85bytXbWNKWkZhSjd5b1dkcDdZWE5kMVBFcmlv?=
 =?utf-8?B?Z2dVUGxZVlNLbTVwanlnS0NyWnVIMUJMTEh5aVJ1SDBQMVI5V1J1RVBaYVhP?=
 =?utf-8?B?M2cyMnhyQmNCTUpCMkp3OGpkYjZXSG9CMFRRNlI1UkQ3WElmMGU3RDEra280?=
 =?utf-8?B?U3lhUlVYZUhsYlQyR0FKbm9nenAvWGFjaFlDKzJLaGJjSjFzWS9YcHZmRGQy?=
 =?utf-8?B?MDJ3czc1dFhURldUZDVJV2JPRGQ2MkhpVzhqa2xpb1ZlaDlwOFJuZEErTGhN?=
 =?utf-8?B?SVpTOEZPbVRKSUxEN3Bvc1M3WXViR25ISDJLWmdPLzZoZUNoWC9VZ29UMVhh?=
 =?utf-8?B?dEl0WE9tSzlydmdPQTRGMlhRYjNpc0lWV3ZaUGkyS0EwazhPUnlMa0RRSTdp?=
 =?utf-8?B?eXRiQUJRN1FxUmVMM1hib2tEOGNNVHNRUXA0a0tIdzVDaGU2VHVxeHltS3Jn?=
 =?utf-8?B?clJqS3JlOHFTc1dvTXl5YUtraHdmQTdneFhEQmQrY3JxSFN0bE1GOVdiMDNB?=
 =?utf-8?B?VTIzUWJDNjk1WnBMSlBzUkNyazRYS1Uxc1R6NGJZWEdzalcrdkNIMDVvNlNk?=
 =?utf-8?B?ajlZYmFkZ0tGdTVQbWwzQlJQMk5BaG9pN2hHMWdiY0dxT0wxNE56Z0tCSWF6?=
 =?utf-8?B?LzJralNSMW5qc2RkVkl0Wm9QelgvUit0WE5IZDk4TnJheVZ1T3JpWDBhaGRs?=
 =?utf-8?B?R25UVmZLWnZld2dVVWJ3NHlheFlPT0cwUUlhNUVGQkNMOEcyUzd5Tk1Rem91?=
 =?utf-8?B?UzF3WHlvZHBDWk94WGtvQStPbmlORnREekZheTY3L0hEQlVoNHNpQ2t2VGFs?=
 =?utf-8?B?d3AycU9md0tvalJQRE44bWVTanFmcVB2REpmTGxkdXM5VGZETXRjTFlPVkE1?=
 =?utf-8?B?SzQ1VmFDMC9aYlZzaGMyYlkvQTJIendmSTBBTzJPTFNYdFVTbmw5VXBZRU0r?=
 =?utf-8?B?T0M2c3pwU2JJaG5GTy9IUXhma3NqNjdSR2RuNUhPMkpxSHlmNWsxM2Uwcits?=
 =?utf-8?B?SWMvSERqSzlUaXp2ZGF2T24zS2xwalBKRUhQVEdqaU5yc1ZUYjF5d28rb0ho?=
 =?utf-8?B?QkxrWW02M0NsSG5yYzUzK08yTWphTXR2aDMvMVV6WkdxRzdYajZzK1pISFRB?=
 =?utf-8?B?Qld0M3IzOUxqSjYydmJock5BT1RVYVlMOURwRGRrSFpxZXV5b0YydTYzSThj?=
 =?utf-8?Q?gaYGfkXG4fiz3fhCGLwzGwolMTil+CG7iRfUV2d8sMv5?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a3922f44-ace9-4be6-33d3-08db0f628a58
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB5671.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 14:40:10.7192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4g7+GyH9X6KEnV4tpsf+EekQjqyoDILIv4mh7ZyRA92eBz08dyQpCsSrffS8V0lMkKVU2L5x51+CtcQewBW70q0CFHqVlZ/c2x1kM9lob4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3919
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15.02.23 15:20, Frieder Schrempf wrote:
> Hi Laurent,
> 
> On 15.02.23 13:05, Laurent Pinchart wrote:
>> On Wed, Feb 15, 2023 at 12:53:56PM +0100, Frieder Schrempf wrote:
>>> On 14.02.23 17:47, Frieder Schrempf wrote:
>>>> Hi everyone,
>>>>
>>>> after solving the previous devicetree and driver issues with the media
>>>> pipeline on i.MX8MM using a RPi v2.1 camera module (imx219) as sensor, I
>>>> now try to get an image from the sensor and run into the next problem.
>>>>
>>>> Below you can find the commands I use and the output I'm getting. Maybe
>>>> someone can see straight away what's wrong or at least can make a guess
>>>> before I start diving into the code. ;)
>>>>
>>>> By the way: This happens on v6.1.11 and 6.2-rc8.
>>>
>>> So it looks like there are several problems (again):
>>>
>>> First I missed to enable the link between the imx219 and the imx-mipi-csis:
>>>
>>> media-ctl -l "'imx219 1-0010':0 -> 'csis-32e30000.mipi-csi':0[1]"
>>>
>>> And the imx-mipi-csis driver is missing a check for the missing source
>>> link which caused the exception. I currently have this applied and will
>>> send this as formal patch later:
>>>
>>> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
>>> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
>>> @@ -596,6 +596,11 @@ static int mipi_csis_calculate_params(struct
>>> mipi_csis_device *csis,
>>>         s64 link_freq;
>>>         u32 lane_rate;
>>>
>>> +       if (!csis->src_sd) {
>>> +               dev_err(csis->dev, "Missing source link\n");
>>> +               return -EINVAL;
>>> +       }
>>> +
>>>         /* Calculate the line rate from the pixel rate. */
>>>         link_freq = v4l2_get_link_freq(csis->src_sd->ctrl_handler,
>>>                                        csis_fmt->width,
>>
>> The pipeline is not correctly configured, and that should have been
>> caught earlier as both pads are created with the
>> MEDIA_PAD_FL_MUST_CONNECT flag. The __media_pipeline_start() function
>> should have return an error. Could you try to check why that didn't
>> happen ?
> 
> Thanks for the pointer. I looked at __media_pipeline_start() and to me
> it looks like there's something wrong. During validation of the links,
> there is no code to handle the case where all links are skipped before
> link_validate() is called on them. The loop is left with has_link = true
> and has_enabled_link = true and validation of the pipeline succeeds even
> though there is a missing link.
> 
> Does this look like a valid fix to you:
> 
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -744,6 +744,7 @@ __must_check int __media_pipeline_start(struct
> media_pad *pad,
>                 struct media_pad *pad = ppad->pad;
>                 struct media_entity *entity = pad->entity;
>                 bool has_enabled_link = false;
> +               bool has_valid_link = false;
>                 bool has_link = false;
>                 struct media_link *link;
> 
> @@ -806,6 +807,15 @@ __must_check int __media_pipeline_start(struct
> media_pad *pad,
>                                 link->source->index,
>                                 link->sink->entity->name,
>                                 link->sink->index);
> +
> +                       has_valid_link = true;
> +                       break;
> +               }
> +
> +               if (!has_valid_link) {
> +                       dev_dbg(mdev->dev, "No valid link found");
> +                       ret = -ENOLINK;
> +                       goto error;
>                 }
> 
> 

On second thought, I see that this is probably not a correct fix. But I
still think the current code has a flaw. Or maybe I'm missing something
important again. ;)

>>
>>> Now with this resolved, I get:
>>>
>>> v4l2-ctl -d /dev/video0
>>> --set-fmt-video=width=640,height=480,pixelformat=RG10 --stream-mmap
>>> [  574.758110] imx7-csi 32e20000.csi: pipeline start failed with -32
>>>                 VIDIOC_STREAMON returned -1 (Broken pipe)
>>>
>>> So still not there, but a bit closer ;)
>>> Probably I'm doing something wrong when setting up the format, etc.
>>
>> Quite likely :-) Have you configured formats on all subdevs through the
>> pipeline with media-ctl ?
>>
> 
> I'm doing the following:
> 
> media-ctl -l "'imx219 1-0010':0 -> 'csis-32e30000.mipi-csi':0[1]"
> media-ctl -d /dev/media0 -V '"imx219 1-0010":0[fmt:SBGGR10_1X10/640x480
> field:none]'
> media-ctl -d /dev/media0 -V
> '"csis-32e30000.mipi-csi":0[fmt:SBGGR10_1X10/640x480 field:none]'
> media-ctl -d /dev/media0 -V '"csi":0[fmt:SBGGR10_1X10/640x480 field:none]'
> 
> Is there more I need to do? Sorry, I still lack a lot of understanding
> and experience on how to use the media framework.
> 
> But I guess in some way it's also good, as I can provide some testing
> for the error handling, that you would probably miss otherwise as you
> know how to setup things properly. ;)
> 
> Thanks
> Frieder
