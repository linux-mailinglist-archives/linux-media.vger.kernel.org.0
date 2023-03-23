Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C10EA6C6675
	for <lists+linux-media@lfdr.de>; Thu, 23 Mar 2023 12:24:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbjCWLY4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Mar 2023 07:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231166AbjCWLYz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Mar 2023 07:24:55 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 810C71A4BF
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 04:24:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBQUKlFxqF9EWQLbctByEp0fVROoQuxz7gqddxoHfA1FDJdCrYOyKbG3SJXq19q85gKlzPehp4TfTg9/CsHO6s8AsaHjT9EmMGljZ+aPuYZFV/VLl6ItA+Yk2kFsRae5PQQFXRNriNFIZ2XEG4piwPTaqKyzt5YJsUkivHWOcuhv/egMhWFHWeGWvGMY0feGOq3yx839uvtRhXL8rnXImbG6vNK/fbkRfhw7565/jP+c1LT+5FZg6BIawPrJBOU1OWrjv6TRTEvXgfkeAgDyiVR7PRM1NIthGalM8EO3JgM7S2pJhMmAQc5jy4kW2qd0e++qVaohwM6od0gmDJOLfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5AVmjIKkABW9CbH2nLVWr/+IKzxhJ2iho0nTW4Sb9Y=;
 b=fopZze76svVXPStLI39J31/4JPvgDwBeH+ir3V4tGKz3lGkrAVj10P2rl1UOUtx37QBuqpRHij+OR5RsV51atXvmg2qk3Wp4/mRkvgdM0/w/YcDWdB/l8gK40O8S8udygbNeLj7qbh5jRi2m6WMo0zg/Bq2JMYVzO3qYDg+ZozCmUI/qeoXlw7kRsuv3hf6P0v6JW+0lsDrECD4SQGbFoMSA0TKxyJLgKri2NDmDKwfU1hC8t33FWsMtAdTj6/Os4RiI1hsL6wr0ubrDNNGe+jM8haLFL08zGhP6NmK6RdWOtAqsWfYV711QsKp+o4Sn61AP8E51t1cQRtHv5hK/ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5AVmjIKkABW9CbH2nLVWr/+IKzxhJ2iho0nTW4Sb9Y=;
 b=mEEK3qOvVnTizUtpb8KUDTEDOoOeAQeLFf9gQbZppp80wunysp97c748H0s6VLZaZZNEa7d3vP/rYfiLHW/l+oPjbBTkwOn0TCQJOF97U602L6qBIHU7Kx37uOB3qH0zlX9LRwfb0pOQPqr9SJjezMkb4QRCTJUfbxOif99uJyY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by MW4PR03MB6523.namprd03.prod.outlook.com (2603:10b6:303:126::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Thu, 23 Mar
 2023 11:24:50 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::96e3:3428:3a5b:5872]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::96e3:3428:3a5b:5872%8]) with mapi id 15.20.6178.037; Thu, 23 Mar 2023
 11:24:49 +0000
Message-ID: <2776488c-86c7-04be-687c-e7fd6cf0f531@synaptics.com>
Date:   Thu, 23 Mar 2023 19:24:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [ANN] Request for Topics for a Media Summit June 26th
Content-Language: en-GB
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Randy Li <ayaka@soulik.info>, Hans Verkuil <hverkuil@xs4all.nl>
References: <893a7e34-1d98-23e2-4d27-d25cb3ee5bf0@xs4all.nl>
 <903bff4c-ed0a-4b23-e9c6-8224da0b1216@xs4all.nl>
