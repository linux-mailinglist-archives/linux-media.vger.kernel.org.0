Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A66A776665C
	for <lists+linux-media@lfdr.de>; Fri, 28 Jul 2023 10:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234772AbjG1IHA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jul 2023 04:07:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234682AbjG1IGX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jul 2023 04:06:23 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 788AF4211
        for <linux-media@vger.kernel.org>; Fri, 28 Jul 2023 01:05:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AnBcSHqaFX9u4cql4V2mB3jrn/Jktnqb/2LE0p3XkRCnT+AkWso2+3F5DugBds5L3Zayjop8TBvaFUBeCTw1dBQPI+Vyw4B5a+N0DwLTq7jv8MDoqK9eGQlEoHil3dgkFwhHFDNr60hlc3SAm20EmTN6TEr8Ls0HmkzR+10P0Vlo7rzayzge2/FuUF/QMSkZ+NQMFKVoFDXUq9ZnljqYAy09n4MmguupnjZ39qVPD3ZFkZH1DvVAhS0VetXYL1TCLSjEBpm8A/BGI5Bzh//jgoS2VznAPvkE0c4i9x8It8QZB6BY5MqmXIvqMkEaApoVrrw7K8dfLRKctid38ylTUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkTx1XA3U+bPc1HzLtRiTB5B7VQRv1g0Vbuvn6vqCr0=;
 b=mQCDCdzeFhH5QHIGrRVt47f7pGxkcoJkZ4BWKjp6XDFKLHx1PzNj5prakt/nJ6Y6GoUhsQ4WNULtXM7vBRY1bISYfJfUKRw9zdKeh851PC/qaPiLOzl8E7ufuKUQ7P+i4vlkk4GPGN9eTM337YjT34K7Qkk6Lx9saPptik8lRGOlQ4sa4fGxPZ8IER2fTOWvC59Mn3/QwfWuD2CFe9PGwpEZ9es31Ax/Iqh5K5hw1VlpxL60aP7WMFDmIScf5t/qxdRv5h4tBv76IL3E1HRJzkodriMJQS7IkFuI5+tfgSQGrrki2Llg9tMO2KUx4pqIAqpvzq3Kyol1VgPGEmkupw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkTx1XA3U+bPc1HzLtRiTB5B7VQRv1g0Vbuvn6vqCr0=;
 b=nXgzJCqCUrpFp6RI4o4dUZnnTYcfilwlkdxQn4aEqs1hGbuTGR8PQIOOUm7AEGsl4IHnB5SBR6lZbW27kUZDvygWCvzD6PMSCJn41VKwEHSjyCU9z/oOdyFNo2ASFeBoNOHgSorii4UgMHYNeuvy1TyR4seBirO4fo1xG3Ndd4o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by BN8PR03MB4964.namprd03.prod.outlook.com (2603:10b6:408:7d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 08:05:37 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::411c:e486:3837:cc25]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::411c:e486:3837:cc25%3]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 08:05:36 +0000
Message-ID: <c1d2b01c-df2d-7621-ed41-5ba0c419c700@synaptics.com>
Date:   Fri, 28 Jul 2023 16:05:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC]: media: mc: storing query status in variable length buffer
 likes blob in DRM
Content-Language: en-GB
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Yunke Cao <yunkec@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        ayaka <ayaka@soulik.info>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, Brian.Starkey@arm.com,
        boris.brezillon@collabora.com, frkoenig@chromium.org,
        hans.verkuil@cisco.com, hiroh@chromium.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Helen Koike <helen.koike@collabora.com>
References: <3df23ff7-7a62-ed92-b9fb-a988e96c9790@synaptics.com>
 <CAAFQd5DBwCL8vELwJpFZPseLgLeXq-p2LWO9t=PYc0wXVjGB9w@mail.gmail.com>
 <fccd65a7-d555-0957-75f0-804730981be3@synaptics.com>
 <CAAFQd5DbnYmxKC3763HQy0hmuwcWNT=YdrOm2BQdb=+6fPBTPg@mail.gmail.com>
