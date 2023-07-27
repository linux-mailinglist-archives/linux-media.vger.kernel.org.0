Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15D77764FF0
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 11:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234071AbjG0Jhp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 05:37:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234020AbjG0JhZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 05:37:25 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90CBB49D1
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 02:31:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5L4wYXdD4BCOkw3gStG1XHVqZcQvc250a7/SRZcNEY82m4XXxnjh6xvYuinkmSrXEnhGWiwRCMAXFLGHY1M5kHW/sOi2nkmbj/EVwOsryy78PvFLnb2m5ACH3by8H+7oTmOspCJ056l0GyOmmtsPhmvQsM0lhhz3Gt0Io2C8mGppNoDNX5Vm6hUl4AubC5HZgpaMlAV5SLJKep2Rs5qV4cXQaqYgLWQe3Uy2cVwNmCwOWyZoGxqFDRq3Ms46JOsakvjbes2HJYMzOci+6nLj47NTHUYF4HEU5B1qJFbWu1OM/ugwI7yp873kZRd6EOS10uM6PUnUn5g3UQfMzFm2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5+ex/36QNSghPxaP7hOIG9UN4ucFWGkrA3+8gJjiUc=;
 b=QkfnjcAsplAUevFnVapznWpN4aivGTBiWCP5kSym4jmFmoXiRdP0ITC0l/dqdgMBk+ZP1W0LywpZJ8MACKfAYCv7ZUZ5aIJRcuNsoIgcqMU5ud0Uq1teQ7HUd59nCJCi6EJWWFiWGwDZPgnlqI/9IcjuB8kraQAs2LloqljfgbGdLicE0e5Sy5Wva0GLz4kVZqkqIFNsVLzdS1XudOUjCk3Qj9VzzjyFEBO0GaOmz+cQvt4SDR/DhHfZOL1b/fSQXvULt/+tcpzEa3Xc+GZ+sd1Kb9A3Dlu3DQTOH1xu/b44w0DpoQi5uFxQYq1OXZwFXo3JzanKLDeAN2TDr5/VjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5+ex/36QNSghPxaP7hOIG9UN4ucFWGkrA3+8gJjiUc=;
 b=cAzh2DzRlAU/ebunA06dvOtfUQHLrDqCrbPcvcwvCfN2Rvu8TgrFluP8wRaoLLaxCfm+kO+Ubb81xzEWsMXdxtoHU5TzDTe6lWFJi2rz9OZ68+QLUDlDPPSbeJ3sSyD1bzmYfUriatSYWjECH8qKy25HN/pMW2JdP89kUujMqQo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by PH0PR03MB6954.namprd03.prod.outlook.com (2603:10b6:510:171::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 09:31:16 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::411c:e486:3837:cc25]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::411c:e486:3837:cc25%3]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 09:31:09 +0000
Message-ID: <64164c3e-6316-fd8e-793f-6f8b3ec18105@synaptics.com>
Date:   Thu, 27 Jul 2023 17:30:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC]: m2m dec reports the graphics memory requirement
Content-Language: en-GB
To:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        ayaka <ayaka@soulik.info>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, Brian.Starkey@arm.com,
        boris.brezillon@collabora.com, frkoenig@chromium.org,
        hans.verkuil@cisco.com, hiroh@chromium.org,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Helen Koike <helen.koike@collabora.com>
References: <a2ffa1cb-42db-a78a-8bd7-b0e422aade13@synaptics.com>
 <CAAFQd5AFJwreERs2Hn_A+3g51OLF6F0eWjx2+rgiZV=FR_61fA@mail.gmail.com>
From:   Hsia-Jun Li <Randy.Li@synaptics.com>
In-Reply-To: <CAAFQd5AFJwreERs2Hn_A+3g51OLF6F0eWjx2+rgiZV=FR_61fA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR10CA0007.namprd10.prod.outlook.com
 (2603:10b6:510:23d::7) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:EE_|PH0PR03MB6954:EE_