From:   Hsia-Jun Li <Randy.Li@synaptics.com>
In-Reply-To: <903bff4c-ed0a-4b23-e9c6-8224da0b1216@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::17) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:EE_|MW4PR03MB6523:EE_
X-MS-Office365-Filtering-Correlation-Id: e4982017-e43f-43b5-d1cb-08db2b9136fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HJlXy4Xbf0iOOtgdCC1QDNpd4kAoKpEJ3XGLySvOR5JpmIRy3Z3H9G/wG5CYGg8F206fN+mRskmSktntuxl5yio6VXqzT8XssHOkYLIQN7S+wIML4RcDAyl+49k/FCF1T2Qv5TaubdDS9x3of11wbze3MB+w96YNtyNFzHlJMZJ3uIcpFkVufXAhAr8ip1YPE254RHMkNxyada4GfSzLTFF0jw1zz8LXJnMbuqbuVfSbbCjaIPkIz4tTpL8pwM0xp1nm9EzR/126aezAnF4mfrFNFMayII+nttJfc7wLGZpZYiIcs+ZABvRqCTE1YcLYcI7niiu/yulmgHBoUEoO/2SmRYsoriLVO1LlPqQ7zDieDRaLoXaJCVfCe4ATmFMUeNp08ThCBmqd3lXsvukaTWdEq6Xe49SQKBd9GJfDvEZHYJg4tKDk/Um+wimJ29QoWEr4n1I3bnHaEU03Fwc5Keu8MAFVoAFhXJPA8faB4IwrdOxKISUsBC+Sx12Cam+K3El+r9t9EmuwmMgz05fwww3fSIsW0RQvUresh1sJmL4krNgsx4fVq0dh297/TNX9C/nhn9ydc9NE5ffQ8pddrji0ZKtMl406MyPR9TgB3UU0pk3Novg0z+w/yj09CQGjbka5RTNEfCOJbnhVUOlvf8zcjSIKBhknVbk0ih5jJEv0Hgzh6YmgJ+MmymSeXjHUB/qvRSD3eMqqiviahNbKj+Yib8UpTdzc+ptfYvX22dCTekcf+/K4+JfO2TSVYdIq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5196.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(396003)(366004)(39860400002)(346002)(376002)(451199018)(31686004)(66899018)(41300700001)(66476007)(5660300002)(8676002)(6916009)(4326008)(66556008)(2906002)(86362001)(31696002)(36756003)(38350700002)(38100700002)(52116002)(26005)(6666004)(6486002)(966005)(478600001)(316002)(8936002)(66946007)(83380400001)(6512007)(6506007)(54906003)(2616005)(186003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFlMcS92MWt1MU0xbngySjR6WXZSQVBUcnI2cjFJRkhicTBqc0JGZ3BTMTlr?=
 =?utf-8?B?bUdnU1Rya3VPbzZhQ09OcncwN1hEZmJ1T0Z5dTRJWEZmZXlVODNvanlvOU1D?=
 =?utf-8?B?SXkyUDFkYUkyVzBCN1Y1emRqQkt1ZzVrM0VhK3FVckNWQ2oyU0x0UjNGMnVQ?=
 =?utf-8?B?dEZEVytCdG85c29ISVVHbFpmdTNZWXgwbHF2RGZSOWNRNFJiRGdQZDEyKzVz?=
 =?utf-8?B?aDlxUDY4eUhlTVBUZ1dZYzNoc0grTWRUaWN5bWFLRFVDWEJDK3NNTzM3LzJu?=
 =?utf-8?B?WW0vY0c0WW1HQjZBYm9ENzI3SWpyLzhJL0YvbmlTR2hNUGdBRndJQXV2cUJC?=
 =?utf-8?B?Z25xTDNlZVZTTmtpT1BSdEt3N0xGOWdIcHpnZHZwVmI4WDVuMmJySXFCV2pw?=
 =?utf-8?B?Q3pUK2xmU0dXK2Jaalk5ZTU4WE5HUjlwR2V2Sm42enZtZGpDWnhydHdTbDNP?=
 =?utf-8?B?MnN5eEVtNjFIM2JWTVJYN0h3Yk00OGtDczhXYk1HakkyYTVDekhKMUlkc2cv?=
 =?utf-8?B?anFtSk9VVGkwSzE4VjFxNmkzUG13ZW5KanUvck9TL2I2VEpYenZseEJOdU9I?=
 =?utf-8?B?LzdhQThvL1RLbnQ4Yk85amErWG9mbFpsZlZLTUdOQzh5N0FBMW9McHdjOEpr?=
 =?utf-8?B?NkxEOVFUQ0Rka1I0cjIvVFZnZjh0bVd6cTlZaFZZNE84SUFIM1ZnVnFSZnBl?=
 =?utf-8?B?Yzh5YmVzNmV1emlHNmhJWmRuMTBiSExxYTBtb2MrUHlldWt2LzFSUTZnam1s?=
 =?utf-8?B?OEVEdWIzeHN6eVkrYWFmeGJUWTJQRUlTRm9GbVBwUWZUVUpYVzRMWXpVc0Vx?=
 =?utf-8?B?R2NXTFljUmpWWlp3RDZoZW5ROW5scjZLdTVzQyt0a3J1TUdFRmx6U0tvQUw4?=
 =?utf-8?B?bDMvZnk3R1pqTkx3WFh1UkJHbitoa1k3ZWhYTTZ3QUlxNXpxd3VFdTMweUlW?=
 =?utf-8?B?NFB4NjdQNEZYaURUeDYyY0pkM3hZREk0U1pzU0dOY2tpQUFPT2JmckxzSmxw?=
 =?utf-8?B?Wm10eFB1ZzFtTGEvUVpOQ21xeU85R1cyd2F5T3B2QTZIclBhSmxVVXFJdGxq?=
 =?utf-8?B?bHNIaTZrRG5CTUwrS2VQZ0hZNExrWW9MQS9Kc0hrL0M0TUxRYUtGZHp0UEwx?=
 =?utf-8?B?RCtNUDYxOUdmbGdsdTlubHVyZ3FpNklhbHhqZDFSZU9VZStMZ2g5bWVNSlBp?=
 =?utf-8?B?RWdPbkYwUE5RMXZBRlM4TzV0ZXdoNkpPdytXVGtXL2VNVlhqOFhHVlM1TnYx?=
 =?utf-8?B?dlBtRTkxYlFiOXRyVVJLS3FYQXlTRXM3MWR2Z2piSFltMTQ2Y3lyMEdKYnkz?=
 =?utf-8?B?QjZWK3BDWGUzVDRoRjQ0YjkzVER3S1BKTDJpbzZkaTAvdTdDVWJxeEhlWkMx?=
 =?utf-8?B?ckdSbmp5M1FBbEZhT1EzeDc0dllIR2F5cVR3a3JPU2VXZ1VtMm00eVMwdnRl?=
 =?utf-8?B?WGExSHNQWm9vYm9iZjdmRWZxT05SQjdwOVNoVWdMOXhnOHRralZNbFMrMldR?=
 =?utf-8?B?SHYwTnRQRTd0UTBYaFhNbE1DcDhBT1FWT0Y0OXcvTXUrbzRJWnlocFRJMFpu?=
 =?utf-8?B?bjVvZnIrZ29OTzN2TTdYQ0lKV1lqWEVwU1ZyblpOU2xrSVZHVGpkZ1h5ekNF?=
 =?utf-8?B?Smdaa0d1WnZjQ1lmTG0wY1ZNa1lzS3VsZU5XenMyQjVuOGpxWFJhVitCMVB3?=
 =?utf-8?B?RDRXY2lVbGVZRm56QkVRQk4wa25iSHpsRzYxZlJjb3VUOE1UOFd3TzFWSXdS?=
 =?utf-8?B?R05vK0tTUFc3UitFWHZiRjB3VnJLbFl1OVlJc0V6Tm5ORlI4WXZweGtqcWl4?=
 =?utf-8?B?bkJtVkFpaWNxU3Y4NUZXaTYxdlJjSGE0emdtV0RVVGpheDFyRmVHdElucVUr?=
 =?utf-8?B?ZTBkUVJoaEV5dGNYenJNellFSHdRR0FwZGFmYU9Kclg2eTJ2VDhZemM4LzJh?=
 =?utf-8?B?Qnlta2pSY0F4TFB6YjNwbGRDbmdGVFFVR1RzUjVzQ2hZSEIyK1lnVWVzTFJS?=
 =?utf-8?B?aXVySnMwQkZINVpRdEJWR29ndEpha0dENEpFMUVWLzdvdXlQLzFOZmVaZElZ?=
 =?utf-8?B?ZmR4WXU5Wm5GYzgrM2J0MVl4Q2NzanF2bytMS1JRWElodDZweDRLMGR5MUlt?=
 =?utf-8?Q?BWv/cNcoI921mzI3B0peP7a8W?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4982017-e43f-43b5-d1cb-08db2b9136fc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 11:24:49.6941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OQcSwflxB7AW0HeHwMeprPfzKqyEfutarDTh+qzzuL8a8SK0Z6uwXBH+OPktbBILiDQGeJNFLEPHv59YOQ25RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6523
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 3/23/23 18:05, Hans Verkuil wrote:
> On 03/03/2023 15:44, Hans Verkuil wrote:
>> Hi all,
>>
>> I am planning to organize another Media Summit on June 26th, co-located
>> with the Embedded Open Source Summit in Prague:
>>
>> https://events.linuxfoundation.org/embedded-open-source-summit/
>>
>> I've put in a request for a room with the Linux Foundation and I am waiting
>> for the result of that. For once I was early with my request, so I have good
>> hope we'll get a room. Expect the format to be similar to what we did in
>> Dublin last year.
>>
>> I'm a bit early with this 'Request for Topics' as well, but this allows
>> everyone who plans to be in Prague to take this into account.
>>
>> So if you have a topic that you want to discuss, just reply. It would be
>> very much appreciated if you can also add a guesstimate of the time you
>> need for your topic.
>>
>> Once I have the details of the room and how many people it can hold, then
>> I will send out a second email asking people to register with me if you
>> want to join.
>>
>> Regarding remote participation: only if there is really no other way.
>> Meeting face-to-face once a year is important IMHO, and attending remotely
>> is a poor substitute. That said, if it is really necessary to set something
>> up, then I can do the same I did in Dublin, setting up a Webex meeting.
>> That worked reasonably well, except that I will need to bring a better
>> speaker since I learned that the laptop speaker was pretty bad.
>>
>> So, if you have topics for the meeting, just reply!
>>
>> Regards,
>>
>> 	Hans
> 
> Discuss the "media: v4l2: Add extended fmt and buffer" patch series:
> 
> https://patchwork.linuxtv.org/project/linux-media/cover/20230206043308.28365-1-ayaka@soulik.info/
> 
> We've been postponing the work on this, but I think we need to decide how to
> proceed since pixel formats and single vs multi planar is getting to be a nightmare.
Thank you for promoting this topic.
I may not be able to join there physically, I am sure I would be there 
in virtual.

I would leave my outline here:

1. v4l2 header would only maintain the codec format and pixel format in bus.
2. the pixel formats would be maintained by the DirectRender, those M
variant would not be supported in the new extend pixel format API.
3. The number of plane for a pixel format would also responds for its 
data layout. Ex. NV12 = 2 planes(luma, chroma), I420 = 3 planes(Y, U, V).
4. Userspace that supports new extend API could access those driver 
didn't adapt the new API, kernel would have a backward compatible layer. 
While the opposite backward compatible is not offered(old API userspace 
can't access the driver support the new API).

[optional part]
5. An alloc flag would be introduced for allocating those M variant buf.
https://lore.kernel.org/lkml/20230322105226.122467-1-randy.li@synaptics.com/
6. stateless codec format would be a modifier to the stateful codec 
format. We could support different packing mode here.


I have some other topics for v4l2 which were less important than this 
pain in the ass. I would discuss those in IRC(linux-media or gstreamer), 
which have been sent to the mail list before.
1. separate buf queue for encoder reference bufs or decoder post 
processing bufs.
	DELETE_BUF or extend API
2. timestamp for tracking field or slices input bufs.

I would send the outline of those topics if people think any of them is 
important.
> 
> Regards,
> 
> 	Hans
> 

-- 
Hsia-Jun(Randy) Li
