Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA4C476509C
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 12:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231631AbjG0KKp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 06:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231274AbjG0KKn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 06:10:43 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40F3310DB
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 03:10:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fq5nmGTShS49eBb31Luzcp+uAHeKh7HJh17dQDW1tm6S5zfey/Z+nq97ackEh69TmWdO2vC4vVWtR4bF0krKZWPL+TFONaLw+yOXR9Qrs+BGEeYHjJMVb4Bm/yzP+CUN8oRULB9yDICSrotZCn3LwOI3bDrOB8F408kv4MdXTW6vVuBhQ/78E5ES0vf4buYoBAUI+hu3qh89M4hyqfHcfoXrHBEOea7HRic31GW9mB7DhE6dU1lKDbsyofJz50LzH59JeRC2Fu0tL/1Z2jizB0s4396LB6cpMsSOHau6rg2mF36kX4q8k6AM1hwcU6vDHdoMf5jV2HiGIRaOCDaoPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HOm4ILUZ7NX1PYpZKht00o83FdTNUSQzPk7NgpfTD0=;
 b=e+7GVhvRLp9HH4dk7NrXfZGmqxF9pQayTjz6UilG4CVvt2JIf11El9KR2k9XFlxoq16KB/kMN7t/rvwI+Qm3C14vD7UXn99MEqIVPGq38OG+38Y/u3joOEwbWVp98jzaD4e2XP7ygMldZfXw6GZEX/GRIw1CQG5A3C1VH6ilGlsqum94L1hp0vpQggk+IKNdg8ePCr82aiytWV72FEAJEt1iUH0XW/RHMnwMsI24y22kN7BNsU7QbHG/vzqg0WjDxnR2J05NKFXvv8/y86LqxG/gRoAn5tDKV6QnuSAUzGbktXNZ8VftpK/GzAPYit1+bDKUBZZyoA+LL+nMOc7tfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HOm4ILUZ7NX1PYpZKht00o83FdTNUSQzPk7NgpfTD0=;
 b=hACGN+yeAXtZAnb/2jGEwbRetORRRmQ5+jUvH99H73NfMlkp4R33U8oZAqApg9/vvumaIvMuBwdQmWHe0PsSQ0+1/tKh2DcMScIAm8HzZA/1lGB21/05h4rtEWf8uu7FsqcSBBuVpDxXaM2fXx1f64HmQOOJuQDj1pXDPqHEdJs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by BY1PR03MB7261.namprd03.prod.outlook.com (2603:10b6:a03:526::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 10:10:38 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::411c:e486:3837:cc25]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::411c:e486:3837:cc25%3]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 10:10:37 +0000
Message-ID: <fccd65a7-d555-0957-75f0-804730981be3@synaptics.com>
Date:   Thu, 27 Jul 2023 18:10:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC]: media: mc: storing query status in variable length buffer
 likes blob in DRM
Content-Language: en-GB
To:     Tomasz Figa <tfiga@chromium.org>, Yunke Cao <yunkec@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        ayaka <ayaka@soulik.info>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, Brian.Starkey@arm.com,
        boris.brezillon@collabora.com, frkoenig@chromium.org,
        hans.verkuil@cisco.com, hiroh@chromium.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Helen Koike <helen.koike@collabora.com>
References: <3df23ff7-7a62-ed92-b9fb-a988e96c9790@synaptics.com>
 <CAAFQd5DBwCL8vELwJpFZPseLgLeXq-p2LWO9t=PYc0wXVjGB9w@mail.gmail.com>