X-MS-Office365-Filtering-Correlation-Id: 07250e43-9a52-4459-dc65-08db8e8435d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: luQ2Xm2B2m8zz8E7RlX2MXENLWlwaCkfJScRxYNPXKDITzRdD3z/rEjVVOTlIop448lNbJwv4NcjJ1N3u7en99EihR6gHruLMPedy9saLzgOHxgTDb8+21/1wEVwNT2mwnlXjJzOfOvIS9y1a6mETslcc1CnZ8V68LU/Cq3GhDthehjRV7YMC6eR6pxxFf/wPRhOeCRuPcxU4Tqr+Fbg+MpmcEHQkUJNXnXhG6yKbAHGEWuPO4goboGNFQ8jZdP3igw5lypl3/u06PzA6TYgZ5w/+BpRsLuM0t2rIGXNE8MDmfYbs9Rg3Q9LEttZ9+E1qfBNgrzckAAtCW2fhMXh8wswkKMPiX+7X6aP6aCry6Kho0R3GaB4cQS0yfd/foKc/O9Zpqgbn3CSDPMumpxF5W2wQiKjRhyh+46q0z9/VkBpugRxC2GYoBh7KWo/Q2qMjWg8Ss906fDeTBt2R1267azpM3wWFuhEDNFUvgNu6VjW5kg+tZVVONXfzf8+9bTh5wcQpLO73ohaxvM8ThLH4vSYk/QQGRcQeF9cCVGXbTTuTHiNCO0cAEHtTwSxzIs18XncFQNlRh0eTUOl0bakpKcoz8yT6TfEx2w5E5RFjjpASxd6N/DKQ3F30unO0wgz68wy3XirGAhpyRbUw8gOqRyFXWgAyfQ3aL7Cytz1vTYDtzAlCYOmDFNOMk4JGuYD
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5196.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39850400004)(366004)(396003)(346002)(136003)(451199021)(26005)(41300700001)(186003)(53546011)(4326008)(316002)(6506007)(2906002)(83380400001)(36756003)(5660300002)(7416002)(8676002)(8936002)(2616005)(52116002)(6486002)(6512007)(6666004)(54906003)(86362001)(31696002)(31686004)(110136005)(478600001)(38100700002)(66556008)(66476007)(66946007)(38350700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmIwbnIrbm9LZEExeEI0WE8xOEhSL3paTkx0aWVScmdieWhwVEVMK2FpWlds?=
 =?utf-8?B?Z2JIamdJLzcxLzNsSCtWaG5SeWNUaGUzcVJvRlFpQ0F2QXM2NEt6bGRSNnNp?=
 =?utf-8?B?cFpVblMyNUo1NUVKa0tFUnM4cC8wSksxUXM3NnhNVlNwb1hsR0ozdlZKMFdP?=
 =?utf-8?B?NkZkbFBXWkx0YXcxU1BURU9WSHJOMHRsOFh6R2lGRFJxTWNUU0h5TFFMOE96?=
 =?utf-8?B?aHI3Um8yc29sU3ZlNHA4SS9DRXFvSjJlTjZFT1Fwa1l5SENtc2JJRWFxMWpF?=
 =?utf-8?B?dGF2c2hQb2t2bW5XZ3VtT0Zla0ZBUkM3ZXJFN25oQ2Q0cTJpQlFFeGM2R3Ax?=
 =?utf-8?B?ZlA1Vm9rOEtwbThzYTFRWlZUZDFkREdDTGpPdzd5NFdudUpxWjA4VHE3TWYx?=
 =?utf-8?B?ZTVERG1oYkpPZm5MQ3RZTTRrUkhmS3ppa1FvcHVmanNoSUJZUEFFUGRhSVBC?=
 =?utf-8?B?WCszeXBudUcrV2VpbjQzTGxqUnhXNWR1SUk5Ym44WGFxdzlXWTJaQTZNOGxw?=
 =?utf-8?B?aW9WNTZXcy9Ba21Rci81Ui93VjZzcVJhbGZhdUVKYnZOczVER0liRW9kTUMy?=
 =?utf-8?B?NSttWlJ0T3V4aytwbk5tM2lpckNuT0kyb1hOY2h3UElwV3N5bGFNTmhQNkY4?=
 =?utf-8?B?NTgxcnYrM1h0dE5nK0F1dkV2MjJFTEUyMlpwUjl0WGlCQ2VnekpzVnZCMmZ2?=
 =?utf-8?B?N1pHMTBoOFVwNTlTOUx1dDZOZjVqcDFPamw2SVRTRXlRT2t5Mm96bWNDNCtH?=
 =?utf-8?B?MnExR3NyN0d0Rk5WR2d6TzBodUI4WWZZZUJ6bk82Z1B3Y3VwNWZobFBFczEy?=
 =?utf-8?B?NGZISWJ4VnlrYmhYWkd5YXFEb3NRVzIraTN6dmlHK1NrYU92MEI2azExV3R5?=
 =?utf-8?B?c0RIMVVWNGZhRzVzL1RRcnFZYXRmcktOWnU2YngyN01wT1dPbUN0L0l0RExD?=
 =?utf-8?B?K0J3a1VSMk5IOWR1NExOQmxETUs2V1ZDd0lXZDZzUytEd1pPWlA3dkk2Mis4?=
 =?utf-8?B?UThtWEVxaWs2WjBIMlJrY0JpZ0pPT2ZMcEVXd2FFTlhSTmp6eXFMcFlneS9F?=
 =?utf-8?B?a1hRc3JTRm9FZkV2cGMxSWlSSXdSd0ZBVDdPSWlOa3F6YXJxL1pydndid2VO?=
 =?utf-8?B?UEdzakpsekJYNkNrcmpHMjMyYjZheVdVTTRid1RTZmVOZThxWHUxMGZPRjJl?=
 =?utf-8?B?TW82VDFjT0k1bDI3d0dHaFJzR2tVNVEwMTZVQ3ZpN1JZMHhwd3E5OUZwa2hN?=
 =?utf-8?B?dXAwazhkemRzOE53dzBodlpTeUFXN25YV3Iyb1p4anRyNllWaGwwaUhWNkVM?=
 =?utf-8?B?MklSS2ZzdUQ2KzRqU0pwdFBFUU5pSVlWaGhYRlBIdVJZRlRydEwxVGx1WUM3?=
 =?utf-8?B?Z3lWTzhXeXFMUFJSWjFSYWIvY3JVcWJiOVh2dytwNUNHSkZ0ZGg2TFVBQ2hq?=
 =?utf-8?B?bVFUQ2gwQkw0V05keVNJQ0g4Ky9IdlJLNjBadmFSRmVHbDdHaHkrdW5zOHZi?=
 =?utf-8?B?Ym0zTUtXK0FkSHB2UUxGV2lwQWRNZk5BNVJsMzl3R2dDc3pIcS8rRlRZRG1T?=
 =?utf-8?B?WWZoOThJdHkzS0tmTys4ZlJtUUU3T2pNM2N2SGZ1aXZ6bFdMVWx2TW15UU1Y?=
 =?utf-8?B?L0ZBdTZua3ZzTi9MenZCL1ordlVlTDBSV0RMSFora0dLNFJycHVSSG5td0ZU?=
 =?utf-8?B?TysrVExyc3lybGJOeEZ0OWRXbmY4azg5VGx3ZGliWVgzYjJXZmlQVVc1Q094?=
 =?utf-8?B?ZjdZK2t4dVBsWHBacnZUOE5JQUt2c0UvWUJSeDBLZFNUaFhEd2UxMTlYWG9v?=
 =?utf-8?B?YXlSZXZtaDI3WkJybXRRTlplQ014Wlp3bU9ZWWM4VXN3K3gwbkFGMWtCQ2J2?=
 =?utf-8?B?Q3N6cURJVlZMMnVEcUs1RGVyOW9PUDlTUXpxN3NSOEZjQ09tMm1VZjBnRXl3?=
 =?utf-8?B?eVpYd28vWUx5MUIxNWdyb1M3L0ZYdmtRVnNwL3h0UHc1Q216bzd1VS9nbmxv?=
 =?utf-8?B?TWRZeHhTL29jM0s4cVVIV0RhMFA2MS9jU2lzUmFSekE0dEpYTW1YRUZ5NERl?=
 =?utf-8?B?djlyZW93UEJhVGpta3EvQnpFTHFQdFQ3QThXS2VuSyt1cmNSUDF6aTA0bGFC?=
 =?utf-8?Q?eR/eebkIudk7nrlTPTQjkQZL6?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07250e43-9a52-4459-dc65-08db8e8435d9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 09:31:09.4724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qNbRjbdLQieCqAGhGE56HDw0HLLZOjF/FoHtasP7OQ1wtcJxzCZ78JT+FzZdq0KTiPn4bgwF8IGz06ltSXjE2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6954
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/27/23 16:17, Tomasz Figa wrote:
> CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> On Fri, Jun 30, 2023 at 7:47 PM Hsia-Jun Li <Randy.Li@synaptics.com> wrote:
>>
>> Hello All
>>
>> This RFC tries to address the following problems:
>>
>> 1. Application may request too many buffers, increasing pressure to
>> system's memory allocator(Thinking about running Android with 8K UHD
>> playback in a system with only 2 GiB memory available);
>>
> 
> Yeah, I think that's something that has to be addressed. It was also
> mentioned recently in the review of the DELETE_BUF series. I think we
> need some kind of accounting of the allocations to the processes, so
> that the per-process limits of memory usage could apply. Let me add
> +Sergey Senozhatsky who often crosses his path with kernel memory
> management.
> 
>> 2. Application may allocate too few buffers while the codec stream
>> didn't follow the statement in its sequence info;
> 
> Isn't that just an error? I think generally a stateful decoder
> shouldn't allow allocating less buffers than required by the stream
> (and as reported by V4L2_CID_MIN_BUFFERS_FOR_CAPTURE).
> 
As I said, it is sequence info. The dpb depth requirement that sps 
reports may not be correct when we are decoding the furture slice.
>>
>> 3. Application would allocate all the graphics buffers in a large size
>> meeting the decoding requirement, while only few alternative ref(never
>> display) frame requests that;
> 
> Could you explain when that could happen in practice?
> 
That is what google codecs(VP8, VP9, VP10 aka. AV1) like, golden frame 
or alternative reference. It is a frame that would never(altref is) in 
the display order. But it would be used for inter prediction. The most 
case for altref that it would be a higher resolution(or just less 
compression ratio) frame.
>>
>> 4. ioctl() G_FMT may need to reflex a format which far from the current
>> sequence, or we can't know the resolution change result at an early stage;
> 
> Could you elaborate on this problem?
> 
> As per the stateful decoder specification "Any client query issued
> after the decoder queues the event will return values applying to the
> stream after the resolution change, including queue formats, selection
> rectangles and controls.", which means that as soon as the decoder
> gets a frame that has different buffer requirements, it will update
> the format and notify the user space.
> 
This may not be a major problem.
For example you pushed 10 (0..9) OUTPUT(bitstream) buffers, resolution 
change(or just a new seq with the same resolution and buffer size) may 
happen in index 9(let call it seq 1), but hardware and driver could 
decide to raise this event at early stage(it would be pretty fast to 
know that, firmware could parse slice header very fast) While:
1. Colorspace may changes during decoding(SEI Colour remapping) before 
where the LAST buffer of the seq 0.
2. Display orientation or cropping may changes during decoding(still, it 
is a part of SEI).