From:   Hsia-Jun Li <Randy.Li@synaptics.com>
In-Reply-To: <CAAFQd5DbnYmxKC3763HQy0hmuwcWNT=YdrOm2BQdb=+6fPBTPg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::12) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:EE_|BN8PR03MB4964:EE_
X-MS-Office365-Filtering-Correlation-Id: 47cc33f7-41bd-4aab-a48d-08db8f416cd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9E2bn7JovdYjPGd/KdicvoXM/hrT8QfxEDsuUcsqQDVLow0Yi6AkNF1Olky44WaiD3Th/64grppwHceouRSRlJxPm6sDtdtucQmvS7ZEwR0CaavovMM1AWiZT9kgbQXNrORqaL7zMqIt+2zoG+Jsg8JFHWvHp/Kw5Cs9BZoDP+zsIjQQFRAYmJ08StSk9qTaJnEPpG1PG+UfIDRWh5sOdDaubSM2Myk+ixF0ZFVgy1u966C+y8TRp4JLnc+GYaReJl22wPzoas9QrgxSzyXb1NlRYn7QZiEKkBDJMqHoGfKf+mGjyA56rPJbAIeSGiom7YW3RDa/KkAj3nGGMs3Bal7wOhldPcUucQotF0Dnbj7qboU45nT4+9vMi8TctfQqdIWrw7AyuSq7lA4dpHXZe18zzNqxe+9tcW4jNOt1ijDDZqVBIH5uQYGaAodJn59bMjgYtMJwD2CIUYjkXdpgtpDS8uoz8CsU5Vr2J8QsDWlFhWBGpb7oTX0nDR3yBuD4GPTuWYjBFC8IMLTHAemHkxxgjdbhIHvZsPmC4NkqzPkNGK+/FP4Y9+2TlGV4ou3bOXscq+hKmBnAqpkLygDMnJ3VN7bvLth63p91dMoTFHocBpaxXDOVuwPK7T/8rSHdwZ+ML5YogktlZBRFwNSIj/G1gxBeSfYtS9K1usgEOto=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5196.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39850400004)(366004)(136003)(346002)(376002)(451199021)(41300700001)(26005)(86362001)(66556008)(53546011)(38100700002)(478600001)(966005)(6512007)(4326008)(8676002)(6916009)(8936002)(36756003)(31696002)(186003)(316002)(66946007)(66476007)(31686004)(6506007)(5660300002)(38350700002)(7416002)(2616005)(83380400001)(66899021)(54906003)(6486002)(52116002)(6666004)(2906002)(30864003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDdwK25SZFp0RFMwRVF1MDYwOUZneFQxTzN6QitxeEhWMm1XZk5LUk9RTVFR?=
 =?utf-8?B?dURGTjdxNFkybExyb0dpWmZXWHhwcmJiQ1MzSGY0dEgzVGxQVnh4WENqbTdj?=
 =?utf-8?B?azhwU29YRkZWQ1Z4clRiekp6QlhMQnVrMTlGdFhrRmZtWEhKN1Nadko0M2Fh?=
 =?utf-8?B?Q0Iydnp4Y2FiK1FiR040NVRxdTdCeFJkM1E4NnJGMHI2c3lCc3hYVzFnOWFk?=
 =?utf-8?B?WnR2d0NFMUJZZGxpUDVrRW5iUnRlL2s0eFBveFg4WXl1RnQ2QnUvT0lhWURt?=
 =?utf-8?B?U1JTSWRodU1mRnFHUmJBOGhHWDVzdmIyUjVQdE1LdkdXTTBwZTJkVkpnVGN0?=
 =?utf-8?B?Rm1OTVZZbGJxVUdva2ZtWWNwS0J0SWlhZDFIdC96NkNGd1RQWlpjdndRRlUv?=
 =?utf-8?B?ZVlpaXRMT0NJVDlKN2Jvd2UySXZyV2I5NytzUnVEL1JWMjU0M013UHJuME12?=
 =?utf-8?B?YXJpbExwRTZuSWo1RnRVNm1xRlhRdENEQVJVYWJFK0dOeDBzdHd3ZnBQY3pD?=
 =?utf-8?B?NnZqOXRzZ2dPTHpTNkdXanNtak9LWU9leUlIaDFqeU5mYVh0QUk3cmFJK2xL?=
 =?utf-8?B?Si9GUVJ2T1c4dG12YzZLMEdWYlhTdjdIQ1F2dW1ONjA2ZGlEdHZCek1mVlpM?=
 =?utf-8?B?blVPR3BlQW5pYlhOMS9iTERyZkVyVzVybmRTWkxIeE1uMExPcG5KMThuaCs0?=
 =?utf-8?B?QWlLMUh4eVh5ZjhFQWxxNkhjTXdiRkRzdm9nVm9xcE9xa3FlOTJjOXB4dWN1?=
 =?utf-8?B?YU52QWFBQ2hMVlBjNWt0Q01JWCt3cTROeVFkMUVIblVjZ0NHWUJJUklOUmEw?=
 =?utf-8?B?RDFlSVlNRHR1TzhGWFJLZ2Y4SktoQ2F3ZllFeXdLeTlMR04vTmRWc3Q0OUQ3?=
 =?utf-8?B?K1d2cHl1aGdmYzJVRGsraTZaUGFiUlVnNTRYMHFMcnNaQm5xMUZXa0Y1bVpD?=
 =?utf-8?B?V2pVTUt5ZGtXTjhuZlpJWG9pbEZ3UzBTdFZtNlE2K3dVMTNrOG92S1dvbTN6?=
 =?utf-8?B?VGxoc0QyYVBFalI0SVpsbHVPbHVlNXpNNUg3VGtaRC9sQkpIRWlJRFJWalRD?=
 =?utf-8?B?ZEdDM29GWm41Y3ZCR2FpQmNEMytiOXJEdGJlYlIySU5EZU00b3I3dzd6bzRG?=
 =?utf-8?B?MVZDRGEySS8xUWd3d3lSbmFmajJXQ0FLdko2LzNpMlRQV0FrRFNYWE5Tek1M?=
 =?utf-8?B?NmtIQVYwT2VDdEhQczBLL29wWExIczRNZzlMZFlqbmlCMmNFdGMrQWF0S2Fh?=
 =?utf-8?B?S2tzSTExc1RoaWpIUTU4TDM0cHQybndCSnduRzYvUU1DbWlIYWYxUHQrajZL?=
 =?utf-8?B?bGdkOElncm4yUzBUS2dKZHZFUGdxdE8rRE9WVmFuZEp6VFBWbFZ0MDZYdUR6?=
 =?utf-8?B?bCtqVUE2cDRJV1dpV2pOYkN1QnRqTkZjUmtScHdZNkM1dzIwN3IxL1M5UFZX?=
 =?utf-8?B?OC85TUNOQTl4QkxQcmtMMEdUa2hVMk1QQ0haYlJVZ0xpS093VVljRVd5YTZa?=
 =?utf-8?B?NXVGQnViNkl5OURxSWxVSnd6TlAraWttaXMxMmkydVFBbVBGMlBpOVBQMEd3?=
 =?utf-8?B?VXZIV3NGWmw1Zk1aeHk5QWdhVUgxbm04alUra3VaalhvRUtmamJFWlBsZ2Fk?=
 =?utf-8?B?TGZzVVJseTlrSlpaMDRtK3RRWW1VSHJnZWVCSlNuamozbSs1My92WTFLQlpV?=
 =?utf-8?B?bjJsRDNBb0VqWldXNlZGOXRTc3lSYWlqMTdFOVpUcEhGcUp2NXBybiswT0d4?=
 =?utf-8?B?SzN1NDFBbEpvUm4weVNnOGl0YjFMWURoY3BER0MyUWRkZGsrYklCZWdLeUtj?=
 =?utf-8?B?ZHRBUUN5V0c2L1lsQ24vTU1pdEx0K0F4dVFVVlBmbzZvYzUydzlMTHZ4TlRi?=
 =?utf-8?B?UTBLM2VxNStOUXdYc3NYOGI5dnJHM29nUG92K3FKTDNLckUzNGx5MHczZlNU?=
 =?utf-8?B?ais0QktLbUVNcGVsZkJLR2N0NE4zbmhkejRkclBNSmdqSVZmSTlMdllYR3gr?=
 =?utf-8?B?UFJ4dENKNEdYRVVrL0hUZGxsbHM4UVRDYVFFV2tNK3pPUnJzcXBCWUNON2dC?=
 =?utf-8?B?a2pIaEEzTDhxZWtrT3BlNGpMbFZpTUNmZFBhaDR3UzV3YzhZaXUvMUhGSGdY?=
 =?utf-8?Q?GDNEmFuXPJIClkSGsFdRYlF/f?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47cc33f7-41bd-4aab-a48d-08db8f416cd0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 08:05:36.5737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dSrWMnfpfpJtZwkF1zW9Kmg2SjOoKKdeILlq19aSKiXkHpMpNU3OJBYNHoQTLjXnlyF7e1elxsmOko49zx3YNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4964
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/28/23 14:23, Tomasz Figa wrote:
> CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> On Thu, Jul 27, 2023 at 7:10 PM Hsia-Jun Li <Randy.Li@synaptics.com> wrote:
>>
>>
>>
>> On 7/27/23 17:07, Tomasz Figa wrote:
>>> CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
>>>
>>>
>>> On Tue, Jul 4, 2023 at 5:41 PM Hsia-Jun Li <Randy.Li@synaptics.com> wrote:
>>>>
>>>> Hello All
>>>>
>>>> This RFC will address the problem that some ioctl() commands would be
>>>> called many times until that command got all the all its entries. Those
>>>> ioctl() command are:
>>>>
>>>> - VIDIOC_ENUM_FMT
>>>>
>>>> - VIDIOC_QUERYCTRL
>>>>
>>>> - VIDIOC_ENUMSTD and VIDIOC_SUBDEV_ENUMSTD
>>>>
>>>> Generally speaking, all enumeration type commands would lead to
>>>> frequently context switch between userspace  and kernel space. A few
>>>> enumeration commands listed below may not meet this problem in some
>>>> cases, as they could present their entries in a step wise way.
>>>>
>>>> - VIDIOC_ENUM_FRAMESIZES
>>>>
>>>> - VIDIOC_ENUM_FRAMEINTERVALS
>>>>
>>>
>>> Right, it's something that often comes in conversations with user
>>> space developers on how it's difficult to query information from V4L2.
>>> That said, we've mostly found it as an annoyance rather than a
>>> practical problem. Do you have some specific case where the current
>>> approach of enumeration causes a problem for the application (e.g.
>>> performance)?
>>>
>> I have to admit the performance is not a problem for enumeration of
>> pixel formats. We only do that in the setup step.
>>
>> The original problem before ext_pixel_format is enumeration of the
>> colorspace, 12 variant of colorimetries for a pixel format.
>>
>> After we began to disccus the v4l2 ext APIs, I want to remove the
>> barrier that we can't update the v4l2 uAPI easily under the size limitation.
>>>>
>>>> A simple solution that we could bring and improve from DRM is the blob
>>>> object(struct drm_property_blob).
>>>>
>>>> We could extend the existing ioctl() in this way:
>>>>
>>>> 1. VIDIOC_ENUM_EXT_FMT would turn a blob id and the memory size
>>>> requirement that usespace should prepare
>>>>
>>>> for storing.
>>>>
>>>> 2. Appication call VIDIOC_GETPROPBLOB with blob id and a userspace
>>>> pointer which should be enough for storing.
>>>>
>>>> 3. V4L2 framework fill the that userptr with context likes this:
>>>>
>>>> struct v4l2_blob_prop {
>>>>
>>>> __u32 version;
>>>>
>>>> __u32 payload_size;
>>>>
>>>> __u32 payload[];
>>>>
>>>> };
>>>>
>>>> 4. The parsing of payload would depend on its version which
>>>> v4l2_blob_prop.version says, and each entry in the payload could be
>>>> variable length, likes this:
>>>>
>>>> struct v4l2_ext_pix_mod_desc {
>>>>
>>>> __u64 modifier;
>>>>
>>>> __u64 allocate_hints; /* heap flags shard by DMA-heap */
>>>>
>>>> __u32 num_of_planes;
>>>>
>>>> __u32 plane_sizes[8];
>>>>
>>>> __u32 colorimetry_flags;
>>>>
>>>> };
>>>>
>>>> struct v4l2_ext_pix_desc {
>>>>
>>>> __u32 fourcc;
>>>>
>>>> __u32 num_of_modifies;
>>>>
>>>> struct v4l2_ext_pix_mod_desc[];
>>>>
>>>> };
>>>>
>>>
>>> Since I'm not familiar with the DRM blob approach it might be an
>>> obvious thing, but what happens when the application was written when
>> DRM doesn't have such design about API version.
>>> let's say the version was 3, but the kernel it's running on now was
>>> upgraded to version 4?
>>>
>> Nope, the API version is not selected by the userspace but kernel.
>> It is something likes the protocol version in wayland.
>>
>> We would careful make a version of API but we don't not take the
>> responsibility for the back-compatible for the application.
> 
> I hope Linus is not seeing this. Linux UAPI backwards compatibility is
> a hard guarantee and it's stated multiple times in the kernel
> documentation, for example:
> 
> https://urldefense.proofpoint.com/v2/url?u=https-3A__www.kernel.org_doc_html_latest_process_4.Coding.html-23regressions&d=DwIFaQ&c=7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=P4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=j-KHqunPsFSon38RJcUfONx4RnFtWuIrHQz2FBzE0DonOxTnr2Z3rbIwjD6TCY0B&s=8LzYkGbuPdoo6WHcK34USQs_FQxzNdCXEUUAn4GtUTE&e=
> 
> I would be really surprised if DRM was an exception. Let me add
What I said is "DRM doesn't have such design about API version"
At least, there is EGL, they offer many definations for a variable's 
range. We don't have such good thing(People can't count thing like 
OpenMAX IL ,nor vulkan or VA-API).