From:   Hsia-Jun Li <Randy.Li@synaptics.com>
In-Reply-To: <CAAFQd5DBwCL8vELwJpFZPseLgLeXq-p2LWO9t=PYc0wXVjGB9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::20) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:EE_|BY1PR03MB7261:EE_
X-MS-Office365-Filtering-Correlation-Id: d28c0f13-0738-45ff-54d6-08db8e89b981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SAkkqvK7kGv3gbSd9hHjwJP/rwhcM0AHBzmwl3j4oU0it0OjlUOqPKkdTOEaOifU2xN/8O4YsPMU06Xf+hi+gwIgYftUuQ5ppnGzSKLXpZZg9RQ+g+LE/Qgt5EKdM6ytukEv8jDqlzS1IHm+XDcy4wN0otBaQLFfz8Ya/V4ltpFO5Zg6DobzePd1Ffrnf0aM4mub2nGPp/1uQiEAXPQMLtmO8+TKeYg/giSEixaWuQxc6NfDTKdrYE7GDBjkBYaMUjkTt4daFQab3SzyFP/G+F3f1glVvk6G4EDaa506+/jZElFxQVSZUpYCe3aQp2NdQKKCwC/OCrOh8oVCbNTWc6kIfIcl6E15d9UJPOwJWcAvvo9jrv5QMMTSS9wA2+sDx/Gmz2xXjudFcsje5amFv7u6K0Sbmm2lfAEtvAQr8/yiptHLgCsMZUPGH2lOUBPlpxxhsFTSu7B9Q43EdTrvTbfoD21H8HEiMy1wjj+6li+RFigvDfBLlsi8T9O/yk88VtRF6KwZqdUJM4vu6S2DFH7IymhM24uFuv+9ThVD2tvROfw93tr/IamTWtfEPKs4YIg/8ooSY2jXCbQ7RgyvJQRlY34lVx5FrdUsZQCFla0m6WckmFQkDtzq9LEzzCm6+iN3ztMRF7OebM1Gy/OuJHpmQGnqLJ63fItEqFDQ1kPLwjp3BatAIrFNv0D6U01s
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5196.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(366004)(376002)(39860400002)(136003)(451199021)(66899021)(41300700001)(2906002)(316002)(7416002)(5660300002)(8676002)(8936002)(36756003)(86362001)(31696002)(6512007)(6506007)(53546011)(26005)(478600001)(52116002)(6666004)(6486002)(83380400001)(38100700002)(186003)(31686004)(2616005)(4326008)(66476007)(38350700002)(66946007)(110136005)(54906003)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N29hdGpLSVpkblQvTGVUOUc3V1NlRFpXRGs4VE9CaksrbzlERjc2cENuN1JI?=
 =?utf-8?B?dnA2NHdBRU5saWtDZldwTitKTGtBSEJMYkUrVkZ6c3dDUlNDeFFucFZESDgy?=
 =?utf-8?B?UExieGlVWktZenJPR25qRnp1a2x3RnVuallCNERwbGllV1NER2NlKy85eXZJ?=
 =?utf-8?B?cU94V01ZQ3Z4Wlg0TTFWL1FsYUw0WU82OXJlb2JEYWVIUkhlUDdGVC84QXhB?=
 =?utf-8?B?YWYvMnJWWjBVTjJwaldxL0Mya2tQRThsaDJ4TFNxTE9YRkRhU0dtT1NRSnE1?=
 =?utf-8?B?OXp5bFp0SUpuOHRyRHNoaVlPcXRYNGdJa1pmNG16OXozaXQ5ak1BQzNzWG1p?=
 =?utf-8?B?WXU3OGNHWGFJYVBpOTJRSzFHKytwOU03M0ZSaVBEOElRb2hRYXllcDlMQnhn?=
 =?utf-8?B?UEIvdWcvNkRzRWxjdnNsenE4dXlpRjJReW9xNzdaWnYrcUhsejFDTGNkWnl3?=
 =?utf-8?B?cWZLMUR4bE1QOHg0cWRZdjNYTmJFb25yT1J5TmJHcjV4aE9FVTZFa2dtb0NQ?=
 =?utf-8?B?VEJoYmhEdkMyU1MxMnlSTnd2Y21XNDZCcTBGZWxNMUI3bXRIYmxlM2tKMS94?=
 =?utf-8?B?RVJKMDFmQ2phcUcrYXhHTXdOMHJtS05Ka2Zkbkl6R3owSkFSYVdxcHB5c0Vo?=
 =?utf-8?B?NzBSUWNRdmpzcUhOZkNPL1E3dDFncC9qMDE4dk9mQ1RXYnhiSE1IbE1OU2t3?=
 =?utf-8?B?R0pUUXJVcG5VMVJzVkV1RmlFUjArak10dzNWazV2c2t0cGt0VmxIRkpWWHFR?=
 =?utf-8?B?NVNyWGNkcVZIbEJ4RG4rR1FCdWdmejFSekdaRWcrWlpwWGhQUDZqaVBRLzUy?=
 =?utf-8?B?QXBjUEtpa1ppbDZ3TUlta1R3RmsveDJWd0lRN2dBcGtKUXBuejNMTko5dkJF?=
 =?utf-8?B?cHJyamcrSXE4T3VPaTByeW11Yk02K01lSkU3UkVQSm1aVjE4Z3NMZkQ5Y0NW?=
 =?utf-8?B?UUJrcnE0MmlqVnBKRXg5Ty9OckpYRmtIclJ4V3J6dUIzdTFlOWVzRjZmMitJ?=
 =?utf-8?B?aGJQN2dqOWFOdU9SbE9sNGFwakZibGRwbzd3N1pTTk40MUt5WFE3MXJTL3ps?=
 =?utf-8?B?SHZndU1LZGNseHg0MnRIbWZmTmY5cFUrVjhVbGxWaThpZHRaTmxpT0czaWtE?=
 =?utf-8?B?TlJQTWVVYW5kTkZ5MlpJdFM2ZGEveGZXTjV1QlkyZ3R6b0tpVnpNRHJnMjJ2?=
 =?utf-8?B?Tkx6bzRTYlN6c3RpQjNMUEV5RnRSYUlVbWV6NDZFQzVmUmQ3QkxRYUxJbEtl?=
 =?utf-8?B?ZU93blkrRGY3RXcxeXAwWkMxSmYwNmlJOTZpRXorM1NYZ09tRW05OVdEMlhy?=
 =?utf-8?B?UVRmTWtEREw1eStnM3ZGUW1uR3JsMXhQejI4STNUUUdjSlZqejFSQ0E5MWJy?=
 =?utf-8?B?YnVsQ0ljeXl4VmVZMUVSRjYzT3BseGQxU1Yva0t4MTU0VkQwVXplbG9hSDU1?=
 =?utf-8?B?eWZEb0dwL2ZPZUY5VktCZVg1ZlBkVnlLR3VnN0F0QkltTzAxRnk0NTJRcUZN?=
 =?utf-8?B?eFhpLzdBcmF6ZWJkbHB1S3ZqQm9tNFVuVy9yMDZPZlc5Q1dINHdFRkc0TzhX?=
 =?utf-8?B?ejRwaWpockZYOU4xQXpSbXM1MkJoeWRkQ1F4bXk4MUZ4UzFZc3RxSDdSc05u?=
 =?utf-8?B?aWRMUGdTZ3N3UmhLUWNtL3ZwOWpPbkVSTUQ1K3JzRzNncnBmOGhaRWFGZ005?=
 =?utf-8?B?NWhScWZsVTd4ZklEUHc4Q1BhejVlcm5QNWphTlE2WnpCR0prSzYyR3Y1Z0FX?=
 =?utf-8?B?SzdaYXVLUlRhc1ZtcjVTazY5UnUwYXBHUCtGSHU4bXFsQ01sbVhGbDY2U2NG?=
 =?utf-8?B?eFZPOGhYSU83Uy9DSWVhMkszZkl0V2RMdjJWWlFkSHVTbzBXL1N3emRhenVO?=
 =?utf-8?B?V1d2R2VlUEVWeGYzMFNUYUtNakViSkRGN3RpcEU0c2U1aWhEOFR5eUYrTVhT?=
 =?utf-8?B?M2s3REhkaUI3ekdXMVFlbEFRT2FHQ2xvaWpGdk4zQnk0THNuUGllVTJUakcz?=
 =?utf-8?B?YkNrd2ZRek43OXA2Z3VhWGlCdmdPYm0yRStXK1AvUEl6TjIwa3Y2K3k2LytX?=
 =?utf-8?B?OFlzSWRqY3dhN2ZQaG1ia1ZMMlRLTVBFcGFRTSsxN0plb2VlQitTSW03K2Mz?=
 =?utf-8?Q?4vWvighJdOfbFxHCijxw862Md?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d28c0f13-0738-45ff-54d6-08db8e89b981
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 10:10:37.8772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jHa03IgyUZVsqH2gGOtqKb2A3e98x5BJ0qJrxdPYBhf1Dw54ibmQcehuC663HlOREwKZqyukzZGKV3V/4GIdqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7261
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/27/23 17:07, Tomasz Figa wrote:
> CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> On Tue, Jul 4, 2023 at 5:41 PM Hsia-Jun Li <Randy.Li@synaptics.com> wrote:
>>
>> Hello All
>>
>> This RFC will address the problem that some ioctl() commands would be
>> called many times until that command got all the all its entries. Those
>> ioctl() command are:
>>
>> - VIDIOC_ENUM_FMT
>>
>> - VIDIOC_QUERYCTRL
>>
>> - VIDIOC_ENUMSTD and VIDIOC_SUBDEV_ENUMSTD
>>
>> Generally speaking, all enumeration type commands would lead to
>> frequently context switch between userspace  and kernel space. A few
>> enumeration commands listed below may not meet this problem in some
>> cases, as they could present their entries in a step wise way.
>>
>> - VIDIOC_ENUM_FRAMESIZES
>>
>> - VIDIOC_ENUM_FRAMEINTERVALS
>>
> 
> Right, it's something that often comes in conversations with user
> space developers on how it's difficult to query information from V4L2.
> That said, we've mostly found it as an annoyance rather than a
> practical problem. Do you have some specific case where the current
> approach of enumeration causes a problem for the application (e.g.
> performance)?
> 
I have to admit the performance is not a problem for enumeration of 
pixel formats. We only do that in the setup step.