Although the second case sounds like a post-process problem but our 
framework currently hiding them. Also we have known many display device 
doesn't support rotation for YUV pixel format's buffer.
>>
>>
>> A few solutions here:
>>
>> 1. Extend the struct v4l2_event_src_change in struct v4l2_event with the
>> graphics pixel format(break uAPI)
>>
> 
> We can't break uAPI, but I guess we could add a new event that
> replaces the old one, In addition to a pixel format (and I guess the
> number of buffers needed?), we would also need the buffer index or
> some kind of timestamp to make it possible for the user space to
> correlate the event with the action that triggered it.
> 
> But I fear that we would need to keep extending and extending the
> struct with more data every once and a while.
> 
What is why I post a RFC for DRM blob style property in V4L2.
We could easily tell client which version of API that is when we return 
that to them.
>> 2. Getting controls after the SRC_CHG event, struct v4l2_event need to
>> tell how many controls it needs to fetch.
>>
> 
> What do you mean by "how many controls"?
> 
A control for a pixel format with requirement number.
For example, AV1 could report we need a large buffer for the altref, 8 
for general frame, and 2 for film gain post-processed.
>> 3. struct v4l2_ext_buffer for such out-of-band data.
>>
> 
> It's similar to the event, this could end up with an ever growing struct.
> 
> If we need to understand the state of the codec for a specific frame,
> I think it's exactly what the request API was designed for. It
> captures the control state for each request, so we can read the
> format, number of buffers needed and whatever we want for the result
> of any given decoding request.
> 
I don't mind if we could use request_fd instead of event.
The only problem is not every capture buffer would need this.
>>
>> Sorry for making it html before
>>
>> --
>> Hsia-Jun(Randy) Li
>>

-- 
Hsia-Jun(Randy) Li