Why we could support multiple API version of structure in the userspace.
What I thought is that, maintainers would review careful for a version 
of structure. While if we really need to expand the structure, we don't 
need a new ioctl.
Also there is a door for the vendor driver if they want to have their 
own in their product.
> +Daniel Vetter as my source of truth regarding the DRM UAPI.
> 
>>>>
>>>> In this design, we could avoid the problem that we could hardly extend
>>>> our uAPI for V4L2, all the structure must be a fixed size.
>>>>
>>>> Here are some options design that people want for this RFC:
>>>>
>>>> 1. Do we need to call the ioctl() command itself(likes
>>>> VIDIOC_ENUM_EXT_FMT) which let the driver to flush its internal property
>>>> cache or calling VIDIOC_GETPROPBLOB is enough?
>>>
>>> Wouldn't the former make it thread-unsafe?
>>>
>> Why we need thread safe here? V4L2 don't offer such thing.
> 
> That's not really true. What is your statement based on?
> 
I want to know when you poll a device that let you dqbuf a buffer. While 
only one buffer is in the done queue. Which thread would get the buffer 
while two threads are triggered to do the dqbuf?
> All V4L2 drivers need to allow calling their ioctls from different
> threads - in the simplest case by serializing them. Any call to a V4L2
> ioctl must return a consistent result. In your case, one thread would
> call VIDIOC_ENUM_EXT_FMT, another could then call VIDIOC_ENUM_EXT_CTRL
> and then if the first one calls VIDIOC_GETPROPBLOB it would get
> results for something completely different than originally requested.
> 
> Arguably, the current design of enumerations is not thread-safe
> either, because one thread could read supported formats from 0 to n,
> then another thread could change some other state of the device and
> then the first thread would get potentially different results for
> formats n+1 to N. That is a design problem of the API, though. Nobody
> was expecting that the list of formats would ever change due to some
> potentially unrelated state change when the API was being designed.
> (Although that's addressed today by the SRC_FMT change event, making
> the user space re-read the destination formats when it notices it.)
You could regard getting blob id and filling the buffer as a critical 
section.
If you did some to trigger the hardware which would update the driver 
state, nobody promise the control you were accessing would be the latest 
value.
> 
>>> I'd imagine something like this:
>>>
>>> struct v4l2_property_array {
>>>           __u32 version; // Could be equal to the length of the struct
>>>
>> It should not be. version means the structure of the payload.
>>>           void __user *buf;
>>>           __u32 len;
>>>
>>>           __u32 num_formats;
>>>           __u32 num_frame_sizes;
>>>           __u32 num_modifiers;
>>>           __u32 num_controls;
>>>           __u32 num_menus;
>>>
>>>          // More fields could be added here for more types of
>>> information to query, with next versions, which could be ignored by
>>> old userspace.
>> You know what this buffer for(the property that you want) before this
>> step. That is not necessary to have a union reporting the items in the
>> payload.
>> A struct(or an item) in the payload(many items) itself could have a
>> variable array. How many items in the payload may not help on parsing
>> for the userspace.
> 
> They don't have to have variable arrays if designed as such. Instead of having
> 
> struct v4l2_ext_pix_mod_desc modifiers[];
> __u32 num_modifiers;
> 
I prefer
{
__u32 fourcc;
...
__u32 num_modifiers;
__u64 modifiers[];
}
That is what DRM does. While that could be the layout of the payload. 
Not the property buffer's head.
> in struct v4l2_ext_pix_desc, we can have the struct representing a
> supported modifier refer to a pixel format by its fourcc. Sure, the
> drawback would be repeating the same information for every <modifier,
> fourcc> pair in the rest of the struct, but at least we don't need to
> have variable arrays. Another approach would be to have an additional
> association array of only <fourcc, modifier> pairs, like in databases.
> 
The format in DRM would be like:
num_mod_pairs
<modifier, mask>[]
num_pixel_fmts
format[]
The mask for a modifier would tell which format support this modifier.
But I don't like that.
Because usaually RGB pixel formats would have only a few modifiers which 
is supported by the GPU.
YUV could have more cache hints or allocation requirements.
And video codec hardware wouldn't support so many pixel formats like DRM 
does.
> My main goal is to make it possible to keep backwards compatibility of
> returned data, as per the kernel UAPI development guidelines, with a
Usually those command structure for pixel description or buffer 
operation would not change once we settle.
Their layout is not that complex or know to something, maintainer could 
update them easily.
We still have the legacy of V4L1, such update won't cause the fragement 
in drivers. We could even put a new version of API in stagging for a 
while then apply it globally.
> reasonable amount of effort and without complicating user space
> programming too much. That said, we may still need to have some kind
> of size variability in the structs, because otherwise we wouldn't be
> able to extend them in the future with more fields, so my proposal
> wouldn't work either. Need to think about it for a moment.
> 
>>> };
>>>
>>> If out_buf is NULL, the kernel fills len and num_* fields and returns.
>>> Then the userspace allocates a big enough buffer and calls the ioctl
>>> again with buf != NULL, which fills in the buffer pointed by buf as
>>> below.
>>>
>> The maximum requirement size would be confirmed at the first step, a
>> ioctl() likes VIDIOC_ENUM_EXT_FMT.
>>> {
>>>           (struct v4l2_ext_format[]) {
>>>                  [0] = { ... },
>>>                  [num_formats - 1] = { ... }
>>>           }
>>>           (struct v4l2_frame_size[]) {
>>>                   [0] = { ... },
>>>                   [num_frame_sizes - 1] = { ... }
>>>           }
>>>           // [...]
>>>           (struct v4l2_ctrl_menu[]) {
>>>                   [0] = { ... },
>>>                   [num_menus - 1] = { ... }
>>>           }
>>> }
>>>
>>> I think we could also let the user space fill in the version and num_
>>> (presumably with 0) to control what information it wants the kernel to
>>> return.
>>>
>>>>
>>>> 2. Should we make MC node support this feature only or standard video
>>>> node could? A thought from pinchartl is that every driver should have a
>>>> MC node even for the stateful driver.
>>>>
>>>
>>> The futuristic model that we envisioned back in time would be that
>>> there is a media device that gives the user space ability to perform
>>> operations on all the interfaces of the respective media controller
>>> (or even all interfaces in the system - but that would require some
>>> security considerations). In such a model, the userspace could prepare
>>> an array (or blob if you prefer) of operations, where each operation
>>> refers to an interface entity ID on which to execute the operation. It
>>> would allow us to submit complete requests (or even many of them) in a
>>> single ioctl, reducing the overhead significantly.
>>>
>>> That said, it would be a complete overhaul of the API, so it might be
>>> a step too big? Not sure. We certainly could benefit from V4L3. ;)
>>>
>> I thought of that. But I try to convince people those are not a big
>> change but essential.
> 
> Overhauling the entire querying side of the API is already quite a big
> change. It shouldn't really matter if the change is small and big,
> assuming a good enough justification is there (and the change meets
> the kernel development requirements).
> 
>>>>
>>>> The implementation of RFC could be a foundation for ext pixel and ext
>>>> buffer APIs. I would like to know your feedback before we settle the
>>>> problem with the ext pixel format.
>>>
>>> I feel like this kind of batch operation would be more important for
>>> buffer management, because it could allow dequeuing multiple buffers
>>> in one ioctl, which is actually something that is starting to show up
>>> as a real performance bottleneck for complex devices, such as ISPsI think I make it for MC node from the idea of Pinchart.
>>> (We have a MediaTek ISP that has a really big number of DMA engines,
>>> which accounts to about 200 DQBUFs per frame. Let me add +Yunke Cao
>> I need to know how it happens.
> 
> I can't share the exact details, but basically it's an ISP, so it has
> multiple different processing blocks that have their own inputs and
> outputs. They can then be relatively freely arranged into a processing
> pipeline.
> 
>>> who's been looking into what performance effects it has and how we
>>> could improve it.)
>>>
>> We need to hurry up on settling the design of m2m or v4l2 framework.
> 
> Hurry is the biggest foe of API design. ;)
> The last thing we want is an API that we'll have to replace again in a
> few quarters.
> I agree that we need to have people mobilized and invest more time
> into modernizing the API, though.
> 
>> We meet the fourcc namespace problem at least 5 years ago, but we still
>> didn't fix it.
> 
> What's the problem with the fourcc namespace?
> 
> Best regards,
> Tomasz

-- 
Hsia-Jun(Randy) Li