The original problem before ext_pixel_format is enumeration of the 
colorspace, 12 variant of colorimetries for a pixel format.

After we began to disccus the v4l2 ext APIs, I want to remove the 
barrier that we can't update the v4l2 uAPI easily under the size limitation.
>>
>> A simple solution that we could bring and improve from DRM is the blob
>> object(struct drm_property_blob).
>>
>> We could extend the existing ioctl() in this way:
>>
>> 1. VIDIOC_ENUM_EXT_FMT would turn a blob id and the memory size
>> requirement that usespace should prepare
>>
>> for storing.
>>
>> 2. Appication call VIDIOC_GETPROPBLOB with blob id and a userspace
>> pointer which should be enough for storing.
>>
>> 3. V4L2 framework fill the that userptr with context likes this:
>>
>> struct v4l2_blob_prop {
>>
>> __u32 version;
>>
>> __u32 payload_size;
>>
>> __u32 payload[];
>>
>> };
>>
>> 4. The parsing of payload would depend on its version which
>> v4l2_blob_prop.version says, and each entry in the payload could be
>> variable length, likes this:
>>
>> struct v4l2_ext_pix_mod_desc {
>>
>> __u64 modifier;
>>
>> __u64 allocate_hints; /* heap flags shard by DMA-heap */
>>
>> __u32 num_of_planes;
>>
>> __u32 plane_sizes[8];
>>
>> __u32 colorimetry_flags;
>>
>> };
>>
>> struct v4l2_ext_pix_desc {
>>
>> __u32 fourcc;
>>
>> __u32 num_of_modifies;
>>
>> struct v4l2_ext_pix_mod_desc[];
>>
>> };
>>
> 
> Since I'm not familiar with the DRM blob approach it might be an
> obvious thing, but what happens when the application was written when
DRM doesn't have such design about API version.
> let's say the version was 3, but the kernel it's running on now was
> upgraded to version 4?
> 
Nope, the API version is not selected by the userspace but kernel.
It is something likes the protocol version in wayland.

We would careful make a version of API but we don't not take the 
responsibility for the back-compatible for the application.
>>
>> In this design, we could avoid the problem that we could hardly extend
>> our uAPI for V4L2, all the structure must be a fixed size.
>>
>> Here are some options design that people want for this RFC:
>>
>> 1. Do we need to call the ioctl() command itself(likes
>> VIDIOC_ENUM_EXT_FMT) which let the driver to flush its internal property
>> cache or calling VIDIOC_GETPROPBLOB is enough?
> 
> Wouldn't the former make it thread-unsafe?
> 
Why we need thread safe here? V4L2 don't offer such thing.
> I'd imagine something like this:
> 
> struct v4l2_property_array {
>          __u32 version; // Could be equal to the length of the struct
> 
It should not be. version means the structure of the payload.
>          void __user *buf;
>          __u32 len;
> 
>          __u32 num_formats;
>          __u32 num_frame_sizes;
>          __u32 num_modifiers;
>          __u32 num_controls;
>          __u32 num_menus;
> 
>         // More fields could be added here for more types of
> information to query, with next versions, which could be ignored by
> old userspace.
You know what this buffer for(the property that you want) before this 
step. That is not necessary to have a union reporting the items in the 
payload.
A struct(or an item) in the payload(many items) itself could have a 
variable array. How many items in the payload may not help on parsing 
for the userspace.
> };
> 
> If out_buf is NULL, the kernel fills len and num_* fields and returns.
> Then the userspace allocates a big enough buffer and calls the ioctl
> again with buf != NULL, which fills in the buffer pointed by buf as
> below.
> 
The maximum requirement size would be confirmed at the first step, a 
ioctl() likes VIDIOC_ENUM_EXT_FMT.
> {
>          (struct v4l2_ext_format[]) {
>                 [0] = { ... },
>                 [num_formats - 1] = { ... }
>          }
>          (struct v4l2_frame_size[]) {
>                  [0] = { ... },
>                  [num_frame_sizes - 1] = { ... }
>          }
>          // [...]
>          (struct v4l2_ctrl_menu[]) {
>                  [0] = { ... },
>                  [num_menus - 1] = { ... }
>          }
> }
> 
> I think we could also let the user space fill in the version and num_
> (presumably with 0) to control what information it wants the kernel to
> return.
> 
>>
>> 2. Should we make MC node support this feature only or standard video
>> node could? A thought from pinchartl is that every driver should have a
>> MC node even for the stateful driver.
>>
> 
> The futuristic model that we envisioned back in time would be that
> there is a media device that gives the user space ability to perform
> operations on all the interfaces of the respective media controller
> (or even all interfaces in the system - but that would require some
> security considerations). In such a model, the userspace could prepare
> an array (or blob if you prefer) of operations, where each operation
> refers to an interface entity ID on which to execute the operation. It
> would allow us to submit complete requests (or even many of them) in a
> single ioctl, reducing the overhead significantly.
> 
> That said, it would be a complete overhaul of the API, so it might be
> a step too big? Not sure. We certainly could benefit from V4L3. ;)
> 
I thought of that. But I try to convince people those are not a big 
change but essential.
>>
>> The implementation of RFC could be a foundation for ext pixel and ext
>> buffer APIs. I would like to know your feedback before we settle the
>> problem with the ext pixel format.
> 
> I feel like this kind of batch operation would be more important for
> buffer management, because it could allow dequeuing multiple buffers
> in one ioctl, which is actually something that is starting to show up
> as a real performance bottleneck for complex devices, such as ISPsI think I make it for MC node from the idea of Pinchart.
> (We have a MediaTek ISP that has a really big number of DMA engines,
> which accounts to about 200 DQBUFs per frame. Let me add +Yunke Cao
I need to know how it happens.
> who's been looking into what performance effects it has and how we
> could improve it.)
> 
We need to hurry up on settling the design of m2m or v4l2 framework.
We meet the fourcc namespace problem at least 5 years ago, but we still 
didn't fix it.
>>
>> --
>> Hsia-Jun(Randy) Li
>>

-- 
Hsia-Jun(Randy) Li
